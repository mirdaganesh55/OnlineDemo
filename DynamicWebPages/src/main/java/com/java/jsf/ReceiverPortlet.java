package com.java.jsf;

import java.io.IOException;

import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

public class ReceiverPortlet extends GenericPortlet{


	@Override
	protected void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
		PortletSession session = request.getPortletSession();
		String sharedData = (String) session.getAttribute("sharedData", PortletSession.APPLICATION_SCOPE);
		request.setAttribute("sharedData", sharedData);
		getPortletContext().getRequestDispatcher("/receiverView.jsp").include(request, response);
	}
}
