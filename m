Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FA31D4156
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729846916; cv=none; b=sU/auamXGn9/k554KDwE4m/oGGomKIs9IWrfHDktEO0j2E5+wtTzTxu56yNlKWaJ5f9pC+GUVqvii7TuFJDTCIf4UVXUqzWydQRUHAHdr248ssaBM0Ab4S5UCRqjakJDa9kMsi6UHD4AlRwedbUTL/SN0wkURvqJjdkEmH6W7GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729846916; c=relaxed/simple;
	bh=06MGEO474+FAKHkMngrBTkYtveCLwI1S5YLwdTkTqpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NLlAhG55cmlm5zCDKdJh9UK6OhgQbbYc51tcPZNLwlUEzBHyIXFlDIk5QUZWBCvMokGLKcYXagsrW/YjdDywYLcfrHBMmMRaQbN5DdmhGSMiKi2qNJuu14MnPmUsGTZdteseK6Mz8K+PlXdZ46AvsAYiM43bjer7EFCFyHW22/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cw1EF8uB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cw1EF8uB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729846914; x=1761382914;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=06MGEO474+FAKHkMngrBTkYtveCLwI1S5YLwdTkTqpI=;
  b=cw1EF8uB6zwzg6sL85OCfp6qqS3FCTcyfQKPYOFn/Su+rWrrv4UBa9m9
   TPIGEw/Xzus7cZS7j6CEVcyFxE58eB5CstoYsELSAby3LBzYlX0UEuQDj
   VQy5KYPJLntZsy0ndXJ2ispwS0p1FT4yrgZi6xDDLsnrOMFR9aSvL2Qea
   qHkOYVY1W+YBvANhva36ES/ZhoYmQRHTfBHOZv8kiIkwoeJ5h7eou7ps1
   LveWm3mG2AEa0Yfi1RIogeyg1FMe/EdnMAhicZin9tkz5OYf4ASv+EIdS
   RZH61N64+5wUu54EaZdmmnJDEROB9oIFd/Ik8LZ/0LEiR6/XDoL3+Z62m
   Q==;
X-CSE-ConnectionGUID: EkFh9tQKT8SC1B/8cVXyZQ==
X-CSE-MsgGUID: V/f5mJkHRlGpYYjBMnxkDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="52064589"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="52064589"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2024 02:01:54 -0700
X-CSE-ConnectionGUID: ZAxpcYbJTwu4+R/CfDZ/xQ==
X-CSE-MsgGUID: J4xKNpKrRy28ju+42EIF+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="85620161"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 25 Oct 2024 02:01:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4GCb-000Xux-31;
	Fri, 25 Oct 2024 09:01:49 +0000
Date: Fri, 25 Oct 2024 17:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 5084/7183] drivers/mtd/nand/raw/atmel/pmecc.c:384
 atmel_pmecc_create_user() warn: passing devm_ allocated variable to kfree.
 'user'
Message-ID: <202410251731.GvzYXvLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Miquel Raynal <miquel.raynal@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fd21fa4a912ebbf8a6a341c31d8456f61e7d4170
commit: 6d734f1bfc336aaea91313a5632f2f197608fadd [5084/7183] mtd: rawnand: atmel: Fix possible memory leak
:::::: branch date: 27 hours ago
:::::: commit date: 4 days ago
config: sparc64-randconfig-r073-20241023 (https://download.01.org/0day-ci/archive/20241025/202410251731.GvzYXvLn-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410251731.GvzYXvLn-lkp@intel.com/

smatch warnings:
drivers/mtd/nand/raw/atmel/pmecc.c:384 atmel_pmecc_create_user() warn: passing devm_ allocated variable to kfree. 'user'

vim +/user +384 drivers/mtd/nand/raw/atmel/pmecc.c

f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  341  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  342  struct atmel_pmecc_user *
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  343  atmel_pmecc_create_user(struct atmel_pmecc *pmecc,
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  344  			struct atmel_pmecc_user_req *req)
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  345  {
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  346  	struct atmel_pmecc_user *user;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  347  	const struct atmel_pmecc_gf_tables *gf_tables;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  348  	int strength, size, ret;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  349  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  350  	ret = atmel_pmecc_prepare_user_req(pmecc, req);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  351  	if (ret)
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  352  		return ERR_PTR(ret);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  353  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  354  	size = sizeof(*user);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  355  	size = ALIGN(size, sizeof(u16));
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  356  	/* Reserve space for partial_syn, si and smu */
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  357  	size += ((2 * req->ecc.strength) + 1) * sizeof(u16) *
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  358  		(2 + req->ecc.strength + 2);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  359  	/* Reserve space for lmu. */
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  360  	size += (req->ecc.strength + 1) * sizeof(u16);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  361  	/* Reserve space for mu, dmu and delta. */
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  362  	size = ALIGN(size, sizeof(s32));
36de80740008e6 drivers/mtd/nand/atmel/pmecc.c     Richard Genoud  2017-09-27  363  	size += (req->ecc.strength + 1) * sizeof(s32) * 3;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  364  
6d734f1bfc336a drivers/mtd/nand/raw/atmel/pmecc.c Miquel Raynal   2024-10-01  365  	user = devm_kzalloc(pmecc->dev, size, GFP_KERNEL);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  366  	if (!user)
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  367  		return ERR_PTR(-ENOMEM);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  368  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  369  	user->pmecc = pmecc;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  370  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  371  	user->partial_syn = (s16 *)PTR_ALIGN(user + 1, sizeof(u16));
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  372  	user->si = user->partial_syn + ((2 * req->ecc.strength) + 1);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  373  	user->lmu = user->si + ((2 * req->ecc.strength) + 1);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  374  	user->smu = user->lmu + (req->ecc.strength + 1);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  375  	user->mu = (s32 *)PTR_ALIGN(user->smu +
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  376  				    (((2 * req->ecc.strength) + 1) *
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  377  				     (req->ecc.strength + 2)),
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  378  				    sizeof(s32));
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  379  	user->dmu = user->mu + req->ecc.strength + 1;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  380  	user->delta = user->dmu + req->ecc.strength + 1;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  381  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  382  	gf_tables = atmel_pmecc_get_gf_tables(req);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  383  	if (IS_ERR(gf_tables)) {
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16 @384  		kfree(user);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  385  		return ERR_CAST(gf_tables);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  386  	}
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  387  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  388  	user->gf_tables = gf_tables;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  389  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  390  	user->eccbytes = req->ecc.bytes / req->ecc.nsectors;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  391  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  392  	for (strength = 0; strength < pmecc->caps->nstrengths; strength++) {
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  393  		if (pmecc->caps->strengths[strength] == req->ecc.strength)
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  394  			break;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  395  	}
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  396  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  397  	user->cache.cfg = PMECC_CFG_BCH_STRENGTH(strength) |
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  398  			  PMECC_CFG_NSECTORS(req->ecc.nsectors);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  399  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  400  	if (req->ecc.sectorsize == 1024)
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  401  		user->cache.cfg |= PMECC_CFG_SECTOR1024;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  402  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  403  	user->cache.sarea = req->oobsize - 1;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  404  	user->cache.saddr = req->ecc.ooboffset;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  405  	user->cache.eaddr = req->ecc.ooboffset + req->ecc.bytes - 1;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  406  
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  407  	return user;
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  408  }
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  409  EXPORT_SYMBOL_GPL(atmel_pmecc_create_user);
f88fc122cc34c2 drivers/mtd/nand/atmel/pmecc.c     Boris Brezillon 2017-03-16  410  

:::::: The code at line 384 was first introduced by commit
:::::: f88fc122cc34c2545dec9562eaab121494e401ef mtd: nand: Cleanup/rework the atmel_nand driver

:::::: TO: Boris Brezillon <boris.brezillon@free-electrons.com>
:::::: CC: Boris Brezillon <boris.brezillon@free-electrons.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
