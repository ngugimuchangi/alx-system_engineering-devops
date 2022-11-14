#!/usr/bin/python3
""" Script to get TODO list progress
    by employee ID and save it to
    in JSON fomat
"""
from json import dump
from requests import get
from sys import argv


def todo_json(emp_id):
    """ Send request for employee's
        todo list to API
    """
    file_name = '{}.json'.format(emp_id)
    url_user = 'https://jsonplaceholder.typicode.com/users/'
    url_todo = 'https://jsonplaceholder.typicode.com/todos/'

    # check if user exists
    user = get(url_user + emp_id).json().get('username')

    if user:
        params = {'userId': emp_id}
        #  get all tasks
        tasks = get(url_todo, params=params).json()

        #  create list of dictionaries
        #  with info about each task
        task_list = []
        for task in tasks:
            task_list.append({"task": task.get('title'),
                              "completed": task.get('completed'),
                              "username": user})

        #  open file in write mode and jsonify
        with open(file_name, 'w', encoding='utf8') as f:
            dump({emp_id: task_list}, f)


if __name__ == '__main__':
    if len(argv) > 1:
        todo_json(argv[1])
