enum SizeUnit{
  B('B', 0),
  KB('KB', 1),
  MB('MB', 2),
  GB('GB', 3),
  TB('TB', 4),
  EB('EB', 5),
  ZB('ZB', 6),
  YB('YB', 7);
  const SizeUnit(this.name, this.value);
  final int value;
  final String name;
}
