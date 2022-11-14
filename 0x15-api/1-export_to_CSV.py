#!/usr/bin/python3
""" Script to get TODO list progress
    by employee ID and save it to
    CSV file
"""
from csv import writer, QUOTE_ALL
from requests import get
from sys import argv


def todo_csv(emp_id):
    """ Send request for employee's
        to do list to API
    """
    file_name = '{}.csv'.format(emp_id)
    url_user = 'https://jsonplaceholder.typicode.com/users/'
    url_todo = 'https://jsonplaceholder.typicode.com/todos/'

    # check if user exists
    user = get(url_user + emp_id).json().get('username')

    if user:
        params = {'userId': emp_id}
        #  get all tasks
        tasks = get(url_todo, params=params).json()
        if tasks:
            #  open file in write mode and use csv writer to
            #  writer content
            with open(file_name, 'w', newline='', encoding='utf8') as f:
                task_writer = writer(f, quoting=QUOTE_ALL)
                for task in tasks:
                    task_writer.writerow([emp_id, user, task.get('completed'),
                                         task.get('title')])


if __name__ == '__main__':
    if len(argv) > 1:
        todo_csv(argv[1])
