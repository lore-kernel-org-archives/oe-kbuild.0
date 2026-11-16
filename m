Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794794560;
	b=OZgKq8xRd9FFZ9FEzqmR/2GwR8kSp2ie5t2706tFjQndPEqs8t0AhlqwBWQMxTIrExl1
	 d2eVvEHdyqoRbqM9liYKAKDcZR2i1vncIC1SW8Sy4fTAjE4LlTUYhDO5pRG++TBYe/iWD
	 n3SgxyvqkC8OVlHm/1ueFC9HjhgRL4sLsFISUg/8z/rtSZ1/bcIRAvfkXAA3ve9uQ/STj
	 eKMkxtDyPReCOgZDLM5ZcJHdjQEvIc43BiSVhRlXZW2NKBBBOPt5WWxXdvA8WE8sFtbGZ
	 2ayn2USNsg8souNM3iozC94Wvf5tZtRklzmUV+6sxD575JHMycf9vWwK4wmM0+qtWhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794794560;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UeJZ0Qyv+sUGj7AjE9/U9X2YFjzlGdhiBzDArijIQQA=;
	b=4z/MgBVzBFZzBuP01SmvSLqMRn57KCzhqp0b5I1ZlOyWVk7+0qf+VagPIL76WPWnzShE
	 SnM2IAV/YgUbgM4YlWa1pmiuM6dqwNuGX2q0YuiJuhsomGdsHBef5oKTVC0PUa532hek0
	 /50Hs1pJjORcKhpjjf/SXL33KnzrL7kMpO59NF3Dv3I5rZADkJz6dCrGwD4dx/wYUSEwa
	 QBypIE3FNymHMfsHlAR9rOqh3TNjgY84MYwWlTI0mLNmgrD3fU8ImGFSQXfROyHDXxX4N
	 Ptx4FyuTGPKPHnByLBaKn1HEaNlOn2asVjX+eVbpCEfUK6VeW8bDTey0TaN8b8NSuMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EbE+TWU6;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491FB606A31F
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Nov 2026 02:02:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 491FB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EbE+TWU6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794794561; x=1826330561;
  h=date:from:to:cc:subject:message-id;
  bh=YF8wWPU2v8sAXRu1HyaeLLyiDDge/r5ucqEyq4itiDE=;
  b=EbE+TWU6jpBbvcztNoKtHEgQpyQmt8LXAs8UohYdfFVU9nTYdaLpX956
   SoMZKAQhFqZ75tmgvrketRAp2ZaLALNL4tEJ8fwR23yoniiQKM2fBnvwn
   RO9vrT1D35NExTt8N9n2+ysVoIjgKEXm/P4pZmsxufs7/ixEAUy9rlckC
   OU5QMtNb+ooyGxJ7UQrUWgBod4lu5wEgmdUJEpfntb7aKy3WFFfr+vUjY
   VZhkddhsWDe/x8mXghEz/btLsux6wDjsvpW+RD0xJgTWU8PCBHVH2i9Yf
   XXsYDaZtRYVJMIVdx8nQl2otU/nsZp7DDHgtcWEZv8/SAMPeQ/M7KKEP3
   Q==;
X-CSE-ConnectionGUID: Aoi4zDxbQTG3PgK9IzWivA==
X-CSE-MsgGUID: KDCTSEZrT32Svku8kKYBYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3412844"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3412844"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 18:02:40 -0800
X-CSE-ConnectionGUID: nDFDsavdSRWJG1akmRUM/A==
X-CSE-MsgGUID: L0gHRY6vTMm0jPdEQo9rNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="11325749"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 15 Nov 2026 18:02:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSm3I-000000002Yr-1U6e;
	Mon, 16 Nov 2026 02:02:36 +0000
Date: Mon, 16 Nov 2026 03:01:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/uio/uio_fsl_elbc_gpcm.c:323:5-8: WARNING: Unsigned
 expression compared with zero: irq < 0
Message-ID: <202611160240.RdmUbHwQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rosen Penev <rosenp@gmail.com>

Hi Rosen,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aebb7274476403040d582c61478df8f4a7bf9cd3
commit: c8295feb756f5e3ccf02c14a90a2ee0aed95e409 uio: fsl_elbc_gpcm: use platform helpers for resource and IRQ
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: powerpc64-randconfig-r2100-20261115 (https://download.01.org/0day-ci/archive/20261116/202611160240.RdmUbHwQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project c0693becb96c1610aeb87445a50df00d58a823cd)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c8295feb756f ("uio: fsl_elbc_gpcm: use platform helpers for resource and IRQ")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611160240.RdmUbHwQ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/uio/uio_fsl_elbc_gpcm.c:323:5-8: WARNING: Unsigned expression compared with zero: irq < 0

vim +323 drivers/uio/uio_fsl_elbc_gpcm.c

fbc4a8a85777e0 John Ogness        2014-12-09  297  
fbc4a8a85777e0 John Ogness        2014-12-09  298  static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
fbc4a8a85777e0 John Ogness        2014-12-09  299  {
fbc4a8a85777e0 John Ogness        2014-12-09  300  	struct device_node *node = pdev->dev.of_node;
fbc4a8a85777e0 John Ogness        2014-12-09  301  	struct fsl_elbc_gpcm *priv;
fbc4a8a85777e0 John Ogness        2014-12-09  302  	struct uio_info *info;
fbc4a8a85777e0 John Ogness        2014-12-09  303  	char *uio_name = NULL;
c8295feb756f5e Rosen Penev        2026-07-22  304  	struct resource *res;
c8295feb756f5e Rosen Penev        2026-07-22  305  	void __iomem *base;
fbc4a8a85777e0 John Ogness        2014-12-09  306  	unsigned int irq;
fbc4a8a85777e0 John Ogness        2014-12-09  307  	u32 reg_br_cur;
fbc4a8a85777e0 John Ogness        2014-12-09  308  	u32 reg_or_cur;
fbc4a8a85777e0 John Ogness        2014-12-09  309  	u32 reg_br_new;
fbc4a8a85777e0 John Ogness        2014-12-09  310  	u32 reg_or_new;
fbc4a8a85777e0 John Ogness        2014-12-09  311  	int ret;
fbc4a8a85777e0 John Ogness        2014-12-09  312  
fbc4a8a85777e0 John Ogness        2014-12-09  313  	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
fbc4a8a85777e0 John Ogness        2014-12-09  314  		return -ENODEV;
fbc4a8a85777e0 John Ogness        2014-12-09  315  
c8295feb756f5e Rosen Penev        2026-07-22  316  	/* map the memory resource */
c8295feb756f5e Rosen Penev        2026-07-22  317  	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
c8295feb756f5e Rosen Penev        2026-07-22  318  	if (IS_ERR(base))
c8295feb756f5e Rosen Penev        2026-07-22  319  		return PTR_ERR(base);
c8295feb756f5e Rosen Penev        2026-07-22  320  
c8295feb756f5e Rosen Penev        2026-07-22  321  	/* get optional irq value */
c8295feb756f5e Rosen Penev        2026-07-22  322  	irq = platform_get_irq(pdev, 0);
c8295feb756f5e Rosen Penev        2026-07-22 @323  	if (irq < 0)
c8295feb756f5e Rosen Penev        2026-07-22  324  		return irq;
c8295feb756f5e Rosen Penev        2026-07-22  325  
fbc4a8a85777e0 John Ogness        2014-12-09  326  	/* allocate private data */
d57801c45f53e3 Alexandru Ardelean 2020-11-19  327  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
fbc4a8a85777e0 John Ogness        2014-12-09  328  	if (!priv)
fbc4a8a85777e0 John Ogness        2014-12-09  329  		return -ENOMEM;
fbc4a8a85777e0 John Ogness        2014-12-09  330  	priv->dev = &pdev->dev;
fbc4a8a85777e0 John Ogness        2014-12-09  331  	priv->lbc = fsl_lbc_ctrl_dev->regs;
fbc4a8a85777e0 John Ogness        2014-12-09  332  
fbc4a8a85777e0 John Ogness        2014-12-09  333  	/* get device tree data */
c8295feb756f5e Rosen Penev        2026-07-22  334  	ret = get_of_data(priv, node, res, &reg_br_new, &reg_or_new,
c8295feb756f5e Rosen Penev        2026-07-22  335  			  &uio_name);
fbc4a8a85777e0 John Ogness        2014-12-09  336  	if (ret)
d57801c45f53e3 Alexandru Ardelean 2020-11-19  337  		return ret;
fbc4a8a85777e0 John Ogness        2014-12-09  338  
fbc4a8a85777e0 John Ogness        2014-12-09  339  	/* allocate UIO structure */
d57801c45f53e3 Alexandru Ardelean 2020-11-19  340  	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
d57801c45f53e3 Alexandru Ardelean 2020-11-19  341  	if (!info)
d57801c45f53e3 Alexandru Ardelean 2020-11-19  342  		return -ENOMEM;
fbc4a8a85777e0 John Ogness        2014-12-09  343  
fbc4a8a85777e0 John Ogness        2014-12-09  344  	/* get current BR/OR values */
fbc4a8a85777e0 John Ogness        2014-12-09  345  	reg_br_cur = in_be32(&priv->lbc->bank[priv->bank].br);
fbc4a8a85777e0 John Ogness        2014-12-09  346  	reg_or_cur = in_be32(&priv->lbc->bank[priv->bank].or);
fbc4a8a85777e0 John Ogness        2014-12-09  347  
fbc4a8a85777e0 John Ogness        2014-12-09  348  	/* if bank already configured, make sure it matches */
fbc4a8a85777e0 John Ogness        2014-12-09  349  	if ((reg_br_cur & BR_V)) {
fbc4a8a85777e0 John Ogness        2014-12-09  350  		if ((reg_br_cur & BR_MSEL) != BR_MS_GPCM ||
fbc4a8a85777e0 John Ogness        2014-12-09  351  		    (reg_br_cur & reg_or_cur & BR_BA)
c8295feb756f5e Rosen Penev        2026-07-22  352  		     != fsl_lbc_addr(res->start)) {
fbc4a8a85777e0 John Ogness        2014-12-09  353  			dev_err(priv->dev,
fbc4a8a85777e0 John Ogness        2014-12-09  354  				"bank in use by another peripheral\n");
d57801c45f53e3 Alexandru Ardelean 2020-11-19  355  			return -ENODEV;
fbc4a8a85777e0 John Ogness        2014-12-09  356  		}
fbc4a8a85777e0 John Ogness        2014-12-09  357  
fbc4a8a85777e0 John Ogness        2014-12-09  358  		/* warn if behavior settings changing */
fbc4a8a85777e0 John Ogness        2014-12-09  359  		if ((reg_br_cur & ~(BR_BA | BR_V)) !=
fbc4a8a85777e0 John Ogness        2014-12-09  360  		    (reg_br_new & ~(BR_BA | BR_V))) {
fbc4a8a85777e0 John Ogness        2014-12-09  361  			dev_warn(priv->dev,
fbc4a8a85777e0 John Ogness        2014-12-09  362  				 "modifying BR settings: 0x%08x -> 0x%08x",
fbc4a8a85777e0 John Ogness        2014-12-09  363  				 reg_br_cur, reg_br_new);
fbc4a8a85777e0 John Ogness        2014-12-09  364  		}
fbc4a8a85777e0 John Ogness        2014-12-09  365  		if ((reg_or_cur & ~OR_GPCM_AM) != (reg_or_new & ~OR_GPCM_AM)) {
fbc4a8a85777e0 John Ogness        2014-12-09  366  			dev_warn(priv->dev,
fbc4a8a85777e0 John Ogness        2014-12-09  367  				 "modifying OR settings: 0x%08x -> 0x%08x",
fbc4a8a85777e0 John Ogness        2014-12-09  368  				 reg_or_cur, reg_or_new);
fbc4a8a85777e0 John Ogness        2014-12-09  369  		}
fbc4a8a85777e0 John Ogness        2014-12-09  370  	}
fbc4a8a85777e0 John Ogness        2014-12-09  371  
fbc4a8a85777e0 John Ogness        2014-12-09  372  	/* configure the bank (force base address and GPCM) */
fbc4a8a85777e0 John Ogness        2014-12-09  373  	reg_br_new &= ~(BR_BA | BR_MSEL);
c8295feb756f5e Rosen Penev        2026-07-22  374  	reg_br_new |= fsl_lbc_addr(res->start) | BR_MS_GPCM | BR_V;
fbc4a8a85777e0 John Ogness        2014-12-09  375  	out_be32(&priv->lbc->bank[priv->bank].or, reg_or_new);
fbc4a8a85777e0 John Ogness        2014-12-09  376  	out_be32(&priv->lbc->bank[priv->bank].br, reg_br_new);
fbc4a8a85777e0 John Ogness        2014-12-09  377  
fbc4a8a85777e0 John Ogness        2014-12-09  378  	/* set all UIO data */
d57801c45f53e3 Alexandru Ardelean 2020-11-19  379  	info->mem[0].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn", node);
c8295feb756f5e Rosen Penev        2026-07-22  380  	if (!info->mem[0].name)
c8295feb756f5e Rosen Penev        2026-07-22  381  		return -ENODEV;
d48fb15e6ad142 Li Qiang           2025-10-15  382  
c8295feb756f5e Rosen Penev        2026-07-22  383  	info->mem[0].internal_addr = base;
c8295feb756f5e Rosen Penev        2026-07-22  384  	info->mem[0].addr = res->start;
c8295feb756f5e Rosen Penev        2026-07-22  385  	info->mem[0].size = resource_size(res);
fbc4a8a85777e0 John Ogness        2014-12-09  386  	info->mem[0].memtype = UIO_MEM_PHYS;
fbc4a8a85777e0 John Ogness        2014-12-09  387  	info->priv = priv;
fbc4a8a85777e0 John Ogness        2014-12-09  388  	info->name = uio_name;
fbc4a8a85777e0 John Ogness        2014-12-09  389  	info->version = "0.0.1";
e48031603ae644 Christophe Leroy   2022-10-06  390  	if (irq) {
fbc4a8a85777e0 John Ogness        2014-12-09  391  		if (priv->irq_handler) {
fbc4a8a85777e0 John Ogness        2014-12-09  392  			info->irq = irq;
fbc4a8a85777e0 John Ogness        2014-12-09  393  			info->irq_flags = IRQF_SHARED;
fbc4a8a85777e0 John Ogness        2014-12-09  394  			info->handler = priv->irq_handler;
fbc4a8a85777e0 John Ogness        2014-12-09  395  		} else {
e48031603ae644 Christophe Leroy   2022-10-06  396  			irq = 0;
fbc4a8a85777e0 John Ogness        2014-12-09  397  			dev_warn(priv->dev, "ignoring irq, no handler\n");
fbc4a8a85777e0 John Ogness        2014-12-09  398  		}
fbc4a8a85777e0 John Ogness        2014-12-09  399  	}
fbc4a8a85777e0 John Ogness        2014-12-09  400  
fbc4a8a85777e0 John Ogness        2014-12-09  401  	if (priv->init)
fbc4a8a85777e0 John Ogness        2014-12-09  402  		priv->init(info);
fbc4a8a85777e0 John Ogness        2014-12-09  403  
fbc4a8a85777e0 John Ogness        2014-12-09  404  	/* register UIO device */
fbc4a8a85777e0 John Ogness        2014-12-09  405  	if (uio_register_device(priv->dev, info) != 0) {
fbc4a8a85777e0 John Ogness        2014-12-09  406  		dev_err(priv->dev, "UIO registration failed\n");
fbc4a8a85777e0 John Ogness        2014-12-09  407  		ret = -ENODEV;
fbc4a8a85777e0 John Ogness        2014-12-09  408  		goto out_err2;
fbc4a8a85777e0 John Ogness        2014-12-09  409  	}
fbc4a8a85777e0 John Ogness        2014-12-09  410  
fbc4a8a85777e0 John Ogness        2014-12-09  411  	/* store private data */
fbc4a8a85777e0 John Ogness        2014-12-09  412  	platform_set_drvdata(pdev, info);
fbc4a8a85777e0 John Ogness        2014-12-09  413  
fbc4a8a85777e0 John Ogness        2014-12-09  414  	dev_info(priv->dev,
fbc4a8a85777e0 John Ogness        2014-12-09  415  		 "eLBC/GPCM device (%s) at 0x%llx, bank %d, irq=%d\n",
c8295feb756f5e Rosen Penev        2026-07-22  416  		 priv->name, (unsigned long long)res->start, priv->bank,
e48031603ae644 Christophe Leroy   2022-10-06  417  		 irq ? : -1);
fbc4a8a85777e0 John Ogness        2014-12-09  418  
fbc4a8a85777e0 John Ogness        2014-12-09  419  	return 0;
fbc4a8a85777e0 John Ogness        2014-12-09  420  out_err2:
fbc4a8a85777e0 John Ogness        2014-12-09  421  	if (priv->shutdown)
fbc4a8a85777e0 John Ogness        2014-12-09  422  		priv->shutdown(info, true);
fbc4a8a85777e0 John Ogness        2014-12-09  423  	return ret;
fbc4a8a85777e0 John Ogness        2014-12-09  424  }
fbc4a8a85777e0 John Ogness        2014-12-09  425  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
