import 'package:yaml/yaml.dart';
import 'dart:io';

class ConfigData {
  String username;
  String key;
}

class ConfigParser {
  final defaultConfigPath = "~/.config/cmus/dartfm.yml";
  ConfigData configData;
  String configPath;

  ConfigParser([String configPath]) {
    configData = new ConfigData();
    if (configPath != null) {
      this.configPath = configPath;
    } else {
      this.configPath = this.defaultConfigPath;
    }
  }

  String getConfigFilePath() {
    return configPath;
  }

  void parseConfig() {
    final file = new File(this.getConfigFilePath());
    final yamlData = loadYaml(file.readAsStringSync());
    configData.username = yamlData['username'];
    configData.key = yamlData['key'];
  }

  ConfigData getConfigData() {
    return configData;
  }
}
