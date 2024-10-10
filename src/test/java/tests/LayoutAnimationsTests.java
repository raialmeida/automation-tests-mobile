package tests;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import core.DriverManager;
import screens.HomeScreen;
import screens.LayoutAnimationsScreen;
import utils.AlertHandler;

public class LayoutAnimationsTests extends DriverManager {

    private HomeScreen home = new HomeScreen(driver);
    private LayoutAnimationsScreen layoutAnimationsPage = new LayoutAnimationsScreen(driver);
    private AlertHandler alertHandler = new AlertHandler(driver);

    @Test
    @DisplayName("Validar a adição do botão e confirmar o texto do botão")
    public void validationAddButtonConfirmButton() {
        alertHandler.confirmAlertaContinue();
        home.menuAnimation();
        layoutAnimationsPage.menuLayoutAnimations();
        layoutAnimationsPage.addButton();
        layoutAnimationsPage.validateButton("1");
    }
}