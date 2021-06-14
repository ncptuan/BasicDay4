//
//  ViewController.swift
//  BasicDay4
//
//  Created by Mac on 08/06/2021.
//

import UIKit


class ViewController: UITableViewController {

    @IBOutlet weak var time24hSwitch: UISwitch!
    @IBOutlet weak var setAutoSwitch: UISwitch!
    @IBOutlet weak var timeZoneLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var displayTimeRow: UITableViewCell!
    @IBOutlet weak var displayOLockRow: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateDateTimeLabel(date: Date());
    }
    
    @IBAction func setDayAutomatically(_ sender: UISwitch) {
        if sender.isOn {
            timeZoneLabel.text = "Hanoi"
            displayTimeRow.isHidden = true;
            displayOLockRow.isHidden = true;
        }else{
            displayTimeRow.isHidden = !displayTimeRow.isHidden;
            let imageAttachment = NSTextAttachment()
            imageAttachment.image = UIImage(named:"right-arrow")
            let imageOffsetY: CGFloat = 0
            imageAttachment.bounds = CGRect(x: 3, y: imageOffsetY, width:10, height:10)
            let attachmentString = NSAttributedString(attachment: imageAttachment)
            let completeText = NSMutableAttributedString(string: "Hanoi")
            completeText.append(attachmentString)
            let textAfterIcon = NSAttributedString(string: "")
            completeText.append(textAfterIcon)
            self.timeZoneLabel.textAlignment = .center
            self.timeZoneLabel.attributedText = completeText
        }
    }
    
    @IBAction func switchBetween12And24(_ sender: Any) {
        let formatter = DateFormatter()
        if time24hSwitch.isOn {
            formatter.dateFormat = "HH:mm"
        } else {
            formatter.dateFormat = "hh:mm"
        }
        timeLabel.text = formatter.string(from: datePicker.date);
    }
    
    @IBAction func changeDatePackerValue(_ sender: Any) {
        updateDateTimeLabel(date: datePicker.date)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 2 {
            displayOLockRow.isHidden = !displayOLockRow.isHidden
        }
    }
    
    private func updateDateTimeLabel(date: Date) {
        let formatter = DateFormatter()
        
        formatter.dateFormat = "MMMM dd, YYYY"
        dateLabel.text = formatter.string(from: date)
        
        if time24hSwitch.isOn {
            formatter.dateFormat = "HH:mm"
        } else {
            formatter.dateFormat = "hh:mm"
        }
        timeLabel.text = formatter.string(from: date)
    }
}

