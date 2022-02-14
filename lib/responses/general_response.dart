class ResponseHandler {
  dynamic message;
  dynamic responseCode;

  isResponseSuccessful() {
    if (responseCode == 100) {
      return (message.success);
    }
  }
}
