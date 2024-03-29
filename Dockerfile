FROM cgr.dev/chainguard/python:latest-dev as build
COPY app  /app
WORKDIR /app
RUN pip install --no-cache-dir -r requirements.txt


FROM cgr.dev/chainguard/python:latest
COPY --from=build /app /app
COPY --from=build /home/nonroot/.local/lib/python3.12/site-packages /home/nonroot/.local/lib/python3.12/site-packages
ENV PYTHONPATH=/home/nonroot/.local/lib/python3.12/site-packages \
    FLASK_APP=/app/app.py
WORKDIR /app
EXPOSE 5000
ENTRYPOINT [ "python", "-m", "flask", "run", "--host=0.0.0.0" ]