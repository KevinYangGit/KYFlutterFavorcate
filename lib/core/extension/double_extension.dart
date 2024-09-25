import 'package:ky_flutter_favorcate/ui/shared/size_fit.dart';

// 扩展 double
extension DoubleFit on double {
  // 调用方式：100.px
  double get px {
    return KYSizeFit.setPx(this);
  }

  // 调用方式：100.rpx
  double get rpx {
    return KYSizeFit.setRpx(this);
  }
}
