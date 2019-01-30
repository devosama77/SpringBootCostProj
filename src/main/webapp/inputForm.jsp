<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="t" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Tanker Costing</title>
    <style type="text/css">
        .error {
            color: red;
        }

    </style>
    <style>
        /* Make the image fully responsive */
        .carousel-inner img {
            width: 100%;
            height: 100%;
        }
        .bouton-image:before {
            content: "";
            width: 16px;
            height: 16px;
            display: inline-block;
            margin-right: 5px;
            vertical-align: text-top;
            background-color: transparent;
            background-position : center center;
            background-repeat:no-repeat;
        }

        .monBoutoncalc:before{
            background-image : url(http://icons.iconarchive.com/icons/iconleak/atrous/16/calculator-icon.png);
        }
        .monBoutonDelete:before{
            background: url("http://icons.iconarchive.com/icons/hopstarter/sleek-xp-basic/16/Close-2-icon.png");
        }

        .error {
            color: red;
        }
        table {
            float:left;
            width:50%;
        }
    </style>
    <script>
        function changSalary(obj) {
            var v=obj.value;
            if(v=="SALARIES - DRIVERS (HOUR/ 8 HOUR)"){
                var parent=document.getElementById("salary");
                var salaryId= document.getElementById("salaryId");
                while (parent.hasChildNodes()) {
                    parent.removeChild(parent.lastChild);
                }
                salaryId.removeAttribute("disabled");
                salaryId.setAttribute("enabled",true);
                option1=document.createElement("option");
                option1.setAttribute("value","300");
                option1.innerHTML="300";
                parent.appendChild(option1);
            }
            else if(v=="SALARIES - DRIVERS (TRIP/DISTANT)"){
                var parent=document.getElementById("salary");
                var salaryId= document.getElementById("salaryId");
                while (parent.hasChildNodes()) {
                    parent.removeChild(parent.lastChild);
                }
                salaryId.removeAttribute("disabled");
                salaryId.setAttribute("enabled",true);
                option1=document.createElement("option");
                option1.setAttribute("value","100");
                option1.innerHTML="100";
                option2=document.createElement("option");
                option2.setAttribute("value","80");
                option2.innerHTML="80";
                parent.appendChild(option1);
                parent.appendChild(option2);
            }
            else if(v=="SALARIES - DRIVERS (20% of revenue)"){
                var salaryId= document.getElementById("salaryId");
                var salary=document.getElementById("salary");
                while (salary.hasChildNodes()) {
                    salary.removeChild(salary.lastChild);
                }
                salary.removeAttribute("enabled");
                salary.setAttribute("disabled",true);
                salaryId.innerHTML="0.0";
                salaryId.removeAttribute("enabled");
                salaryId.setAttribute("disabled",true);
                salaryId.value("0,0");

            }

        }
        function changeWater(obj) {
            var v=obj.value;
            if(v=="Water: IWK"){
                var parent=document.getElementById("water");
                while (parent.hasChildNodes()) {
                    parent.removeChild(parent.lastChild);
                }
                option1=document.createElement("option");
                option1.setAttribute("value","148.5");
                option1.innerHTML="148.5";
                parent.appendChild(option1);
            }
            else if(v=="Water: SAJ"){
                var parent=document.getElementById("water");
                while (parent.hasChildNodes()) {
                    parent.removeChild(parent.lastChild);
                }
                option1=document.createElement("option");
                option1.setAttribute("value","200");
                option1.innerHTML="200";
                parent.appendChild(option1);
            }else if(v=="Water: SYABAS"){
                var parent=document.getElementById("water");
                while (parent.hasChildNodes()) {
                    parent.removeChild(parent.lastChild);
                }
                option1=document.createElement("option");
                option1.setAttribute("value","178");
                option1.innerHTML="178";
                parent.appendChild(option1);
            }
        }
    </script>
  <script>
      $(document).ready(function()
      {
          function updateDeliveryTime()
          {
              var buyer = parseFloat($("#buyer").val());
              var mill = parseFloat($("#mill").val());
              var base = parseFloat($("#base").val());
              var total=buyer+mill+base;
              var parseVloat=parseFloat(total);
              var totalDelivery=parseVloat/80;
              $("#delivery").val(totalDelivery);
          }
          $(document).on("change, keyup", "#buyer", updateDeliveryTime);
          $(document).on("change, keyup", "#mill", updateDeliveryTime);
          $(document).on("change, keyup", "#base", updateDeliveryTime);
      });
    </script>
</head>

<body>

<div class="container">

    <h3>
        <security:authorize access="isAnonymous()">
            Welcome !   Guest
        </security:authorize>
        <!-- Print the logged in user name -->
    </h3>
    <security:authorize access="isAnonymous()">
        Login as <a href="/user">User</a> or <a href="/admin">Admin</a>
    </security:authorize>

    <security:authorize access="isAuthenticated()">
            <security:authorize access="hasAnyRole('USER','ADMIN')">
            <div class="container">
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <!-- Brand -->
                        <a class="nav-link" href="#">
                            <img src="/resources/images/logo.jpg" class="img-circle" alt="Terasek" width="50px" height="50px"/>
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link active" href="/calculate">Calculate</a>
                    </li>

                    <srping:url value="/logout" var="logout" ></srping:url>
                    <li class="nav-item">
                        <a class="nav-link" href="${logout}">Log Out</a>
                    </li>
                </ul>
            </div>

   <form:form action="calculate" method="post" modelAttribute="cost" class="form-group">
        <table class="table">
            <tr>
                <td>
                    <from:label path="sizeOfTanker"  >Size of tanker</from:label>
                    <form:select path="sizeOfTanker" class="form-control" >
                          <form:options items="${cost.linkedHashMapSizeTanker}"></form:options>
                        </form:select>
                    <span style="color: red">m3</span>
                </td>
                <td>
                    <from:label path="dieselBaseRate" >Diesel Base Rate</from:label>
                    <form:input path="dieselBaseRate" value="2"  class="form-control"></form:input><span style="color: red">RM</span>
                    <form:errors path="dieselBaseRate" cssClass="error" />
                </td>
                <td>
                    <from:label path="currentRate" >current Rate</from:label>
                    <form:input path="currentRate" value="2.23"  class="form-control"/><span style="color: red">RM</span>
                    <form:errors path="currentRate" cssClass="error" />
                </td>
                <td>
                    <from:label path="distanceToBuyer" >Distance to Buyer (KM)</from:label>
                    <form:input path="distanceToBuyer"  value="0.0" id="buyer" onkeyup="add(this)" class="form-control"/><span style="color: red">KM</span>
                    <form:errors path="distanceToBuyer" cssClass="error" />
                </td>

                <td>
                    <from:label path="distanceToMill" >Distance to Mill (KM)</from:label>
                    <form:input path="distanceToMill" value="0.0" id="mill" class="form-control"/><span style="color: red">KM</span>
                    <form:errors path="distanceToMill" cssClass="error" />
                </td>
                <td>
                    <from:label path="distanceToBase" >Distance to Base</from:label>
                    <form:input path="distanceToBase"   value="0.0" id="base" class="form-control"/><span style="color: red">KM</span>
                    <form:errors path="distanceToBase" cssClass="error" />
                </td>
             </tr>
            <tr>
                <td>
                    <from:label path="capacity" >Capacity(mt)</from:label>
                    <form:input path="capacity"  value="0.0" class="form-control"/>
                    <span style="color: red">mt</span>
                    <br><form:errors path="capacity" cssClass="error" />
                </td>
                <td>
                    <from:label path="standByTime" >Stand By Time</from:label>
                    <form:input path="standByTime"  value="0.0" class="form-control"/>
                    <span style="color: red">Hours</span>
                    <br><form:errors path="standByTime" cssClass="error" />
                </td>
                <td>
                    <from:label path="deliveryTime" data-toggle="tooltip" data-placement="top" title="Time will affect Touch n'Go amount">Delivery Time</from:label>
                    <form:input path="deliveryTime"  value="0.0" class="form-control" id="delivery"/>
                    <span style="color: red">Hours</span>
                    <br><form:errors path="deliveryTime" cssClass="error" />
                </td>
                <td>
                    <from:label path="salariesString" data-toggle="tooltip" data-placement="top" title="if you will choose Salary Revenue
                                                        the value will be 0.0 and will calculate the salary from the pricing">SALARIES - DRIVERS</from:label>
                    <form:select  path="salariesString"  onchange="changSalary(this)" class="form-control">
                        <form:options  items="${cost.linkedHashMapSalariesType}"></form:options>
                    </form:select>
                    <form:input path="salaryList" list="salary" id ="salaryId" value="0.0" />
                    <datalist id="salary">
                            <option  value="80" ></option>
                            <option  value="100" ></option>
                    </datalist>
                    <span style="color: red">RM</span><br>
                    <form:errors path="salaryList" cssClass="error" />
                </td>
                <td>
                    <from:label path="salaryPerHour" >SALARIES - DRIVERS (HOUR OT / 1 HOUR)</from:label>
                     <form:input path="salaryPerHour"  value="0.0" class="form-control" /><span style="color: red">Hours</span>
                        <form:errors path="salaryPerHour" cssClass="error" />
                </td>
                <%--<td>--%>
                    <%--<from:label path="salaryRevenue" >SALARIES - DRIVERS (20% of revenue)</from:label>--%>
                    <%--<form:input path="salaryRevenue"   value="0.0" class="form-control"/> <span style="color: red">RM</span>--%>
                      <%--<form:errors path="salaryRevenue" cssClass="error" />--%>

            </tr>
        </table>


    <table class="table">
        <caption>Variable Cost</caption>
        <tr>
            <td>
                <from:label path="waterString" >Water</from:label>
                <form:select path="waterString" onchange="changeWater(this)" class="form-control">
                    <form:options items="${cost.linkedHashMapWaterType}" ></form:options>
                </form:select>
                    <form:input path="waterList" list="water" id ="waterId" value="148.5"/>
                    <datalist id="water">
                    <option value="148.5"/>
                    </datalist>

                <%--<form:select path="waterList" id="waterId" class="form-control">--%>
                    <%--<form:option value="148.5" ></form:option>--%>
                <%--</form:select>--%>
                <span style="color: red">RM</span><br>
                <form:errors path="salaryList" cssClass="error" />
            </td>
            <td>
                <from:label path="rentalTanker" data-toggle="tooltip" data-placement="top" title="Rent tanker from other contractors" >Rental Tanker</from:label>
                <form:input path="rentalTanker" type="number" value="0.0" class="form-control"/><span style="color: red">RM</span> <br />
                <form:errors path="rentalTanker" cssClass="error" />
            </td>
            <td>
                <from:label path="disposalPlace" >Disposal Place</from:label>
                <form:input path="disposalPlace" type="number" value="0.0" class="form-control"/> <span style="color: red">RM</span><br />
                <form:errors path="disposalPlace" cssClass="error" />
            </td>

            <td>
                <from:label path="washTanker" >Wash Tanker</from:label>
                <form:input path="washTanker" type="number" value="0.0" class="form-control"/> <span style="color: red">RM</span><br />
                <form:errors path="washTanker" cssClass="error" />
            </td>
            <td>
                <from:label path="markUpPrecentage" >Mark up</from:label>
                <form:input path="markUpPrecentage" type="number" value="0.0" class="form-control"/><span style="color: red">%</span><br />
                <form:errors path="markUpPrecentage" cssClass="error" />
            </td>
        </tr>

        <tr>
                <td><button type="submit" class="btn btn-primary monBoutoncalc bouton-image" formtarget="_blank">Submit</button></td>
            </tr>

    </table>
</form:form>
        </security:authorize>
    </security:authorize>
</div>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>