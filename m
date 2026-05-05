Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D453202963
	for <oe-kbuild@lists.linux.dev>; Tue,  5 May 2026 04:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777954016; cv=none; b=FZ2CQtRJxvNghZxM5qmYu28ABXPtJ6VIEJ5t65MEkv7BM5hRJtQHsDldg36RxROg9l8DcXXWP442/hMjkvta/sjgVbIUBjl6Eu7VUO1OAcf5mQ23YZSykkgzwVrCI+EP0Oh4Rtko2/pOZTKYiPh4L01AJzdQWhZcdqdo5NutJJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777954016; c=relaxed/simple;
	bh=zu43YyLG1uY42EIibgoZOxoWxHkBx0qZ2rhBPqM/1uc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bc8i8cfVUGt5tkFYYT+IAzQfuyZoG+h7h92eJlD1ik8WiLGIhSQsN+88dcQ8mcAGyRWbBhOqJYqNwgf3/XSA3ac/LQoG0P+gVLINgcVfScHTShKaus16RiuD3o5PSc1fyPx0GDrR8gw4vexQMEqx9Sgu1CSdqyJYLvoIxg210Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nK8FfGXD; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nK8FfGXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777954014; x=1809490014;
  h=date:from:to:cc:subject:message-id;
  bh=zu43YyLG1uY42EIibgoZOxoWxHkBx0qZ2rhBPqM/1uc=;
  b=nK8FfGXDpy9b5UzNemHNTVFUsO0sqcNVX58Ge2h6pmYzn4A1j94w267j
   yPRg6tJlvHqe8/8mUVr4uYIkdGtsVZ7Dta4sfqsUEXiGZajPtpUyWnyiR
   ZTBnTjAjETkvCyBcpQX58hDjrDxxQBKr3+6iDRV91zdRkwPokaptPCwtK
   Iqz69MmoAD06qDMhHMp1nz7ELUr3U8/gghkCUinvSOQLFF0SEyj/hRlZs
   GC6/KLkaRPnY7ddpmt3Oyye5svB0S4Z2LU9ARawwkl68/JjX1FRk9tyiV
   tFDRXNVJPOUWOxcoQubBRZQvbrXx2K0gOvRxMRM1LhcidpsfNgHv84l8p
   w==;
X-CSE-ConnectionGUID: fFcp3M18Twu0dSFNZqwFTA==
X-CSE-MsgGUID: t5BnNlN/SQ+U4rae9AqYIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="66346962"
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="66346962"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 21:06:53 -0700
X-CSE-ConnectionGUID: NUdMcG16ShKCP4G2p4S1XA==
X-CSE-MsgGUID: At84c0A5TOyNazmcgpSHbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,216,1770624000"; 
   d="scan'208";a="235749216"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 04 May 2026 21:06:53 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wK73a-0000000067N-1zSA;
	Tue, 05 May 2026 04:06:50 +0000
Date: Tue, 05 May 2026 06:05:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb:
 typec-portc@22 (fcs,fusb302): 'connector' is a required property
Message-ID: <202605050522.g5Sx7p8d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Peter Robinson <pbrobinson@gmail.com>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a293ec25d59dd96309058c70df5a4dd0f889a1e4
commit: e14491aaa6ff598bbe9d462e44c01ac65754f445 arm64: dts: rockchip: add overlay for RockPro64 screen
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260505/202605050522.g5Sx7p8d-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260505/202605050522.g5Sx7p8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e14491aaa6ff ("arm64: dts: rockchip: add overlay for RockPro64 screen")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605050522.g5Sx7p8d-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2-screen.dtb: spdif-dit (linux,spdif-dit): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml
--
>> arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtb: spdif-dit (linux,spdif-dit): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/linux,spdif.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
