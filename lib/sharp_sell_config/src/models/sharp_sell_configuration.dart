/// Configuration for MAF SDK
class SharpSellConfiguration {
  SharpSellConfiguration({
    required this.merchantId,
    required this.auth0Token,
    this.apiKey,
    this.partnerId,
    this.accountHolderId = '',
    this.enableLogging = false,
  });



  final String? apiKey;
  final String merchantId;
  final String? partnerId;
  final String auth0Token;
  final String accountHolderId;
  final bool enableLogging;

  Map<String, dynamic> toJson() {
    return {
      'apiKey': apiKey,
      'merchantId': merchantId,
      'partnerId': partnerId,
      'auth0Token': auth0Token,
      'accountHolderId': accountHolderId,
      'enableLogging': enableLogging,
    };
  }


}
