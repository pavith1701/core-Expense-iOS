//
//  CashViewController.swift
//  CoreExpense
//
//  Created by Pavithran P K on 22/10/24.
//

import UIKit

class CashViewController: UIViewController {

    @IBOutlet weak var cashDtlsTblView: UITableView!
    
    let cashFetchContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var cashList: [ExpenseEntity]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.cashDtlsTblView.register(UINib(nibName: "CashTableViewCell", bundle: nil), forCellReuseIdentifier: "CashTableViewCell")
        fetchCoreReq()
    }
    func fetchCoreReq() {
        do {
            self.cashList = try cashFetchContext.fetch(ExpenseEntity.fetchRequest())
            
            DispatchQueue.main.async {
                self.cashDtlsTblView.reloadData()
            }
        } catch {
            
        }
        
    }
    
    @IBAction func addNewBtn(_ sender: UIButton) {
        let cashPopVc = cashPopupViewController()
        cashPopVc.delegate = self
//        cashPopVc.modalTransitionStyle = .crossDissolve
//        cashPopVc.modalPresentationStyle = .overFullScreen
        self.navigationController?.presentationController?.presentedViewController.present(cashPopVc, animated: true)
    }
    


}

extension CashViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cashList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CashTableViewCell", for: indexPath) as! CashTableViewCell
        cell.dtlsLabel.text = cashList?[indexPath.row].name
        let cashAmount = Double(cashList?[indexPath.row].amount ?? 0.0)
        cell.amountLabel.text = String(cashAmount)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let removeCoreVal = self.cashList![indexPath.row]
        
        self.cashFetchContext.delete(removeCoreVal)
        do {
            try self.cashFetchContext.save()
        }
        catch {
            
        }
        self.fetchCoreReq()
    }
}
extension CashViewController: cashPopupViewControllerprotocol {
    func fetchdata() {
        do {
            self.cashList = try cashFetchContext.fetch(ExpenseEntity.fetchRequest())
            
            DispatchQueue.main.async {
                self.cashDtlsTblView.reloadData()
            }
        } catch {
            
        }
    }
    
    
}
