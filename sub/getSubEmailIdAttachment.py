import requests
import sys
import os

class GetSubEmailIdAttachment:
    def __init__(self,emailid,id,attachment_name):
        self.emailid = emailid
        self.id = id
        self.attachment_name = attachment_name

    def getSubEIdAttachment(self):
        email, domain = self.emailid.split('@')
        eid = self.id
        file_name = self.attachment_name
        blacklist = ['abuse', 'webmaster', 'contact', 'postmaster', 'hostmaster', 'admin']
        if email in blacklist:
            sys.exit(1)
        else:
            link = f'https://www.1secmail.com/api/v1/?action=download&login={email}&domain={domain}&id={eid}&file={file_name}'
            return link
