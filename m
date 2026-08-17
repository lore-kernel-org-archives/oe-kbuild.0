Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706EA3346A5
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 05:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786944092; cv=none; b=XfSjTEn8hfqGqPC6XCaQILLcOwss2a7pwG/QmscDrHsu5wBKmF7gw94vwdiKX6X6Ur9sBYxfj9NQ06LUFvI7Ipy99YveIjXgdO67mM4FQHMJBBXDnmcR86oGY9U9BbIG9sey71fswtl7YH7CnhIQWnbMQ+3HNpaQKvrlAssy6/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786944092; c=relaxed/simple;
	bh=AvVncg71gaVqqqPpf4od7zm+oygEElwndygwL+9qYwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OtG2pg7+f8s+WtiBWZd5rAAmPIYSpD0hxy2/9gF/9cjSGQJWC5VqVeKkApmqEMK4agyPMeOhMMauDdewUWCpNFmYJ8XXn08bxEM+ZF7MZ6y3sgirz+3m3uhVA3AcsETSSAa07HmCnWS0zolBmVPef986fHSdgwwTibgYwv4S2YA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C64f/XUn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C64f/XUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786944090; x=1818480090;
  h=date:from:to:cc:subject:message-id;
  bh=AvVncg71gaVqqqPpf4od7zm+oygEElwndygwL+9qYwE=;
  b=C64f/XUn3K7KOcOtZUBTv74AOEo7jFXdEi/iqpuvoSdYl+04vuHeyo20
   BMbaRI7GEYXHAhw4h6IE0b2nwU0wBeWt84cqZ/GUfnUP+wpW55zGANo64
   3yAYOjBJG3Fatp5ay9KH4JMJDcfKqxuZMGz6mQ+Dgv5NJJL+MTYKY+dCb
   zOR9JPdDIJQ4OpbVP8zjEkJYr/kmeEgMQInhTilmJU048UMUqxBPcGT01
   p6u2W2yfv4elD6uzXWBaRi3mpLoDYBWNKh5J0tvCPEtXu00M/mSQkuxw3
   OcYxy6wF+ATT3MNlD+StzVqcUWTvk7RCQ/Uwv5mVFSQxDX6O/XOS5462G
   Q==;
X-CSE-ConnectionGUID: JwQn2gnUTEGQp6wWuCOlKQ==
X-CSE-MsgGUID: fa4mLpSsRCmnNPMvHIlrGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98001081"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98001081"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 22:21:30 -0700
X-CSE-ConnectionGUID: lXSwWLpZQeGXk6KhchDyNw==
X-CSE-MsgGUID: ytwAWhSgRp6X0uu8TKsaCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="288282370"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 16 Aug 2026 22:21:29 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvpmo-000000006kv-477w;
	Mon, 17 Aug 2026 05:21:26 +0000
Date: Mon, 17 Aug 2026 07:20:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dtb:
 audio-codec@1a (realtek,rt5651): 'hp-det-gpios', 'spk-con-gpio' do not match
 any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202608170728.nuTnEYSp-lkp@intel.com>
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
head:   8d3ae59288f1e7d58d76558a6ee96d533bc5019f
commit: 35bffbe49dfd3395c65d76f14d773a1225f3489f ASoC: dt-bindings: Convert realtek,rt5651 to DT schema
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260817/202608170728.nuTnEYSp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170728.nuTnEYSp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35bffbe49dfd ("ASoC: dt-bindings: Convert realtek,rt5651 to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608170728.nuTnEYSp-lkp@intel.com/

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
