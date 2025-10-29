Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB464204E
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 02:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761706032; cv=none; b=cz0Cr+5sC7HCZM1rB+psHiqwxe1N9A8pB8lK+GDAbLRbSrJ5+GVZkqDfWKKRFOs07eEogJBJCDBRuoh6udX5JY8JUzmYMtzm/HEqw2WqpgjRLxhCnJxSbT34OBO1ziMfXSFCNuwTqnUjqIL/RNONkSps2Lhkyyd0QfwAFOj4tXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761706032; c=relaxed/simple;
	bh=kMiRnoi1MR1IYhf5h26iqUzzFxiFgqJO8v9YQigN6Fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YRU2I1aRMpvcSUlJKd7oWje40LaxX17BiRyQKmroafNqXphi1Bwai4gmX/Vr3QcDNYU7TtvVcl/LdDPumhVjbVYmghzI30wfFYsYMViAgCAVmcjfQDJcpiXchsr/XN8KpXih9tm8oGvqK28IAOBRwiCaOd/PRIh9LvI9zyK8dO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JOTUMifT; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JOTUMifT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761706029; x=1793242029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kMiRnoi1MR1IYhf5h26iqUzzFxiFgqJO8v9YQigN6Fo=;
  b=JOTUMifTTKOgBn/5c3BdxGbPEhpAYGb0fAYLcHkUGUhMoDRZuaTzlyOe
   aCcWwMznufPS6DLbrI2M33pdY1azZBSYke7/j3rR+EV3jO27N/Vu+1DmH
   qCg9MVop15+unwLQNcZytkXsUZWhcFOArU2e5t6/0voNu4VxWHZOe4v4X
   YYyATeWWDlWzn/wfCYC/cxY/DsoVBSL235Lv/QPk6ascysVvCmKy5Y6hB
   9Aiz8jn5SEGjdDGvgoulDk91OeM0lgzYcqwi7qttzjwZsbQwxoat1cYTt
   bEG9vefyPoQW5dZNOnSxDlzA63gCCk2QEpef+9C8/2Vtr5VJAUid+lOAJ
   w==;
X-CSE-ConnectionGUID: k83+oA5xS+Smu1Mnv9R93w==
X-CSE-MsgGUID: yft9FCHtTO2hwPg8eOb/dA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63720143"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63720143"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 19:47:09 -0700
X-CSE-ConnectionGUID: ikWpMLbHQJCXlllq14qn1g==
X-CSE-MsgGUID: CQ6q/vynTkeG3rEprZSvWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="185162090"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 19:47:08 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDwDK-000000000r2-11DE;
	Wed, 29 Oct 2025 02:47:06 +0000
Date: Wed, 29 Oct 2025 03:46:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/nios2/boot/dts/10m50_devboard.dtb: /: failed to match any
 schema with compatible: ['altr,niosii-max10']
Message-ID: <202510290311.mZFp1NzH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 61a6ba233fe1198e9eacc9ca1d1cbdb27f70cee5 dt-bindings: Unify "fsl,liodn" type definitions
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: nios2-randconfig-2052-20251024 (https://download.01.org/0day-ci/archive/20251029/202510290311.mZFp1NzH-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290311.mZFp1NzH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510290311.mZFp1NzH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/nios2/boot/dts/10m50_devboard.dts:44.9-48.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/nios2/boot/dts/10m50_devboard.dts:50.16-231.4: Warning (unit_address_vs_reg): /sopc@0: node has a unit name, but no reg or ranges property
   arch/nios2/boot/dts/10m50_devboard.dts:119.21-143.5: Warning (unit_address_vs_reg): /sopc@0/clock@0: node has a unit name, but no reg or ranges property
   arch/nios2/boot/dts/10m50_devboard.dts:145.20-169.5: Warning (unit_address_vs_reg): /sopc@0/clock@1: node has a unit name, but no reg or ranges property
   arch/nios2/boot/dts/10m50_devboard.dts:119.21-143.5: Warning (simple_bus_reg): /sopc@0/clock@0: missing or empty reg/ranges property
   arch/nios2/boot/dts/10m50_devboard.dts:145.20-169.5: Warning (simple_bus_reg): /sopc@0/clock@1: missing or empty reg/ranges property
   arch/nios2/boot/dts/10m50_devboard.dts:208.19-230.5: Warning (simple_bus_reg): /sopc@0/leds: missing or empty reg/ranges property
   auto-flow-control: size (4) error for type flag
>> arch/nios2/boot/dts/10m50_devboard.dtb: /: failed to match any schema with compatible: ['altr,niosii-max10']
>> arch/nios2/boot/dts/10m50_devboard.dtb: / (altr,niosii-max10): False schema does not allow {'device_type': ['memory'], 'reg': [[134217728, 134217728], [0, 1024]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['altr,nios2-1.1']
>> arch/nios2/boot/dts/10m50_devboard.dtb: sopc@0 (altr,avalon): leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: sopc@0 (altr,avalon): clock@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: sopc@0 (altr,avalon): clock@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: sopc@0 (altr,avalon): $nodename:0: 'sopc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0: failed to match any schema with compatible: ['altr,avalon', 'simple-bus']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/serial@18001530: failed to match any schema with compatible: ['altr,juart-1.0']
>> arch/nios2/boot/dts/10m50_devboard.dtb: serial@18001600 (altr,16550-FIFO32): auto-flow-control: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/sysid@18001528: failed to match any schema with compatible: ['altr,sysid-1.0']
>> arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:2: 'tx_csr' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:3: 's1' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names: ['control_port', 'rx_csr', 'rx_desc', 'rx_resp', 'tx_csr', 'tx_desc'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): compatible: ['altr,tse-msgdma-1.0', 'altr,tse-1.0'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): Unevaluated properties are not allowed ('address-bits', 'altr,enable-hash', 'altr,enable-sup-addr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/clock@0: failed to match any schema with compatible: ['altr,pll-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/clock@1: failed to match any schema with compatible: ['altr,pll-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/timer@18001440: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/gpio@180014d0: failed to match any schema with compatible: ['altr,pio-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/gpio@180014c0: failed to match any schema with compatible: ['altr,pio-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/timer@880: failed to match any schema with compatible: ['altr,timer-1.0']
>> arch/nios2/boot/dts/10m50_devboard.dtb: leds (gpio-leds): 'fpga0', 'fpga1', 'fpga2', 'fpga3' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
--
   arch/nios2/boot/dts/3c120_devboard.dts:52.9-147.4: Warning (unit_address_vs_reg): /sopc@0: node has a unit name, but no reg or ranges property
   arch/nios2/boot/dts/3c120_devboard.dts:46.11-50.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /sopc@0)
>> arch/nios2/boot/dts/3c120_devboard.dtb: /: failed to match any schema with compatible: ['altr,qsys_ghrd_3c120']
>> arch/nios2/boot/dts/3c120_devboard.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['altr,nios2-1.0']
>> arch/nios2/boot/dts/3c120_devboard.dtb: sopc@0 (altr,avalon): $nodename:0: 'sopc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0: failed to match any schema with compatible: ['altr,avalon', 'simple-bus']
>> arch/nios2/boot/dts/3c120_devboard.dtb: bridge@8000000 (simple-bus): $nodename:0: 'bridge@8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/timer@400000: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/timer@8000: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/serial@4d50: failed to match any schema with compatible: ['altr,juart-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/serial@4c80: failed to match any schema with compatible: ['altr,uart-1.0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
