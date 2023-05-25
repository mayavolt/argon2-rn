import Foundation
import CatCrypto

@objc(RNArgon2)
class RNArgon2: NSObject {
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return true
  }
  
  // Method for generating Argon2 hash
  @objc
  func argon2(_ password: String, salt: String, config: NSDictionary? = nil, resolver resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    
    // Initialize Argon2 context & convert config dictionary to Swift Dictionary
    let argon2Context = CatArgon2Context.init();
    let configDict = config as! Dictionary<String,Any>

    // Set Argon2 context properties based on the config values
    argon2Context.iterations = configDict["iterations", default: 2 ] as! Int;
    argon2Context.memory = configDict["memory", default: 32 * 1024 ] as! Int;
    argon2Context.parallelism = configDict["parallelism", default: 1 ] as! Int;
    argon2Context.salt = salt;
    argon2Context.hashLength = configDict["hashLength", default: 32 ] as! Int;
    argon2Context.mode = getArgon2Mode(mode: configDict["mode", default: "argon2id" ] as! String);

    // Initialize Argon2 crypto with the context
    let argon2Crypto = CatArgon2Crypto.init(context: argon2Context);
    
    // Generate encoded and raw Argon2 hashes
    let encodedResult = argon2Crypto.hash(password: password);
    let rawResult = argon2Crypto.hash(password: password);

    // Set the hasher to hash as raw since encoded is the default
    argon2Crypto.context.hashResultType = .hashRaw;
    
    // Check for errors in hash generation
    if ((rawResult.error) != nil || (encodedResult.error) != nil) {
        let error = NSError(domain: "com.argon2.rn", code: 200, userInfo: ["Error reason": "Failed to generate argon2 hash"])
        reject("E_ARGON2", "Failed to generate Argon2 hash", error)
    }

    // Get the hexadecimal representation of raw and encoded hashes
    let rawHash = rawResult.hexStringValue();
    let encodedHash = encodedResult.stringValue();

    // Create a dictionary with the hash results
    let resultDictionary: NSDictionary = [
        "rawHash" : rawHash,
        "encodedHash" : encodedHash,
    ]
    
    // Resolve the Promise with the result dictionary
    resolve(resultDictionary);
  }

  // Get the Argon2 mode based on the provided string
  func getArgon2Mode(mode: String) -> CatArgon2Mode {
    var selectedMode: CatArgon2Mode;
    switch mode {
        case "argon2d":
            selectedMode = CatArgon2Mode.argon2d;
            break;
        case "argon2i":
            selectedMode = CatArgon2Mode.argon2i;
            break;
        case "argon2id":
            selectedMode = CatArgon2Mode.argon2id;
            break;
        default:
            selectedMode = CatArgon2Mode.argon2id;
            break;
    }
    return selectedMode;
  }
}
