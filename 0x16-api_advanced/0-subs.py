#!/usr/bin/python3
""" script to obtain subscribers
    count from a subreddit
"""
from requests import get


def number_of_subscriber(subreddit):
    """ function to get subscriber count"""
    if subbreddit and type(subreddit) is str:
        url = 'https://reddit.com/r/{}/about.json'.format(subreddit)
        headers = {'user-agent': 'my-app/0.0.1'}
        req = get(url, headers=headers)
        data = req.json()
        subscribers = data.get('data', {}).get('subscribers', 0)
        return subscribers
