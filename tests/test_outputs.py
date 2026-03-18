import time
import requests

def test_app_running():
    time.sleep(3)  # give app time to start
    response = requests.get("http://localhost:8000")
    assert response.status_code == 200
    assert "App is running!" in response.text
