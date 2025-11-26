Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6768B26ED48
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 18:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764180750; cv=none; b=bKfIz80nP3um+zarWp7LJrjzL4IlNpnFyuVvNqFfUi2iZoL+ocQy8zvnYzO6I6ccF62QZeygn2Zf+byaWfbuf5ShvdSc/yvECbj6T17SyoaLbTJysjmsqQmohVJgtgIqkRLaGnbW349ab5/PcswphqQTJDAPLUPLJxeKi+9Qirw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764180750; c=relaxed/simple;
	bh=ZdaoWDzLFmJYVnurziPmN5dXFZinJSVc8pFKaqRk5mk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNo9PUwNJyePFaVPxSZnAwpHpVi44j1xV++axBh3RrA7uFC+ioWgK/Wm1bwToZuodX9ihSTkqwuezU3L7o/IsIL2MNFsTTfB/0XG2idiljoY85VKwHw53Njq++6gU7/VlSqoJpY1/ZtHvAhhITO8NCmWI+7Cf2lGXeCHeCiuGSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fx+kixlb; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fx+kixlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764180748; x=1795716748;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZdaoWDzLFmJYVnurziPmN5dXFZinJSVc8pFKaqRk5mk=;
  b=Fx+kixlbgHB3MFJlv99WqJbTEPJgbORGCwa5iw8o744h+6e1jcTDticw
   uRE2PXDWEqa5B5ocg7YF30shMnzbLvvtkaysUmJ1K+FoE6+fR9AHczs0F
   kD8hlJUxD/FUfUzOitFryfenhyjkratv43rYe0cs4lXb1UuSC2M6qMJV3
   guGPjuc+enfZi5wBCO+lYtruX85NeW8qgSQDEAd6mSJ6/wTXKWqjwuklZ
   8D8rqyxkx1KnQ/Kwohpz2irLANESVabv5IylMmCO0OLu7zTkCmh4qnYkZ
   K71HefdCU3TkEGU2YaPWOSUEMwddHaxoaKkmmGFJqWM3QuexTgfVSB1KY
   g==;
X-CSE-ConnectionGUID: axBeY/YjS5Om2l2koseE5A==
X-CSE-MsgGUID: v4BaaEBdT0aw+HQ4SVi1cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65413168"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="65413168"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 10:12:21 -0800
X-CSE-ConnectionGUID: NvtqWeb6TgCUJRsampKN6A==
X-CSE-MsgGUID: a7Z+qw/ATLaw+YYm9VrLxQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Nov 2025 10:12:20 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOK02-000000001Hx-1wKQ;
	Wed, 26 Nov 2025 18:12:18 +0000
Date: Wed, 26 Nov 2025 19:12:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2] arm64: dts: sprd: sc9860: Simplify clock nodes
Message-ID: <202511261907.7TQQIIa4-lkp@intel.com>
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
In-Reply-To: <20251124210031.767382-2-robh@kernel.org>
References: <20251124210031.767382-2-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next linus/master v6.18-rc7]
[cannot apply to next-20251126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm64-dts-sprd-sc9860-Simplify-clock-nodes/20251125-050326
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251124210031.767382-2-robh%40kernel.org
patch subject: [PATCH v2] arm64: dts: sprd: sc9860: Simplify clock nodes
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2053-20251125 (https://download.01.org/0day-ci/archive/20251126/202511261907.7TQQIIa4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261907.7TQQIIa4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511261907.7TQQIIa4-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@20210000 (sprd,sc9860-apahb-gate): False schema does not allow [[0, 539033600, 0, 65536]]
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@20210000 (sprd,sc9860-apahb-gate): 'sprd,syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@402b0000 (sprd,sc9860-pmu-gate): False schema does not allow [[0, 1076559872, 0, 65536]]
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@402b0000 (sprd,sc9860-pmu-gate): 'sprd,syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@402e0000 (sprd,sc9860-aon-gate): False schema does not allow [[0, 1076756480, 0, 65536]]
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@402e0000 (sprd,sc9860-aon-gate): 'sprd,syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@40400000 (sprd,sc9860-pll): False schema does not allow [[0, 1077936128, 0, 65536]]
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@40400000 (sprd,sc9860-pll): 'sprd,syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@415e0000 (sprd,sc9860-agcp-gate): False schema does not allow [[0, 1096679424, 0, 16777216]]
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@415e0000 (sprd,sc9860-agcp-gate): 'sprd,syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@61100000 (sprd,sc9860-vsp-gate): False schema does not allow [[0, 1628438528, 0, 65536]]
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@61100000 (sprd,sc9860-vsp-gate): 'sprd,syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@62100000 (sprd,sc9860-cam-gate): False schema does not allow [[0, 1645215744, 0, 65536]]
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@62100000 (sprd,sc9860-cam-gate): 'sprd,syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@63100000 (sprd,sc9860-disp-gate): False schema does not allow [[0, 1661992960, 0, 65536]]
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@63100000 (sprd,sc9860-disp-gate): 'sprd,syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@70b00000 (sprd,sc9860-apapb-gate): False schema does not allow [[0, 1890582528, 0, 262144]]
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: clock-controller@70b00000 (sprd,sc9860-apapb-gate): 'sprd,syscon' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/sprd,sc9860-clk.yaml
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-apb@70000000 (simple-bus): $nodename:0: 'ap-apb@70000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: ap-ahb (simple-bus): $nodename:0: 'ap-ahb' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: aon (simple-bus): $nodename:0: 'aon' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: pmic@0 (sprd,sc2731): fuel-gauge@a00: 'sprd,calib-resistance-micro-ohms' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/sprd,sc2731.yaml
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00 (sprd,sc2731-fgu): 'sprd,calib-resistance-micro-ohms' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
