package screens;

import core.DSL;
import io.appium.java_client.android.AndroidDriver;

public class HomePage extends DSL {

    public HomePage(AndroidDriver driver) {
        super(driver);
    }

    public void menuAnimation() {
        getElementAccessibilityId("Animation").click();
    }
}
