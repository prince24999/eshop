import SwiftUI
import CachedAsyncImage

struct CatList: View {
    
    let minW: CGFloat = 170
    let maxW: CGFloat = 300
    let minH: CGFloat = 170
    let maxH: CGFloat = 300
    let space: CGFloat = 15
    let cRadius: CGFloat = 15
    let textHieght: CGFloat = 30
    
    let data = fakecat
    let columns = [
        GridItem(.adaptive(minimum: 170, maximum: 300))
        ]

    

    var body: some View {
        NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: space) {
                        ForEach(data, id: \.self) { item in
                            NavigationLink(destination: ProductList(ccName: item.name, ccColor: item.color))
                            {
                                ZStack(alignment: .bottom) {
                                    CachedAsyncImage(
                                        url: URL(string: item.url),
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
                                                VStack {  Text(item.name)      }
                                                Spacer()
                                            }
                                            .padding(.vertical)
                                            .foregroundColor(.white)
                                            .background(item.color.opacity(0.75))
                                        }
                                .mask(RoundedRectangle(cornerRadius: cRadius))

                            }
                        }
                    }
                    .padding()
                }
                .navigationBarTitle("Shopping")
                .navigationBarTitleDisplayMode(.inline)
            }
        .navigationViewStyle(StackNavigationViewStyle())

        
    }
    
    
}


