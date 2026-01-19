#!/bin/bash

LOG_FILE="alerts.log"
EMAIL="youremail@example.com"  # ضع بريدك هنا لتصلك الإشعارات

# قراءة آخر تحذير
LAST_ALERT=$(tail -n 1 $LOG_FILE)

# إرسال إشعار بالبريد (استخدام mailutils أو ssmtp يجب تثبيته)
echo "$LAST_ALERT" | mail -s "Anti-Attack AI Alert" $EMAIL

# كتابة سجل الإرسال
echo "$(date '+%Y-%m-%d %H:%M:%S') Email alert sent to $EMAIL" >> $LOG_FILE
