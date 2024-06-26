//
//  ViewController.swift
//  HackerNews
//
//  Created by Varshith Chilamkurthi on 25/06/24.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet var articleTableView: UITableView!
    
    var articleViewModelObj = ArticleViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Today's News"
        articleTableView.dataSource = self
        articleTableView.delegate = self
        Task {
            await fetchData()
        }
    }
}
// MARK: - TableView setup
extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleViewModelObj.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as! ArticleTableViewCell
        if let setter = articleViewModelObj.articles[indexPath.row]._highlightResult {
            cell.setData(setter: setter)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let avc = sb.instantiateViewController(identifier: "ArticleViewController") as! ArticleViewController
        if let setterUrl = articleViewModelObj.articles[indexPath.row]._highlightResult?.url?.value {
            avc.url = setterUrl
        }
        navigationController?.pushViewController(avc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
// MARK: - Network call
extension NewsViewController {
    func fetchData() async {
        do {
            try await articleViewModelObj.fetchData()
            articleTableView.reloadData()
        } catch {
            print("error fetching data")
        }
    }
}

