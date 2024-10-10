package screens;

import core.DSL;
import io.appium.java_client.android.AndroidDriver;

public class HomeScreen extends DSL {

    public HomeScreen(AndroidDriver driver) {
        super(driver);
    }

    public void menuAnimation() {
        getElementAccessibilityId("Animation").click();
    }
}
