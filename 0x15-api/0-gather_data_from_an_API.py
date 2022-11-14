#!/usr/bin/python3
""" Script to get TODO list progress
    by employee ID
"""
from requests import get
from sys import argv


def todo(emp_id):
    """ Send request for employee's
        to do list to API
    """
    total = 0
    completed = 0
    url_user = 'https://jsonplaceholder.typicode.com/users/'
    url_todo = 'https://jsonplaceholder.typicode.com/todos/'

    # check if user exists
    user = get(url_user + emp_id).json().get('name')

    if user:
        params = {'userId': emp_id}
        #  get all tasks
        tasks = get(url_todo, params=params).json()
        if tasks:
            total = len(tasks)
            #  get number of completed tasks
            params.update({'completed': 'true'})
            completed = len(get(url_todo, params=params).json())

        print("Employee {} is done with tasks({}/{})".format(
            user, completed, total))
        for task in tasks:
            print("\t {}".format(task.get('title')))


if __name__ == '__main__':
    if len(argv) > 1:
        todo(argv[1])
