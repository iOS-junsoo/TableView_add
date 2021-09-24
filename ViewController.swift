import UIKit
var tray = ""
var space = "       -       "
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let text: String = self.data[indexPath.row]
        cell.textLabel?.text = text
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "[Custom timer]"
    }
    
    @IBOutlet weak var tableView: UITableView!
    let collIdentifier: String = "cell"
    var data: [String] = []
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func touchAddButton(_ sender: UIButton) {
        data.append(String(textField.text! + space + tray))
        self.textField.text = ""
        tray = ""
        
        self.tableView.reloadSections(IndexSet(0...0), with: UITableView.RowAnimation.automatic)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var timePicker: UIDatePicker!
    var timeInt : Int = Int()
    @IBAction func didTimePickerValueChanged(_ sender : UIDatePicker){
           self.timeInt = Int(self.timePicker.countDownDuration) / 60
           
           if timeInt >= 60{
               let hour : Int = timeInt / 60
               let minit : Int = timeInt % 60
               
               if hour < 10 {
                   tray = "\(hour) 시간 \(minit) 분"
                   self.timeLabel.text = "\(hour) 시간 \(minit) 분"
               }else{
                   tray = "\(hour) 시간 \(minit) 분"
                   self.timeLabel.text = "\(hour) 시간 \(minit) 분"
               }
               
               if minit == 0{
                   if hour < 10 {
                       tray = "\(hour) 시간 00 분"
                       self.timeLabel.text = "\(hour) 시간 00 분"
               }else{
                   tray = "\(hour) 시간 00 분"
                   self.timeLabel.text = "\(hour) 시간 00 분"
               }
               }
           }else{
               tray = "\(timeInt) 분"
               self.timeLabel.text = "\(timeInt) 분"
           }
           
       }
    


}
