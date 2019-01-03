//
//  MD5.swift
//  simple-bill-swift
//
//  Created by 何建新 on 2019/1/2.
//  Copyright © 2019 何建新. All rights reserved.
//

import Foundation
// 导入CommonCrypto
import CommonCrypto

// 直接给String扩展方法
extension String {
    func md5() -> String {
        let str = self.cString(using: String.Encoding.utf8)
        let strLen = CUnsignedInt(self.lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<UInt8>.allocate(capacity: 16)
        CC_MD5(str!, strLen, result)
        let hash = NSMutableString()
        for i in 0 ..< digestLen {
            hash.appendFormat("%02x", result[i])
        }
        free(result)
        let s = String(format: hash as String)
        return s.uppercased();
    }
}

