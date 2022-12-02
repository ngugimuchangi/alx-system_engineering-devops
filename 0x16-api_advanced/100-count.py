#!/usr/bin/python3
""" Recursive API calls to Redit
    and count occurrences
"""
from requests import get


def count_words(subreddit, word_list, count={}, after=None):
    """ get count of occurrence of words in word_list from
        titles in hot articles in given subreddit
    """
    if not count:
        count = {word.lower(): 0 for word in word_list}
    if subreddit and type(subreddit) is str and word_list:
        url = 'https://www.reddit.com/r/{}/hot.json'.format(subreddit)
        params = {'after': after, 'limit': 100}
        headers = {'user-agent': 'my-app/0.0.1'}

        req = get(url, params=params, headers=headers, allow_redirects=False)
        #  get data if request was successful
        if req.status_code == 200:
            data = req.json().get('data')
            after = data.get('after')
            posts = data.get('children')

            #  get count of key words in each title
            for post in posts:
                title = post.get('data').get('title').lower()
                words = title.split()
                for word in count.keys():
                    count[word] += words.count(word)

            #  call recursive function if there's more data
            if after:
                return count_words(subreddit, word_list, count, after)
            else:
                count = sorted(count.items(),
                               key=lambda item: (-item[1], item[0]))
                for item in count:
                    if item[1] > 0:
                        print("{}: {}".format(item[0], item[1]))
