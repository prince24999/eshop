import SwiftUI

struct ProductDetail: View 
{
    var pId: Int
    
    var body: some View 
    {
        //Text(String(pId))
        ScrollView
        {
            VStack
            {
                Text("Image Silder").frame(maxWidth: .infinity,maxHeight: 200, alignment: .top).background(Color.blue)
                Text("dsljkfhklajsd")
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 250, maxHeight: .infinity, alignment: .topLeading)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}


