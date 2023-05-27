Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6730053A2;
	Sat, 27 May 2023 11:51:19 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-64d3fdcadb8so1362126b3a.3;
        Sat, 27 May 2023 04:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685188279; x=1687780279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps7W4euBnPTypuQ48jqWiVzSPldfhUMwv3snwxq59YY=;
        b=AqYl7ViqxvBn8HqG78gKCD/7rKL7HfBq1/pAor38gVc2DQg5wu3paaZGGxS4V7ZXlS
         2jedEA59iAcVm+XTq+abpom59mTFsWn9Faeodygf0CuJjOohBCvIds+IGzzMGs+xVbil
         Z3UNroBt9DysnC6W+qovqNd+CTCvW/e+abPur5uFCWAqnrV4wLz5dLSdyxreUll9Ww/N
         YwSHPevF6IFrhRlMqtXCErTxxkG+KurtaHOuzZCd9sCUKeDncUTIgMgFWoZtxopNwmmw
         8jYDOnkRLvJ4qXiOMrsCF34giu8WNZ2fuGm1QvE5N3/dr+/U1plyjdDbR03S7rAzWeK1
         dC/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685188279; x=1687780279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ps7W4euBnPTypuQ48jqWiVzSPldfhUMwv3snwxq59YY=;
        b=Cs668NvTmsVFqR/1GJuaqGQ8nwZ0tzOl+dYET2gvQdQIg4BIak7Fj7ec+wHhUw9Hvo
         upR172cvwuwKVYPfVOpx0j4KA+S1g97bQPfQS2yZErK+hMRJIAMODSQ80aRg5RsWru39
         QYb5T9WSDGJzF2tKpXLgf36bES/pTyf9E46qG+doEC01TtLPl1FZ2v396CQWNvz0Y9n9
         OOVfsH8VNvudhwc00EVw+fuOeT+F2kxykTlG8FbeY4SlgVovwyRA8PPftmJtbJe7oU0Q
         FYyArOy51dU9uGrVDStYi6LmATsVRlsqub76gyLks5b28dridLwzMOu21gnor9E1RDOC
         ts/g==
X-Gm-Message-State: AC+VfDzqEMtrNIQB+esuyPlOo9eXZwCZCIAHbVbzIuoALUHgMQC84a8L
	KT0UBggEJIz+xDVqBzdoWYw=
X-Google-Smtp-Source: ACHHUZ5zF+iygF5B/re2qY7V3eQMYr1cqIGaEaq0niqW5MExwb/4oKb4QmWjit3DZrE+2rrXv+iuSg==
X-Received: by 2002:a05:6a20:5493:b0:10e:d90f:35d5 with SMTP id i19-20020a056a20549300b0010ed90f35d5mr2847160pzk.51.1685188278759;
        Sat, 27 May 2023 04:51:18 -0700 (PDT)
Received: from redkillpc.. ([49.207.219.227])
        by smtp.gmail.com with ESMTPSA id x19-20020aa793b3000000b0064f97ff4506sm2988098pff.68.2023.05.27.04.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 04:51:18 -0700 (PDT)
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: prathubaronia2011@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	error27@gmail.com,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	oe-kbuild@lists.linux.dev
Subject: [PATCH v4 3/3] axis-fifo: cleanup space issues with fops struct
Date: Sat, 27 May 2023 17:21:00 +0530
Message-Id: <20230527115101.47569-3-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230527115101.47569-1-prathubaronia2011@gmail.com>
References: <ZHHE/H2p4Go/Igc/@redkillpc>
 <20230527115101.47569-1-prathubaronia2011@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add required spaces for proper formatting of fops members for better
readability.

Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index d71bdc6dd961..59e962467a3d 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -716,11 +716,11 @@ static int axis_fifo_close(struct inode *inod, struct file *f)
 }
 
 static const struct file_operations fops = {
-	.owner = THIS_MODULE,
-	.open = axis_fifo_open,
+	.owner   = THIS_MODULE,
+	.open    = axis_fifo_open,
 	.release = axis_fifo_close,
-	.read = axis_fifo_read,
-	.write = axis_fifo_write
+	.read    = axis_fifo_read,
+	.write   = axis_fifo_write
 };
 
 /* read named property from the device tree */
-- 
2.34.1

