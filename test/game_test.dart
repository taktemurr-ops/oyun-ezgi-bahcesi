import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_ezgi_bahcesi/oyun_ezgi_bahcesi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(ezgiBahcesiConfig.title.length, 33);
    expect(ezgiBahcesiConfig.tagline.length, 33);
    for (final s in ezgiBahcesiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(ezgiBahcesiConfig.gameId, ezgiBahcesiId);
    expect(ezgiBahcesiRules.gameId, ezgiBahcesiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(ezgiBahcesiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: ezgiBahcesiId, optionalMechanics: ezgiBahcesiRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(ezgiBahcesiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
