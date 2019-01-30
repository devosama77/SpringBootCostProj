
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.ByteArrayInputStream" %>

<%@ page import="org.springframework.web.servlet.ModelAndView" %>
<%@ page import="com.osama.model.Cost" %>
<%@ page import="com.osama.model.AllCost" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="srping" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<%--
  Created by IntelliJ IDEA.
  User: User
  Date: 25/12/2017
  Time: 9:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Tanker Costing</title>
    <style type="text/css">
        .error {
            color: red;
        }
        table {
            float:left;
            width:50%;
        }
        tr{
            border-top: 1px solid black
        }
    </style>
</head>
<body>
<div class="container">
<h2>TSSB Costing Per Days ( All Item are based on Average number of  tanker ) </h2>
<%   Cost cost= (Cost) request.getAttribute("cost");
    ServletContext servletContext = getServletConfig().getServletContext();
    AllCost allCost = (AllCost) servletContext.getAttribute("allCost");
%>
<security:authorize access="isAuthenticated()">
        <ul class="nav nav-tabs">
            <li class="nav-item">
                <!-- Brand -->
                <a class="nav-link" href="#">
                    <img src="/resources/images/logo.jpg" class="img-circle" alt="Terasek" width="50px" height="50px"/>
                </a>
            </li>

            <li class="nav-item">
                <a class="nav-link active" href="/">Go Back</a>
            </li>
            <srping:url value="/download?type=xlsx" var="xlsUrl" ></srping:url>
            <srping:url value="/download?type=pdf" var="pdfUrl"></srping:url>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">Download</a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="${xlsUrl}">EXCEL</a>
                    <a class="dropdown-item" href="${pdfUrl}">PDF</a>
                </div>
            </li>
            <srping:url value="/logout" var="logout" ></srping:url>
            <li class="nav-item">
                <a class="nav-link" href="${logout}">Log Out</a>
            </li>
        </ul>

    <div class="col-xs-6">
        <div class="table-responsive">
            <table class="table table-striped" style="color: blue">
                <thead>
    <tr style="border-bottom: 1px solid black;color: red">
        <th>Item</th>
        <th><span style="color: red">Tanker Size:${cost.sizeOfTanker}</span></th>
    </tr>
    </thead>
   <tbody>
    <tr data-toggle="tooltip" data-placement="top" title="(Current Rate-Diesel Base Rate)*.45 =[(${cost.currentRate}-${cost.dieselBaseRate})*.45]">
        <td><span style="color: blue">Fuel Surcharge Rate</span></td>
        <td>${cost.fuelSurchargeRate}</td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="${cost.distanceToBuyer}">
        <td><span style="color: blue">Distance To Buyer</span></td>
        <td>${cost.distanceToBuyer}</td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="${cost.distanceToMill}">
        <td><span style="color: blue">Distance To Mill</span></td>
        <td>${cost.distanceToMill}</td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="${cost.distanceToBase}">
        <td><span style="color: blue">Distance To Base</span></td>
        <td>${cost.distanceToBase}</td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="${cost.capacity}">
        <td><span style="color: blue">Capacity (mt)</span></td>
        <td>${cost.capacity}</td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="${cost.standByTime}">
        <td><span style="color: blue">Stand By Time</span></td>
        <td>${cost.standByTime}</td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="${cost.deliveryTime}">
        <td><span style="color: blue">Delivery Time</span></td>
        <td>${cost.deliveryTime}</td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="${cost.salaryList}">
        <td><span style="color: blue">${cost.salariesString}</span></td>
        <td>
        <%
        out.write(String.valueOf(allCost.getSalaryCalc()));
        %></td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="${cost.salaryPerHour}*100">
        <td><span style="color: blue">SALARIES - DRIVERS (HOUR OT / 1 HOUR)</span></td>
        <td>
        <%
        out.write(String.valueOf(allCost.getSalaryPerHourCalc()));
        %>
        </td>
    </tr>
    <%--<tr data-toggle="tooltip" data-placement="top" title="${cost.salaryRevenue}" >--%>
        <%--<td><span style="color: blue">SALARIES - DRIVERS (20% of revenue)</span></td>--%>
        <%--<td>${cost.salaryRevenue}</td>--%>
    <%--</tr>--%>
    <tr data-toggle="tooltip" data-placement="top" title=" <%
        out.write(String.valueOf(allCost.getWaterCalc()));
        %>">
        <td>   ${cost.waterString}
        </td>
        <td>
                ${cost.waterList}
       </td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="${cost.rentalTanker}">
        <td><span style="color: blue">Rental Tanker</span></td>
        <td>${cost.rentalTanker}</td>
    </tr>
        <tr data-toggle="tooltip" data-placement="top" title="${cost.disposalPlace}">
            <td><span style="color: blue">DISPOSAL PLACE</span></td>
            <td>${cost.disposalPlace}</td>
        </tr>
    <tr data-toggle="tooltip" data-placement="top" title="${cost.washTanker}">
        <td>Wash Tanker</td>
        <td>${cost.washTanker}</td>
    </tr>
    <tr style="color: black" data-toggle="tooltip" data-placement="top" title="(${cost.distanceToBuyer}+${cost.disposalPlace}+<br>${cost.distanceToBase})*.45*2">
        <td>DIESEL & PETROL (0.45L/Km) </td>
        <td><%
            out.write(String.valueOf(allCost.getDieselPetrol()));%></td>
    </tr>
    <tr style=" color: black" data-toggle="tooltip" data-placement="top" title="${cost.deliveryTime}*9">
        <td>TOLL FEE (1%-3%)or(RM9/hrs)</td>
        <td><% out.write(String.valueOf(allCost.getToolFee()));%></td>
    </tr>
    <tr style="color: black" style=" color: black" data-toggle="tooltip" data-placement="top" title="${cost.standByTime}*200">
        <td>Standby Time</td>
        <td><%
            out.write(String.valueOf(allCost.getStandByTimeCalc()));
        %></td>
    </tr>
    <tr style="border-top: 1px solid black;color: black " style="color: black" style=" color: black" data-toggle="tooltip" data-placement="top" title='Total Variable Cost=<%out.write("["+allCost.getSalaryCalc()+"+"+
    allCost.getWaterCalc()+"+"+allCost.getSalaryPerHourCalc()+"+"+allCost.getSalaryRevenue()+"+ "+
                allCost.getRentalTanker()+"+ "+allCost.getDisposalPlace()+"+"+allCost.getWashTanker()+"+ "+allCost.getStandByTimeCalc()+"+"+allCost.getDieselPetrol()
                +"+"+allCost.getToolFee());
            %>]'>
        <td><strong>Total Variable Cost</strong></td>
        <td><%
            out.write(String.valueOf(allCost.getTotalVariableCost()));
            %>
        </td>
    </tr>
    <%--<tr style="background-color: azure">--%>
        <%--<td>--%>
       <%--</td></tr>--%>
   </tbody>

</table>

        </div>
    </div>

    <div class="col-xs-6">
        <div class="table-responsive">
    <table class="table table-striped">
 <%-- ................................... Fixed Cost .............................................................................................--%>
    <thead>
     <tr style="border-bottom: 1px solid black;color: red">
         <th>Item</th>
         <th><span style="color: red">Tanker Size:${cost.sizeOfTanker}</span></th>
     </tr>
    </thead>
     <tbody>
    <tr data-toggle="tooltip" data-placement="top" title="if Size Tanker (33, 40,50) GIT INSURANCE =20150/11 or GIT INSURANCE=0">
        <td >GIT INSURANCE</td>
        <%--<td><% double gitInsurancePrice=20150/11d;--%>
        <%--out.write(String.valueOf(gitInsurancePrice));%></td>--%>
        <td >
            <%
            out.write(String.valueOf(allCost.getGitInsurance()));
        %></td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="if Size Tanker (33) VEHICLE INSURANCE=(9419.03/12)/22 or
                                                              if Size Tanker (40) VEHICLE INSURANCE=(7097.29/12)/22
                                                              if Size Tanker (50) VEHICLE INSURANCE=(19515.01/12)/22
                                                              if Size Tanker (ISO TANKER) VEHICLE INSURANCE=(8118.22/12)/22
                                                              or VEHICLE INSURANCE=0">
        <td>VEHICLE INSURANCE </td>

        <td><%
            out.write(String.valueOf(allCost.getVehicleInsurance()));
        %></td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="if Size Tanker (33)VEHICLE ROAD TAX=(530/12)/22 or
                                                              if Size Tanker (40)VEHICLE ROAD TAX=(567/12)/22
                                                              if Size Tanker (50)VEHICLE ROAD TAX=(370/12)/22
                                                              if Size Tanker (ISOTANKER) VEHICLE ROAD TAX=(132/12)/22
                                                              or VEHICLE ROAD TAX=0">
        <td>
            VEHICLE ROAD TAX </td>

        <td><%
            out.write(String.valueOf(allCost.getVehicleRoadTax()));
        %></td>
    </tr>

    <tr data-toggle="tooltip" data-placement="top" title="if Size Tanker (33,40,50,ISO TANKER)JPJ INSPECTION =(800)/22 or
                                                              or JPJ INSPECTION =0">
        <td>JPJ INSPECTION </td>
        <td><%
                out.write(String.valueOf(allCost.getJpjInspection()));
            %>
        </td>
    </tr>

    <tr data-toggle="tooltip" data-placement="top" title="if Size Tanker (33,40,50,ISO TANKER)PUSHPAKOM INSPECTION =(200)/22 or
                                                               PUSHPAKOM INSPECTION =0">
        <td
        >PUSHPAKOM INSPECTION </td>
        <td><%
            out.write(String.valueOf(allCost.getPushpakomInspection()));
        %></td>
    </tr>

    <tr data-toggle="tooltip" data-placement="top" title="if Size Tanker (10,20,33,40,50,ISO TANKER,Storage Tank) then GPS MAINTENANCE=(50)/22">
        <td
        >GPS MAINTENANCE</td>
        <td><%
            out.write(String.valueOf(allCost.getGpsMaintenance()));
        %></td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="if Size Tanker (33)then INSTALLMENT OF TANKER=(50)
                                                              if Size Tanker (50)then INSTALLMENT OF TANKER=(212)
                                                              if Size Tanker (50)then INSTALLMENT OF TANKER=(3636/30)
                                                              if Size Tanker (50)then INSTALLMENT OF TANKER=(60)">
        <td
        >INSTALLMENT OF TANKER</td>
        <td><%
            out.write(String.valueOf(allCost.getInstallMentOfTanker()));
        %></td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="if Size Tanker (33,40,50,ISO TANKER)VEHICLE MAINTANENCE=(550923d+8678.02+23261.01)/25/12/22) or
                                                               VEHICLE MAINTANENCE =0">
        <td>VEHICLE MAINTANENCE</td>
        <td><%
        out.write(String.valueOf(allCost.getVehicleMaintanence()));
        %></td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="if Size Tanker (33,40,50,ISO TANKER) then Admin Cost=(50000/34/22) or
                                                               Admin Cost =0">
        <td>Admin Cost (5% on 1m sales )</td>
        <td><%
            out.write(String.valueOf(allCost.getAdminCost()));
        %></td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="if Size Tanker (33,40,50,ISO TANKER) then HARDWARE=((94915.98/34)/9/22) or HARDWARE=0">
        <td>HARDWARE</td>
        <td><%
            out.write(String.valueOf(allCost.getHardware()));
        %></td>
    </tr>

    <tr style="border-top: 1px solid black" data-toggle="tooltip" data-placement="top" title="if rental tanker >1 then Total Fixed =0 or Calculate total fixed cost"
                                                                         >
        <%--+"+"+allCost.getVehicleInsurance()+"+"+allCost.getVehicleRoadTax()--%>
        <%--+"+"+allCost.getJpjInspection()+"+"+allCost.getPushpakomInspection()+"+"+allCost.getGpsMaintenance()+"+"+--%>
        <%--allCost.getInstallMentOfTanker()+"+"+allCost.getVehicleMaintanence()+"+"+allCost.getAdminCost()+"]");--%>
        <td><strong>Total Fixed Cost</strong></td>
        <td><strong><%
            out.write(String.valueOf(allCost.getTotalFixedCost()));
        %></strong></td>
    </tr>
    <tr style="border-top: 1px solid black; color: red" data-toggle="tooltip" data-placement="top" title='totalCost=totalFixedCost+totalVar=[<% out.write(allCost.getTotalFixedCost()+"+"+allCost.getTotalVariableCost());%>]'>
        <td><strong>Total Cost</strong></td>
    <td><strong><%
        out.write(String.valueOf(allCost.getTotalCost()));
    %></strong></td>
    </tr>
        <%-- ...................................... additional Expenses ............................--%>
    <tr data-toggle="tooltip" data-placement="top" title="Total Cost * 10%">
        <td
        >Additional Expenses</td>

        <td><%
            out.write(String.valueOf(allCost.getAdditionalExpenses()));
        %></td>
    </tr>

    <tr data-toggle="tooltip" data-placement="top" title="(Additional Expenses + Total Cost) * 30%">
        <td
        >Mark up</td>
        <td><%
            out.write(String.valueOf(allCost.getMarkup()));
        %></td>
    </tr>
    <tr style="color: red; border-top: 1px solid black" data-toggle="tooltip" data-placement="top" title="totalCost+ additionalExpenses+ markup=(
                                                                                                          <% out.write(String.valueOf(allCost.getTotalCost())); %>+
                                                                                                          <% out.write(String.valueOf(allCost.getAdditionalExpenses())); %>+
                                                                                                           <% out.write(String.valueOf(allCost.getMarkup())); %>)">
        <td>Pricing</td>

        <td><strong><%
            out.write(String.valueOf(allCost.getPricing()));
        %></strong></td>
    </tr>
    <tr data-toggle="tooltip" data-placement="top" title="if you choose Revenue then , (Pricing*20)/100=(<% out.write(String.valueOf(allCost.getPricing())); %>*20)/100">
        <td>SALARIES - DRIVERS (20% of revenue)</td>
        <td><% out.write(String.valueOf(allCost.getSalaryRevenue())); %></td>
    </tr>

    <tr style="color: red " data-toggle="tooltip" data-placement="top" title="pricing+ salary Revenue=<%  out.write(String.valueOf(allCost.getPricing())); %> +
                                                                                                      <% out.write(String.valueOf(allCost.getSalaryRevenue()));  %>">

        <td>Real Pricing</td>
        <td><% out.write(String.valueOf(allCost.getRealPricing())); %></td>
    </tr>

    <tr data-toggle="tooltip" data-placement="top" title="(distanceToBuyer+distanceToBase+distanceToMill)* fuelSurchargeRate()= <% out.write("("+allCost.getDistancetoBuyer()+"+"+
         allCost.getDistancetoBase()+"+"+ allCost.getDistancetoMill()+")*"+allCost.getFuelSurchargeRate());%>">
        <td>FUEL SURCHARGE  (${cost.fuelSurchargeRate})</td>

    <td>
        <%
            out.write(String.valueOf(allCost.getFuelSurCharge()));
        %>
    </td>
    </tr>
     </tbody>
    </div>
    </div>
</table>
</div>
       </security:authorize>
 </div>
<script>
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
    });
</script>
</body>
</html>
