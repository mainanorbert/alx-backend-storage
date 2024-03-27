#!/usr/bin/env python3
"""module for class store an instance of the Redis
client as a private variable named _redis"""

import redis
import uuid
from typing import Union, Optional, Callable


class Cache:
    """class for store an instance of the Redis
    client as a private variable named _redis"""
    def __init__(self):
        """initializing  Redis instance"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """function takes a data argument and returns a string"""
        key = str(uuid.uuid4())
        self._redis.set(key, data)
        return key

    def get(
            self, key: str, fn: Optional[Callable] = None
    ) -> Union[str, bytes, int, float]:
        """Reading from Redis and recovering original type"""
        data = self._redis.get(key)
        if data is None:
            return None
        if fn is not None:
            return fn(data)
        return data

    def get_str(self, key: str) -> Optional[str]:
        """function that parametrize Cache.get
        with the correct conversion function."""
        par = self.get(key, fn=lambda d: d.decode('utf-8'))
        return par

    def get_int(self, key: str) -> Optional[int]:
        """function that parametrize
        Cache.get with the correct conversion function"""
        par = self.get(key, fn=int)
        return par
