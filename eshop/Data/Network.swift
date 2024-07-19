import Foundation

func fetchProductList(cat: String) async throws -> [Product]
{
    var result = [Product]()
    //var raw: [Product]
    let endPoint = "https://fakestoreapi.com/products/category/" + cat
    guard let formattedUrl = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw VPError.invalidURL }
    guard let url = URL(string: formattedUrl) else { throw VPError.invalidURL }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw VPError.invalidResponse
    }
    
    do {
        try result = JSONDecoder().decode([Product].self, from: data)
    } catch {
        throw VPError.invalidData
    }
    return result
}

func fetchSingleProduct(pid: Int) async throws -> Product
{
    let endPoint = "https://fakestoreapi.com/products/" + String(pid)
    guard let formattedUrl = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw VPError.invalidURL }
    guard let url = URL(string: formattedUrl) else { throw VPError.invalidURL }
    let (data, response) = try await URLSession.shared.data(from: url)
    guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        throw VPError.invalidResponse
    }
    do {
        var r: Product = try JSONDecoder().decode(Product.self, from: data)
        print(r.id)
        return r
    } catch {
        throw VPError.invalidData
    }
}

enum VPError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}



