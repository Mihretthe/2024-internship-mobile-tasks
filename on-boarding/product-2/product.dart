
class Product{

    String? _name, _description;
    double? _price;

    void set name(String? nam){
      this._name = nam;
    }

    String? get name{
      return this._name;
    }

    void set description(String? d){
      this._description = d;
    }

    String? get description{
      return _description;
    }

    void set price(double? price){
      this._price = price;
    }

    double? get price{
      return this._price;
    }
    
}