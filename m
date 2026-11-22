Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795371244;
	b=yts2Z9MTZotUu8vLa+P54KfKJkEBw2yESziSsaQFMbCNZhXMpk6XLc0CphXxlD9WCtJL
	 RJWolDPEBDdsU/noY0K3V/OMcGtixysSAGrvI61NLkAijst1izxbrVVvdpbLT/psTLPcd
	 dka+rMckWYR4BipDGog+TJZo2vadu9EQ+3rE7A1ChkxFWA78nxrLCfZCj6txa4zw0MbiH
	 A4QcXyzHQrpwNLwKn/JktHHUFHOOLJcnPYGG9yVnuUf215Go3V1nHYUdPaO7RTRgA8L58
	 73Sr+tR7fLSeVWPewL1S2bjRE6SmrZzPjQt1Zw/cawXr8FcVHFwPCTHiSloF7HkQb1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795371244;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WVSG4P+m/ensmVnv44yoGDF4pWJ6GHhyMA1zSGrT684=;
	b=olGERmT2+JhoHN9g2J8rlD11AQmFg6vlXjmSSSELAaUMstBRXb9P4lbmLAkFfxuESPEE
	 uVBjx4hXqUHxV8XYTPaCdST8P91SLAbM01pUalDrd9U0qhFK8sIgvPHrTjI+p2ZV/Pekl
	 +QoNHIJnKJ52lw8OBUSKmh4QP6sqbpUe3hQQR6ks/ulc1nBjWWAOZC7zyXpOotiqY/LXy
	 3qL6bKUgq2N1tt9grje8dgvp59kW6/gJaxQVJdJ2+XIs2nzPXrosi/hN6RX0go14BQyra
	 M2M7kFWvAtnbInaomKoayE9ENNJ1X9S1IgGi0qnLOphO8pWtQOAQ6jF/bQu52vB4Cfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Au/F0aiF";
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63838606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 18:14:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63838606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Au/F0aiF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795371244; x=1826907244;
  h=date:from:to:cc:subject:message-id;
  bh=ciB4rM3CW4qYtQPmDDtvRfUtdKYaYQAq5w5IgS7Ff1s=;
  b=Au/F0aiFRpXNMn1scQRZJSb4DDkaca3D02Xn66DuJ9aJHOrDmdDpRaaV
   VTYXqOW2MRJLNyJA5NhzJ+ErHHApyT7PRI0I6IUZtSG+TUtkhNEPxfLxc
   dJa+WxG2+D0ngJxyKZ+Vgseqtc+GFsRN0eK2PuT7tYTPYyO4m/qHNPZUt
   UXKiUKS1ueOb5WBbbzhPcErZlxD+uiwMFWgJ2AIjzIYf5z3glZsPDpHuA
   uFZKoUMRgTShKnRWcJchRO1Xhs3bKJkkJsxe11kmos9Kcub7kGEC5ELbm
   Q+wG/pGw035yKQKkIJGJYfp7Hj3JII/KMCA5rYd1D7GSEOcen/X1QlBn3
   Q==;
X-CSE-ConnectionGUID: 3wnUuKDPTei5aKczsv7I1g==
X-CSE-MsgGUID: wr+hSXTJSg6JoDaZeKvB2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4075751"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4075751"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 10:14:03 -0800
X-CSE-ConnectionGUID: nTt+ZT8vTOmmyITLZ+kZjA==
X-CSE-MsgGUID: hYIU+4jYSLunzZgeJkud+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11210900"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 22 Nov 2026 10:14:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVC4d-000000004ac-0nRc;
	Sun, 22 Nov 2026 18:13:59 +0000
Date: Sun, 22 Nov 2026 19:13:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:b4/ux500-asoc-drop-vape 7/10]
 arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500):
 power-controller: 'ranges' is a required property
Message-ID: <20261122190537.01EMyVYm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-asoc-drop-vape
head:   dffa834f5df342fa0e28bed04778e0809e51ca0d
commit: 960473d7ce054df17f2aa5423feb3d1096f61797 [7/10] ARM: dts: ux500: Rename power domains node
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261122/20261122190537.01EMyVYm-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122190537.01EMyVYm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122190537.01EMyVYm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-snowball.dtb: / (calaosystems,snowball-a9500): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): regulator-gpio: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-hrefprev60.dtsi:12.12-16.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: / (st-ericsson,mop500): regulator-gpio: {'compatible': ['regulator-gpio'], 'regulator-min-microvolt': [[1800000]], 'regulator-max-microvolt': [[2900000]], 'regulator-name': ['mmci-reg'], 'regulator-type': ['voltage'], 'startup-delay-us': [100], 'states': [[1800000, 1], [2900000, 0]], 'gpios': [[117, 18, 0]], 'enable-gpios': [[117, 17, 0]], 'enable-active-high': True, 'phandle': 126} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: / (st-ericsson,mop500): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): Unevaluated properties are not allowed ('gpio-line-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
--
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: / (st-ericsson,hrefv60+): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
--
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: / (st-ericsson,href520): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
--
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
--
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:346.32-349.5: Warning (simple_bus_reg): /soc/power-controller: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:351.10-389.5: Warning (simple_bus_reg): /soc/clocks: simple-bus unit address format error, expected "8012f000"
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:560.20-566.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: / (samsung,codina): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[24, 23, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[122]], 'phandle': 102} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: / (samsung,skomer): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[24, 23, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[121]], 'phandle': 98} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:560.20-566.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: / (samsung,kyle): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[24, 23, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[121]], 'phandle': 98} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
