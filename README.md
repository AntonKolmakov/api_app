# README

For make requests to the API. I'll be using [httpie](https://httpie.org) as my HTTP client.
```
POST/ posts

http POST :3000/posts title=foo description=bar ip=192.168.2.0

POST/ rates

http POST :3000/rates value=15 post_id=1

GET/ rates/get_rate_posts

http GET :3000/rates/get_rate_posts rate_value=5

GET/ rates/get_ips

http GET :3000/rates/get_ips
```

#### Test task sql

```SQL
SELECT min(id), group_id, count(id)
 from
  (SELECT 
        id,
        group_id, 
        id - rank() OVER (PARTITION BY group_id ORDER BY id) as pos from users)as ss
GROUP BY ss.group_id, pos
ORDER BY min(id);
```