import 'package:flutter_svg/svg.dart';

getHeight(width, [String ratio = "16:9"]) {
  var split = ratio.split(":");
  var wr = double.parse(split[0]);
  var hr = double.parse(split[1]);
  return (width / wr) * hr;
}

getSvgIcon(icon) {
  return SvgPicture.asset(icon);
}
