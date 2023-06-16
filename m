Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BFAA92E;
	Fri, 16 Jun 2023 15:26:16 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1b3ce6607cbso6927585ad.2;
        Fri, 16 Jun 2023 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686929176; x=1689521176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FYEUhusEwyxkiisDOSpxeCHXNG+5BbVISUY4GtvTkN8=;
        b=p92nQbO9Sud5mdHG1nChDcyBp2JdCiUAywygC0zaZtY8TqIeGSEgsfxZZ8GfXydJoN
         abu6F3+vcUKjN4ECTnu8V2nbopYCO+4QM4ggeNcpQZQYwWpf5zpzKwi7Jp/yL3VnEBHN
         1hmW04lIkp1P6yTOt4ejPP0O0QT/h68y6Vm2KoMtY7ptw7UULJsT5D+NbRas/bM2T+MH
         pSIuCXipV4WfzfeLwajUlyb3L4tiBuzYXnsRxX8g9QEk5IBX+WXtTNryj/KZroDJmx5v
         bIOvtU2/Z7JD3VcszqFi1e6e3mwPyFOuBrIlvb/hrlhEfQ0sHToa/COoFHp2dYrsyave
         tIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686929176; x=1689521176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FYEUhusEwyxkiisDOSpxeCHXNG+5BbVISUY4GtvTkN8=;
        b=BXaPj11uVMJumcm6HeaFYja/nNPmtbGbTpTuhkvOY+4St031XAhZXGr21iwvYBRiFn
         owecuJIQoJb2jx5OfdZ841UvQaklnzHXB+LlIyo5lD1YdoUyADEfcKI4NPAGHqOBpGjm
         PYacApl0szdMpjSEMxTiQlYNEy0KnK/tCgs4rjhAxbmF9ExGtxhA2XHRq+nPYEaKexd8
         6b+Su8+SPyM8o8eNDdLdQMVUMfRHUp8HTm+nzqT635iZmahk0Pf3egklfaAQT8rZKLj3
         Fuubvt/PEJz6T9XxH6DzIj/5zWtOeP7vMcrzBYzYCUMI7kbx9LPPKOrtzxxWv/kNUgga
         7r9w==
X-Gm-Message-State: AC+VfDxm3Zu6yiCG8wnlcACYuJKUFivSRmKaUa3iaJXUD2W/W2oczPc2
	1qhOziATFUPPIIdMIYw15O8=
X-Google-Smtp-Source: ACHHUZ7QvN4j0Qeq68SxC2rezbHf0jggR9Y82c1vFRVSrbpVdi2lemrYvrrwPSofnw0kkQy4pIzj1Q==
X-Received: by 2002:a17:903:2341:b0:1ad:f138:b2f6 with SMTP id c1-20020a170903234100b001adf138b2f6mr2576988plh.16.1686929175766;
        Fri, 16 Jun 2023 08:26:15 -0700 (PDT)
Received: from redkillpc.. ([49.207.203.99])
        by smtp.gmail.com with ESMTPSA id y13-20020a17090322cd00b001a69dfd918dsm15992057plg.187.2023.06.16.08.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 08:26:15 -0700 (PDT)
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
Subject: [PATCH v5 2/2] axis-fifo: remove the unnecessary dev_info()
Date: Fri, 16 Jun 2023 20:56:00 +0530
Message-Id: <20230616152602.33232-2-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616152602.33232-1-prathubaronia2011@gmail.com>
References: <ZIiTL5bzMUgs3L5K@redkillpc>
 <20230616152602.33232-1-prathubaronia2011@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This dev_info() statement is not needed since drivers need to be quiet
under normal operation and its not a good idea to print addresses in
kernel log.

Signed-off-by: Prathu Baronia <prathubaronia2011@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 5e070e00e27a..d1ce8b9e32eb 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -906,9 +906,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	if (rc < 0)
 		goto err_initial;
 
-	dev_info(fifo->dt_device, "axis-fifo created at %pa mapped to 0x%pa, irq=%i\n",
-		 &r_mem->start, &fifo->base_addr, fifo->irq);
-
 	return 0;
 
 err_initial:
-- 
2.34.1

