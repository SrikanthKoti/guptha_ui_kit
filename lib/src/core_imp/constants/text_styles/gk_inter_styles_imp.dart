import 'package:guptha_ui_kit/src/core/constants/gk_colors.dart';
import 'package:guptha_ui_kit/src/core/constants/text_styles/gk_inter_styles.dart';
import 'package:guptha_ui_kit/src/core_imp/constants/gk_colors_imp.dart';

class GkInterStylesImp extends GkInterStyles {
  @override
  double fontSizeAdjustment(double fontSize) {
    return fontSize;
  }

  @override
  GkColors getGkColorsInstance() {
    return GkColorsImp();
  }
}
