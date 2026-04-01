FROM python:3.7-slim

# Jenkins에서 넘겨주는 변수를 받기 위한 선언
ARG COMMIT_HASH
# 이미지 라벨로 기록 (보안 및 추적 용도)
LABEL commit_hash=${COMMIT_HASH}

RUN pip install --no-cache-dir flask pytest

WORKDIR /work
COPY test.sh /test
COPY test.py test.py
COPY app.py app.py

RUN chmod +x test.sh

CMD ["python", "app.py"]
