import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:number_puzzle/core/base/state/base_state.dart';
import 'package:number_puzzle/core/constants/image_constants.dart';
import 'package:number_puzzle/features/game/model/game_model.dart';
import 'package:number_puzzle/widgets/snackbar/custom_snackbar.dart';
import 'package:sizer/sizer.dart';

class GameView extends StatefulWidget {
  const GameView({super.key});

  @override
  State<GameView> createState() => _GameViewState();
}

class _GameViewState extends BaseState<GameView> {
  List<GameModel> gameModel = [];
  GroupController controller = GroupController();
  @override
  void initState() {
    super.initState();
    gameModel = [
      GameModel(
          imageName: ImageConstants.instance.one,
          a: 'İnek',
          b: 'Koyun',
          c: 'Hindi',
          d: 'Tavuk',
          trueAnswer: 4,
          question:
              'Yukarıdaki sütun grafiğinde bir çiftlikte bulunan hayvan sayıları belirtilmiştir.( Aşağıdaki ilk 6 soruyu grafiğe göre cevaplayınız. ) Sayısı en fazla olan hayvan hangisidir ?'),
      GameModel(
          imageName: ImageConstants.instance.two,
          a: '200',
          b: '150',
          c: '100',
          d: '50',
          trueAnswer: 2,
          question: 'Çiftlikteki toplam hayvan sayısı kaçtır?'),
      GameModel(
          imageName: ImageConstants.instance.three,
          a: '120',
          b: '118',
          c: '240',
          d: '1164',
          trueAnswer: 3,
          question: 'Çiftlikte bir inekten günde 12 litre süt alınıyor buna göre bütün ineklerden iki günde kaç litre süt alınır ?'),
      GameModel(
          imageName: ImageConstants.instance.four,
          a: '1440',
          b: '840',
          c: '720',
          d: '640',
          trueAnswer: 1,
          question: 'Çiftliğin sahibi hindileri tanesi 30 TL den satmıştır. Çiftçi bu satıştan kaç TL kazanmıştır ?'),
      GameModel(
          imageName: ImageConstants.instance.five,
          a: '40 TL',
          b: '1200 TL',
          c: '1000 TL',
          d: '500 TL',
          trueAnswer: 2,
          question: 'Çiftliğin sahibi hindileri tanesi 30 TL den satmıştır. Çiftçi bu satıştan kaç TL kazanmıştır ?'),
      GameModel(
          imageName: ImageConstants.instance.one,
          a: '10.000 TL',
          b: '8.000 TL',
          c: '6.000 TL',
          d: '4.000 TL',
          trueAnswer: 1,
          question:
              'Çiftlikteki bir ineğin fiyatı 4 keçinin fiyatına eşittir. Bir ineğin fiyatı 2.000 TL ise çiftlikteki bütün keçilerin fiyatı kaç TL dir ?'),
      GameModel(
          imageName: ImageConstants.instance.seven,
          a: '80',
          b: '100',
          c: '160',
          d: '200',
          trueAnswer: 4,
          question:
              'Grafikte Ahmet Faruk’un bir hafta boyunca okuduğu kitapların sayfa sayısı belirtilmiştir( Aşağıdaki 7, 8, 9, 10. soruları grafiğe göre cevaplayınız. ) Hafta sonu okuduğu sayfa sayısı hafta içi okuduğu sayfa sayısından ne kadar eksiktir ?'),
      GameModel(
          imageName: ImageConstants.instance.seven,
          a: '1450',
          b: '1200',
          c: '630',
          d: '890',
          trueAnswer: 2,
          question: 'Her gün en fazla okuduğu gün kadar kitap okusaydı hafta boyunca toplam kaç sayfa okurdu ?'),
      GameModel(
          imageName: ImageConstants.instance.seven,
          a: 'Salı',
          b: 'Çarşamba',
          c: 'Perşembe',
          d: 'Cumartesi',
          trueAnswer: 4,
          question: 'Hangi gün pazar gününden 4 kat daha fazla sayfa okumuştur ?'),
    ];
  }

  final Color failedSnackbarBackgroundColor = const Color(0xFFFFF2F2);
  final Color failedSnackbarBorderColor = const Color(0xFFEE3025);
  final Color successSnackbarBackgroundColor = const Color(0xFFCDE8C7);
  final Color successSnackbarBorderColor = const Color(0xFF49AE0F);
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 90.h,
              child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _pageController,
                  itemCount: gameModel.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Image.asset(
                          gameModel[index].imageName,
                          height: 30.h,
                        ),
                        Text(
                          gameModel[index].question,
                          style: TextStyle(fontSize: 13.sp),
                        ),
                        SimpleGroupedCheckbox<int>(
                          controller: controller,
                          itemsTitle: [gameModel[index].a, gameModel[index].b, gameModel[index].c, gameModel[index].d],
                          values: const [1, 2, 3, 4],
                          groupStyle: GroupStyle(activeColor: Colors.black, itemTitleStyle: const TextStyle(fontSize: 13)),
                          checkFirstElement: false,
                        ),
                        SizedBox(
                          child: CupertinoButton.filled(
                            borderRadius: BorderRadius.all(Radius.circular(2.5.h)),
                            onPressed: () {
                              if (controller.selectedItem.toString() == 'null') {
                                CustomSnackBar().snackBar(
                                    context: context,
                                    message: 'Lütfen bir cevap seçiniz!',
                                    icon: Icons.error,
                                    backgroundColor: failedSnackbarBackgroundColor,
                                    borderColor: failedSnackbarBorderColor);
                              } else if (controller.selectedItem.toString() != gameModel[index].trueAnswer.toString()) {
                                CustomSnackBar().snackBar(
                                    context: context,
                                    message: 'Hatalı Cevap Seçtiniz',
                                    icon: Icons.error,
                                    backgroundColor: failedSnackbarBackgroundColor,
                                    borderColor: failedSnackbarBorderColor);
                              } else {
                                CustomSnackBar().snackBar(
                                    context: context,
                                    message: 'Tebrikler!',
                                    icon: Icons.error,
                                    backgroundColor: successSnackbarBackgroundColor,
                                    borderColor: successSnackbarBorderColor);
                                _pageController.nextPage(duration: Duration(milliseconds: 400), curve: Curves.easeIn);
                              }
                            },
                            child: Text(
                              'Devam Et',
                              style: TextStyle(fontSize: 15.sp, fontFamily: fontsConstants.AVENIR_MEDIUM),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            )),
      ),
    );
  }
}
