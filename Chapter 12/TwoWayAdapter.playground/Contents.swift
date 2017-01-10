//: Playground - noun: a place where people can play

import UIKit

// Application

protocol ShapeDrawer {
    func drawShape()
}

class DrawingApp {
    let drawer: ShapeDrawer
    var cornerRadius = 0
    
    init(drawer: ShapeDrawer) {
        self.drawer = drawer
    }
    
    func makePicture() {
        drawer.drawShape()
    }
}

// Component Library

protocol AppSettings {
    var sketchRoundedShapes: Bool { get }
}

class SketchComponent {
    fileprivate let settings: AppSettings
    
    init(settings: AppSettings) {
        self.settings = settings
    }
    
    func sketchShape() {
        if settings.sketchRoundedShapes {
            print("Sketch Circle")
        } else {
            print("Sketch Square")
        }
    }
}

// Two Way Adapter

class TwoWayAdapter: ShapeDrawer, AppSettings {
    var app: DrawingApp?
    var component: SketchComponent?
    
    func drawShape() {
        component?.sketchShape()
    }
    
    var sketchRoundedShapes: Bool {
        return (app?.cornerRadius)! > 0
    }
}

let adapter = TwoWayAdapter()
let component = SketchComponent(settings: adapter)
let app = DrawingApp(drawer: adapter)

adapter.app = app
adapter.component = component

app.makePicture()
