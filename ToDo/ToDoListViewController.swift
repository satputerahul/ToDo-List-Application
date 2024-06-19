//
//  ToDoListViewController.swift
//  ToDo
//
// 
//

import UIKit

class ToDoListTableViewCell: UITableViewCell {
    
    @IBOutlet var btn_chkbox: UIButton!
    @IBOutlet var lbl_todoList: UILabel!
    @IBOutlet var btn_edit: UIButton!
    @IBOutlet var btn_delete: UIButton!
    
    
    var chkBox: (() -> Void)?
    
    @IBAction func btn_checkBox(_ sender: UIButton) {
        
        chkBox?()
        
    }
    
    var editTask: (() -> Void)?
    
    @IBAction func btn_edit(_ sender: Any) {
        
        editTask?()
        
    }
    
    var deleteTask: (() -> Void)?
    
    @IBAction func btn_delete(_ sender: UIButton) {
        
        deleteTask?()
        
    }
    
}

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var vw_header: UIView!
    @IBOutlet var lbl_todo: UILabel!
    @IBOutlet var vw_task: UIView!
    @IBOutlet var txt_todoList: UITextField!
    @IBOutlet var btn_Add: UIButton!
    @IBOutlet var tv_todoList: UITableView!
    
    var listArr: [String] = []
    var toast = Toast()
    var isChecked = false
   
  //  var checkedStates: [Bool] = []
    
    @IBAction func btn_Add(_ sender: UIButton)  {
        
        guard let newItem = txt_todoList.text, !newItem.isEmpty else {
            
            //Show Toast message when text field is empty
            self.toast.show(message: "Please Enter the text", controller: self)
            return
        }
        
        listArr.append(newItem)
       // checkedStates.append(false)
        tv_todoList.reloadData()
        
        //Clear text field
        txt_todoList.text = ""
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tv_todoList.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoListTableViewCell
        
        cell.lbl_todoList.text = listArr[indexPath.row]
        print("List:", listArr)
        print("Count", listArr.count)
        
//        cell.chkBox = {
//            
//            self.checkedStates[indexPath.row].toggle()
//            let isChecked = self.checkedStates[indexPath.row]
//            let checkboxImage = isChecked ? UIImage(named: "checkbox_blue") : UIImage(named: "checkbox_black")
//            cell.btn_chkbox.setImage(checkboxImage, for: .normal)
//        }
        let image = UIImage(named: "checkbox_black")
        cell.btn_chkbox.setImage(image, for: .normal)
        
        cell.deleteTask = {
            
            self.listArr.remove(at: indexPath.row)
            self.tv_todoList.deleteRows(at: [indexPath], with: .fade)
            
        }
            
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tv_todoList.cellForRow(at: indexPath) as! ToDoListTableViewCell
        //cell.chkBox?()
        let attributeString = NSMutableAttributedString(string: self.listArr[indexPath.row])

       if cell.btn_chkbox.isSelected == false { // when button is not selected
            
           cell.btn_chkbox.isSelected.toggle() // then button is selected
            let image = UIImage(named: "checkbox_blue")
            cell.btn_chkbox.setImage(image, for: .normal)
            //Set Strike Line
            //  let attributeString = NSMutableAttributedString(string: self.listArr[indexPath.row])
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                         value: NSUnderlineStyle.single.rawValue,
                                         range: NSMakeRange(0, attributeString.length)
            )
            cell.lbl_todoList.attributedText = attributeString
           cell.btn_edit.isHidden.toggle() // hide edit button
        
        } else {
            
            cell.btn_chkbox.isSelected.toggle() //button is not selected
            let image = UIImage(named: "checkbox_black")
            cell.btn_chkbox.setImage(image, for: .normal)
            attributeString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
                
                cell.lbl_todoList.attributedText = attributeString
            cell.btn_edit.isHidden.toggle() // Not hide edit button
        }
        
    }
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        let cell = tv_todoList.cellForRow(at: indexPath) as! ToDoListTableViewCell
//        let image = UIImage(named: "checkbox_black")
//        cell.btn_chkbox.setImage(image, for: .normal)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl_todo.text = "To Do List"
        txt_todoList.placeholder = "Enter Task"
        btn_Add.layer.cornerRadius = btn_Add.frame.height / 2
        btn_Add.setTitle("ADD", for: .normal)
        txt_todoList.setPlaceholderColor(UIColor.lightText)
        txt_todoList.layer.borderWidth = 1.0
        txt_todoList.layer.borderColor = UIColor(hexString: "#2A2A2A").cgColor
        txt_todoList.layer.cornerRadius = 5
        
        
        tv_todoList.delegate = self
        tv_todoList.dataSource = self
     
    }
    
}

extension UITextField {
        
    //Set color for placeholder
    func setPlaceholderColor(_ color: UIColor) {
        guard let placeholder = self.placeholder else { return }
        self.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: color]
        )
        
    }
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }}
