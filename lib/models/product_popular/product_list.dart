import 'package:collection/collection.dart';

class ProductList {
	String? pid;
	String? title;
	String? category;
	int? price;
	String? coverUrl;

	ProductList({
		this.pid, 
		this.title, 
		this.category, 
		this.price, 
		this.coverUrl, 
	});

	@override
	String toString() {
		return 'ProductList(pid: $pid, title: $title, category: $category, price: $price, coverUrl: $coverUrl)';
	}

	factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
				pid: json['pid'] as String?,
				title: json['title'] as String?,
				category: json['category'] as String?,
				price: json['price'] as int?,
				coverUrl: json['cover_url'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'pid': pid,
				'title': title,
				'category': category,
				'price': price,
				'cover_url': coverUrl,
			};

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! ProductList) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toJson(), toJson());
	}

	@override
	int get hashCode =>
			pid.hashCode ^
			title.hashCode ^
			category.hashCode ^
			price.hashCode ^
			coverUrl.hashCode;
}
