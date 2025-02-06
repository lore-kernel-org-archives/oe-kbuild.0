Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1785D1487F8
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Feb 2025 03:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738812502; cv=none; b=ariB+CMrNKSkbo4WP6mzyNQpf5knvDTyp7oFxyW/6/5Nudo08yMCXUfqgaIomxzybvUX0jZkLbZNpWfdEiBN2EMKFTWn0/DleXUrJoxDTjmsqx4oaydXcWFeeUsgGUzSti8w9mWj5JlHFbQW5kM8+gDS/wthrkx3aJ/BMJlsFmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738812502; c=relaxed/simple;
	bh=LrGxjXDdqk7U3cT0/PYKwMqAu01jEy5TPy+iYu2641c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HV/si/B1LqCE5hBx4Nw0psS97KyUCwKBxBcEEFR8d+lom/NhTvj4OyT/6PdBqlK7UWYOLEUUgUvT8s44/fGp9wQGAw7DvlBx1E0vg6orqUmtyouVThcwI/LPaZR3mvy5DQxNZwYzDKwOlINBldYR8kLdWMYLsNScZvIpiKv0s6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hfdST5DU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hfdST5DU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738812500; x=1770348500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LrGxjXDdqk7U3cT0/PYKwMqAu01jEy5TPy+iYu2641c=;
  b=hfdST5DUfOowXldU7GvZ4tSTcieJdjJ6gnuZfQcBJemOPbAFPCrHaGiE
   lR3BwwBsy44OqBbIP6KiMaXHYjQzu4EEJ0vy6tG1fAladhjxM3Cjy+Gvu
   C7hNEh9QAB1hZy4nEnUHjGfy+HQgGZ842r+aWft3jwXaszVdz+m9PRR9m
   BHpcd2hJUsexWJhT2BDDg/DNEC+k7mUU1LCOSpjUau6XgavBH0f96GS4A
   f2uNJUBABm+pZnQBp1rPUgKbBTVBW542vAmXW5ULGLNw3kVhL7VChANLQ
   29RqHhL2pSxprklLP4RUr3urMRAPS+9BGxoacpqPZ1MmTlsYfaHZHbYlz
   w==;
X-CSE-ConnectionGUID: Kz83rjtsSACbbpsOppHOTw==
X-CSE-MsgGUID: b0BPTyNaTMytDCwnnxDKYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="64756504"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; 
   d="scan'208";a="64756504"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 19:28:19 -0800
X-CSE-ConnectionGUID: NgiVew6tTvyx5i606cXLuQ==
X-CSE-MsgGUID: q5Oyc9uNRea5uxphdwvEpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141965993"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Feb 2025 19:28:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfsYq-000wPD-0Z;
	Thu, 06 Feb 2025 03:28:16 +0000
Date: Thu, 6 Feb 2025 11:27:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] dt-bindings: net: smsc,lan9115: Ensure all
 properties are defined
Message-ID: <202502061125.b9rs1jzf-lkp@intel.com>
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
In-Reply-To: <20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
References: <20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Marek Vasut <marex@denx.de>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: Andrew Lunn <andrew+netdev@lunn.ch>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Shawn Guo <shawnguo@kernel.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-samsung-soc@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2014c95afecee3e76ca4a56956a936e23283f05b]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/dt-bindings-memory-controllers-Move-qcom-ebi2-from-bindings-bus/20250204-053216
base:   2014c95afecee3e76ca4a56956a936e23283f05b
patch link:    https://lore.kernel.org/r/20250203-dt-lan9115-fix-v1-4-eb35389a7365%40kernel.org
patch subject: [PATCH 4/4] dt-bindings: net: smsc,lan9115: Ensure all properties are defined
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-053-20250204 (https://download.01.org/0day-ci/archive/20250206/202502061125.b9rs1jzf-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250206/202502061125.b9rs1jzf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502061125.b9rs1jzf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/arm-realview-eb.dts:51.39-58.5: Warning (simple_bus_reg): /soc/interrupt-controller@10040000: simple-bus unit address format error, expected "10041000"
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: flash0@40000000: $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: flash1@44000000: $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: ethernet@4e000000: reg-io-width: 7 is not one of [2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: ethernet@4e000000: Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: bridge: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: fpga: $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: mmcsd@10005000: $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-bbrevd.dtb: mmcsd@10005000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: flash0@40000000: $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: flash1@44000000: $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: ethernet@4e000000: reg-io-width: 7 is not one of [2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: ethernet@4e000000: Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: bridge: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: fpga: $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: mmcsd@10005000: $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: mmcsd@10005000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd.dtb: clcd@10020000: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: flash0@40000000: $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: flash1@44000000: $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: ethernet@4e000000: reg-io-width: 7 is not one of [2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: ethernet@4e000000: Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: bridge: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: fpga: $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: mmcsd@10005000: $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: mmcsd@10005000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-11mp-bbrevd-ctrevb.dtb: clcd@10020000: 'oneOf' conditional failed, one must be fixed:
--
   arch/arm/boot/dts/arm/arm-realview-eb.dtsi:114.9-139.4: Warning (avoid_unnecessary_addr_size): /bridge: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: /: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: flash0@40000000: $nodename:0: 'flash0@40000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: flash1@44000000: $nodename:0: 'flash1@44000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: ethernet@4e000000: reg-io-width: 7 is not one of [2, 4]
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
>> arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: ethernet@4e000000: Unevaluated properties are not allowed ('reg-io-width' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/smsc,lan9115.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: bridge: '#address-cells', '#size-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: fpga: $nodename:0: 'fpga' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: mmcsd@10005000: $nodename:0: 'mmcsd@10005000' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: mmcsd@10005000: Unevaluated properties are not allowed ('bus-width', 'cap-mmc-highspeed', 'cap-sd-highspeed', 'cd-gpios', 'max-frequency', 'vmmc-supply', 'wp-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arm,pl18x.yaml#
   arch/arm/boot/dts/arm/arm-realview-eb-a9mp-bbrevd.dtb: clcd@10020000: 'oneOf' conditional failed, one must be fixed:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
