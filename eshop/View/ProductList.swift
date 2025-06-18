import SwiftUI
import CachedAsyncImage

struct ProductList: View
{
    var ccName: String
    var ccColor: Color
    
    @State private var productList: [Product]?
    
    let columns = [GridItem(.adaptive(minimum: 170, maximum: 300))]
    let minW: CGFloat = 170
    let maxW: CGFloat = 300
    let minH: CGFloat = 170
    let maxH: CGFloat = 300
    let space: CGFloat = 15
    let cRadius: CGFloat = 15
    let textHieght: CGFloat = 30
    
    var body: some View 
    {
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: space) 
            {
                ForEach(productList ?? [Product](), id: \.id)
                { item in
                    NavigationLink(destination: ProductDetail(pId: item.id!))
                    {
                        ZStack(alignment: .bottom) {
                            CachedAsyncImage(
                                url: URL(string: item.image!),
                                content: { image in
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(minWidth: minW, maxWidth: maxW, minHeight: minH, maxHeight: maxH)
                                },
                                placeholder: {
                                    ProgressView()
                                }
                            )
                                    HStack {
                                        Spacer()
                                        VStack {  Text(item.title!)      }
                                        Spacer()
                                    }
                                    .padding(.vertical)
                                    .foregroundColor(.white)
                                    .background(ccColor.opacity(0.75))
                                }
                        .mask(RoundedRectangle(cornerRadius: cRadius))

                    }
                }
            }
            .padding()
//            .onAppear(perform: {
//                try await  fetchProductList(cat: ccSlug)
//            })
//            .refreshable
//            {
//                fetchData()
//            }
            
            .task {
                do {
                    try await productList = fetchProductList(cat: ccName)
                }
                catch VPError.invalidURL {
                    print("invalid URL")
                }
                catch VPError.invalidResponse {
                    print("invalid Response")
                }
                catch VPError.invalidData {
                    print("invalid Data")
                }
                catch {
                    print("unexpected error")
                }
            }
            
        }
        //.navigationBarTitle("Shopping")
        .navigationBarTitleDisplayMode(.inline)
//        List(data, id: \.id)
//        { item in
//            Text(item.title)
//        }
        
        
    }
    
    
//    func fetchProductList(cat: String) async throws
//    {
//        //var result = [Product]()
//        //var raw: [Product]
//        let endPoint = "https://fakestoreapi.com/products/category/" + cat
//        guard let formattedUrl = endPoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { throw VPError.invalidURL }
//        guard let url = URL(string: formattedUrl) else { throw VPError.invalidURL }
//        let (data, response) = try await URLSession.shared.data(from: url)
//        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
//            throw VPError.invalidResponse
//        }
//        
//        do {
//            try productList = JSONDecoder().decode([Product].self, from: data)
//            //result = raw.products
//            //productList = raw.products
//        } catch {
//            throw VPError.invalidData
//        }
//        //return result
//    }
//    
//    enum VPError: Error {
//        case invalidURL
//        case invalidResponse
//        case invalidData
//    }
    
}

