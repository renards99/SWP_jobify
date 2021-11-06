/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Employer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.paypal.api.payments.*;
import com.paypal.base.rest.PayPalRESTException;
import dao.WalletDAO;
import model.User;
import model.Wallet;

public class ExecutePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ExecutePayment() {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String paymentId = request.getParameter("paymentId");
		String payerId = request.getParameter("PayerID");
                HttpSession session = request.getSession();
		try {
			PaymentServices paymentServices = new PaymentServices();
			Payment payment = paymentServices.executePayment(paymentId, payerId);
			
			PayerInfo payerInfo = payment.getPayer().getPayerInfo();
			Transaction transaction = payment.getTransactions().get(0);
			
			request.setAttribute("payer", payerInfo);
			request.setAttribute("transaction", transaction);			
                        User user=(User) session.getAttribute("acc");
                        double amount=Double.parseDouble(transaction.getAmount().getTotal());
                        WalletDAO wDAO=new WalletDAO();
                        Wallet wallet=  wDAO.getWallet(user.getUsername());
                        
                        wDAO.updateWallet(user.getUsername(), amount+wallet.getBalance());
                        
                        wDAO.addToHistory(user.getUsername(), 1, amount);
            
			request.getRequestDispatcher("Employer/receipt.jsp").forward(request, response);
			
		} catch (PayPalRESTException ex) {
			request.setAttribute("errorMessage", ex.getMessage());
			ex.printStackTrace();
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}