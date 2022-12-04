package com.vnk.jspdemo.StatusCode;

public class StatusCode {

    private String resultFlag;

    private String resultMessage;

    public StatusCode() {
    }

    public StatusCode(String resultFlag, String resultMessage) {
        this.resultFlag = resultFlag;
        this.resultMessage = resultMessage;
    }

    public String getResultFlag() {
        return resultFlag;
    }

    public void setResultFlag(String resultFlag) {
        this.resultFlag = resultFlag;
    }

    public String getResultMessage() {
        return resultMessage;
    }

    public void setResultMessage(String resultMessage) {
        this.resultMessage = resultMessage;
    }
}
