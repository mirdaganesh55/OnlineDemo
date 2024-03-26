package com.java.jsf;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.GenericPortlet;
import javax.portlet.PortletException;
import javax.portlet.PortletSession;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

public class SenderPortlet extends GenericPortlet{
	
	@Override
	protected void doView(RenderRequest request, RenderResponse response) throws PortletException, IOException {
        getPortletContext().getRequestDispatcher("/senderView.jsp").include(request, response);
	}
	
	 public void processAction(ActionRequest request, ActionResponse response) throws PortletException, java.io.IOException {
	        String data = request.getParameter("data");
	        PortletSession session = request.getPortletSession();
	        session.setAttribute("sharedData", data, PortletSession.APPLICATION_SCOPE);
	    }
}
