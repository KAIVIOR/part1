//
//  class.swift
//  part1
//
//  Created by 吳庭愷 on 2021/5/10.
//

import Foundation

class PageObject: ObservableObject{
   
    //@Published var turn: Int = 0
    @Published var setting = false
    @Published var register_page = false
    @Published var dull_page = false

}
class UserPic: ObservableObject{
   
    @Published var eyes = 0
    @Published var bow = 0
    @Published var mon = 0
    @Published var pre = 0
    @Published var pro = 0
    @Published var cloth = 0
    @Published var right = 0
    @Published var left = 0

}
struct Card
{
    var describ: String
    var number: String
    
}
struct dull
{
    var eyes: String
    var bow: String
    var mon: String
    var pre: String
    var pro: String
    var cloth: String
    var right: String
    var left: String
    
}
var cloths = [     Card(describ: "cloth", number: "0"),
                   Card(describ: "cloth", number: "1"),
                   Card(describ: "cloth", number: "2"),
                   Card(describ: "cloth", number: "3"),
                   Card(describ: "cloth", number: "4"),
                   Card(describ: "cloth", number: "5"),
                   Card(describ: "cloth", number: "6"),
                   Card(describ: "cloth", number: "7"),
                   Card(describ: "cloth", number: "8"),
                   Card(describ: "cloth", number: "9"),
                   Card(describ: "right", number: "0"),
                                      Card(describ: "right", number: "1"),
                                      Card(describ: "right", number: "2"),
                                      Card(describ: "right", number: "3"),
                                      Card(describ: "right", number: "4"),
                                      Card(describ: "right", number: "5"),
                                      Card(describ: "right", number: "6"),
                                      Card(describ: "right", number: "7"),
                                      Card(describ: "right", number: "8"),
                                      Card(describ: "right", number: "9"),
                                      Card(describ: "left", number: "0"),
                                                         Card(describ: "left", number: "1"),
                                                         Card(describ: "left", number: "2"),
                                                         Card(describ: "left", number: "3"),
                                                         Card(describ: "left", number: "4"),
                                                         Card(describ: "left", number: "5"),
                                                         Card(describ: "left", number: "6"),
                                                         Card(describ: "left", number: "7"),
                                                         Card(describ: "left", number: "8"),
                                                         Card(describ: "left", number: "9"),
                                                         Card(describ: "ground", number: "0"),
                                                         Card(describ: "ground", number: "1"),
                                                         Card(describ: "ground", number: "2"),
                                                         Card(describ: "ground", number: "3"),
                                                         Card(describ: "ground", number: "4"),
                                                         Card(describ: "ground", number: "5"),
                                                         Card(describ: "ground", number: "6"),
                                                         Card(describ: "ground", number: "7"),
                                                         Card(describ: "ground", number: "8"),
                                                         Card(describ: "ground", number: "9")]

var cards = [Card(describ: "eyes", number: "0"),
             Card(describ: "eyes", number: "1"),
             Card(describ: "eyes", number: "2"),
             Card(describ: "eyes", number: "3"),
             Card(describ: "eyes", number: "4"),
             Card(describ: "eyes", number: "5"),
             Card(describ: "eyes", number: "6"),
             Card(describ: "eyes", number: "7"),
             Card(describ: "eyes", number: "8"),
             Card(describ: "eyes", number: "9"),
                          Card(describ: "bow", number: "0"),
                          Card(describ: "bow", number: "1"),
                          Card(describ: "bow", number: "2"),
                          Card(describ: "bow", number: "3"),
                          Card(describ: "bow", number: "4"),
                          Card(describ: "bow", number: "5"),
                          Card(describ: "bow", number: "6"),
                          Card(describ: "bow", number: "7"),
                          Card(describ: "bow", number: "8"),
                                       Card(describ: "mon", number: "0"),
                                       Card(describ: "mon", number: "1"),
                                       Card(describ: "mon", number: "2"),
                                       Card(describ: "mon", number: "3"),
                                       Card(describ: "mon", number: "4"),
                                       Card(describ: "mon", number: "5"),
                                       Card(describ: "mon", number: "6"),
                                       Card(describ: "mon", number: "7"),
                                       Card(describ: "mon", number: "8"),
                                       Card(describ: "mon", number: "9"),
                                       
                                       Card(describ: "pro", number: "0"),
                                       Card(describ: "pro", number: "1"),
                                       Card(describ: "pro", number: "2"),
                                       Card(describ: "pro", number: "3"),
                                       Card(describ: "pro", number: "4"),
                                       Card(describ: "pro", number: "5"),
                                       Card(describ: "pro", number: "6"),
                                       Card(describ: "pro", number: "7"),
                                       Card(describ: "pro", number: "8"),
                                       Card(describ: "pro", number: "9"),
                                       
                                       Card(describ: "pre", number: "0"),
                                       Card(describ: "pre", number: "1"),
                                       Card(describ: "pre", number: "2"),
                                       Card(describ: "pre", number: "3"),
                                       Card(describ: "pre", number: "4"),
                                       Card(describ: "pre", number: "5"),
                                       Card(describ: "pre", number: "6"),
                                       Card(describ: "pre", number: "7"),
                                       Card(describ: "pre", number: "8"),
                                       Card(describ: "pre", number: "9")
                                  
                                       ]
