Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FDF1A3160
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 02:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765679082; cv=none; b=X5jW5CKcaFwwvwAoFENQYYy7FueAO8QZorNVIfbKO4pJP3/FYCJA6RVs39+QkBfvmkccaAFqWu3TzSzH/ngM94nf7DKb4v/trKZAGmVT8He8gOcipp/coy0NzlRnI0bL0UmeeBO42x54KzhKTlKWYKT4DUjccwnTR3tsJCUnxaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765679082; c=relaxed/simple;
	bh=K04S2gH9ZkkwklJuFU4MMJ8fQW+nHdzWUmKCma6qB+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zdt6yNeiwCfPLBNz/AZEEq7ummRSBhjKqaib1SXx6COazJaUr7VdGDz/n738p56oon2hxfHknAhkYrjK6WLTICsWAk+UJ5YJ0KfbqKyhRGMBrK5Q2n3/5mz79qFz8ya87paCQHGnOMW01wi7Pdo2+mFXwcwrXKrPJntr5iCNuvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bEEN83Om; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bEEN83Om"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765679081; x=1797215081;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K04S2gH9ZkkwklJuFU4MMJ8fQW+nHdzWUmKCma6qB+k=;
  b=bEEN83Om95nkupcaBCxieIURhrvCb7Gyeth0kpUOO8PC+4q4WCJrEmSY
   0FPzsXa5iLhvrYggDwiNTlUfi90Velz4ePjF4wYRePcBw/hcURhntAMF2
   os0ycT803nVoY2QDhLa0Errl5Bt4hNg+0fMXPidZ9mJPz+zd7pn4dPyXf
   3Z6ejkWj7bYZgPirmt5lRkTishn3Zh3NgQ9LZNpishJfFZhMBNty0huUQ
   5lz+pdRW/C3dP2AqrTYHLqz8w9VYInb8xeLXRvJptGDjqNvXGyUK8sOZf
   S5rSIf0HjRnaJzXYv2a2030IG+WS3cus/AzTEpXrcFVqkaPGE1boB75wZ
   A==;
X-CSE-ConnectionGUID: KRPOBfBsRYesmUZyVa5ylw==
X-CSE-MsgGUID: jRAxlRarT5CWe+QP3+K5Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="93106932"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="93106932"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 18:24:40 -0800
X-CSE-ConnectionGUID: CC9+LVvBSmWjyHcNdexyqg==
X-CSE-MsgGUID: ypXYY9XaRay/eOrm1nTMcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="197925141"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Dec 2025 18:24:39 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUbmn-000000008TX-1xBA;
	Sun, 14 Dec 2025 02:24:37 +0000
Date: Sun, 14 Dec 2025 10:23:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/v3d/v3d_irq.c:288 v3d_irq_init() warn: missing
 unwind goto?
Message-ID: <202512141013.Pxfid88r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Maíra Canal" <mcanal@igalia.com>
CC: "Juan A. Suarez" <jasuarez@igalia.com>
CC: Iago Toral Quiroga <itoral@igalia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4a298a43f5e339f48d2dda0665c02b88ee9a4e03
commit: 226862f50a7a88e4e4de9abbf36c64d19acd6fd0 drm/v3d: Disable interrupts before resetting the GPU
date:   5 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 months ago
config: powerpc64-randconfig-r071-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141013.Pxfid88r-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141013.Pxfid88r-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/v3d/v3d_irq.c:288 v3d_irq_init() warn: missing unwind goto?

vim +288 drivers/gpu/drm/v3d/v3d_irq.c

57692c94dcbe99 Eric Anholt        2018-04-30  259  
fc22771547e7e8 Eric Anholt        2019-03-08  260  int
57692c94dcbe99 Eric Anholt        2018-04-30  261  v3d_irq_init(struct v3d_dev *v3d)
57692c94dcbe99 Eric Anholt        2018-04-30  262  {
226862f50a7a88 Maíra Canal        2025-06-28  263  	int irq, ret, core;
57692c94dcbe99 Eric Anholt        2018-04-30  264  
57692c94dcbe99 Eric Anholt        2018-04-30  265  	INIT_WORK(&v3d->overflow_mem_work, v3d_overflow_mem_work);
57692c94dcbe99 Eric Anholt        2018-04-30  266  
57692c94dcbe99 Eric Anholt        2018-04-30  267  	/* Clear any pending interrupts someone might have left around
57692c94dcbe99 Eric Anholt        2018-04-30  268  	 * for us.
57692c94dcbe99 Eric Anholt        2018-04-30  269  	 */
57692c94dcbe99 Eric Anholt        2018-04-30  270  	for (core = 0; core < v3d->cores; core++)
0ad5bc1ce4634c Iago Toral Quiroga 2023-10-31  271  		V3D_CORE_WRITE(core, V3D_CTL_INT_CLR, V3D_CORE_IRQS(v3d->ver));
0ad5bc1ce4634c Iago Toral Quiroga 2023-10-31  272  	V3D_WRITE(V3D_HUB_INT_CLR, V3D_HUB_IRQS(v3d->ver));
57692c94dcbe99 Eric Anholt        2018-04-30  273  
226862f50a7a88 Maíra Canal        2025-06-28  274  	irq = platform_get_irq_optional(v3d_to_pdev(v3d), 1);
226862f50a7a88 Maíra Canal        2025-06-28  275  	if (irq == -EPROBE_DEFER)
226862f50a7a88 Maíra Canal        2025-06-28  276  		return irq;
226862f50a7a88 Maíra Canal        2025-06-28  277  	if (irq > 0) {
226862f50a7a88 Maíra Canal        2025-06-28  278  		v3d->irq[V3D_CORE_IRQ] = irq;
226862f50a7a88 Maíra Canal        2025-06-28  279  
226862f50a7a88 Maíra Canal        2025-06-28  280  		ret = devm_request_irq(v3d->drm.dev, v3d->irq[V3D_CORE_IRQ],
eea9b97b450460 Eric Anholt        2019-03-08  281  				       v3d_irq, IRQF_SHARED,
eea9b97b450460 Eric Anholt        2019-03-08  282  				       "v3d_core0", v3d);
eea9b97b450460 Eric Anholt        2019-03-08  283  		if (ret)
eea9b97b450460 Eric Anholt        2019-03-08  284  			goto fail;
226862f50a7a88 Maíra Canal        2025-06-28  285  
226862f50a7a88 Maíra Canal        2025-06-28  286  		irq = platform_get_irq(v3d_to_pdev(v3d), 0);
226862f50a7a88 Maíra Canal        2025-06-28  287  		if (irq < 0)
226862f50a7a88 Maíra Canal        2025-06-28 @288  			return irq;
226862f50a7a88 Maíra Canal        2025-06-28  289  		v3d->irq[V3D_HUB_IRQ] = irq;
226862f50a7a88 Maíra Canal        2025-06-28  290  
226862f50a7a88 Maíra Canal        2025-06-28  291  		ret = devm_request_irq(v3d->drm.dev, v3d->irq[V3D_HUB_IRQ],
57692c94dcbe99 Eric Anholt        2018-04-30  292  				       v3d_hub_irq, IRQF_SHARED,
57692c94dcbe99 Eric Anholt        2018-04-30  293  				       "v3d_hub", v3d);
fc22771547e7e8 Eric Anholt        2019-03-08  294  		if (ret)
fc22771547e7e8 Eric Anholt        2019-03-08  295  			goto fail;
eea9b97b450460 Eric Anholt        2019-03-08  296  	} else {
eea9b97b450460 Eric Anholt        2019-03-08  297  		v3d->single_irq_line = true;
fc22771547e7e8 Eric Anholt        2019-03-08  298  
226862f50a7a88 Maíra Canal        2025-06-28  299  		irq = platform_get_irq(v3d_to_pdev(v3d), 0);
226862f50a7a88 Maíra Canal        2025-06-28  300  		if (irq < 0)
226862f50a7a88 Maíra Canal        2025-06-28  301  			return irq;
226862f50a7a88 Maíra Canal        2025-06-28  302  		v3d->irq[V3D_CORE_IRQ] = irq;
226862f50a7a88 Maíra Canal        2025-06-28  303  
226862f50a7a88 Maíra Canal        2025-06-28  304  		ret = devm_request_irq(v3d->drm.dev, v3d->irq[V3D_CORE_IRQ],
57692c94dcbe99 Eric Anholt        2018-04-30  305  				       v3d_irq, IRQF_SHARED,
eea9b97b450460 Eric Anholt        2019-03-08  306  				       "v3d", v3d);
57692c94dcbe99 Eric Anholt        2018-04-30  307  		if (ret)
fc22771547e7e8 Eric Anholt        2019-03-08  308  			goto fail;
eea9b97b450460 Eric Anholt        2019-03-08  309  	}
57692c94dcbe99 Eric Anholt        2018-04-30  310  
57692c94dcbe99 Eric Anholt        2018-04-30  311  	v3d_irq_enable(v3d);
fc22771547e7e8 Eric Anholt        2019-03-08  312  	return 0;
fc22771547e7e8 Eric Anholt        2019-03-08  313  
fc22771547e7e8 Eric Anholt        2019-03-08  314  fail:
fc22771547e7e8 Eric Anholt        2019-03-08  315  	if (ret != -EPROBE_DEFER)
bc662528e29ae7 Simona Vetter      2020-04-15  316  		dev_err(v3d->drm.dev, "IRQ setup failed: %d\n", ret);
fc22771547e7e8 Eric Anholt        2019-03-08  317  	return ret;
57692c94dcbe99 Eric Anholt        2018-04-30  318  }
57692c94dcbe99 Eric Anholt        2018-04-30  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
