//
//  FindView.swift
//  FindView
//
//  Created by Liseami on 2021/9/16.
//

import SwiftUI
import MotionComponents

fileprivate var findViewTabs = ["推荐","名人","天梯","前沿","趋势"]
struct FindView: View {
    
    @EnvironmentObject var fullscreen: AppState.TopFullScreenPage
    @State var offset : CGFloat = 0.0
    
    @State var tag  =  findViewTabs[0]

    var body: some View {
        VStack(spacing:0){
            //TOP Tabbar
            FindViewTopTabBar(tag: $tag, items: findViewTabs)
                TabView(selection: $tag, content:{ //tabview start
                    RecommendView().tag(findViewTabs[0])
                    RecommendView().tag(findViewTabs[1])
                    RecommendView().tag(findViewTabs[2])
                    RecommendView().tag(findViewTabs[3])
                    RecommendView().tag(findViewTabs[4])
                    
                    }) //tabview end
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//                    .transition(.slide)
        }
        .navigationBarHidden(true)
        .padding(.top,44)
        .navigationBarTitleDisplayMode(.inline)
        .mtNavbar(content: {
            Capsule().frame(width: 255, height: 32)
                .foregroundColor(.mt.gray_200)
                .overlay(HStack{
                    Image.mt.load(.Search)
                        .frame(width: 18, height: 18)
                    Text("搜索Motion")
                } .foregroundColor(.mt.gray_500)
                )
        }, leading: {
            Button {
                fullscreen.showFullScreen(type: .profile)
            } label: {
                Circle()
                    .foregroundColor(Color.random)
                    .frame(width: 36, height: 36)
            }
       
        }, trailing: {
            Button(
                action: {},
                label: {
                    Image
                        .mt.load(.Setting)
                        .foregroundColor(.mt.gray_900)
                }
            )
        })
    }
}


struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}

