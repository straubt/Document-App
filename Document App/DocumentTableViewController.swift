//
//  TableViewController.swift
//  Document App
//
//  Created by Titouan STRAUB on 1/17/24.
//

import UIKit
import QuickLook

func listFileInBundle() -> [DocumentFile] {
        
//        let fm = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
//        let path = documentsDirectory.appendingPathComponent(url.lastPathComponent)
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        var documentListBundle = [DocumentFile]()
    
        for item in items {
            if !item.hasSuffix("DS_Store") && item.hasSuffix(".jpg") {
                let currentUrl = URL(fileURLWithPath: path + "/" + item)
                let resourcesValues = try! currentUrl.resourceValues(forKeys: [.contentTypeKey, .nameKey, .fileSizeKey])
                   
                documentListBundle.append(DocumentFile(
                    title: resourcesValues.name!,
                    size: resourcesValues.fileSize ?? 0,
                    imageName: item,
                    url: currentUrl,
                    type: resourcesValues.contentType!.description)
                )
            }
        }
        return documentListBundle
}

class DocumentTableViewController: UITableViewController, QLPreviewControllerDataSource, UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        dismiss(animated: true)
        guard url.startAccessingSecurityScopedResource() else {
                return
            }

            defer {
                url.stopAccessingSecurityScopedResource()
            }
        self.copyFileToDocumentsDirectory(fromUrl: url)
        self.Documents = listFileInBundle()
        self.tableView.reloadData()
    }
    
    func copyFileToDocumentsDirectory(fromUrl url: URL) {
            // On récupère le dossier de l'application, dossier où nous avons le droit d'écrire nos fichiers
            let documentsDirectory = FileMana	ger.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            
            // Nous créons une URL de destination pour le fichier
            let destinationUrl = documentsDirectory.appendingPathComponent(url.lastPathComponent)
            
            do {
                // Puis nous copions le fichier depuis l'URL source vers l'URL de destination
                try FileManager.default.copyItem(at: url, to: destinationUrl)
            } catch {
                print(error)
            }
    }
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        if let item = self.selectedItem{
            return item as QLPreviewItem
        }
        else{
            fatalError()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addDocument))
    }
    var Documents = listFileInBundle()
    // MARK: - Table view data source
    var selectedItem: URL?
    static var toyCellIdentifier = "DocumentCell"

    @objc func addDocument(){
        let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: [.jpeg, .png])
        documentPicker.delegate = self
        documentPicker.modalPresentationStyle = .overFullScreen
        //documentPicker.allowsMultipleSelection = true

        present(documentPicker, animated: true)

    }
    // Indique au Controller combien de sections il doit afficher
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Indique au Controller combien de cellules il doit afficher
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Documents.count
    }
    
    // Indique au Controller comment remplir la cellule avec les données
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        // Reuse or create a cell.
        let cell = tableView.dequeueReusableCell(withIdentifier: DocumentTableViewController.toyCellIdentifier, for: indexPath)
        let document = Documents[indexPath.row]
        cell.textLabel?.text = document.title
        cell.detailTextLabel?.text = document.size.formattedSize()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let file = Documents[indexPath.row]
            // A vous de coder cette fonction
            self.instantiateQLPreviewController(withUrl: file.url)
    }
    
    func instantiateQLPreviewController(withUrl url: URL){
        self.selectedItem = url
        let previewController = QLPreviewController()
        previewController.dataSource = self
        present(previewController, animated: true)
    }
    
    
}


extension Int {
    func formattedSize() -> String {
        let byteCountFormatter = ByteCountFormatter()
        byteCountFormatter.allowedUnits = [.useKB, .useMB, .useGB]
        byteCountFormatter.countStyle = .file

        return byteCountFormatter.string(fromByteCount: Int64(self))
    }
}

struct DocumentFile {
    var title: String
    var size: Int
    var imageName: String? = nil
    var url: URL
    var type: String
    static let data: [DocumentFile] = [DocumentFile(title: "Document 1", size: 100, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
                                       DocumentFile(title: "Document 2", size: 200, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
                                       DocumentFile(title: "Document 3", size: 300, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
                                       DocumentFile(title: "Document 4", size: 400, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
                                       DocumentFile(title: "Document 5", size: 500, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
                                       DocumentFile(title: "Document 6", size: 600, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
                                       DocumentFile(title: "Document 7", size: 700, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
                                       DocumentFile(title: "Document 8", size: 800, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
                                       DocumentFile(title: "Document 9", size: 900, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain"),
                                       DocumentFile(title: "Document 10", size: 1000, imageName: nil, url: URL(string: "https://www.apple.com")!, type: "text/plain")]
}
