package com.osama.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.LinkedHashMap;

public class Cost {
    private String sizeOfTanker;
    private double fuelSurchargeRate;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    @NotNull(message = "Invalid Number")
    private String distanceToBuyer;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    @NotNull(message = "Invalid Number")
    private String distanceToMill;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    @NotNull(message = "Invalid Number")
    private String distanceToBase;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    @NotNull(message = "Invalid Number")
    private String capacity;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    @NotNull(message = "Invalid Number")
    private String standByTime;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    @NotNull(message = "Invalid Number")
    private String deliveryTime;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    private String salaryList="0.0";
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    private String waterList;

    private String salariesString;
    private String waterString;

    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    private String dieselBaseRate;


    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    private String currentRate;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    private String salaryPerHour;

    private String salaryRevenue="0.0";

    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    private String rentalTanker;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    private String disposalPlace;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    private String washTanker;


    private double fixedCost;


    private LinkedHashMap<String, String> linkedHashMapSizeTanker;
    private LinkedHashMap<String, String> linkedHashMapSalariesType;
    private LinkedHashMap<String, String> linkedHashMapWaterType;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    private String salaryDriversTripDistant;
    @Pattern(regexp = "[-+]?[0-9]*\\.?[0-9]+([eE][-+]?[0-9]+)?", message = "Invalid Number")
    private String markUpPrecentage;

    public Cost() {
        linkedHashMapSizeTanker = new LinkedHashMap<String, String>();
        linkedHashMapSizeTanker.put("10m3", "10m3");
        linkedHashMapSizeTanker.put("20m3", "20m3");
        linkedHashMapSizeTanker.put("33m3", "33m3");
        linkedHashMapSizeTanker.put("40m3", "40m3");
        linkedHashMapSizeTanker.put("50m3", "50m3");
        linkedHashMapSizeTanker.put("Iso", "Iso tank");
        linkedHashMapSizeTanker.put("Storage", "Storage Tank");

        linkedHashMapSalariesType = new LinkedHashMap<String, String>();
        linkedHashMapSalariesType.put("SALARIES - DRIVERS (TRIP/DISTANT)", "SALARIES - DRIVERS (TRIP/DISTANT)");
        linkedHashMapSalariesType.put("SALARIES - DRIVERS (HOUR/ 8 HOUR)", "SALARIES - DRIVERS (HOUR/ 8 HOUR)");
        linkedHashMapSalariesType.put("SALARIES - DRIVERS (20% of revenue)","SALARIES - DRIVERS (20% of revenue)");



        linkedHashMapWaterType = new LinkedHashMap<String, String>();
        linkedHashMapWaterType.put("Water: IWK", "Water: IWK");
        linkedHashMapWaterType.put("Water: SAJ", "Water: SAJ");
        linkedHashMapWaterType.put("Water: SYABAS", "Water: SYABAS");

    }

    public String getSizeOfTanker() {
        return sizeOfTanker;
    }

    public void setSizeOfTanker(String sizeOfTanker) {
        this.sizeOfTanker = sizeOfTanker;
    }

    public double getFuelSurchargeRate() {
        return fuelSurchargeRate;
    }

    public void setFuelSurchargeRate(double fuelSurchargeRate) {
        this.fuelSurchargeRate = fuelSurchargeRate;
    }

    public String getDistanceToBuyer() {
        return distanceToBuyer;
    }

    public void setDistanceToBuyer(String distanceToBuyer) {
        this.distanceToBuyer = distanceToBuyer;
    }

    public String getDistanceToMill() {
        return distanceToMill;
    }

    public void setDistanceToMill(String distanceToMill) {
        this.distanceToMill = distanceToMill;
    }

    public String getDistanceToBase() {
        return distanceToBase;
    }

    public void setDistanceToBase(String distanceToBase) {
        this.distanceToBase = distanceToBase;
    }

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getStandByTime() {
        return standByTime;
    }

    public void setStandByTime(String standByTime) {
        this.standByTime = standByTime;
    }

    public String getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(String deliveryTime) {
        this.deliveryTime = deliveryTime;
    }

    public String getSalaryList() {
        return salaryList;
    }

    public void setSalaryList(String salaryList) {
        this.salaryList = salaryList;
    }

    public String getWaterList() {
        return waterList;
    }

    public void setWaterList(String waterList) {
        this.waterList = waterList;
    }

    public String getSalariesString() {
        return salariesString;
    }

    public void setSalariesString(String salariesString) {
        this.salariesString = salariesString;
    }

    public String getWaterString() {
        return waterString;
    }

    public void setWaterString(String waterString) {
        this.waterString = waterString;
    }



    public String getDieselBaseRate() {
        return dieselBaseRate;
    }

    public void setDieselBaseRate(String dieselBaseRate) {
        this.dieselBaseRate = dieselBaseRate;
    }

    public String getCurrentRate() {
        return currentRate;
    }

    public void setCurrentRate(String currentRate) {
        this.currentRate = currentRate;
    }

    public String getSalaryPerHour() {
        return salaryPerHour;
    }

    public void setSalaryPerHour(String salaryPerHour) {
        this.salaryPerHour = salaryPerHour;
    }

    public String getSalaryRevenue() {
        return salaryRevenue;
    }

    public void setSalaryRevenue(String salaryRevenue) {
        this.salaryRevenue = salaryRevenue;
    }

    public String getRentalTanker() {
        return rentalTanker;
    }

    public void setRentalTanker(String rentalTanker) {
        this.rentalTanker = rentalTanker;
    }

    public String getDisposalPlace() {
        return disposalPlace;
    }

    public void setDisposalPlace(String disposalPlace) {
        this.disposalPlace = disposalPlace;
    }

    public String getWashTanker() {
        return washTanker;
    }

    public void setWashTanker(String washTanker) {
        this.washTanker = washTanker;
    }

    public double getFixedCost() {
        return fixedCost;
    }

    public void setFixedCost(double fixedCost) {
        this.fixedCost = fixedCost;
    }

    public LinkedHashMap<String, String> getLinkedHashMapSizeTanker() {
        return linkedHashMapSizeTanker;
    }

    public void setLinkedHashMapSizeTanker(LinkedHashMap<String, String> linkedHashMapSizeTanker) {
        this.linkedHashMapSizeTanker = linkedHashMapSizeTanker;
    }

    public LinkedHashMap<String, String> getLinkedHashMapSalariesType() {
        return linkedHashMapSalariesType;
    }

    public void setLinkedHashMapSalariesType(LinkedHashMap<String, String> linkedHashMapSalariesType) {
        this.linkedHashMapSalariesType = linkedHashMapSalariesType;
    }

    public LinkedHashMap<String, String> getLinkedHashMapWaterType() {
        return linkedHashMapWaterType;
    }

    public void setLinkedHashMapWaterType(LinkedHashMap<String, String> linkedHashMapWaterType) {
        this.linkedHashMapWaterType = linkedHashMapWaterType;
    }

    public String getSalaryDriversTripDistant() {
        return salaryDriversTripDistant;
    }

    public void setSalaryDriversTripDistant(String salaryDriversTripDistant) {
        this.salaryDriversTripDistant = salaryDriversTripDistant;
    }

    public String getMarkUpPrecentage() {
        return markUpPrecentage;
    }

    public void setMarkUpPrecentage(String markUpPrecentage) {
        this.markUpPrecentage = markUpPrecentage;
    }
}