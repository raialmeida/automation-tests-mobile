package core;

import org.openqa.selenium.WebElement;

import io.appium.java_client.AppiumBy;
import io.appium.java_client.android.AndroidDriver;

public class DSL {

    protected AndroidDriver driver;

    public DSL(AndroidDriver driver) {
        this.driver = driver;
    }

    protected WebElement getElementId(String selector) {
        return driver.findElement(AppiumBy.id(selector));
    }

    protected WebElement getElementAccessibilityId(String selector) {
        return driver.findElement(AppiumBy.accessibilityId(selector));
    }

    protected WebElement getElementUiAutomation(String selector) {
        return driver.findElement(AppiumBy.androidUIAutomator(selector));
    }

    protected String validateText(String selector) {
        String text = driver.findElement(AppiumBy.androidUIAutomator(selector)).getText();
        return text;
    }
}