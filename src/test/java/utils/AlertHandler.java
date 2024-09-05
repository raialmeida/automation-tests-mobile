package utils;

import core.DSL;
import io.appium.java_client.android.AndroidDriver;

public class AlertHandler extends DSL {

    public AlertHandler(AndroidDriver driver) {
        super(driver);
    }

    public void confirmAlertaContinue() {
        clickOnElementById("android:id/button1");
    }
}
