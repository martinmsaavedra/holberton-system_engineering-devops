#!/usr/bin/python3
'''export data in the CSV format.'''

import csv
import requests as r
from sys import argv

if __name__ == "__main__":
    user = argv[1]
    x = r.get('https://jsonplaceholder.typicode.com/users/{}/todos'.format(user))
    y = r.get('https://jsonplaceholder.typicode.com/users/{}'.format(user))
    json_obj_todo = x.json()
    json_ob_user = y.json()
    username = json_ob_user.get('username')
    user_id = json_ob_user.get('id')
    with open('{}.csv'.format(user_id), mode='w') as employee_file:
        employee_writer = csv.writer(
            employee_file, delimiter=',', quotechar='"', quoting=csv.QUOTE_ALL)
        for task in json_obj_todo:
            status = task.get('completed')
            title = task.get('title')
            employee_writer.writerow([user_id, username, status, title])
