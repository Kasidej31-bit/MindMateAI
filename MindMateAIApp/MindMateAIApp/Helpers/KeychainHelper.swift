import Foundation
import Security

class KeychainHelper {
    static func savePassword(_ password: String, for username: String) {
        let data = password.data(using: .utf8)!
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: username,
            kSecValueData: data
        ] as CFDictionary

        SecItemDelete(query)
        SecItemAdd(query, nil)
    }

    static func getPassword(for username: String) -> String? {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: username,
            kSecReturnData: true,
            kSecMatchLimit: kSecMatchLimitOne
        ] as CFDictionary

        var result: AnyObject?
        if SecItemCopyMatching(query, &result) == errSecSuccess {
            if let data = result as? Data {
                return String(data: data, encoding: .utf8)
            }
        }
        return nil
    }

    static func deletePassword(for username: String) {
        let query = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: username
        ] as CFDictionary

        SecItemDelete(query)
    }
}

