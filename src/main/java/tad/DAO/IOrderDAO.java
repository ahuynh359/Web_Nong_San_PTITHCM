package tad.DAO;

import java.util.List;

import tad.entity.OrderDetail;
import tad.entity.Orders;

public interface IOrderDAO {
	public List<Orders> getOrderFromAccount(int accountId);

	public List<Orders> getOrderFromProduct(int productId);

	public List<OrderDetail> getOrderDetail(int orderId);

	public Orders findOrder(int id);

	public boolean update(Orders order);

	boolean insertOrder(Orders order);

	boolean insertOrderDetail(OrderDetail orderDetail);

	boolean updateOrder(Orders order);

	public Orders fetchOrderDetail(Orders order);

	public List<Orders> getUnresolveOrders();

	public List<Orders> getMovingOrders();

	public List<Orders> getResolveOrders();

	public List<Orders> getCancelOrders();

	public List<Orders> getOrders();
}
