Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795284889;
	b=O4Wte5AY71IZ88n7foNau5331mOhZnixRcFJnfjmgRwUssr61B/BCKLla5Qu9KRNkmUU
	 v14aFYscG0lLXBHkCldH1RfJlsoese8R7FV26L7+NnPqoYOv/kurlYjZmGfvpCoyqFOa3
	 XyCcRNAoTXVlBFZO9oxXRlYJkypLP21ofnwMXwhQ/BvoscfVMyc3wluBr55TRK81G4CwJ
	 FrdTqBccmiPSC5XRdMImFN2uSF1yvdWSkPk2NeXsDXK9cV/rVHkxkJwBo0w3oHJBv0B4q
	 Wgrk5WxGNQbX8GY9zMDTl2u6qbXC5Z3Q+2e+b+8bKmcfwwFDI+Qc1YaPfTcagYH8fbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795284889;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=5IH3VdNAilC4greWeShjIpBUQr8ejpoBnifZyyjbgxY=;
	b=iYsYC9ITLOwPwLKPFsoWKs78v8pIHpzG2fvnHKm14CXCtDqEyxmdN0t5waQ+CWIc8Nkv
	 2OnLKW4e1xbVbGdqZV42EDGLB3p6IKcQiFRrG3xzirDuvz2EVvogSv4XOc5LSlSVUNV78
	 OTn69cNMlTvyvEBPB+8eVY9JRlrgtkXjkV5PgJswmt6/bvj0PnAtf/e0E/CEKWcKbHYih
	 BgrjM76r/ELa2KkYVgHxftsZA6JgVrhQ61tTSTRgPPTk5Jt/CzMih5+1HI48Q9g4JhODz
	 mx0R64N7tvgaFhpS+9p/wOa26WaqKthsljIlEhyWj6uyndD6mfAg9GJe436J9Q9fvPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eqQWEwnY;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E1606A320
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Nov 2026 18:14:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 221E1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=eqQWEwnY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795284887; x=1826820887;
  h=date:from:to:cc:subject:message-id;
  bh=1NNxf6NGhYidpKqynZDJnEBZOFumoU88JelO2GRVhnQ=;
  b=eqQWEwnYChY7TviHMFEW/t8YGK/NuNIy/CvsS4YnyKD2T6Bb6pSID8sW
   MnMVPXCYyvEH3iKODVyo2rmeQ/v/dHg0PzGB2eSatYBGtfFTNUVX2QFob
   lrU7/xd7eZdcVcWcoeD/d9+w+RUCBWgJcvtMBKhZBDL3jmsV2kXZlfZsj
   unnfwzwvFIE9qeQM2vnYm1zTMD23Llcm6htTmkZjLNMtPYUcLRfUJMkeI
   GOjh2ngXQBT4u37FtxdZ1FnHsJNHAQJhB3MbwmVtHotw3e4u6Yl0qBtTX
   3plfvGwJgCcNHRoCadwU9DgVMdvKmGrwqcsOi0bWWGamB4rNEvukiDw8+
   Q==;
X-CSE-ConnectionGUID: bGcRGjF3RteqJuPrfiE8uA==
X-CSE-MsgGUID: so0s1TVVSsK/3ykkWipIoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4182874"
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="4182874"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2026 10:14:46 -0800
X-CSE-ConnectionGUID: 9/k8OeQnReS5GsO+ZkOfKg==
X-CSE-MsgGUID: oR7beUpdSeyeWAFtUokBVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,225,1787036400"; 
   d="scan'208";a="11273037"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 21 Nov 2026 10:14:45 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUpbl-000000004Mj-1LZQ;
	Sat, 21 Nov 2026 18:14:41 +0000
Date: Sat, 21 Nov 2026 19:14:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:b4/ux500-asoc-drop-vape 7/10]
 arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500):
 power-controller: 'ranges' is a required property
Message-ID: <20261121190821.XGMR64V5-lkp@intel.com>
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
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261121/20261121190821.XGMR64V5-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/20261121190821.XGMR64V5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261121190821.XGMR64V5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-snowball.dts:226.25-244.5: Warning (simple_bus_reg): /soc/regulator-gpio: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-snowball.dts:62.12-102.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm/boot/dts/st/ste-snowball.dtb: / (calaosystems,snowball-a9500): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-snowball.dtb: soc (stericsson,db8500): regulator-gpio: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-stuib.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
--
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: / (st-ericsson,mop500): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefprev60-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: / (st-ericsson,hrefv60+): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-stuib.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
--
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: / (st-ericsson,hrefv60+): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-hrefv60plus-tvk.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
--
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: / (st-ericsson,href520): thermistor@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: / (st-ericsson,href520): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
>> arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-href520-tvk.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-golden.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
--
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-janice.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-gavini.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:560.20-566.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: / (samsung,codina): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[24, 23, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[122]], 'phandle': 102} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:560.20-566.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: / (samsung,codina-tmo): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[24, 23, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[114]], 'phandle': 94} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-codina-tmo.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
--
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): dma-controller@801C0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc: failed to match any schema with compatible: ['stericsson,db8500', 'simple-bus']
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc/backupram@80150000: failed to match any schema with compatible: ['ste,dbx500-backupram']
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e000 (stericsson,db8500-gpio): compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio'] is too long
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: /soc/gpio@8012e000: failed to match any schema with compatible: ['stericsson,db8500-gpio', 'st,nomadik-gpio']
   arch/arm/boot/dts/st/ste-ux500-samsung-skomer.dtb: gpio@8012e080 (stericsson,db8500-gpio): compatible:0: 'stericsson,db8500-gpio' is not one of ['st,nomadik-gpio', 'mobileye,eyeq5-gpio']
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
--
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:346.32-349.5: Warning (simple_bus_reg): /soc/power-controller: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:351.10-389.5: Warning (simple_bus_reg): /soc/clocks: simple-bus unit address format error, expected "8012f000"
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:560.20-566.5: Warning (simple_bus_reg): /soc/pinctrl: missing or empty reg/ranges property
   arch/arm/boot/dts/st/ste-dbx5x0.dtsi:605.32-616.5: Warning (simple_bus_reg): /soc/dma-controller@801C0000: simple-bus unit address format error, expected "801c0000"
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: / (samsung,kyle): regulator-gpio: {'compatible': ['regulator-fixed'], 'gpios': [[24, 23, 0]], 'enable-active-high': True, 'regulator-name': ['sd-level-translator'], 'regulator-min-microvolt': [[2900000]], 'regulator-max-microvolt': [[2900000]], 'regulator-type': ['voltage'], 'startup-delay-us': [200], 'pinctrl-names': ['default'], 'pinctrl-0': [[121]], 'phandle': 98} is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-consumer.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: thermal-zones: cpu-thermal:cooling-maps: 'contribution', 'cooling-device', 'trip' do not match any of the regexes: '^map[-a-zA-Z0-9]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml
>> arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): power-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): pmu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): cache-controller: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/st/ste-ux500-samsung-kyle.dtb: soc (stericsson,db8500): pinctrl: 'ranges' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
