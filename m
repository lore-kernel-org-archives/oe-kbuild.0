Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F49F323417
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 18:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778439472; cv=none; b=kqwmdpQFhpytPtUE6DHu6X+eqbxV2dMnLuk3YUoUuJfIyEvqUXSHTisSZqqZUAhr0f/o6X6eP0JdYZ5MNU6UW70Y8RSijPJgjcELp/ZzMhg3AeEhQgIJ+T6LckX29W7rk2fYmwEjEOkc0R8ckV6IxmUuuttwRCESaOtk0CVACng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778439472; c=relaxed/simple;
	bh=Hg7vcKnuB3QUjsLnZ3xXlruXOzjCbRENZXgMzmr8N8g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=emllpQbvINJSUOQQEzg0u8JBKG0R9sgjopwoaauKjgr6w/y1wkWBo8AUEogbIIbr/a6WvudFgyNI6T+NYlXfudkrGuzNQWNttdK4XJO92rsfmiAVYsZYrfL7KSWdIEm9X2ftbaqVXXvJgHHtAFpS7o0m5c7qqmUisNQzyd1WIBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHNC9Ic+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHNC9Ic+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778439470; x=1809975470;
  h=date:from:to:cc:subject:message-id;
  bh=Hg7vcKnuB3QUjsLnZ3xXlruXOzjCbRENZXgMzmr8N8g=;
  b=oHNC9Ic+0n3pBX7RnKd3zqjgDJDC6tzzZ1sfxe3yVAMAhFLoTtdSjrHq
   SZqhrlcZGk1bnaQxGeZZxXvlBDaENJxYuZeVt3WAMjqg/HfpizR3wBSvH
   QvJAuHgFyyLMQsDbVYS4vkN/z36JRIeoayFQ155Ch2ZUaihxgSug+mRti
   csoi8GhI1ImUk7Vocj05Gw63GqWGUetiuRu+kbZxWhOH931dE+prTNLIP
   zD0/inIZ6CL5WPi656px48iwvNgHrZ5+gSsAs6/+Yvd3lsJRYg86+PNoC
   exB6/EoGQzl9vgKFTlrr2onPX2r1WJbLIjzvqidz60EM+kl4Mq6RaKk1U
   g==;
X-CSE-ConnectionGUID: 8OgAmAuiSciIi2SaRbiouw==
X-CSE-MsgGUID: /24JPAIRStC9Zet3HDs6aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11782"; a="82952266"
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="82952266"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2026 11:57:48 -0700
X-CSE-ConnectionGUID: /8FvAOq9Sd662Ikus9A0jg==
X-CSE-MsgGUID: qTcBO7K9TsKlx+vSYFEckw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="236410307"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 10 May 2026 11:57:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wM9LV-000000007lR-03T8;
	Sun, 10 May 2026 18:57:45 +0000
Date: Sun, 10 May 2026 20:57:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/nxp/imx/imx6q-h100.dtb: mipi@21dc000
 (fsl,imx6-mipi-csi2): 'port' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^port@[1-4]$'
Message-ID: <202605102028.hmZmj9FU-lkp@intel.com>
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
head:   1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
commit: 48dbb76cef65fabaa3ac97461eda90495e954ecd dt-bindings: media: convert imx.txt to yaml format
date:   1 year ago
:::::: branch date: 24 hours ago
:::::: commit date: 1 year ago
config: arm-randconfig-2052-20260506 (https://download.01.org/0day-ci/archive/20260510/202605102028.hmZmj9FU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605102028.hmZmj9FU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 48dbb76cef65 ("dt-bindings: media: convert imx.txt to yaml format")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605102028.hmZmj9FU-lkp@intel.com/

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
