import 'dart:io';
import 'package:yaml/yaml.dart';

void main() {
  // Abrir el archivo pubspec.yaml
  final File file = File('pubspec.yaml');
  final String yamlString = file.readAsStringSync();
  final YamlMap yaml = loadYaml(yamlString) as YamlMap;

  // Obtener y actualizar la versión
  final String currentVersion = yaml['version'] as String;
  final List<String> versionParts = currentVersion.split('+');
  final String baseVersion = versionParts[0];
  final int buildNumber = int.parse(versionParts[1]);

  final String newVersion = '$baseVersion+${buildNumber + 1}';

  // Reemplazar la versión en el archivo YAML
  final String updatedYamlString = yamlString.replaceAll('version: $currentVersion', 'version: $newVersion');

  // Guardar el archivo actualizado
  file.writeAsStringSync(updatedYamlString);
}
