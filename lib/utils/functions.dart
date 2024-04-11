
String formatDecimal(String text)
{
  return text.replaceAll(',', '.');
}

String cleanText(String text)
{
  return formatDecimal(text).replaceAll('.', '');
}