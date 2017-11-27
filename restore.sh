#!/usr/bin/env sh

USER_ID=${USER_ID:-100}
GROUP_ID=${GROUP_ID:-101}

# Remove old files
rm -f /backup/dump.rdb.old /backup/appendonly.aof.old

# Backup actual dump.rdb
if [ -f /backup/dump.rdb ]
then
  mv /backup/dump.rdb /backup/dump.rdb.old
fi

# Backup actual appendonly.aof
if [ -f /backup/appendonly.aof ]
then
  mv /backup/appendonly.aof /backup/appendonly.aof.old
fi

# Download backup
aws s3 cp "s3://${S3_BUCKET}/${BACKUP_NAME}" "/tmp/${BACKUP_NAME}"

# Decompress backup with progress
cd /tmp/ && pv $BACKUP_NAME | tar xzf - -C .

# Change permissions
chown $USER_ID:$GROUP_ID /tmp/backup/input/dump.rdb
chmod 660 /tmp/backup/input/dump.rdb

# Restore backup
mv /tmp/backup/input/dump.rdb /backup/

# Remove backup
rm -rf /tmp/backup

exec "$@"
