ARCHS = armv7 armv7s arm64
include theos/makefiles/common.mk

ADDITIONAL_CFLAGS = -fobjc-arc -Os -Qunused-arguments -Itemp -Wno-c++11-extensions -Xclang -fobjc-runtime-has-weak

SDKVERSION = 8.1
INCLUDE_SDKVERSION = 8.1
TARGET_IPHONEOS_DEPLOYMENT_VERSION = 8.1
TARGET_CC = xcrun -sdk iphoneos clang
TARGET_CXX = xcrun -sdk iphoneos clang++
TARGET_LD = xcrun -sdk iphoneos clang++
SHARED_CFLAGS = -fobjc-arc

TWEAK_NAME = FLEXInjected

# find ./FLEX -name \*.m -print

FLEXInjected_FILES = Tweak.xm temp/FLEXArgumentInputColorView.m temp/FLEXArgumentInputFontsPickerView.m temp/FLEXArgumentInputFontView.m temp/FLEXArgumentInputJSONObjectView.m temp/FLEXArgumentInputNotSupportedView.m temp/FLEXArgumentInputNumberView.m temp/FLEXArgumentInputStringView.m temp/FLEXArgumentInputStructView.m temp/FLEXArgumentInputSwitchView.m temp/FLEXArgumentInputTextView.m temp/FLEXArgumentInputView.m temp/FLEXArgumentInputViewFactory.m temp/FLEXDefaultEditorViewController.m temp/FLEXFieldEditorView.m temp/FLEXFieldEditorViewController.m temp/FLEXIvarEditorViewController.m temp/FLEXMethodCallingViewController.m temp/FLEXPropertyEditorViewController.m temp/FLEXExplorerToolbar.m temp/FLEXExplorerViewController.m temp/FLEXManager.m temp/FLEXToolbarItem.m temp/FLEXWindow.m temp/FLEXClassesTableViewController.m temp/FLEXFileBrowserSearchOperation.m temp/FLEXFileBrowserTableViewController.m temp/FLEXGlobalsTableViewController.m temp/FLEXInstancesTableViewController.m temp/FLEXLibrariesTableViewController.m temp/FLEXLiveObjectsTableViewController.m temp/FLEXWebViewController.m temp/FLEXSystemLogMessage.m temp/FLEXSystemLogTableViewCell.m temp/FLEXSystemLogTableViewController.m temp/FLEXArrayExplorerViewController.m temp/FLEXClassExplorerViewController.m temp/FLEXDefaultsExplorerViewController.m temp/FLEXDescriptionTableViewCell.m temp/FLEXDictionaryExplorerViewController.m temp/FLEXGlobalsTableViewControllerEntry.m temp/FLEXImageExplorerViewController.m temp/FLEXLayerExplorerViewController.m temp/FLEXObjectExplorerFactory.m temp/FLEXObjectExplorerViewController.m temp/FLEXSetExplorerViewController.m temp/FLEXViewControllerExplorerViewController.m temp/FLEXViewExplorerViewController.m temp/FLEXHeapEnumerator.m temp/FLEXResources.m temp/FLEXRuntimeUtility.m temp/FLEXUtility.m temp/FLEXHierarchyTableViewCell.m temp/FLEXHierarchyTableViewController.m temp/FLEXImagePreviewViewController.m temp/XMLDictionary.m
FLEXInjected_FRAMEWORKS = UIKit CoreGraphics QuartzCore MessageUI

BUNDLE_NAME = FLEXInjectedBundle
FLEXInjectedBundle_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries
include $(THEOS)/makefiles/bundle.mk

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"

flatten_flex:
	cp "`find ./FLEX -name "*.m"`" ./temp/
	cp "`find ./FLEX -name "*.h"`" ./temp/

