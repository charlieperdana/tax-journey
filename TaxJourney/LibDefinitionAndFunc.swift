//
//  LibDefinitionAndFunc.swift
//  TaxJourney
//
//  Created by Akbar Priyonggo on 12/04/21.
//

import Foundation

//inputnya masukin ke sini
public var penghasilanPertahun:Int = 0

//inputnya masukin ke sini
public var NPPN:Int = 0

// penghasilan netp
public let penghasilanNeto = penghasilanPertahun * (NPPN / 100)

//jumlahin di total kredit pajak
public var jumlahKreditPajak:Int = 0

//Status PTKP
public var isMenikah:Bool = false
public var jumlahTanggungan:Int = 0

public func hitungPTKP(isMenikah:Bool, jumlahTanggungan:Int) -> Int {
    
    var PTKP = 54000000
    let tambahanPTKP = 4500000
    var tanggungan = jumlahTanggungan
    
    if jumlahTanggungan > 3 {
        tanggungan = 3
    }
    
    if isMenikah {
        PTKP += tambahanPTKP
    }
    
    return PTKP + tambahanPTKP * tanggungan
    
}

// masukin hasil hitungPTKP ke sini
public let besaranPTKP = hitungPTKP(isMenikah: isMenikah, jumlahTanggungan: jumlahTanggungan)

// PKP mesti diround 1000 ke bawah
public let PKPunrounded = penghasilanNeto - besaranPTKP

public func buletinSeribuKeBawah(PKPunrounded:Int) -> Int {
    var PKProunded = PKPunrounded
    PKProunded = PKProunded / 1000
    
    return PKProunded * 1000
}

public let besaranPKP = buletinSeribuKeBawah(PKPunrounded: PKPunrounded)

// declare tax bracket
public var bracket5 = 0
public var bracket15 = 0
public var bracket25 = 0
public var bracket30 = 0

//hitung pajak terutang
public func hitungPajakTerutang(besaranPKP:Int) -> Double {
    if besaranPKP <= 50000000 {
        bracket5 = besaranPKP
    } else if besaranPKP <= 250000000 {
        bracket5 = 50000000
        bracket15 = besaranPKP - 50000000
    } else if besaranPKP <= 500000000 {
        bracket5 = 50000000
        bracket15 = 200000000
        bracket25 = besaranPKP - 250000000
    } else {
        bracket5 = 50000000
        bracket15 = 200000000
        bracket25 = 250000000
        bracket30 = besaranPKP - 500000000
    }
    return Double(bracket5 * 5/100 + bracket15 * 15/100 + bracket25 * 25/100 + bracket30 * 30/100)
}

//pajak terutang
public let pajakTerutang = Int(hitungPajakTerutang(besaranPKP: besaranPKP))

// kurang lebih bayar
public let kurangLebihBayar = pajakTerutang - jumlahKreditPajak
