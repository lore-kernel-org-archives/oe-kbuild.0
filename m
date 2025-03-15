Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583DF1F755E
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 14:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742047801; cv=none; b=hkX8DAWpJVjX97V0//jd4XE2bnbtDUl/Ta3FM8ynUDeDeS+Sq+BGq3Ltwjq2/1nIfY7lpasoa7FPD0f2H41dS5D/SIqhmfN3mvuYAUclmLATFrmbI+erLpIq8j67+LC+6K3u6AN3XVro5Mk3374BqQDIBC8tJjRhVRXwz8FuwKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742047801; c=relaxed/simple;
	bh=iYqEIQjkb+2HFMU/xpW0ERcXUge3nRLe1jneXhRiQe4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KJbSRPi8t7OuJrrIGCFokHw2MsaE14adEznm6JeCz0QicABv4QBFpKvftsMJ7RcAd5QsNYCsuV/LxHngiBzPA6H1Y7USrJWeZJwyJX8UshC1OgCR9MFuCIwiRxdR66VprMjppympuetjxElKyxazbb8pphrAnFbDsRAFLqUCZs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nYOmFYl+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nYOmFYl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742047799; x=1773583799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iYqEIQjkb+2HFMU/xpW0ERcXUge3nRLe1jneXhRiQe4=;
  b=nYOmFYl+wXyg4KaL3s5eorstAp5MXjc0ncuIpuSbzVRNaHf3K/OxiClK
   7A4mwTg7xXASnAMIIJcdRkYmJ38fL8i84xNKaVUOEML6oFsl7MGV7eEnT
   NC8L9B9h5w5v4k1NtP1JIagza6syv/0B0Wa99pb0IUv2KhhoVAvTUOaS7
   Wff05VuC+TmhsBpSf3iHhZFFMUUglKi5eJWjAwYnY+q5ffC5ad+gmy6uS
   R2Zt0bZ6rJc9mbNG/f9U1R802ZTmKAzlLv8Y5cnis2FyLw1dfgPoCx4uO
   P7joFqLcGVQbvJFsB0eE6awDCuIIlYINnTdDY8eY4aTCY9bz2wvdmoxwD
   A==;
X-CSE-ConnectionGUID: /6mNRH5CQXi6WSer22eKKA==
X-CSE-MsgGUID: tH72qosSTHSwHRaN2QFQSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11374"; a="46976046"
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="46976046"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2025 07:09:58 -0700
X-CSE-ConnectionGUID: MBXar3/MRKaTlE+t2XPbew==
X-CSE-MsgGUID: 2aL0ospfQ2O6GsuPb/mESg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,250,1736841600"; 
   d="scan'208";a="126726715"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 15 Mar 2025 07:09:57 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttSD4-000BNf-2I;
	Sat, 15 Mar 2025 14:09:54 +0000
Date: Sat, 15 Mar 2025 22:09:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [soc:imx/dt64 66/84]
 arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb:
 clock-controller@30380000: 'fsl,operating-mode' does not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202503152216.fdnlXbwG-lkp@intel.com>
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
TO: Oleksij Rempel <o.rempel@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Ahmad Fatoum <a.fatoum@pengutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git imx/dt64
head:   5a690619426fc4b09c7fd3f40d3a69264ef3db0f
commit: 34662050b023399c5de6ddcb4de121b24297bcc9 [66/84] arm64: dts: imx8mp-skov: add basic board as fallback
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250312 (https://download.01.org/0day-ci/archive/20250315/202503152216.fdnlXbwG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2025.3.dev4+g7b57675
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250315/202503152216.fdnlXbwG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503152216.fdnlXbwG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: /: failed to match any schema with compatible: ['skov,imx8mp-skov-basic', 'fsl,imx8mp']
>> arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dtb: clock-controller@30380000: 'fsl,operating-mode' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/clock/imx8m-clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
