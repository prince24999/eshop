import SwiftUI
import CachedAsyncImage

struct ProductDetail: View
{
    var pId: Int
    @State private var product: Product?
    @State private var currentPage = 0
    let images: [String] = ["https://cdn.tgdd.vn/Products/Images/44/321192/dell-inspiron-15-3520-i5-25p231-250424-020344-600x600.jpg",
                            "https://mac24h.vn/images/detailed/89/LAPTOP_GO_2020_SLIVER_on9q-eu.png",
                            "https://hanoicomputercdn.com/media/product/77021_laptop_lenovo_ideapad_3_16iah8__83bg001xvn___2_.jpg",
                            "https://hoanghamobile.com/Uploads/2024/04/16/laptop-12.jpg",
                            "https://tiki.vn/blog/wp-content/uploads/2023/11/laptop-mini.jpeg",
                            "https://store.storeimages.cdn-apple.com/8756/as-images.apple.com/is/iphone-card-40-iphone15prohero-202309_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=1693086369818",
                            "https://cdn.hoanghamobile.com/i/preview/Uploads/2023/09/13/iphone-15-plus-green-pure-back-iphone-15-plus-green-pure-front-2up-screen-usen.png"
    ]
    let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    var body: some View
    {
        //Text(String(pId))
        ScrollView
        {
            VStack
            {
                
                TabView(selection: $currentPage) {
                    ForEach(0..<images.count, id: \.self) { index in
                        
                        CachedAsyncImage(
                            url: URL(string: images[index]),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                
                            },
                            placeholder: {
                                ProgressView()
                            }
                        )
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .frame(height: 200)
                .onReceive(timer) { _ in
                    withAnimation {
                        currentPage = (currentPage + 1) % images.count
                    }
                }
                
                .frame(maxWidth: .infinity,maxHeight: 200, alignment: .top)
                VStack
                {
                    Text((product?.title) ?? "")
                        .bold()
                        .padding(.vertical)
                    Text("Price: $" + (String)((product?.price) ?? 0))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    Text("Rating: " + (String)((product?.rating?.rate) ?? 0) + "/" + (String)((product?.rating?.count) ?? 0))
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,alignment: .leading)
                    Text((product?.description) ?? "").padding()
                    Button(action: {}) {
                        Text("Add to Cart")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.blue, lineWidth: 1)
                            )
                    }
                    .padding()
                }
                
            }
            
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity, alignment: .bottomTrailing)
            .navigationBarTitleDisplayMode(.inline)
            .task {
                do {
                    try await product = fetchSingleProduct(pid: pId)
                    
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
    }
    
}


