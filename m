Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72681E9905
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Aug 2025 14:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755442772; cv=none; b=ShOeyDyZ+CeTA6w6sB+pvyiD1CZ6ccimkN7UcGc4ns92LEcbONypowQWWbcdi8jDc7Od0Ij8pvXwtHT0Df7uWBFy6Vv7Z07EsPI+cEjNRAju9wI2iOm+GGYQPFm+Ao+D83vssyRi/X7JNG6/mbc/enLRzuB46bUBGglCP+rZt/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755442772; c=relaxed/simple;
	bh=6IM3g9ZWGHF/2gglBq9FX6EMvkFs9iFG/OgJ7eLqFQc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NaeeVm4RwamXiPFUukwKIkmSmrWBFl2I9lZwzJtHe5xC8YEDevnCOqzq/MF23uEn2iKK43o52DHxp0zdGD8esqWbfu6Jg6pFGoami76jvV9y2aTQRoTEvRwFdU1xaQPu0v+S3HhZ1rkY2PTadgRkUbO8GtPdtF2P59A6r/KPgxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aY7H3qCw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aY7H3qCw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755442770; x=1786978770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6IM3g9ZWGHF/2gglBq9FX6EMvkFs9iFG/OgJ7eLqFQc=;
  b=aY7H3qCwnC3h7cVddeNWrsShdcbBusZtOL0MwGgQ4i7mnfw0fxf2zD7f
   7CMJZz4xgAVCDEO2VBZzCB62347G0Fnk6lNRBGW1Lvv2nG2ZDjraKfsy/
   7lkxXq4KkrUOPPq62WCo5A3EfDHHQrFd7iRNL3MMyC7H+WJTSmOCIx/1c
   LrNa3wHJjhG/JfHfV9vZiXBC10mHEwwO9uDLpu8Fv9AFr5Wf0nAu4oDtP
   S2IQRVn0bHz7wPnGop+OkL7HdopNg4dYdQqg5S9me95fNpZQFiXtpKOXW
   uuvCH5k0f2UjAI1rsIZoS4hJW9RY7qhQ2VY5CQo04FDD6Yfyu51X6TCuH
   Q==;
X-CSE-ConnectionGUID: dT/VIusXRdO9mJG/JcKWjA==
X-CSE-MsgGUID: PZjvPF8rRoSQERMKAKKEmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57761441"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57761441"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 07:59:29 -0700
X-CSE-ConnectionGUID: T1tZJbaoQCyq7h0WGjbaZA==
X-CSE-MsgGUID: ldyQxrewQH2/9G6eUuMqSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166997525"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 17 Aug 2025 07:59:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uneqz-000DZ5-27;
	Sun, 17 Aug 2025 14:59:25 +0000
Date: Sun, 17 Aug 2025 22:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/7] arm64: dts: allwinner: a523: add third usb2 phy
Message-ID: <202508172218.ZXHddmGw-lkp@intel.com>
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
In-Reply-To: <20250816084700.569524-3-iuncuim@gmail.com>
References: <20250816084700.569524-3-iuncuim@gmail.com>
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
[also build test WARNING on clk/clk-next krzk/for-next krzk-dt/for-next linus/master v6.17-rc1 next-20250815]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/iuncuim/clk-sunxi-ng-a523-add-missing-usb-related-clocks/20250816-165044
base:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
patch link:    https://lore.kernel.org/r/20250816084700.569524-3-iuncuim%40gmail.com
patch subject: [PATCH 2/7] arm64: dts: allwinner: a523: add third usb2 phy
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-051-20250817 (https://download.01.org/0day-ci/archive/20250817/202508172218.ZXHddmGw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 93d24b6b7b148c47a2fa228a4ef31524fa1d9f3f)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250817/202508172218.ZXHddmGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508172218.ZXHddmGw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:105.6-698.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): clock-names: ['usb0_phy', 'usb1_phy', 'usb2_phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): clocks: [[5], [5], [2, 179]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun55i-a523-usb-phy'] is too short
   	'allwinner,sun55i-a523-usb-phy' is not one of ['allwinner,sun20i-d1-usb-phy', 'allwinner,sun50i-a64-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg: [[68158464, 256], [68163584, 256], [69208064, 256], [81788928, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg-names: ['phy_ctrl', 'pmu0', 'pmu1', 'pmu2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reset-names: ['usb0_reset', 'usb1_reset', 'usb2_reset'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): resets: [[2, 49], [2, 50], [2, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:105.6-698.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): clock-names: ['usb0_phy', 'usb1_phy', 'usb2_phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): clocks: [[5], [5], [2, 179]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun55i-a523-usb-phy'] is too short
   	'allwinner,sun55i-a523-usb-phy' is not one of ['allwinner,sun20i-d1-usb-phy', 'allwinner,sun50i-a64-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg: [[68158464, 256], [68163584, 256], [69208064, 256], [81788928, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg-names: ['phy_ctrl', 'pmu0', 'pmu1', 'pmu2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reset-names: ['usb0_reset', 'usb1_reset', 'usb2_reset'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): resets: [[2, 49], [2, 50], [2, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:105.6-698.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): clock-names: ['usb0_phy', 'usb1_phy', 'usb2_phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): clocks: [[5], [5], [2, 179]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun55i-a523-usb-phy'] is too short
   	'allwinner,sun55i-a523-usb-phy' is not one of ['allwinner,sun20i-d1-usb-phy', 'allwinner,sun50i-a64-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg: [[68158464, 256], [68163584, 256], [69208064, 256], [81788928, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg-names: ['phy_ctrl', 'pmu0', 'pmu1', 'pmu2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reset-names: ['usb0_reset', 'usb1_reset', 'usb2_reset'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): resets: [[2, 49], [2, 50], [2, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:105.6-698.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): clock-names: ['usb0_phy', 'usb1_phy', 'usb2_phy'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): clocks: [[5], [5], [2, 179]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['allwinner,sun55i-a523-usb-phy'] is too short
   	'allwinner,sun55i-a523-usb-phy' is not one of ['allwinner,sun20i-d1-usb-phy', 'allwinner,sun50i-a64-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg: [[68158464, 256], [68163584, 256], [69208064, 256], [81788928, 256]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reg-names: ['phy_ctrl', 'pmu0', 'pmu1', 'pmu2'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): reset-names: ['usb0_reset', 'usb1_reset', 'usb2_reset'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: phy@4100400 (allwinner,sun55i-a523-usb-phy): resets: [[2, 49], [2, 50], [2, 56]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/allwinner,sun50i-a64-usb-phy.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
