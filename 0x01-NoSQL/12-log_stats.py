#!/usr/bin/env python3
""" module that provides some stats about Nginx logs stored in MongoDB"""

from pymongo import MongoClient


def show_logs():
    """function that provides some stats about Nginx logs stored in MongoDB"""
    client = MongoClient('mongodb://127.0.0.1:27017')
    nginx_collection = client.logs.nginx
    total_logs = nginx_collection.count_documents({})
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]
    methods_count = [nginx_collection.count_documents(
        {"method": method}
        ) for method in methods]
    status_count = nginx_collection.count_documents(
            {"method": "GET", "path": "/status"}
            )
    print(f"{total_logs} logs")
    print("Methods:")
    for method, count in zip(methods, methods_count):
        print(f"\tmethod {method}: {count}")
    print(f"{status_count} status check")

if __name__ == "__main__":
    show_logs()
