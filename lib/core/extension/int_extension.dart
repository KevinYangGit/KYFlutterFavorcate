import 'package:ky_flutter_favorcate/ui/shared/size_fit.dart';

// 扩展 int
extension IntFit on int {
  // 调用方式：100.px
  double get px {
    return KYSizeFit.setPx(this.toDouble());
  }

  // 调用方式：100.rpx
  double get rpx {
    return KYSizeFit.setRpx(this.toDouble());
  }
}
