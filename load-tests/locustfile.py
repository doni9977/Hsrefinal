import random
from locust import HttpUser, task, between

class CapstoneLoadUser(HttpUser):
    
    wait_time = between(0.5, 2.0)

    @task(5)
    def read_main_page(self):
        """Simulate high-volume traffic visiting the main landing page"""
        self.client.get("/", name="GET / [Main Page]")

    @task(10)
    def check_api_status(self):
        """Simulate frequent microservice health check polls"""
        self.client.get("/api/status", name="GET /api/status [Health Check]")

    @task(2)
    def get_user_profile(self):
        """Simulate dynamic requests requiring route parameter parsing"""
        user_id = random.randint(1, 1000)
        self.client.get(f"/api/v1/users/{user_id}", name="GET /api/v1/users/[id]")

    @task(1)
    def heavy_calculation_endpoint(self):
        """Target endpoint meant to simulate intensive backend CPU utilization"""
        self.client.get("/api/v1/heavy-task", name="GET /api/v1/heavy-task [Heavy]")