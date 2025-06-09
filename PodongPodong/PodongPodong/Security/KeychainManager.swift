//
//  KeychainManager.swift
//  PodongPodong
//
//  Created by 김진혁 on 6/8/25.
//

import Foundation
import Security

class KeychainManager {
    
    static let shared = KeychainManager()
    
    @discardableResult
    func saveIdToKeychain(account: String, service: String, id: String) -> OSStatus {
        
        guard let idData = id.data(using: .utf8) else {
            return errSecParam // 잘못된 데이터
        }
        
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,  // 저장 유형: 일반 비밀번호
            kSecAttrAccount as String: account,             // 계정 식별자
            kSecAttrService as String: service,             // 서비스 이름
            kSecValueData as String: idData,          // 실제 저장할 데이터
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlocked // 접근 가능 조건
        ]
        
        
        SecItemDelete(query as CFDictionary)
        
        
        let status = SecItemAdd(query as CFDictionary, nil)
        return status
    }
    
    
    @discardableResult
    func load(account: String, service: String) -> String? {
        // 1. 검색 쿼리 구성
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,   // 일반 비밀번호 클래스
            kSecAttrAccount as String: account,              // 계정
            kSecAttrService as String: service,              // 서비스
            kSecReturnData as String: true,                  // 데이터를 반환하도록 요청
            kSecMatchLimit as String: kSecMatchLimitOne      // 하나만 반환
        ]
        
        
        var item: CFTypeRef?
        
        
        let status = SecItemCopyMatching(query as CFDictionary, &item)
        
        
        guard status == errSecSuccess else {
            print("Keychain load 실패 - status: \(status)")
            return nil
        }
        
        guard let data = item as? Data,
              let result = String(data: data, encoding: .utf8) else {
            print("Keychain load 실패 - 데이터 디코딩 실패")
            return nil
        }
        
        return result
    }
    
    @discardableResult
    func delete(account: String, service: String) -> OSStatus {
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,   // 삭제 대상 유형
            kSecAttrAccount as String: account,              // 계정 식별자
            kSecAttrService as String: service               // 서비스 구분자
        ]
        
        
        let status = SecItemDelete(query as CFDictionary)
        
        
        if status == errSecSuccess {
            print("Keychain 삭제 성공 - [\(service) : \(account)]")
        } else if status == errSecItemNotFound {
            print("Keychain 항목 없음 - [\(service) : \(account)]")
        } else {
            print("Keychain 삭제 실패 - status: \(status)")
        }
        
        return status
    }
}
