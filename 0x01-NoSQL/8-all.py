#!/usr/bin/env python3
"""module that  lists all documents in a collection"""


def list_all(mongo_collection):
    """Function listing all documents in collection"""
    docs = mongo_collection.find()
    # results = [doc for doc in docs]
    return list(docs)
