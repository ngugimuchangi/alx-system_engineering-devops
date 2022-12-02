#!/usr/bin/python3
""" Recursive API calls to Redit
"""
from requests import get


def recurse(subreddit, hot_list=[], after=None):
    """ recursively get all host articles for
        a given subreddit
    """
    if subreddit and type(subreddit) is str:
        url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
        params = {'after': after, 'limit': 100}
        headers = {'user-agent': 'my-app/0.0.1'}

        req = get(url, params=params, headers=headers, allow_redirects=False)
        #  get data if request was successful
        if req.status_code == 200:
            data = req.json().get('data')
            after = data.get('after')
            posts = data.get('children')

            #  add article titles to list
            for post in posts:
                hot_list.append(post.get('data').get('title'))

            #  call recursive function if there's more data
            if after:
                return recurse(subreddit, hot_list, after)
            else:
                return hot_list
