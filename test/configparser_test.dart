import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:test/test.dart';
import 'package:dartfm/src/ConfigParser.dart';

String context = path.context.current;
Directory workingDirectory = new Directory('$context/test');

main() {
  test('default config path', () {
    final config = new ConfigParser();
    expect(config.getConfigFilePath(), "~/.config/cmus/dartfm.yml");
  });
  test('test config parsing', () {
    final configParser =
        new ConfigParser("${workingDirectory.path}/testconfig/valid.yml");
    configParser.parseConfig();
    ConfigData configs = configParser.getConfigData();
    expect(configs.username, "John Deer");
    expect(configs.key, "test key");
  });
}
