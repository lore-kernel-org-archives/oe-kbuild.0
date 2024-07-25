Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D486107B3
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Jul 2024 02:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721875433; cv=none; b=I1ITT0O7gYwRWROmGeulJKxOQQPkXKte4ZyvJhmFvkd1AvypQMkieH2ApElx+VHH0xNxi77XONbpoE7qXsbPOQfiPPccoTSl/hw65q+hhtNEqNrenaDs7Ba6GTf9qc6vtZkHCwCDBKXDn4emjWh0AorrBehh/QEOW+ZHUtpo0ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721875433; c=relaxed/simple;
	bh=nKlfq32+SLaeiT/1lXhimjwOGO+nUJ4vaE0WDuaGYzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TtL5BhEsrNzDXqPJb161xsU9dhbLZNJHSFYQ/OXHt4FyELP0CkPqIB27Z29oANPLR/FLeqs6AlVSre4UVDqnSLH+xGaByL8iWpw4EdXURU32eJPFwTzUhquvrWJAAegkvnbdKTefyEpYuFxA3VbmXGhqmroeo7VTeYlx/CODPOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LWmE5oW3; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LWmE5oW3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721875429; x=1753411429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nKlfq32+SLaeiT/1lXhimjwOGO+nUJ4vaE0WDuaGYzU=;
  b=LWmE5oW3kK9FxG6gZAlVJdVgbHkNF8M/YohCl+9p1SlZ3mEevJezWe5U
   yAjDh0TQc/WCVY7X1u4on83O6TQaA35HmOUjGRgfUxhGFQMLqsTCU21i0
   QklUyq61sKSTljoJsI8dvyBCuXqzuduEM40OSop2N5fa14tft/5ZOR1Jj
   NGJicS2YCf9DUO+vZi9lEKeZdLjc/06H32UA/dDi8dZ7iVEhqUZR4i/Si
   MLACgVTYCgj1jtqDMoSPuSAYc11gWxGiQfqm9sQlTw3u0Atus4VZlUIOq
   haR3IKtLxJzUM6e/esYQn8NiJ3qS19BnDz0F84BxUDIF87aRygB57xNou
   g==;
X-CSE-ConnectionGUID: ln62ZQ8tSS+1EARQNg7jPQ==
X-CSE-MsgGUID: 24rWJz4JQi+c9hlXOtqp1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="12701742"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="12701742"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 19:43:48 -0700
X-CSE-ConnectionGUID: WHj9sX5STS6tQslu24pRDw==
X-CSE-MsgGUID: MPW2sSiTRpO5Dn8YMn4oJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="57574894"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jul 2024 19:43:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWoSG-000nga-0N;
	Thu, 25 Jul 2024 02:43:44 +0000
Date: Thu, 25 Jul 2024 10:42:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [chrome-os:chromeos-6.1 8/13]
 arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@15002000: failed to
 match any schema with compatible: ['mediatek,mt8188-smi-img0',
 'mediatek,mt8188-smi-sub-common', 'syscon']
Message-ID: <202407251059.A4UcECgZ-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com
TO: Guenter Roeck <groeck@google.com>

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   5fa44db817ded9fe838048d7cc2d6b3743415d05
commit: 27fc58a7b5b80aeaceb2f354d558deae139b33cd [8/13] CHROMIUM: dt-bindings: reset: mt8188: add smi larb reset settings
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-051-20240723 (https://download.01.org/0day-ci/archive/20240725/202407251059.A4UcECgZ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407251059.A4UcECgZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407251059.A4UcECgZ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: clock-controller@14f00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys1'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@15001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@15120000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@15140000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@15230000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/hcp@0: failed to match any schema with compatible: ['mediatek,hcp']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/hcp_l15: failed to match any schema with compatible: ['mediatek,imgsys-larb']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: imgsys_fw@15000000: traw_cq_thread0_frame_done: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: imgsys_fw@15000000: traw_cq_thread1_frame_done: b'\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@15630000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: camisp@16000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: camisp@16000000: 'mediatek,scp', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@16001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@16002000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@16008000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@16009000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@1600a000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: larb@1600b000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: seninf-top@16010000: power-domains: [[61, 7], [61, 29], [61, 30]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: seninf-top@16010000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: seninf-top@16010000: 'clock-names', 'clocks', 'interrupts', 'mtk_csi_phy_ver', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: cam-raw-a@16030000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,cam-raw.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: cam-raw-a@16030000: 'assigned-clock-parents', 'assigned-clocks', 'clock-names', 'clocks', 'interrupts', 'mediatek,cam-id', 'mediatek,larbs', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: clock-controller@14f00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys1'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@15001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@15120000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@15140000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@15230000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/hcp@0: failed to match any schema with compatible: ['mediatek,hcp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/hcp_l15: failed to match any schema with compatible: ['mediatek,imgsys-larb']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: imgsys_fw@15000000: traw_cq_thread0_frame_done: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: imgsys_fw@15000000: traw_cq_thread1_frame_done: b'\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@15630000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: camisp@16000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: camisp@16000000: 'mediatek,scp', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@16001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@16002000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@16008000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@16009000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@1600a000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: larb@1600b000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: seninf-top@16010000: power-domains: [[76, 7], [76, 29], [76, 30]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: seninf-top@16010000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: seninf-top@16010000: 'clock-names', 'clocks', 'csi_receiver@0', 'csi_receiver@1', 'interrupts', 'mtk_csi_phy_ver', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: csi_receiver@1: 'csi-port', 'hs_trail_parameter', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtb: csi_receiver@0: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: clock-controller@14f00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys1'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@15001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@15120000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@15140000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@15230000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/hcp@0: failed to match any schema with compatible: ['mediatek,hcp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/hcp_l15: failed to match any schema with compatible: ['mediatek,imgsys-larb']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: imgsys_fw@15000000: traw_cq_thread0_frame_done: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: imgsys_fw@15000000: traw_cq_thread1_frame_done: b'\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@15630000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: camisp@16000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: camisp@16000000: 'mediatek,scp', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@16001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@16002000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@16008000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@16009000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@1600a000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: larb@1600b000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: seninf-top@16010000: power-domains: [[74, 7], [74, 29], [74, 30]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: seninf-top@16010000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: seninf-top@16010000: 'clock-names', 'clocks', 'csi_receiver@0', 'csi_receiver@1', 'interrupts', 'mtk_csi_phy_ver', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: csi_receiver@0: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dtb: csi_receiver@1: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: clock-controller@14f00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys1'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@15001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@15120000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@15140000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@15230000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/hcp@0: failed to match any schema with compatible: ['mediatek,hcp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/hcp_l15: failed to match any schema with compatible: ['mediatek,imgsys-larb']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: imgsys_fw@15000000: traw_cq_thread0_frame_done: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: imgsys_fw@15000000: traw_cq_thread1_frame_done: b'\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@15630000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: camisp@16000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: camisp@16000000: 'mediatek,scp', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@16001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@16002000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@16008000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@16009000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@1600a000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: larb@1600b000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: seninf-top@16010000: power-domains: [[74, 7], [74, 29], [74, 30]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: seninf-top@16010000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: seninf-top@16010000: 'clock-names', 'clocks', 'csi_receiver@0', 'csi_receiver@1', 'interrupts', 'mtk_csi_phy_ver', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: csi_receiver@0: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dtb: csi_receiver@1: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: clock-controller@14f00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys1'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@15001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@15120000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@15140000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@15230000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/hcp@0: failed to match any schema with compatible: ['mediatek,hcp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/hcp_l15: failed to match any schema with compatible: ['mediatek,imgsys-larb']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: imgsys_fw@15000000: traw_cq_thread0_frame_done: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: imgsys_fw@15000000: traw_cq_thread1_frame_done: b'\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@15630000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: camisp@16000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: camisp@16000000: 'mediatek,scp', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@16001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@16002000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@16008000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@16009000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@1600a000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: larb@1600b000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: seninf-top@16010000: power-domains: [[74, 7], [74, 29], [74, 30]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: seninf-top@16010000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: seninf-top@16010000: 'clock-names', 'clocks', 'csi_receiver@0', 'csi_receiver@1', 'interrupts', 'mtk_csi_phy_ver', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: csi_receiver@0: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dtb: csi_receiver@1: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: clock-controller@14f00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys1'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@15001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@15120000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@15140000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@15230000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/hcp@0: failed to match any schema with compatible: ['mediatek,hcp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/hcp_l15: failed to match any schema with compatible: ['mediatek,imgsys-larb']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: imgsys_fw@15000000: traw_cq_thread0_frame_done: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: imgsys_fw@15000000: traw_cq_thread1_frame_done: b'\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@15630000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: camisp@16000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: camisp@16000000: 'mediatek,scp', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@16001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@16002000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@16008000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@16009000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@1600a000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: larb@1600b000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: seninf-top@16010000: power-domains: [[74, 7], [74, 29], [74, 30]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: seninf-top@16010000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: seninf-top@16010000: 'clock-names', 'clocks', 'csi_receiver@0', 'csi_receiver@1', 'interrupts', 'mtk_csi_phy_ver', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: csi_receiver@0: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dtb: csi_receiver@1: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: clock-controller@14f00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys1'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@15001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@15120000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@15140000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@15230000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/hcp@0: failed to match any schema with compatible: ['mediatek,hcp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/hcp_l15: failed to match any schema with compatible: ['mediatek,imgsys-larb']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: imgsys_fw@15000000: traw_cq_thread0_frame_done: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: imgsys_fw@15000000: traw_cq_thread1_frame_done: b'\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@15630000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: camisp@16000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: camisp@16000000: 'mediatek,scp', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@16001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@16002000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@16008000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@16009000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@1600a000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: larb@1600b000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: seninf-top@16010000: power-domains: [[73, 7], [73, 29], [73, 30]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: seninf-top@16010000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: seninf-top@16010000: 'clock-names', 'clocks', 'csi_receiver@0', 'csi_receiver@1', 'interrupts', 'mtk_csi_phy_ver', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: csi_receiver@0: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dtb: csi_receiver@1: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: clock-controller@14f00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys1'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@15001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@15120000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@15140000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@15230000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/hcp@0: failed to match any schema with compatible: ['mediatek,hcp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/hcp_l15: failed to match any schema with compatible: ['mediatek,imgsys-larb']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: imgsys_fw@15000000: traw_cq_thread0_frame_done: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: imgsys_fw@15000000: traw_cq_thread1_frame_done: b'\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@15630000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: camisp@16000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: camisp@16000000: 'mediatek,scp', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@16001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@16002000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@16008000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@16009000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@1600a000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: larb@1600b000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: seninf-top@16010000: power-domains: [[73, 7], [73, 29], [73, 30]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: seninf-top@16010000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: seninf-top@16010000: 'clock-names', 'clocks', 'csi_receiver@0', 'csi_receiver@1', 'interrupts', 'mtk_csi_phy_ver', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: csi_receiver@0: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dtb: csi_receiver@1: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: clock-controller@14f00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys1'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@15001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@15120000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@15140000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@15230000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/hcp@0: failed to match any schema with compatible: ['mediatek,hcp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/hcp_l15: failed to match any schema with compatible: ['mediatek,imgsys-larb']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: imgsys_fw@15000000: traw_cq_thread0_frame_done: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: imgsys_fw@15000000: traw_cq_thread1_frame_done: b'\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@15630000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: camisp@16000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: camisp@16000000: 'mediatek,scp', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@16001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@16002000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@16008000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@16009000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@1600a000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: larb@1600b000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: seninf-top@16010000: power-domains: [[73, 7], [73, 29], [73, 30]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: seninf-top@16010000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: seninf-top@16010000: 'clock-names', 'clocks', 'csi_receiver@0', 'csi_receiver@1', 'interrupts', 'mtk_csi_phy_ver', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: csi_receiver@0: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dtb: csi_receiver@1: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@14f00000: $nodename:0: 'clock-controller@14f00000' does not match '^syscon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: clock-controller@14f00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['mediatek,mt8188-vppsys1'] is too short
   	'mediatek,mt8195-mmsys' was expected
   	'mediatek,mt7623-mmsys' was expected
   	'mediatek,mt8195-vdosys0' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@15001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@15002000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@15003000: failed to match any schema with compatible: ['mediatek,mt8188-smi-img1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@15120000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@15140000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@15230000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/hcp@0: failed to match any schema with compatible: ['mediatek,hcp']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/hcp_l15: failed to match any schema with compatible: ['mediatek,imgsys-larb']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: imgsys_fw@15000000: traw_cq_thread0_frame_done: b'\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: imgsys_fw@15000000: traw_cq_thread1_frame_done: b'\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
--
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@15630000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: camisp@16000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: camisp@16000000: 'mediatek,scp', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,camisp.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@16001000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@16002000: 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@16005000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam0', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: /soc/syscon@16006000: failed to match any schema with compatible: ['mediatek,mt8188-smi-cam1', 'mediatek,mt8188-smi-sub-common', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@16008000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@16009000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@1600a000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
>> arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: larb@1600b000: 'mediatek,smi-reset', 'mediatek,smi-sub-comm', 'mediatek,smi-sub-comm-inport' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/memory-controllers/mediatek,smi-larb.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: seninf-top@16010000: power-domains: [[73, 7], [73, 29], [73, 30]] is too short
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: seninf-top@16010000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: seninf-top@16010000: 'clock-names', 'clocks', 'csi_receiver@0', 'csi_receiver@1', 'interrupts', 'mtk_csi_phy_ver', 'reg', 'reg-names' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf-core.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: csi_receiver@0: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/mediatek,seninf.yaml#
   arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dtb: csi_receiver@1: 'csi-port', 'port' do not match any of the regexes: 'pinctrl-[0-9]+'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
