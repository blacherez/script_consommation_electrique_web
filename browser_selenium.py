
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
import sys

nb = sys.argv[1]
url = sys.argv[2]

with webdriver.Firefox() as driver:
    wait = WebDriverWait(driver, 10)
    driver.get(url)
    for i in range(1, int(nb)+1):
        print("Url : %s | %s / %s" % (url, i, nb))
        driver.refresh()
