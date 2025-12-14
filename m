Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A789E28507B
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765697880; cv=none; b=sQ51JiVwBcqXIRz9M0XmKaOtbS6HC0husfW+OKmWl3KdTiKdOZRUoC0tHZdPT75y+PMkrwQv8R4CgwYHbQ+i0Xk9ED58K8Z2hLTyXdUeVJRuE84wBp+VcZWy+nwg4kgxsPJFYQ1LnwZuptsAcxYxvyDCHkvkeIOJY+ez2D/cTKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765697880; c=relaxed/simple;
	bh=aImDGwbG9dwC3y56WDeWUi4Lns7QGeTzFyTi50rhHJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ELJytb/bwrwplEEorHWkrDuswcJ0vUVTultASt2hSpKwwr/lPhbL3YhGLOoJzM/Isb3++OFliKzVtOkOpXLwjt1wQkGvCUnQApEDy42mwdTyHv8x29G5ZULvgWcgLUMcVYF03OiGCi+JnungnZdx7Q+sLHGjpuUFxquKfawL+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MsN4YzO2; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MsN4YzO2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765697878; x=1797233878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aImDGwbG9dwC3y56WDeWUi4Lns7QGeTzFyTi50rhHJQ=;
  b=MsN4YzO2NqrgdDOFB8IxkMM3JjqrzsbUI5TBdv3bLlAR0ycUfY/tHmca
   BVNBUWzPWtcIrjVGPVbOgGTG/bOjJmFkSjYuWZeIFoxzq1ElULxHqbBKs
   V/jQlolwXsHgyTEpewpVOR7IV8aNWZlfvuVEUVpOiQn7K50qXMM5eRxJI
   JDloc++6TDRIPBsEHin+qGnwtMeP1JSvBlNVWaEQC5Gf6GJNRyC4weCCS
   4DSfSvXUaRrMXMCgFp1p5L6dDT1fCQmn37yWqG1a/NsbW6bUFbHYPEsYS
   ImcJFnR8fbebdjKDqpudNSFeiB00qCRgJeCF/fhv1VmUVi+lR8PNlZPtS
   Q==;
X-CSE-ConnectionGUID: i9TKcQp1Qnqxajpi+TkwlQ==
X-CSE-MsgGUID: S3zZhxawTzOho1LcorSlUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71263574"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="71263574"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 23:37:57 -0800
X-CSE-ConnectionGUID: 6XW9o9/mQ06ddv7JaVC3Rw==
X-CSE-MsgGUID: 4fNYDAsKTJu1/K31y1TRdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="197963362"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2025 23:37:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUgfx-000000008pP-3I1M;
	Sun, 14 Dec 2025 07:37:53 +0000
Date: Sun, 14 Dec 2025 15:37:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/riscv/iommu-platform.c:54 riscv_iommu_platform_probe()
 warn: 'iommu->irqs_count' unsigned <= 0
Message-ID: <202512141551.kZLTle5r-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Tomasz Jeznach <tjeznach@rivosinc.com>
CC: Joerg Roedel <jroedel@suse.de>
CC: Nick Kossifidis <mick@ics.forth.gr>
CC: Sebastien Boeuf <seb@rivosinc.com>
CC: Lu Baolu <baolu.lu@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 5c0ebbd3c6c6e00af112fe053e81ac0c7cafe647 iommu/riscv: Add RISC-V IOMMU platform device driver
date:   1 year, 2 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 1 year, 2 months ago
config: riscv-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251214/202512141551.kZLTle5r-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141551.kZLTle5r-lkp@intel.com/

smatch warnings:
drivers/iommu/riscv/iommu-platform.c:54 riscv_iommu_platform_probe() warn: 'iommu->irqs_count' unsigned <= 0

vim +54 drivers/iommu/riscv/iommu-platform.c

5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  19  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  20  static int riscv_iommu_platform_probe(struct platform_device *pdev)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  21  {
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  22  	struct device *dev = &pdev->dev;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  23  	struct riscv_iommu_device *iommu = NULL;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  24  	struct resource *res = NULL;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  25  	int vec;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  26  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  27  	iommu = devm_kzalloc(dev, sizeof(*iommu), GFP_KERNEL);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  28  	if (!iommu)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  29  		return -ENOMEM;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  30  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  31  	iommu->dev = dev;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  32  	iommu->reg = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  33  	if (IS_ERR(iommu->reg))
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  34  		return dev_err_probe(dev, PTR_ERR(iommu->reg),
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  35  				     "could not map register region\n");
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  36  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  37  	dev_set_drvdata(dev, iommu);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  38  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  39  	/* Check device reported capabilities / features. */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  40  	iommu->caps = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_CAPABILITIES);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  41  	iommu->fctl = riscv_iommu_readl(iommu, RISCV_IOMMU_REG_FCTL);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  42  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  43  	/* For now we only support WSI */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  44  	switch (FIELD_GET(RISCV_IOMMU_CAPABILITIES_IGS, iommu->caps)) {
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  45  	case RISCV_IOMMU_CAPABILITIES_IGS_WSI:
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  46  	case RISCV_IOMMU_CAPABILITIES_IGS_BOTH:
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  47  		break;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  48  	default:
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  49  		return dev_err_probe(dev, -ENODEV,
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  50  				     "unable to use wire-signaled interrupts\n");
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  51  	}
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  52  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  53  	iommu->irqs_count = platform_irq_count(pdev);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15 @54  	if (iommu->irqs_count <= 0)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  55  		return dev_err_probe(dev, -ENODEV,
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  56  				     "no IRQ resources provided\n");
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  57  	if (iommu->irqs_count > RISCV_IOMMU_INTR_COUNT)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  58  		iommu->irqs_count = RISCV_IOMMU_INTR_COUNT;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  59  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  60  	for (vec = 0; vec < iommu->irqs_count; vec++)
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  61  		iommu->irqs[vec] = platform_get_irq(pdev, vec);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  62  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  63  	/* Enable wire-signaled interrupts, fctl.WSI */
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  64  	if (!(iommu->fctl & RISCV_IOMMU_FCTL_WSI)) {
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  65  		iommu->fctl |= RISCV_IOMMU_FCTL_WSI;
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  66  		riscv_iommu_writel(iommu, RISCV_IOMMU_REG_FCTL, iommu->fctl);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  67  	}
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  68  
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  69  	return riscv_iommu_init(iommu);
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  70  };
5c0ebbd3c6c6e0 Tomasz Jeznach 2024-10-15  71  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
