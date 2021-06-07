//
//  LaunchingScreen.swift
//  Inters
//
//  Created by Punnavit Tuntisangaroon on 20/3/2564 BE.
//

import UIKit

class LaunchingScreen: UIViewController {
    
    
    let layer = CAShapeLayer()
    let layer2 = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawAll()
    }
    
    
    func drawAll(){
        
        //// Color Declarations
        let fillColor9 = UIColor.yellow
        
        //// svgg
        //// path0 Drawing
        let path0Path = UIBezierPath()
        path0Path.move(to: CGPoint(x: 329.8, y: 183.48))
        path0Path.addCurve(to: CGPoint(x: 312.73, y: 183.73), controlPoint1: CGPoint(x: 328.53, y: 183.51), controlPoint2: CGPoint(x: 320.85, y: 183.62))
        path0Path.addCurve(to: CGPoint(x: 220.38, y: 184.99), controlPoint1: CGPoint(x: 296.2, y: 183.94), controlPoint2: CGPoint(x: 241.45, y: 184.69))
        path0Path.addCurve(to: CGPoint(x: 187.93, y: 185.34), controlPoint1: CGPoint(x: 212.8, y: 185.1), controlPoint2: CGPoint(x: 198.2, y: 185.25))
        path0Path.addCurve(to: CGPoint(x: 168.05, y: 185.68), controlPoint1: CGPoint(x: 177.09, y: 185.43), controlPoint2: CGPoint(x: 168.76, y: 185.57))
        path0Path.addCurve(to: CGPoint(x: 149.38, y: 202.49), controlPoint1: CGPoint(x: 157.94, y: 187.18), controlPoint2: CGPoint(x: 151.5, y: 192.98))
        path0Path.addCurve(to: CGPoint(x: 148.2, y: 217.6), controlPoint1: CGPoint(x: 148.64, y: 205.8), controlPoint2: CGPoint(x: 148.45, y: 208.23))
        path0Path.addCurve(to: CGPoint(x: 147.79, y: 305.55), controlPoint1: CGPoint(x: 147.75, y: 234.79), controlPoint2: CGPoint(x: 147.69, y: 248.17))
        path0Path.addLine(to: CGPoint(x: 147.9, y: 365.58))
        path0Path.addLine(to: CGPoint(x: 148.36, y: 365.65))
        path0Path.addCurve(to: CGPoint(x: 148.17, y: 365.75), controlPoint1: CGPoint(x: 148.7, y: 365.71), controlPoint2: CGPoint(x: 148.65, y: 365.73))
        path0Path.addCurve(to: CGPoint(x: 148.21, y: 369.42), controlPoint1: CGPoint(x: 147.39, y: 365.78), controlPoint2: CGPoint(x: 147.39, y: 365.67))
        path0Path.addCurve(to: CGPoint(x: 172.29, y: 390.84), controlPoint1: CGPoint(x: 150.87, y: 381.64), controlPoint2: CGPoint(x: 159.73, y: 389.52))
        path0Path.addCurve(to: CGPoint(x: 341.71, y: 390.34), controlPoint1: CGPoint(x: 176.19, y: 391.25), controlPoint2: CGPoint(x: 339.64, y: 390.77))
        path0Path.addCurve(to: CGPoint(x: 352.2, y: 386.41), controlPoint1: CGPoint(x: 345.79, y: 389.5), controlPoint2: CGPoint(x: 348.54, y: 388.46))
        path0Path.addCurve(to: CGPoint(x: 362.86, y: 372.29), controlPoint1: CGPoint(x: 357.04, y: 383.68), controlPoint2: CGPoint(x: 361, y: 378.44))
        path0Path.addCurve(to: CGPoint(x: 364.35, y: 354.09), controlPoint1: CGPoint(x: 364.25, y: 367.69), controlPoint2: CGPoint(x: 364.44, y: 365.29))
        path0Path.addCurve(to: CGPoint(x: 364.33, y: 345.16), controlPoint1: CGPoint(x: 364.3, y: 349.18), controlPoint2: CGPoint(x: 364.3, y: 345.16))
        path0Path.addCurve(to: CGPoint(x: 365.23, y: 345.62), controlPoint1: CGPoint(x: 364.37, y: 345.16), controlPoint2: CGPoint(x: 364.77, y: 345.37))
        path0Path.addCurve(to: CGPoint(x: 369.18, y: 347.78), controlPoint1: CGPoint(x: 366.13, y: 346.13), controlPoint2: CGPoint(x: 367.34, y: 346.79))
        path0Path.addCurve(to: CGPoint(x: 372.96, y: 349.84), controlPoint1: CGPoint(x: 371.34, y: 348.96), controlPoint2: CGPoint(x: 372.11, y: 349.37))
        path0Path.addCurve(to: CGPoint(x: 374.64, y: 350.78), controlPoint1: CGPoint(x: 373.42, y: 350.1), controlPoint2: CGPoint(x: 374.18, y: 350.52))
        path0Path.addCurve(to: CGPoint(x: 378.6, y: 352.94), controlPoint1: CGPoint(x: 375.65, y: 351.34), controlPoint2: CGPoint(x: 377.02, y: 352.09))
        path0Path.addCurve(to: CGPoint(x: 382.24, y: 354.93), controlPoint1: CGPoint(x: 381.06, y: 354.27), controlPoint2: CGPoint(x: 381.56, y: 354.54))
        path0Path.addCurve(to: CGPoint(x: 383.84, y: 355.82), controlPoint1: CGPoint(x: 382.64, y: 355.15), controlPoint2: CGPoint(x: 383.36, y: 355.56))
        path0Path.addCurve(to: CGPoint(x: 387.84, y: 358), controlPoint1: CGPoint(x: 385.62, y: 356.79), controlPoint2: CGPoint(x: 386.89, y: 357.48))
        path0Path.addCurve(to: CGPoint(x: 391.58, y: 360.05), controlPoint1: CGPoint(x: 388.93, y: 358.59), controlPoint2: CGPoint(x: 390.36, y: 359.37))
        path0Path.addCurve(to: CGPoint(x: 395.49, y: 362.19), controlPoint1: CGPoint(x: 392.54, y: 360.58), controlPoint2: CGPoint(x: 393.93, y: 361.34))
        path0Path.addCurve(to: CGPoint(x: 399.31, y: 364.27), controlPoint1: CGPoint(x: 397.68, y: 363.37), controlPoint2: CGPoint(x: 398.43, y: 363.78))
        path0Path.addCurve(to: CGPoint(x: 402.78, y: 366.18), controlPoint1: CGPoint(x: 401.44, y: 365.45), controlPoint2: CGPoint(x: 401.85, y: 365.68))
        path0Path.addCurve(to: CGPoint(x: 404.91, y: 367.34), controlPoint1: CGPoint(x: 403.32, y: 366.48), controlPoint2: CGPoint(x: 404.28, y: 366.99))
        path0Path.addCurve(to: CGPoint(x: 406.24, y: 368.09), controlPoint1: CGPoint(x: 405.55, y: 367.68), controlPoint2: CGPoint(x: 406.15, y: 368.02))
        path0Path.addCurve(to: CGPoint(x: 409.53, y: 369.38), controlPoint1: CGPoint(x: 406.43, y: 368.23), controlPoint2: CGPoint(x: 408.18, y: 368.92))
        path0Path.addCurve(to: CGPoint(x: 424.05, y: 369.78), controlPoint1: CGPoint(x: 413.8, y: 370.84), controlPoint2: CGPoint(x: 419.26, y: 370.99))
        path0Path.addCurve(to: CGPoint(x: 437.97, y: 351.36), controlPoint1: CGPoint(x: 432, y: 367.76), controlPoint2: CGPoint(x: 437.11, y: 361))
        path0Path.addCurve(to: CGPoint(x: 437.8, y: 228.89), controlPoint1: CGPoint(x: 438.94, y: 340.44), controlPoint2: CGPoint(x: 438.82, y: 256.23))
        path0Path.addCurve(to: CGPoint(x: 431.19, y: 208.78), controlPoint1: CGPoint(x: 437.41, y: 218.56), controlPoint2: CGPoint(x: 435.24, y: 211.94))
        path0Path.addCurve(to: CGPoint(x: 430.33, y: 208.09), controlPoint1: CGPoint(x: 430.77, y: 208.46), controlPoint2: CGPoint(x: 430.38, y: 208.14))
        path0Path.addCurve(to: CGPoint(x: 429.27, y: 207.34), controlPoint1: CGPoint(x: 430.28, y: 208.04), controlPoint2: CGPoint(x: 429.8, y: 207.7))
        path0Path.addCurve(to: CGPoint(x: 408.94, y: 207.82), controlPoint1: CGPoint(x: 423.82, y: 203.68), controlPoint2: CGPoint(x: 416.75, y: 203.85))
        path0Path.addCurve(to: CGPoint(x: 402.96, y: 210.99), controlPoint1: CGPoint(x: 406.63, y: 209), controlPoint2: CGPoint(x: 405.71, y: 209.48))
        path0Path.addCurve(to: CGPoint(x: 396.42, y: 214.52), controlPoint1: CGPoint(x: 401.16, y: 211.98), controlPoint2: CGPoint(x: 400.39, y: 212.39))
        path0Path.addCurve(to: CGPoint(x: 394.16, y: 215.73), controlPoint1: CGPoint(x: 395.66, y: 214.92), controlPoint2: CGPoint(x: 394.64, y: 215.47))
        path0Path.addCurve(to: CGPoint(x: 391.84, y: 216.98), controlPoint1: CGPoint(x: 393.67, y: 216), controlPoint2: CGPoint(x: 392.63, y: 216.56))
        path0Path.addCurve(to: CGPoint(x: 389.44, y: 218.28), controlPoint1: CGPoint(x: 391.06, y: 217.4), controlPoint2: CGPoint(x: 389.98, y: 217.98))
        path0Path.addCurve(to: CGPoint(x: 385.27, y: 220.53), controlPoint1: CGPoint(x: 388.46, y: 218.82), controlPoint2: CGPoint(x: 386.92, y: 219.65))
        path0Path.addCurve(to: CGPoint(x: 383.4, y: 221.54), controlPoint1: CGPoint(x: 384.78, y: 220.79), controlPoint2: CGPoint(x: 383.94, y: 221.25))
        path0Path.addCurve(to: CGPoint(x: 381.04, y: 222.82), controlPoint1: CGPoint(x: 382.86, y: 221.84), controlPoint2: CGPoint(x: 381.8, y: 222.41))
        path0Path.addCurve(to: CGPoint(x: 378.29, y: 224.29), controlPoint1: CGPoint(x: 380.29, y: 223.22), controlPoint2: CGPoint(x: 379.05, y: 223.89))
        path0Path.addCurve(to: CGPoint(x: 373.89, y: 226.66), controlPoint1: CGPoint(x: 376.77, y: 225.11), controlPoint2: CGPoint(x: 374.99, y: 226.07))
        path0Path.addCurve(to: CGPoint(x: 371.98, y: 227.7), controlPoint1: CGPoint(x: 373.5, y: 226.88), controlPoint2: CGPoint(x: 372.64, y: 227.34))
        path0Path.addCurve(to: CGPoint(x: 369.58, y: 229.01), controlPoint1: CGPoint(x: 371.32, y: 228.06), controlPoint2: CGPoint(x: 370.24, y: 228.65))
        path0Path.addCurve(to: CGPoint(x: 367.67, y: 230.05), controlPoint1: CGPoint(x: 368.92, y: 229.37), controlPoint2: CGPoint(x: 368.06, y: 229.84))
        path0Path.addCurve(to: CGPoint(x: 365.96, y: 230.98), controlPoint1: CGPoint(x: 367.28, y: 230.26), controlPoint2: CGPoint(x: 366.51, y: 230.68))
        path0Path.addLine(to: CGPoint(x: 364.97, y: 231.52))
        path0Path.addLine(to: CGPoint(x: 364.85, y: 227.78))
        path0Path.addCurve(to: CGPoint(x: 364.73, y: 219.66), controlPoint1: CGPoint(x: 364.79, y: 225.72), controlPoint2: CGPoint(x: 364.73, y: 222.06))
        path0Path.addCurve(to: CGPoint(x: 357.99, y: 193.33), controlPoint1: CGPoint(x: 364.72, y: 206.5), controlPoint2: CGPoint(x: 362.67, y: 198.49))
        path0Path.addCurve(to: CGPoint(x: 357.15, y: 192.31), controlPoint1: CGPoint(x: 357.68, y: 192.99), controlPoint2: CGPoint(x: 357.3, y: 192.53))
        path0Path.addCurve(to: CGPoint(x: 350.66, y: 187.41), controlPoint1: CGPoint(x: 356.44, y: 191.29), controlPoint2: CGPoint(x: 352.92, y: 188.63))
        path0Path.addCurve(to: CGPoint(x: 329.8, y: 183.48), controlPoint1: CGPoint(x: 345, y: 184.37), controlPoint2: CGPoint(x: 339.14, y: 183.26))
        path0Path.close()
        ////////////////////////////////////////////////
        let path1Path = UIBezierPath()
        path1Path.move(to: CGPoint(x: 241.25, y: 237.5))
        path1Path.addCurve(to: CGPoint(x: 235.93, y: 241.94), controlPoint1: CGPoint(x: 238.78, y: 238.27), controlPoint2: CGPoint(x: 237.07, y: 239.69))
        path1Path.addLine(to: CGPoint(x: 235.22, y: 243.34))
        path1Path.addLine(to: CGPoint(x: 235.18, y: 286.73))
        path1Path.addCurve(to: CGPoint(x: 235.41, y: 331.1), controlPoint1: CGPoint(x: 235.13, y: 326.02), controlPoint2: CGPoint(x: 235.16, y: 330.21))
        path1Path.addCurve(to: CGPoint(x: 249.3, y: 335.08), controlPoint1: CGPoint(x: 237.17, y: 337.12), controlPoint2: CGPoint(x: 244.26, y: 339.16))
        path1Path.addCurve(to: CGPoint(x: 252.13, y: 332.85), controlPoint1: CGPoint(x: 250.45, y: 334.15), controlPoint2: CGPoint(x: 250.49, y: 334.12))
        path1Path.addCurve(to: CGPoint(x: 256.64, y: 329.31), controlPoint1: CGPoint(x: 253.69, y: 331.64), controlPoint2: CGPoint(x: 253.87, y: 331.49))
        path1Path.addCurve(to: CGPoint(x: 259.66, y: 326.95), controlPoint1: CGPoint(x: 257.67, y: 328.5), controlPoint2: CGPoint(x: 259.03, y: 327.44))
        path1Path.addCurve(to: CGPoint(x: 261.15, y: 325.79), controlPoint1: CGPoint(x: 260.29, y: 326.47), controlPoint2: CGPoint(x: 260.96, y: 325.94))
        path1Path.addCurve(to: CGPoint(x: 262.05, y: 325.06), controlPoint1: CGPoint(x: 261.34, y: 325.64), controlPoint2: CGPoint(x: 261.74, y: 325.31))
        path1Path.addCurve(to: CGPoint(x: 263.76, y: 323.73), controlPoint1: CGPoint(x: 262.35, y: 324.82), controlPoint2: CGPoint(x: 263.12, y: 324.22))
        path1Path.addCurve(to: CGPoint(x: 265.18, y: 322.63), controlPoint1: CGPoint(x: 264.39, y: 323.25), controlPoint2: CGPoint(x: 265.03, y: 322.75))
        path1Path.addCurve(to: CGPoint(x: 266.88, y: 321.29), controlPoint1: CGPoint(x: 265.32, y: 322.51), controlPoint2: CGPoint(x: 266.09, y: 321.91))
        path1Path.addCurve(to: CGPoint(x: 268.93, y: 319.7), controlPoint1: CGPoint(x: 267.67, y: 320.68), controlPoint2: CGPoint(x: 268.59, y: 319.96))
        path1Path.addCurve(to: CGPoint(x: 270.97, y: 318.1), controlPoint1: CGPoint(x: 269.26, y: 319.43), controlPoint2: CGPoint(x: 270.18, y: 318.71))
        path1Path.addCurve(to: CGPoint(x: 275.49, y: 314.55), controlPoint1: CGPoint(x: 272.55, y: 316.87), controlPoint2: CGPoint(x: 272.77, y: 316.7))
        path1Path.addCurve(to: CGPoint(x: 278.5, y: 312.2), controlPoint1: CGPoint(x: 276.52, y: 313.74), controlPoint2: CGPoint(x: 277.87, y: 312.68))
        path1Path.addCurve(to: CGPoint(x: 279.99, y: 311.03), controlPoint1: CGPoint(x: 279.13, y: 311.71), controlPoint2: CGPoint(x: 279.8, y: 311.19))
        path1Path.addCurve(to: CGPoint(x: 280.89, y: 310.31), controlPoint1: CGPoint(x: 280.18, y: 310.88), controlPoint2: CGPoint(x: 280.59, y: 310.55))
        path1Path.addCurve(to: CGPoint(x: 282.6, y: 308.98), controlPoint1: CGPoint(x: 281.2, y: 310.06), controlPoint2: CGPoint(x: 281.96, y: 309.46))
        path1Path.addCurve(to: CGPoint(x: 284.02, y: 307.87), controlPoint1: CGPoint(x: 283.24, y: 308.49), controlPoint2: CGPoint(x: 283.88, y: 307.99))
        path1Path.addCurve(to: CGPoint(x: 285.73, y: 306.54), controlPoint1: CGPoint(x: 284.17, y: 307.75), controlPoint2: CGPoint(x: 284.94, y: 307.15))
        path1Path.addCurve(to: CGPoint(x: 287.77, y: 304.94), controlPoint1: CGPoint(x: 286.52, y: 305.93), controlPoint2: CGPoint(x: 287.44, y: 305.21))
        path1Path.addCurve(to: CGPoint(x: 289.81, y: 303.34), controlPoint1: CGPoint(x: 288.1, y: 304.68), controlPoint2: CGPoint(x: 289.02, y: 303.96))
        path1Path.addCurve(to: CGPoint(x: 294.33, y: 299.79), controlPoint1: CGPoint(x: 291.39, y: 302.11), controlPoint2: CGPoint(x: 291.61, y: 301.94))
        path1Path.addCurve(to: CGPoint(x: 297.36, y: 297.44), controlPoint1: CGPoint(x: 295.36, y: 298.99), controlPoint2: CGPoint(x: 296.72, y: 297.92))
        path1Path.addCurve(to: CGPoint(x: 298.71, y: 296.36), controlPoint1: CGPoint(x: 297.99, y: 296.95), controlPoint2: CGPoint(x: 298.6, y: 296.47))
        path1Path.addCurve(to: CGPoint(x: 299.85, y: 295.47), controlPoint1: CGPoint(x: 298.82, y: 296.26), controlPoint2: CGPoint(x: 299.34, y: 295.86))
        path1Path.addCurve(to: CGPoint(x: 305, y: 287.29), controlPoint1: CGPoint(x: 303.9, y: 292.39), controlPoint2: CGPoint(x: 305, y: 290.65))
        path1Path.addCurve(to: CGPoint(x: 300.73, y: 279.63), controlPoint1: CGPoint(x: 305, y: 284.02), controlPoint2: CGPoint(x: 303.92, y: 282.08))
        path1Path.addCurve(to: CGPoint(x: 297.71, y: 277.27), controlPoint1: CGPoint(x: 300.1, y: 279.14), controlPoint2: CGPoint(x: 298.74, y: 278.08))
        path1Path.addCurve(to: CGPoint(x: 293.19, y: 273.73), controlPoint1: CGPoint(x: 294.99, y: 275.13), controlPoint2: CGPoint(x: 294.77, y: 274.95))
        path1Path.addCurve(to: CGPoint(x: 291.15, y: 272.12), controlPoint1: CGPoint(x: 292.4, y: 273.11), controlPoint2: CGPoint(x: 291.48, y: 272.39))
        path1Path.addCurve(to: CGPoint(x: 289.1, y: 270.53), controlPoint1: CGPoint(x: 290.81, y: 271.86), controlPoint2: CGPoint(x: 289.89, y: 271.14))
        path1Path.addCurve(to: CGPoint(x: 287.4, y: 269.19), controlPoint1: CGPoint(x: 288.31, y: 269.91), controlPoint2: CGPoint(x: 287.55, y: 269.31))
        path1Path.addCurve(to: CGPoint(x: 285.98, y: 268.09), controlPoint1: CGPoint(x: 287.25, y: 269.07), controlPoint2: CGPoint(x: 286.61, y: 268.58))
        path1Path.addCurve(to: CGPoint(x: 284.27, y: 266.76), controlPoint1: CGPoint(x: 285.34, y: 267.6), controlPoint2: CGPoint(x: 284.57, y: 267))
        path1Path.addCurve(to: CGPoint(x: 283.37, y: 266.03), controlPoint1: CGPoint(x: 283.97, y: 266.51), controlPoint2: CGPoint(x: 283.56, y: 266.19))
        path1Path.addCurve(to: CGPoint(x: 281.88, y: 264.87), controlPoint1: CGPoint(x: 283.18, y: 265.88), controlPoint2: CGPoint(x: 282.51, y: 265.36))
        path1Path.addCurve(to: CGPoint(x: 278.87, y: 262.52), controlPoint1: CGPoint(x: 281.25, y: 264.39), controlPoint2: CGPoint(x: 279.89, y: 263.33))
        path1Path.addCurve(to: CGPoint(x: 274.35, y: 258.97), controlPoint1: CGPoint(x: 276.15, y: 260.37), controlPoint2: CGPoint(x: 275.93, y: 260.2))
        path1Path.addCurve(to: CGPoint(x: 272.3, y: 257.37), controlPoint1: CGPoint(x: 273.56, y: 258.35), controlPoint2: CGPoint(x: 272.64, y: 257.63))
        path1Path.addCurve(to: CGPoint(x: 270.26, y: 255.77), controlPoint1: CGPoint(x: 271.97, y: 257.11), controlPoint2: CGPoint(x: 271.05, y: 256.39))
        path1Path.addCurve(to: CGPoint(x: 268.56, y: 254.44), controlPoint1: CGPoint(x: 269.47, y: 255.16), controlPoint2: CGPoint(x: 268.7, y: 254.56))
        path1Path.addCurve(to: CGPoint(x: 267.13, y: 253.34), controlPoint1: CGPoint(x: 268.41, y: 254.32), controlPoint2: CGPoint(x: 267.77, y: 253.82))
        path1Path.addCurve(to: CGPoint(x: 265.43, y: 252), controlPoint1: CGPoint(x: 266.5, y: 252.85), controlPoint2: CGPoint(x: 265.73, y: 252.25))
        path1Path.addCurve(to: CGPoint(x: 264.53, y: 251.28), controlPoint1: CGPoint(x: 265.12, y: 251.76), controlPoint2: CGPoint(x: 264.72, y: 251.43))
        path1Path.addCurve(to: CGPoint(x: 263.04, y: 250.12), controlPoint1: CGPoint(x: 264.34, y: 251.12), controlPoint2: CGPoint(x: 263.67, y: 250.6))
        path1Path.addCurve(to: CGPoint(x: 260.02, y: 247.76), controlPoint1: CGPoint(x: 262.41, y: 249.63), controlPoint2: CGPoint(x: 261.05, y: 248.57))
        path1Path.addCurve(to: CGPoint(x: 255.5, y: 244.21), controlPoint1: CGPoint(x: 257.3, y: 245.62), controlPoint2: CGPoint(x: 257.08, y: 245.44))
        path1Path.addCurve(to: CGPoint(x: 253.46, y: 242.61), controlPoint1: CGPoint(x: 254.71, y: 243.6), controlPoint2: CGPoint(x: 253.79, y: 242.88))
        path1Path.addCurve(to: CGPoint(x: 251.42, y: 241.02), controlPoint1: CGPoint(x: 253.12, y: 242.35), controlPoint2: CGPoint(x: 252.21, y: 241.63))
        path1Path.addCurve(to: CGPoint(x: 249.62, y: 239.6), controlPoint1: CGPoint(x: 250.62, y: 240.4), controlPoint2: CGPoint(x: 249.82, y: 239.77))
        path1Path.addCurve(to: CGPoint(x: 241.25, y: 237.5), controlPoint1: CGPoint(x: 247.11, y: 237.5), controlPoint2: CGPoint(x: 243.86, y: 236.68))
        path1Path.close()
        path0Path.usesEvenOddFillRule = true
        fillColor9.setFill()
        path0Path.fill()
        UIColor.gray.setFill()
        path0Path.fill()
        UIColor.black.setStroke()
        path0Path.lineWidth = 1
        path0Path.stroke()
        
        layer.path = translate(path: path0Path.cgPath, by: CGPoint(x: -70, y: 0))
        layer.frame = view.bounds
        layer.strokeColor = UIColor(hexString: "#FF9300").cgColor
        layer.lineWidth = 5
        layer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(layer)
        
        
        layer2.path = translate(path: path1Path.cgPath, by: CGPoint(x: -70, y: 0))
        layer2.strokeColor = UIColor(hexString: "#FF9300").cgColor
        layer2.lineWidth = 5
        layer2.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(layer2)
        
        
        
        
        view.clipsToBounds = true
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 1.25
        layer.add(animation, forKey: "line")
        layer2.add(animation, forKey: "line")
        var nsTimerObject:Timer = Timer.scheduledTimer(timeInterval: 1.25, target: self, selector:#selector(iGotCall(sender:)), userInfo: nil, repeats:false)
        
    }
    @objc func iGotCall(sender: Timer) {
        layer.fillColor = UIColor.yellow.cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        // make sure to use .cgColor
        gradientLayer.colors = [UIColor(hexString: "FFBF17").cgColor, UIColor(hexString: "FF5672").cgColor]
        gradientLayer.frame = view.bounds
        gradientLayer.mask = layer
        
        view.layer.addSublayer(gradientLayer)
        
        // Corner radius
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        layer2.fillColor = UIColor.white.cgColor
        layer2.strokeColor = UIColor.clear.cgColor
        view.layer.insertSublayer(layer2, above: layer)
        var nsTimerObject:Timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector:#selector(toLoginScreen(sender:)), userInfo: nil, repeats:false)
    }
    
    @objc func toLoginScreen(sender: Timer) {
        self.performSegue(withIdentifier: "toLogin", sender: self)
    }
    
    
    func translate(path : CGPath?, by point: CGPoint) -> CGPath? {
        
        let bezeirPath = UIBezierPath()
        guard let prevPath = path else {
            return nil
        }
        bezeirPath.cgPath = prevPath
        bezeirPath.apply(CGAffineTransform(translationX: point.x, y: point.y))
        
        return bezeirPath.cgPath
    }
    
    
    
    
    
}
