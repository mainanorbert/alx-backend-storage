#!/usr/bin/env python3
"""module for class store an instance of the Redis
client as a private variable named _redis"""

import redis
import uuid
from typing import Union


class Cache:
    """class for store an instance of the Redis
    client as a private variable named _redis"""
    def __init__(self):
        """initializing  Redis instance"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data:Union[str, bytes, int, float]) -> str:
        """function takes a data argument and returns a string"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key
