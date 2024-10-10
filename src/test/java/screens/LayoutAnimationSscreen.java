package screens;

import static org.junit.jupiter.api.Assertions.assertEquals;

import core.DSL;
import io.appium.java_client.android.AndroidDriver;

public class LayoutAnimationsScreen extends DSL {

    public LayoutAnimationsScreen(AndroidDriver driver) {
        super(driver);
    }

    public void menuLayoutAnimations() {
        getElementAccessibilityId("Default Layout Animations").click();
    }

    public void addButton() {
        getElementId("io.appium.android.apis:id/addNewButton").click();
    }

    public void validateButton(String textAtual) {
        String tex = validateText("new UiSelector().text(\"1\")");
        assertEquals(tex, textAtual);

    }
}
