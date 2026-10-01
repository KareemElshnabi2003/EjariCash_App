import 'package:flutter_test/flutter_test.dart';
import 'package:ejary_cash/data/model/user_model.dart';
import 'package:ejary_cash/core/class/api_failure.dart';
import 'package:ejary_cash/core/class/status_request.dart';

void main() {
  group('UserModel unit tests', () {
    test('UserModel.fromJson handles null counts safely without string "null"', () {
      final json = {
        'id': 1,
        'name': 'Test User',
        'account_type': 'owner',
        'owner_ads_count': null,
        'owner_fav_ads_count': null,
        'owner_views_ads_count': null,
        'monthly_rent': null,
      };

      final user = UserModel.fromJson(json);

      expect(user.id, 1);
      expect(user.name, 'Test User');
      expect(user.accountType, 'owner');
      expect(user.ownerAdsCount, '0');
      expect(user.ownerFavAdsCount, '0');
      expect(user.ownerViewsAdsCount, '0');
      expect(user.monthlyRent, isNull);
    });
  });

  group('ApiFailure unit tests', () {
    test('ApiFailure supports Map index operator safely', () {
      final failure = ApiFailure(
        status: StatuesRequest.unprocessableException,
        statusCode: 422,
        message: 'Validation error',
        data: {'email': 'Email already taken'},
      );

      expect(failure['message'], 'Validation error');
      expect(failure['status'], StatuesRequest.unprocessableException);
      expect(failure['statusCode'], 422);
      expect(failure['unknown_key'], isNull);
    });
  });
}
