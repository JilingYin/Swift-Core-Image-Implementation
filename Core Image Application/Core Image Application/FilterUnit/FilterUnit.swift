//
//  FilterUnit.swift
//  Core Image Application
//
//  Created by 颜值怪兽 on 2018/11/26.
//  Copyright © 2018 颜值怪兽. All rights reserved.
//

import Cocoa

class FilterUnit: NSViewController {
    
    @IBOutlet weak var message: NSTextField!
    @IBOutlet weak var slider1: NSSlider!
    @IBOutlet weak var sliderLabel1: NSTextField!
    @IBOutlet weak var slider2: NSSlider!
    @IBOutlet weak var sliderLabel2: NSTextField!
    @IBOutlet weak var slider3: NSSlider!
    @IBOutlet weak var sliderLabel3: NSTextField!
    
    private var imageUnit: ImageUnit?
    private var resultUnit: ResultUnit?
    var imageFilterCollection:[ImageFilter] = []
    let context = CIContext()
    var filter: String?
    var ciImage: CIImage?
    
    private func sliderNum(_ inputNumberArray: [Int] ) {
        
        slider1.isHidden = true
        sliderLabel1.isHidden = true
        slider2.isHidden = true
        sliderLabel2.isHidden = true
        slider3.isHidden = true
        sliderLabel3.isHidden = true
        
        if inputNumberArray.contains(1) {
            slider1.isHidden = false
            sliderLabel1.isHidden = false
        }
        if inputNumberArray.contains(2) {
            slider2.isHidden = false
            sliderLabel2.isHidden = false
        }
        if inputNumberArray.contains(3) {
            slider3.isHidden = false
            sliderLabel3.isHidden = false
        }
        
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let parent = self.parent{
            
            for controller in parent.children{
                
                if let neededController = controller as? ImageUnit{
                    imageUnit = neededController
                    
                }else if let neededController = controller as? ResultUnit{
                    resultUnit = neededController
                }
            }
        }
        
        message.stringValue = ""
        
        let inputNum: [Int] = []
        sliderNum(inputNum)
        
    }
    
    func setSliders() {
        
        switch filter {
            
        case "CIBoxBlur":
            
            let inputNum: [Int] = [1]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Radius"
            slider1.minValue = 0
            slider1.maxValue = 100
            slider1.doubleValue = 60
            
        case "CIDiscBlur":
            
            let inputNum: [Int] = [1]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Radius"
            slider1.minValue = 0
            slider1.maxValue = 60
            slider1.doubleValue = 20
            
        case "CIGaussianBlur":
            
            let inputNum: [Int] = [1]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Radius"
            slider1.minValue = 0
            slider1.maxValue = 60
            slider1.doubleValue = 20
            
        case "CIMotionBlur":
            
            let inputNum: [Int] = [1, 2]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Radius"
            slider1.minValue = 0
            slider1.maxValue = 60
            slider1.doubleValue = 20
            
            sliderLabel2.stringValue = "Angle"
            slider2.minValue = 0
            slider2.maxValue = 90
            slider2.doubleValue = 0
            
        case "CIZoomBlur":
            
            let inputNum: [Int] = [1, 2, 3]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "CenterX"
            slider1.minValue = 0
            slider1.maxValue = 200
            slider1.doubleValue = 100
            
            sliderLabel2.stringValue = "CenterY"
            slider2.minValue = 0
            slider2.maxValue = 200
            slider2.doubleValue = 100
            
            sliderLabel3.stringValue = "Amount"
            slider3.minValue = 0
            slider3.maxValue = 10
            slider3.doubleValue = 5
            
        case "CIColorClamp":
            
            let inputNum: [Int] = [1]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "RGBChannelThreshold"
            slider1.minValue = 0
            slider1.maxValue = 1
            slider1.doubleValue = 0.2
            
        case "CIColorControls":
            
            let inputNum: [Int] = [1, 2, 3]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Saturation"
            slider1.minValue = 0
            slider1.maxValue = 2
            slider1.doubleValue = 1
            
            sliderLabel2.stringValue = "Brightness"
            slider2.minValue = -0.2
            slider2.maxValue = 0.2
            slider2.doubleValue = 0
            
            sliderLabel3.stringValue = "Contrast"
            slider3.minValue = 0.8
            slider3.maxValue = 1.2
            slider3.doubleValue = 1
            
        case "CIExposureAdjust":
            
            let inputNum: [Int] = [1]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "EV"
            slider1.minValue = 0
            slider1.maxValue = 1
            slider1.doubleValue = 0.4
            
        case "CIGammaAdjust":
            
            let inputNum: [Int] = [1]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Power"
            slider1.minValue = 0
            slider1.maxValue = 2
            slider1.doubleValue = 0.75
            
        case "CIHueAdjust":
            
            let inputNum: [Int] = [1]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Angle"
            slider1.minValue = 0
            slider1.maxValue = 1
            slider1.doubleValue = 0.4
            
        case "CIVibrance":
            
            let inputNum: [Int] = [1]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Amount"
            slider1.minValue = 0
            slider1.maxValue = 10
            slider1.doubleValue = 2
            
        case "CIColorPosterize":
            
            let inputNum: [Int] = [1]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Levels"
            slider1.minValue = 4
            slider1.maxValue = 10
            slider1.doubleValue = 6
            
        case "CISepiaTone":
            
            let inputNum: [Int] = [1]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Intensity"
            slider1.minValue = 0
            slider1.maxValue = 1
            slider1.doubleValue = 0.7
            
        case "CIVignette":
            
            let inputNum: [Int] = [1, 2]
            sliderNum(inputNum)
            
            sliderLabel1.stringValue = "Radius"
            slider1.minValue = 0
            slider1.maxValue = 10
            slider1.doubleValue = 2
            
            sliderLabel2.stringValue = "Intensity"
            slider2.minValue = 0
            slider2.maxValue = 10
            slider2.doubleValue = 8
            
        case "CIPhotoEffectChrome", "CIPhotoEffectFade", "CIPhotoEffectInstant", "CIPhotoEffectMono", "CIPhotoEffectNoir", "CIPhotoEffectProcess", "CIPhotoEffectTonal", "CIPhotoEffectTransfer", "CIMedianFilter", "CINoiseReduction", "CILinearToSRGBToneCurve", "CISRGBToneCurveToLinear":
            
            let inputNum: [Int] = []
            sliderNum(inputNum)
            
        default:
            return
        }
        
    }
    
    func addImageToCollection(filterName: String, imageDiscribe: String, image: NSImage) {
        
        let addedImage = ImageFilter(filterName: filterName, imageDiscribe: filterName+"\n\n"+imageDiscribe, image: image)
        imageFilterCollection.append(addedImage)
        
    }
    
    func normalBlurFilter(_ inputImage: CIImage, _ inputRadius: Double, _ filterName: String)-> NSImage {
        
        let filter = CIFilter(name: filterName)
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputRadius, forKey: kCIInputRadiusKey)
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: result!.extent)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func motionBlurFilter(_ inputImage: CIImage, _ inputRadius: Double, _ inputAngle: Double )-> NSImage {
        
        let filter = CIFilter(name: "CIMotionBlur")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputRadius, forKey: kCIInputRadiusKey)
        filter?.setValue(inputAngle, forKey: kCIInputAngleKey)
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: result!.extent)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func zoomBlurFilter(_ inputImage: CIImage, _ inputCenter: CIVector, _ inputAmount: Double)-> NSImage {
        
        let filter = CIFilter(name: "CIZoomBlur")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputCenter, forKey: kCIInputCenterKey)
        filter?.setValue(inputAmount, forKey: kCIInputAmountKey)
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: result!.extent)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func colorClamp(_ inputImage: CIImage, _ inputR: Double, _ inputG: Double, _ inputB: Double)-> NSImage {
        
        let filter = CIFilter(name: "CIColorClamp")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(CIVector(x: CGFloat(inputR) , y: CGFloat(inputG), z: CGFloat(inputB), w: 1), forKey: "inputMinComponents")
        filter?.setValue(CIVector(x: 1, y: 1, z: 1, w: 1), forKey: "inputMaxComponents")
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: inputImage.extent)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func colorControls(_ inputImage: CIImage, _ inputSaturation: Double, _ inputBrightness: Double, _ inputContrast: Double)-> NSImage {
        
        let filter = CIFilter(name: "CIColorControls")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputSaturation, forKey: kCIInputSaturationKey)
        filter?.setValue(inputBrightness, forKey: kCIInputBrightnessKey)
        filter?.setValue(inputContrast, forKey: kCIInputContrastKey)
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: result!.extent)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func exposureAdjust(_ inputImage: CIImage, _ inputEV: Double)-> NSImage {
        
        let filter = CIFilter(name: "CIExposureAdjust")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputEV, forKey: kCIInputEVKey)
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: inputImage.extent)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func gammaAdjust(_ inputImage: CIImage, _ inputPower: Double)-> NSImage {
        
        let filter = CIFilter(name: "CIGammaAdjust")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputPower, forKey: "inputPower")
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: inputImage.extent)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func hueAdjust(_ inputImage: CIImage, _ inputAngle: Double)-> NSImage {
        
        let filter = CIFilter(name: "CIHueAdjust")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputAngle, forKey: kCIInputAngleKey)
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: inputImage.extent)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func vibrance(_ inputImage: CIImage, _ inputAmount: Double)-> NSImage {
        
        let filter = CIFilter(name: "CIVibrance")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputAmount, forKey: kCIInputAmountKey)
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: inputImage.extent)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func colorPosterize(_ inputImage: CIImage, _ inputLevels: Double)-> NSImage {
        
        let filter = CIFilter(name: "CIColorPosterize")
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputLevels, forKey: "inputLevels")
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: inputImage.extent)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func sepiaTone(_ inputImage: CIImage, _ inputIntensity: Double)-> NSImage {
        
        let filter = CIFilter(name: "CISepiaTone")
        
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputIntensity, forKey: kCIInputIntensityKey)
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: (result?.extent)!)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func vignette(_ inputImage: CIImage, _ inputRadius: Double, _ inputIntensity: Double)-> NSImage {
        
        let filter = CIFilter(name: "CIVignette")
        
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        filter?.setValue(inputRadius, forKey: kCIInputRadiusKey)
        filter?.setValue(inputIntensity, forKey: kCIInputIntensityKey)
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: (result?.extent)!)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    func singleParamFilter(_ inputFilterName: String, _ inputImage: CIImage)-> NSImage {
        
        let filter = CIFilter(name: inputFilterName)
        filter?.setValue(inputImage, forKey: kCIInputImageKey)
        
        let result = filter?.outputImage!
        let cgImage = context.createCGImage(result!, from: (result?.extent)!)
        
        let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
        
        return nsImage
    }
    
    @IBAction func blur(_ sender: NSButton) {
        
        message.stringValue = "BlurFilter"
        
        let inputNum: [Int] = []
        sliderNum(inputNum)
        
        if imageUnit!.imageData != nil {
            
            ciImage = CIImage(data: Data(referencing: (imageUnit?.imageData)!) )
            
            imageFilterCollection.removeAll()
            
            addImageToCollection(filterName: "CIBoxBlur", imageDiscribe: "Blurs an image using a box-shaped convolution kernel.", image: normalBlurFilter(ciImage!, 60, "CIBoxBlur"))
            
            addImageToCollection(filterName: "CIDiscBlur", imageDiscribe: "Blurs an image using a disc-shaped convolution kernel.", image: normalBlurFilter(ciImage!, 20, "CIDiscBlur"))
            
            addImageToCollection(filterName: "CIGaussianBlur", imageDiscribe: "Spreads source pixels by an amount specified by a Gaussian distribution.", image: normalBlurFilter(ciImage!, 20, "CIGaussianBlur"))
            
            addImageToCollection(filterName: "CIMotionBlur", imageDiscribe: "Blurs an image to simulate the effect of using a camera that moves a specified angle and distance while capturing the image", image: motionBlurFilter(ciImage!, 20, 0))
            
            addImageToCollection(filterName: "CIZoomBlur", imageDiscribe: "Simulates the effect of zooming the camera while capturing the image.", image: zoomBlurFilter(ciImage!, CIVector(x: 150, y: 150), 5))
            
            resultUnit!.imageFilterCollection = self.imageFilterCollection
            
            resultUnit?.imageFilterCollectionView.reloadData()
        }else {
            
            return
            
        }
        
        
    }
    
    @IBAction func colorAdjustMent(_ sender: NSButton) {
        
        message.stringValue = "Color Adjustment"
        
        let inputNum: [Int] = []
        sliderNum(inputNum)
        
        if imageUnit!.imageData != nil {
            
            ciImage = CIImage(data: Data(referencing: (imageUnit?.imageData)!) )
            
            imageFilterCollection.removeAll()
            
            addImageToCollection(filterName: "CIColorClamp", imageDiscribe: "Modifies color values to keep them within a specified range.", image: colorClamp(ciImage!, 0.2, 0.2, 0.2) )
            
            addImageToCollection(filterName: "CIColorControls", imageDiscribe: "Adjusts saturation, brightness, and contrast values.", image: colorControls(ciImage!, 1, 0, 1) )
            
            addImageToCollection(filterName: "CIExposureAdjust", imageDiscribe: "Adjusts the exposure setting for an image similar to the way you control exposure for a camera when you change the F-stop.", image: exposureAdjust(ciImage!, 0.4))
            
            addImageToCollection(filterName: "CIGammaAdjust", imageDiscribe: "Adjusts midtone brightness.", image: gammaAdjust(ciImage!, 0.75))
            
            addImageToCollection(filterName: "CIHueAdjust", imageDiscribe: "Changes the overall hue, or tint, of the source pixels.", image: hueAdjust(ciImage!, 0.4))
            
            addImageToCollection(filterName: "CILinearToSRGBToneCurve", imageDiscribe: "Maps color intensity from a linear gamma curve to the sRGB color space.", image: singleParamFilter("CILinearToSRGBToneCurve", ciImage!))
            
            addImageToCollection(filterName: "CISRGBToneCurveToLinear", imageDiscribe: "Maps color intensity from the sRGB color space to a linear gamma curve.", image: singleParamFilter("CISRGBToneCurveToLinear", ciImage!))
            
            addImageToCollection(filterName: "CIVibrance", imageDiscribe: "Adjusts the saturation of an image while keeping pleasing skin tones.", image: vibrance(ciImage!, 2))
            
            
            resultUnit!.imageFilterCollection = self.imageFilterCollection
            resultUnit?.imageFilterCollectionView.reloadData()
            
            
        }else {
            
            return
            
        }
    }
    
    @IBAction func photoEffect(_ sender: NSButton) {
        
        message.stringValue = "Photo Effect Filter"
        
        let inputNum: [Int] = []
        sliderNum(inputNum)
        
        if imageUnit!.imageData != nil {
            
            ciImage = CIImage(data: Data(referencing: (imageUnit?.imageData)!) )
            
            imageFilterCollection.removeAll()
            
            addImageToCollection(filterName: "CIColorPosterize", imageDiscribe: "Remaps red, green, and blue color components to the number of brightness values you specify for each color component.", image: colorPosterize(ciImage!, 6))
            
            addImageToCollection(filterName: "CISepiaTone", imageDiscribe: "Maps the colors of an image to various shades of brown.", image: sepiaTone(ciImage!, 0.7))
            
            addImageToCollection(filterName: "CIVignette", imageDiscribe: "Reduces the brightness of an image at the periphery.", image: vignette(ciImage!, 2, 8))
            
            addImageToCollection(filterName: "CIPhotoEffectChrome", imageDiscribe: "Applies a preconfigured set of effects that imitate vintage photography film with exaggerated color.", image: singleParamFilter("CIPhotoEffectChrome", ciImage!))
            
            addImageToCollection(filterName: "CIPhotoEffectFade", imageDiscribe: "Applies a preconfigured set of effects that imitate vintage photography film with diminished color.", image: singleParamFilter("CIPhotoEffectFade", ciImage!))
            
            addImageToCollection(filterName: "CIPhotoEffectInstant", imageDiscribe: "Applies a preconfigured set of effects that imitate vintage photography film with distorted colors.", image: singleParamFilter("CIPhotoEffectInstant", ciImage!))
            
            addImageToCollection(filterName: "CIPhotoEffectMono", imageDiscribe: "Applies a preconfigured set of effects that imitate black-and-white photography film with low contrast.", image: singleParamFilter("CIPhotoEffectMono", ciImage!))
            
            addImageToCollection(filterName: "CIPhotoEffectNoir", imageDiscribe: "Applies a preconfigured set of effects that imitate black-and-white photography film with exaggerated contrast.", image: singleParamFilter("CIPhotoEffectNoir", ciImage!))
            
            addImageToCollection(filterName: "CIPhotoEffectProcess", imageDiscribe: "Applies a preconfigured set of effects that imitate vintage photography film with emphasized cool colors.", image: singleParamFilter("CIPhotoEffectProcess", ciImage!))
            
            addImageToCollection(filterName: "CIPhotoEffectTonal", imageDiscribe: "Applies a preconfigured set of effects that imitate black-and-white photography film without significantly altering contrast.", image: singleParamFilter("CIPhotoEffectTonal", ciImage!))
            
            addImageToCollection(filterName: "CIPhotoEffectTransfer", imageDiscribe: "Applies a preconfigured set of effects that imitate vintage photography film with emphasized warm colors.", image: singleParamFilter("CIPhotoEffectTransfer", ciImage!))
            
            addImageToCollection(filterName: "CIMedianFilter", imageDiscribe: "Computes the median value for a group of neighboring pixels and replaces each pixel value with the median.", image: singleParamFilter("CIMedianFilter", ciImage!))
            
            addImageToCollection(filterName: "CINoiseReduction", imageDiscribe: "Reduces noise using a threshold value to define what is considered noise.", image: singleParamFilter("CINoiseReduction", ciImage!))
            
            resultUnit!.imageFilterCollection = self.imageFilterCollection
            resultUnit?.imageFilterCollectionView.reloadData()
            
            
        }else {
            
            return
            
        }
    }
    
    
    @IBAction func detectingFaces(_ sender: NSButton) {
        
        message.stringValue = "Detect faces"
        
        let inputNum: [Int] = []
        sliderNum(inputNum)
        
        func detect(_ inputImage: CIImage ) {
            
            var totalFaces: Int = 0
            let dictionary = [CIDetectorAccuracy : CIDetectorAccuracyHigh]
            let detector = CIDetector(ofType: CIDetectorTypeFace, context: self.context,    options: dictionary )
            let faces = detector?.features(in: inputImage, options: [CIDetectorSmile : true])
         
            if !faces!.isEmpty {
                for face in faces as! [CIFaceFeature]{
            
                    totalFaces += 1
                    
                    let outputImage = inputImage.cropped(to: face.bounds)
                    let cgImage = context.createCGImage(outputImage, from: outputImage.extent)
             
                    let nsImage = NSImage(cgImage: cgImage!, size: NSZeroSize)
                    let faceImage = ImageFilter(filterName:"", imageDiscribe: "Face \(totalFaces)", image: nsImage)
                    imageFilterCollection.append(faceImage)
                    
                }
                message.stringValue = "There has \(totalFaces) face(s) in the image"
            }else {
                message.stringValue = "There has no face"
            }
        }
        
        if imageUnit!.imageData != nil {
            
            let image = CIImage(data: Data(referencing: (imageUnit?.imageData)!) )
            
            imageFilterCollection.removeAll()
            
            detect(image!)
            
            resultUnit!.imageFilterCollection = self.imageFilterCollection
            resultUnit?.imageFilterCollectionView.reloadData()
            
            
        }else {
            
            return
            
        }
    }
    
    
    @IBAction func openImage(_ sender: NSButton) {
        
        message.stringValue = "Open Image"
        
        let inputNum: [Int] = []
        sliderNum(inputNum)
       
        let panel = NSOpenPanel();
        
        panel.canChooseFiles = true
        panel.canChooseDirectories = true
        panel.showsResizeIndicator = true
        panel.allowedFileTypes = ["jpg","jpeg","png","bmp"]
        
        if panel.runModal() == NSApplication.ModalResponse.OK {
            
            if let url = panel.url {
                
                let imageLoaded = NSImage(byReferencing: url)
                
                imageUnit?.originalImage = imageLoaded
                imageUnit?.originalData = NSData(data: (imageLoaded.tiffRepresentation)!)
                
                imageUnit!.imageView.image = imageUnit?.originalImage
                imageUnit?.imageData = imageUnit?.originalData
                
                imageUnit!.imageHistory.insert(imageLoaded, at: 0)
                imageUnit?.imageCollectionView.reloadData()
                
                self.imageFilterCollection.removeAll()
                resultUnit!.imageFilterCollection = self.imageFilterCollection
                resultUnit?.imageFilterCollectionView.reloadData()
                
            }
        }
        
    }
    
    @IBAction func saveImage(_ sender: NSButton) {
        
        message.stringValue = "Save image"
        
        let inputNum: [Int] = []
        sliderNum(inputNum)
        
        let savePanel = NSSavePanel();
        
        savePanel.canCreateDirectories = true
        savePanel.treatsFilePackagesAsDirectories = true
        savePanel.showsResizeIndicator = true
        savePanel.allowedFileTypes = ["jpg","jpeg","png","bmp"]
        savePanel.allowsOtherFileTypes = true
        
        
        if savePanel.runModal() == NSApplication.ModalResponse.OK {
            
            if imageUnit!.imageView.image != nil {
                
                if let location = savePanel.url {
                    
                    imageUnit?.imageData!.write(to: location, atomically: true)
                    
                }
            }
        }
    }
    
    @IBAction func resetImage(_ sender: NSButton) {
        
        message.stringValue = "Reset image"
        
        let inputNum: [Int] = []
        sliderNum(inputNum)
        
        imageUnit?.imageView.image = imageUnit?.originalImage
        filter = nil
        slider1.isHidden = true
        sliderLabel1.isHidden = true
        slider2.isHidden = true
        sliderLabel2.isHidden = true
        slider3.isHidden = true
        sliderLabel3.isHidden = true
        
    }
    
    @IBAction func sliderValue1(_ sender: NSSlider) {
        
        switch filter {
            
        case "CIBoxBlur":
            imageUnit?.imageView.image = normalBlurFilter(ciImage!, slider1.doubleValue, "CIBoxBlur")
            
        case "CIDiscBlur":
            imageUnit?.imageView.image = normalBlurFilter(ciImage!, slider1.doubleValue, "CIDiscBlur")
            
        case "CIGaussianBlur":
            imageUnit?.imageView.image = normalBlurFilter(ciImage!, slider1.doubleValue, "CIGaussianBlur")
            
        case "CIMotionBlur":
            imageUnit?.imageView.image = motionBlurFilter(ciImage!, slider1.doubleValue, slider2.doubleValue)
            
        case "CIZoomBlur":
            imageUnit?.imageView.image = zoomBlurFilter(ciImage!, CIVector(x: CGFloat(slider1.doubleValue), y: CGFloat(slider2.doubleValue)), slider3.doubleValue)
            
        case "CIColorClamp":
            imageUnit?.imageView.image = colorClamp(ciImage!, slider1.doubleValue, slider1.doubleValue, slider1.doubleValue)
            
        case "CIColorControls":
            imageUnit?.imageView.image = colorControls(ciImage!, slider1.doubleValue, slider2.doubleValue, slider3.doubleValue)
            
        case "CIExposureAdjust":
            imageUnit?.imageView.image = exposureAdjust(ciImage!, slider1.doubleValue)
            
        case "CIGammaAdjust":
            imageUnit?.imageView.image = gammaAdjust(ciImage!, slider1.doubleValue)
            
        case "CIHueAdjust":
            imageUnit?.imageView.image = hueAdjust(ciImage!, slider1.doubleValue)
            
        case "CIVibrance":
            imageUnit?.imageView.image = vibrance(ciImage!, slider1.doubleValue)
            
        case "CIColorPosterize":
            imageUnit?.imageView.image = colorPosterize(ciImage!, slider1.doubleValue)
            
        case "CISepiaTone":
            imageUnit?.imageView.image = sepiaTone(ciImage!, slider1.doubleValue)
            
        case "CIVignette":
            imageUnit?.imageView.image = vignette(ciImage!, slider1.doubleValue, slider2.doubleValue)
            
        default:
            return
        }
    }
    
    @IBAction func sliderValue2(_ sender: NSSlider) {
        
        switch filter {
            
        case "CIMotionBlur":
            imageUnit?.imageView.image = motionBlurFilter(ciImage!, slider1.doubleValue, slider2.doubleValue)
            
        case "CIZoomBlur":
            imageUnit?.imageView.image = zoomBlurFilter(ciImage!, CIVector(x: CGFloat(slider1.doubleValue), y: CGFloat(slider2.doubleValue)), slider3.doubleValue)
            
        case "CIColorControls":
            imageUnit?.imageView.image = colorControls(ciImage!, slider1.doubleValue, slider2.doubleValue, slider3.doubleValue)
            
        case "CIVignette":
            imageUnit?.imageView.image = vignette(ciImage!, slider1.doubleValue, slider2.doubleValue)
            
        default:
            return
        }
    }
    
    @IBAction func sliderValue3(_ sender: NSSlider) {
        
        switch filter {
            
        case "CIZoomBlur":
            imageUnit?.imageView.image = zoomBlurFilter(ciImage!, CIVector(x: CGFloat(slider1.doubleValue), y: CGFloat(slider2.doubleValue)), slider3.doubleValue)
            
        case "CIColorControls":
            imageUnit?.imageView.image = colorControls(ciImage!, slider1.doubleValue, slider2.doubleValue, slider3.doubleValue)
            
        default:
            return
        }
    }

}
