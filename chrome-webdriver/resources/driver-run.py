from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
import os

#NOTE: Address /dev/shm issues in container environment
service = Service(service_args=['--disable-dev-shm-usage'])
options = Options()
options.add_argument('--disable-dev-shm-usage')
#NOTE: Following 2 options are required to exclude X
options.add_argument('--headless')
options.add_argument('--disable-gpu')

#NOTE: webdriver.Chrome() searches chromedriver executable by default
driver = webdriver.Chrome(
   service=service,
   options=options
)


driver.get(os.environ['START_URL'])
WebDriverWait(driver, 30).until(
        EC.presence_of_element_located((By.CSS_SELECTOR, 'body'))
)
print(driver.page_source)
driver.quit()
