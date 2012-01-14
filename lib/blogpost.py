class BlogPost(object):
    def __init__(self, date, title, author, summary, contents, locator):
        self.__date = date
        self.__title = title
        self.__author = author
        self.__summary = summary
        self.__contents = contents
        self.__locator = locator

    def get_date(self):
        return self.__date

    def get_title(self):
        return self.__title

    def get_author(self):
        return self.__author

    def get_summary(self):
        return self.__summary

    def get_contents(self):
        return self.__contents

    def get_locator(self):
        return self.__locator
