//
//  ViewController.swift
//  mind electric
//
//  Created by M. Andrian Maulana on 04/05/21.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var currentEnergyView: UIView!
    @IBOutlet weak var estimatedEnergyView: UIView!
    @IBOutlet weak var powerView: UIView!
    @IBOutlet weak var currentView: UIView!
    @IBOutlet weak var powerfactorView: UIView!
    @IBOutlet weak var settingsButton: UIButton!
    @IBOutlet weak var historyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let url = "https://guarded-shore-21924.herokuapp.com/current-energy"
        let data = getData(from: url)
        
        data.result.
        
        roundedView(view: currentEnergyView)
        roundedView(view: estimatedEnergyView)
        roundedView(view: powerView)
        roundedView(view: currentView)
        roundedView(view: powerfactorView)
        
        self.title = "mind electric"
        
        let nav = self.navigationController?.navigationBar
        nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(named: "Deep Blue")!]
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSettings" {
//            let selectedIndex = suggestionSummary.indexPath(for: sender as! UICollectionViewCell)
            let destVC = segue.destination as? SettingsViewController
            
            // todo: and again bug in indexing selected item
        }
    }
    
    private func getData(from url: String) -> <#Return Type#> {
        print("masuk get data")
        var dataReceived: NSData?
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
            
            guard let data = data, error == nil else {
                print("connection error")
                return
            }
            
            var result: Response?
            do {
                result = try JSONDecoder().decode(Response.self, from: data)
            } catch {
                print("Failed to convert \(error.localizedDescription)")
                
            }
            
            guard let json = result else {
                return
            }
            
            dataReceived = json
        })
        task.resume()
        
        
        dispatch_semaphore_wait(sem, dispatch_time_t(DISPATCH_TIME_FOREVER))
        return dataReceived
    
}

struct Response: Codable {
    let result: MyResult
    let status: String
}

struct MyResult: Codable {
    let id: String
    let created_at: String
    let energy: Float
    let power: Float
    let current: Float
    let voltage: Float
    let powerfactor: Float
    let frequency: Float
        
}

func roundedView(view: UIView)  {
    view.layer.cornerRadius = 12
}



//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("you tapped me")
//    }
//}
//
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//}


