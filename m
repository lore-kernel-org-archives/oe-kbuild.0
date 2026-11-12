Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794446601;
	b=C3mMNJP5VHTW6XpkrJbA0qf4d6rcpUuYl2AKcnBWicICiQSWlWuCUFi3zsoX8uMgOFRV
	 8ky8PZXXB4udnqtHgV5vDp98vAkUyuhIq08yDeMmmICglkyOj4WzEYEJ6/uVj8O5MGPMW
	 lTkc3VjWnyL6P3xAjCCd02QdqVXH6qq/c0S3DpHndK0HRW0CtBRmaN3S66w3OfA0udMhd
	 AlRz+d6hkHrdsD2F1a9c59EfTEVBKoPe9UN1+x5Jq0x4ODa8jkRQhdcKrfpvM0JhSKbo/
	 j9UnbCa/HTR6PJTNzrtyPUHbDtQTTfXPfg1oHDUuDLxtzDLCk/ap2vu9aOeZG9OMG4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794446601;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QXfz8BzVKJFIUZiWzREZuNMFI+T2G8+TFznKwP+mguw=;
	b=r9i+hcdzUqjsFxeSXoNXC7l7e4twircJXrcYaa/m/AgNj5gwhVBdLkWbMBZXfZJnTJfg
	 /JOE+mzs2UoGClYmcQdY5gym0you9tOAawVaNSph3//uZZfBTW8qX2q8f2xUpo02cDte7
	 he9bx9zwtfp7Q3C1XM0g0EC6gH22vwdmbQLJqwW9ZCEVqs9Ydr+J+TIGPD+3EVRi8aGGT
	 E0zxG39193MPUPMbJQql84YTV96luRDmXi9q+Plzkx1zbmtT0p60SzDFGo+GjuqBNVZzb
	 eGSmAxhBFQGGgOOIzDFP602vU/wQaVgzanE8YxeNFTx49lTh8DBKUHToVcDPBKBGbxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j9SGplxP;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41791606A327
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Nov 2026 01:23:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41791606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j9SGplxP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794446601; x=1825982601;
  h=date:from:to:cc:subject:message-id;
  bh=vIqxZHIOAIPB5FVF6W+0r5X05qoDegQ/g0IMvuNQQys=;
  b=j9SGplxPRUKRR3EMIXOucXxnAPBpWtVbykzyZEoT8p2B5sxEePt6nmNS
   zDG4KP6J9t0WG0ABKHwt8RI4jVGd3JHpat3IJZNZW/8BAuSlTjRq4PNJA
   iKWXai/Tdom5D3d6zerQkpPKx5kFRx+t1X/FM7A1zxczYkyBVUXExYwih
   qmn6IKKamSSKCyDDyASs9eGxNDPh6wrQwQ7nA8gJdNnyNdPrnRLpI+MX2
   QOz5lb83+84kn3O7/zGqt7XQt9BikNH2AY+lRYpcnZPvC7/rf7+2PLZgf
   grLbP/3dCy9WuxfoOV6UoOvdsB4w0g8CkjSJ2HQSMBYN8iadHDtC5pI0j
   w==;
X-CSE-ConnectionGUID: I4JlZqB+QZ6BnY03r5kzvQ==
X-CSE-MsgGUID: /Cwb+rbYSG6vbkTmMbubBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3251736"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3251736"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 17:23:20 -0800
X-CSE-ConnectionGUID: T81ndOrdSiyjt5XWAHH2bA==
X-CSE-MsgGUID: mVaJFI9eRo+b5OzxePKfQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8975319"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2026 17:23:18 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRJX2-000000000m5-1g3T;
	Thu, 12 Nov 2026 01:23:16 +0000
Date: Thu, 12 Nov 2026 02:22:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [khilman-omap:for-next 2/7]
 arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: idle-states: 'mpu_gate'
 does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
Message-ID: <202611120205.kquP9hTL-lkp@intel.com>
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
TO: Robert Nelson <robertcnelson@gmail.com>
CC: "Kevin Hilman (TI)" <khilman@baylibre.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git for-next
head:   b1c05e0d7eb6c779fcb0308bf915d19afb0f1a2c
commit: badbca2876de684230329b49c30c7087cc88c10f [2/7] arm: dts: omap: Add support for BeagleBone Black RevD
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261112/202611120205.kquP9hTL-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261112/202611120205.kquP9hTL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611120205.kquP9hTL-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:116.37-117.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:317.33-321.8: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/phy-gmii-sel: simple-bus unit address format error, expected "650"
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:323.25-326.8: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/scm_conf@0/clocks: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:352.36-353.7: Warning (simple_bus_reg): /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0/clockdomains: missing or empty reg/ranges property
   arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi:964.12-994.4: Warning (simple_bus_reg): /ocp/interconnect@4b140000/segment@0: simple-bus unit address format error, expected "4800"
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: cpu@0 (arm,cortex-a8): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: cpu@0 (arm,cortex-a8): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: idle-states: 'mpu_gate' does not match any of the regexes: '^(cpu|cluster)-', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /soc: failed to match any schema with compatible: ['ti,omap-infra']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: ocp (simple-pm-bus): $nodename:0: 'ocp' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: interconnect@44c00000 (ti,am33xx-l4-wkup): $nodename:0: 'interconnect@44c00000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: prcm@0 (ti,am3-prcm): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: prcm@0 (ti,am3-prcm): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: prcm@0 (ti,am3-prcm): $nodename:0: 'prcm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0: failed to match any schema with compatible: ['ti,am3-prcm', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@490: failed to match any schema with compatible: ['ti,am3-dpll-core-clock']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock-dpll-core-x2: failed to match any schema with compatible: ['ti,am3-dpll-x2-clock']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@488: failed to match any schema with compatible: ['ti,am3-dpll-clock']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@494: failed to match any schema with compatible: ['ti,am3-dpll-no-gate-clock']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@498: failed to match any schema with compatible: ['ti,am3-dpll-no-gate-clock']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clocks/clock@48c: failed to match any schema with compatible: ['ti,am3-dpll-no-gate-j-type-clock']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@0: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: clock@0 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@400: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: clock@400 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@600: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: clock@600 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@800: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: clock@800 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@900: failed to match any schema with compatible: ['ti,omap4-cm']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: clock@900 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@0/prcm@0/clock@a00: failed to match any schema with compatible: ['ti,omap4-cm']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: clock@a00 (ti,omap4-cm): '#clock-cells' is a dependency of 'clock-output-names'
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: pmic@24 (ti,tps65217): regulators: '#address-cells', '#size-cells', 'regulator@0', 'regulator@1', 'regulator@2', 'regulator@3', 'regulator@4', 'regulator@5', 'regulator@6' do not match any of the regexes: '^(dcdc[1-3]|ldo[1-4])$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/backlight/ti,tps65217.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: regulator@0: regulator-compatible: b'dcdc1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: regulator@1: regulator-compatible: b'dcdc2\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: regulator@2: regulator-compatible: b'dcdc3\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: regulator@3: regulator-compatible: b'ldo1\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: regulator@4: regulator-compatible: b'ldo2\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: regulator@5: regulator-compatible: b'ldo3\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: regulator@6: regulator-compatible: b'ldo4\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: scm@0 (ti,am3-scm): clockdomains: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: scm@0 (ti,am3-scm): $nodename:0: 'scm@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@44c00000/segment@200000/target-module@10000/scm@0: failed to match any schema with compatible: ['ti,am3-scm', 'simple-bus']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: scm_conf@0 (ti,am3352-scm-conf): clocks: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: scm_conf@0 (ti,am3352-scm-conf): phy-gmii-sel: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: scm_conf@0 (ti,am3352-scm-conf): $nodename:0: 'scm_conf@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: wdt@0 (ti,omap3-wdt): $nodename:0: 'wdt@0' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/ti,omap2-wdt.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: interconnect@48000000 (ti,am33xx-l4-per): $nodename:0: 'interconnect@48000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@100000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@100000 (simple-pm-bus): $nodename:0: 'segment@100000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@200000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@200000 (simple-pm-bus): $nodename:0: 'segment@200000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@300000 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@300000 (simple-pm-bus): $nodename:0: 'segment@300000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: lcdc@0 (ti,am33xx-tilcdc): port:endpoint@0: 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tilcdc/ti,am33xx-tilcdc.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: interconnect@47c00000 (ti,am33xx-l4-fw): $nodename:0: 'interconnect@47c00000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: interconnect@4a000000 (ti,am33xx-l4-fast): $nodename:0: 'interconnect@4a000000' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@0 (simple-pm-bus): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@0 (simple-pm-bus): $nodename:0: 'segment@0' does not match '^bus(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/bus/simple-pm-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0: failed to match any schema with compatible: ['ti,am335x-cpsw', 'ti,cpsw']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/interconnect@4a000000/segment@0/target-module@100000/ethernet@0: failed to match any schema with compatible: ['ti,am335x-cpsw', 'ti,cpsw']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: ethernet@0 (ti,am335x-cpsw): cpdma_channels: b'\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: ethernet@0 (ti,am335x-cpsw): ale_entries: b'\x00\x00\x04\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: ethernet@0 (ti,am335x-cpsw): bd_ram_size: b'\x00\x00 \x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: ethernet@0 (ti,am335x-cpsw): mac_control: b'\x00\x00\x00 ' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: ethernet@0 (ti,am335x-cpsw): slaves: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: ethernet@0 (ti,am335x-cpsw): active_slave: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: interconnect@4b140000 (ti,am33xx-l4-mpuss): $nodename:0: 'interconnect@4b140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: segment@0 (simple-bus): $nodename:0: 'segment@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: dma@0 (ti,edma3-tpcc): ti,tptcs: b'\x00\x00\x00]\x00\x00\x00\x07\x00\x00\x00^\x00\x00\x00\x05\x00\x00\x00_\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: dma@0 (ti,edma3-tpcc): ti,edma-memcpy-channels: b'\x00\x00\x00\x14\x00\x00\x00\x15' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-revd.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
