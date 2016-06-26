//
//  NSURLSessionConfiguration.swift
//  Mockingjay
//
//  Created by Kyle Fuller on 01/03/2015.
//  Copyright (c) 2015 Cocode. All rights reserved.
//

import Foundation

extension URLSessionConfiguration {
	/// Swizzles NSURLSessionConfiguration's default and ephermeral sessions to add Mockingjay
	private static var __once: () {
		let defaultSessionConfiguration = class_getClassMethod(self, #selector(URLSessionConfiguration.default))
		let mockingjayDefaultSessionConfiguration = class_getClassMethod(self, #selector(URLSessionConfiguration.mockingjayDefaultSessionConfiguration))
		method_exchangeImplementations(defaultSessionConfiguration, mockingjayDefaultSessionConfiguration)
		
		let ephemeralSessionConfiguration = class_getClassMethod(self, #selector(URLSessionConfiguration.ephemeral))
		let mockingjayEphemeralSessionConfiguration = class_getClassMethod(self, #selector(URLSessionConfiguration.mockingjayEphemeralSessionConfiguration))
		method_exchangeImplementations(ephemeralSessionConfiguration, mockingjayEphemeralSessionConfiguration)
	}
	
  public static func mockingjaySwizzleDefaultSessionConfiguration() {
		_ = self.__once
  }

  class func mockingjayDefaultSessionConfiguration() -> URLSessionConfiguration {
    let configuration = mockingjayDefaultSessionConfiguration()
    configuration.protocolClasses = [MockingjayProtocol.self] as [AnyClass] + configuration.protocolClasses!
    return configuration
  }

  class func mockingjayEphemeralSessionConfiguration() -> URLSessionConfiguration {
    let configuration = mockingjayEphemeralSessionConfiguration()
    configuration.protocolClasses = [MockingjayProtocol.self] as [AnyClass] + configuration.protocolClasses!
    return configuration
  }
}
