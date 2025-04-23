Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF86E28A1F7
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Apr 2025 19:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745437243; cv=none; b=Exc5bN9tKoEpGeeWWs+O2IS5d+Rkcbjj6b56A0vCDTt/E9hA/vmoAQZObPssMKbAkN5CmQv46F2ciBVR3BhspD2R/BTLqSE/76uEria07Nt5tvpP7e2PcOZ2oqpcLZqTyTpYm7FUEKgECgvcjtZ1qpFAnqgdfyDYtnboS6J4Kzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745437243; c=relaxed/simple;
	bh=oIeQQ2eQyhlA1W9/WSH2Ul2HeG/yw3oZydT4+R0OE8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G6gs01srmROtgzzSGrNxW7raZwaHfark1g0hCG139I6nwtHtSnrJF9L5AUpnUeYGIjRELZgJpCYggoQKSu2LQRiKO2MMXAXgi1GWdJpsgxZovJghgKjZRN6vQVt5osJvoaoRkTSCtSFswBPhXRsFto7uDfbzfxjK25rVAxosKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JXqafdH6; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JXqafdH6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745437242; x=1776973242;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=oIeQQ2eQyhlA1W9/WSH2Ul2HeG/yw3oZydT4+R0OE8A=;
  b=JXqafdH6EizkCnAzbqa7DK711zq+JUXwAut+tiL4o/sl6MIFvn8j+m6P
   DPfTA3QFrMVEbPTqs4GD1Hsf43ixTScbpHyhWwa0zJyMl4Wsu4CT9xzKr
   VUfLWOHDy5XnGf+HQKMD8oenbqC4fNZvkJagO2c1YZjbX1vtQDOQXGejk
   OQJiDyPfvtNAqeidmHg7I31XHRrt5MAEgh4+iulYxoixQ+aiCCKC0GVnJ
   gaDPGGyyNItMkHNOET085Y1Ef+axcOIBlWZnvBDVS57Cn/soJLrjaXumq
   s288SicXNC4AGsuDkwKDztqAElmYGx8kJiFRewe4XwJ31IPBBLDZdtV9F
   Q==;
X-CSE-ConnectionGUID: qQn7bXdsRL6rSjNvcy/oqg==
X-CSE-MsgGUID: mEb5zjD2SliFRc5QiI2p6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46167260"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46167260"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 12:40:41 -0700
X-CSE-ConnectionGUID: 9krUrIkIQQ+b/wJh5hazCg==
X-CSE-MsgGUID: U6d0+C2oQZuk5fIEdz1rjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="137202672"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Apr 2025 12:40:40 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7fxW-0003a3-09;
	Wed, 23 Apr 2025 19:40:38 +0000
Date: Thu, 24 Apr 2025 03:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/irqchip/irq-bcm2712-mip.c:247:2-8: ERROR: missing
 put_device; call of_find_device_by_node on line 240, but without a
 corresponding object release within this function.
Message-ID: <202504240351.XLgquTGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Stanimir Varbanov <svarbanov@suse.de>
CC: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a79be02bba5c31f967885c7f3bf3a756d77d11d9
commit: 32c6c054661a9b454837e3df409e9bd8fe9ba5f9 irqchip: Add Broadcom BCM2712 MSI-X interrupt controller
date:   8 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 weeks ago
config: arm64-randconfig-r054-20250423 (https://download.01.org/0day-ci/archive/20250424/202504240351.XLgquTGb-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504240351.XLgquTGb-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-bcm2712-mip.c:247:2-8: ERROR: missing put_device; call of_find_device_by_node on line 240, but without a corresponding object release within this function.

vim +247 drivers/irqchip/irq-bcm2712-mip.c

32c6c054661a9b Stanimir Varbanov 2025-02-24  233  
32c6c054661a9b Stanimir Varbanov 2025-02-24  234  static int __init mip_of_msi_init(struct device_node *node, struct device_node *parent)
32c6c054661a9b Stanimir Varbanov 2025-02-24  235  {
32c6c054661a9b Stanimir Varbanov 2025-02-24  236  	struct platform_device *pdev;
32c6c054661a9b Stanimir Varbanov 2025-02-24  237  	struct mip_priv *mip;
32c6c054661a9b Stanimir Varbanov 2025-02-24  238  	int ret;
32c6c054661a9b Stanimir Varbanov 2025-02-24  239  
32c6c054661a9b Stanimir Varbanov 2025-02-24 @240  	pdev = of_find_device_by_node(node);
32c6c054661a9b Stanimir Varbanov 2025-02-24  241  	of_node_put(node);
32c6c054661a9b Stanimir Varbanov 2025-02-24  242  	if (!pdev)
32c6c054661a9b Stanimir Varbanov 2025-02-24  243  		return -EPROBE_DEFER;
32c6c054661a9b Stanimir Varbanov 2025-02-24  244  
32c6c054661a9b Stanimir Varbanov 2025-02-24  245  	mip = kzalloc(sizeof(*mip), GFP_KERNEL);
32c6c054661a9b Stanimir Varbanov 2025-02-24  246  	if (!mip)
32c6c054661a9b Stanimir Varbanov 2025-02-24 @247  		return -ENOMEM;
32c6c054661a9b Stanimir Varbanov 2025-02-24  248  
32c6c054661a9b Stanimir Varbanov 2025-02-24  249  	spin_lock_init(&mip->lock);
32c6c054661a9b Stanimir Varbanov 2025-02-24  250  	mip->dev = &pdev->dev;
32c6c054661a9b Stanimir Varbanov 2025-02-24  251  
32c6c054661a9b Stanimir Varbanov 2025-02-24  252  	ret = mip_parse_dt(mip, node);
32c6c054661a9b Stanimir Varbanov 2025-02-24  253  	if (ret)
32c6c054661a9b Stanimir Varbanov 2025-02-24  254  		goto err_priv;
32c6c054661a9b Stanimir Varbanov 2025-02-24  255  
32c6c054661a9b Stanimir Varbanov 2025-02-24  256  	mip->base = of_iomap(node, 0);
32c6c054661a9b Stanimir Varbanov 2025-02-24  257  	if (!mip->base) {
32c6c054661a9b Stanimir Varbanov 2025-02-24  258  		ret = -ENXIO;
32c6c054661a9b Stanimir Varbanov 2025-02-24  259  		goto err_priv;
32c6c054661a9b Stanimir Varbanov 2025-02-24  260  	}
32c6c054661a9b Stanimir Varbanov 2025-02-24  261  
32c6c054661a9b Stanimir Varbanov 2025-02-24  262  	mip->bitmap = bitmap_zalloc(mip->num_msis, GFP_KERNEL);
32c6c054661a9b Stanimir Varbanov 2025-02-24  263  	if (!mip->bitmap) {
32c6c054661a9b Stanimir Varbanov 2025-02-24  264  		ret = -ENOMEM;
32c6c054661a9b Stanimir Varbanov 2025-02-24  265  		goto err_base;
32c6c054661a9b Stanimir Varbanov 2025-02-24  266  	}
32c6c054661a9b Stanimir Varbanov 2025-02-24  267  
32c6c054661a9b Stanimir Varbanov 2025-02-24  268  	ret = mip_init_domains(mip, node);
32c6c054661a9b Stanimir Varbanov 2025-02-24  269  	if (ret)
32c6c054661a9b Stanimir Varbanov 2025-02-24  270  		goto err_map;
32c6c054661a9b Stanimir Varbanov 2025-02-24  271  
32c6c054661a9b Stanimir Varbanov 2025-02-24  272  	dev_dbg(&pdev->dev, "MIP: MSI-X count: %u, base: %u, offset: %u, msg_addr: %llx\n",
32c6c054661a9b Stanimir Varbanov 2025-02-24  273  		mip->num_msis, mip->msi_base, mip->msi_offset, mip->msg_addr);
32c6c054661a9b Stanimir Varbanov 2025-02-24  274  
32c6c054661a9b Stanimir Varbanov 2025-02-24  275  	return 0;
32c6c054661a9b Stanimir Varbanov 2025-02-24  276  
32c6c054661a9b Stanimir Varbanov 2025-02-24  277  err_map:
32c6c054661a9b Stanimir Varbanov 2025-02-24  278  	bitmap_free(mip->bitmap);
32c6c054661a9b Stanimir Varbanov 2025-02-24  279  err_base:
32c6c054661a9b Stanimir Varbanov 2025-02-24  280  	iounmap(mip->base);
32c6c054661a9b Stanimir Varbanov 2025-02-24  281  err_priv:
32c6c054661a9b Stanimir Varbanov 2025-02-24  282  	kfree(mip);
32c6c054661a9b Stanimir Varbanov 2025-02-24  283  	return ret;
32c6c054661a9b Stanimir Varbanov 2025-02-24  284  }
32c6c054661a9b Stanimir Varbanov 2025-02-24  285  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
