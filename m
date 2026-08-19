Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74AC1386C39
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 12:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787142555; cv=none; b=hL45snAEyH57SxJPBT3gtsV5aC70Ak/uRIRI3RKM1jw2Wqq6s34DHAEcblx2ftb+4qR/o6ZSvYq18Mri7ww5x/z0cOEopBjE3kksWa5oxZVDXJuRWnbjx0qN6YVGLSRekhVWHQi69j4hLnBzqaJJCGnDZ645BwjJBCNQrFHxMs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787142555; c=relaxed/simple;
	bh=KLXo2CZtbu/7Sbz35OA+7FzcsTkpxhfez/4rpCdCQh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HpfTv9fRlPGdPo32y4TnYVUa8xXHF5dGfcBE+kEVUNwTSzSYYDE1Ych7LTdOsVRN3ZzwBIdIEzMhuED+FOU4RCeLoypVrQKhr0zZ6SsKfqetf2XZ8bkqAGlNYZPM+Bf8L68sywgNa4Rx4Q/+VsFICm7p1k++w7BD31b6gwnBCvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kL4rocYf; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kL4rocYf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787142552; x=1818678552;
  h=date:from:to:cc:subject:message-id;
  bh=KLXo2CZtbu/7Sbz35OA+7FzcsTkpxhfez/4rpCdCQh0=;
  b=kL4rocYfBMgjPfyj0Zy4uGBKtg58qlo5jDstq9nsxTN+q4SIrkOKKjR4
   l3wXFfgi0HO3NexX+ybK/VC5GUxPJjxI4LReF7uDGKckDtTwpcqdBk4DG
   V3p7RPYEDTVF0jdwM+XcxbLrCWss/xASIE4+ZJrv8t17/ik3M+t8yLTfo
   phBrM7wrpT9u2+sPILCbjHZWQCTFAhorNkRtKSPpH9HoGRok41B6/wkO9
   DzfemLZCNdpecwtuSFAAkeFy0tx23FwDJ8fDQjq/y8ErmyS6Y1/8+frmF
   TsZHqIHu4ucFnNbO4YOZRy+pqLxarH5KnkQNXH7p99kwvFFF5xg9bjK3B
   A==;
X-CSE-ConnectionGUID: OVnpesdnTDezF7kYFXwazw==
X-CSE-MsgGUID: ivnm4KCvQa2QsZHQOjmfwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="105186412"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="105186412"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 05:29:11 -0700
X-CSE-ConnectionGUID: 8sXgGudkQ1uT6nkLePquIw==
X-CSE-MsgGUID: U2CTts0KSNi//F/B/q2mKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="265077848"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 19 Aug 2026 05:29:09 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwfPn-000000007N3-2WfP;
	Wed, 19 Aug 2026 12:29:07 +0000
Date: Wed, 19 Aug 2026 14:28:29 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb:
 pcm1773-codec (ti,pcm1773): '#sound-dai-cells', 'enable-gpio', 'vcc-supply'
 do not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202608191440.225u26AB-lkp@intel.com>
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
TO: Stefan Leichter <sle85276@gmx.de>
CC: 0day robot <lkp@intel.com>
CC: Grond <grond66@riseup.net>
CC: "H. Nikolaus Schaller" <hns@goldelico.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/H-Nikolaus-Schaller/dt-bindings-twl-regulator-Add-bindings-for-exposing-ti-twl4030-regen/20260812-201259
head:   4f5559ad82b8debd2be982b089e18240288940e9
commit: 9d79db2f4d50c778ac888c1e7eca4fe9bed796f0 arm: dts: omap3pandora: create new DT node for the sound card
date:   7 days ago
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm-randconfig-2051-20260816 (https://download.01.org/0day-ci/archive/20260819/202608191440.225u26AB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191440.225u26AB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608191440.225u26AB-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/dss@48050000/encoder@4804fc00: failed to match any schema with compatible: ['ti,omap3-dsi']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/dss@48050000/encoder@48050800: failed to match any schema with compatible: ['ti,omap3-rfbi']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/dss@48050000/encoder@48050c00: failed to match any schema with compatible: ['ti,omap3-venc']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: endpoint: ti,channels: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/ssi-controller@48058000: failed to match any schema with compatible: ['ti,omap3-ssi']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805a000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/ssi-controller@48058000/ssi-port@4805b000: failed to match any schema with compatible: ['ti,omap3-ssi-port']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap34xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: /connector: failed to match any schema with compatible: ['connector-analog-tv']
>> arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: pcm1773-codec (ti,pcm1773): '#sound-dai-cells', 'enable-gpio', 'vcc-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/bindings/sound/pcm1773.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-600mhz.dtb: gpio-keys (gpio-keys): 'hold', 'kp-minus', 'kp-plus', 'left-alt', 'left-ctrl', 'lid', 'menu', 'right-ctrl', 'right-shift' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: regulator-abb-mpu (ti,abb-v1): ti,tranxdone-status-mask: b'\x04\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: regulator-abb-mpu (ti,abb-v1): ti,settling-time: b'\x00\x00\x00\x1e' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: regulator-abb-mpu (ti,abb-v1): ti,clock-cycles: b'\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: regulator-abb-mpu (ti,abb-v1): ti,abb_info: b'\x00\x0fs\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x12O\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x147\xc8\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x14\xfb\x18\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /ocp@68000000/bandgap@48002524: failed to match any schema with compatible: ['ti,omap36xx-bandgap']
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: /connector: failed to match any schema with compatible: ['connector-analog-tv']
>> arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: pcm1773-codec (ti,pcm1773): '#sound-dai-cells', 'enable-gpio', 'vcc-supply' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/bindings/sound/pcm1773.yaml
   arch/arm/boot/dts/ti/omap/omap3-pandora-1ghz.dtb: gpio-keys (gpio-keys): 'hold', 'kp-minus', 'kp-plus', 'left-alt', 'left-ctrl', 'lid', 'menu', 'right-ctrl', 'right-shift' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
