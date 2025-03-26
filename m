Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0496C1392
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Mar 2025 00:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743033631; cv=none; b=L7hkspfgORMHqVEZtNlBg6u+EX/pfnMhds/T7BndMy4NGr+1ZMdRWnef8Ti6xmialKMNAYDrF9GrQNy50K4amFx4ByyhSNtgdy9q1PYrqh99z/SsDfrOmsjnSiCvH7V3Kitrcy7iMZNTuo52R71h3kjlaITsfmhcTN/uNXZUljc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743033631; c=relaxed/simple;
	bh=zJd1LnHH+4+wjErjAj6KShyRxVbPHh18sXUJpu0jllc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ME1PO3BrdiyCYF0kSyzeMD1UHBOIaWmj48acW115KMeLC1a2F7vW5zsoIcntiZRrYKkEFWhFaWtHEFj7lzDuaMlJiqf3iVOpvTf30+fzQNDUJXhMT+teyXdHFrTcqH5RrjJU7C5igm5TfU5pRkfXaSIQFy9H5IZkcMdznuIWkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUL9kQ73; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUL9kQ73"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743033629; x=1774569629;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zJd1LnHH+4+wjErjAj6KShyRxVbPHh18sXUJpu0jllc=;
  b=nUL9kQ73GIAahzgEb0LZ7jlTHIf1fRp7F3Pyw51QBaODPK3hxG6YxfN8
   qF1N34ScTBGcmMayOqgEoHz2oXEq7mGAHydpEmKyY+XcPlOiorZ64FZ1b
   d3L5Dxh+lOU78MabZ1ldjJ6Qp4ESL4kpEfIFTPnzHYIJQja5L/5t/gaEp
   41mMrsdkKWB3H+tbUEujXQIThwUfEZ9ulZ+dK8lelRDq8TSkbnRCE7f7d
   BJ0EtwrdJoFDdUY04IssihJkDtqCEn82jpM5R+h42pj7eyvZ4HUJeeC6R
   OHRtTjeRTGxG0LI+wWoqN21WFUaep+JSgPau/Yx4Lb+rzDZw/BkzA5IWZ
   Q==;
X-CSE-ConnectionGUID: oa9p5nwUTtaMdwJ3x7Gn1Q==
X-CSE-MsgGUID: G7xl5PDbTQmltmo7l4zrog==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="55711925"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="55711925"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 17:00:28 -0700
X-CSE-ConnectionGUID: CyrbYwGLRvuMq8Aw4NBYYg==
X-CSE-MsgGUID: 6AgNxyDpRrOyLQoYeu4K0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; 
   d="scan'208";a="125407661"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Mar 2025 17:00:27 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txafZ-0006Ch-0Q;
	Thu, 27 Mar 2025 00:00:25 +0000
Date: Thu, 27 Mar 2025 07:59:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/iommu/riscv/iommu-platform.c:54 riscv_iommu_platform_probe()
 warn: 'iommu->irqs_count' unsigned <= 0
Message-ID: <202503270710.nzXdpHfG-lkp@intel.com>
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
head:   f6e0150b2003fb2b9265028a618aa1732b3edc8f
commit: 5c0ebbd3c6c6e00af112fe053e81ac0c7cafe647 iommu/riscv: Add RISC-V IOMMU platform device driver
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: riscv-randconfig-r072-20250327 (https://download.01.org/0day-ci/archive/20250327/202503270710.nzXdpHfG-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503270710.nzXdpHfG-lkp@intel.com/

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
