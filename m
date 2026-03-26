Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD69D3A873C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774541872; cv=none; b=dSr+JF3ogZa5KE0yIjN2pjRrr9ZcjOo2M9rwMtKQjB68GeCAMFv18/B7LN8KBo1iHvX+K5HNX3aMTtfpZSpJknTX1dtcltlrv3eGmE94tPtK0AV1P1ajN47sJvqTlYfGDcLMge11MEHp0393UrB2Llusn8ERiDs4b4mNU1gAyTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774541872; c=relaxed/simple;
	bh=QBrsfWkKWmxj1NBXqbU/IpOLvZEzMMj0sVfH4cfkvQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cdC+o7/vhGxOJFVoR47HjwqosG0kp/JpskRxJjmUTMhGlvvIuCoiRn5dGGpjC8alzEFyS6amtzW5Bg7usy3uiwUEMABIUOTK8yDLXF0TjysRf6JDztpxdRSfGvQxR/J8uWuoKTMW0ZfI/Nu/JLr080+kJxvQTmTFgPB2bAWwTgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jfuiro3t; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jfuiro3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774541867; x=1806077867;
  h=date:from:to:cc:subject:message-id;
  bh=QBrsfWkKWmxj1NBXqbU/IpOLvZEzMMj0sVfH4cfkvQQ=;
  b=jfuiro3tZt4ZM9O8s/BLHwsSdO9dON2HRyrjpYpQWzwACLcEH/zee/s4
   8KuVftlXayoLrfSNX/WUcBLTwC1LM6iuqkOBst+p4efYMyJm8eIgYkDox
   Uli8dGEqVLnTbXmcNM7EWyOVALn9DB3owHuKQTMuiQ13T1zkYFM2XnfGl
   NhPfgsvUG8UlxsgI/GcrGDn0G1+c5Ec+Ngo/gUw7HQGpvuId6KsWESl0n
   1yV1N0ntyO/8WMXf3q20K/O4Y3ks961/0uTPR+6koBEU/1awlCj2fjbHc
   mDDkySEtsUlJ4GWRyUWik8zc9YqkGVwnvkSEk4ELDzf5pK6AWnzlXqI7o
   w==;
X-CSE-ConnectionGUID: JtwHMUN7T3eZ4kqDOWoYfA==
X-CSE-MsgGUID: fP+EB85jTWiOpAW94vyldw==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74634099"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="74634099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 09:17:45 -0700
X-CSE-ConnectionGUID: dLHemMIQQ167yxg4b3Oebg==
X-CSE-MsgGUID: XpQfnOOsQvmz9AOAxL97dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="225305604"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 26 Mar 2026 09:17:44 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5nOv-000000007Jy-2nkU;
	Thu, 26 Mar 2026 16:17:41 +0000
Date: Thu, 26 Mar 2026 17:16:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [rockchip:v7.1-armsoc/dts64 41/44]
 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: /soc/efuse@ffce0000:
 failed to match any schema with compatible: ['rockchip,rk3528-otp']
Message-ID: <202603261743.1sZZBWgh-lkp@intel.com>
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
TO: Jonas Karlman <jonas@kwiboo.se>
CC: Heiko Stuebner <heiko@sntech.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git v7.1-armsoc/dts64
head:   6cb4ec63ba9a5831621cf951b7af55c67beeb97b
commit: 8c2c73084bd10237a9bc8f1d5fd49fe3107e4562 [41/44] arm64: dts: rockchip: Enable OTP controller for RK3528
:::::: branch date: 17 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2051-20260325 (https://download.01.org/0day-ci/archive/20260326/202603261743.1sZZBWgh-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261743.1sZZBWgh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603261743.1sZZBWgh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1276.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dtb: /soc/efuse@ffce0000: failed to match any schema with compatible: ['rockchip,rk3528-otp']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1276.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dtb: /soc/efuse@ffce0000: failed to match any schema with compatible: ['rockchip,rk3528-otp']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1276.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dtb: /soc/efuse@ffce0000: failed to match any schema with compatible: ['rockchip,rk3528-otp']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1276.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dtb: /soc/efuse@ffce0000: failed to match any schema with compatible: ['rockchip,rk3528-otp']
--
   arch/arm64/boot/dts/rockchip/rk3528.dtsi:280.6-1276.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dtb: /soc/efuse@ffce0000: failed to match any schema with compatible: ['rockchip,rk3528-otp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
