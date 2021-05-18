#!/usr/bin/python3
'''Reddit API handler'''
import requests as r


def number_of_subscribers(subreddit):
    '''Returns the number of subscribers'''
    x = r.get('https://www.reddit.com/r/{}/about.json'.format(subreddit))
    if x.status_code == 404:
        return 0
    response = x.json().get('data')
    return response.get('subscribers')
