Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8181327781E
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 19:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752521402; cv=none; b=neY81dySVb1RzwvXFa0R3wy98QR1zbVkSjHLZLx4rhWboSPabTW1JyzdnHHiu0f8M1vN30GKPA+jAAk9Acv9RtP+ImjO2yx8TM21ys3d5VFJiuHwkyqv7wfJwrCVQ0nBJzblK3W0eqCN0tv9eV+ad5KlHWc9sE3gL1HKvbWGD1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752521402; c=relaxed/simple;
	bh=jRi6LsgXjfGrStwjvyAYC40sGkRXOQX53qEE8jtC5IY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ib1cDuwXJVahzDP9q1ponYYemUXILHMIJaNv5AqMN2Ogidtx28kmPYbXCCVVXDBu0/y4kFw2P9UCMfoeXj+/rBh66yicKTdgrQG9EMs/ppVTlI8A4ycOAj+JTEKZaylU24lO5fJ6SNzkh7dvNyPMMIgcLnF26DLYsMbQvKAAzjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gjR3Mc4o; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjR3Mc4o"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-2da3c572a0bso4367404fac.3
        for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 12:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752521399; x=1753126199; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Q+m9wicpIeBCH++LBohVYCNSQtrcgHGVb/S1A0eRqg=;
        b=gjR3Mc4ouOTiaTOpSmGxe4g4AONCEgmFqOvbxNsqYWq1DSMPvYBhkNjVTq7fXmSAmk
         xYay0JYPbXUdJA/2az7BRNcuNat5AOQ6iE4Msf3ky6PP1QbxD3w0i73pVfH2dckiC2F6
         exHeZE/Y5o3RkULDUdL+qEibVjirVlzfVG7C1YPPPztdFmqGqH8nCdDCIVxyzScq8ToW
         Xs6mK/D8YrrSI2Hfo2ibJ09TsAwdqEFTtKthr93DALJgsSCatA57E0h7pHzOe7A8+FmN
         o62ddfs1T/OHJsE05Xj4Ni/Bmoj46sfj03QOQqSmvnH8Ygb+th4/lyEt7oG+UEht/fTS
         4zNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752521399; x=1753126199;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Q+m9wicpIeBCH++LBohVYCNSQtrcgHGVb/S1A0eRqg=;
        b=Tah+xzbbCspemh2Wufx+vBSN5MPWPxrbRSS0vRLAPgGcSmazmSB7WLgqyisBUupI1W
         9IaaEvxBBCsHWBHbFZINo9fqRkSUeIILAIwhm/MZEaGjNy4F5AOJjZcpYT1Qe45T/5Ie
         37urcSDOhEM0SYU5ZSrOk4QtercS4SQHyY3qcGUg59DQEftvqfIXbY+SIBPuK8n36uNB
         dwNrz3f4wxJIM+Th4pcELxJB/Pf8VszmbLkQs2fYnpmZKFuQs71sZPpS/CF7c4iCkBkJ
         PFKRva/ZgtP4ZrkGJAJu4zfGCelLEgQNs5Y5zQjZMi/48iMIfSej90gsmwCd6rExDocr
         tp1w==
X-Gm-Message-State: AOJu0Yz1c1NK/K36U3GBfnDVxN+tdJwvrr46Jc5hQ+dWqwHUfSE3imNY
	ZFk1OAnLN6xGCfLWMMlNwlp2rYLGevjh4dgz5Faik9Q+KlAkX/ty4N8/BtFqzOf+GHV/2WGdM/m
	4tjVg
X-Gm-Gg: ASbGncvCTKfmaLMFk+c9GopB5WNrqgI51KP7uIeDJcccIyYt/mDpxVQ0rSiD+ePex0b
	fAs9FN/0sexp/6BqTy9GCpcMfUblOusq9vqEO8apeFXx3zwg7IOX82Axkgw5QZJ4C5SwQZY1a+A
	CqOiIgnIykkxVqmXEqaLUkUYUojdVmUwWtKrK2kJOgwZ3s37Z6RiSrAWSTPDaJSVM74+BM9Khaf
	KY9rZF2PyUAj08F0sdZ4NeAh23X0hK5l9xDzM2q/EOhFFAoZyB2AVw0mEApTYRwMd8+eyihkx11
	RKNKn26B42kSPtLQCCZoZAsl24HbFpjAB2Yw0jirKxXZH4mo8mZAgRRNo/Y5gFbH+4+l3U9Hkga
	3MOY4UuY6XAMAC53znyzOL1CFK6/ISiE17AM/NDGW
X-Google-Smtp-Source: AGHT+IGcqvFf04VyN5VwO5vDsILubomPqyNpRQlsi0uJ6i+fQzutbyHm2vZrUuvCt3pRKpj82Fk+9g==
X-Received: by 2002:a05:6871:d804:20b0:2ef:eddd:690d with SMTP id 586e51a60fabf-2ff26913aa7mr6688707fac.24.1752521398832;
        Mon, 14 Jul 2025 12:29:58 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6bb2:d90f:e5da:befc])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ff11686ad2sm1991198fac.28.2025.07.14.12.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 12:29:58 -0700 (PDT)
Date: Mon, 14 Jul 2025 22:29:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, khairul.anuar.romli@altera.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	"open list:SPI NOR SUBSYSTEM" <linux-mtd@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	Matthew Gerlach <matthew.gerlach@altera.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/1] mtd: spi-nor: core: Prevent oops during driver
 removal with active read or write operations
Message-ID: <2bf9baaa-e66a-40ba-96b3-44b2e5e78550@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli@altera.com>

Hi,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/khairul-anuar-romli-altera-com/mtd-spi-nor-core-Prevent-oops-during-driver-removal-with-active-read-or-write-operations/20250709-103107
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git spi-nor/next
patch link:    https://lore.kernel.org/r/e439e6b85e650a91607a1d02d5d432d096363315.1752024352.git.khairul.anuar.romli%40altera.com
patch subject: [PATCH 1/1] mtd: spi-nor: core: Prevent oops during driver removal with active read or write operations
config: i386-randconfig-141-20250711 (https://download.01.org/0day-ci/archive/20250711/202507110922.btkgvYrn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202507110922.btkgvYrn-lkp@intel.com/

smatch warnings:
drivers/mtd/spi-nor/core.c:3216 spi_nor_get_device() warn: variable dereferenced before check 'dev' (see line 3213)
drivers/mtd/spi-nor/core.c:3216 spi_nor_get_device() warn: variable dereferenced before check 'dev->driver' (see line 3213)

vim +/dev +3216 drivers/mtd/spi-nor/core.c

be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3202  static int spi_nor_get_device(struct mtd_info *mtd)
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3203  {
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3204  	struct mtd_info *master = mtd_get_master(mtd);
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3205  	struct spi_nor *nor = mtd_to_spi_nor(master);
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3206  	struct device *dev;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3207  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3208  	if (nor->spimem)
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3209  		dev = nor->spimem->spi->controller->dev.parent;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3210  	else
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3211  		dev = nor->dev;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3212  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01 @3213  	if (!try_module_get(dev->driver->owner))
                                                                                                    ^^^^^^^^^^^^^^^^^^
Dereference

be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3214  		return -ENODEV;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3215  
240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09 @3216  	if (!dev && !dev->driver && !dev->driver->owner)
                                                                                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
These checks are done too late.  Also missing module put.


240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09  3217  		return -EINVAL;
240522762fc4bc drivers/mtd/spi-nor/core.c    kromli     2025-07-09  3218  
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3219  	return 0;
be94215be1ab19 drivers/mtd/spi-nor/core.c    Xiang Chen 2021-04-01  3220  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

