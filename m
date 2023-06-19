Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE067107A4;
	Mon, 19 Jun 2023 16:22:58 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-25ecc896007so2057241a91.3;
        Mon, 19 Jun 2023 09:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687191778; x=1689783778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYKfkHUhPmEWMTYBe49vLBB3BZHoBpD7ULXkFfcwNLg=;
        b=PVrB+7LDEV23b7y1JNuNcTb1lKoZ1vu0xbLyaKzfUTuvybQu4kEoQ8WQ4Fi2reP2SZ
         fmGKtpaTl8EYEQQLXtN4k1F5/Anq9IX3h1oKnYMMNVm3JKIdOUjIJeYEyBgpPEHLCeZV
         cv4RVUpLhNI6jtT0k2JoH3ZA4SCDnDJzPXvsRGPo+7LABM/6eL4KhO/ba6JUoqzVQvc8
         B1oJv9EY0Sq6le4qG3auPcsCNNx0ObsnxD/qLTTSzVi/rsHsM5+YdhrZXzYNZO7jXVm2
         mjWt4ZPUxbDyQ2dUVg5symwJzUq0XEkr/pD3vuFQ/XXNCIEwWAqffNrMXf9IpsNtSIuQ
         lqmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687191778; x=1689783778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BYKfkHUhPmEWMTYBe49vLBB3BZHoBpD7ULXkFfcwNLg=;
        b=kQqEMYDXrfbej1GZr1icyWYYEjwnoO6ifuxVi3M92yK5S2zyYq/2m3j0h1TpeW/qY9
         7Zv4o3PxIc4imzQd4YHRgPZzr7vAQsCssWHcE7ZjHRFpXHXkdzRbjSwhV5SSEqP1tu5R
         XevMGTrz55/XXYovdNn3Bd4i+RGZodgARjlgdHVOf0QtOYy1rUbA28AWjE9OskdbW7gw
         tHnx4PzTISr4SMgJmL5uKLP9B4+VIzc9Ld1LMis8DjBX2pq9YX0Upu7JtLFYqtOTnhjT
         4aX7NXdt/6ycbJXxxUOR3lhgENISfyItNP262H6roLTleseMaRZuzvzxvfmwnldcmdCW
         DnMw==
X-Gm-Message-State: AC+VfDzCybRL2xTKKGAOiNWKopKUHiULK1VqIJTyxig65AO9XSOD1HSj
	zE5HM4ReVhVVtKndaEF05/8=
X-Google-Smtp-Source: ACHHUZ6f9DaBoWHDnC1YKiYnePtJl2GpijXt3bvzF+SpR4F244IpBpmOoILvRr8H/MFV6v2hANaJQw==
X-Received: by 2002:a17:90a:f83:b0:25b:f66c:35a9 with SMTP id 3-20020a17090a0f8300b0025bf66c35a9mr8970440pjz.48.1687191778229;
        Mon, 19 Jun 2023 09:22:58 -0700 (PDT)
Received: from redkillpc.. ([49.207.216.186])
        by smtp.gmail.com with ESMTPSA id 2-20020a17090a1a4200b0025f09822d7csm62997pjl.24.2023.06.19.09.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 09:22:57 -0700 (PDT)
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
Subject: [PATCH v6 2/2] axis-fifo: change device name by assigning unique device id
Date: Mon, 19 Jun 2023 21:52:45 +0530
Message-Id: <20230619162246.33007-2-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619162246.33007-1-prathubaronia2011@gmail.com>
References: <ZI/5H+GZU6/2osGT@redkillpc>
 <20230619162246.33007-1-prathubaronia2011@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allocating the device name with a unique identifier
instead of a kernel address.

Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7d8da9ce2db8..5e070e00e27a 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -853,7 +853,7 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	dev_dbg(fifo->dt_device, "remapped memory to 0x%p\n", fifo->base_addr);
 
 	/* create unique device name */
-	device_name = devm_kasprintf(dev, GFP_KERNEL, "%s_%p", DRIVER_NAME, &r_mem->start);
+	device_name = devm_kasprintf(dev, GFP_KERNEL, "%s_%d", DRIVER_NAME, pdev->id);
 	if (!device_name) {
 		rc = -ENOMEM;
 		goto err_initial;
-- 
2.34.1

