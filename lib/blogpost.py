class BlogPost(object):
    def __init__(self, date, title, author, summary, contents, locator):
        self._date = date
        self._title = title
        self._author = author
        self._summary = summary
        self._contents = contents
        self._locator = locator

    @property
    def date(self):
        return self._date

    @property
    def title(self):
        return self._title

    @property
    def author(self):
        return self._author

    @property
    def summary(self):
        return self._summary

    @property
    def contents(self):
        return self._contents

    @property
    def locator(self):
        return self._locator
