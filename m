Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3983DFC86
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789032557; cv=none; b=S2iHmjscwqCGYiIya+F8S50+CKDSRPvSyXJawHPU6mfC8qERP5vjUY7ppwxpmo/6j9XBL8xrAfFiUlwmpJQ72PTscuQbZ6Tb4n9+X7eylPw/UeCKSWugbHJil7reCBc6DhJijYNzkhmXeAoMpFJ0mNJ9pbUmIzTEaskKyrtKAPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789032557; c=relaxed/simple;
	bh=z6DcxTb57RPwEoaHMeFoOmPjVCaGJZzbVSKjmcLojM8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZhZYdwhT+vPKGN2b2o2/eEaFNws3G3Q1uLitI0yPNFHie8OmmkDfOf25+iwCb0aSiYFpq2o7hMP7mVKTaLw62H/EM+w0sHX1+a3xC4UbXtV8BPwEsNFqjpxE6Ry5HT2aGOIdntr1FWbmGbH/3U138uqLvVR2lF4+us8cH4S8Ud0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOxWQlvp; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOxWQlvp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789032554; x=1820568554;
  h=date:from:to:cc:subject:message-id;
  bh=z6DcxTb57RPwEoaHMeFoOmPjVCaGJZzbVSKjmcLojM8=;
  b=GOxWQlvpwxBUoTwGlMbQLYI3FmfdgVIf4iu/uvJBIq4YYROtDjJb1wfH
   8d7BRhSZmiRX2x3nmW/lGT/kAdMtLrjkUG2zye17L+gkqBKNSwyPRVyGT
   m16LzBn9HVnPyiPDTTCiIJNIHGXyTSYlxk5WibM4VM6f4iliDOzkF4dT/
   pc/D91EyoKLn8dwQ6nzGoWE6hR1S6fOfFspFHzp1Y9HbBrnAbsCvg8pJY
   Z48891La1zLJfRYpvvqg9fKp8RMAugRJBMJVMoZIVjki7JLRboBLcg+76
   EQ9PCsv1sjajEOTxIhVW/Oyypq6lEXbnL39ETzZ8Gld+zvnf29aCatIeD
   A==;
X-CSE-ConnectionGUID: kHLKbcDvTUGqcc5dyD3Lgw==
X-CSE-MsgGUID: nByWHlRKQhS3RHwTwZFswQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89601046"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89601046"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 02:29:14 -0700
X-CSE-ConnectionGUID: h4o3WIf/TvGDInzyrXYN5g==
X-CSE-MsgGUID: O/UBxE7cS9iwk9jdoBgVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="268307683"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Sep 2026 02:29:13 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4b5i-000000001ce-2J3b;
	Thu, 10 Sep 2026 09:29:10 +0000
Date: Thu, 10 Sep 2026 17:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xlnx/zynqmp_dpsub.c:114
 zynqmp_dpsub_init_clocks() warn: 'dpsub->apb_clk' from clk_prepare_enable()
 not released on lines: 85,91.
Message-ID: <202609101721.q2fqr7Mi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Chen-Yu Tsai" <wenst@chromium.org>
CC: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   50d05c7c76c96b90462f24debacca971d2e86713
commit: b61f7dd29ba948067849ae38b94ab9e038d066ce drm/xlnx/zynqmp-dpsub: Fix dependencies for COMPILE_TEST
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-r071-20260910 (https://download.01.org/0day-ci/archive/20260910/202609101721.q2fqr7Mi-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: b61f7dd29ba9 ("drm/xlnx/zynqmp-dpsub: Fix dependencies for COMPILE_TEST")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609101721.q2fqr7Mi-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xlnx/zynqmp_dpsub.c:114 zynqmp_dpsub_init_clocks() warn: 'dpsub->apb_clk' from clk_prepare_enable() not released on lines: 85,91.

vim +114 drivers/gpu/drm/xlnx/zynqmp_dpsub.c

d76271d22694e8 Hyun Kwon        2018-07-07   58  
d76271d22694e8 Hyun Kwon        2018-07-07   59  /* -----------------------------------------------------------------------------
d76271d22694e8 Hyun Kwon        2018-07-07   60   * Probe & Remove
d76271d22694e8 Hyun Kwon        2018-07-07   61   */
d76271d22694e8 Hyun Kwon        2018-07-07   62  
d76271d22694e8 Hyun Kwon        2018-07-07   63  static int zynqmp_dpsub_init_clocks(struct zynqmp_dpsub *dpsub)
d76271d22694e8 Hyun Kwon        2018-07-07   64  {
d76271d22694e8 Hyun Kwon        2018-07-07   65  	int ret;
d76271d22694e8 Hyun Kwon        2018-07-07   66  
d76271d22694e8 Hyun Kwon        2018-07-07   67  	dpsub->apb_clk = devm_clk_get(dpsub->dev, "dp_apb_clk");
d76271d22694e8 Hyun Kwon        2018-07-07   68  	if (IS_ERR(dpsub->apb_clk))
d76271d22694e8 Hyun Kwon        2018-07-07   69  		return PTR_ERR(dpsub->apb_clk);
d76271d22694e8 Hyun Kwon        2018-07-07   70  
d76271d22694e8 Hyun Kwon        2018-07-07   71  	ret = clk_prepare_enable(dpsub->apb_clk);
d76271d22694e8 Hyun Kwon        2018-07-07   72  	if (ret) {
d76271d22694e8 Hyun Kwon        2018-07-07   73  		dev_err(dpsub->dev, "failed to enable the APB clock\n");
d76271d22694e8 Hyun Kwon        2018-07-07   74  		return ret;
d76271d22694e8 Hyun Kwon        2018-07-07   75  	}
d76271d22694e8 Hyun Kwon        2018-07-07   76  
c979296ef60cdd Laurent Pinchart 2021-08-06   77  	/*
c979296ef60cdd Laurent Pinchart 2021-08-06   78  	 * Try the live PL video clock, and fall back to the PS clock if the
c979296ef60cdd Laurent Pinchart 2021-08-06   79  	 * live PL video clock isn't valid.
c979296ef60cdd Laurent Pinchart 2021-08-06   80  	 */
1682ade6630823 Laurent Pinchart 2021-08-06   81  	dpsub->vid_clk = devm_clk_get(dpsub->dev, "dp_live_video_in_clk");
1682ade6630823 Laurent Pinchart 2021-08-06   82  	if (!IS_ERR(dpsub->vid_clk))
1682ade6630823 Laurent Pinchart 2021-08-06   83  		dpsub->vid_clk_from_ps = false;
1682ade6630823 Laurent Pinchart 2021-08-06   84  	else if (PTR_ERR(dpsub->vid_clk) == -EPROBE_DEFER)
1682ade6630823 Laurent Pinchart 2021-08-06   85  		return PTR_ERR(dpsub->vid_clk);
1682ade6630823 Laurent Pinchart 2021-08-06   86  
1682ade6630823 Laurent Pinchart 2021-08-06   87  	if (IS_ERR_OR_NULL(dpsub->vid_clk)) {
1682ade6630823 Laurent Pinchart 2021-08-06   88  		dpsub->vid_clk = devm_clk_get(dpsub->dev, "dp_vtc_pixel_clk_in");
1682ade6630823 Laurent Pinchart 2021-08-06   89  		if (IS_ERR(dpsub->vid_clk)) {
1682ade6630823 Laurent Pinchart 2021-08-06   90  			dev_err(dpsub->dev, "failed to init any video clock\n");
1682ade6630823 Laurent Pinchart 2021-08-06   91  			return PTR_ERR(dpsub->vid_clk);
1682ade6630823 Laurent Pinchart 2021-08-06   92  		}
1682ade6630823 Laurent Pinchart 2021-08-06   93  		dpsub->vid_clk_from_ps = true;
1682ade6630823 Laurent Pinchart 2021-08-06   94  	}
1682ade6630823 Laurent Pinchart 2021-08-06   95  
c979296ef60cdd Laurent Pinchart 2021-08-06   96  	/*
c979296ef60cdd Laurent Pinchart 2021-08-06   97  	 * Try the live PL audio clock, and fall back to the PS clock if the
c979296ef60cdd Laurent Pinchart 2021-08-06   98  	 * live PL audio clock isn't valid. Missing audio clock disables audio
c979296ef60cdd Laurent Pinchart 2021-08-06   99  	 * but isn't an error.
c979296ef60cdd Laurent Pinchart 2021-08-06  100  	 */
c979296ef60cdd Laurent Pinchart 2021-08-06  101  	dpsub->aud_clk = devm_clk_get(dpsub->dev, "dp_live_audio_aclk");
c979296ef60cdd Laurent Pinchart 2021-08-06  102  	if (!IS_ERR(dpsub->aud_clk)) {
c979296ef60cdd Laurent Pinchart 2021-08-06  103  		dpsub->aud_clk_from_ps = false;
c979296ef60cdd Laurent Pinchart 2021-08-06  104  		return 0;
c979296ef60cdd Laurent Pinchart 2021-08-06  105  	}
c979296ef60cdd Laurent Pinchart 2021-08-06  106  
c979296ef60cdd Laurent Pinchart 2021-08-06  107  	dpsub->aud_clk = devm_clk_get(dpsub->dev, "dp_aud_clk");
c979296ef60cdd Laurent Pinchart 2021-08-06  108  	if (!IS_ERR(dpsub->aud_clk)) {
c979296ef60cdd Laurent Pinchart 2021-08-06  109  		dpsub->aud_clk_from_ps = true;
c979296ef60cdd Laurent Pinchart 2021-08-06  110  		return 0;
c979296ef60cdd Laurent Pinchart 2021-08-06  111  	}
c979296ef60cdd Laurent Pinchart 2021-08-06  112  
c979296ef60cdd Laurent Pinchart 2021-08-06  113  	dev_info(dpsub->dev, "audio disabled due to missing clock\n");
d76271d22694e8 Hyun Kwon        2018-07-07 @114  	return 0;
d76271d22694e8 Hyun Kwon        2018-07-07  115  }
d76271d22694e8 Hyun Kwon        2018-07-07  116  

:::::: The code at line 114 was first introduced by commit
:::::: d76271d22694e874ed70791702db9252ffe96a4c drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem

:::::: TO: Hyun Kwon <hyun.kwon@xilinx.com>
:::::: CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
