from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:

    def __init__(self):
        self.selfLib = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("Hello World")

    @keyword
    def add_items_to_cart(self, productList):
        i = 1
        productTitles = self.selfLib.get_webelements("css:.card-title")
        for productTitle in productTitles:
            if productTitle.text in productList:
                self.selfLib.click_button("xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
            i = i + 1
        self.selfLib.click_link("css:li.active a")