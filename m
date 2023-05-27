Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4CD53A2;
	Sat, 27 May 2023 11:51:08 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-64d30ab1ef2so1403870b3a.2;
        Sat, 27 May 2023 04:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685188268; x=1687780268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M60H7z7OzZaor7WG8Tl37IOGxzGrsGYe7qShJ598B1U=;
        b=eLTkkEMv24hkGpArLFJoQSm2dRo2aZ6VF7iXm2+b7wV6soXO3wlvk4dACyXkuo5wzj
         vuxTGec3F8+p6kfXshI+Cmer0dheDH78ZaF4nbnsbJdQmhjUBGsRCGTKiVW1qAqJk/ce
         BgY1TScQx7Pcnp04VaQLX5p0gYxgpX00I4rUQB2f35Mq8hEVwvitmccsFniarnP6Tebt
         5jowgfa2FZmTHAfvtNhaFYi5/IuC7lLzFgD28c6KAAJR0gMqCRiwFV3YqiXa9fHUDU/G
         rlx9pIfLQ/adgoWtN9jbUuS/sfF1LlNEEjOsuXC6TfzolufnWOmobpd1KmgbK+EXucID
         2HHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685188268; x=1687780268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M60H7z7OzZaor7WG8Tl37IOGxzGrsGYe7qShJ598B1U=;
        b=KXMpiHBSx5zFXzcZ+RmNFukPuIiPvYgNKF4EymfUEflUD2nolCpXzfAStdGl7+Mdee
         xaW9oaOTMVXN4vUsg7wQiCGwsrjqoigTNGIxBGmFdsINGUYCvott9U7/lm2q4rHuYiXb
         /t5z3c7pk18vT8/tRwWREYvYcAWrbX43sy/WtLlB0NDvddJ1fb44bofzJgpfKzIDnWli
         KXLUWsoDOVaiKWgBSf70VkZMYyqN4+xizRebaJmRc9uAi3ODbFrgR2xoGpipOxXvPq7a
         /RjSvxkL0U7vDs39zQ5awiBLWAbKtWaBzyPwcG5jzpoaklMWvmZVSVIMZVQ50Is1pSdm
         vlOA==
X-Gm-Message-State: AC+VfDzckHdSc50ewvBvHnRAlwOyMZ2g8zWBA5i3x5NtjxCFQyvWQfRY
	nmyNH8DhpPkh9/Jlhxyfs9o=
X-Google-Smtp-Source: ACHHUZ4QxAWCn3xuC6rLDt7vgW0oNL4lcvxTBwBD3SNf5vot9f+iW9ovjbAY4yk3I+5dfqUN5cCtQQ==
X-Received: by 2002:a05:6a00:cc5:b0:643:bb16:7ca6 with SMTP id b5-20020a056a000cc500b00643bb167ca6mr9083610pfv.21.1685188268122;
        Sat, 27 May 2023 04:51:08 -0700 (PDT)
Received: from redkillpc.. ([49.207.219.227])
        by smtp.gmail.com with ESMTPSA id x19-20020aa793b3000000b0064f97ff4506sm2988098pff.68.2023.05.27.04.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 04:51:07 -0700 (PDT)
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: prathubaronia2011@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	error27@gmail.com,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	oe-kbuild@lists.linux.dev
Subject: [PATCH v4 1/3] axis-fifo: fix smatch warning for format specifier
Date: Sat, 27 May 2023 17:20:58 +0530
Message-Id: <20230527115101.47569-1-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZHHE/H2p4Go/Igc/@redkillpc>
References: <ZHHE/H2p4Go/Igc/@redkillpc>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix an old smatch warning reported by lkp introduced by commit
d2d7aa53891e. In the mentioned commit we had used "%pa" format specifier
for a void* type and hence smatch complained about its use instead of
"%p".

Fixes: d2d7aa53891e ("staging: axis-fifo: convert to use miscdevice")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/r/202305150358.nt1BkbXz-lkp@intel.com/
Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
---
V3 -> V4: Split into warning fixing and cleanup commits
V2 -> V3: Fix smatch warnings from kernel test robot
V1 -> V2: Split into logical commits and fix commit message

 drivers/staging/axis-fifo/axis-fifo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7a21f2423204..271cab805cad 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -906,8 +906,8 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	if (rc < 0)
 		goto err_initial;
 
-	dev_info(fifo->dt_device, "axis-fifo created at %pa mapped to 0x%pa, irq=%i\n",
-		 &r_mem->start, &fifo->base_addr, fifo->irq);
+	dev_info(fifo->dt_device, "axis-fifo created at %pa mapped to 0x%p, irq=%i\n",
+		 &r_mem->start, fifo->base_addr, fifo->irq);
 
 	return 0;
 

base-commit: 44c026a73be8038f03dbdeef028b642880cf1511
-- 
2.34.1

