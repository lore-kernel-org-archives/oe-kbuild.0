Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C35623C6A;
	Thu, 18 May 2023 14:52:04 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ae408f4d1aso17023175ad.0;
        Thu, 18 May 2023 07:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684421524; x=1687013524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ruq/Ywhniwz2wuJubZoPfwzby3RDyAXkxxglK53ZUJw=;
        b=N1ZgO1d689rsieyP7SA0NjCb2E4BHwBum86VY4w4VXvX3JA2AAIoKeyVuTnC8qac4c
         4Buv5U+g74H40WFcEiScbvS3SOJy7T3q4lD+UUAH9hj3Gf9dDKxYOxd16GqMeTikonkD
         87h03NxtLcj2h31IsfC5piAbvJ9n1iJxbyRsqTnqLDVo9XMbRn1E3zgTDJjjX6S5EYOm
         P9KgJH1xg7hCSSCnCZcDr0q51HNXdWKhrTtaMgclwDQ+pGoI0K1f38kMkOm08fYkR207
         JwOF/Fm4zpUpPwtUNYqyeahPQzYKYwmED6cSWiqH+ZALxtGOACQnLKFyXQTV6AErB88U
         vQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684421524; x=1687013524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ruq/Ywhniwz2wuJubZoPfwzby3RDyAXkxxglK53ZUJw=;
        b=SqXCR78jwmEbjr1ktx+8m+MZBceHDdIopLgwkCv30V2VILO962Hd8a64wdhxeFLLjm
         MWFlWgBIOinJza/Fa6IQ0mSt6EzehtxwhRr1fWzklbmobGVi+biIDqStngdwsM3Qzs7M
         zj9RRGUi887fTd3Rp3aOnDkQVlvSFN50bflREZz4+MauBtMYKjLJcoe6oPV3T4rrhlPL
         zcmQXjXvhfJQnoXcw+b+cBw5o3C4uQm7YSSt/pwVsQx9p+78vY+nex+/XNGvWtQP4Fej
         5kRauA0L8o2Q/TR2ACoqlkY+vlQd1Lwk5jIP3ies7xhGYud9e/T4yHAmqRw39rkDXA4w
         Hu6g==
X-Gm-Message-State: AC+VfDyXMrdTsRtM2AVRwgRc61qnpK23q4Onw1RTKwduGWdPH6O4t0Cc
	OXjZcNnLgwdmcWUrLxudj7g=
X-Google-Smtp-Source: ACHHUZ6uJgpLnQHI+VVzbFAn/3rWSLWG2ukFMlyVufPY05bqlAlbkliLhE8tEzKxD1Gcx67LKfFhxw==
X-Received: by 2002:a17:902:b218:b0:1ad:fc06:d7c0 with SMTP id t24-20020a170902b21800b001adfc06d7c0mr2889304plr.1.1684421523753;
        Thu, 18 May 2023 07:52:03 -0700 (PDT)
Received: from redkillpc.. ([49.207.202.99])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001ac741dfd29sm1506647plb.295.2023.05.18.07.52.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 07:52:03 -0700 (PDT)
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: prathubaronia2011@gmail.com
Cc: dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	oe-kbuild@lists.linux.dev,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH v3 1/2] axis-fifo: use devm_kasprintf() for allocating formatted strings
Date: Thu, 18 May 2023 20:21:53 +0530
Message-Id: <20230518145154.33377-1-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAJp9fsfJxoY2=fFK3-R_XoDatMB9z5WT4BaeSw3-nMScicERJQ@mail.gmail.com>
References: <CAJp9fsfJxoY2=fFK3-R_XoDatMB9z5WT4BaeSw3-nMScicERJQ@mail.gmail.com>
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

Also fix an old smatch warning reported by lkp introduced by commit
d2d7aa53891e. In the mentioned commit we had used "%pa" format specifier
for a void* type and hence smatch complained about its use instead of
"%p".

Fixes: d2d7aa53891e ("staging: axis-fifo: convert to use miscdevice")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://lore.kernel.org/r/202305150358.nt1BkbXz-lkp@intel.com/
Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
---
V2 -> V3: Fix smatch warnings from kernel test robot
V1 -> V2: Split into logical commits and fix commit message

 drivers/staging/axis-fifo/axis-fifo.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7a21f2423204..d71bdc6dd961 100644
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
@@ -906,8 +906,8 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	if (rc < 0)
 		goto err_initial;
 
-	dev_info(fifo->dt_device, "axis-fifo created at %pa mapped to 0x%pa, irq=%i\n",
-		 &r_mem->start, &fifo->base_addr, fifo->irq);
+	dev_info(fifo->dt_device, "axis-fifo created at %pa mapped to 0x%p, irq=%i\n",
+		 &r_mem->start, fifo->base_addr, fifo->irq);
 
 	return 0;
 

base-commit: 4d6d4c7f541d7027beed4fb86eb2c451bd8d6fff
-- 
2.34.1

