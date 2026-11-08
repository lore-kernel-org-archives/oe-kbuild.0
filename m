Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794110182;
	b=UvA12QzNjNIXGPfYi8fYZW7zWzm3jJ4rzFf+gBMKSiFBaJImCPmzBTw7CCIt/8E3nC6R
	 rrYJF4MAErq0YGm4PT5Vb1lrBi6jxY4QMi+BQQfJV9yvAqDkhXNEHLZ5GFMo2QPfp7BqN
	 7RT8R3hTVe7UIkeWZYnkC5j92nweIfjxgI8XqqAxxhankPQ3QQnYv+r2aB/YkyhQG3i7I
	 nO2zlyRWQLlue6fbwQzLolDUZ33CfdognH/y+Ay83Vl9I5XvMzxEgX0LciaSqC4F4RLcq
	 Bz8Fho2eb+leQerSrka4A+zutySXBmsHznKHVi729A1hpop2b5Pj8jZT5eEp8gkD8YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794110182;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=uKimYt2Qrs40RoclJBei2keM6kujOg7nnEAYvikmVLY=;
	b=0+r0GfmYiSEH7jutxqCA6ghIZFTtJC/m5RVTVyglJtxznUS8FtqzwzhRdrehr9hR2c/i
	 g/acRaU0gV/R0Dj51PXrKbZIJItV6q36n3oF1cfjY9dCIITCa56iT0poBcalQO0ik+YgQ
	 qrQDZVhvS9AWkEexlgiSLbOdQO1bCAQmCszk1OTiTaNL52tjo97G/hzsAbrC3nc17cEon
	 ThBj6vtCimKVht4efRVaf3eUrxODgE6aNEXv9kUFlflx9i7UIVt2r++XEfFSeSBnPoYn5
	 xEFdZvz0G+dqYFC85C7o8YXIP6G+OjkOKV4d8HjM5cbKu3yBd+k3My9l16PKFb04FyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dIlsNzXU;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03912606A31C
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 03:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03912606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dIlsNzXU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794110181; x=1825646181;
  h=date:from:to:cc:subject:message-id;
  bh=XoUHEGJqECA9I+fDGMS63JJhTuJq+mTDZkOjT7A34hI=;
  b=dIlsNzXUMaesEtRshOE09ofrFvtgy103vcghEYhZfq4hCV2yJv04zP9G
   uFUW0NrD2/XsiXDZw8P5OCLNtLUHNFOe6onZEb7NJVDawdS0ruQXmD7bp
   VGFfaEY7dJDD9BAvV+vqLT98tYrFHUmALyWAyJIoIB8hbml2sVBfIDY5d
   K/nIW7xX0pCnriqfLwjAc1mHSoqeeRgnnuFV9avMYBhzMb6J+GNzjdsEZ
   By5BzdTqKI4SOg1JLiQkET2KJB2F0HSgCUCszU7kH5Z5R2kk/hzO4uipv
   o5SDJkKuSqL7iPPPTOK0Vho0cBkuZnVsDy9KXDyCglQ4fSd8uJagS6Y4s
   w==;
X-CSE-ConnectionGUID: e2RCeeq/SnuVgRvv+nozsw==
X-CSE-MsgGUID: Bux19WJWTOyY+4CcviZsQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2976334"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2976334"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 19:56:21 -0800
X-CSE-ConnectionGUID: C0+BwnZCRDGVVyVWwjxuSA==
X-CSE-MsgGUID: kzDMOPTBQ4iC93ep9sE1wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7925841"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 07 Nov 2026 19:56:19 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPu0v-00000000B04-38P8;
	Sun, 08 Nov 2026 03:56:17 +0000
Date: Sun, 08 Nov 2026 04:55:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android13-5.15 54/54]
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1756 a5xx_gpu_init() warn: variable
 dereferenced before check 'pdev' (see line 1749)
Message-ID: <202611080455.uHXs94rV-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   a5a9930e03c61e245e77f94ef4d0fef4d57c5092
commit: bf35c202a3f01e0fb97468140646a21706b4826c [54/54] drm/msm/a5xx: really check for A510 in a5xx_gpu_init
:::::: branch date: 27 hours ago
:::::: commit date: 3 years, 4 months ago
config: arm-randconfig-2200-20261107 (https://download.01.org/0day-ci/archive/20261108/202611080455.uHXs94rV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa861dbbf46e5a75f621406fd91cb015d8754bf)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611080455.uHXs94rV-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1756 a5xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 1749)

vim +/pdev +1756 drivers/gpu/drm/msm/adreno/a5xx_gpu.c

f56d9df656c41b Jordan Crouse    2017-11-21  1744  
b5f103ab98c77c Jordan Crouse    2016-11-28  1745  struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
b5f103ab98c77c Jordan Crouse    2016-11-28  1746  {
b5f103ab98c77c Jordan Crouse    2016-11-28  1747  	struct msm_drm_private *priv = dev->dev_private;
b5f103ab98c77c Jordan Crouse    2016-11-28  1748  	struct platform_device *pdev = priv->gpu_pdev;
bf35c202a3f01e Dmitry Baryshkov 2023-04-09 @1749  	struct adreno_platform_config *config = pdev->dev.platform_data;
b5f103ab98c77c Jordan Crouse    2016-11-28  1750  	struct a5xx_gpu *a5xx_gpu = NULL;
b5f103ab98c77c Jordan Crouse    2016-11-28  1751  	struct adreno_gpu *adreno_gpu;
b5f103ab98c77c Jordan Crouse    2016-11-28  1752  	struct msm_gpu *gpu;
d28ec12c48dd73 Adam Skladowski  2023-03-14  1753  	unsigned int nr_rings;
b5f103ab98c77c Jordan Crouse    2016-11-28  1754  	int ret;
b5f103ab98c77c Jordan Crouse    2016-11-28  1755  
b5f103ab98c77c Jordan Crouse    2016-11-28 @1756  	if (!pdev) {

:::::: The code at line 1756 was first introduced by commit
:::::: b5f103ab98c77ca5998b39533c2b46959fbd37d9 drm/msm: gpu: Add A5XX target support

:::::: TO: Jordan Crouse <jcrouse@codeaurora.org>
:::::: CC: Rob Clark <robdclark@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
