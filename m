Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57153A937
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jun 2025 12:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750595986; cv=none; b=UB96RGl3Jsj65lqLsRlaOE4O0X+6mVsStn5D629x3Ku9MwtqXg4ImqhZeucuX4FqQT9VQTcLo49ydKbJdz1/b/3Y/tAzRlM5wH8SCBUTAo69KOJnSiLo9GVpW5+MFmWk+vFiMMtnx8ItbbVd9YOuYBDzJbNbZzkdtkAWihVEr+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750595986; c=relaxed/simple;
	bh=0oLPHYzT3jYMWXl5Bq70D4f5jc7ostxrVobS0DCpl/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AfWc98T8o5PSTcHp9NI0+a+XZKz5rDwqoG95ph32HSjQkyRqcmLOmag+8NQesK5UWGXg5yug+Cth58tzjmUkSPGNWYTDwA/nCGGhXmCU8CIzDIWdmXn5eUohKi92bu718M/PME1M8oB6XKIVmASqJVV3jkDf4dDxllrn16ZJpGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CM9auhA1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CM9auhA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750595984; x=1782131984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0oLPHYzT3jYMWXl5Bq70D4f5jc7ostxrVobS0DCpl/A=;
  b=CM9auhA1hTg/OlKOaT033clfmvQY577Y6zom0KqNtefJGIP7vK5En6lN
   TIWrpbtAx6SshPQlAEEBbobkOIOqjn4XQ9If2B+wKtVfBsoi11IILn6oY
   IG5RezInb8hvoiSCXRPgY38q45OcP1Kk2rEuOXJFOGzu1Ugui8/tGmVCg
   Za3880IxKsi4fqil5WQ1QPD2J9sCzkO8B+oprYMZjAAFe8iUK1vT8SVh6
   JifQx0OG5zhRqjdtKSsUozb6iDHzhuENPbLyLzg6vTF8MFqTkP3a75YAa
   JiEettK0A7XGe7bo11NtwXzkJydz4PrwT2Fk6UHDENMXOuBPEzIjuUPpN
   Q==;
X-CSE-ConnectionGUID: UQyfIhFiSA2DTHiarSamkg==
X-CSE-MsgGUID: rOcRgR/7RM2P3DVr8vtlqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52952451"
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="52952451"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2025 05:39:43 -0700
X-CSE-ConnectionGUID: cSwlJQdcTZWj1v4UXt8ZUw==
X-CSE-MsgGUID: gJeCCRplQg2c5xQrUGevDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,256,1744095600"; 
   d="scan'208";a="182372020"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Jun 2025 05:39:42 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uTJz2-000NGz-1G;
	Sun, 22 Jun 2025 12:39:40 +0000
Date: Sun, 22 Jun 2025 20:39:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v6.17-armsoc/dts64 27/34]
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb:
 /soc/power-management@ff600000: failed to match any schema with compatible:
 ['rockchip,rk3528-pmu', 'syscon', 'simple-mfd']
Message-ID: <202506222031.kAqSmDQF-lkp@intel.com>
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
CC: linux-rockchip@lists.infradead.org
TO: Jonas Karlman <jonas@kwiboo.se>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v6.17-armsoc/dts64
head:   7f9509791507bd2aa89281d999cf0c8ad659f93d
commit: 654df8e74dbc19ba0625051079e6889e6999d16e [27/34] arm64: dts: rockchip: Add power controller for RK3528
:::::: branch date: 18 hours ago
:::::: commit date: 3 days ago
config: arm64-randconfig-052-20250622 (https://download.01.org/0day-ci/archive/20250622/202506222031.kAqSmDQF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250622/202506222031.kAqSmDQF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506222031.kAqSmDQF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:205.6-1029.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/power-management@ff600000: failed to match any schema with compatible: ['rockchip,rk3528-pmu', 'syscon', 'simple-mfd']
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/power-management@ff600000/power-controller: failed to match any schema with compatible: ['rockchip,rk3528-power-controller']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
