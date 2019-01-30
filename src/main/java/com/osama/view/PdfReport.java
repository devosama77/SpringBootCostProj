package com.osama.view;


import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;
import com.osama.model.AllCost;
import org.springframework.web.servlet.view.document.AbstractPdfView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

public class PdfReport extends AbstractPdfView {


    protected void buildPdfDocument(Map<String, Object> map, Document document, PdfWriter pdfWriter,
                                    HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws Exception {
        @SuppressWarnings("unchecked")
        AllCost allCost= (AllCost) map.get("allCost");
        httpServletResponse.setHeader("Content-Disposition", "attachment; filename=\"cost.pdf\"");
        Table table=new Table(4);
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);


        table.addCell("");
        table.addCell("Items");
        table.addCell("Price");
        table.addCell("size Of Tanker : "+allCost.getSizeOfTanker());

        table.addCell("details");
        table.addCell("Fuel Surcharge Rate");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getFuelSurchargeRate()));

        table.addCell("");
        table.addCell("Distance to Buyer (KM)");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getDistancetoBuyer()));


        table.addCell("");
        table.addCell("Distance to Mill (KM)");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getDistancetoMill()));

        table.addCell("");
        table.addCell("Distance to Base");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getDistancetoBase()));


        table.addCell("");
        table.addCell("Capacity");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getCapacity()));

        table.addCell("");
        table.addCell("Hours: stand by time ");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getStandByTime()));

        table.addCell("");
        table.addCell(": delivery time");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getDeliveryTime()));

        table.addCell("Variable Cost");
        table.addCell(allCost.getSalariesString());
        table.addCell(String.valueOf(allCost.getSalaryPrice()));
        table.addCell(String.valueOf(allCost.getSalaryCalc()));

        table.addCell("");
        table.addCell("SALARIES - DRIVERS (HOUR OT / 1 HOUR)");
        table.addCell("100");
        table.addCell(String.valueOf(allCost.getSalaryPerHour()));

        table.addCell("");
        table.addCell("SALARIES - DRIVERS (20% of revenue)");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getSalaryRevenue()));

        table.addCell("");
        table.addCell(allCost.getWaterString());
        table.addCell(String.valueOf(allCost.getWaterPrice()));
        table.addCell(String.valueOf(allCost.getWaterCalc()));

        table.addCell("");
        table.addCell("Rental Tanker");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getRentalTanker()));

        table.addCell("");
        table.addCell("DISPOSAL PLACE");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getDisposalPlace()));

        table.addCell("");
        table.addCell("Wash Tanker");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getWashTanker()));

        table.addCell("");
        table.addCell("DIESEL & PETROL  (0.45L/Km)");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getDieselPetrol()));

        table.addCell("");
        table.addCell("Stand by time");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getStandByTimeCalc()));

        table.addCell("");
        table.addCell("Total Variable Cost");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getTotalVariableCost()));

        /// Fixed cost .............................................
        table.addCell("");
        table.addCell("GIT INSURANCE");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getGitInsurance()));

        table.addCell("");
        table.addCell("VEHICLE INSURANCE");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getVehicleInsurance()));

        table.addCell("");
        table.addCell("VEHICLE ROAD TAX ");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getVehicleRoadTax()));

        table.addCell("");
        table.addCell("JPJ INSPECTION");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getJpjInspection()));

        table.addCell("");
        table.addCell("PUSHPAKOM INSPECTION");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getPushpakomInspection()));

        table.addCell("");
        table.addCell("GPS MAINTENANCE");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getGpsMaintenance()));

        table.addCell("");
        table.addCell("INSTALLMENT OF TANKER");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getInstallMentOfTanker()));



        table.addCell("");
        table.addCell("VEHICLE MAINTANENCE");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getVehicleMaintanence()));

        table.addCell("");
        table.addCell("Admin Cost (5% on 1m sales )");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getAdminCost()));

        table.addCell("");
        table.addCell("HARDWARE");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getHardware()));

        table.addCell("");
        table.addCell("Total Fixed Cost");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getTotalFixedCost()));

        table.addCell("TOTAL COST OF SALES ");
        table.addCell("Total Cost");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getTotalCost()));

        table.addCell("");
        table.addCell("Additional Expenses ");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getAdditionalExpenses()));

        table.addCell("");
        table.addCell(" Mark up ");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getMarkup()));

        table.addCell("Pricing");
        table.addCell("");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getPricing()));

        table.addCell("");
        table.addCell("FUEL SURCHARGE  (RM0.1035/KM)");
        table.addCell("");
        table.addCell(String.valueOf(allCost.getFuelSurCharge()));

        document.add(table);
    }
}
