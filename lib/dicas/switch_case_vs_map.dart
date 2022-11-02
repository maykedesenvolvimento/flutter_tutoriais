// Use um Map:
String obterCaloriasMap(String fruta) {
  Map<String, String> caloriasPorFruta = {
    'Abacaxi': '48 kcal',
    'Kiwi': '51 kcal',
    'Banana': '95 kcal',
    'Avelã': '207 kcal',
    'Pêssego': '31 kcal',
  };

  return caloriasPorFruta[fruta] ?? 'Não encontrado!';
}

// Ao invés de um Switch case:
String obterCaloriasSwitchCase(String fruta) {
  switch (fruta) {
    case 'Abacaxi':
      return '48 kcal';
    case 'Kiwi':
      return '51 kcal';
    case 'Banana':
      return '95 kcal';
    case 'Avelã':
      return '207 kcal';
    case 'Pêssego':
      return '31 kcal';
    default:
      return 'Não encontrado!';
  }
}
