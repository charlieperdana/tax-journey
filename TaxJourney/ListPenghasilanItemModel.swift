//
//  ListPenghasilanItemModel.swift
//  TaxJourney
//
//  Created by charlie siagian on 07/04/21.
//

import Foundation

struct ListPenghasilanItemModel {
    var item : String = ""
    var detailInfo : String = ""
}

struct JumlahPotongModel {
    var item : String = ""
    var jumlah : Int = 0
}

struct PenghasilanPertahunData {
    var periode : String = ""
    var penghasilanTahun : Int = 0
    var pekerjaan : String = ""
    var nppn : Int = 0
    var isBuktiPotong : String = ""
    var jumlahPphPotong: [Int] = []
}
