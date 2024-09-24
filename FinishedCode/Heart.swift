//

import SwiftUI

struct Heart: Shape {
    var inset: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height

        var path = Path()

        // Start at the bottom point
        path.move(to: CGPoint(x: width * 0.5, y: height - inset))

        // Draw the left curve
        path.addCurve(
            to: CGPoint(x: 0, y: height * 0.25),
            control1: CGPoint(x: width * 0.25, y: height * 0.75),
            control2: CGPoint(x: 0, y: height * 0.5)
        )

        // Draw the left arc
        path.addArc(
            center: CGPoint(x: width * 0.25, y: height * 0.25),
            radius: width * 0.25,
            startAngle: .degrees(180),
            endAngle: .degrees(0),
            clockwise: false
        )

        // Draw the right arc
        path.addArc(
            center: CGPoint(x: width * 0.75, y: height * 0.25),
            radius: width * 0.25,
            startAngle: .degrees(180),
            endAngle: .degrees(0),
            clockwise: false
        )

        // Draw the right curve
        path.addCurve(
            to: CGPoint(x: width * 0.5, y: height),
            control1: CGPoint(x: width, y: height * 0.5),
            control2: CGPoint(x: width * 0.75, y: height * 0.75)
        )
        path.closeSubpath()

        return path
    }
}

