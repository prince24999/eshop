import Foundation
import SwiftUI

struct Cat: Hashable {
    internal init(color: Color, name: String, url: String) {

        self.color = color
        self.name = name
        self.url = url
    }

    let color: Color
    let name: String
    let url: String
}


