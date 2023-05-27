Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298AB53A2;
	Sat, 27 May 2023 11:51:14 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64d44b198baso1261389b3a.0;
        Sat, 27 May 2023 04:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685188273; x=1687780273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJpCwbm/WEPiYbmZRcnPg3zbQ5py3aWRu6GVo31NF5g=;
        b=VFlx8zg1fygBabKPB2KOGQRCchYmXp402Zvu6wRn5uitRW1YL3q5jEteJjdAmu0hCF
         oevYt0FL1bljCoFGMw3r5dnGlARw/js9LNK4MKKH+mpZrTlX2XqZ8AKUYRItzALcuZtu
         ntNkYqxO0cZWYr12k8u5znQt6ybj4uwHiL9OeCTrBrBJoBbGP4lndiwHhMTw2byLe4zH
         oNnj1zFQd6+h89MatK18FUT0JbLvsdqRTtdVp8V8gg3h4VzM69ASFKH5SPYHNyfFJPgj
         KRgv03mfFYM5MTjusHTRAoxTUSzdIzM6fIh8pv+92+XjLHbYYqNNt7VSscGtVfLAAFNw
         O02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685188273; x=1687780273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJpCwbm/WEPiYbmZRcnPg3zbQ5py3aWRu6GVo31NF5g=;
        b=WRAtacjfqQ99LJEjdigPi/DlUJIMrvEatnlLcUA9JkjxLqOX4NDalPHT/qyLRPET+3
         OOGyDNrgchPWEh4HPYDWSSwlUFFUpiqa84IKZZ5VnXZz5iTAmDRp8ugEXUqCDKM4wzW5
         QuEiqyugTroajZpx46SQrqX/MI4/OPolFMR8iARUo5ZawzRnWYkT1cmf5NMmxOLLKzJ3
         8wNhFLACzTahA2ywp163kTNdvF58qP9VOZ9wSngdvT4cDz2gVB/aXwFnCRW7wca6cxLX
         UBcpOdjOP6Xi1T3/l3fIVDYQW8Tl2SAoWjZT4pCRePqoMcsMcsT1HYL3aL01g2U3AK5p
         Dv8w==
X-Gm-Message-State: AC+VfDyXmMDOOrsk5wYxSZxL4TwUSaV7sPXn/wx3O68RazSYIFspT4Cz
	KqU01vp0jCnjgFW2DFoceuWRHiWkW2wY2A==
X-Google-Smtp-Source: ACHHUZ4EiLdl3+Jsl7/CLV58fqBgApK2hq9JBbNjF9xdOnsU3nSDEEnjEGgWueolcmgLNe4xLSoelg==
X-Received: by 2002:a05:6a00:a12:b0:64d:60f8:cb35 with SMTP id p18-20020a056a000a1200b0064d60f8cb35mr2695560pfh.7.1685188273505;
        Sat, 27 May 2023 04:51:13 -0700 (PDT)
Received: from redkillpc.. ([49.207.219.227])
        by smtp.gmail.com with ESMTPSA id x19-20020aa793b3000000b0064f97ff4506sm2988098pff.68.2023.05.27.04.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 May 2023 04:51:12 -0700 (PDT)
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
Subject: [PATCH v4 2/3] axis-fifo: use devm_kasprintf() for allocating formatted strings
Date: Sat, 27 May 2023 17:20:59 +0530
Message-Id: <20230527115101.47569-2-prathubaronia2011@gmail.com>
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

In various places, string buffers of a fixed size are allocated, and
filled using snprintf() with the same fixed size, which is error-prone.

Replace this by calling devm_kasprintf() instead, which always uses the
appropriate size.

Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 271cab805cad..d71bdc6dd961 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -816,10 +816,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	 * ----------------------------
 	 */
 
-	device_name = devm_kzalloc(dev, 32, GFP_KERNEL);
-	if (!device_name)
-		return -ENOMEM;
-
 	/* allocate device wrapper memory */
 	fifo = devm_kzalloc(dev, sizeof(*fifo), GFP_KERNEL);
 	if (!fifo)
@@ -857,7 +853,11 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	dev_dbg(fifo->dt_device, "remapped memory to 0x%p\n", fifo->base_addr);
 
 	/* create unique device name */
-	snprintf(device_name, 32, "%s_%pa", DRIVER_NAME, &r_mem->start);
+	device_name = devm_kasprintf(dev, GFP_KERNEL, "%s_%pa", DRIVER_NAME, &r_mem->start);
+	if (!device_name) {
+		rc = -ENOMEM;
+		goto err_initial;
+	}
 	dev_dbg(fifo->dt_device, "device name [%s]\n", device_name);
 
 	/* ----------------------------
-- 
2.34.1

