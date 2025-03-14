import celery
import os

app = celery.Celery('febbler')


app.conf.update(BROKER_URL=os.environ['REDIS_URL'], CELERY_RESULT_BACKEND=os.environ['REDIS_URL'])

@app.task
def hello(name):
    return "Hello "+name
