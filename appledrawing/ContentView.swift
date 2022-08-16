import SwiftUI
struct DrawView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        //以下開始繪圖
        
        let path = UIBezierPath()
        //葉子
        path.move(to: CGPoint(x: 205, y: 9))
        path.addQuadCurve(to: CGPoint(x: 150, y: 74), controlPoint: CGPoint(x: 155, y: 18))
        path.addQuadCurve(to: CGPoint(x: 205, y: 9), controlPoint: CGPoint(x: 198, y: 74))
        path.close()
        //左半邊
        path.move(to: CGPoint(x: 153, y: 91))
        path.addQuadCurve(to: CGPoint(x: 47.5, y: 115), controlPoint: CGPoint(x: 75, y: 62))
        path.addQuadCurve(to: CGPoint(x: 74, y: 275), controlPoint: CGPoint(x: 8, y: 180))
        path.addQuadCurve(to: CGPoint(x: 154, y: 278), controlPoint: CGPoint(x: 105, y: 300))
        //右半邊
        path.addQuadCurve(to: CGPoint(x: 264, y: 216), controlPoint: CGPoint(x: 235, y: 315))
        path.addQuadCurve(to: CGPoint(x: 256, y: 115), controlPoint: CGPoint(x: 210, y: 168))
        path.addQuadCurve(to: CGPoint(x: 153, y: 91), controlPoint: CGPoint(x: 212, y: 60))
        path.close()
        
        let layer1 = CAShapeLayer()
            layer1.path = path.cgPath
        layer1.fillColor = UIColor.lightGray.cgColor
        layer1.strokeColor = UIColor.black.cgColor
        layer1.lineWidth = 3
        view.layer.addSublayer(layer1)
        
        //練習CGAffineTransform位移+旋轉+縮放圖案
        let layer2 = CAShapeLayer()
        layer2.path = path.cgPath
        layer2.setAffineTransform(CGAffineTransform(rotationAngle: .pi / 180 * 45).translatedBy(x: 450, y: 200).scaledBy(x: 1.2, y: 1.2))
        layer2.fillColor = UIColor.cyan.cgColor
        view.layer.addSublayer(layer2)
        
        //練習CGAffineTransform位移+翻轉+縮放圖案
        let layer3 = CAShapeLayer()
        layer3.path = path.cgPath
        layer3.setAffineTransform(CGAffineTransform(translationX: 400, y: 550).scaledBy(x: -0.7, y: -0.7))
        layer3.fillColor = UIColor.red.cgColor
        view.layer.addSublayer(layer3)
      
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
}
struct ContentView: View {
    var body: some View {
        DrawView()
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

