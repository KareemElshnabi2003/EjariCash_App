class AppLinks {
  static String serverLink = "https://ejaricash.online/api";

  //onBoarding
  static String onBoardingInfo = "$serverLink/banners";
//notification
  static String notificationLink = "$serverLink/user/notifications";

  //register
  static String loginLink = "$serverLink/user/login";
  static String registerLink = "$serverLink/user/register";
  static String verifyCodeLink = "$serverLink/user/code-activate";
  static String verifyCodeForgetPassLink = "$serverLink/user/check-code";
  static String verifyCodeActivateLink = "$serverLink/user/code-activate";

  static String resendCodeLink = "$serverLink/user/resend-code";
  static String logOutLink = "$serverLink/logout";
  static String updateProfileLink = "$serverLink/user/update-profile";
  static String deleteAccountLink = "$serverLink/delete-account";
  static String changePasswordLink = "$serverLink/change-password";
  static String forgetPassLink = "$serverLink/user/forget-pass";
  static String addNewPassLink = "$serverLink/user/reset-password";
  static String getUserInfo = "$serverLink/user/profile";

  //projects

  static String getAllProjectsLink = "$serverLink/partners";
  static String getProjectsForPartener = "$serverLink/partners/";

  //unites  && ads
  static String getAllUnitesLink = "$serverLink/ads";
  static String getAllUnitesOwnerLink = "$serverLink/user/my-products";

  static String getAdsHomeLink = "$serverLink/ads?in_home=yes";

  //add ads
  static String addAdsBrokerLink =
      "$serverLink/user/add-product?user_type=broker";
  static String addAdsOwnerLink =
      "$serverLink/user/add-product?user_type=owner";

  //report
  static String makeReportLink = "$serverLink/ads";

  //FAQ , Setting
  static String getFAQLink = "$serverLink/help";
  static String getSettingLink = "$serverLink/setting";
  static String getCitiesLink = "$serverLink/areas";
  static String getAreasLink = "$serverLink/areas";
  static String getCategoriesLink = "$serverLink/unit-types";

//favourite

  static String addAndDeleteFav = "$serverLink/user/wishlist/add/";
  static String getFavouriteItems = "$serverLink/user/wishlist";

  //monthly ejar
  static String monthlyEjarLink = "$serverLink/user/monthly-rent";

  //why Ejary Cash
  static String whyEjaryLink = "$serverLink/features";
  // rent
  static String rentLink = "$serverLink/user/request-rent";
  //orders
  static String myRentsLink = "$serverLink/user/my-rents";
}
