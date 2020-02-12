part of molkars_chemistry;

class Parser {

  Parser();

  Set<Element> parseData() {
    print(Directory.systemTemp);
    File csv = File(r'/data/user/0/xyz.molkars.chemistry_calculator/code_cache/chemistry/elements.csv');

    var contents = csv.readAsStringSync();
    print(contents.split(',').join('\n'));
  }
}