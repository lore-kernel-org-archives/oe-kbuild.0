Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021A13659FD
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Aug 2026 11:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785584397; cv=none; b=UwSv29BNZJ+CIOOwwgEOWRGAxOwvRQb0XxsUKEP9derFa4JiqT2fwMUg2fdrm4BPtN8m3QGYo5hwsixsfdtKhoTjCwUQ2+i4A25JOYZceqKCww+KRnMAgoHgjBBPRZkqwZCcw9GaoffLSg9bhFvTBJXt4xhUdU3s9rsWhhktRi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785584397; c=relaxed/simple;
	bh=jZD4s3j5udO9xQ/sIIk3iipriwshRzj2T8DYaCGPx4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UfPIJ81naA2Lmk3FSGD6YtlJ3DMiVs3hcbbpgbFLuUeJx1vBxy0M186fm+L2IEo7YW7u6zcPlbiY3D/xDRXTFVl1WH82rO+wbRzhwppKEAefTiVnANO1TmxSodTg2KKUUp80Nr9uzKUajaLR7M+N/KKP5SIZ+KOTvKkFMXSOAHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RXUzpc0/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RXUzpc0/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785584394; x=1817120394;
  h=date:from:to:cc:subject:message-id;
  bh=jZD4s3j5udO9xQ/sIIk3iipriwshRzj2T8DYaCGPx4c=;
  b=RXUzpc0/3MFOtvU2pVN9uMFfTyTalXfzPN0rXpkf6R/yNz8Zm3yz+hGx
   tLndmLtzQmAQRT6mVvuBLnwpXoZ/YpH/ve6pwbE0jLz0R57QOb+yktAHx
   UEMHo8v6nuz405AfIwk0b5Iv3FFc3D+sLQBigtOkda8bxb0R6AEMa4q/i
   rEoVK8vqvWj5JVt1x3wVY/NCpY73ViQ4GQBpZkWf6opl08SktH3vDk0Au
   Nz5zGltA8YbXLIkYoE0L8aRnluaB1ZozWwoAI3tXUT58GmPhVFBb8Y10j
   Dv4ci6MKV3s6i6dAa/dir8QX53XzIePCoekMDu8gSg2dxp4nfzswORoBV
   Q==;
X-CSE-ConnectionGUID: glcI2At8S+mTVxFc8na42A==
X-CSE-MsgGUID: sPoCb7iDTfeNqudEGONffw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="90084248"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="90084248"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 04:39:53 -0700
X-CSE-ConnectionGUID: lHHwCbc6SU+GZWhzStbHbg==
X-CSE-MsgGUID: nZIEhq4KTT6cadRK4e0eJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="284164680"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Aug 2026 04:39:52 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wq84E-000000003FZ-016f;
	Sat, 01 Aug 2026 11:39:50 +0000
Date: Sat, 01 Aug 2026 19:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [char-misc:char-misc-testing 56/61]
 drivers/uio/uio_fsl_elbc_gpcm.c:323:19: sparse: sparse: unsigned value that
 used to be signed checked against zero?
Message-ID: <202608011915.yZ4ITuSe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/uio/uio_fsl_elbc_gpcm.c:323:19: sparse: sparse: unsigned value that used to be signed checked against zero?"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Rosen Penev <rosenp@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

Hi Rosen,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git char-misc-testing
head:   220190f97da558e67cd01c62f1b84fe77b267a5a
commit: c8295feb756f5e3ccf02c14a90a2ee0aed95e409 [56/61] uio: fsl_elbc_gpcm: use platform helpers for resource and IRQ
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: powerpc-randconfig-r111-20260801 (https://download.01.org/0day-ci/archive/20260801/202608011915.yZ4ITuSe-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260801/202608011915.yZ4ITuSe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608011915.yZ4ITuSe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/uio/uio_fsl_elbc_gpcm.c:85:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsl_lbc_bank *bank @@     got struct fsl_lbc_bank [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:85:53: sparse:     expected struct fsl_lbc_bank *bank
   drivers/uio/uio_fsl_elbc_gpcm.c:85:53: sparse:     got struct fsl_lbc_bank [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:89:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:89:43: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:89:43: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:93:43: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:93:43: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:93:43: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:104:53: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct fsl_lbc_bank *bank @@     got struct fsl_lbc_bank [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:104:53: sparse:     expected struct fsl_lbc_bank *bank
   drivers/uio/uio_fsl_elbc_gpcm.c:104:53: sparse:     got struct fsl_lbc_bank [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:116:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:116:31: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:116:31: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:117:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:117:31: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:117:31: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:131:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:131:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:131:27: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:139:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:139:27: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:139:27: sparse:     got restricted __be32 *
   drivers/uio/uio_fsl_elbc_gpcm.c:345:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:345:46: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:345:46: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:346:46: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int const volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:346:46: sparse:     expected unsigned int const volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:346:46: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:375:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:375:34: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:375:34: sparse:     got restricted __be32 [noderef] __iomem *
   drivers/uio/uio_fsl_elbc_gpcm.c:376:34: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int volatile [noderef] [usertype] __iomem *addr @@     got restricted __be32 [noderef] __iomem * @@
   drivers/uio/uio_fsl_elbc_gpcm.c:376:34: sparse:     expected unsigned int volatile [noderef] [usertype] __iomem *addr
   drivers/uio/uio_fsl_elbc_gpcm.c:376:34: sparse:     got restricted __be32 [noderef] __iomem *
>> drivers/uio/uio_fsl_elbc_gpcm.c:323:19: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/uio/uio_fsl_elbc_gpcm.c:322:31: sparse: signed value source

vim +323 drivers/uio/uio_fsl_elbc_gpcm.c

fbc4a8a85777e06 John Ogness        2014-12-09  297  
fbc4a8a85777e06 John Ogness        2014-12-09  298  static int uio_fsl_elbc_gpcm_probe(struct platform_device *pdev)
fbc4a8a85777e06 John Ogness        2014-12-09  299  {
fbc4a8a85777e06 John Ogness        2014-12-09  300  	struct device_node *node = pdev->dev.of_node;
fbc4a8a85777e06 John Ogness        2014-12-09  301  	struct fsl_elbc_gpcm *priv;
fbc4a8a85777e06 John Ogness        2014-12-09  302  	struct uio_info *info;
fbc4a8a85777e06 John Ogness        2014-12-09  303  	char *uio_name = NULL;
c8295feb756f5e3 Rosen Penev        2026-07-22  304  	struct resource *res;
c8295feb756f5e3 Rosen Penev        2026-07-22  305  	void __iomem *base;
fbc4a8a85777e06 John Ogness        2014-12-09  306  	unsigned int irq;
fbc4a8a85777e06 John Ogness        2014-12-09  307  	u32 reg_br_cur;
fbc4a8a85777e06 John Ogness        2014-12-09  308  	u32 reg_or_cur;
fbc4a8a85777e06 John Ogness        2014-12-09  309  	u32 reg_br_new;
fbc4a8a85777e06 John Ogness        2014-12-09  310  	u32 reg_or_new;
fbc4a8a85777e06 John Ogness        2014-12-09  311  	int ret;
fbc4a8a85777e06 John Ogness        2014-12-09  312  
fbc4a8a85777e06 John Ogness        2014-12-09  313  	if (!fsl_lbc_ctrl_dev || !fsl_lbc_ctrl_dev->regs)
fbc4a8a85777e06 John Ogness        2014-12-09  314  		return -ENODEV;
fbc4a8a85777e06 John Ogness        2014-12-09  315  
c8295feb756f5e3 Rosen Penev        2026-07-22  316  	/* map the memory resource */
c8295feb756f5e3 Rosen Penev        2026-07-22  317  	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
c8295feb756f5e3 Rosen Penev        2026-07-22  318  	if (IS_ERR(base))
c8295feb756f5e3 Rosen Penev        2026-07-22  319  		return PTR_ERR(base);
c8295feb756f5e3 Rosen Penev        2026-07-22  320  
c8295feb756f5e3 Rosen Penev        2026-07-22  321  	/* get optional irq value */
c8295feb756f5e3 Rosen Penev        2026-07-22  322  	irq = platform_get_irq(pdev, 0);
c8295feb756f5e3 Rosen Penev        2026-07-22 @323  	if (irq < 0)
c8295feb756f5e3 Rosen Penev        2026-07-22  324  		return irq;
c8295feb756f5e3 Rosen Penev        2026-07-22  325  
fbc4a8a85777e06 John Ogness        2014-12-09  326  	/* allocate private data */
d57801c45f53e3d Alexandru Ardelean 2020-11-19  327  	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
fbc4a8a85777e06 John Ogness        2014-12-09  328  	if (!priv)
fbc4a8a85777e06 John Ogness        2014-12-09  329  		return -ENOMEM;
fbc4a8a85777e06 John Ogness        2014-12-09  330  	priv->dev = &pdev->dev;
fbc4a8a85777e06 John Ogness        2014-12-09  331  	priv->lbc = fsl_lbc_ctrl_dev->regs;
fbc4a8a85777e06 John Ogness        2014-12-09  332  
fbc4a8a85777e06 John Ogness        2014-12-09  333  	/* get device tree data */
c8295feb756f5e3 Rosen Penev        2026-07-22  334  	ret = get_of_data(priv, node, res, &reg_br_new, &reg_or_new,
c8295feb756f5e3 Rosen Penev        2026-07-22  335  			  &uio_name);
fbc4a8a85777e06 John Ogness        2014-12-09  336  	if (ret)
d57801c45f53e3d Alexandru Ardelean 2020-11-19  337  		return ret;
fbc4a8a85777e06 John Ogness        2014-12-09  338  
fbc4a8a85777e06 John Ogness        2014-12-09  339  	/* allocate UIO structure */
d57801c45f53e3d Alexandru Ardelean 2020-11-19  340  	info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
d57801c45f53e3d Alexandru Ardelean 2020-11-19  341  	if (!info)
d57801c45f53e3d Alexandru Ardelean 2020-11-19  342  		return -ENOMEM;
fbc4a8a85777e06 John Ogness        2014-12-09  343  
fbc4a8a85777e06 John Ogness        2014-12-09  344  	/* get current BR/OR values */
fbc4a8a85777e06 John Ogness        2014-12-09  345  	reg_br_cur = in_be32(&priv->lbc->bank[priv->bank].br);
fbc4a8a85777e06 John Ogness        2014-12-09 @346  	reg_or_cur = in_be32(&priv->lbc->bank[priv->bank].or);
fbc4a8a85777e06 John Ogness        2014-12-09  347  
fbc4a8a85777e06 John Ogness        2014-12-09  348  	/* if bank already configured, make sure it matches */
fbc4a8a85777e06 John Ogness        2014-12-09  349  	if ((reg_br_cur & BR_V)) {
fbc4a8a85777e06 John Ogness        2014-12-09  350  		if ((reg_br_cur & BR_MSEL) != BR_MS_GPCM ||
fbc4a8a85777e06 John Ogness        2014-12-09  351  		    (reg_br_cur & reg_or_cur & BR_BA)
c8295feb756f5e3 Rosen Penev        2026-07-22  352  		     != fsl_lbc_addr(res->start)) {
fbc4a8a85777e06 John Ogness        2014-12-09  353  			dev_err(priv->dev,
fbc4a8a85777e06 John Ogness        2014-12-09  354  				"bank in use by another peripheral\n");
d57801c45f53e3d Alexandru Ardelean 2020-11-19  355  			return -ENODEV;
fbc4a8a85777e06 John Ogness        2014-12-09  356  		}
fbc4a8a85777e06 John Ogness        2014-12-09  357  
fbc4a8a85777e06 John Ogness        2014-12-09  358  		/* warn if behavior settings changing */
fbc4a8a85777e06 John Ogness        2014-12-09  359  		if ((reg_br_cur & ~(BR_BA | BR_V)) !=
fbc4a8a85777e06 John Ogness        2014-12-09  360  		    (reg_br_new & ~(BR_BA | BR_V))) {
fbc4a8a85777e06 John Ogness        2014-12-09  361  			dev_warn(priv->dev,
fbc4a8a85777e06 John Ogness        2014-12-09  362  				 "modifying BR settings: 0x%08x -> 0x%08x",
fbc4a8a85777e06 John Ogness        2014-12-09  363  				 reg_br_cur, reg_br_new);
fbc4a8a85777e06 John Ogness        2014-12-09  364  		}
fbc4a8a85777e06 John Ogness        2014-12-09  365  		if ((reg_or_cur & ~OR_GPCM_AM) != (reg_or_new & ~OR_GPCM_AM)) {
fbc4a8a85777e06 John Ogness        2014-12-09  366  			dev_warn(priv->dev,
fbc4a8a85777e06 John Ogness        2014-12-09  367  				 "modifying OR settings: 0x%08x -> 0x%08x",
fbc4a8a85777e06 John Ogness        2014-12-09  368  				 reg_or_cur, reg_or_new);
fbc4a8a85777e06 John Ogness        2014-12-09  369  		}
fbc4a8a85777e06 John Ogness        2014-12-09  370  	}
fbc4a8a85777e06 John Ogness        2014-12-09  371  
fbc4a8a85777e06 John Ogness        2014-12-09  372  	/* configure the bank (force base address and GPCM) */
fbc4a8a85777e06 John Ogness        2014-12-09  373  	reg_br_new &= ~(BR_BA | BR_MSEL);
c8295feb756f5e3 Rosen Penev        2026-07-22  374  	reg_br_new |= fsl_lbc_addr(res->start) | BR_MS_GPCM | BR_V;
fbc4a8a85777e06 John Ogness        2014-12-09  375  	out_be32(&priv->lbc->bank[priv->bank].or, reg_or_new);
fbc4a8a85777e06 John Ogness        2014-12-09  376  	out_be32(&priv->lbc->bank[priv->bank].br, reg_br_new);
fbc4a8a85777e06 John Ogness        2014-12-09  377  
fbc4a8a85777e06 John Ogness        2014-12-09  378  	/* set all UIO data */
d57801c45f53e3d Alexandru Ardelean 2020-11-19  379  	info->mem[0].name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%pOFn", node);
c8295feb756f5e3 Rosen Penev        2026-07-22  380  	if (!info->mem[0].name)
c8295feb756f5e3 Rosen Penev        2026-07-22  381  		return -ENODEV;
d48fb15e6ad142e Li Qiang           2025-10-15  382  
c8295feb756f5e3 Rosen Penev        2026-07-22  383  	info->mem[0].internal_addr = base;
c8295feb756f5e3 Rosen Penev        2026-07-22  384  	info->mem[0].addr = res->start;
c8295feb756f5e3 Rosen Penev        2026-07-22  385  	info->mem[0].size = resource_size(res);
fbc4a8a85777e06 John Ogness        2014-12-09  386  	info->mem[0].memtype = UIO_MEM_PHYS;
fbc4a8a85777e06 John Ogness        2014-12-09  387  	info->priv = priv;
fbc4a8a85777e06 John Ogness        2014-12-09  388  	info->name = uio_name;
fbc4a8a85777e06 John Ogness        2014-12-09  389  	info->version = "0.0.1";
e48031603ae6440 Christophe Leroy   2022-10-06  390  	if (irq) {
fbc4a8a85777e06 John Ogness        2014-12-09  391  		if (priv->irq_handler) {
fbc4a8a85777e06 John Ogness        2014-12-09  392  			info->irq = irq;
fbc4a8a85777e06 John Ogness        2014-12-09  393  			info->irq_flags = IRQF_SHARED;
fbc4a8a85777e06 John Ogness        2014-12-09  394  			info->handler = priv->irq_handler;
fbc4a8a85777e06 John Ogness        2014-12-09  395  		} else {
e48031603ae6440 Christophe Leroy   2022-10-06  396  			irq = 0;
fbc4a8a85777e06 John Ogness        2014-12-09  397  			dev_warn(priv->dev, "ignoring irq, no handler\n");
fbc4a8a85777e06 John Ogness        2014-12-09  398  		}
fbc4a8a85777e06 John Ogness        2014-12-09  399  	}
fbc4a8a85777e06 John Ogness        2014-12-09  400  
fbc4a8a85777e06 John Ogness        2014-12-09  401  	if (priv->init)
fbc4a8a85777e06 John Ogness        2014-12-09  402  		priv->init(info);
fbc4a8a85777e06 John Ogness        2014-12-09  403  
fbc4a8a85777e06 John Ogness        2014-12-09  404  	/* register UIO device */
fbc4a8a85777e06 John Ogness        2014-12-09  405  	if (uio_register_device(priv->dev, info) != 0) {
fbc4a8a85777e06 John Ogness        2014-12-09  406  		dev_err(priv->dev, "UIO registration failed\n");
fbc4a8a85777e06 John Ogness        2014-12-09  407  		ret = -ENODEV;
fbc4a8a85777e06 John Ogness        2014-12-09  408  		goto out_err2;
fbc4a8a85777e06 John Ogness        2014-12-09  409  	}
fbc4a8a85777e06 John Ogness        2014-12-09  410  
fbc4a8a85777e06 John Ogness        2014-12-09  411  	/* store private data */
fbc4a8a85777e06 John Ogness        2014-12-09  412  	platform_set_drvdata(pdev, info);
fbc4a8a85777e06 John Ogness        2014-12-09  413  
fbc4a8a85777e06 John Ogness        2014-12-09  414  	dev_info(priv->dev,
fbc4a8a85777e06 John Ogness        2014-12-09  415  		 "eLBC/GPCM device (%s) at 0x%llx, bank %d, irq=%d\n",
c8295feb756f5e3 Rosen Penev        2026-07-22  416  		 priv->name, (unsigned long long)res->start, priv->bank,
e48031603ae6440 Christophe Leroy   2022-10-06  417  		 irq ? : -1);
fbc4a8a85777e06 John Ogness        2014-12-09  418  
fbc4a8a85777e06 John Ogness        2014-12-09  419  	return 0;
fbc4a8a85777e06 John Ogness        2014-12-09  420  out_err2:
fbc4a8a85777e06 John Ogness        2014-12-09  421  	if (priv->shutdown)
fbc4a8a85777e06 John Ogness        2014-12-09  422  		priv->shutdown(info, true);
fbc4a8a85777e06 John Ogness        2014-12-09  423  	return ret;
fbc4a8a85777e06 John Ogness        2014-12-09  424  }
fbc4a8a85777e06 John Ogness        2014-12-09  425  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
