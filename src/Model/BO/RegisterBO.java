package Model.BO;

import Model.DAO.RegisterDAO;

public class RegisterBO {
	public void Register(String email) {
		RegisterDAO registerDAO = new RegisterDAO();
		registerDAO.register(email);
	}
}