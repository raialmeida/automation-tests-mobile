package pages;

import static org.junit.jupiter.api.Assertions.assertEquals;

import core.DSL;
import io.appium.java_client.android.AndroidDriver;

public class LayoutAnimationsPage extends DSL {

    public LayoutAnimationsPage(AndroidDriver driver) {
        super(driver);
    }

    public void menuLayoutAnimations() {
        clickOnElementByAccessibilityId("Default Layout Animations");
    }

    public void addButton() {
        clickOnElementById("io.appium.android.apis:id/addNewButton");
    }

    public void validateButton(String textAtual) {
        String tex = validateText("new UiSelector().text(\"1\")");
        assertEquals(tex, textAtual);

    }
}
