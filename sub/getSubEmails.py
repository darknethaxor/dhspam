import requests
import os
import sys

class GetSubEmails():
    def __init__(self, emailid):
        self.emailid = emailid

    def getSubE(self):
        email , domain = self.emailid.split('@')
        blacklist = ['abuse', 'webmaster', 'contact', 'postmaster', 'hostmaster', 'admin']
        if email in blacklist:
            sys.exit(1)
        else:
            response = requests.get(f'https://www.1secmail.com/api/v1/?action=getMessages&login={email}&domain={domain}')
            return response.json()