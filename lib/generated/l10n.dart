// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Select user type`
  String get titleOftypePage {
    return Intl.message(
      'Select user type',
      name: 'titleOftypePage',
      desc: '',
      args: [],
    );
  }

  /// `Please select the user type that best describes your role to best assist you.`
  String get bodyOftypePage {
    return Intl.message(
      'Please select the user type that best describes your role to best assist you.',
      name: 'bodyOftypePage',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get bottomOfTypePage {
    return Intl.message(
      'Confirm',
      name: 'bottomOfTypePage',
      desc: '',
      args: [],
    );
  }

  /// `Visitor`
  String get visit {
    return Intl.message('Visitor', name: 'visit', desc: '', args: []);
  }

  /// `Seller`
  String get seller {
    return Intl.message('Seller', name: 'seller', desc: '', args: []);
  }

  /// `SignUp`
  String get signup {
    return Intl.message('SignUp', name: 'signup', desc: '', args: []);
  }

  /// `or`
  String get or {
    return Intl.message('or', name: 'or', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Login with Facebook`
  String get facebook {
    return Intl.message(
      'Login with Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Login with iCloud`
  String get icloud {
    return Intl.message(
      'Login with iCloud',
      name: 'icloud',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with Google`
  String get google {
    return Intl.message(
      'Sign in with Google',
      name: 'google',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message('Alert', name: 'alert', desc: '', args: []);
  }

  /// `Not Activated Yet ..!`
  String get NotActivated {
    return Intl.message(
      'Not Activated Yet ..!',
      name: 'NotActivated',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message('Phone Number', name: 'phone', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Login`
  String get titleLoginPage {
    return Intl.message('Login', name: 'titleLoginPage', desc: '', args: []);
  }

  /// `Welcome to our real estate community...`
  String get bodyLoginPage {
    return Intl.message(
      'Welcome to our real estate community...',
      name: 'bodyLoginPage',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your password?`
  String get forgetPass {
    return Intl.message(
      'Forgot your password?',
      name: 'forgetPass',
      desc: '',
      args: [],
    );
  }

  /// ` ? Don't have an account`
  String get notHaveAccount {
    return Intl.message(
      ' ? Don\'t have an account',
      name: 'notHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get errorPhone_1 {
    return Intl.message(
      'Please enter your phone number',
      name: 'errorPhone_1',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone number`
  String get errorPhone_2 {
    return Intl.message(
      'Invalid phone number',
      name: 'errorPhone_2',
      desc: '',
      args: [],
    );
  }

  /// `Phone number must contain between 8 and 9 digits`
  String get errorPhone_3 {
    return Intl.message(
      'Phone number must contain between 8 and 9 digits',
      name: 'errorPhone_3',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get errorPass_1 {
    return Intl.message(
      'Please enter your password',
      name: 'errorPass_1',
      desc: '',
      args: [],
    );
  }

  /// `Password is short`
  String get errorPass_2 {
    return Intl.message(
      'Password is short',
      name: 'errorPass_2',
      desc: '',
      args: [],
    );
  }

  /// `password is long`
  String get errorPass_3 {
    return Intl.message(
      'password is long',
      name: 'errorPass_3',
      desc: '',
      args: [],
    );
  }

  /// `No internet connection. Please check your connection and try again.`
  String get noInternetApi {
    return Intl.message(
      'No internet connection. Please check your connection and try again.',
      name: 'noInternetApi',
      desc: '',
      args: [],
    );
  }

  /// `The requested resource was not found.`
  String get serverException {
    return Intl.message(
      'The requested resource was not found.',
      name: 'serverException',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred. Please try again.`
  String get unExcepectedException {
    return Intl.message(
      'An unexpected error occurred. Please try again.',
      name: 'unExcepectedException',
      desc: '',
      args: [],
    );
  }

  /// `Failed to complete the operation. Please try again.`
  String get defultException {
    return Intl.message(
      'Failed to complete the operation. Please try again.',
      name: 'defultException',
      desc: '',
      args: [],
    );
  }

  /// `The server is currently unavailable. Please try again later.`
  String get serverError {
    return Intl.message(
      'The server is currently unavailable. Please try again later.',
      name: 'serverError',
      desc: '',
      args: [],
    );
  }

  /// `The request has timed out. Please try again later.`
  String get timeOutException {
    return Intl.message(
      'The request has timed out. Please try again later.',
      name: 'timeOutException',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect phone number or password`
  String get passwordNotCorrect {
    return Intl.message(
      'Incorrect phone number or password',
      name: 'passwordNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `try again`
  String get tryAgain {
    return Intl.message('try again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Create your account`
  String get titleSign {
    return Intl.message(
      'Create your account',
      name: 'titleSign',
      desc: '',
      args: [],
    );
  }

  /// `Please complete your information. Don't worry, your information will remain private and only you will be able to see it.`
  String get bodySign {
    return Intl.message(
      'Please complete your information. Don\'t worry, your information will remain private and only you will be able to see it.',
      name: 'bodySign',
      desc: '',
      args: [],
    );
  }

  /// `user name`
  String get userName {
    return Intl.message('user name', name: 'userName', desc: '', args: []);
  }

  /// `e-mail`
  String get email {
    return Intl.message('e-mail', name: 'email', desc: '', args: []);
  }

  /// `address`
  String get address {
    return Intl.message('address', name: 'address', desc: '', args: []);
  }

  /// `Confirm password`
  String get confirmPass {
    return Intl.message(
      'Confirm password',
      name: 'confirmPass',
      desc: '',
      args: [],
    );
  }

  /// `If you have an account already ? `
  String get haveAccount {
    return Intl.message(
      'If you have an account already ? ',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `I agree`
  String get multiText_1 {
    return Intl.message('I agree', name: 'multiText_1', desc: '', args: []);
  }

  /// `conditions`
  String get multiText_2 {
    return Intl.message('conditions', name: 'multiText_2', desc: '', args: []);
  }

  /// `and`
  String get multiText_3 {
    return Intl.message('and', name: 'multiText_3', desc: '', args: []);
  }

  /// `Agreements`
  String get multiText_4 {
    return Intl.message('Agreements', name: 'multiText_4', desc: '', args: []);
  }

  /// `Ejari Cash App`
  String get multiText_5 {
    return Intl.message(
      'Ejari Cash App',
      name: 'multiText_5',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get errorEmail_1 {
    return Intl.message(
      'Please enter your email',
      name: 'errorEmail_1',
      desc: '',
      args: [],
    );
  }

  /// `Invalid mail`
  String get errorEmail_2 {
    return Intl.message(
      'Invalid mail',
      name: 'errorEmail_2',
      desc: '',
      args: [],
    );
  }

  /// `Invalid mail`
  String get errorEmail_3 {
    return Intl.message(
      'Invalid mail',
      name: 'errorEmail_3',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the address`
  String get errorAddress_1 {
    return Intl.message(
      'Please enter the address',
      name: 'errorAddress_1',
      desc: '',
      args: [],
    );
  }

  /// `The address is too short`
  String get errorAddress_2 {
    return Intl.message(
      'The address is too short',
      name: 'errorAddress_2',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get errorConfirmPass_1 {
    return Intl.message(
      'Please enter your password',
      name: 'errorConfirmPass_1',
      desc: '',
      args: [],
    );
  }

  /// `Password does not match`
  String get errorConfirmPass_2 {
    return Intl.message(
      'Password does not match',
      name: 'errorConfirmPass_2',
      desc: '',
      args: [],
    );
  }

  /// `Please enter name`
  String get errorUserName_1 {
    return Intl.message(
      'Please enter name',
      name: 'errorUserName_1',
      desc: '',
      args: [],
    );
  }

  /// `The name is too short`
  String get errorUserName_2 {
    return Intl.message(
      'The name is too short',
      name: 'errorUserName_2',
      desc: '',
      args: [],
    );
  }

  /// `The name is too long`
  String get errorUserName_3 {
    return Intl.message(
      'The name is too long',
      name: 'errorUserName_3',
      desc: '',
      args: [],
    );
  }

  /// `warning`
  String get warning {
    return Intl.message('warning', name: 'warning', desc: '', args: []);
  }

  /// `Please allow location`
  String get messageLocation {
    return Intl.message(
      'Please allow location',
      name: 'messageLocation',
      desc: '',
      args: [],
    );
  }

  /// `allow`
  String get allow {
    return Intl.message('allow', name: 'allow', desc: '', args: []);
  }

  /// `The phone number is already in use`
  String get errorPhoneUseBeforeApi {
    return Intl.message(
      'The phone number is already in use',
      name: 'errorPhoneUseBeforeApi',
      desc: '',
      args: [],
    );
  }

  /// `Please agree to the terms of service.`
  String get errorConfirmPrivacy {
    return Intl.message(
      'Please agree to the terms of service.',
      name: 'errorConfirmPrivacy',
      desc: '',
      args: [],
    );
  }

  /// `To follow up, please log in.`
  String get errorUnAuthorized {
    return Intl.message(
      'To follow up, please log in.',
      name: 'errorUnAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `verify code`
  String get titleVerify {
    return Intl.message('verify code', name: 'titleVerify', desc: '', args: []);
  }

  /// `Please enter the code sent to your email so you can continue.`
  String get bodyVerifyLogin {
    return Intl.message(
      'Please enter the code sent to your email so you can continue.',
      name: 'bodyVerifyLogin',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message('Send', name: 'send', desc: '', args: []);
  }

  /// `Welcome back. In a few moments you will be redirected to the home page.`
  String get succseLogin {
    return Intl.message(
      'Welcome back. In a few moments you will be redirected to the home page.',
      name: 'succseLogin',
      desc: '',
      args: [],
    );
  }

  /// `Your account has been created successfully. In a few moments you will be redirected to the home page.`
  String get succsesSign {
    return Intl.message(
      'Your account has been created successfully. In a few moments you will be redirected to the home page.',
      name: 'succsesSign',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Reset password`
  String get titleForgetPass {
    return Intl.message(
      'Reset password',
      name: 'titleForgetPass',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email to send the secret code.`
  String get bodyForgetPass {
    return Intl.message(
      'Please enter your email to send the secret code.',
      name: 'bodyForgetPass',
      desc: '',
      args: [],
    );
  }

  /// `The email  used is not registered..!`
  String get errorForgetPass {
    return Intl.message(
      'The email  used is not registered..!',
      name: 'errorForgetPass',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get titleAddNewPass {
    return Intl.message(
      'New Password',
      name: 'titleAddNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your new password.`
  String get bodyAddNewPass {
    return Intl.message(
      'Please enter your new password.',
      name: 'bodyAddNewPass',
      desc: '',
      args: [],
    );
  }

  /// `The code is uncorrect`
  String get codeError {
    return Intl.message(
      'The code is uncorrect',
      name: 'codeError',
      desc: '',
      args: [],
    );
  }

  /// `You must enter code`
  String get errorNoCodeEnter {
    return Intl.message(
      'You must enter code',
      name: 'errorNoCodeEnter',
      desc: '',
      args: [],
    );
  }

  /// `Skip now`
  String get skip {
    return Intl.message('Skip now', name: 'skip', desc: '', args: []);
  }

  /// `User category`
  String get type {
    return Intl.message('User category', name: 'type', desc: '', args: []);
  }

  /// `tenant`
  String get type_1 {
    return Intl.message('tenant', name: 'type_1', desc: '', args: []);
  }

  /// `Owner`
  String get type_2 {
    return Intl.message('Owner', name: 'type_2', desc: '', args: []);
  }

  /// `please choose type of user`
  String get errorChooseTypeOfUser {
    return Intl.message(
      'please choose type of user',
      name: 'errorChooseTypeOfUser',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to our real estate app! Start creating your account now`
  String get mainAuth {
    return Intl.message(
      'Welcome to our real estate app! Start creating your account now',
      name: 'mainAuth',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Language`
  String get laungue {
    return Intl.message('Language', name: 'laungue', desc: '', args: []);
  }

  // skipped getter for the 'My profile' key

  /// `Main`
  String get main {
    return Intl.message('Main', name: 'main', desc: '', args: []);
  }

  /// `Setting`
  String get setting {
    return Intl.message('Setting', name: 'setting', desc: '', args: []);
  }

  /// `FAQ`
  String get question {
    return Intl.message('FAQ', name: 'question', desc: '', args: []);
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message('Contact us', name: 'contactUs', desc: '', args: []);
  }

  /// `Privacy & Policy`
  String get prrivacy {
    return Intl.message(
      'Privacy & Policy',
      name: 'prrivacy',
      desc: '',
      args: [],
    );
  }

  /// `Share app`
  String get shareApp {
    return Intl.message('Share app', name: 'shareApp', desc: '', args: []);
  }

  /// `Logout`
  String get logOut {
    return Intl.message('Logout', name: 'logOut', desc: '', args: []);
  }

  /// `Requests`
  String get orders {
    return Intl.message('Requests', name: 'orders', desc: '', args: []);
  }

  /// `Ads`
  String get ads {
    return Intl.message('Ads', name: 'ads', desc: '', args: []);
  }

  /// `Home`
  String get homePage {
    return Intl.message('Home', name: 'homePage', desc: '', args: []);
  }

  /// `Renter`
  String get renter {
    return Intl.message('Renter', name: 'renter', desc: '', args: []);
  }

  /// `Owner`
  String get owner {
    return Intl.message('Owner', name: 'owner', desc: '', args: []);
  }

  /// `Profile Info`
  String get profileInfo {
    return Intl.message(
      'Profile Info',
      name: 'profileInfo',
      desc: '',
      args: [],
    );
  }

  /// `Renter's name`
  String get name {
    return Intl.message('Renter\'s name', name: 'name', desc: '', args: []);
  }

  /// `Date of Birth dd-mm-yy`
  String get dateOfBirth {
    return Intl.message(
      'Date of Birth dd-mm-yy',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Bio`
  String get bio {
    return Intl.message('Bio', name: 'bio', desc: '', args: []);
  }

  /// `Linked in`
  String get linkedIn {
    return Intl.message('Linked in', name: 'linkedIn', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePass {
    return Intl.message(
      'Change password',
      name: 'changePass',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get currrentPass {
    return Intl.message(
      'Current password',
      name: 'currrentPass',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `New password`
  String get newPass {
    return Intl.message('New password', name: 'newPass', desc: '', args: []);
  }

  /// `Confirm new password`
  String get confirmNewPass {
    return Intl.message(
      'Confirm new password',
      name: 'confirmNewPass',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `FAQ`
  String get faq {
    return Intl.message('FAQ', name: 'faq', desc: '', args: []);
  }

  /// `Search For Question`
  String get searchFAQ {
    return Intl.message(
      'Search For Question',
      name: 'searchFAQ',
      desc: '',
      args: [],
    );
  }

  /// `WatsApp`
  String get watsApp {
    return Intl.message('WatsApp', name: 'watsApp', desc: '', args: []);
  }

  /// `Kingdom of Saudi Arabia, Dammam`
  String get addressContact {
    return Intl.message(
      'Kingdom of Saudi Arabia, Dammam',
      name: 'addressContact',
      desc: '',
      args: [],
    );
  }

  /// `For faster communication, please contact us via WhatsApp.`
  String get bodyContact {
    return Intl.message(
      'For faster communication, please contact us via WhatsApp.',
      name: 'bodyContact',
      desc: '',
      args: [],
    );
  }

  /// `You will be logout from your account`
  String get messageLogout {
    return Intl.message(
      'You will be logout from your account',
      name: 'messageLogout',
      desc: '',
      args: [],
    );
  }

  /// `You're about to log out... Are you sure?`
  String get bodyMessageLogout {
    return Intl.message(
      'You\'re about to log out... Are you sure?',
      name: 'bodyMessageLogout',
      desc: '',
      args: [],
    );
  }

  /// `Yes, get out.`
  String get exit {
    return Intl.message('Yes, get out.', name: 'exit', desc: '', args: []);
  }

  /// `Ejari Cash`
  String get ejariCash {
    return Intl.message('Ejari Cash', name: 'ejariCash', desc: '', args: []);
  }

  /// `Submit a rent request`
  String get requestEjar {
    return Intl.message(
      'Submit a rent request',
      name: 'requestEjar',
      desc: '',
      args: [],
    );
  }

  /// `To rent real estate units within Ejari Cash or for your favorite real estate units`
  String get bodyRequest {
    return Intl.message(
      'To rent real estate units within Ejari Cash or for your favorite real estate units',
      name: 'bodyRequest',
      desc: '',
      args: [],
    );
  }

  /// `Submit a Rent Request`
  String get buttonRequest {
    return Intl.message(
      'Submit a Rent Request',
      name: 'buttonRequest',
      desc: '',
      args: [],
    );
  }

  /// `You can request to rent a unit with a monthly installment `
  String get rentRequest {
    return Intl.message(
      'You can request to rent a unit with a monthly installment ',
      name: 'rentRequest',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Units`
  String get units {
    return Intl.message('Units', name: 'units', desc: '', args: []);
  }

  /// `Our Partners`
  String get parteners {
    return Intl.message('Our Partners', name: 'parteners', desc: '', args: []);
  }

  /// `Open the Project`
  String get openProject {
    return Intl.message(
      'Open the Project',
      name: 'openProject',
      desc: '',
      args: [],
    );
  }

  /// `Rent Your Unit`
  String get rentUnit {
    return Intl.message('Rent Your Unit', name: 'rentUnit', desc: '', args: []);
  }

  /// `Add Your Unit`
  String get addUnit {
    return Intl.message('Add Your Unit', name: 'addUnit', desc: '', args: []);
  }

  /// `No Units`
  String get noAds {
    return Intl.message('No Units', name: 'noAds', desc: '', args: []);
  }

  /// `No Requests`
  String get noOrders {
    return Intl.message('No Requests', name: 'noOrders', desc: '', args: []);
  }

  /// `No Partners`
  String get noPartener {
    return Intl.message('No Partners', name: 'noPartener', desc: '', args: []);
  }

  /// `No Notifications`
  String get noNotify {
    return Intl.message(
      'No Notifications',
      name: 'noNotify',
      desc: '',
      args: [],
    );
  }

  /// `Reviewing`
  String get review {
    return Intl.message('Reviewing', name: 'review', desc: '', args: []);
  }

  /// `Approved`
  String get approve {
    return Intl.message('Approved', name: 'approve', desc: '', args: []);
  }

  /// `Rejected`
  String get reject {
    return Intl.message('Rejected', name: 'reject', desc: '', args: []);
  }

  /// `Completed`
  String get complete {
    return Intl.message('Completed', name: 'complete', desc: '', args: []);
  }

  /// `Yearly Rent`
  String get yearlyRent {
    return Intl.message('Yearly Rent', name: 'yearlyRent', desc: '', args: []);
  }

  /// `Contract Status`
  String get statusContract {
    return Intl.message(
      'Contract Status',
      name: 'statusContract',
      desc: '',
      args: [],
    );
  }

  /// `Re Send`
  String get resend {
    return Intl.message('Re Send', name: 'resend', desc: '', args: []);
  }

  /// `The code enter not correct`
  String get invalidOTP {
    return Intl.message(
      'The code enter not correct',
      name: 'invalidOTP',
      desc: '',
      args: [],
    );
  }

  /// `BathRoom`
  String get bathroom {
    return Intl.message('BathRoom', name: 'bathroom', desc: '', args: []);
  }

  /// `Room`
  String get room {
    return Intl.message('Room', name: 'room', desc: '', args: []);
  }

  /// `m2`
  String get m2 {
    return Intl.message('m2', name: 'm2', desc: '', args: []);
  }

  /// `No Projects`
  String get noProjects {
    return Intl.message('No Projects', name: 'noProjects', desc: '', args: []);
  }

  /// `Project Details`
  String get titleProjectInfo {
    return Intl.message(
      'Project Details',
      name: 'titleProjectInfo',
      desc: '',
      args: [],
    );
  }

  /// `Project Location`
  String get locateProject {
    return Intl.message(
      'Project Location',
      name: 'locateProject',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get descripe {
    return Intl.message('Description', name: 'descripe', desc: '', args: []);
  }

  /// `Project Catalog`
  String get catalogProject {
    return Intl.message(
      'Project Catalog',
      name: 'catalogProject',
      desc: '',
      args: [],
    );
  }

  /// `Projects`
  String get projects {
    return Intl.message('Projects', name: 'projects', desc: '', args: []);
  }

  /// `request number`
  String get numOfOrder {
    return Intl.message(
      'request number',
      name: 'numOfOrder',
      desc: '',
      args: [],
    );
  }

  /// `Ads Management`
  String get adsManage {
    return Intl.message(
      'Ads Management',
      name: 'adsManage',
      desc: '',
      args: [],
    );
  }

  /// `Views`
  String get views {
    return Intl.message('Views', name: 'views', desc: '', args: []);
  }

  /// `Likes`
  String get favourites {
    return Intl.message('Likes', name: 'favourites', desc: '', args: []);
  }

  /// `Submit Your Request Now`
  String get requestNow {
    return Intl.message(
      'Submit Your Request Now',
      name: 'requestNow',
      desc: '',
      args: [],
    );
  }

  /// `Your request is currently under review`
  String get messageReview {
    return Intl.message(
      'Your request is currently under review',
      name: 'messageReview',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the correct rent`
  String get errorEnterEjar {
    return Intl.message(
      'Please enter the correct rent',
      name: 'errorEnterEjar',
      desc: '',
      args: [],
    );
  }

  /// `Monthly installment`
  String get monthlyRent {
    return Intl.message(
      'Monthly installment',
      name: 'monthlyRent',
      desc: '',
      args: [],
    );
  }

  /// `Owner's Name`
  String get ownerName {
    return Intl.message('Owner\'s Name', name: 'ownerName', desc: '', args: []);
  }

  /// `Owner's Mobile Number`
  String get ownerPhone {
    return Intl.message(
      'Owner\'s Mobile Number',
      name: 'ownerPhone',
      desc: '',
      args: [],
    );
  }

  /// `Area`
  String get area {
    return Intl.message('Area', name: 'area', desc: '', args: []);
  }

  /// `City`
  String get city {
    return Intl.message('City', name: 'city', desc: '', args: []);
  }

  /// `Location From Google Map`
  String get locationFromGoogle {
    return Intl.message(
      'Location From Google Map',
      name: 'locationFromGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the location from Google`
  String get locationError_1 {
    return Intl.message(
      'Please enter the location from Google',
      name: 'locationError_1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the location link from Google`
  String get locationError_2 {
    return Intl.message(
      'Please enter the location link from Google',
      name: 'locationError_2',
      desc: '',
      args: [],
    );
  }

  /// `Description of the unit`
  String get descripeUnite {
    return Intl.message(
      'Description of the unit',
      name: 'descripeUnite',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the description`
  String get errorDescripe {
    return Intl.message(
      'Please enter the description',
      name: 'errorDescripe',
      desc: '',
      args: [],
    );
  }

  /// `Have you agreed with the owner?`
  String get areYouAgree {
    return Intl.message(
      'Have you agreed with the owner?',
      name: 'areYouAgree',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Submit Request`
  String get rentOrder {
    return Intl.message(
      'Submit Request',
      name: 'rentOrder',
      desc: '',
      args: [],
    );
  }

  /// `Please choose the type of order`
  String get chooseTypeOrder {
    return Intl.message(
      'Please choose the type of order',
      name: 'chooseTypeOrder',
      desc: '',
      args: [],
    );
  }

  /// `Independent Unit`
  String get titleOrder_1 {
    return Intl.message(
      'Independent Unit',
      name: 'titleOrder_1',
      desc: '',
      args: [],
    );
  }

  /// `Submit an order to rent an independent unit that you found and want to request a rent contract with an easy contract`
  String get bodyOrder_1 {
    return Intl.message(
      'Submit an order to rent an independent unit that you found and want to request a rent contract with an easy contract',
      name: 'bodyOrder_1',
      desc: '',
      args: [],
    );
  }

  /// `Advertisements`
  String get titleOrder_2 {
    return Intl.message(
      'Advertisements',
      name: 'titleOrder_2',
      desc: '',
      args: [],
    );
  }

  /// `Choose your unit from the advertisements`
  String get bodyOrder_2 {
    return Intl.message(
      'Choose your unit from the advertisements',
      name: 'bodyOrder_2',
      desc: '',
      args: [],
    );
  }

  /// `Duration: One Year`
  String get durationOneYear {
    return Intl.message(
      'Duration: One Year',
      name: 'durationOneYear',
      desc: '',
      args: [],
    );
  }

  /// `Please select a date`
  String get errorDate {
    return Intl.message(
      'Please select a date',
      name: 'errorDate',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Amount`
  String get mounthlyAmount {
    return Intl.message(
      'Monthly Amount',
      name: 'mounthlyAmount',
      desc: '',
      args: [],
    );
  }

  /// `Unit Amount`
  String get unitPrice {
    return Intl.message('Unit Amount', name: 'unitPrice', desc: '', args: []);
  }

  /// `Payment Plan`
  String get paymentPlan {
    return Intl.message(
      'Payment Plan',
      name: 'paymentPlan',
      desc: '',
      args: [],
    );
  }

  /// `Rental Information`
  String get infoEjar {
    return Intl.message(
      'Rental Information',
      name: 'infoEjar',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get reviewText {
    return Intl.message('Review', name: 'reviewText', desc: '', args: []);
  }

  /// `Notifications`
  String get notify {
    return Intl.message('Notifications', name: 'notify', desc: '', args: []);
  }

  /// `Calculate your available monthly rent`
  String get computeMonthlyEjar {
    return Intl.message(
      'Calculate your available monthly rent',
      name: 'computeMonthlyEjar',
      desc: '',
      args: [],
    );
  }

  /// `Monthly Salary`
  String get monthlySalary {
    return Intl.message(
      'Monthly Salary',
      name: 'monthlySalary',
      desc: '',
      args: [],
    );
  }

  /// `Job Type`
  String get typeOfJob {
    return Intl.message('Job Type', name: 'typeOfJob', desc: '', args: []);
  }

  /// `Education`
  String get education {
    return Intl.message('Education', name: 'education', desc: '', args: []);
  }

  /// `Monthly Obligations`
  String get monthlyObligations {
    return Intl.message(
      'Monthly Obligations',
      name: 'monthlyObligations',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get nationality {
    return Intl.message('Nationality', name: 'nationality', desc: '', args: []);
  }

  /// `Saudi`
  String get saudi {
    return Intl.message('Saudi', name: 'saudi', desc: '', args: []);
  }

  /// `Resident`
  String get resident {
    return Intl.message('Resident', name: 'resident', desc: '', args: []);
  }

  /// `Age`
  String get age {
    return Intl.message('Age', name: 'age', desc: '', args: []);
  }

  /// `Marriage`
  String get marriage {
    return Intl.message('Marriage', name: 'marriage', desc: '', args: []);
  }

  /// `Number of Family Members`
  String get countOfFamily {
    return Intl.message(
      'Number of Family Members',
      name: 'countOfFamily',
      desc: '',
      args: [],
    );
  }

  /// `Available monthly rental limit`
  String get monthRentLimit {
    return Intl.message(
      'Available monthly rental limit',
      name: 'monthRentLimit',
      desc: '',
      args: [],
    );
  }

  /// `Monthly`
  String get monthly {
    return Intl.message('Monthly', name: 'monthly', desc: '', args: []);
  }

  /// `Expected increase rate 15%-17%`
  String get expectedRate {
    return Intl.message(
      'Expected increase rate 15%-17%',
      name: 'expectedRate',
      desc: '',
      args: [],
    );
  }

  /// `Go to rent request`
  String get goRent {
    return Intl.message(
      'Go to rent request',
      name: 'goRent',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Favorite`
  String get favourite {
    return Intl.message('Favorite', name: 'favourite', desc: '', args: []);
  }

  /// `There are no items in favourites yet`
  String get noFav {
    return Intl.message(
      'There are no items in favourites yet',
      name: 'noFav',
      desc: '',
      args: [],
    );
  }

  /// `Not selected`
  String get notMark {
    return Intl.message('Not selected', name: 'notMark', desc: '', args: []);
  }

  /// `Report Ad`
  String get reportAd {
    return Intl.message('Report Ad', name: 'reportAd', desc: '', args: []);
  }

  /// `Report`
  String get report {
    return Intl.message('Report', name: 'report', desc: '', args: []);
  }

  /// `Unit Not Available`
  String get unitNotFree {
    return Intl.message(
      'Unit Not Available',
      name: 'unitNotFree',
      desc: '',
      args: [],
    );
  }

  /// `Unit Price Incorrect`
  String get priceNotCorrect {
    return Intl.message(
      'Unit Price Incorrect',
      name: 'priceNotCorrect',
      desc: '',
      args: [],
    );
  }

  /// `Unit Location Does Not Match`
  String get locationNotMatch {
    return Intl.message(
      'Unit Location Does Not Match',
      name: 'locationNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Does Not Comply with Real Estate General Authority Laws`
  String get notMatchWithLaw {
    return Intl.message(
      'Does Not Comply with Real Estate General Authority Laws',
      name: 'notMatchWithLaw',
      desc: '',
      args: [],
    );
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `If there is another reason (please specify)`
  String get anotherReason {
    return Intl.message(
      'If there is another reason (please specify)',
      name: 'anotherReason',
      desc: '',
      args: [],
    );
  }

  /// `Enter reason here`
  String get enterReason {
    return Intl.message(
      'Enter reason here',
      name: 'enterReason',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Filter`
  String get cancelFilter {
    return Intl.message(
      'Cancel Filter',
      name: 'cancelFilter',
      desc: '',
      args: [],
    );
  }

  /// `Unit Details`
  String get unitInfo {
    return Intl.message('Unit Details', name: 'unitInfo', desc: '', args: []);
  }

  /// `Yearly`
  String get yearly {
    return Intl.message('Yearly', name: 'yearly', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Inactive`
  String get notActive {
    return Intl.message('Inactive', name: 'notActive', desc: '', args: []);
  }

  /// `Advertiser`
  String get advertiser {
    return Intl.message('Advertiser', name: 'advertiser', desc: '', args: []);
  }

  /// `Advertisement Number`
  String get adsNum {
    return Intl.message(
      'Advertisement Number',
      name: 'adsNum',
      desc: '',
      args: [],
    );
  }

  /// `Val License Number`
  String get valNum {
    return Intl.message(
      'Val License Number',
      name: 'valNum',
      desc: '',
      args: [],
    );
  }

  /// `License`
  String get licanse {
    return Intl.message('License', name: 'licanse', desc: '', args: []);
  }

  /// `Scan the Bar Code`
  String get scanBarCode {
    return Intl.message(
      'Scan the Bar Code',
      name: 'scanBarCode',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message('Status', name: 'status', desc: '', args: []);
  }

  /// `Unit Details`
  String get unitDetails {
    return Intl.message(
      'Unit Details',
      name: 'unitDetails',
      desc: '',
      args: [],
    );
  }

  /// `Unit Type`
  String get unitType {
    return Intl.message('Unit Type', name: 'unitType', desc: '', args: []);
  }

  /// `Area`
  String get areaNum {
    return Intl.message('Area', name: 'areaNum', desc: '', args: []);
  }

  /// `Street Width`
  String get widthStreet {
    return Intl.message(
      'Street Width',
      name: 'widthStreet',
      desc: '',
      args: [],
    );
  }

  /// `Year Built`
  String get yearBuilt {
    return Intl.message('Year Built', name: 'yearBuilt', desc: '', args: []);
  }

  /// `Facade`
  String get face {
    return Intl.message('Facade', name: 'face', desc: '', args: []);
  }

  /// `Images`
  String get images {
    return Intl.message('Images', name: 'images', desc: '', args: []);
  }

  /// `Why Ejari Cash ?`
  String get whyEjary {
    return Intl.message(
      'Why Ejari Cash ?',
      name: 'whyEjary',
      desc: '',
      args: [],
    );
  }

  /// `Choose User Type`
  String get chooseTypeUser {
    return Intl.message(
      'Choose User Type',
      name: 'chooseTypeUser',
      desc: '',
      args: [],
    );
  }

  /// `Broker`
  String get broker {
    return Intl.message('Broker', name: 'broker', desc: '', args: []);
  }

  /// `Advertise and display properties using the advertisement number issued to you by the General Authority for Real Estate.`
  String get bodyBroker {
    return Intl.message(
      'Advertise and display properties using the advertisement number issued to you by the General Authority for Real Estate.',
      name: 'bodyBroker',
      desc: '',
      args: [],
    );
  }

  /// `Display your unit in the electronic market for free.`
  String get bodyOwner {
    return Intl.message(
      'Display your unit in the electronic market for free.',
      name: 'bodyOwner',
      desc: '',
      args: [],
    );
  }

  /// `Offer your property with monthly payments and receive your rent in one payment`
  String get bodyAddAds_1 {
    return Intl.message(
      'Offer your property with monthly payments and receive your rent in one payment',
      name: 'bodyAddAds_1',
      desc: '',
      args: [],
    );
  }

  /// `Offer your unit in monthly payments and receive your full rent through Ejari Cash. Your client's desire is fulfilled through the Rent Now Pay Later service (through subletting to Ejari Cash and receiving the full rent in one payment).`
  String get bodyAddAds_2 {
    return Intl.message(
      'Offer your unit in monthly payments and receive your full rent through Ejari Cash. Your client\'s desire is fulfilled through the Rent Now Pay Later service (through subletting to Ejari Cash and receiving the full rent in one payment).',
      name: 'bodyAddAds_2',
      desc: '',
      args: [],
    );
  }

  /// `Marketing on the platform`
  String get bodyAddAds_3 {
    return Intl.message(
      'Marketing on the platform',
      name: 'bodyAddAds_3',
      desc: '',
      args: [],
    );
  }

  /// `Add your unit in the Ejari Cash market without fees. Customer inquiries, marketing, and contracts will be answered in an integrated electronic rental journey in the application.`
  String get bodyAddAds_4 {
    return Intl.message(
      'Add your unit in the Ejari Cash market without fees. Customer inquiries, marketing, and contracts will be answered in an integrated electronic rental journey in the application.',
      name: 'bodyAddAds_4',
      desc: '',
      args: [],
    );
  }

  /// `Please choose`
  String get choose {
    return Intl.message('Please choose', name: 'choose', desc: '', args: []);
  }

  /// `(Recommended)`
  String get recommend {
    return Intl.message('(Recommended)', name: 'recommend', desc: '', args: []);
  }

  /// `Add Unit Details`
  String get addUnitDetails {
    return Intl.message(
      'Add Unit Details',
      name: 'addUnitDetails',
      desc: '',
      args: [],
    );
  }

  /// `Please add an image`
  String get enterImage {
    return Intl.message(
      'Please add an image',
      name: 'enterImage',
      desc: '',
      args: [],
    );
  }

  /// `Add an image`
  String get addImage {
    return Intl.message('Add an image', name: 'addImage', desc: '', args: []);
  }

  /// `More Images`
  String get moreImage {
    return Intl.message('More Images', name: 'moreImage', desc: '', args: []);
  }

  /// `Its own facilities`
  String get facilites {
    return Intl.message(
      'Its own facilities',
      name: 'facilites',
      desc: '',
      args: [],
    );
  }

  /// `Water`
  String get facilites_1 {
    return Intl.message('Water', name: 'facilites_1', desc: '', args: []);
  }

  /// `Furnished`
  String get facilites_2 {
    return Intl.message('Furnished', name: 'facilites_2', desc: '', args: []);
  }

  /// `Kitchen`
  String get facilites_3 {
    return Intl.message('Kitchen', name: 'facilites_3', desc: '', args: []);
  }

  /// `Air conditioners`
  String get facilites_4 {
    return Intl.message(
      'Air conditioners',
      name: 'facilites_4',
      desc: '',
      args: [],
    );
  }

  /// `Heater`
  String get facilites_5 {
    return Intl.message('Heater', name: 'facilites_5', desc: '', args: []);
  }

  /// `Internet`
  String get facilites_6 {
    return Intl.message('Internet', name: 'facilites_6', desc: '', args: []);
  }

  /// `Electricity`
  String get facilites_7 {
    return Intl.message('Electricity', name: 'facilites_7', desc: '', args: []);
  }

  /// `TV`
  String get facilites_8 {
    return Intl.message('TV', name: 'facilites_8', desc: '', args: []);
  }

  /// `Private entrance`
  String get facilites_9 {
    return Intl.message(
      'Private entrance',
      name: 'facilites_9',
      desc: '',
      args: [],
    );
  }

  /// `Electricity and water costs included in the rent`
  String get facilites_10 {
    return Intl.message(
      'Electricity and water costs included in the rent',
      name: 'facilites_10',
      desc: '',
      args: [],
    );
  }

  /// `Maintenance is on the owner`
  String get facilites_11 {
    return Intl.message(
      'Maintenance is on the owner',
      name: 'facilites_11',
      desc: '',
      args: [],
    );
  }

  /// `Independent electricity meter`
  String get facilites_12 {
    return Intl.message(
      'Independent electricity meter',
      name: 'facilites_12',
      desc: '',
      args: [],
    );
  }

  /// `The apartment is new (not inhabited before)`
  String get facilites_13 {
    return Intl.message(
      'The apartment is new (not inhabited before)',
      name: 'facilites_13',
      desc: '',
      args: [],
    );
  }

  /// `In case there are no air conditioners, the kitchen installation is on the tenant or the owner`
  String get facilites_14 {
    return Intl.message(
      'In case there are no air conditioners, the kitchen installation is on the tenant or the owner',
      name: 'facilites_14',
      desc: '',
      args: [],
    );
  }

  /// `Please select facilities`
  String get chooseFacilities {
    return Intl.message(
      'Please select facilities',
      name: 'chooseFacilities',
      desc: '',
      args: [],
    );
  }

  /// `Number of rooms`
  String get roomNum {
    return Intl.message('Number of rooms', name: 'roomNum', desc: '', args: []);
  }

  /// `Number of bathrooms`
  String get bathroomNum {
    return Intl.message(
      'Number of bathrooms',
      name: 'bathroomNum',
      desc: '',
      args: [],
    );
  }

  /// `Number of parking spaces`
  String get parkingNum {
    return Intl.message(
      'Number of parking spaces',
      name: 'parkingNum',
      desc: '',
      args: [],
    );
  }

  /// `Number of elevators`
  String get elevatorNum {
    return Intl.message(
      'Number of elevators',
      name: 'elevatorNum',
      desc: '',
      args: [],
    );
  }

  /// `Property type`
  String get propertyType {
    return Intl.message(
      'Property type',
      name: 'propertyType',
      desc: '',
      args: [],
    );
  }

  /// `Ownership age`
  String get ownerShipAge {
    return Intl.message(
      'Ownership age',
      name: 'ownerShipAge',
      desc: '',
      args: [],
    );
  }

  /// `Tenant preference`
  String get tenantPref {
    return Intl.message(
      'Tenant preference',
      name: 'tenantPref',
      desc: '',
      args: [],
    );
  }

  /// `Entry method`
  String get enterMethod {
    return Intl.message(
      'Entry method',
      name: 'enterMethod',
      desc: '',
      args: [],
    );
  }

  /// `Additional terms for tenant`
  String get additonalTerm {
    return Intl.message(
      'Additional terms for tenant',
      name: 'additonalTerm',
      desc: '',
      args: [],
    );
  }

  /// `Unit Address`
  String get addressUnit {
    return Intl.message(
      'Unit Address',
      name: 'addressUnit',
      desc: '',
      args: [],
    );
  }

  /// `Deed Number`
  String get deedNum {
    return Intl.message('Deed Number', name: 'deedNum', desc: '', args: []);
  }

  /// `Total Area`
  String get totalArea {
    return Intl.message('Total Area', name: 'totalArea', desc: '', args: []);
  }

  /// `Building Number`
  String get buildingNum {
    return Intl.message(
      'Building Number',
      name: 'buildingNum',
      desc: '',
      args: [],
    );
  }

  /// `Postal Code`
  String get postCode {
    return Intl.message('Postal Code', name: 'postCode', desc: '', args: []);
  }

  /// `Additional Mobile Number`
  String get additionalPhone {
    return Intl.message(
      'Additional Mobile Number',
      name: 'additionalPhone',
      desc: '',
      args: [],
    );
  }

  /// `Interface`
  String get interface {
    return Intl.message('Interface', name: 'interface', desc: '', args: []);
  }

  /// `Yearly Price`
  String get yearPrice {
    return Intl.message('Yearly Price', name: 'yearPrice', desc: '', args: []);
  }

  /// `Monthly Price`
  String get monthPrice {
    return Intl.message(
      'Monthly Price',
      name: 'monthPrice',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Amount`
  String get insuranceAmount {
    return Intl.message(
      'Insurance Amount',
      name: 'insuranceAmount',
      desc: '',
      args: [],
    );
  }

  /// `Broker Type`
  String get brokerType {
    return Intl.message('Broker Type', name: 'brokerType', desc: '', args: []);
  }

  /// `individual`
  String get individual {
    return Intl.message('individual', name: 'individual', desc: '', args: []);
  }

  /// `company`
  String get company {
    return Intl.message('company', name: 'company', desc: '', args: []);
  }

  /// `Company Name`
  String get companyName {
    return Intl.message(
      'Company Name',
      name: 'companyName',
      desc: '',
      args: [],
    );
  }

  /// `ID/Tax Registration Number`
  String get idNum {
    return Intl.message(
      'ID/Tax Registration Number',
      name: 'idNum',
      desc: '',
      args: [],
    );
  }

  /// `Create a password`
  String get createPass {
    return Intl.message(
      'Create a password',
      name: 'createPass',
      desc: '',
      args: [],
    );
  }

  /// `Create a password to log in`
  String get createPassFoeLogin {
    return Intl.message(
      'Create a password to log in',
      name: 'createPassFoeLogin',
      desc: '',
      args: [],
    );
  }

  /// `Please enter address`
  String get validateAddress {
    return Intl.message(
      'Please enter address',
      name: 'validateAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter title deed number`
  String get validateDeedNum {
    return Intl.message(
      'Please enter title deed number',
      name: 'validateDeedNum',
      desc: '',
      args: [],
    );
  }

  /// `Please enter area`
  String get validateAreaNum {
    return Intl.message(
      'Please enter area',
      name: 'validateAreaNum',
      desc: '',
      args: [],
    );
  }

  /// `Please enter description`
  String get validateDiscripe {
    return Intl.message(
      'Please enter description',
      name: 'validateDiscripe',
      desc: '',
      args: [],
    );
  }

  /// `Please enter postal code`
  String get validatePostCode {
    return Intl.message(
      'Please enter postal code',
      name: 'validatePostCode',
      desc: '',
      args: [],
    );
  }

  /// `Please enter building number`
  String get validateBuildingNum {
    return Intl.message(
      'Please enter building number',
      name: 'validateBuildingNum',
      desc: '',
      args: [],
    );
  }

  /// `Please enter street width`
  String get validateWidthStreet {
    return Intl.message(
      'Please enter street width',
      name: 'validateWidthStreet',
      desc: '',
      args: [],
    );
  }

  /// `Please enter annual rent`
  String get validateYearRent {
    return Intl.message(
      'Please enter annual rent',
      name: 'validateYearRent',
      desc: '',
      args: [],
    );
  }

  /// `Please enter insurance amount`
  String get validateInsurance {
    return Intl.message(
      'Please enter insurance amount',
      name: 'validateInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Please enter ID number`
  String get validateAuthNum {
    return Intl.message(
      'Please enter ID number',
      name: 'validateAuthNum',
      desc: '',
      args: [],
    );
  }

  /// `Please enter company name`
  String get validateCompanyName {
    return Intl.message(
      'Please enter company name',
      name: 'validateCompanyName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter advertisement number`
  String get validateNumAds {
    return Intl.message(
      'Please enter advertisement number',
      name: 'validateNumAds',
      desc: '',
      args: [],
    );
  }

  /// `Please enter room number Rooms`
  String get validateRoomNum {
    return Intl.message(
      'Please enter room number Rooms',
      name: 'validateRoomNum',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the number of bathrooms`
  String get validateBathroomNum {
    return Intl.message(
      'Please enter the number of bathrooms',
      name: 'validateBathroomNum',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the number of parking spaces`
  String get validateParkingNum {
    return Intl.message(
      'Please enter the number of parking spaces',
      name: 'validateParkingNum',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the number of elevators`
  String get vaildateLiftesNum {
    return Intl.message(
      'Please enter the number of elevators',
      name: 'vaildateLiftesNum',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the method of entry`
  String get validateLoginWay {
    return Intl.message(
      'Please enter the method of entry',
      name: 'validateLoginWay',
      desc: '',
      args: [],
    );
  }

  /// `Please enter additional terms about the tenant`
  String get validateAdditionalTerms {
    return Intl.message(
      'Please enter additional terms about the tenant',
      name: 'validateAdditionalTerms',
      desc: '',
      args: [],
    );
  }

  /// `Your ad is under review`
  String get adsInReview {
    return Intl.message(
      'Your ad is under review',
      name: 'adsInReview',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fieldes`
  String get fillAllFieldes {
    return Intl.message(
      'Please fill all fieldes',
      name: 'fillAllFieldes',
      desc: '',
      args: [],
    );
  }

  /// `Filter Units`
  String get filterUnits {
    return Intl.message(
      'Filter Units',
      name: 'filterUnits',
      desc: '',
      args: [],
    );
  }

  /// `Payment Type`
  String get typePay {
    return Intl.message('Payment Type', name: 'typePay', desc: '', args: []);
  }

  /// `Price Limit`
  String get priceLimit {
    return Intl.message('Price Limit', name: 'priceLimit', desc: '', args: []);
  }

  /// `From`
  String get from {
    return Intl.message('From', name: 'from', desc: '', args: []);
  }

  /// `To`
  String get to {
    return Intl.message('To', name: 'to', desc: '', args: []);
  }

  /// `Your report has been successfully registered.`
  String get succsesReport {
    return Intl.message(
      'Your report has been successfully registered.',
      name: 'succsesReport',
      desc: '',
      args: [],
    );
  }

  /// `Please choose a reason`
  String get chooseReason {
    return Intl.message(
      'Please choose a reason',
      name: 'chooseReason',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your salary`
  String get validateEnterSalary {
    return Intl.message(
      'Please enter your salary',
      name: 'validateEnterSalary',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your commitments`
  String get validateDemands {
    return Intl.message(
      'Please enter your commitments',
      name: 'validateDemands',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your age`
  String get validateAge_1 {
    return Intl.message(
      'Please enter your age',
      name: 'validateAge_1',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your correct age`
  String get validateAge_2 {
    return Intl.message(
      'Please enter your correct age',
      name: 'validateAge_2',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your real age`
  String get validateAge_3 {
    return Intl.message(
      'Please enter your real age',
      name: 'validateAge_3',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your real age`
  String get validateAge_4 {
    return Intl.message(
      'Please enter your real age',
      name: 'validateAge_4',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the number of family members`
  String get validateNumOfFamily {
    return Intl.message(
      'Please enter the number of family members',
      name: 'validateNumOfFamily',
      desc: '',
      args: [],
    );
  }

  /// `You will delete your order`
  String get deletAccount {
    return Intl.message(
      'You will delete your order',
      name: 'deletAccount',
      desc: '',
      args: [],
    );
  }

  /// `You are about to delete the order... Are you sure?`
  String get bodyDeletAccount {
    return Intl.message(
      'You are about to delete the order... Are you sure?',
      name: 'bodyDeletAccount',
      desc: '',
      args: [],
    );
  }

  /// `Yes, delete`
  String get yesDelete {
    return Intl.message('Yes, delete', name: 'yesDelete', desc: '', args: []);
  }

  /// `Request Info`
  String get orderInfo {
    return Intl.message('Request Info', name: 'orderInfo', desc: '', args: []);
  }

  /// `Status of request`
  String get statusOfOrder {
    return Intl.message(
      'Status of request',
      name: 'statusOfOrder',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Tenant Name`
  String get nameOfRenter {
    return Intl.message(
      'Tenant Name',
      name: 'nameOfRenter',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Time`
  String get time {
    return Intl.message('Time', name: 'time', desc: '', args: []);
  }

  /// `Move Date`
  String get dateOfMove {
    return Intl.message('Move Date', name: 'dateOfMove', desc: '', args: []);
  }

  /// `verify`
  String get verify {
    return Intl.message('verify', name: 'verify', desc: '', args: []);
  }

  /// `Renter's mobile number`
  String get phoneRenter {
    return Intl.message(
      'Renter\'s mobile number',
      name: 'phoneRenter',
      desc: '',
      args: [],
    );
  }

  /// `Copy the location from Google and put it here`
  String get hintGoogleMap {
    return Intl.message(
      'Copy the location from Google and put it here',
      name: 'hintGoogleMap',
      desc: '',
      args: [],
    );
  }

  /// `The rental units offered`
  String get unitOwner {
    return Intl.message(
      'The rental units offered',
      name: 'unitOwner',
      desc: '',
      args: [],
    );
  }

  /// `Who are we`
  String get whoAreTitle {
    return Intl.message('Who are we', name: 'whoAreTitle', desc: '', args: []);
  }

  /// `Ejari Cash is one of the applications of the Tashbak Business Group for real estate services, licensed by the General Authority for Real Estate with license number 1200007608 and registered with the government trademark under the name Ejari Cash. We help you divide your annual rent into monthly payments.`
  String get whoAreText {
    return Intl.message(
      'Ejari Cash is one of the applications of the Tashbak Business Group for real estate services, licensed by the General Authority for Real Estate with license number 1200007608 and registered with the government trademark under the name Ejari Cash. We help you divide your annual rent into monthly payments.',
      name: 'whoAreText',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
