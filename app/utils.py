import hashlib

"""
    utils functions
"""
def hash_sha1(s):
    hash_object = hashlib.sha1(s.encode())
    return hash_object.hexdigest() 
