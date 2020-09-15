//
//  UIImage+Extensions.swift
//  MarvelApp
//
//  Created by Pamela Ianovalli on 12/09/20.
//  Copyright © 2020 Pamela Ianovalli. All rights reserved.
//

import UIKit

final class ImageCache {
    private let imageCache = NSCache<NSString, UIImage>()
    static let shared = ImageCache()
    private init() {}
}

extension ImageCache {
    static func load(url: URL, completion: @escaping (UIImage?) -> Void) {
        DispatchQueue.global().async {
            if let cachedImage = self.shared.imageCache.object(forKey: url.absoluteString as NSString) {
                completion(cachedImage)
            } else {
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        self.shared.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                        completion(image)
                    }
                }
            }
        }
    }
}
