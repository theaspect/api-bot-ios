
import Foundation

extension Const {
    
    struct Device {
        
        static let appVersion: String = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
        static let buildVersion: String = (Bundle.main.infoDictionary?["CFBundleVersion"] as? String) ?? ""
        static let version = Const.Device.appVersion + "." + Const.Device.buildVersion
        //static let uuid: String = UIDevice.current.identifierForVendor?.uuidString ?? ""
        //static let deviceModel: String = UIDevice.current.model
        static let platform: String = "IOS"
        static let platformInt: Int = 1
        
    }
    
}
