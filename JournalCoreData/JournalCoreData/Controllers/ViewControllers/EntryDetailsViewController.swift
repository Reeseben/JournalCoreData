//
//  EntryDetailsViewController.swift
//  JournalCoreData
//
//  Created by Ben Erekson on 7/26/21.
//

import UIKit

class EntryDetailsViewController: UIViewController {

    //MARK: - IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextView: UITextView!
    
    //MARK: - Properties
    var entry: Entry?
    
    //MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty else { return }
        
        if let entry = entry {
            EntryController.shared.updateEntry(entry: entry, title: title, body: bodyTextView.text)
        } else {
            EntryController.shared.createEntry(title: title, body: bodyTextView.text)
        }
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helper Methods
    func updateViews(){
        guard let entry = entry else { return }
        navigationController?.title = entry.title
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
    
}
