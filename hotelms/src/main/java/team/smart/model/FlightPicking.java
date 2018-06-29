package team.smart.model;

import java.util.Date;

public class FlightPicking {
    private Integer ID;

    private Date TIME;

    private String ROOM_NUMBER;

    private String GUEST_NAME;

    private String TYPE;

    private String FLIGHT_NUMBER;

    private String PLATE_NUMBER;

    private String PICKER_NAME;

    private String PICKER_TELE;

    private String CONTACT_NAME;

    private String CONTACT_TELE;

    private Date OCCUR_TIME;

    private Date IMPORT_TIME;

    private Date EDIT_TIME;

    public Integer getID() {
        return ID;
    }

    public void setID(Integer ID) {
        this.ID = ID;
    }

    public Date getTIME() {
        return TIME;
    }

    public void setTIME(Date TIME) {
        this.TIME = TIME;
    }

    public String getROOM_NUMBER() {
        return ROOM_NUMBER;
    }

    public void setROOM_NUMBER(String ROOM_NUMBER) {
        this.ROOM_NUMBER = ROOM_NUMBER == null ? null : ROOM_NUMBER.trim();
    }

    public String getGUEST_NAME() {
        return GUEST_NAME;
    }

    public void setGUEST_NAME(String GUEST_NAME) {
        this.GUEST_NAME = GUEST_NAME == null ? null : GUEST_NAME.trim();
    }

    public String getTYPE() {
        return TYPE;
    }

    public void setTYPE(String TYPE) {
        this.TYPE = TYPE == null ? null : TYPE.trim();
    }

    public String getFLIGHT_NUMBER() {
        return FLIGHT_NUMBER;
    }

    public void setFLIGHT_NUMBER(String FLIGHT_NUMBER) {
        this.FLIGHT_NUMBER = FLIGHT_NUMBER == null ? null : FLIGHT_NUMBER.trim();
    }

    public String getPLATE_NUMBER() {
        return PLATE_NUMBER;
    }

    public void setPLATE_NUMBER(String PLATE_NUMBER) {
        this.PLATE_NUMBER = PLATE_NUMBER == null ? null : PLATE_NUMBER.trim();
    }

    public String getPICKER_NAME() {
        return PICKER_NAME;
    }

    public void setPICKER_NAME(String PICKER_NAME) {
        this.PICKER_NAME = PICKER_NAME == null ? null : PICKER_NAME.trim();
    }

    public String getPICKER_TELE() {
        return PICKER_TELE;
    }

    public void setPICKER_TELE(String PICKER_TELE) {
        this.PICKER_TELE = PICKER_TELE == null ? null : PICKER_TELE.trim();
    }

    public String getCONTACT_NAME() {
        return CONTACT_NAME;
    }

    public void setCONTACT_NAME(String CONTACT_NAME) {
        this.CONTACT_NAME = CONTACT_NAME == null ? null : CONTACT_NAME.trim();
    }

    public String getCONTACT_TELE() {
        return CONTACT_TELE;
    }

    public void setCONTACT_TELE(String CONTACT_TELE) {
        this.CONTACT_TELE = CONTACT_TELE == null ? null : CONTACT_TELE.trim();
    }

    public Date getOCCUR_TIME() {
        return OCCUR_TIME;
    }

    public void setOCCUR_TIME(Date OCCUR_TIME) {
        this.OCCUR_TIME = OCCUR_TIME;
    }

    public Date getIMPORT_TIME() {
        return IMPORT_TIME;
    }

    public void setIMPORT_TIME(Date IMPORT_TIME) {
        this.IMPORT_TIME = IMPORT_TIME;
    }

    public Date getEDIT_TIME() {
        return EDIT_TIME;
    }

    public void setEDIT_TIME(Date EDIT_TIME) {
        this.EDIT_TIME = EDIT_TIME;
    }
}