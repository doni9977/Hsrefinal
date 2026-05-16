import http from 'k6/http';
import { sleep, check } from 'k6';

export const options = {
  stages: [
    { duration: '30s', target: 50 },
    { duration: '2m', target: 150 }, 
    { duration: '30s', target: 0 },  
  ],
  thresholds: {
    http_req_failed: ['rate<0.01'],  
    http_req_duration: ['p(95)<200'], 
  },
};

export default function () {
 
  const res = http.get('http://localhost:8080');
  
  check(res, {
    'status is 200': (r) => r.status === 200,
  });
  
  sleep(1);
}