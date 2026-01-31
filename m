Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E032F99AE
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 07:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769845682; cv=none; b=R6OWn4mUlg5icHywZgo1bLkjp2pasLcA9GArVShypEQWmCD9GZ4ih6F68zZ3zcL6AChYthtyixf/k2NWI/AMVJGT9Fk8ZSHbQ1bVitzP0VgEC9uEAHwl4R1FpKyNvB6+HYaERVYBMeP8L5bHAHt6XSTp7mzyKNuR8CGv9V8zwvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769845682; c=relaxed/simple;
	bh=3VV8hiVC9VioAqZp2P1BBrwegKNFMmJMi0rCjjPU+Hc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iF3Budt1ERbUVL0DdllXK0mTjQt7grmg6WHGosDMu0QSf4YxB0UKbTwocheTnzjk4JTXOVrIZ1LGZDQiBFjAz/j9+OzmuLcLCKBYKJkJEEPB5upbMZZjkzQwkwxfRggTU114UADZzkO8jRGfOuCJx4FIrLE+PJnJlvYElVvOHNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fBWly3M3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fBWly3M3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769845679; x=1801381679;
  h=date:from:to:cc:subject:message-id;
  bh=3VV8hiVC9VioAqZp2P1BBrwegKNFMmJMi0rCjjPU+Hc=;
  b=fBWly3M3tjpwDKOoglyy6mqpa5ptp3XeiQtW5+iUJj7i0v1R4se2wKGj
   SlOaHFcb1Nwyoz+l5Xm0NXM18uVRNA+WtNnpN0f9Wn/FW+XUVsePnYr4i
   O0D5H8jSkFpZ5cCmolt2u+MFQ6QKjGt3oII4Yo6FkWRE1yzXaxDXi+KeV
   OXgGRq9t8Pzxm3TUWxmc/hJVL7mjKUGPgr3VaJTRBny4OEyzTEYgrIQY5
   xNPWzPpI7UBo/t15vIFML1L9ObDbu8hP7aHKolqrF7sDFTom8+XjDBGYw
   +g/S2tK5qV9BLhaxgpzIiCgzYWzyoN4vjCeMxPsl8vt5aI7+/AbvYJ1JX
   Q==;
X-CSE-ConnectionGUID: uJ0v8zEfQOKzmA0oK9LPjg==
X-CSE-MsgGUID: MjnXQpFQT0m4XV4PiO1BKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="93742740"
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="93742740"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 23:47:56 -0800
X-CSE-ConnectionGUID: y6Ern78wTheLMHfBKI81PQ==
X-CSE-MsgGUID: sv6IDWVlSp6y/oQuhFgQPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,264,1763452800"; 
   d="scan'208";a="213567894"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Jan 2026 23:47:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm5hw-00000000dnQ-0xoN;
	Sat, 31 Jan 2026 07:47:52 +0000
Date: Sat, 31 Jan 2026 15:47:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 100/100]
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1750 a5xx_gpu_init() warn: variable
 dereferenced before check 'pdev' (see line 1743)
Message-ID: <202601311507.plKOLxfT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   33f6e289fb06b4b8ebf1124c1fad6b68aea9d8de
commit: 154bed0fd609e1c195d582ec3b6f647c5859acaf [100/100] drm/msm/a5xx: really check for A510 in a5xx_gpu_init
:::::: branch date: 11 hours ago
:::::: commit date: 2 years, 6 months ago
config: arm64-randconfig-r072-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311507.plKOLxfT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601311507.plKOLxfT-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1750 a5xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 1743)

vim +/pdev +1750 drivers/gpu/drm/msm/adreno/a5xx_gpu.c

f56d9df656c41b1 Jordan Crouse    2017-11-21  1738  
b5f103ab98c77ca Jordan Crouse    2016-11-28  1739  struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
b5f103ab98c77ca Jordan Crouse    2016-11-28  1740  {
b5f103ab98c77ca Jordan Crouse    2016-11-28  1741  	struct msm_drm_private *priv = dev->dev_private;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1742  	struct platform_device *pdev = priv->gpu_pdev;
154bed0fd609e1c Dmitry Baryshkov 2023-04-09 @1743  	struct adreno_platform_config *config = pdev->dev.platform_data;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1744  	struct a5xx_gpu *a5xx_gpu = NULL;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1745  	struct adreno_gpu *adreno_gpu;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1746  	struct msm_gpu *gpu;
02891701516b247 Adam Skladowski  2023-03-14  1747  	unsigned int nr_rings;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1748  	int ret;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1749  
b5f103ab98c77ca Jordan Crouse    2016-11-28 @1750  	if (!pdev) {

:::::: The code at line 1750 was first introduced by commit
:::::: b5f103ab98c77ca5998b39533c2b46959fbd37d9 drm/msm: gpu: Add A5XX target support

:::::: TO: Jordan Crouse <jcrouse@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
