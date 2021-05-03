#!/usr/bin/python3
'''For a given employee ID, returns information
about his/her TODO list progress.'''

import requests as r
from sys import argv

if __name__ == "__main__":
    user = argv[1]
    x = r.get('https://jsonplaceholder.typicode.com/users/{}/todos'
              .format(user))
    y = r.get('https://jsonplaceholder.typicode.com/users/{}'.format(user))
    json_obj_todo = x.json()
    json_ob_user = y.json()
    name = json_ob_user.get('name')
    number_of_tasks = len(json_obj_todo)
    done_tasks = 0
    text = ""
    for task in json_obj_todo:
        status = task.get('completed')
        if status:
            done_tasks += 1
            text += "\t {}\n".format(task.get('title'))
    print("Employee {} is done with tasks({}/{}):".format(name,
          done_tasks, number_of_tasks))
    print(text, end="")
