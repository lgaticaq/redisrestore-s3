# redisrestore-s3

[![dockeri.co](http://dockeri.co/image/lgatica/restore)](https://hub.docker.com/r/lgatica/redisrestore-s3/)

[![Build Status](https://travis-ci.org/lgaticaq/restore.svg?branch=master)](https://travis-ci.org/lgaticaq/redisrestore-s3)

> Docker Image with Alpine Linux and awscli for restore redis backup from s3

## Use

Restore database from backup 2017-11-26T02-00-00-0300.tar.gz in s3

```bash
# Stop redis server
docker stop redis
# Restore backup
docker run --rm \
  -v /path/to/redis/db:/backup
  -e "BACKUP_NAME=2017-11-26T02-00-00-0300.tar.gz"
  -e "AWS_ACCESS_KEY_ID=your_aws_access_key"
  -e "AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key"
  -e "AWS_DEFAULT_REGION=us-west-1"
  -e "S3_BUCKET=your_aws_bucket"
  lgatica/redisrestore-s3
# Disable AOF
sed -i -E "s/^ *appendonly yes.*$/appendonly no/g" /path/to/redis.conf
# Restart redis server
docker restart redis
# Enable AOF
docker exec -it redis redis-cli -a yourpassword BGREWRITEAOF
sleep 10
docker stop redis
sed -i -E "s/^ *appendonly no.*$/appendonly yes/g" /path/to/redis.conf
# Restart redis server
docker restart redis
```

## IAM Policity

You need to add a user with the following policies. Be sure to change `your_bucket` by the correct.

```xml
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "Stmt1412062044000",
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:PutObjectAcl"
            ],
            "Resource": [
                "arn:aws:s3:::your_bucket/*"
            ]
        },
        {
            "Sid": "Stmt1412062128000",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::your_bucket"
            ]
        }
    ]
}
```

## License

[MIT](https://tldrlegal.com/license/mit-license)
