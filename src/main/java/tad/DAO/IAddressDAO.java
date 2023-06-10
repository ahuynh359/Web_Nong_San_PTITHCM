package tad.DAO;

import java.util.ArrayList;
import java.util.List;

import tad.entity.Account;
import tad.entity.Address;
import tad.entity.Province;
import tad.entity.Ward;

public interface IAddressDAO {
	public ArrayList<Province> getProvinceList();

	public Account fetchAddressAccount(Account account);

	public Address getAddress(int id);

	public boolean insertAddress(Account account, Address address);

	public boolean updateAddress(Address address);

	public boolean deleteAddress(Address address);

	public List<Address> getAddressesByAccountId(int accountId);

	public Ward getWard(int id);
}
