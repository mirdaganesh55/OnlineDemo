<%@page import="com.java.jsf.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="portlet"%>
<%@ taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@ taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<!-- https://github.com/mirdaganesh55 -->
<!DOCTYPE html>
<html lang="en">
<head>
  <style>
        /* Style for labels */
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            font-size: 1em;
        }

        /* Style for form elements */
        body, input, select, textarea, button, .ui-btn {
            font-size: 1em;
            line-height: 1.3;
            font-family: Arial, sans-serif;
            margin-bottom: 1rem;
        }

        /* Style for error messages */
        .message {
            display: block;
            color: red;
            margin-top: -2rem;
        }

        /* Style for submit buttons */
        .submit-btn {
            background-color: #1ABC9C;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 1em;
            margin-bottom: 1rem;
        }

        .submit-btn:hover {
            background-color: #16A085;
        }

        /* Style for reset button */
        .reset-btn {
            background-color: #E74C3C;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 10px 20px;
            cursor: pointer;
            font-size: 1em;
            margin-bottom: 1rem;
        }

        .reset-btn:hover {
            background-color: #C0392B;
        }

        /* Style for links */
        a {
            color: #3498DB;
            text-decoration: none;
            display: inline-block;
            margin-bottom: 1rem;
        }

        a:hover {
            color: #2980B9;
        }

        /* Style for success message */
        .success-message {
            color: green;
            font-weight: bold;
        }
    </style>
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css" />
<script
	src="http://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Medicaid Application Form</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$(".dateOfBirth").datepicker({
			dateFormat : 'mm/dd/yy',
			changeMonth : true,
			changeYear : true,
			yearRange : "-100:+0" // Allow selection of the last 100 years
		});
	});
</script>
<style>
/* Style for labels */
label {
	display: inline-block;
	margin-bottom: 5px;
}

/* Style for form elements */
body, input, select, textarea, button, .ui-btn {
	    font-size: 1em;
    line-height: 1.3;
    font-family: initial;
    margin-bottom: 2rem;
    padding-block: 0px;
}
</style>
</head>
<body
	style="font-family: Arial, sans-serif; background-color: #f4f4f4; margin: 0; padding: 0;">
	<f:view>
		<h:form id="form">
			<div
				style="background-color: #1ABC9C; color: aliceblue; padding: 0px; text-align: center;"
				class="header">
				<h2>Medicaid Application Form</h2>
			</div>
			<div style="max-width: fit-content; margin: auto; padding: 23px;"
				class="container">

				<label for="firstName">First Name <span
					style="color: red;">*</span></label>
				<f:loadBundle basename="Messages" var="msg" />
				<div style="display: block; vertical-align: middle;">
					<h:inputText id="firstName" value="#{person.firstName}"
						validatorMessage="#{msg.fnameError}">
						<f:validateRegex pattern="^[A-Za-z\\s]+$" />
					</h:inputText>
				</div>
				<span class="message"> 
				<h:message for="firstName"
						style="display: block; color: red; margin-top: -2rem;" />
				</span> <br/> 
				
				<label for="lastName">Last Name <span
					style="color: red;">*</span></label>
				<f:loadBundle basename="Messages" var="msg" />
				<div style="display: block; vertical-align: middle;">
					<h:inputText id="lastName" value="#{person.lastName}"
						validatorMessage="#{msg.lnameError}">
						<f:validateRegex pattern="^[A-Za-z\\s]+$" />
					</h:inputText>
				</div>
				<span class="message"> 
				<h:message for="lastName"
						style="display: block; color: red; margin-top: -2rem;" />
				</span> 
				<br/> 

				<h:outputLabel for="gender" value="Gender:" />
				<h:selectOneMenu id="gender" value="#{person.gender}" >
					<f:selectItem itemLabel="Select Gender" itemValue="" />
					<f:selectItem itemLabel="Male" itemValue="Male" />
					<f:selectItem itemLabel="Female" itemValue="Female" />
					<f:selectItem itemLabel="Other" itemValue="Other" />
				</h:selectOneMenu>
				<span class="message">
				<h:message for="gender" style="display: block; color: red;margin-top: -2rem;"/>
				</span>
				<br/> 
				
				<label for="dateOfBirth">Date of Birth <span
					style="color: red;">*</span></label>
				<div style="display: block; vertical-align: middle;">
					<h:inputText id="dateOfBirth" value="#{person.dateOfBirth}"
						styleClass="dateOfBirth">
						<f:convertDateTime pattern="MM/dd/yyyy" />
					</h:inputText>
				</div>
				<span class="message">
				<h:message for="dateOfBirth"
					style="display: block; color: red;margin-top: -2rem;" />
				</span><br/> 
				
				<label for="ssn">Social Security Number (SSN) <span
					style="color: red;">*</span></label>
				<f:loadBundle basename="Messages" var="msg" />
				<div style="display: block; vertical-align: middle;">
					<h:inputText id="ssn" value="#{person.ssn}"
						validatorMessage="#{msg.ssnError}">
						<f:validateRegex pattern="^\d{6}$" />
					</h:inputText>
				</div>
				<span class="message"> <h:message for="ssn"
						style="display: block; color: red; margin-top: -2rem;" />
				</span> <br/> 
				
				<label for="email">Email <span
					style="color: red;">*</span></label>
				<f:loadBundle basename="Messages" var="msg" />
				<div style="display: block; vertical-align: middle;">
					<h:inputText id="email" value="#{person.email}"
						validatorMessage="#{msg.emailError}">
						<f:validateRegex pattern="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"/>
					</h:inputText>
				</div>
				<span class="message"> 
				<h:message for="email" style="display: block; color: red; margin-top: -2rem;" />
				</span> <br/> 
				
				<label for="phoneNumber">Phone Number <span
					style="color: red;">*</span></label>
				<f:loadBundle basename="Messages" var="msg" />
				<div style="display: block; vertical-align: middle;">
					<h:inputText id="phoneNumber" value="#{person.phoneNumber}"
						validatorMessage="#{msg.pNumError}">
						<f:validateRegex pattern="^\d{10}$"/>
					</h:inputText>
				</div>
				<span class="message"> 
				<h:message  for="phoneNumber" style="display: block; color: red; margin-top: -2rem;" />
				</span> <br/> 
				
				<label for="income">Income <span
					style="color: red;">*</span></label>
				<div style="display: block; vertical-align: middle;">
					<h:inputText id="income" value="#{person.income}"/>
				</div>
				<span class="message"> 
				<h:message for="income" style="display: block; color: red; margin-top: -2rem;" />
				</span> <br/> 
				
				<label for="address">Address <span
					style="color: red;">*</span></label>
				<f:loadBundle basename="Messages" var="msg"/>
				<div style="display: block; vertical-align: middle;">
					<h:inputTextarea id="address" value="#{person.address}" validatorMessage="#{msg.addressError}">
						<f:validateRegex pattern="^[a-zA-Z0-9\s,-]*$" />
					</h:inputTextarea>
				</div>
				<span class="message"> 
				<h:message for="address" style="display: block; color: red; margin-top: -2rem;" />
				</span><br/> 

				<h:selectBooleanCheckbox id="isEmployed" value="#{person.isEmployed}" onclick="showEmploymentDetails(this)"/>
				<h:outputLabel for="isEmployed" value="Employed" />

				<h:panelGroup id="employmentDetails" style="display:none;">
				<h:outputLabel for="company" value="Company Name :" />
					<h:inputText id="company" value="#{employ.company}"/>
					<h:message for="company"
						style="display: block; color: red; margin-top: -2rem;" /><br/>

				<h:outputLabel for="role" value="Job Profile :" />
					<h:inputText id="role" value="#{employ.role}" />
					<h:message for="role"
						style="display: block; color: red; margin-top: -2rem;" /><br/>
				
					<h:outputLabel for="experience" value="Experience :" />
					<h:inputText id="experience" value="#{employ.experience}" />
					<h:message for="experience"
						style="display: block; color: red; margin-top: -2rem;" />
				</h:panelGroup>

				<h:message for="isEmployed" style="display: block; color: red;margin-top: -2rem;"/>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				<h:selectBooleanCheckbox id="hasDependents"
					value="#{person.hasDependents}" />
				<h:outputLabel for="hasDependents" value="Has Dependents" />
				<h:message for="hasDependents" style="display: block; color: red;margin-top: -2rem;"/>
				<br />

				<h:commandButton value="Submit"
					action="#{personController.addValidConditions(person,employ)}"
					styleClass="ui-input-btn ui-btn ui-mini ui-btn-inline 
            ui-corner-all ui-btn-b" />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<h:commandButton type="button" value="Reset" onclick="resetForm()" styleClass="ui-input-btn ui-btn ui-mini ui-btn-inline ui-corner-all ui-btn-b" />

				<br />
				
				<h:outputLink value="Home.jsf">Back to Home Page</h:outputLink>
				<br />

				<h:outputText value="#{person.successMessage}"
					rendered="#{not empty person.successMessage}"
					style="color: green; font-weight: bold;" styleClass="success-message"/>
			</div>
		</h:form>
		<script >
		function resetForm() {
		    // Clear input fields
		    document.getElementById("form:ssn").value = "";
		    document.getElementById("form:firstName").value = "";
		    document.getElementById("form:lastName").value = "";
		    document.getElementById("form:gender").value = "";
		    document.getElementById("form:dateOfBirth").value = "";
		    document.getElementById("form:email").value = "";
		    document.getElementById("form:phoneNumber").value = "";
		    document.getElementById("form:income").value = "";
		    document.getElementById("form:address").value = "";
		    document.getElementById("form:isEmployed").checked = false;
		    document.getElementById("form:hasDependents").checked = false;
			document.getElementById("form:employmentDetails").style.display = "none";
		    document.getElementById("form:company").value = "";
		    document.getElementById("form:role").value = "";
		    document.getElementById("form:experience").value = "";
			
		    // Clear error messages
		    var errorMessages = document.querySelectorAll(".message");
		    errorMessages.forEach(function(errorMessage) {
		        errorMessage.innerHTML = "";
		    });
		}
		function showEmploymentDetails(checkbox) {
		    var employmentDetails = document.getElementById("form:employmentDetails");
		    if (checkbox.checked) {
		        employmentDetails.style.display = "block";
		    } else {
		        employmentDetails.style.display = "none";
		    }
		}
		</script>
	</f:view>
</body>
</html>
