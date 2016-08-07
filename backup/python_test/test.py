import os

fileDir = os.path.dirname(os.path.realpath(__file__))
#print os.path.realpath(__file__)

print os.path.join(fileDir,'..','models')
