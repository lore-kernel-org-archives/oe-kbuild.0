Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E691018C0C
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737813368; cv=none; b=RGp+bbqrA5ku0KD2Pg1S3eS2pSyG7GhB24GY6zOSHnxYGnvwTMqnGKBSbUh8zzKPvbSn86vQ0iyc1UxI7ADEDJ++XrVBpI3z5EqBR+gpljONe5crPdmGkBDohtbLiUbog8UPPLduMpixWGZpinuwWkoaAOf6ERSoCIhJcwN2BFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737813368; c=relaxed/simple;
	bh=aAVYdxvRkMGZLbiOhqRXN5XJHwmQt4NIxyn+Dl0vBvA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DgOktWL8cjWxDi8TR0rvOiAXrNIdd58s93EGFkJT92pE6MEJ46I3L0NJSrSMY82nrAS04Y2BiLNyo63wIaJXxs5R19AnvN/fbJqpmY2K9Gnp5fuIiJAU25NfLg6kKS96bzbQUPYRSTKEGimaldtf2PzaDWT5+DYLCI/es6HpeSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMOyjR+s; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMOyjR+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737813366; x=1769349366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aAVYdxvRkMGZLbiOhqRXN5XJHwmQt4NIxyn+Dl0vBvA=;
  b=UMOyjR+sn/J0i3ycbc0P7M/ffm4DeIca/ZDJFc/3nCEYydEk7qxAbNpt
   74t6LxLQseOz+1zAcWOHLAW131iMFNj3n9SoovynPi8QHYN0oMpsayIMb
   ck0sp0XjGLYaTc8dGXJ3h+lSUE9acO+eh7s49YNGL0N9QF7EovoRys8QI
   rCi5lcUAC0HX1EPQmqZixvM1e/v7msQG2fHvRJmeXeNuVgremMh6cgkOx
   2Dw4A1kpjvibXsaTsHpyW/PFPNKvBTR90KErS5R08JHUisUnqxhrOBerE
   spfwZVXP3E5l5oXU0OO6/WpUKSmSKHa9QOMbiyumHCGFJpOtQRhj5yLb/
   w==;
X-CSE-ConnectionGUID: 3gxYCEq1SfaQ93L1qHvxWQ==
X-CSE-MsgGUID: bjR+6eTSSWK88XnIwDIXdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="49729353"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="49729353"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 05:56:05 -0800
X-CSE-ConnectionGUID: 0yDBXAz7S0KaP4crE4gVRg==
X-CSE-MsgGUID: yVhRgTcUT7ynOBYM5c4gug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="107811903"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Jan 2025 05:56:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbgdm-000drP-06;
	Sat, 25 Jan 2025 13:56:02 +0000
Date: Sat, 25 Jan 2025 21:55:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/2] dmaengine: pxa: Enable compile test
Message-ID: <202501252153.wCMpgWlF-lkp@intel.com>
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
In-Reply-To: <20250114191316.857154-1-krzysztof.kozlowski@linaro.org>
References: <20250114191316.857154-1-krzysztof.kozlowski@linaro.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>

Hi Krzysztof,

kernel test robot noticed the following build warnings:

[auto build test WARNING on vkoul-dmaengine/next]
[also build test WARNING on shawnguo/for-next sunxi/sunxi/for-next mani-mhi/mhi-next xilinx-xlnx/master linus/master v6.13 next-20250124]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Krzysztof-Kozlowski/dmaengine-pxa-Enable-compile-test/20250115-031547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250114191316.857154-1-krzysztof.kozlowski%40linaro.org
patch subject: [PATCH v2 2/2] dmaengine: pxa: Enable compile test
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: parisc-randconfig-r072-20250124 (https://download.01.org/0day-ci/archive/20250125/202501252153.wCMpgWlF-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202501252153.wCMpgWlF-lkp@intel.com/

New smatch warnings:
drivers/dma/pxa_dma.c:595 clear_chan_irq() warn: variable dereferenced before check 'phy->vchan' (see line 593)

Old smatch warnings:
drivers/dma/pxa_dma.c:1266 pxad_init_phys() error: uninitialized symbol 'ret'.

vim +595 drivers/dma/pxa_dma.c

a57e16cf03339c Robert Jarzmik 2015-05-25  583  
a57e16cf03339c Robert Jarzmik 2015-05-25  584  static unsigned int clear_chan_irq(struct pxad_phy *phy)
a57e16cf03339c Robert Jarzmik 2015-05-25  585  {
a57e16cf03339c Robert Jarzmik 2015-05-25  586  	u32 dcsr;
a57e16cf03339c Robert Jarzmik 2015-05-25  587  	u32 dint = readl(phy->base + DINT);
a57e16cf03339c Robert Jarzmik 2015-05-25  588  
a57e16cf03339c Robert Jarzmik 2015-05-25  589  	if (!(dint & BIT(phy->idx)))
a57e16cf03339c Robert Jarzmik 2015-05-25  590  		return PXA_DCSR_RUN;
a57e16cf03339c Robert Jarzmik 2015-05-25  591  
a57e16cf03339c Robert Jarzmik 2015-05-25  592  	/* clear irq */
a57e16cf03339c Robert Jarzmik 2015-05-25 @593  	dcsr = phy_readl_relaxed(phy, DCSR);
a57e16cf03339c Robert Jarzmik 2015-05-25  594  	phy_writel(phy, dcsr, DCSR);
a57e16cf03339c Robert Jarzmik 2015-05-25 @595  	if ((dcsr & PXA_DCSR_BUSERR) && (phy->vchan))
a57e16cf03339c Robert Jarzmik 2015-05-25  596  		dev_warn(&phy->vchan->vc.chan.dev->device,
a57e16cf03339c Robert Jarzmik 2015-05-25  597  			 "%s(chan=%p): PXA_DCSR_BUSERR\n",
a57e16cf03339c Robert Jarzmik 2015-05-25  598  			 __func__, &phy->vchan);
a57e16cf03339c Robert Jarzmik 2015-05-25  599  
a57e16cf03339c Robert Jarzmik 2015-05-25  600  	return dcsr & ~PXA_DCSR_RUN;
a57e16cf03339c Robert Jarzmik 2015-05-25  601  }
a57e16cf03339c Robert Jarzmik 2015-05-25  602  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
