Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC1D265623
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 15:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778339974; cv=none; b=JPGR0gkGNubYz6U7ld929hxxOBVUQM7h8BO9EY/l/2LMCDZMSfqHLVWa/o89rYT+6Hg+0r+aNiOzx+fNVWaq84lEAi2p7evPCT92bIMlzf1XsSDvhBTdgDdagK41yEslGB4pKRB+7eM93vs0GHAumrDgoYwsPuEgFOMazZAP1aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778339974; c=relaxed/simple;
	bh=NXLYui8cYEOqEvjbWfZC1enqZ/z99JsD0SnS+X/OYBk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kbO5O0JppxQ0poXEcKQCbrwhK3TI5ACguRINqx0jAlcGm8YMcHpn7Htu4IoYitvTas0bsuGxUCfuyySikx0lW9SPb/OEWxFqiQ3au7asb6s4IV41CnInAgwP5t1pEX5WxewYFPSSI0CsI1BtaIJNgSJ0n9oEguOQcE/H1My31IQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AlIjaLMO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AlIjaLMO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778339971; x=1809875971;
  h=date:from:to:cc:subject:message-id;
  bh=NXLYui8cYEOqEvjbWfZC1enqZ/z99JsD0SnS+X/OYBk=;
  b=AlIjaLMOJCWgVEq9wtn5wAKfmxfhI51kzHjm5vUni6Twklwl0cDBqoxB
   CqsT2sN5YG0KQ6FXY2/WBlodfFt/lggZWoZsIm0jhMNIGKFpHUNfb+TfG
   4D4CkfCG1GVY4wjMVBNRgm7eLxp3gBqc1TAWOkJSY+Fjac7CnkiLI5sin
   +6BiDo2acqyxuSPpaZAxFat5xi4yHGrHKEjV++iGqL/mf6ufpbnjP/Up2
   2hX4P9ZErcA5UTKtu/nBYclB9hRgdS4IO0IHFB/qx+zjG0tutiirsbGcL
   HXj4N5BGCz6UDvOuCp9ly+2GQ6PnNL5LxIowuYfI3vBOx2m3mnfuMF/W3
   A==;
X-CSE-ConnectionGUID: zDnhX3XARLiLfjFN9IsG2A==
X-CSE-MsgGUID: roXxrzGWRgaGx4NpNJI8ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="89602309"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="89602309"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 08:19:29 -0700
X-CSE-ConnectionGUID: ZtDxNGylTAG3sGXJXateNQ==
X-CSE-MsgGUID: IVhO5gqpQ9i5tu/jnAF37Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="241388241"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 09 May 2026 08:19:29 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLjSg-000000007Ur-1qhj;
	Sat, 09 May 2026 15:19:26 +0000
Date: Sat, 09 May 2026 17:19:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-tegra:for-6.20/arm64/dt-fixes 10/13]
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000
 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default-mode' does
 not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605091735.8CMvcqvR-lkp@intel.com>
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
CC: linux-tegra@vger.kernel.org
TO: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
CC: Thierry Reding <treding@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git for-6.20/arm64/dt-fixes
head:   3af055fcfce727b9c4a68a41a33e6fb9c3698ba3
commit: dfa93788dd8b2f9c59adf45ecf592082b1847b7b [10/13] arm64: tegra: smaug: Add usb-role-switch support
:::::: branch date: 3 months ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2055-20260506 (https://download.01.org/0day-ci/archive/20260509/202605091735.8CMvcqvR-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260509/202605091735.8CMvcqvR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605091735.8CMvcqvR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: tsec@54500000 (nvidia,tegra210-tsec): 'clock-names', 'reset-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra114-tsec.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /interrupt-controller@60004000: failed to match any schema with compatible: ['nvidia,tegra210-ictlr']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): '#interrupt-cells', 'fps', 'interrupt-controller', 'interrupts', 'pinmux', 'regulators' do not match any of the regexes: '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: pmic@3c (maxim,max77620): False schema does not allow [[60]]
   	from schema $id: http://devicetree.org/schemas/gpio/trivial-gpio.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra210-mc']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: external-memory-controller@7001b000 (nvidia,tegra210-emc): '#cooling-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra210-emc.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'role-switch-default-mode' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml
>> arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: padctl@7009f000 (nvidia,tegra210-xusb-padctl): ports:usb2-0: 'connector' is a dependency of 'usb-role-switch'
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra210-xusb-padctl.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra210-dfll']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: usb-phy@7d000000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra124-usb-phy', 'nvidia,tegra114-usb-phy']
   	'nvidia,tegra210-usb-phy' is not one of ['nvidia,tegra30-usb-phy', 'nvidia,tegra20-usb-phy']
   	from schema $id: http://devicetree.org/schemas/phy/nvidia,tegra20-usb-phy.yaml
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: /usb-phy@7d000000: failed to match any schema with compatible: ['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy']
   arch/arm64/boot/dts/nvidia/tegra210-smaug.dtb: usb-phy@7d004000 (nvidia,tegra210-usb-phy): compatible: 'oneOf' conditional failed, one must be fixed:
   	['nvidia,tegra210-usb-phy', 'nvidia,tegra30-usb-phy'] is too long

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
