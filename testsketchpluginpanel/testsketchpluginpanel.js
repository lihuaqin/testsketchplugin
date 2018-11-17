/*
// To load this framework, add the following code in your manifest.json

"commands": [
:
:
{
    "script" : "testsketchpluginpanel.framework/testsketchpluginpanel.js",
    "handlers" : {
        "actions" : {
            "Startup" : "onStartup",
            "OpenDocument":"onOpenDocument",
            "SelectionChanged.finish" : "onSelectionChanged"
        }
    }
}
]
*/

var onStartup = function(context) {
  var testsketchpluginpanel_FrameworkPath = testsketchpluginpanel_FrameworkPath || COScript.currentCOScript().env().scriptURL.path().stringByDeletingLastPathComponent().stringByDeletingLastPathComponent();
  var testsketchpluginpanel_Log = testsketchpluginpanel_Log || log;
  (function() {
    var mocha = Mocha.sharedRuntime();
    var frameworkName = "testsketchpluginpanel";
    var directory = testsketchpluginpanel_FrameworkPath;
    if (mocha.valueForKey(frameworkName)) {
      testsketchpluginpanel_Log("😎 loadFramework: `" + frameworkName + "` already loaded.");
      return true;
    } else if ([mocha loadFrameworkWithName:frameworkName inDirectory:directory]) {
      testsketchpluginpanel_Log("✅ loadFramework: `" + frameworkName + "` success!");
      mocha.setValue_forKey_(true, frameworkName);
      return true;
    } else {
      testsketchpluginpanel_Log("❌ loadFramework: `" + frameworkName + "` failed!: " + directory + ". Please define testsketchpluginpanel_FrameworkPath if you're trying to @import in a custom plugin");
      return false;
    }
  })();
};

var onSelectionChanged = function(context) {
  testsketchpluginpanel.onSelectionChanged(context);
};
