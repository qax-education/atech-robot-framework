from pymongo import MongoClient
import ssl

client = MongoClient('mongodb+srv://qax:xperience@cluster0.tffebyx.mongodb.net/?retryWrites=true&w=majority', ssl_cert_reqs=ssl.CERT_NONE)

db = client['markdb']

def remove_user_by_email(user_email):
    users = db['users']
    users.delete_many({'email': user_email})
    print('Removendo o email ' + user_email)