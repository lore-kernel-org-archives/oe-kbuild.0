Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33B24C150A
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 19:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278497; cv=none; b=qScKWBKF5/tJiZdu6zQ3K2nKQcckhvX8Ils9AVBkk/p5Tt20gO2QlIh4K55uQD6HPx643m+Rvy3mh+BgWJjyhnm3BbSYBZHNLRUA3s+5ffAl68K974O4ULlSBEsiv2jyNJj3xbjAquGie6npeFWud4fnBaQ/K7QavmM3MPoLHjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278497; c=relaxed/simple;
	bh=tAtOy7yqdoonmqdxBl5Aj4ovM1yHmQX/0+wttvUKMDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QIkIzReKNlSegQYGQyNoX78ImjaAWdtHZBa53vns9/fWhfunyT0Gjz/9BSmswyXNG6lXxY9CS2bYjH9oTQn/YAjLh+28sfMzJZbDhEQaq8cw5JJGyz5YhCltzjGrPc47yOQcMY/avuTjQ2pEcSrVm36Zjh8TXljCcUkthm227R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLXoNTYC; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLXoNTYC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b24c3so109042f8f.0
        for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 12:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790278489; x=1790883289; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bLORYJfZZsaQptFGcOysl3n3xiXH6JOHvS+eDrSitKw=;
        b=FLXoNTYCdA7E88v9SnrrnZHryL2wT5Cq6YraSRr85HQg3XHFA6HNfURhtTh/HF90PE
         7sgPEGOW84l9eqqm7ommZ+iFm4mL3Qm4vT4nk62e94ZzDCXxV0G9Nw4JInR1h6NmmL5h
         SoBEk+nnut5iBgPFqN5FbCRVeCNZjgmWyr4qQ48mzTULooYGmjsMTl29DVjNxfgR0lnd
         +RRuVWvLb6/fKvoqHZKac13TNYMrsW46KLngpJ7HhK5uHjJUO6Y0wQ43KxS8w5HKxDX4
         nMQlZzbW2eUVUn7vDngAbMcQpakq0jEuevOlzIquCtExKROBBOWYO6utZZxDEEqmRiKT
         wHcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278489; x=1790883289;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLORYJfZZsaQptFGcOysl3n3xiXH6JOHvS+eDrSitKw=;
        b=xxfEn9X5BD9jvocQZOrw+B3mvwOUk3JypoIGet8cPac8OKS4M2xMsdk8bxdafpXenW
         gYeVqDgDAY0c4jden+ZACGIf4LadDKdg2IrJJkBFT7bdDqdKQixqv4oFsJMl/UQSjhLt
         0ODnF2HrdMo/LNQeBTbyGHtYmeXMGZoD0hqE6K6Axm8weDEwVZGwg09fDLZg9Wwl/U68
         z0GUY4HJNYDFpKzd92IQvxC8nAsrB11OE7BTREQEV0KGzCqXPIRSim0A1R2QBjOJz4kT
         u1v6Q6PW5Nhqvjrr63GFYk2O8Fqlwts1/p3KpQDbiPTEudbTp68kCz9LGs0gvFIZIjay
         DZNQ==
X-Gm-Message-State: AFuF++kX4wcXb/y/M+sD4QPW1+EH6btaVIQyOe6Rmw6xEmyqdUSNRRi+
	bUkE3cxQvAHZb0MkfCHY5BNc0KOyjYmJ+YDN/Uf7Gp/pOb2j9gucwvU7Rhsv/KTS6oT6sYzY
X-Gm-Gg: AYBFou2zKlsT2yg0czEuCgDQ3piCHfOiU8+zepDv4HAvqYVmfyAOLP2zrxZXU0hY2ob
	6vEflTYo7aUBE12sK7bguS0cIXaaF5CoDIyl7FJ3I+EEZ97LAUkSDebC2avcOzgOuX30AG+LQiL
	K+M6JCwXxNwJq3pjbu32DEjNK+9huz8WaEDnA932B51dbtdlEtjSfZm8+nGFx7CRQlQVZS9Y7qo
	t+95Xd2D+7Z/hgfXLGjWX+DF8/tkcHYgR0uOaT4Bh4Z5BSuRgyhPaF8z0wh3XE0zkNcgYaAI1Zk
	Wd4lIG3huf8JMkFKouV16riLqNTsE/LKvbj+rrkCm4YCVghbs2SLzSktSizSGFzbd30arrDuZBj
	g0Q2dTsYUckwFQun3dNX8uLBDoTEEudDdqTSw915E0dUZ6xuZv8IPd01MRKUYjBgm+iXkR0jvq0
	dsDoIjmB02MjiOihnA5HDVrCRBKsA4rHAIsnagFXES6WNx3SyMhM3hz6PkUzlLJ+bz5YGE69GBJ
	/SfuQ==
X-Received: by 2002:a05:6000:400e:b0:487:a0f:7f7b with SMTP id ffacd0b85a97d-488716b2a0amr7003899f8f.10.1790278488428;
        Thu, 24 Sep 2026 12:34:48 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a570sm1233850f8f.13.2026.09.24.12.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:34:47 -0700 (PDT)
Date: Thu, 24 Sep 2026 22:34:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Zhenzhong Duan <zhenzhong.duan@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Subject: [intel-tdx:v7.3-rc4_tdx_connect_phase2.for_upstream 11/44]
 drivers/pci/tsm/core.c:589 pci_tsm_accept() warn: set_bit() takes a bit
 number
Message-ID: <202609241930.KhG7E8hz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260924193444.q-q7EqW8FZMB0hNSv1HAC9kk1yuxp4xBW3-ydLfnras@z>

tree:   https://github.com/intel/tdx.git v7.3-rc4_tdx_connect_phase2.for_upstream
head:   69fd611d89afafa408b11f0e1304297433d3d471
commit: 36ae7ba2d3e2102d24370481ce968489667bff26 [11/44] PCI/TSM: Add device interface security RUN support
config: i386-randconfig-r2202-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241930.KhG7E8hz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241930.KhG7E8hz-lkp@intel.com/

smatch warnings:
drivers/pci/tsm/core.c:589 pci_tsm_accept() warn: set_bit() takes a bit number

vim +589 drivers/pci/tsm/core.c

36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  564  static int pci_tsm_accept(struct pci_dev *pdev)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  565  {
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  566  	int rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  567  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  568  	ACQUIRE(rwsem_read_intr, lock)(&pci_tsm_rwsem);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  569  	if ((rc = ACQUIRE_ERR(rwsem_read_intr, &lock)))
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  570  		return rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  571  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  572  	if (!pdev->tsm)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  573  		return -EINVAL;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  574  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  575  	ACQUIRE(device_intr, dev_lock)(&pdev->dev);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  576  	if ((rc = ACQUIRE_ERR(device_intr, &dev_lock)))
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  577  		return rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  578  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  579  	if (pdev->dev.driver)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  580  		return -EBUSY;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  581  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  582  	if (test_bit(PCI_TSM_F_ACCEPT, &pdev->tsm->flags))

PCI_TSM_F_ACCEPT is (1UL << 0).  This is a double BIT(BIT()) bug
where it's checking bit 1 instead of bit 0.

Also we miss Dan.  :(

36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  583  		return 0;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  584  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  585  	rc = to_pci_tsm_ops(pdev->tsm)->run(pdev);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  586  	if (rc)
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  587  		return rc;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  588  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24 @589  	set_bit(PCI_TSM_F_ACCEPT, &pdev->tsm->flags);
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  590  
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  591  	return 0;
36ae7ba2d3e210 drivers/pci/tsm/core.c Dan Williams 2026-09-24  592  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

