#!/usr/bin/env python3
"""module that changes all topics of a school document based on the nam"""


def update_topics(mongo_collection, name, topics):
    """ changes all topics of a school document based on the name"""
    update_document = mongo_collection.update_many(
            {"name": name},
            {"$set": {"topics": topics}}
            )
    # return result.modified_count
