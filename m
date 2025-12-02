Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E4328C00C
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 18:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764701742; cv=none; b=NxAgs3upepttVmBN2UWlIV5bb1GSypuv1BUbsQrVhBWXkfnaB10FrO00L/SDc+dVJsyFVKSOfRSRZ9mLSD/ouLUKlQS/0H6fLNSXar5pHVVERwcouNmnzQ8/53/9tWmL5auNIeiSVHSvG7JZfCWaXlSkR/55oG7OgBQwsIZmMFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764701742; c=relaxed/simple;
	bh=EC7swiyxi48viVOJY7w1qY52Q+TMN34zXTKg4xDQ33E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxhxKAIVjK/vLg2zUvRbTaJ/LAhHlzAGlzbHn6ZD8zQyJJuyHTwIx6EBok0IOBQPfoPud6ODkvUwIX0NklG7l6mjGLUIYZ5zv+Eyn4lGXGMLDjArtubZvt/umqJCc1zc7iC1M0WxX8v1clgRgdveGZ60SQzI18MBDobK8nRrLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmeAbkPs; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmeAbkPs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764701740; x=1796237740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EC7swiyxi48viVOJY7w1qY52Q+TMN34zXTKg4xDQ33E=;
  b=TmeAbkPsGn6IHhi6SnuQZo00OarnDwwAEZ3a4ub86zwKQG7B7MY99NGq
   1C5gUMw5cBNGV0NHpQxVRarTeo9dwhX7DjWxcYAuxQXxtACO9O6jUnHnR
   tD1wSTt16+YT9dgG7m0ZQcNfR3oAm0mBpmFYI6+GgpBNOFTj042/HtUKv
   uj3XKCFENCdBA2oof3bKKtbcIPGiViK0DSDYCFRvJKfKl9hPYbuNt4Lmj
   sS8HSrNKBBxSKrJEADYqxFwRmiTvbnQwxVgtt2R1DW1OQaPtSPHiKnxpf
   ynul1R8lsvnQPz0Hc65iL0Zr4r/kVXoXIBwOFy1rrXdl0sFuFcLyh9Hlw
   Q==;
X-CSE-ConnectionGUID: YAnD+o8kT36lZRPwqcRf4A==
X-CSE-MsgGUID: 0GtPk/o9QLyttchaFeNXYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66849350"
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="66849350"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 10:55:39 -0800
X-CSE-ConnectionGUID: ULDjE/JYSeiZhUES5FjrRg==
X-CSE-MsgGUID: TAzLhjJlRkizzGb/aIfdtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,243,1758610800"; 
   d="scan'208";a="199587285"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 02 Dec 2025 10:55:38 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQVXE-000000002xF-0CvI;
	Tue, 02 Dec 2025 18:55:36 +0000
Date: Tue, 2 Dec 2025 19:55:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: syscon@4007c000
 (nxp,s32-gpr): Unevaluated properties are not allowed ('#address-cells',
 '#size-cells' were unexpected)
Message-ID: <202512021902.ht9Tmzfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Dan-Carpenter/net-stmmac-s32-use-the-syscon-interface-PHY_INTF_SEL_RGMII/20251201-212016, commit: 19221b73033f25ce2ab5e2bae2229182bd01e50d"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dan Carpenter <error27@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Dan-Carpenter/net-stmmac-s32-use-the-syscon-interface-PHY_INTF_SEL_RGMII/20251201-212016
head:   19221b73033f25ce2ab5e2bae2229182bd01e50d
commit: 19221b73033f25ce2ab5e2bae2229182bd01e50d dts: s32g: Add GPR syscon region
date:   30 hours ago
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-2053-20251202 (https://download.01.org/0day-ci/archive/20251202/202512021902.ht9Tmzfn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021902.ht9Tmzfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021902.ht9Tmzfn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: syscon@4007c000 (nxp,s32-gpr): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: syscon@4007c000 (nxp,s32-gpr): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml
--
   arch/arm64/boot/dts/freescale/s32g3.dtsi:651.27-657.5: Warning (simple_bus_reg): /soc@0/watchdog@4020C000: simple-bus unit address format error, expected "4020c000"
   arch/arm64/boot/dts/freescale/s32g3.dtsi:871.27-877.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: syscon@4007c000 (nxp,s32-gpr): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
