Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2E92E401
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 01:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778376638; cv=none; b=Nxx+dcKV16DywI/8hH54V5TVa4DLfa5ZgZyZEjP2NurG7HiJN9t7twIC7Xok7JGqDrIQKpIXIPW+w1Gt/rDhnaMiBZXeyjiY49wVlyLp58vfv3c9Kli65lzNl/K6EBeHNWrd19hV05pdqwIYD1M4IK9nJgA00kyaJ3VIxCwIlVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778376638; c=relaxed/simple;
	bh=/2eASN0B3XCFI0hX3iUR7iXq3psZrdlt/VpBFoTE42c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mLxBuEXzS+fioCmd0gvcEr+/PcZIF+HTyDM/1+XE7EocKneAQvrYY9jAY83tL89+6w4qHZiLk1QQ13MSCyZ9iBFBQPT+4pycJCja3Jv9ZFsXMfntTzkjutP3j/CzpDXiAVD8SjxZ6MbuKb0XXnKB21giEhDRcmP8fHKL4dSagx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YqL2kLed; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YqL2kLed"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778376637; x=1809912637;
  h=date:from:to:cc:subject:message-id;
  bh=/2eASN0B3XCFI0hX3iUR7iXq3psZrdlt/VpBFoTE42c=;
  b=YqL2kLedxAh8U4kVNNkT//ZuU9y345XjqmIlyB5N6E3pRHbI0ZoL8eeO
   94+FDuQGVsGkRbSihaxdlSez4PO0zEuqGda/1w7ebFDxcXgv8b6KHwPYI
   xMNnMdx4w+t9bPk5rUSRbKALkyfVIW5YJY26EmtyHv9iAX43oYiWSjYuH
   DqcI4r+pz8atcqmglhk7me/oVnFtxHPmOBxApgMHmgtq/pv202Tyc0sHn
   NGPHV38Ht5V2uGx7miNjtX9TRjG0NTTTeAJDZOwXBi3d0XYbhLDelCFwA
   B31Vja3OeqkLESZ6B/6K3G0h7ns9fdlnvTHnzVZCbArUmIA3S/G8zlic9
   Q==;
X-CSE-ConnectionGUID: wLMmtmPyS5CMPqr88BgNlA==
X-CSE-MsgGUID: rRVFQstnQByS+Is/67w39g==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="82925335"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="82925335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 18:30:36 -0700
X-CSE-ConnectionGUID: du6vX/PaSHiUf1LMmQMpDg==
X-CSE-MsgGUID: /BRKhj0/RVedHEgwcGlxiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="236278544"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 May 2026 18:30:36 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLt05-000000007c1-11jS;
	Sun, 10 May 2026 01:30:33 +0000
Date: Sun, 10 May 2026 03:30:32 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb:
 audio-codec@1a (realtek,rt5651): 'hp-det-gpios', 'spk-con-gpio' do not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202605100309.QA6hKHet-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1bfaee9d3351b9b32a99766bbfb1f5baed60ddef
commit: 35bffbe49dfd3395c65d76f14d773a1225f3489f ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
date:   4 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260510/202605100309.QA6hKHet-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100309.QA6hKHet-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35bffbe49dfd ("ASoC: dt-bindings: Convert realtek,rt5651 to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605100309.QA6hKHet-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:581.31-583.7: Warning (unit_address_vs_reg): /i2c@ff3d0000/typec-portc@22/ports/port@0/endpoint@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:906.7-913.4: Warning (graph_child_address): /usb@fe800000/usb@fe800000/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts:575.9-585.5: Warning (graph_child_address): /i2c@ff3d0000/typec-portc@22/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: audio-codec@1a (realtek,rt5651): 'hp-det-gpios', 'spk-con-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5651.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: typec-portc@22 (fcs,fusb302): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml
   arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/phy/rockchip,inno-usb2phy.yaml
--
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:530.26-564.4: Warning (unit_address_vs_reg): /usb@fe800000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/rockchip/rk3399-base.dtsi:566.26-600.4: Warning (unit_address_vs_reg): /usb@fe900000: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb: rt5651@1a (realtek,rt5651): 'hp-det-gpios', 'spk-con-gpio' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5651.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
