Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732FC30BBB8
	for <oe-kbuild@lists.linux.dev>; Wed, 31 Dec 2025 03:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767153025; cv=none; b=CpZbtgl5qatZ+TUOXG5LZyydoPnTsZaA0H0UE4d0+mSeR7CIH3MM/Y2nKmQ0X0AvmV8X5V4Nnqu3XQfOc+Wst3KK4bzS2K2upLdKWjiDVLQfniPzo3MoIT4GXs3VtlsPffG7/3PVAN2zHzBCBBNnfSalF3+IDs2Ew5qYeuFrerw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767153025; c=relaxed/simple;
	bh=bEjWA9KwZi8MIsr4RejFnjxwl8yoC/XSAJDm2NAW7KE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nYsmLAJdto8+M6PS065sUIpd+ncKgApXbBXAt0jqoCqhSb6IJ38Kl2kkiyBt/Qq+dSRLQATmNNK067cUtfldGAQNVF4SGTC8mdUaTqCWKQsfcnqR3LaH9OIYALUMbORNg+VSZqyiV0L4YpOhwpg98dMtsyG8cRiZ88U0lF6NV2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/ZKRfOo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/ZKRfOo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767153023; x=1798689023;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bEjWA9KwZi8MIsr4RejFnjxwl8yoC/XSAJDm2NAW7KE=;
  b=W/ZKRfOoUkUQL89l+7HIYluK9xNOo7r7w5o2FcDcwMKlSJSpE0QKa9vM
   M71NuFcqekdoeZpOGhP222R7vz7OdDjtgAffC7+lsR+cHqTYumTsdnTsd
   wAOmedBKp/BEA3S5I3qy13QMBHHbi98mW42b2n9NifpXvq7wCPFr0RzQd
   kl7KvkAl0kzSIvdIVu4NzFzR+BtLlvdcJ+Bxufm1tI10Urh37KPWyz61m
   woojELZe7ZqytjGPeMJRPw47LTn3zipctIUhzOU6FdUrBMWnt6ga1Z+Kp
   s35gNwL46Nnv1WR4WyozQm+vwMrAkXiaDugsHDnD6KlW1RCgvondGIr63
   g==;
X-CSE-ConnectionGUID: WOBtxfQdRp+FqGYQ+Yhp6A==
X-CSE-MsgGUID: rjz++Y9uTTyL4nWTxsb9/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="79039042"
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="79039042"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 19:50:21 -0800
X-CSE-ConnectionGUID: /iIzpWKUQiOdHLEvC68T2Q==
X-CSE-MsgGUID: NCN7/6f7SgWQ0sji37Hidw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,190,1763452800"; 
   d="scan'208";a="205866132"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 30 Dec 2025 19:50:20 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vanE1-0000000085U-3eyr;
	Wed, 31 Dec 2025 03:50:17 +0000
Date: Wed, 31 Dec 2025 04:49:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 26/128]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l):
 Unevaluated properties are not allowed ('ti,sdout-zero-fill' was unexpected)
Message-ID: <202512310420.M4nvMJ8Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Martin Povišer" <povik+lin@cutebit.org>
CC: Janne Grunau <j@jannau.net>
CC: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: ffa9a2cdd88ecf105f265f98776f925b24f016ec [26/128] arm64: dts: apple: t8103*: Put in audio nodes
:::::: branch date: 8 days ago
:::::: commit date: 10 days ago
config: arm64-randconfig-2051-20251222 (https://download.01.org/0day-ci/archive/20251231/202512310420.M4nvMJ8Y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512310420.M4nvMJ8Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512310420.M4nvMJ8Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_address_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_address_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:105.14-114.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j274.dts:116.14-125.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('ti,sdout-zero-fill' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VD_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: codec@48 (cirrus,cs42l83): 'VL-supply' is a required property
--
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_address_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_address_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:237.14-247.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:249.14-258.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:488.26-492.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@32 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,pdm-slot-no', 'ti,sdout-pull-down' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VD_FILT-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: codec@48 (cirrus,cs42l83): 'VL-supply' is a required property
--
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:121.10-125.5: Warning (unit_address_vs_reg): /soc/usb@382280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-jxxx.dtsi:141.10-145.5: Warning (unit_address_vs_reg): /soc/usb@502280000/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:133.14-142.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:144.14-153.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@31 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): compatible: ['ti,tas5770l', 'ti,tas2770'] is too long
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@34 (ti,tas5770l): Unevaluated properties are not allowed ('SDZ-supply', 'ti,sdout-zero-fill' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/ti,tas2770.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): '#sound-dai-cells', 'sound-name-prefix' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VP-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs42l42.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: codec@48 (cirrus,cs42l83): 'VCP-supply' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
