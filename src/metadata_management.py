import hug


@hug.get("/")
def say_hi():
    return "hello from something"
