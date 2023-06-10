package tad.utility;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import tad.entity.Feedback;
import tad.entity.Product;

public class Ultis {
	public static double getAvgStar(Product product) {
		double avgStar = 0;
		for (Feedback f : product.getFeedbacks()) {
			avgStar += f.getRatingStar();
		}
		if (product.getFeedbacks().size() > 0)
			avgStar /= product.getFeedbacks().size();
		return avgStar;
	}

	public static final void filterProductByIndex(int index, List<Product> productsFilterWithCategory) {
		switch (index) {
		case 0: {
			break;
		}
		case 1: {
			productsFilterWithCategory.sort(new Comparator<Product>() {

				@Override
				public int compare(Product o1, Product o2) {
					double price1 = o1.getPrice();
					double price2 = o2.getPrice();
					if (o1.getCoupon() != null)
						price1 -= o1.getPrice() * o1.getCoupon().getDiscount();
					if (o2.getCoupon() != null)
						price2 -= o2.getPrice() * o2.getCoupon().getDiscount();

					if (price1 < price2)
						return 1;
					else if (price1 > price2)
						return -1;
					return 0;
				}

			});

			break;
		}
		case 2: {
			productsFilterWithCategory.sort(new Comparator<Product>() {

				@Override
				public int compare(Product o1, Product o2) {
					double price1 = o1.getPrice();
					double price2 = o2.getPrice();
					if (o1.getCoupon() != null)
						price1 -= o1.getPrice() * o1.getCoupon().getDiscount();
					if (o2.getCoupon() != null)
						price2 -= o2.getPrice() * o2.getCoupon().getDiscount();
					if (price2 < price1)
						return 1;
					else if (price2 > price1)
						return -1;
					return 0;

				}
			});
			break;
		}

		case 3:

		{
			productsFilterWithCategory.sort(new Comparator<Product>() {

				@Override
				public int compare(Product o1, Product o2) {
					double ra = 0, rb = 0;

					if (o1.getFeedbacks() != null && o1.getFeedbacks().size() > 0) {
						for (Feedback f : o1.getFeedbacks()) {
							ra += f.getRatingStar();
						}
						ra /= o1.getFeedbacks().size();
					}

					if (o2.getFeedbacks() != null && o2.getFeedbacks().size() > 0) {
						for (Feedback f : o2.getFeedbacks()) {
							rb += f.getRatingStar();
						}
						rb /= o2.getFeedbacks().size();
					}
					if (ra < rb)
						return 1;
					else if (ra > rb)
						return -1;
					return 0;
				}
			});
			break;
		}

		}

	}

	public static List<Product> filterProductByPrice(int filterPrice, List<Product> productsFilterWithCategory) {
		switch (filterPrice) {

		case 0:
			break;
		case 1:
			return productsFilterWithCategory.stream().filter(p -> p.getPrice() < 100000).collect(Collectors.toList());
		case 2:

			return productsFilterWithCategory.stream().filter(p -> (p.getPrice() >= 100000 && p.getPrice() <= 200000))
					.collect(Collectors.toList());

		case 3:
			return productsFilterWithCategory.stream().filter(p -> (p.getPrice() >= 200000 && p.getPrice() <= 300000))
					.collect(Collectors.toList());

		case 4:
			return productsFilterWithCategory.stream().filter(p -> (p.getPrice() >= 300000 && p.getPrice() <= 500000))
					.collect(Collectors.toList());

		case 5:
			return productsFilterWithCategory.stream().filter(p -> (p.getPrice() >= 500000 && p.getPrice() <= 1000000))
					.collect(Collectors.toList());

		case 6:
			return productsFilterWithCategory.stream().filter(p -> p.getPrice() > 1000000).collect(Collectors.toList());

		}
		return productsFilterWithCategory;
	}

}
