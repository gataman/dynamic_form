enum CustomFormTypes {
  singleOptional(1, 'Opsiyon (Tek Seçim)'),
  multiOptional(2, 'Opsiyon (Çoklu Seçim)'),
  singleLine(3, 'Metin Alanı (Tek Satır)'),
  multiLine(4, 'Metin Alanı (Çoklu Satır)');

  final int type;
  final String label;

  const CustomFormTypes(this.type, this.label);
}

extension FormType on CustomFormTypes {}
