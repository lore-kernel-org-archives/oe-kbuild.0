Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4133F53AE;
	Wed, 25 Oct 2023 06:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iLSINCz9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c9fa869a63so34567105ad.0;
        Tue, 24 Oct 2023 23:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698214154; x=1698818954; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DOzMC9JnINWc5MYbwZ7TC8/K6W3nb2Ih949g1iEUhFo=;
        b=iLSINCz9YJekSJtMQCS4YBQwsCngXWVokaiyPxsBfIsUjZyj9MkEBVLsHMGMct+jWE
         TCLE50Y6xTdmJfOq/rmUteWC5+kl6u0m+meX/JrOpNDDR6f8gVU9StXsCHjP0ub8ZClz
         rsDiQEcicfC+jqgoItNaEdnpBuRV8ZtoGLM7pszMJthA9cXx7j1hbcN923ZF9qeuJ/W8
         NT/bvdpMFJD1VrSjJcRyOOb7exniRNk0Oh6oEc14nd2m8j2mGX910uEUoYcMa3hPBbAf
         BHaxIH6Mtiwtos8jLWejPOaEX0Lwz+HGoBRFkk07BShEkx2R1j2ydUFsE+Rs2hpNi80x
         iEjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698214154; x=1698818954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DOzMC9JnINWc5MYbwZ7TC8/K6W3nb2Ih949g1iEUhFo=;
        b=vGnWZUUIQLZvJvzAqKZYZgU8fK58iEYc3x3LenZYb+wfi4pM15vV51KXwf99AH4LKj
         tX7qiLZxLCDjPn1I5jSkvtsOM36wBndCCh6JfnA5Ml2U2LsRRxmtajvZJHa/1gnOLSm+
         aUhaJ+icRfRK0PJ9UMqMRA43ofN/eczw6nVoly9Xgc3eqHcnBZcAn6Hhc70UrlWiY9SR
         DoWR8yk74m9qlM5f0u7Mpvj2GZKTICbWuzML+A8YviXtR6MmWje01RDvuobUU3vJp8Ms
         XNJ+Fb9GnSTQdF+oe9RKSvV61yNRuWvj5V1vKRY1zKH4/11HUu0En6T0Ic1I8lHSwacL
         T/LQ==
X-Gm-Message-State: AOJu0YwAZTu9BM6LHwkmsuXRyiXv/s4/I8k6z/dz6dhJuYfstq+wTyeN
	GA2oVa5Sh1xwk3jpdXkYuds=
X-Google-Smtp-Source: AGHT+IEaeAcoCGe4BhTpz5eV1Ol/6pw+vtWHIt90lHzvDh2Llq6p722EYAJEY6FXVXxugtYLDKt2Kw==
X-Received: by 2002:a17:902:c404:b0:1c7:8345:f377 with SMTP id k4-20020a170902c40400b001c78345f377mr15172079plk.29.1698214154398;
        Tue, 24 Oct 2023 23:09:14 -0700 (PDT)
Received: from manas-VirtualBox.iitr.ac.in ([103.37.201.173])
        by smtp.gmail.com with ESMTPSA id x4-20020a170902ea8400b001c723d6c410sm8380067plb.16.2023.10.24.23.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 23:09:14 -0700 (PDT)
From: Manas Ghandat <ghandatmanas@gmail.com>
To: dan.carpenter@linaro.org,
	dave.kleikamp@oracle.com,
	shaggy@kernel.org
Cc: Manas Ghandat <ghandatmanas@gmail.com>,
	Linux-kernel-mentees@lists.linuxfoundation.org,
	jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	lkp@intel.com,
	oe-kbuild-all@lists.linux.dev,
	oe-kbuild@lists.linux.dev
Subject: [PATCH-v2] jfs: fix slab-out-of-bounds Read in dtSearch
Date: Wed, 25 Oct 2023 11:39:07 +0530
Message-Id: <20231025060907.115675-1-ghandatmanas@gmail.com>
X-Mailer: git-send-email 2.37.2
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently while searching for current page in the sorted entry table
of the page there is a out of bound access. Added a bound check to fix
the error.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202310241724.Ed02yUz9-lkp@intel.com/
Signed-off-by: Manas Ghandat <ghandatmanas@gmail.com>
---
V1 -> V2 : Removed redundant check on stbl

 fs/jfs/jfs_dtree.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/jfs/jfs_dtree.c b/fs/jfs/jfs_dtree.c
index 92b7c533407c..cf67d32d5b7f 100644
--- a/fs/jfs/jfs_dtree.c
+++ b/fs/jfs/jfs_dtree.c
@@ -633,6 +633,9 @@ int dtSearch(struct inode *ip, struct component_name * key, ino_t * data,
 		for (base = 0, lim = p->header.nextindex; lim; lim >>= 1) {
 			index = base + (lim >> 1);
 
+			if (stbl[index] < 0)
+				goto out;
+
 			if (p->header.flag & BT_LEAF) {
 				/* uppercase leaf name to compare */
 				cmp =
-- 
2.37.2

