Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482E6107A4;
	Mon, 19 Jun 2023 16:22:54 +0000 (UTC)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-55e4a928a06so639282eaf.1;
        Mon, 19 Jun 2023 09:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687191773; x=1689783773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+dBZ4QE3iHZ2NqaoR/mbbh84ypRmb1ClG886OJW8OOA=;
        b=JPctqpk/k4DOgnE5DJdIZ1VK2Qu5L8ICLwX17bvGkAccLb/f9teMUmaFA+nVdNbSAr
         lC3qXg2ny1vtOtJhLZC+38UlOOJ+S1LxtFq9pX6RG3tPwn+TflOAucFuhLIk3DHMNOfl
         fmi1DwXfbJrw2Ripmy8919WOj7UvLon4bcRQG07yCvoErIl5ksV2dGcTbLM8/LZQJYck
         Zw6x1+pXu+yLhJ9Pg+gLmNtxqWO+B/rDd9lPjL3t95kkFqYIJd+qTmgoRhMCb7KBoimy
         m44EaM2lJnwn2ib0KZYosCg6rrv6tJU7oNZf7DJldnFIKd+azJQXMJ6IUX8YIbgAyAOb
         NyzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687191773; x=1689783773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+dBZ4QE3iHZ2NqaoR/mbbh84ypRmb1ClG886OJW8OOA=;
        b=PLxfKMm7lHGr+4Rd2kVJOZT/OvjbnEDs+aLB34eRbg93qhPFeoOdeBaBmzmYMvlSrD
         Qa0jMuYmzFb258/TxngoRjsBCFzqQvUbXa7dYBBiIA7JqEwxqZ8CCvgvxOmXGlMPrsqQ
         9mgZI+HVnwnCxpaog7EFy0kiDnIHwMiaDN+McIw5Bs4wEYal2bU1Kci42eqpI97m/YVV
         qId6dwTXYSsMONUpsKE4ZI6JFA3mYM4UZjO/1Y7kg05P+ZvX/A6qWtJVKNgX9/5cnZK5
         NGwTwP4ksUvv5XeyVxMXkn5BrvkreF5F2sa4gebHMU1YnHNLnhOsAsk7A12qcQzt7syu
         8QWA==
X-Gm-Message-State: AC+VfDyr7BPcmRDs69COQPJDHBgSxK+OjdUv+/SmCWx0iGnxga9xscOO
	OVTlvVaYEvFTyudPmL380y4=
X-Google-Smtp-Source: ACHHUZ6RBh7MoPUIKifmx/4+vl5ryIe2Zirj7C2/QmQdiz9P7UWQdKqmpaa7hxLgfEy2EX1eolO2PA==
X-Received: by 2002:aca:2115:0:b0:39e:b834:1853 with SMTP id 21-20020aca2115000000b0039eb8341853mr4514837oiz.33.1687191772986;
        Mon, 19 Jun 2023 09:22:52 -0700 (PDT)
Received: from redkillpc.. ([49.207.216.186])
        by smtp.gmail.com with ESMTPSA id 2-20020a17090a1a4200b0025f09822d7csm62997pjl.24.2023.06.19.09.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 09:22:52 -0700 (PDT)
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: prathubaronia2011@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Khadija Kamran <kamrankhadijadj@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	error27@gmail.com,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	oe-kbuild@lists.linux.dev
Subject: [PATCH v6 1/2] axis-fifo: use devm_kasprintf() for allocating formatted strings
Date: Mon, 19 Jun 2023 21:52:44 +0530
Message-Id: <20230619162246.33007-1-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZI/5H+GZU6/2osGT@redkillpc>
References: <ZI/5H+GZU6/2osGT@redkillpc>
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
V5 -> V6: Split into api change and name change commits
V4 -> V5: Remove the dev_info() and use a unique identifier for dev name
V3 -> V4: Split into warning fixing and cleanup commits
V2 -> V3: Fix smatch warnings from kernel test robot
V1 -> V2: Split into logical commits and fix commit message

 drivers/staging/axis-fifo/axis-fifo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7a21f2423204..7d8da9ce2db8 100644
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
+	device_name = devm_kasprintf(dev, GFP_KERNEL, "%s_%p", DRIVER_NAME, &r_mem->start);
+	if (!device_name) {
+		rc = -ENOMEM;
+		goto err_initial;
+	}
 	dev_dbg(fifo->dt_device, "device name [%s]\n", device_name);
 
 	/* ----------------------------

base-commit: 45a3e24f65e90a047bef86f927ebdc4c710edaa1
-- 
2.34.1

