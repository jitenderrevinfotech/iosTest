//
//  ViewController.swift
//  TestAPP
//
//  Created by akash.jaiswal on 07/11/19.
//  Copyright © 2019 akash.jaiswal. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper

class ViewController: UIViewController {
    
// IB Outlates
    @IBOutlet weak var tblDataList:UITableView!
    fileprivate var pageNumber = 1
    fileprivate var arrHits = [Hits]()
    

}
//MARK: - View hirarchy

extension ViewController{
    
    override func viewDidLoad() {
        
           super.viewDidLoad()
           self.CallWebserviceForGetListWith(pageNumber: pageNumber)
    
        self.tblDataList.estimatedRowHeight = 60
        self.tblDataList.rowHeight = UITableView.automaticDimension
           // Do any additional setup after loading the view.
       }
}

//MARK: - UI Update methods
fileprivate extension ViewController{
    
    func setNavigation(items:Int){
        self.navigationItem.title = "Displayed data : \(items)"
    }
    
    func showAlertWithMessage(title:String,message:String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let action1 = UIAlertAction.init(title: "Ok", style: .default) { action in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(action1)
        self.present(alert, animated: true, completion: nil)
    }
    
}

//MARK: - Webservices

fileprivate extension ViewController{
    
    func CallWebserviceForGetListWith(pageNumber:Int){
        let strURL = "https://hn.algolia.com/api/v1/search_by_date?tags=story&page=\(pageNumber)"

        Alamofire.request(strURL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            switch response.result{
                
            case .success:
                
                    let convertedString = String(data: response.data!, encoding: String.Encoding.utf8) // convert data To string
                    let responseModel = Mapper<HitsData>().map(JSONString: convertedString!)
                    if responseModel != nil{
                        if self.arrHits.count == 0{
                            self.arrHits = (responseModel?.hits)!
                        }else{
                            self.arrHits.append(contentsOf: (responseModel?.hits)!)
                        }
                        self.tblDataList.reloadData()
                    }else{
                        
                        if self.arrHits.count == 0{
                            self.showAlertWithMessage(title: "No data", message: "No results found")
                        }
                    }
                   
                
            case .failure:
                let msg = response.error?.localizedDescription ?? "Something went wrong"
                self.showAlertWithMessage(title: "Error", message: msg)
            }
            
        }
        
    }
    
}

//MARK: - UI tableview delegate and data source

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return arrHits.count
    }

    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        if let cell = tableView.dequeueReusableCell(withIdentifier: "DataListTableCell") as? DataListTableCell{
            let hits = self.arrHits[indexPath.row]
            cell.setData(hits:hits)
            return cell
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if  indexPath.row == self.arrHits.count - 3{
            self.pageNumber = pageNumber + 1
            self.CallWebserviceForGetListWith(pageNumber: pageNumber)
        }
        
        let visibleCell = tableView.indexPathsForVisibleRows?.count
        self.setNavigation(items: visibleCell ?? 0)
    }
    
}
