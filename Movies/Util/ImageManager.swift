//
//  ImageManager.swift
//  Movies
//
//  Created by Erdem on 16.08.2023.
//

import Foundation
import SDWebImage

extension String {
    func restoreImageURL(urlString: Self) -> Self {
        return URLConstants.imageHost + urlString
    }
}
final class ImageManager: NSObject, LogProvidable {
    static let shared = ImageManager()

    private override init() {

    }

    func downloadOrGetCache(url: String?, for imageview: UIImageView) {
        guard let downloadUrl = url?.restoreImageURL(urlString: url!), let mainURL = URL(string: downloadUrl)  else {
            Self.logger.critical("Image URL could not prepared")
            return}

        setImage(url: mainURL, imageView: imageview, placeholder: nil, options: .progressiveLoad)

    }

    private func setImage(url: URL, imageView: UIImageView, placeholder: UIImage?, options: SDWebImageOptions) {
        imageView.sd_imageIndicator = SDWebImageActivityIndicator.gray
        imageView.sd_setImage(with: url, placeholderImage: placeholder, options: options) { image, _, _, _ in
            if image != nil {
                imageView.image = image
            }
        }
    }

}
