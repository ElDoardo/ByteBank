//classe que define uma tranferência
class Transfer {
  final String id;
  final String account;
  final String value;

  const Transfer({
    this.id = '',
    required this.account, 
    required this.value,
  });
}