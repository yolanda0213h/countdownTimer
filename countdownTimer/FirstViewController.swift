//
//  FirstViewController.swift
//  countdownTimer
//
//  Created by Yolanda H. on 2018/12/29.
//  Copyright © 2018 Yolanda H. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var minsLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var newyearLabel: UILabel!
    @IBOutlet weak var nowtimeLabel: UILabel!
    var timeMove: Timer?
    let formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var chineseYear = "戊戌年"
        var chineseMonth = "子月"
        
        formatter.dateFormat = "yyyy年dd日MM月 HH:mm:ss"
        timeMove = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (_) in
            let nowDate = Date()
            let HH = DateFormatter()
            HH.dateFormat = "HH"
            let hourInt = Int(HH.string(from: nowDate))
            let mm = DateFormatter()
            mm.dateFormat = "mm"
            let minsInt = Int(mm.string(from: nowDate))
            var chineseDate = "日"
            var chineseHour = "時"
            var chineseMins = ""
            if minsInt! < 15 , hourInt!%2 != 0 {
                chineseMins = "初"
            }
            else if minsInt! < 30 , hourInt!%2 != 0{
                chineseMins = "初一刻"
            }
            else if minsInt! < 45 , hourInt!%2 != 0{
                chineseMins = "初二刻"
            }
            else if minsInt! < 60 , hourInt!%2 != 0{
                chineseMins = "初三刻"
            }
            else if minsInt! < 15 , hourInt!%2 == 0 {
                chineseMins = "正"
            }
            else if minsInt! < 30 , hourInt!%2 == 0 {
                chineseMins = "正一刻"
            }
            else if minsInt! < 45 , hourInt!%2 == 0 {
                chineseMins = "正二刻"
            }
            else if minsInt! < 60 , hourInt!%2 == 0 {
                chineseMins = "正三刻"
            }
            if hourInt! < 01 {
                chineseHour = "早子"
            }
            else if hourInt! < 03 {
                chineseHour = "丑"
            }
            else if hourInt! < 05 {
                chineseHour = "寅"
            }
            else if hourInt! < 07 {
                chineseHour = "卯"
            }
            else if hourInt! < 09 {
                chineseHour = "辰"
            }
            else if hourInt! < 11 {
                chineseHour = "巳"
            }
            else if hourInt! < 13 {
                chineseHour = "午"
            }
            else if hourInt! < 15 {
                chineseHour = "未"
            }
            else if hourInt! < 17 {
                chineseHour = "申"
            }
            else if hourInt! < 19 {
                chineseHour = "酉"
            }
            else if hourInt! < 21 {
                chineseHour = "戌"
            }
            else if hourInt! < 23 {
                chineseHour = "亥"
            }
            else if hourInt! >= 23 {
                chineseHour = "晚子"
            }
            
            let yearDateComponents = DateComponents(calendar: Calendar.current, year: 2019, month: 02, day: 05, hour: 00, minute: 00, second: 00)
            let yearDate = yearDateComponents.date
            let interval = yearDate!.timeIntervalSince(nowDate)
            
            let sky10 = ["甲","乙","丙","丁","戊","己","庚","辛","壬","癸"]
            let groud12 = ["子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥"]
            let i = Int(interval/86400)%60
            if i < 9 {
                chineseDate = sky10[9-i] + groud12[9-i] + chineseDate
            }
            else{
                let a = 9-(i-9)%10
                let b = 11-(i-9)%12
                chineseDate = sky10[a] + groud12[b] + chineseDate
            }
            if chineseDate == "癸卯日" {
                chineseMonth = "丑月"
            }
            if chineseDate == "癸酉日" {
                chineseMonth = "寅月"
            }
            let chineseTime = chineseYear + "-" + chineseDate + "-" + chineseMonth + " \n" + chineseHour + chineseMins
            self.nowtimeLabel.text = self.formatter.string(from: nowDate) + "\n\n" + chineseTime
            
            self.newyearLabel.text = self.formatter.string(from: yearDate!) + "\n\n己亥年-癸酉日-寅月 早子時正"
            
            self.dayLabel.text = String(Int(interval/86400))
            self.hourLabel.text = String(Int(interval/3600)%24)
            self.minsLabel.text = String(Int(interval/60)%60)
            self.secLabel.text = String(Int(interval)%60)
        })
    }
    override func viewDidDisappear(_ animated: Bool) {
        //timeMove?.invalidate()
    }

}

