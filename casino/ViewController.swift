//
//  ViewController.swift
//  casino
//
//  Created by 金森幹斗 on 2015/03/25.
//  Copyright (c) 2015年 Mikito Kanamori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var myLabel:UILabel!
    @IBOutlet var dealersLabel:UILabel!
    @IBOutlet var resultLabel:UILabel!
    
    @IBOutlet var mokkaiButon:UIButton!
    
    @IBOutlet var myHistory1:UIImageView!
    @IBOutlet var myHistory2:UIImageView!
    @IBOutlet var myHistory3:UIImageView!
    @IBOutlet var myHistory4:UIImageView!
    @IBOutlet var myHistory5:UIImageView!
    
    var myNumCount:Int = 2

    @IBOutlet var dealersHistory1:UIImageView!
    @IBOutlet var dealersHistory2:UIImageView!
    @IBOutlet var dealersHistory3:UIImageView!
    @IBOutlet var dealersHistory4:UIImageView!
    @IBOutlet var dealersHistory5:UIImageView!
    
    var dealersNumCount:Int = 1
    
    var myHitNum:Int = 0
    var myTotalNum:Int = 0
    
    var dealersHitNum:Int = 0
    var dealersTotalNum:Int = 0
    
    var standDone:Bool = false

    var timer : NSTimer!
    
    var betable:Bool = true
    
    var myMoney:Int = (Int(arc4random() % UInt32(20)) + 20) * 10
    var bettingMoney:Int = 0
    
    @IBOutlet var myMoneyLabel:UILabel!
    @IBOutlet var bettingMoneyLabel:UILabel!
    
    @IBOutlet var betPlus:UIButton!
    @IBOutlet var betMinus:UIButton!
    @IBOutlet var done:UIButton!
    @IBOutlet var hit:UIButton!
    @IBOutlet var stand:UIButton!
    @IBOutlet var doubleDown:UIButton!
    @IBOutlet var zenkake:UIButton!
    
    var betDone:Bool = false
    
    var AceElevenPlayer:Bool = false
    var AceElevenDealer:Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = nil
        
        mokkaiButon.hidden = true
        
        myMoneyLabel.text = String("所持金:\(myMoney)M")
        
        bettingMoneyLabel.text = String("\(bettingMoney)M")
        
        [self .cardsDefault()]
        
        hit.hidden = true
        stand.hidden = true
        doubleDown.hidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapHit(){
        
        if standDone == false && betDone == true{
            
            betable = false
            
            myHitNum = Int(arc4random() % UInt32(13)) + 1
            
            //var n:Int = myHitNum
            
            if myHitNum == 1{
                
                if myTotalNum <= 10{
                    
                    myTotalNum += 11
                    
                    AceElevenPlayer = true
                    
                }else{
                    
                    myTotalNum += 1
                    
                }
                
            }else if myHitNum <= 9{
                
                myTotalNum += myHitNum
                
            }else{
                
                myTotalNum += 10
                
            }
            
            myLabel.text = String(myTotalNum)
            
            
            if myTotalNum > 21{
                
                if AceElevenPlayer == true{
                    
                    myTotalNum -= 10
                    
                    myLabel.text = String(myTotalNum)
                    
                    AceElevenPlayer = false
                    
                }else{
                    
                    resultLabel.text = String("まけ")
                
                    myMoney -= bettingMoney
                    
                    if myMoney < 0{
                        
                        bettingMoney += myMoney
                        
                        myMoney = 0
                        
                        bettingMoneyLabel.text = String("\(bettingMoney)M")
                        
                    }
                    
                    myMoneyLabel.text = String("所持金:\(myMoney)M")
                
                    standDone = true
                
                    mokkaiButon.hidden = false
        
                }
                
                            }
            
            switch myNumCount{
                
            case 2:
                
                switch Int(arc4random() % UInt32(4)){
                    
                case 0:
                    
                    myHistory3.image = UIImage(named: "c\(myHitNum).png")
                    
                case 1:
                    
                    myHistory3.image = UIImage(named: "d\(myHitNum).png")
                    
                case 2:
                    
                    myHistory3.image = UIImage(named: "h\(myHitNum).png")
                    
                case 3:
                    
                    myHistory3.image = UIImage(named: "s\(myHitNum).png")
                    
                default:
                    
                    break
                    
                }
                
            case 3:
                
                switch Int(arc4random() % UInt32(4)){
                    
                case 0:
                    
                    myHistory4.image = UIImage(named: "c\(myHitNum).png")
                    
                case 1:
                    
                    myHistory4.image = UIImage(named: "d\(myHitNum).png")
                    
                case 2:
                    
                    myHistory4.image = UIImage(named: "h\(myHitNum).png")
                    
                case 3:
                    
                    myHistory4.image = UIImage(named: "s\(myHitNum).png")
                    
                default:
                    
                    break
                    
                }
                
            case 4:
                
                switch Int(arc4random() % UInt32(4)){
                    
                case 0:
                    
                    myHistory5.image = UIImage(named: "c\(myHitNum).png")
                    
                case 1:
                    
                    myHistory5.image = UIImage(named: "d\(myHitNum).png")
                    
                case 2:
                    
                    myHistory5.image = UIImage(named: "h\(myHitNum).png")
                    
                case 3:
                    
                    myHistory5.image = UIImage(named: "s\(myHitNum).png")
                    
                default:
                    
                    break
                    
                }
                
            default:
                
                break
                
            }
            
            myNumCount++
            
        }

    }
    @IBAction func tapStand(){
        
        betable = false
        
        if standDone == false && betDone == true{
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,selector: "countDealer:", userInfo: nil, repeats: true)
            
        }
        
        standDone = true
        
    }
    func countDealer(timer : NSTimer){
        
        if dealersTotalNum < 17{
            
            dealersHitNum = Int(arc4random() % UInt32(13)) + 1
            
            //var n:Int = 0
            
            if dealersHitNum == 1{
                
                if dealersTotalNum <= 10{
                    
                    dealersTotalNum += 11
                    
                    AceElevenDealer = true
                    
                }else{
                    
                    dealersTotalNum += 1
                    
                }
                
            }else if dealersHitNum <= 10{
                
                dealersTotalNum += dealersHitNum
                
            }else{
                
                dealersTotalNum += 10
                
            }
            
            if dealersTotalNum > 21 && AceElevenDealer == true{
                
                dealersTotalNum -= 10
                
                AceElevenDealer = false
                
            }
            
            dealersLabel.text = String(dealersTotalNum)
            
            switch dealersNumCount {
                
            case 1:
                
                switch Int(arc4random() % UInt32(4)){
                    
                case 0:
                    
                    dealersHistory2.image = UIImage(named: "c\(dealersHitNum).png")
                    
                case 1:
                    
                    dealersHistory2.image = UIImage(named: "d\(dealersHitNum).png")
                    
                case 2:
                    
                    dealersHistory2.image = UIImage(named: "h\(dealersHitNum).png")
                    
                case 3:
                    
                    dealersHistory2.image = UIImage(named: "s\(dealersHitNum).png")
                    
                default:
                    
                    break
                    
                }
                
            case 2:
                
                switch Int(arc4random() % UInt32(4)){
                    
                case 0:
                    
                    dealersHistory3.image = UIImage(named: "c\(dealersHitNum).png")
                    
                case 1:
                    
                    dealersHistory3.image = UIImage(named: "d\(dealersHitNum).png")
                    
                case 2:
                    
                    dealersHistory3.image = UIImage(named: "h\(dealersHitNum).png")
                    
                case 3:
                    
                    dealersHistory3.image = UIImage(named: "s\(dealersHitNum).png")
                    
                default:
                    
                    break
                    
                }
            case 3:
                
                switch Int(arc4random() % UInt32(4)){
                    
                case 0:
                    
                    dealersHistory4.image = UIImage(named: "c\(dealersHitNum).png")
                    
                case 1:
                    
                    dealersHistory4.image = UIImage(named: "d\(dealersHitNum).png")
                    
                case 2:
                    
                    dealersHistory4.image = UIImage(named: "h\(dealersHitNum).png")
                    
                case 3:
                    
                    dealersHistory4.image = UIImage(named: "s\(dealersHitNum).png")
                    
                default:
                    
                    break
                    
                }
            case 4:
                
                switch Int(arc4random() % UInt32(4)){
                    
                case 0:
                    
                    dealersHistory5.image = UIImage(named: "c\(dealersHitNum).png")
                    
                case 1:
                    
                    dealersHistory5.image = UIImage(named: "d\(dealersHitNum).png")
                    
                case 2:
                    
                    dealersHistory5.image = UIImage(named: "h\(dealersHitNum).png")
                    
                case 3:
                    
                    dealersHistory5.image = UIImage(named: "s\(dealersHitNum).png")
                    
                default:
                    
                    break
                    
                }
                
            default:
                
                break
                
            }

            
            dealersNumCount++
            
            
            
            
        }else{
            
            timer.invalidate()
            
            if dealersTotalNum > 21{
                
                resultLabel.text = String("かち")
                
                myMoney += bettingMoney
                
                myMoneyLabel.text = String("所持金:\(myMoney)M")
                
            }else if 21 - dealersTotalNum < 21 - myTotalNum{
                
                resultLabel.text = String("まけ")
                
                myMoney -= bettingMoney
                
                if myMoney < 0{
                    
                    bettingMoney += myMoney
                    
                    myMoney = 0
                    
                    bettingMoneyLabel.text = String("\(bettingMoney)M")
                    
                }
                
                myMoneyLabel.text = String("所持金:\(myMoney)M")
                
            }else if 21 - dealersTotalNum > 21 - myTotalNum{
                
                resultLabel.text = String("かち")
                
                myMoney += bettingMoney
                
                myMoneyLabel.text = String("所持金:\(myMoney)M")
                
            }else{
                
                resultLabel.text = String("ひきわけ")
                
            }
            
            mokkaiButon.hidden = false
            
        }
        
    }
    @IBAction func tapDoubleDown(){

        if standDone == false && betDone == true{
            
            if myNumCount == 2{
                
                betable = false
            
            myHitNum = Int(arc4random() % UInt32(13)) + 1
                
                NSLog("\(myHitNum)")
            
            if myHitNum == 1{
                
                if myTotalNum <= 10{
                    
                    myTotalNum += 11
                    
                }else{
                    
                    myTotalNum += 1
                    
                }
                
            }else if myHitNum <= 10{
                
                myTotalNum += myHitNum
                
            }else{
                
                myTotalNum += 10
                
            }
            
            myLabel.text = String(myTotalNum)
            
            switch Int(arc4random() % UInt32(4)){
                
            case 0:
                
                myHistory3.image = UIImage(named: "c\(myHitNum).png")
                
            case 1:
                
                myHistory3.image = UIImage(named: "d\(myHitNum).png")
                
            case 2:
                
                myHistory3.image = UIImage(named: "h\(myHitNum).png")
                
            case 3:
                
                myHistory3.image = UIImage(named: "s\(myHitNum).png")
                
            default:
                
                break
                
            }
            
            standDone = true
            
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0,target: self,selector: "countDealer:", userInfo: nil, repeats: true)
            
            myMoney -= bettingMoney
            myMoneyLabel.text = String("所持金:\(myMoney)M")
            
            bettingMoney *= 2
            bettingMoneyLabel.text = String("\(bettingMoney)M")
            
            if myMoney < 0{
                
                bettingMoney += myMoney
                bettingMoneyLabel.text = String("\(bettingMoney)M")
                
                myMoney = 0
                myMoneyLabel.text = String("所持金:\(myMoney)M")
                
                
                
            }
            
            
                
            }else{
                
                var alert = UIAlertView()
                alert.title = "エラー"
                alert.message = "ダブルダウンは1枚目の時のみ可能です"
                alert.addButtonWithTitle("はい")
                alert.show()
                
            }
            
            if myTotalNum > 21{
                    
                    if AceElevenPlayer == true{
                        
                        myTotalNum -= 10
                        
                        myLabel.text = String(myTotalNum)
                        
                        AceElevenPlayer = false
                        
                    }else{

                        resultLabel.text = String("まけ")
                        
                        myMoney -= bettingMoney
                        
                        if myMoney < 0{
                            
                            bettingMoney += myMoney
                            
                            myMoney = 0
                            
                            bettingMoneyLabel.text = String("\(bettingMoney)M")
                            
                        }
                        
                        myMoneyLabel.text = String("所持金:\(myMoney)M")
                        
                        standDone = true
                        
                        mokkaiButon.hidden = false
                        
                        timer.invalidate()
                        
                        NSLog("hoge")
                        
                    }
                    
                }
        }

    }

    @IBAction func tapMokkai(){
        
        betable = true
        
        myHitNum = 0
        
        dealersHitNum = 0

        standDone = false
        
        
        
        dealersNumCount = 1
        
        resultLabel.text = nil
        
        mokkaiButon.hidden = true
        
        betDone = false
        
        betPlus.hidden = false
        betMinus.hidden = false
        done.hidden = false
        zenkake.hidden = false
        
        hit.hidden = true
        stand.hidden = true
        doubleDown.hidden = true
        
        AceElevenPlayer = false
        AceElevenDealer = false
        
        [self .cardsDefault()]
        
    }
    
    @IBAction func tapBet(){
        
        if betable == true && myMoney >= 5{
            
            bettingMoney += 5
            
            bettingMoneyLabel.text = String("\(bettingMoney)M")

            myMoney -= 5
            
            myMoneyLabel.text = String("所持金:\(myMoney)M")
            
        }
        
    }
    @IBAction func tapZenkake(){
        
        if betable == true{
            
            bettingMoney += myMoney
            
            bettingMoneyLabel.text = String("\(bettingMoney)M")
            
            myMoney = 0
            
            myMoneyLabel.text = String("所持金:\(myMoney)M")
            
        }
        
    }
    @IBAction func tapBetMinus(){
        
        if betable == true && bettingMoney >= 5{
            
            bettingMoney -= 5
            
            bettingMoneyLabel.text = String("\(bettingMoney)M")
            
            myMoney += 5
            
            myMoneyLabel.text = String("所持金:\(myMoney)M")
            
        }
        
    }
    @IBAction func doneBet(){
        
        if bettingMoney > 0{
            
            betDone = true
            betPlus.hidden = true
            betMinus.hidden = true
            done.hidden = true
            zenkake.hidden = true
            
            hit.hidden = false
            stand.hidden = false
            doubleDown.hidden = false
            
            [self .dealerDefault()]
            [self .playerDefault()]
            
        }else{
            
            var alert = UIAlertView()
            alert.title = "エラー"
            alert.message = "お金を賭けてください"
            alert.addButtonWithTitle("はい")
            alert.show()
            
        }
        
    }
    
    func dealerDefault(){
        
        dealersTotalNum = Int(arc4random() % UInt32(13)) + 1
        
        if dealersTotalNum == 1{
            
            switch Int(arc4random() % UInt32(4)){
                
            case 0:
                
                dealersHistory1.image = UIImage(named: "c1.png")
                
            case 1:
                
                dealersHistory1.image = UIImage(named: "d1.png")
                
            case 2:
                
                dealersHistory1.image = UIImage(named: "h1.png")
                
            case 3:
                
                dealersHistory1.image = UIImage(named: "s1.png")
                
            default:
                
                break
                
            }
            
            AceElevenDealer = true
            
        }else{
            
            switch Int(arc4random() % UInt32(4)){
                
            case 0:
                
                dealersHistory1.image = UIImage(named: "c\(dealersTotalNum).png")
                
            case 1:
                
                dealersHistory1.image = UIImage(named: "d\(dealersTotalNum).png")
                
            case 2:
                
                dealersHistory1.image = UIImage(named: "h\(dealersTotalNum).png")
                
            case 3:
                
                dealersHistory1.image = UIImage(named: "s\(dealersTotalNum).png")
                
            default:
                
                break
                
            }
            
        }
        if dealersTotalNum == 1{
            
            dealersTotalNum = 11
            
        }else
            
            if dealersTotalNum >= 10 {
            
            dealersTotalNum = 10
            
        }
        
        dealersLabel.text = String(dealersTotalNum)
        
        dealersHistory2.image = nil
        dealersHistory3.image = nil
        dealersHistory4.image = nil
        dealersHistory5.image = nil
        
        dealersHistory2.image = UIImage(named: "z02.png")
        
    }
    func playerDefault(){
        
        var n1:Int = Int(arc4random() % UInt32(13))
        var a1:Int = 0
        
        if n1 == 0{
            
            a1 = 11
            
            switch Int(arc4random() % UInt32(4)){
                
            case 0:
                
                myHistory1.image = UIImage(named: "c1.png")
                
            case 1:
                
                myHistory1.image = UIImage(named: "d1.png")
                
            case 2:
                
                myHistory1.image = UIImage(named: "h1.png")
                
            case 3:
                
                myHistory1.image = UIImage(named: "s1.png")
                
            default:
                
                break
                
            }
            
            AceElevenPlayer = true
            
        }else if n1 <= 9{
            
            a1 = n1+1
            
            switch Int(arc4random() % UInt32(4)){
                
            case 0:
                
                myHistory1.image = UIImage(named: "c\(a1).png")
                
            case 1:
                
                myHistory1.image = UIImage(named: "d\(a1).png")
                
            case 2:
                
                myHistory1.image = UIImage(named: "h\(a1).png")
                
            case 3:
                
                myHistory1.image = UIImage(named: "s\(a1).png")
                
            default:
                
                break
                
            }
            
        }else{
            
            switch Int(arc4random() % UInt32(4)){
                
            case 0:
                
                myHistory1.image = UIImage(named: "c\(n1 + 1).png")
                
            case 1:
                
                myHistory1.image = UIImage(named: "d\(n1 + 1).png")
                
            case 2:
                
                myHistory1.image = UIImage(named: "h\(n1 + 1).png")
                
            case 3:
                
                myHistory1.image = UIImage(named: "s\(n1 + 1).png")
                
            default:
                
                break
                
            }
            
            a1 = 10
        }
        var n2:Int = Int(arc4random() % UInt32(13))
        var a2:Int = 0
        
        if n2 == 0{
            
            if a1 == 11{
                
                a2 = 1
                
            }else{
                
                a2 = 11
                
            }
            
            switch Int(arc4random() % UInt32(4)){
                
            case 0:
                
                myHistory2.image = UIImage(named: "c1.png")
                
            case 1:
                
                myHistory2.image = UIImage(named: "d1.png")
                
            case 2:
                
                myHistory2.image = UIImage(named: "h1.png")
                
            case 3:
                
                myHistory2.image = UIImage(named: "s1.png")
                
            default:
                
                break
                
            }
            
            AceElevenPlayer = true
            
        }else if n2 <= 9{
            
            a2 = n2+1
            
            switch Int(arc4random() % UInt32(4)){
                
            case 0:
                
                myHistory2.image = UIImage(named: "c\(a2).png")
                
            case 1:
                
                myHistory2.image = UIImage(named: "d\(a2).png")
                
            case 2:
                
                myHistory2.image = UIImage(named: "h\(a2).png")
                
            case 3:
                
                myHistory2.image = UIImage(named: "s\(a2).png")
                
            default:
                
                break
                
            }
            
        }else{
            
            switch Int(arc4random() % UInt32(4)){
                
            case 0:
                
                myHistory2.image = UIImage(named: "c\(n2 + 1).png")
                
            case 1:
                
                myHistory2.image = UIImage(named: "d\(n2 + 1).png")
                
            case 2:
                
                myHistory2.image = UIImage(named: "h\(n2 + 1).png")
                
            case 3:
                
                myHistory2.image = UIImage(named: "s\(n2 + 1).png")
                
            default:
                
                break
                
            }
            
            a2 = 10
            
        }
        
        myTotalNum = a1 + a2
        
        myLabel.text = String(myTotalNum)
        
        if myTotalNum == 21{
            
            resultLabel.text = "ブラックジャック!!"
            
            myMoney += bettingMoney * 3/2
            
            myMoneyLabel.text = String("所持金:\(myMoney)M")
            
            standDone = true
            
            mokkaiButon.hidden = false

            
        }
        
        myHistory3.image = nil
        myHistory4.image = nil
        myHistory5.image = nil
        
        myNumCount = 2
        
    }
    func cardsDefault(){
        
        myHistory1.image = nil
        myHistory2.image = nil
        myHistory3.image = nil
        myHistory4.image = nil
        myHistory5.image = nil
        
        dealersHistory1.image = nil
        dealersHistory2.image = nil
        dealersHistory3.image = nil
        dealersHistory4.image = nil
        dealersHistory5.image = nil
        
        dealersLabel.text = String("?")
        
        myLabel.text = String("?")

        if myMoney <= 0 && bettingMoney <= 0{
            
            var alert = UIAlertView()
            alert.title = "破産"
            alert.message = "残念でした！！！"
            alert.addButtonWithTitle("RESPAWN")
            alert.show()
            
            myMoney = (Int(arc4random() % UInt32(10)) + 10) * 10
            
            myMoneyLabel.text = String("所持金\(myMoney)M")
            
        }
        
    }

}

