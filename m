Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A4413211C
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jul 2024 06:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720505469; cv=none; b=WBobXQBuV2Hg4EbQN2i2+/y763PGXXjeHg/L7V+0p+i6SYDhXresphI8Ir2OvD0jrvIf8KOg7puwvEnilZbM03CKsCkbm23P6PEoxu1CpRT+K8y9UrEC2CH7XisT5jihIISF9NzESVPdAorFDjpP9sZAwMXdkK03dk/CZbhwzqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720505469; c=relaxed/simple;
	bh=0F5nVVCLlbUrP8FcDoKRuX9/xCxKqlri85El///OZrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nODjLxBjvQaCj/IUMQmDhfflOHNEJJwlbJCpzCKbDEtXx6Yz9dLC2nqzK9QBwG0G1RseZ0TpjSTlEgTkjLoqqKAuIS7IEv4A75xqljoXmlNirREzHS/7GduwxcsYfpap2QUtMvnxCPAH9h8jxf+/8Rn7n0uNojdmcPUOqj+ZceY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RPsOIz1S; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RPsOIz1S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720505468; x=1752041468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0F5nVVCLlbUrP8FcDoKRuX9/xCxKqlri85El///OZrs=;
  b=RPsOIz1SaQG5uY+d6n/HtQ8ETZmW5PKtXvRxOuaUKU11V4tY3wtXIwFh
   FARrZ+1hZO91kZNMHndVG5sSRQ+hrBmfQtdGu1zhyqZM56AO5akjfZFTP
   9sgWXKSrXtuLdKAWp68HX1tafwnhfPHWNJimG7AMTVJ2/CEXSf17t9P64
   g3PyeQS9UnZgBQU13HlvBLWXjsiCL/u+wTAYku4A9iHL3K7NUSee+H4Pv
   JYGjE8gaxHuoHnKraPNKH3s8sI87qyB4JPKkXf5gMJl4tqbDL255CH4VE
   x5AOEnGwOgXrtHljEz5DfogZiJZjV3COJuAfIOro95rp+gtW0Ta92vyva
   g==;
X-CSE-ConnectionGUID: Bmb7MiLMTJK5smHrIxUCAw==
X-CSE-MsgGUID: yM992Gm/QRCo5aK7aQ15CQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="40247715"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="40247715"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2024 23:11:07 -0700
X-CSE-ConnectionGUID: rzY/TbXcTQi/TtOiPPj/jw==
X-CSE-MsgGUID: z1hbXN4eSsyyMDvipCB8Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="52069117"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 08 Jul 2024 23:11:06 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sR447-000WNV-2l;
	Tue, 09 Jul 2024 06:11:03 +0000
Date: Tue, 9 Jul 2024 14:10:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.6.y-cicd 10/14]
 arch/arm64/boot/dts/ti/k3-am69-sk.dtb: video-codec@4210000:
 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the
 regexes: 'pinctrl-[0-9]+'
Message-ID: <202407091451.m18kFgm6-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Brandon Brnich <b-brnich@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>
CC: Prasanth Babu Mantena <p-mantena@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y-cicd
head:   32fb3aae72f286cd0d023455b5fc9e4c6b9859f5
commit: da30ba548f0ef7a7451625cdc19375bc63abcba7 [10/14] arm64: dts: ti: k3-j784s4-main: Add OPP table to the VPU node
:::::: branch date: 8 hours ago
:::::: commit date: 9 hours ago
config: arm64-randconfig-051-20240709 (https://download.01.org/0day-ci/archive/20240709/202407091451.m18kFgm6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240709/202407091451.m18kFgm6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407091451.m18kFgm6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-am69-sk.dtb: video-codec@4210000: 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: video-codec@4220000: 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-am69-sk.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
--
   arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:2773.34-2782.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pinctrl@4301c068: 'wkup_gpio_pins_default' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: video-codec@4210000: 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: video-codec@4220000: 'operating-points-v2', 'opp-table', 'sram-size' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/cnm,wave521c.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: navss-sram@30000000: $nodename:0: 'navss-sram@30000000' does not match '^sram(@.*)?'
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/ti/k3-j784s4-evm.dtb: pinctrl@a40000: 'mcu-cpsw-cpts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
