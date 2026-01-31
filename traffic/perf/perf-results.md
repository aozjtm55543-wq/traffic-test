# 004-1 성능 비교 결과

대상 API: `GET /boards?hashTag=HASH1&subjectLike=hello`

## 테스트 조건
- 데이터 초기화: /boards/init-index?count=5000
- 클라이언트: JMeter 또는 PowerShell 스크립트
- 서버: board

## 결과 요약
| 구분 | Avg(ms) | P95(ms) | Max(ms) | 비고 |
|---|---:|---:|---:|---|
| 인덱스 추가 전 |  |  |  |  |
| 인덱스 추가 후 |  |  |  |  |

## 비교 메모
- subject, hashTag.name 인덱스 적용
- hashTag.board_id 인덱스 적용
