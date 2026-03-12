/// This class contain the App images in String Format
class ZohImageStrings {
  static const String backgroundImage = "assets/images/background_image.png";
  static const String lowerShape = "assets/images/lower_shape.png";
  static const String upperShape = "assets/images/upper_shape.png";
  static const String backgroundWallet = "assets/images/background_wallet.png";
  static const String backgroundAction = "assets/images/background_action.png";

  /// Icons
  static const String airtime = "assets/icons/airtime_icon.png";
  static const String data = "assets/icons/buy_data.png";
  static const String electricity = "assets/icons/electricity.png";
  static const String flight = "assets/icons/flight.png";
  static const String tv = "assets/icons/galaTv0.png";
  static const String religious = "assets/icons/religious.png";
  static const String movie = "assets/icons/religious.png";
  static const String verify = "assets/icons/verify.png";
  static const String savings = "assets/images/savings.png";

  static String resolveImage(String key) {
    switch (key) {
      case 'airtime':     return ZohImageStrings.airtime;
      case 'data':        return ZohImageStrings.data;
      case 'electricity': return ZohImageStrings.electricity;
      case 'tv':          return ZohImageStrings.tv;
      case 'religious':   return ZohImageStrings.religious;
      case 'flight':      return ZohImageStrings.flight;
      case 'movie':       return ZohImageStrings.movie;
      default:            return ZohImageStrings.airtime;
    }
  }

  static const String avatar1 = "assets/avatars/avatar_01.png";
  static const String avatar2 = "assets/avatars/avatar2.png";
  static const String avatar3 = "assets/avatars/avatar3.png";

  static const String avatar = 'assets/images/avatar_img.png';
  static const String promoBanner = 'assets/images/promo_banner.png';
  static const String savingsCoins = 'assets/images/savings_coin.png';
  static const String rewardsCoins = 'assets/images/reward_coin.png';
  static const String mtnLogo = 'assets/images/mtn_logo.png';
  static const String medium = 'assets/images/medium.png';

  static const String sendMoneyIcon = 'assets/images/send.png';
  static const String receiveMoneyIcon = 'assets/images/receive.png';
  static const String airtimeIcon = 'assets/images/bills.png';
}