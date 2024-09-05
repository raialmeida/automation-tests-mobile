package core;

import io.appium.java_client.AppiumBy;
import io.appium.java_client.android.AndroidDriver;

public class DSL {

    protected AndroidDriver driver;

    public DSL(AndroidDriver driver) {
        this.driver = driver;
    }

    protected void clickOnElementById(String selector) {
        driver.findElement(AppiumBy.id(selector)).click();
    }

    protected void clickOnElementByAccessibilityId(String selector) {
        driver.findElement(AppiumBy.accessibilityId(selector)).click();
    }

    protected void clickOnElementByUiAutomation(String selector) {
        driver.findElement(AppiumBy.androidUIAutomator(selector)).click();
    }

    protected String validateText(String selector) {
       String text = driver.findElement(AppiumBy.androidUIAutomator(selector)).getText();
       return text;
    }
}