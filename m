Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AE02ECE8F
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Feb 2026 06:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770272782; cv=none; b=Xd9vw0bzN57Yqqcpb9s7dCUKyAuOtAcoh8RDYOEvETc55B2dRqYQknGyU/5B00RQhcNvQLIYMj6HhpXPsBKNnP0NvuYeriqG+Z/1tzEMIRhYdYdY9eR0a64gyyL0ByibRrDCylhGzSxHAzDhiA3p5zdO/UOXSF1k1uoJjpbqpHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770272782; c=relaxed/simple;
	bh=ZcSLqTsO/KHCLAVO6fCWKPQCOiCV0KVuWinjLfwv3i8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=S/OkHFUvayllRLuVUn7lKkY1u06gs1WqZF5Bp0lL0syJxAsiJvNOotlydHGDN9xqGCzMVl/7UjjbWAOuqxCk74ekzTWQRu8uz887fOtiw5GnEpvg/2IoB3nufHoBWaAMXnU7IrzW0jGRiheP0O5prbp0vs50pbKHXWVRkNXMFH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMiSKTIB; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMiSKTIB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770272782; x=1801808782;
  h=date:from:to:cc:subject:message-id;
  bh=ZcSLqTsO/KHCLAVO6fCWKPQCOiCV0KVuWinjLfwv3i8=;
  b=FMiSKTIBK3m4jFabcXY1T4zayas9VL2Cc5PcuYQpo6atIynHdzXqZUXw
   Cn/12P+xPbMshl+9EHqjNmQ5CEBO8ocfYO9RQscqoutubnBNutRRVPD3s
   wt/6jkrDRW0ZODGTOdupw9lKMTJO2EqVISLiChmHnpNOf/XT5rkAtLV/m
   gnosXU3Ouq/i8JJ2wdOpTIgF8lq3+57y2l/YBaDKhi/Z+/+A/0dZ/Zkp+
   fwrDYBm5EF6slZ4+ZNrJ4Ueliv9Wbeh53hVPJRoXmBqDcgwBi4u8RRIGH
   wx83nQR8gFQQD8LuNkgcpHsVkcSHQ0XuNVWmYeRKElMhxu75TTCsqsBz8
   w==;
X-CSE-ConnectionGUID: CXASYa3KRSKX2OYq091wXQ==
X-CSE-MsgGUID: Q5i8tqgVRKKl0S4RIBW9gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71561024"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="71561024"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 22:26:21 -0800
X-CSE-ConnectionGUID: rwte3NexSUWPgJyD6aUfFg==
X-CSE-MsgGUID: WDUgZr77QimxVQbSRRMMMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; 
   d="scan'208";a="233332665"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Feb 2026 22:26:20 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnsok-0000000044H-2Hiy;
	Thu, 05 Feb 2026 06:26:18 +0000
Date: Thu, 05 Feb 2026 07:25:21 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/mti/malta.dtb: /: failed to match any
 schema with compatible: ['mti,malta']
Message-ID: <202602050751.v1sUo6Oi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f14faaf3a1fb3b9e4cf2e56269711fb85fba9458
commit: 4f0b3cd7b664e662e9c4480e8d58574ece8aea57 MIPS: dts: Always descend vendor subdirectories
date:   9 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 9 weeks ago
config: mips-randconfig-2051-20260205 (https://download.01.org/0day-ci/archive/20260205/202602050751.v1sUo6Oi-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.3.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260205/202602050751.v1sUo6Oi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602050751.v1sUo6Oi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/mti/malta.dts:44.33-52.4: Warning (unit_address_vs_reg): /interrupt-controller@20: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/malta.dts:90.11-93.5: Warning (unit_address_vs_reg): /system-controller@1f000000/lcd@410: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/malta.dts:103.6-116.4: Warning (unit_address_vs_reg): /isa: node has a reg or ranges property, but no unit name
   arch/mips/boot/dts/mti/malta.dts:54.17-83.4: Warning (avoid_unnecessary_addr_size): /flash@1e000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/mips/boot/dts/mti/malta.dtb: /: failed to match any schema with compatible: ['mti,malta']
>> arch/mips/boot/dts/mti/malta.dtb: / (mti,malta): interrupt-controller@20: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/mti/malta.dtb: / (mti,malta): 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/mti/malta.dtb: interrupt-controller (mti,cpu-interrupt-controller): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mti,cpu-interrupt-controller.yaml
>> arch/mips/boot/dts/mti/malta.dtb: interrupt-controller@1bdc0000 (mti,gic): timer: 'oneOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mti,gic.yaml
>> arch/mips/boot/dts/mti/malta.dtb: /interrupt-controller@20: failed to match any schema with compatible: ['intel,i8259']
>> arch/mips/boot/dts/mti/malta.dtb: /system-controller@1f000000: failed to match any schema with compatible: ['mti,malta-fpga', 'syscon', 'simple-mfd']
>> arch/mips/boot/dts/mti/malta.dtb: isa (isa): $nodename:0: 'isa' does not match '^isa@'
   	from schema $id: http://devicetree.org/schemas/isa/isa-bridge.yaml
>> arch/mips/boot/dts/mti/malta.dtb: isa (isa): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'ranges', 'rtc@70' were unexpected)
   	from schema $id: http://devicetree.org/schemas/isa/isa-bridge.yaml
>> arch/mips/boot/dts/mti/malta.dtb: /isa/rtc@70: failed to match any schema with compatible: ['motorola,mc146818']
--
   arch/mips/boot/dts/mti/sead3.dts:162.12-167.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.0: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:168.12-173.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.1: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:174.12-179.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.2: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:180.12-185.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.3: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:186.12-191.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.4: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:192.12-197.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.5: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:198.12-203.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.6: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:204.12-209.5: Warning (unit_address_vs_reg): /system-controller@1f000200/led@18.7: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:211.11-214.5: Warning (unit_address_vs_reg): /system-controller@1f000200/lcd@200: node has a unit name, but no reg or ranges property
   arch/mips/boot/dts/mti/sead3.dts:69.17-91.4: Warning (avoid_unnecessary_addr_size): /flash@1c000000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/mips/boot/dts/mti/sead3.dtb: /: failed to match any schema with compatible: ['mti,sead-3']
>> arch/mips/boot/dts/mti/sead3.dtb: / (mti,sead-3): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 134217728]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: cpus: '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: cpus: '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: cpu@0 (mti,mips14KEc): compatible: ['mti,mips14KEc', 'mti,mips14Kc'] is too long
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: cpu@0 (mti,mips14KEc): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/mips/cpus.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: interrupt-controller (mti,cpu-interrupt-controller): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/mti,cpu-interrupt-controller.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: /system-controller@1f000000: failed to match any schema with compatible: ['mti,sead3-fpga', 'syscon', 'simple-mfd']
>> arch/mips/boot/dts/mti/sead3.dtb: /system-controller@1f000000/poweroff: failed to match any schema with compatible: ['restart-poweroff']
>> arch/mips/boot/dts/mti/sead3.dtb: /system-controller@1f000200: failed to match any schema with compatible: ['mti,sead3-cpld', 'syscon', 'simple-mfd']
>> arch/mips/boot/dts/mti/sead3.dtb: system-controller@1f000200 (mti,sead3-cpld): 'led@10.0', 'led@10.1', 'led@10.2', 'led@10.3', 'led@10.4', 'led@10.5', 'led@10.6', 'led@10.7', 'led@18.0', 'led@18.1', 'led@18.2', 'led@18.3', 'led@18.4', 'led@18.5', 'led@18.6', 'led@18.7' do not match any of the regexes: '.*-names$', '.*-supply$', '^#.*-cells$', '^#[a-zA-Z0-9,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9#,+\\-._]{0,63}$', '^[a-zA-Z0-9][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+(,[0-9a-fA-F]+)*$', '^__.*__$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: led@10.0 (register-bit-led): $nodename:0: 'led@10.0' does not match '^led@[0-9a-f]+,[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: led@10.0 (register-bit-led): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
   arch/mips/boot/dts/mti/sead3.dtb: led@10.1 (register-bit-led): $nodename:0: 'led@10.1' does not match '^led@[0-9a-f]+,[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
   arch/mips/boot/dts/mti/sead3.dtb: led@10.1 (register-bit-led): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
   arch/mips/boot/dts/mti/sead3.dtb: led@10.2 (register-bit-led): $nodename:0: 'led@10.2' does not match '^led@[0-9a-f]+,[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
   arch/mips/boot/dts/mti/sead3.dtb: led@10.2 (register-bit-led): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
   arch/mips/boot/dts/mti/sead3.dtb: led@10.3 (register-bit-led): $nodename:0: 'led@10.3' does not match '^led@[0-9a-f]+,[0-9a-f]{1,2}$'
--
   arch/mips/boot/dts/mti/sead3.dtb: led@18.5 (register-bit-led): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
   arch/mips/boot/dts/mti/sead3.dtb: led@18.6 (register-bit-led): $nodename:0: 'led@18.6' does not match '^led@[0-9a-f]+,[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
   arch/mips/boot/dts/mti/sead3.dtb: led@18.6 (register-bit-led): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
   arch/mips/boot/dts/mti/sead3.dtb: led@18.7 (register-bit-led): $nodename:0: 'led@18.7' does not match '^led@[0-9a-f]+,[0-9a-f]{1,2}$'
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
   arch/mips/boot/dts/mti/sead3.dtb: led@18.7 (register-bit-led): 'reg' is a required property
   	from schema $id: http://devicetree.org/schemas/leds/register-bit-led.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: uart@1f000900 (ns16550a): $nodename:0: 'uart@1f000900' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/mips/boot/dts/mti/sead3.dtb: uart@1f000800 (ns16550a): $nodename:0: 'uart@1f000800' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
