import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var modelNameLabel: UILabel!
    @IBOutlet weak var iOSVersionLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var storageLabel: UILabel!
    @IBOutlet weak var batteryHealthLabel: UILabel!
    @IBOutlet weak var batteryLevelLabel: UILabel!
    @IBOutlet weak var cameraMegaPixelLabel: UILabel!
    // Add more outlets for other information

    override func viewDidLoad() {
        super.viewDidLoad()
        // Fetch device information
        fetchDeviceInformation()
    }

    func fetchDeviceInformation() {
        let device = UIDevice.current
        
        // Model Name & Model Number
        modelNameLabel.text = device.model
        // iOS Version
        iOSVersionLabel.text = device.systemVersion
        // Device’s Serial Number - Note: iOS does not provide direct access to the serial number for security reasons.
        // Storage
        if let totalSpace = FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())[.systemSize] as? Int64,
           let freeSpace = FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory())[.systemFreeSize] as? Int64 {
            storageLabel.text = "\(freeSpace / (1024 * 1024 * 1024)) GB Free of \(totalSpace / (1024 * 1024 * 1024)) GB"
        }
        // Battery Health (Maximum Capacity)
        let batteryHealth = BatteryHealth()
        batteryHealthLabel.text = "\(batteryHealth.maximumCapacity * 100)%"
        // Battery Level (Current charging level)
        batteryLevelLabel.text = "\(UIDevice.current.batteryLevel * 100)%"
        // Camera MegaPixel - Note: You may need to use AVFoundation framework to access camera-related information.
        // Processor (CPU) Information
        let processor = ProcessorInfo()
        // Assuming you have a ProcessorInfo class that retrieves CPU information
        // GPU Information
        let gpu = GPUInfo()
        // Assuming you have a GPUInfo class that retrieves GPU information
        // IMEI - Note: IMEI is not accessible on iOS devices due to privacy and security concerns.
    }
}

// Define structs or classes to retrieve BatteryHealth, ProcessorInfo, GPUInfo, etc.
// I work on Windows 10, but SWIFT is more familiar to the environment of Xcode(Xcode works mostly in MacOS which is of Apple).
// I use Windows from the starting of my career since 2016 - Present.
// I assure you that I shall leave no stone unturned in fulfilling my duties as an ios app developer.
