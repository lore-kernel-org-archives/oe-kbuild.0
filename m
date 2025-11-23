Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D822D6E6D
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 18:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763921721; cv=none; b=mgHfFT+YvF4j0HYbFr5Vs4GTSeDWQeE39KIdNJr4foKzgaLfPGEXtl037B4/n+uQgR8LYFOio8P3ALYvEevczJOZvN4fmtk+H+j6tUdAj/vSfOmfsuoESCtXRHk30xznyx9kxZ8khHp0meFay8GWk0mqih15oh+uvXnNOkbcT3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763921721; c=relaxed/simple;
	bh=ZYco8o+SHm/y+Gwtut0JQXrI+b0Jy3d/0JOmBRMPatI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1tN5zeE2WwrqZyhc4kgW3ZKj6TulCw1k+Fn7feh3fVovo9iTHoPH6dwx0NXo5kKZVBq+u82Tf+sy2JQk4eyUwRjDaYEDmk+3Jb9y/+t67ELCEJdI5wZp5uaqMZXI6mJYs7SgO++KHoshq7vffEiLnrXCPxGx/WvPEAeik0ohiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEV1f0Zr; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEV1f0Zr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763921719; x=1795457719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZYco8o+SHm/y+Gwtut0JQXrI+b0Jy3d/0JOmBRMPatI=;
  b=AEV1f0ZrkxhFnwT3/iGWodvhc49EVQdFoqyR11EcDYqtFjjLSMyLnSGV
   k7J/0yhPFnG0xHP5temqS7i/yIa7PMErJaCEgIQDAOSQeacVLj27TrNBk
   qQiFMeKNgccx2dp1NYRuCt69jTl9ZWsbLUcbp+9/i9ypq8bwbGe2MWmSg
   KEgY4YHAcPh87JvqTOyblEnJYM0DhgvVLjDt8o3v0Lkt/xGMqgBkuDfl5
   j92bsPAKRw44LJF8SLNHWuujajDITkV4+0RmFjQN2lN4bQ+j1jILybu1c
   b2xpzIoTWa91xytWcltlL1BC+ezyH/7VlN4mUneGZiFkjAs//DzAwku3c
   w==;
X-CSE-ConnectionGUID: +eoU6fWkQ52Kvb1/UWudDw==
X-CSE-MsgGUID: qIrYAsyAQ6+fY+TTr+Pr0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83324144"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="83324144"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 10:15:19 -0800
X-CSE-ConnectionGUID: 90/dXMhwSAeDNsYj3UUpXg==
X-CSE-MsgGUID: r86E0CBrTv+XcUwy8Cb7XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="222783423"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Nov 2025 10:15:18 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNEcF-0000000002n-378d;
	Sun, 23 Nov 2025 18:15:15 +0000
Date: Sun, 23 Nov 2025 19:14:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:k3/dt-2 47/47] arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb:
 /bus@f0000/bus@a80000/pinctrl@4084000: failed to match any schema with
 compatible: ['ti,am62l-padconf', 'pinctrl-single']
Message-ID: <202511231900.ZW4Hqd1T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: arm@kernel.org
TO: Vignesh Raghavendra <vigneshr@ti.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git k3/dt-2
head:   56baa9190988f35d53b1479a87c1bf44f6c979c6
commit: 56baa9190988f35d53b1479a87c1bf44f6c979c6 [47/47] arm64: dts: ti: k3-am62l: Fix unit address of cbass_wakeup
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251123/202511231900.ZW4Hqd1T-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231900.ZW4Hqd1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511231900.ZW4Hqd1T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: pinctrl@4084000 (ti,am62l-padconf): compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,am62l-padconf', 'pinctrl-single'] is too long
   	'ti,am62l-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,am62l-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf', 'ti,j7200-padconf']
   	'ti,am62l-padconf' is not one of ['marvell,pxa1908-padconf']
   	'pinconf-single' was expected
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml
>> arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb: /bus@f0000/bus@a80000/pinctrl@4084000: failed to match any schema with compatible: ['ti,am62l-padconf', 'pinctrl-single']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
