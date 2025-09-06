Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A0F1CD2C
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Sep 2025 01:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757123864; cv=none; b=AgJLOw7jD8cg+98YyCtnKMfE7YyG8QwP0oOmO5XcRAWurRIwWUeFTECxxm+igYH164n0C9747PtVhEVY1CzNwLS4nRwG/LX05Sx+eh/1MflgnDDFUOr4EfhcWafNCKGLuoyfisTMod1bv38M1JdUh2DU7zBs0g+gAKn1iNCAXpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757123864; c=relaxed/simple;
	bh=DGtFNv6edEvXg+xEi1ozESc//bKOw058a/rJ5nMuwvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tf43g2sK+Ukm5yd28UuG4/EshyRnokqmU6ID5aHBLbPBIC0y+sOl+tFSUr5NFQLSuKG7TDr+ZZNFUSU4xBT7J3igZJ8K/hxjGaXKY6UEmTOjy6Olbe6jM2YsUq2qdC6acpm2vJmiGxvKt/tu7kFyhua/pO3I1q8qS9ir0+4PKVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8318W3E; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8318W3E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757123862; x=1788659862;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DGtFNv6edEvXg+xEi1ozESc//bKOw058a/rJ5nMuwvQ=;
  b=P8318W3EEnEKiM/dZyYCzAI3I3Bl59bm1M9yhttdRLd7XBOR2oEr9HD4
   u1NdvvIsZ+K4O3MozviZTiTjSofwoKQONayYUAodJ94lTtnotbbpymgC7
   IbWg8bTmcUyJNDd/RJ1MgeAq+a2vrhud3pU2AmYdOJnXth5fWV63mC/lE
   ReG9prq+YPaH4piS9jflCTaKtGjaYV59RLHK1XNcN1FdNNNkv4poNNR8O
   NufRDlgvwwXJ/65yn8KShMDY4dmVDxo4HgW2rHdQRRWm6JF1ErELJmslN
   0NHZyiIRi1/DG91/qdDndILaMO9TZsd1UfnHvzpmfUKHYqExY3HLgMUkZ
   Q==;
X-CSE-ConnectionGUID: ctiDTkRzSESbVNbdTQqzMg==
X-CSE-MsgGUID: xfNAVz0SSpOfyCxerRqD0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="69733672"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="69733672"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 18:57:41 -0700
X-CSE-ConnectionGUID: e5NJpM6qQ9S2z9OH6sj3lQ==
X-CSE-MsgGUID: JmSNf8mSQWmkYBMsygPF1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="176634693"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 05 Sep 2025 18:57:40 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuiBN-000181-2m;
	Sat, 06 Sep 2025 01:57:37 +0000
Date: Sat, 6 Sep 2025 09:56:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO
 to Retronix R-Car V4H Sparrow Hawk
Message-ID: <202509060900.fZNoMu7f-lkp@intel.com>
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
In-Reply-To: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
References: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
TO: Marek Vasut <marek.vasut+renesas@mailbox.org>
TO: linux-arm-kernel@lists.infradead.org
CC: Marek Vasut <marek.vasut+renesas@mailbox.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Rob Herring <robh@kernel.org>
CC: devicetree@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org

Hi Marek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on geert-renesas-devel/next]
[also build test WARNING on arm/for-next arm/fixes arm64/for-next/core kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master v6.17-rc4 next-20250905]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Marek-Vasut/arm64-dts-renesas-r8a779g3-Add-RPi-Display-2-DTO-to-Retronix-R-Car-V4H-Sparrow-Hawk/20250905-043036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git next
patch link:    https://lore.kernel.org/r/20250904202838.172579-1-marek.vasut%2Brenesas%40mailbox.org
patch subject: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO to Retronix R-Car V4H Sparrow Hawk
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20250905 (https://download.01.org/0day-ci/archive/20250906/202509060900.fZNoMu7f-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509060900.fZNoMu7f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509060900.fZNoMu7f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: touchscreen@5d (goodix,gt911): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: gpio@45 (raspberrypi,touchscreen-panel-regulator-v2): '#gpio-cells', '#pwm-cells', 'gpio-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: dsi-encoder@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: panel@0 (raspberrypi,dsi-5inch): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: panel@0 (raspberrypi,dsi-5inch): compatible:0: 'raspberrypi,dsi-5inch' is not one of ['ampire,am8001280g', 'bananapi,lhr050h41', 'feixin,k101-im2byl02', 'raspberrypi,dsi-7inch', 'startek,kd050hdfia020', 'tdo,tl050hdv35', 'wanchanglong,w552946aba']
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb: /soc/dsi-encoder@fed80000/panel@0: failed to match any schema with compatible: ['raspberrypi,dsi-5inch', 'ilitek,ili9881c']
--
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: touchscreen@5d (goodix,gt911): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/goodix.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: gpio@45 (raspberrypi,touchscreen-panel-regulator-v2): '#gpio-cells', '#pwm-cells', 'gpio-controller' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/raspberrypi,7inch-touchscreen-panel-regulator.yaml#
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: dsi-encoder@fed80000 (renesas,r8a779g0-dsi-csi2-tx): '#address-cells', '#size-cells', 'panel@0' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb: panel@0 (raspberrypi,dsi-7inch): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/ilitek,ili9881c.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
