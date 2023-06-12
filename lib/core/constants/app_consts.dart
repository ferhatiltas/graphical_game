class ApplicationConstants {
  static ApplicationConstants? _instance;
  static ApplicationConstants get instance {
    _instance ??= ApplicationConstants._init();
    return _instance!;
  }

  ApplicationConstants._init();
  final String onboardTitle1 = "Grafik Bulmacaları";
  final String onboardDescription1 =
      "Eğlenceli grafiklerle dolu bulmacalarla çocukların matematiksel yeteneklerini geliştirdikleri keyifli bir uygulama";
  final String onboardTitle2 = "Renkli Grafik Analizi";
  final String onboardDescription2 =
      "Çocuklar, renkli grafikler aracılığıyla matematiksel becerilerini geliştirirken veri analizi ve yorumlama yeteneklerini keşfediyorlar.";
  final String onboardTitle3 = "Grafiklerle Matematik Oyunları";
  final String onboardDescription3 =
      'Bu uygulama, çocukların matematiksel kavramları eğlenceli oyunlarla grafikler üzerinden öğrenmelerini sağlayan interaktif bir deneyim sunuyor.';
}
