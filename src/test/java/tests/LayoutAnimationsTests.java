package tests;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import core.DriverManager;
import pages.HomePage;
import pages.LayoutAnimationsPage;
import utils.AlertHandler;

public class LayoutAnimationsTests extends DriverManager {

    private HomePage home = new HomePage(driver);
    private LayoutAnimationsPage layoutAnimationsPage = new LayoutAnimationsPage(driver);
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