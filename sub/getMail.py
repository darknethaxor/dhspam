import requests

class GetMail:
    def __init__(self,amount):
        self.amount = amount
    
    def getM(self):
        response = requests.get(f'https://www.1secmail.com/api/v1/?action=genRandomMailbox&count={self.amount}').json()
        return response


