#!/bin/python

import sys
from selenium import webdriver
from selenium.webdriver.common.keys import Keys


def main():
    browser = webdriver.Firefox()
    browser.get("https://www.google.com/en")

    assert 'Google' in browser.title

    element = browser.find_element_by_name('q')

    for NAME in sys.argv[1:]:
        element.send_keys(NAME)
        element.send_keys(" ")

    element.send_keys(Keys.RETURN)


if __name__ == "__main__":
    main()
