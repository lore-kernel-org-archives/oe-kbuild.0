Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C11AC44D
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Apr 2026 04:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777437433; cv=none; b=Ys0Qcq1lPbLTQeJOfCHKCu68h8EKocKmBbzer/Wf0o6AFMeg8Bk2C26gnZUfJxZlHRpWVh7mqJAFO+RheXc1Kaul0fnQSlQXTxuWfd4EYwKcrnYD1emAk9pwt2J88Dy1p3fPS+qUgYwWfwUu5FpWaiWohUzKghaqoUvg0EkdHSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777437433; c=relaxed/simple;
	bh=/8iyWC1ex1G+5J33BOi/NfOFKrzJOHA0NN9jh8+cI9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZDstje8OfDg6GZnFhZJ8PCW7vYPHFBxgDqd1DBZOQU2FOeocy/VXMJXDUDmlGkNPKwM5+CCPUPvewaJkLeGr9mbiUNsZ6nyewPfeBC9dKndzcKBeY1291PUfJc2chGj6mFqr8+oKeDexC4Wj8aiHetoMUpXdFiMeaQdx5Jav1aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V0SzPVAe; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V0SzPVAe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777437430; x=1808973430;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/8iyWC1ex1G+5J33BOi/NfOFKrzJOHA0NN9jh8+cI9s=;
  b=V0SzPVAeD/36RjI6V9jy2HIKWTFx8kh19KexvHywrvafG1yDnoFUeGaH
   9imsu/t5U5XR9lzq3fpPjyxf0Jw1YUwtqpko7uBKRVLmMEb0q4QoMI5pj
   7zPTaA6owKhua9YtxiNnJrKierNTrGL5mTI7fMOu1hN8ZXcJ18ZS+Xqn4
   O9jCHH0c42ao2QKlOFzrSOTwQJhJ2sdl80cbxFZwgNROtB6UsaUXRkPl8
   SgzYVeVfwHQjr238SBXeufddFcDAIIdKfZdhNg7bPMPBoYcCXYmT/eD0h
   DnVZoPhEreMVXb8D/aeeeLGfU0U4YEecycCqkMdGWhswkqlg5Hp9k7lZ+
   w==;
X-CSE-ConnectionGUID: dmgnPadjS/iwPHelAobI4g==
X-CSE-MsgGUID: mSNDEE+ATm+kK0puuqyYcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11770"; a="89822287"
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="89822287"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 21:37:10 -0700
X-CSE-ConnectionGUID: PCA4hTrOTYa0yPy6dCHsgg==
X-CSE-MsgGUID: NR+qK+ZrTTGqsB3XHwyDzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,205,1770624000"; 
   d="scan'208";a="233295297"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 28 Apr 2026 21:37:08 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wHwfa-000000004Qb-2M83;
	Wed, 29 Apr 2026 04:37:06 +0000
Date: Wed, 29 Apr 2026 06:36:17 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: regulator: fcs,fan53555: Remove vsel-gpios
 property
Message-ID: <202604290615.CYOrEHC0-lkp@intel.com>
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
In-Reply-To: <20260427115443.3224840-1-eagle.alexander923@gmail.com>
References: <20260427115443.3224840-1-eagle.alexander923@gmail.com>
TO: Alexander Shiyan <eagle.alexander923@gmail.com>
TO: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Liam Girdwood <lgirdwood@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Alexander Shiyan <eagle.alexander923@gmail.com>

Hi Alexander,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-regulator/for-next]
[also build test WARNING on linus/master v7.1-rc1 next-20260428]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexander-Shiyan/dt-bindings-regulator-fcs-fan53555-Remove-vsel-gpios-property/20260427-225229
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20260427115443.3224840-1-eagle.alexander923%40gmail.com
patch subject: [PATCH] dt-bindings: regulator: fcs,fan53555: Remove vsel-gpios property
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260427 (https://download.01.org/0day-ci/archive/20260429/202604290615.CYOrEHC0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260429/202604290615.CYOrEHC0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604290615.CYOrEHC0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mq.dtsi:1247.27-1297.6: Warning (avoid_unnecessary_addr_size): /soc@0/bus@30800000/dsi@30a00000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: regulator@60 (fcs,fan53555): Unevaluated properties are not allowed ('vsel-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: regulator@60 (fcs,fan53555): Unevaluated properties are not allowed ('vsel-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml
>> arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dtb: regulator@60 (fcs,fan53555): Unevaluated properties are not allowed ('vsel-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: regulator@10 (tcs,tcs4525): Unevaluated properties are not allowed ('vsel-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dtb: regulator@1c (tcs,tcs4525): Unevaluated properties are not allowed ('vsel-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: usb@fe800000 (rockchip,rk3399-dwc3): 'extcon' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@'
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,rk3399-dwc3.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: regulator@40 (silergy,syr827): Unevaluated properties are not allowed ('vsel-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml
>> arch/arm64/boot/dts/rockchip/rk3399-rock-4c-plus.dtb: regulator@41 (silergy,syr828): Unevaluated properties are not allowed ('vsel-gpios' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/fcs,fan53555.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
