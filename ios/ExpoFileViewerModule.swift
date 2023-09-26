import Foundation  
import QuickLook  
import ExpoModulesCore  
  
public class ExpoQuickLookModule: Module {
  private var previewController: QLPreviewController?  
  private var dataSource: FileUrlDataSource?

  public func definition() -> ModuleDefinition {
    Name("ExpoQuicklookPreview")

    AsyncFunction("openPreviewAsync") { (fileUrl: String, promise: Promise) in
      guard let url = URL(string: fileUrl) else {  
        promise.reject("E_INVALID_URL", "Invalid file URL")  
        return  
      }  
      guard let filePermissions: EXFilePermissionModuleInterface =
        appContext?.legacyModule(implementing: EXFilePermissionModuleInterface.self)
      else {
        throw FilePermissionModuleException()
      }

      let grantedPermissions = filePermissions.getPathPermissions(url.relativePath)
      guard grantedPermissions.rawValue >= EXFileSystemPermissionFlags.read.rawValue else {
        throw FilePermissionException()
      }

      if self.previewController == nil {
        self.previewController = QLPreviewController()
      }

      self.dataSource = FileUrlDataSource(fileURL: url)
      previewController?.dataSource = self.dataSource

      // TODO: pass through previewController settings

      guard let currentViewcontroller = appContext?.utilities?.currentViewController() else {
        throw MissingCurrentViewControllerException()
      }

      currentViewcontroller.present(previewController, animated: true, completion: nil)
    }.runOnQueue(.main)
  }
}

class FileUrlDataSource: NSObject, QLPreviewControllerDataSource {  
  var fileURL: URL?  

  init(fileURL: URL?) {
    self.fileURL = fileURL
  }
    
  func numberOfPreviewItems(in controller: QLPreviewController) -> Int {  
    return self.fileURL != nil ? 1 : 0  
  }  
    
  func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {  
    return PreviewItem(withURL: self.fileURL ?? URL(fileURLWithPath: ""))  
  } 
}  

// TODO: do i need this
class PreviewItem: NSObject, QLPreviewItem {  
  var previewItemURL: URL?  
  
  init(withURL url: URL) {  
    self.previewItemURL = url  
    super.init()  
  }  
}  
