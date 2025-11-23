Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E786028373
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 01:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763861868; cv=none; b=P+ZCvIuQK6AVgglZi2/GStJBwNaoge76JFrHChGlJmjR0WZbTfx3rNcY1JlZkuzYzpG4oMkHQFQS9pB5vydsQnRZJJhHeVogyBSUFL/+DTPUoUSWVv16KnctDP9pjmqHCyPwtJjSbKMPf3avAr5LvxhKse73YIAuaIa1aMOIrv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763861868; c=relaxed/simple;
	bh=Vj/BR+zixDfdeGnHdyNmrFtqoSVGV5K83vc0DAbVPrg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oKwkUNSgDlcYHcu+/UHZs7U50tHg9NRfwq7bOMIOy9bUeONm6RH8zwtPpP4GFY/va+xxAdoNwMLO4cB0U1IrRcp1K7B7edLZR/6cPR4PvU2H7kf/yJolCd3/pLYVWN0Q/Vln/81nyV4yTSPVBkG1uq+KvBBsLe3rg8qOg6Hn9rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKmdWrib; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKmdWrib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763861866; x=1795397866;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vj/BR+zixDfdeGnHdyNmrFtqoSVGV5K83vc0DAbVPrg=;
  b=bKmdWribznV1N0DgmbeTGcenOtLK/7UjXKF39TTNp0p2SWRcc2ncahY4
   5MfYz+X3p21ugVeAYZmh5Jv3UusmjJHMBUUWkAhLmLEEutN32dRQNCyV/
   VbdEQQJgJ9MLbQolnWwmPzLVKjr+0jvbHYKjdY4EPzEHOTwK+Yuhs/s3U
   BDri0XMk9MVfELMdKiu5gH0r9NhR3fVhl28vXrvoYwIMq90KcaJH/NFwE
   NAukcn92pH2/e5fZHYbA+aiCG04MC6bciNHQWrswb/ju92/yaQZQ5jIXu
   FgNjSW96tA7/eKabJzxvWSwZFuh0eeXGruPBpvLE0zTTPr1rH3M3W+cEC
   A==;
X-CSE-ConnectionGUID: QUSCzjJgTa+medGYac58bA==
X-CSE-MsgGUID: 89KPlaBoQtqbudmC8cEJ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="76596403"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="76596403"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 17:37:45 -0800
X-CSE-ConnectionGUID: 4V16VdFdSNyxnntmO0WAmg==
X-CSE-MsgGUID: VY37tN9CQm6212guxdvW5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="192039693"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2025 17:37:44 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMz2r-000000002IB-3AQt;
	Sun, 23 Nov 2025 01:37:41 +0000
Date: Sun, 23 Nov 2025 02:37:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:k3/dt-2 47/47] arch/arm64/boot/dts/ti/k3-am62l3-evm.dtb:
 /bus@f0000/bus@a80000/pinctrl@4084000: failed to match any schema with
 compatible: ['ti,am62l-padconf', 'pinctrl-single']
Message-ID: <202511230257.LifA4UYN-lkp@intel.com>
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
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20251122 (https://download.01.org/0day-ci/archive/20251123/202511230257.LifA4UYN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.9.dev20+g7033eb7ce
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230257.LifA4UYN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511230257.LifA4UYN-lkp@intel.com/

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
