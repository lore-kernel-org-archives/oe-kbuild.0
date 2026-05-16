Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5662B3D5227
	for <oe-kbuild@lists.linux.dev>; Sat, 16 May 2026 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778932711; cv=none; b=sSNxkyD+VFu5ckqOsjaPgohzjYUIaN/OZRWvLBz8cABX+KAE9gvZ/zGoyluFMBYMpiiqejr6gT9A2kG4m0JKx+0MlY0RZ4bqbc1yBoiOFo4oW4kgcZs8V0MkDHXH+0QDIQQoEbsntZ79s30oOJ4AdUSYePif5BVbUtFtap3kUlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778932711; c=relaxed/simple;
	bh=bInuUukF+Pre/2brZRm2BLfubilKlLylYX7i+lQLpVQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nfl79LU2LOnGKp5tzkPNb8hA/i2+NUGhNQJ6TOELMhI1y2ZDCAJtfxkGEPtzDCn1ljlzO+si1QglfYaooN1p9ciAO+vFEdv9vBX/gkf70KFjQhzLXmzanaUUj/KknWGuunM/VvqNTtHpGBjtLcoHXcM26khYL7d2iLFcb555z6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RWycG0eW; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RWycG0eW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778932711; x=1810468711;
  h=date:from:to:cc:subject:message-id;
  bh=bInuUukF+Pre/2brZRm2BLfubilKlLylYX7i+lQLpVQ=;
  b=RWycG0eWZgvmOiaBXq52CZJi8uQ9KeTWokXQFFiOFIdGcAyFcDICqnPV
   5iTLxcyPLhZZLuV8VXJr7Q+nos5XCmccNwbN0S65PJE2yB2hPcbr0K2yj
   Xd/LcS21n8JMZthU1MC70MAdhVEvgNvNto2reaMoHT+HdF8ovx3eG5KgS
   GExBAS4CibkDyYjvvvzITl1ufGH0hOPXkJ3K06lc+XjqUQHdqqTClwYTf
   w0KQZM7CLst/KxWxy4Zvi5PeuB8nddGTwo4ZLfdd+04o+vnPAO+CpMbmD
   C0JkJw1UBwxKiar1pSIOeG+dWz90COq0OhHiCOoedcGFGfc/TbtblhURj
   Q==;
X-CSE-ConnectionGUID: hJcMkiS1RMOqkdYJO8geuw==
X-CSE-MsgGUID: yj5rLSFWT62N9VDQobSJKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="83734516"
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="83734516"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2026 04:58:30 -0700
X-CSE-ConnectionGUID: jVrPI9yqSEuoaMT+q//sUA==
X-CSE-MsgGUID: FKXH4iiJTumqcz2rQuuvUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,238,1770624000"; 
   d="scan'208";a="277058613"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 16 May 2026 04:58:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wODf0-000000009Jt-1JMs;
	Sat, 16 May 2026 11:58:26 +0000
Date: Sat, 16 May 2026 13:57:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: mipi@21dc000
 (fsl,imx6-mipi-csi2): 'port' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^port@[1-4]$'
Message-ID: <202605161313.xlfhUAOW-lkp@intel.com>
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
TO: Frank Li <Frank.Li@nxp.com>
CC: Hans Verkuil <hverkuil@kernel.org>
CC: "Rob Herring (Arm)" <robh@kernel.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6916d5703ddf9a38f1f6c2cc793381a24ee914c6
commit: 48dbb76cef65fabaa3ac97461eda90495e954ecd dt-bindings: media: convert imx.txt to yaml format
date:   1 year ago
:::::: branch date: 12 hours ago
:::::: commit date: 1 year ago
config: arm-randconfig-2052-20260506 (https://download.01.org/0day-ci/archive/20260516/202605161313.xlfhUAOW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260516/202605161313.xlfhUAOW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 48dbb76cef65 ("dt-bindings: media: convert imx.txt to yaml format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605161313.xlfhUAOW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/imx/imx6qdl.dtsi:907.28-915.6: Warning (unique_unit_address_if_enabled): /soc/bus@2000000/iomuxc-gpr@20e0000: duplicate unit-address (also used in node /soc/bus@2000000/pinctrl@20e0000)
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /ldb: failed to match any schema with compatible: ['fsl,imx6q-ldb', 'fsl,imx53-ldb']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: iomuxc-gpr@20e0000 (fsl,imx6q-iomuxc-gpr): 'ipu1_csi0_mux', 'ipu2_csi1_mux' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/imx/fsl,imx-iomuxc-gpr.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: pcf8523@68 (nxp,pcf8523): $nodename:0: 'pcf8523@68' does not match '^rtc(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/rtc/nxp,pcf8523.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/bus@2100000/i2c@21a0000/tc358743@f: failed to match any schema with compatible: ['toshiba,tc358743']
>> arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: mipi@21dc000 (fsl,imx6-mipi-csi2): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$', '^port@[1-4]$'
   	from schema $id: http://devicetree.org/schemas/media/fsl,imx6-mipi-csi2.yaml
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/bus@2100000/vdoa@21e4000: failed to match any schema with compatible: ['fsl,imx6q-vdoa']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/ipu@2400000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /soc/ipu@2800000: failed to match any schema with compatible: ['fsl,imx6q-ipu']
   arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: /display-subsystem: failed to match any schema with compatible: ['fsl,imx-display-subsystem']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
