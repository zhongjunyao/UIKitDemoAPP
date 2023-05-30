//
//  SwiftUIView.swift
//  UIKitDemoApp
//
//  Created by ROBIN.J.Y.ZHONG on 2023/5/27.
//

import SwiftUI

struct SwiftUIView: View {
//    @Environment(\.presentationMode) var presentationMode
    
    var message: String = ""
    
    var body: some View {
        Text("当前时Swift页面，接收到消息: \"\(message)\"")
        NavigationLink(destination: UIKitThird()
            .navigationTitle("被SwiftUI调用的页面")
            .navigationBarBackButtonHidden(false)
//            .navigationBarItems(leading: Button(action: {
//                // 点击按钮后的操作, 目前不生效，不知道原因
//                self.presentationMode.wrappedValue.dismiss()
//            }){
//                //按钮及其样式
//                HStack {
//                    Image(systemName: "chevron.left")
//                        .foregroundColor(.gray)
//                    Text("返回").foregroundColor(.black)
//                }
//            })
        ){
            Text("跳转UIKit页面")
        }
    }
    
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
