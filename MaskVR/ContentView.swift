//
//  ContentView.swift
//  MaskVR
//
//  Created by Yorgi Del Rio on 10/19/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        return ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        let faceScene = try! Mask.loadEscena()
        
        arView.scene.anchors.append(faceScene)
        
        let arConfig = ARFaceTrackingConfiguration()
        arView.session.run(arConfig)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
