import requests
import sys

class GetSubEmailId:
    def __init__(self,emailid,id):
        self.emailid = emailid
        self.id = id

    def getSubEId(self):
        email, domain = self.emailid.split('@')
        eid = self.id
        blacklist = ['abuse', 'webmaster', 'contact', 'postmaster', 'hostmaster', 'admin']
        if email in blacklist:
            sys.exit(1)
        else:
            response = requests.get(f'https://www.1secmail.com/api/v1/?action=readMessage&login={email}&domain={domain}&id={eid}')
            return response.json()