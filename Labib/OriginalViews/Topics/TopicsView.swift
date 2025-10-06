//
//  TopicsView.swift
//  Labib_ADA_project_1
//
//  Created by nouransalah on 07/04/1447 AH.
//

import SwiftUI

// MARK: - Topics View
struct TopicsView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationView {
            ZStack {
                //Background Color
                Color("ColorBackground").ignoresSafeArea()
                
                VStack(alignment: .trailing, spacing: 16) {
                    
                    // Title
                    Text("المواضيع")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color.black)
                        //.foregroundColor(.black)
                        .padding(.top, 20)
                        .padding(.trailing, 16)
                    
                    // Rows
                    VStack(spacing: 12) {
                        
                        NavigationLink(destination: TopicExplanationView()) {
                            TopicRow(title:"الوجه",imageName:"ImgFemaleOpenSmile")
                        }.navigationBarBackButtonHidden(true)
                            .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button(
                                    action:{
                                        presentationMode.wrappedValue.dismiss()
                                    }
                                ) {
                                    Image(systemName: "chevron.left") // just the arrow
                                        .foregroundColor(Color("ColorBrownCard")) // your custom color
                                }
                            }
                            
                        }
                        
//                        NavigationLink(destination: TopicExplanationView()) {
//                            TopicRow(title: "اليد", imageName: "mouth_icon_2")
//                        }
//                        
//                        NavigationLink(destination: TopicExplanationView()) {
//                            TopicRow(title: "الوجه", imageName: "face_icon_3")}
//                        
//                        NavigationLink(destination: TopicExplanationView()) {
//                            TopicRow(title: "اليدين", imageName: "hand_icon_4")
//                        }//nav
                      
                    }
                    .padding(.horizontal, 16)
                    
                    Spacer()
                }
            }//Z

                
            }.navigationBarBackButtonHidden(true)
        }
    }


// MARK: - Topic Row METHOD TO DESIGN ROW
struct TopicRow: View {
    let title: String
    let imageName: String
    
    var body: some View {
        HStack {
            //IF I REMOVED SPACER IT WILL SHRENK I NEED SPACER SO IT CAN FIT THE THE WIDTH OF SCREEN AND THERE IS PADING MAKE IT WITH SPECIFC SIZE
            Spacer()
            Text(title)
                .font(.system(size: 18, weight: .medium))
                .foregroundColor(.black)
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(.leading, 8)
           
        }//HSTACK
        
        .padding()
        .frame(maxWidth:.infinity)
        .background(Color("ColorChooseButton"))
        .cornerRadius(12)
    }
}//row



// MARK: - Preview

#Preview {
    TopicsView()
}

