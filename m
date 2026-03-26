Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714E623EA80
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 05:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774504120; cv=none; b=Ns/6+XVoxalWIaRcIBYB2Dijqg0vn22iAFiIR+R66zTwBZHFxY+vJRsyAnwURgZi5rQOqHECqTXD53WrBBzdrRqdeCGKlEHUFdExhSNDN2QAO+7pLPxN4oI0XnX5x68vd9R+TQhcurr6TFc0a4yRPmn4l1iL0MnFHK2RfFm00mA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774504120; c=relaxed/simple;
	bh=dT7qvY5rL6Lo1Px4NTmfagCOcUUsAS0AiDYOP2lZj9o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jmRkGcCsak+Wz2/HpwvCrYMb24qg0ZEPOnFOKAW8qC/xSSJ1rnPh6TSZ12eAHwCsx5EJ96p2Znlh6j9InvXZyZs8PMwgHvzVwXsqbY0BC0L7kjH2Y+vNw+xv6HCqdTRN/r2l1qKV5Fxqm59MUoe8O6mePINTVPmlUdjBtYcR7c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oe4GC5zX; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oe4GC5zX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774504119; x=1806040119;
  h=date:from:to:cc:subject:message-id;
  bh=dT7qvY5rL6Lo1Px4NTmfagCOcUUsAS0AiDYOP2lZj9o=;
  b=Oe4GC5zXPUL8NPFZWVDGpPMfE1vWCBCIb3Vfeouuz5BFksezgELIrNt8
   WhboiENR/SKXCrLzl/r6jwgmIcTXnbCHbzz2QPM2RjA16TI+lUbX/uDbS
   vVw5xxYqqVNt/Y62D3Ov+cCS7TNWamc9LReOC+w/+JBjNsIDzuDTE9Rly
   1I2MU88oLg7MCkQWHrdxrR+vROkt/8cDzUYvPIV2wDGXN+HihXzV37O0l
   Q5LqyY3/hCAEwpMxrSo3R+ddWkdcNMiSKtAM3N0WHLCsSMuK/c1lLtt0c
   yCgKjAte3xnOMDRSepAigzE1rLoju6yYq/StvP/yNVek29WGITX2PGSNE
   w==;
X-CSE-ConnectionGUID: ctktQzP3S6WZThd7zics2w==
X-CSE-MsgGUID: gOMeoxcKQka5wStnu1QbPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75516037"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75516037"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 22:48:39 -0700
X-CSE-ConnectionGUID: qjAVJbmfSVCEjrNi5Za8sA==
X-CSE-MsgGUID: BZejsFiCQWCpxpMxRn8Z1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="224836429"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 25 Mar 2026 22:48:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5da8-000000007Dt-012I;
	Thu, 26 Mar 2026 05:48:36 +0000
Date: Thu, 26 Mar 2026 06:47:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.1-armsoc/dts64 39/44]
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: /soc/efuse@ff930000: failed
 to match any schema with compatible: ['rockchip,rk3562-otp']
Message-ID: <202603260623.K8vKOU32-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: linux-rockchip@lists.infradead.org
TO: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.1-armsoc/dts64
head:   6cb4ec63ba9a5831621cf951b7af55c67beeb97b
commit: 2448f33ff93ca9e41ce419e4bc7257010fa70a04 [39/44] arm64: dts: rockchip: Enable OTP controller for RK3562
:::::: branch date: 6 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-2051-20260325 (https://download.01.org/0day-ci/archive/20260326/202603260623.K8vKOU32-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603260623.K8vKOU32-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603260623.K8vKOU32-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dtb: /soc/efuse@ff930000: failed to match any schema with compatible: ['rockchip,rk3562-otp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
