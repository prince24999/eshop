// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let product = try? JSONDecoder().decode(Product.self, from: jsonData)

import Foundation

// MARK: - ProductElement
class Product: Codable {
    var id: Int?
    var title: String?
    var price: Double?
    var description, category: String?
    var image: String?
    var rating: Rating?

    init(id: Int?, title: String?, price: Double?, description: String?, category: String?, image: String?, rating: Rating?) {
        self.id = id
        self.title = title
        self.price = price
        self.description = description
        self.category = category
        self.image = image
        self.rating = rating
    }
}

// MARK: - Rating
class Rating: Codable {
    var rate: Double?
    var count: Int?

    init(rate: Double?, count: Int?) {
        self.rate = rate
        self.count = count
    }
}


