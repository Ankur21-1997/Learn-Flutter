library globals;

bool debugMode = true;
bool showPageName = true;
bool showFunctionName = true;

void printF(String input) {
  if (!debugMode) return;

  final raw = StackTrace.current.toString().split('\n')[1];

  final fileName = _extractFileName(raw);
  final functionName = _extractFunctionName(raw);

  String prefix = "";

  if (showPageName) {
    prefix += fileName;
  }

  if (showFunctionName && functionName.isNotEmpty) {
    if (prefix.isNotEmpty) prefix += " -> ";
    prefix += functionName;
  }

  if (prefix.isNotEmpty) {
    print("$prefix -> $input");
  } else {
    print("-> $input");
  }
}


String _extractFileName(String line) {
  final match = RegExp(r'(\w+\.dart)').firstMatch(line);
  return match != null ? match.group(1)! : "UnknownPage";
}

String _extractFunctionName(String line) {
  // Extract something like "loginUser" from "#1      loginUser (package:app/login.dart:...)".
  final match = RegExp(r'#\d+\s+(\w+)').firstMatch(line);
  if (match == null) return "";
  final name = match.group(1)!;

  // Remove Flutter internal function names
  if (["build", "performRebuild", "createState"].contains(name)) return "";

  return name;
}
