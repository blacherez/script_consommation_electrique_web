
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
import sys

nb = sys.argv[1]
url = sys.argv[2]
print(nb)


with webdriver.Firefox() as driver:
    wait = WebDriverWait(driver, 10)
    driver.get(url)
    for i in range(1, int(nb)):
        driver.refresh()
