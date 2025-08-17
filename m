Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8819918B0F
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 19:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755460653; cv=none; b=eU2bLnu/x7A/LXAc1XCiZ1/EyUKo7tVa3Q3BUAQhMFRG1uEbXcOAz70mwh1vFRcy4AS9zaMJdMiSV+wev74sW0FMY9RefuphM8/JShj0xa4x4CvOyaRfLQRbQ7IdjYCX/iGjHAS4ZkRGXq2BjlHttspDLscbqQwI9bcTS1sC70I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755460653; c=relaxed/simple;
	bh=xAYEsnAWGJIVz3JhC7hKD7FsovloO8ciY9piBXrYq7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5ZF2MnEm5pVYakkDBdcERkytm46eNHZzDu9/XEXkpsjbLfiJm8+H5xepiKK/2KOpZtCAc4J6+tk3ALCuWaNPKFxUR97Bv7f2jv+AXRt9OSAP4ZnsMd1JVjPVc9e1yEKCzWI+GNhCjIQAZZrlVkNx7hO0L0cV6rg/lfhrphbA88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RVPu2T6U; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RVPu2T6U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755460651; x=1786996651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xAYEsnAWGJIVz3JhC7hKD7FsovloO8ciY9piBXrYq7I=;
  b=RVPu2T6UIkcC9tEz2KLzDJoLAOuBAej+lIfX1ulf92DQtCG1/udDtbW7
   qqrHx1DY8FNZeuyjaLIWMluDjnkHG8mIzCgeVWx+gmBOCYexUU+vAw8oQ
   M40rU/g8gcZ+xaXa2r3DP/QCeLb4KYIEjq6yPnV+reZzOSrsuBcLpe7mw
   d8oyo1m/U0XvOZsaxYFI3SiqfJgRnY1/jjNUBlTbK8w0tWiLdKuRGMCGN
   y8gchb4NWgminIhxV+TKZRm8/QKyf0sp1EnTcqGgEfGEWs8kMjOs9jx1i
   x6RYxOky5IbPsO1TBysOlU/6S4l6xezmdkgUXF0gNewV7mIh/QxC6G38Y
   A==;
X-CSE-ConnectionGUID: p/B8LMhiRoag/cdz5KI79w==
X-CSE-MsgGUID: BTb3VBJpTY6tK0w+05v+rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="56716953"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="56716953"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 12:57:30 -0700
X-CSE-ConnectionGUID: JPGNXgfxRemYof+ImAvHbg==
X-CSE-MsgGUID: pYoWLWNnR9mSdZobU0xfhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166586035"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Aug 2025 12:57:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unjV4-000DhX-1l;
	Sun, 17 Aug 2025 19:57:09 +0000
Date: Mon, 18 Aug 2025 03:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/7] arm64: dts: allwinner: a523: add USB3.0 phy node
Message-ID: <202508180339.vYWvL98c-lkp@intel.com>
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
In-Reply-To: <20250816084700.569524-6-iuncuim@gmail.com>
References: <20250816084700.569524-6-iuncuim@gmail.com>
TO: iuncuim <iuncuim@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Andre Przywara <andre.przywara@arm.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Vinod Koul <vkoul@kernel.org>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-phy@lists.infradead.org
CC: linux-clk@vger.kernel.org
CC: linux-sunxi@lists.linux.dev

Hi iuncuim,

kernel test robot noticed the following build warnings:

[auto build test WARNING on sunxi/sunxi/for-next]
[also build test WARNING on clk/clk-next krzk/for-next linus/master v6.17-rc1 next-20250815]
[cannot apply to krzk-dt/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/iuncuim/clk-sunxi-ng-a523-add-missing-usb-related-clocks/20250816-165044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250816084700.569524-6-iuncuim%40gmail.com
patch subject: [PATCH 5/7] arm64: dts: allwinner: a523: add USB3.0 phy node
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: arm64-randconfig-051-20250817 (https://download.01.org/0day-ci/archive/20250818/202508180339.vYWvL98c-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180339.vYWvL98c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508180339.vYWvL98c-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'allwinner,sun55i-a523-usb-phy' is not one of ['allwinner,sun20i-d1-usb-phy', 'allwinner,sun50i-a64-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg: [[68158464, 256], [68163584, 256], [69208064, 256], [81788928, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg-names: ['phy_ctrl', 'pmu0', 'pmu1', 'pmu2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reset-names: ['usb0_reset', 'usb1_reset', 'usb2_reset'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): resets: [[2, 49], [2, 50], [2, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: /soc/phy@4f00000: failed to match any schema with compatible: ['allwinner,sun55i-a523-usb3-pcie-phy']
--
   	'allwinner,sun55i-a523-usb-phy' is not one of ['allwinner,sun20i-d1-usb-phy', 'allwinner,sun50i-a64-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg: [[68158464, 256], [68163584, 256], [69208064, 256], [81788928, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg-names: ['phy_ctrl', 'pmu0', 'pmu1', 'pmu2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reset-names: ['usb0_reset', 'usb1_reset', 'usb2_reset'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): resets: [[2, 49], [2, 50], [2, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: /soc/phy@4f00000: failed to match any schema with compatible: ['allwinner,sun55i-a523-usb3-pcie-phy']
--
   	'allwinner,sun55i-a523-usb-phy' is not one of ['allwinner,sun20i-d1-usb-phy', 'allwinner,sun50i-a64-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg: [[68158464, 256], [68163584, 256], [69208064, 256], [81788928, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg-names: ['phy_ctrl', 'pmu0', 'pmu1', 'pmu2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reset-names: ['usb0_reset', 'usb1_reset', 'usb2_reset'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): resets: [[2, 49], [2, 50], [2, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: /soc/phy@4f00000: failed to match any schema with compatible: ['allwinner,sun55i-a523-usb3-pcie-phy']
--
   	'allwinner,sun55i-a523-usb-phy' is not one of ['allwinner,sun20i-d1-usb-phy', 'allwinner,sun50i-a64-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg: [[68158464, 256], [68163584, 256], [69208064, 256], [81788928, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg-names: ['phy_ctrl', 'pmu0', 'pmu1', 'pmu2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reset-names: ['usb0_reset', 'usb1_reset', 'usb2_reset'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
   arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): resets: [[2, 49], [2, 50], [2, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: /soc/phy@4f00000: failed to match any schema with compatible: ['allwinner,sun55i-a523-usb3-pcie-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
