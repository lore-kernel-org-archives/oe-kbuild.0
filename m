Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F30A23C6A;
	Thu, 18 May 2023 14:52:14 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1adc913094aso20854845ad.0;
        Thu, 18 May 2023 07:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684421534; x=1687013534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ps7W4euBnPTypuQ48jqWiVzSPldfhUMwv3snwxq59YY=;
        b=hedsU+5EjGATXBibLsEBR117qR3ng1l4mxOXnuvUpXBTRC1Ybnm6AXilzxo2yN7CGW
         ccffY//czw6Bi66/P6D3kQ13uVVNHKtEMrMSoUgOY4ARN4GtYZliD+VxWyxw/ChOuJNM
         GIupt/1J2Raug6vh00CvSUJe4Kqd73ip50Gw0gSW29KzkiC/U9CALCAA5M0+Qz2g0y6h
         ValE8TpyRilytjdmgbFzyhexQgU+Yvp8rMEr5f6ST4bE6bsPDqf2kjJueHveFQGj9GpK
         r0u/dhef5d57WW6tVU7/WV1Euf59rI9zIbW2JWaujQ2GK216r2FYge8JfVSor3kimTb9
         zT7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684421534; x=1687013534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ps7W4euBnPTypuQ48jqWiVzSPldfhUMwv3snwxq59YY=;
        b=NtOtT+Lt5Lu/QnJnKwEDk8X5M5XS1Z6yr8OVqIiv/CCdFMHKw22t/hBjNYRRYkzwYe
         3e7ULviBwyYBiWjd2h+4ICqsKTHCTu01T6UGsFuX4mt2cYShehdbr4RDvLbaEt3it8fP
         +mKU+UzjvlV3z5fpgPQXU0ouNEjCKymKrGouWSXlsDOFoQC8G13oiGMc42maDAkn6Z/c
         vxbw1YDqPnnec3h8F6Ny9027CpfBv2dbUljuV1xLlQ990N0Tmo8pzGLTmrdun8jy3tyJ
         E/GlkpWYia2TaytOsD/j1m8rrP2K3vtI/AgBwjSpFM+W+awOOZD+tWGbv6BvJATrcKlV
         8HlQ==
X-Gm-Message-State: AC+VfDxCUzVDa7zrpLANiAjhufPvTRm3xK2+T0SiF6FRUK7TwPeMzx68
	OQ+A/7hzT3ID+zhl5esOn051rDIaa5ldLA==
X-Google-Smtp-Source: ACHHUZ6sF60++RITMwmE7PHxBQftVercRGQ0dQRL769ij1imkDmMP4hnEMet45k+CaMg65sIOr1Y9g==
X-Received: by 2002:a17:902:6e17:b0:1ae:762a:b660 with SMTP id u23-20020a1709026e1700b001ae762ab660mr692394plk.39.1684421533749;
        Thu, 18 May 2023 07:52:13 -0700 (PDT)
Received: from redkillpc.. ([49.207.202.99])
        by smtp.gmail.com with ESMTPSA id jn9-20020a170903050900b001ac741dfd29sm1506647plb.295.2023.05.18.07.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 07:52:13 -0700 (PDT)
From: Prathu Baronia <prathubaronia2011@gmail.com>
To: prathubaronia2011@gmail.com
Cc: dan.carpenter@linaro.org,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	oe-kbuild@lists.linux.dev
Subject: [PATCH v3 2/2] axis-fifo: cleanup space issues with fops struct
Date: Thu, 18 May 2023 20:21:54 +0530
Message-Id: <20230518145154.33377-2-prathubaronia2011@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230518145154.33377-1-prathubaronia2011@gmail.com>
References: <CAJp9fsfJxoY2=fFK3-R_XoDatMB9z5WT4BaeSw3-nMScicERJQ@mail.gmail.com>
 <20230518145154.33377-1-prathubaronia2011@gmail.com>
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

