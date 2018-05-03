//
//  BAKit_Regular.swift
//  yunLianApp
//
//  Created by boai on 2018/1/15.
//  Copyright © 2018年 云联惠. All rights reserved.
//

import Foundation

enum BAKit_RegularType {
    case BAKit_RegularTypeEmail
    case BAKit_RegularTypePhoneNumber
    case BAKit_RegularTypeNumber
    case BAKit_RegularTypeSpecificNumbers
    case BAKit_RegularTypeChinese
    case BAKit_RegularTypeIllegalCharacter
    case BAKit_RegularTypeURL
    case BAKit_RegularTypeBlankLines
    case BAKit_RegularTypeQQ
    case BAKit_RegularTypeID
    case BAKit_RegularTypeMAC
    case BAKit_RegularTypeIdCard
    case BAKit_RegularTypeDateInformation
    case BAKit_RegularTypeAccountLegal
    case BAKit_RegularTypePassword
    case BAKit_RegularTypeStrongPassword
    case BAKit_RegularTypeThereIsNo
}

func ba_validateWithString(BAKit_RegularType type: BAKit_RegularType, validateString: String) -> Bool {
    do {
        let pattern: String
        
        switch type {
            
        case .BAKit_RegularTypeEmail:
            pattern = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
            
        case .BAKit_RegularTypePhoneNumber:
            pattern = "^1[0-9]{10}$"
            
        case .BAKit_RegularTypeNumber:
            pattern = "^[0-9]*$"
            
        case .BAKit_RegularTypeSpecificNumbers:
            pattern = "^\\d{n}$"
            
        case .BAKit_RegularTypeChinese:
            pattern = "^[\\u4e00-\\u9fa5]{0,}$"
            
        case .BAKit_RegularTypeIllegalCharacter:
//            pattern = "[%&',;=?$\\\\^]+"
            pattern = "^[A-Za-z0-9\\u4e00-\\u9fa5]+$"
            
        case .BAKit_RegularTypeURL:
            pattern = "^http://([\\w-]+\\.)+[\\w-]+(/[\\w-./?%&=]*)?$"
            
        case .BAKit_RegularTypeBlankLines:
            pattern = "^s*|s*$"
            
        case .BAKit_RegularTypeQQ:
            pattern = "[1-9][0-9]{4,}"
            
        case .BAKit_RegularTypeID:
            pattern = "([1-9]{1,3}\\.){3}[1-9]"
            
        case .BAKit_RegularTypeMAC:
            pattern = "([A-Fa-f0-9]{2}\\:){5}[A-Fa-f0-9]"
            
        case .BAKit_RegularTypeIdCard:
            pattern = "\\d{14}[[0-9],0-9xX]"
            
        case .BAKit_RegularTypeDateInformation:
            pattern = "^\\d{4}-\\d{1,2}-\\d{1,2}"
            
        case .BAKit_RegularTypeAccountLegal:
            pattern = "^[a-zA-Z][a-zA-Z0-9_]{4,15}$"
            
        case .BAKit_RegularTypePassword:
            pattern = "^[a-zA-Z]\\w{7,11}$"
            
        case .BAKit_RegularTypeStrongPassword:
            pattern = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$"
            
        default:
            pattern = ""
        }
        
        let regex: NSRegularExpression = try NSRegularExpression(pattern: pattern, options: NSRegularExpression.Options.caseInsensitive)
        let matches = regex.matches(in: validateString, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, validateString.characters.count))
        return matches.count > 0
    }
    catch {
        return false
    }
}


/*
 * 验证邮箱
 */

func ba_regular_isEmail(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeEmail, validateString: string)
}

/*
 * 验证手机号
 */
func ba_regular_isPhoneNumber(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypePhoneNumber, validateString: string)
}

/*
 * 验证只能输入数字
 */
func ba_regular_isNumber(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeNumber, validateString: string)
}

/*
 * 验证输入几位数字   里面的n换成你想要的数字
 */
func ba_regular_isSpecificNumbers(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeSpecificNumbers, validateString: string)
}

/*
 * 验证是否是中文
 */
func ba_regular_isChinese(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeChinese, validateString: string)
}

/*
 * 验证是否含有^%&',;=?$\"等字符
 */
func ba_regular_isIllegalCharacter(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeIllegalCharacter, validateString: string)
}

/*
 * 验证URL
 */
func ba_regular_isURL(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeURL, validateString: string)
}

/*
 * 验证首尾空白行          这个现在有问题
 */
func ba_regular_isBlankLines(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeBlankLines, validateString: string)
}

/*
 * 验证QQ号
 */
func ba_regular_isQQ(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeQQ, validateString: string)
}

/*
 * 验证ID地址
 */
func ba_regular_isID(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeID, validateString: string)
}

/*
 * 验证MAC地址
 */
func ba_regular_isMAC(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeMAC, validateString: string)
}

/*
 * 验证身份证号
 */
func ba_regular_isIdCard(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeIdCard, validateString: string)
}

/*
 * 验证年月日    例子 2013-04-12
 */
func ba_regular_isDateInformation(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeDateInformation, validateString: string)
}

/*
 * 验证帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)
 */
func ba_regular_isAccountLegal(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeAccountLegal, validateString: string)
}

/*
 * 验证密码(以字母开头，长度在8~12之间，只能包含字母、数字和下划线)
 */
func ba_regular_isPassword(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypePassword, validateString: string)
}
/*
 * 验证强密码(必须包含大小写字母和数字的组合，不能使用特殊字符，长度在8-10之间)
 */
func ba_regular_isStrongPassword(with string: String) -> Bool {
    return ba_validateWithString(BAKit_RegularType: .BAKit_RegularTypeStrongPassword, validateString: string)
}





//// MARK: - BAKit_Regular：邮箱
////let ba_regular_isEmail:String = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
//let ba_regular_isEmail:String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
//
//// MARK: - BAKit_Regular：密码，8-16 位字母数字组合
//let ba_regular_isPwd:String = "^[a-zA-Z]\\w.{7,15}$"
//
//// MARK: - BAKit_Regular：密码，是否含有非法字符
//let ba_regular_isPwdWithoutInvaildSymbol:String = "^[A-Za-z0-9\\u4e00-\\u9fa5]+$"
//
//// MARK: - BAKit_Regular：纯数字
//let ba_regular_isAllNumber:String = "^[0-9]*$"
//
//// MARK: - BAKit_Regular：汉字
//let ba_regular_isChiense:String = "^[\\u4e00-\\u9fa5]"
//
//// MARK: - BAKit_Regular：url
//let ba_regular_isUrl:String = "\\b(([\\w-]+://?|www[.])[^\\s()<>]+(?:\\([\\w\\d]+\\)|([^[:punct:]\\s]|/)))"
//
//// MARK: - BAKit_Regular：车牌号验证
//let ba_regular_isCarNumber:String = "^[\\u4e00-\\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\\u4e00-\\u9fa5]$"
//
//// MARK: - BAKit_Regular：车型验证
//let ba_regular_isCarType:String = "^[\\u4E00-\\u9FFF]+$"
//
//// MARK: - BAKit_Regular：字符串是否是字母或数字
//let ba_regular_isLetterOrNumberString:String = "[A-Z0-9a-z]+"
//
//// MARK: - BAKit_Regular：字符串是否是小数点后两位
//let ba_regular_isMoneyWithTwoNumber:String = "^[0-9]+(\\.[0-9]{1,2})?$"

