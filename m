Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CE02D3A94
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Oct 2025 16:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761584267; cv=none; b=fplDYtH46tGRjDWX6AnaoE0YFRrhMHW0yL6dyhT+E/fEsAhUb57lq/76gZwL8+gxnxyA7e8IDvvnbl0+HaQZsheH97u/Z2vnQHEV5CkZAXnmV3xhzZ64sriOaSGfBmnh3w0RqIAyHFRjQGUMBXZMclweQZe7hwO8L78DlDYxeiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761584267; c=relaxed/simple;
	bh=Jl3LXaGN1LOZC+Ck0DOKeLjGQUv8tTgn6qG9DKXCQck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PaEjD2GlAMqbVchdGxoDLaz/DXvQaHWRCmh0iVpzcTmbox84l4jfXLwf1/sIYaWxq2c//bziuj6YN679tP0QmLmpOCxQysmRD1znjNWiKeKK5vl94pDn705gsVKczIcWFdBzrbLBxCnmSBY0Am1aPwbU8F16ME+Vura+4fkDW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQXqLqat; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQXqLqat"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761584265; x=1793120265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jl3LXaGN1LOZC+Ck0DOKeLjGQUv8tTgn6qG9DKXCQck=;
  b=cQXqLqatvtzXmB9u+P6LP2t/xUmwQfiX0WVv9wCs1TDrvgZaxxv3sLF4
   C3cNUsnwOodcgn/8IVSjfG1urZK3AxW+Dp1lMV0TpHRr6mSNV3LQGDWOn
   joY4F99ZHqM1BFsluF3egbPgjfumFkQR6a7vGtp8KHwpadboBaZz3kJaR
   jyxi1VjHxJaZS3qg9JCq9RZmJGWXC3IL2d7sZVEmtxVQ6Nblhkg+yDb2+
   NciTbJnudiJUmuberWRjvyoa/pmLXeR4U32MS3rRH/Q7AJ83Rd9fiJYhn
   hJZnIuDIsHo3/Z0+u47VpOYBJGdvSmPhpstPv3R4Ir4wckB2sWMaYov78
   g==;
X-CSE-ConnectionGUID: OFgcnlmzRG2Z7XfzLrfhjA==
X-CSE-MsgGUID: wss9iCMlShe34CVS1yga6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63766379"
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="63766379"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 09:57:44 -0700
X-CSE-ConnectionGUID: PbX1yIuBRY6fnBbfptjhrQ==
X-CSE-MsgGUID: oxumLgN/SsyMn4x5WGp01g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; 
   d="scan'208";a="185563663"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 27 Oct 2025 09:57:44 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDQXN-000000000MT-3RVl;
	Mon, 27 Oct 2025 16:57:41 +0000
Date: Mon, 27 Oct 2025 17:56:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/microblaze/boot/dts/system.dtb: /: failed to match any schema
 with compatible: ['xlnx,microblaze']
Message-ID: <202510271733.7kNamBlc-lkp@intel.com>
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
head:   dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
commit: 61a6ba233fe1198e9eacc9ca1d1cbdb27f70cee5 dt-bindings: Unify "fsl,liodn" type definitions
date:   11 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 11 months ago
config: microblaze-randconfig-2052-20251024 (https://download.01.org/0day-ci/archive/20251027/202510271733.7kNamBlc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510271733.7kNamBlc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510271733.7kNamBlc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/microblaze/boot/dts/system.dts:118.16-352.5: Warning (unit_address_vs_reg): /plb@0: node has a unit name, but no reg or ranges property
   arch/microblaze/boot/dts/system.dts:203.44-224.6: Warning (unit_address_vs_reg): /plb@0/xps-ll-temac@81c00000: node has a unit name, but no reg or ranges property
   arch/microblaze/boot/dts/system.dts:324.17-335.6: Warning (unit_address_vs_reg): /plb@0/mpmc@90000000: node has a unit name, but no reg or ranges property
   arch/microblaze/boot/dts/system.dts:203.44-224.6: Warning (simple_bus_reg): /plb@0/xps-ll-temac@81c00000: missing or empty reg/ranges property
   arch/microblaze/boot/dts/system.dts:259.13-282.6: Warning (simple_bus_reg): /plb@0/gpio-leds: missing or empty reg/ranges property
   arch/microblaze/boot/dts/system.dts:284.16-296.5: Warning (simple_bus_reg): /plb@0/gpio-restart: missing or empty reg/ranges property
   arch/microblaze/boot/dts/system.dts:324.17-335.6: Warning (simple_bus_reg): /plb@0/mpmc@90000000: missing or empty reg/ranges property
>> arch/microblaze/boot/dts/system.dtb: /: failed to match any schema with compatible: ['xlnx,microblaze']
>> arch/microblaze/boot/dts/system.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['xlnx,microblaze-7.10.d']
>> arch/microblaze/boot/dts/system.dtb: plb@0 (xlnx,plb-v46-1.03.a): gpio-restart: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/microblaze/boot/dts/system.dtb: plb@0 (xlnx,plb-v46-1.03.a): gpio-leds: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/microblaze/boot/dts/system.dtb: plb@0 (xlnx,plb-v46-1.03.a): $nodename:0: 'plb@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
>> arch/microblaze/boot/dts/system.dtb: /plb@0: failed to match any schema with compatible: ['xlnx,plb-v46-1.03.a', 'xlnx,plb-v46-1.00.a', 'simple-bus']
>> arch/microblaze/boot/dts/system.dtb: /plb@0: failed to match any schema with compatible: ['xlnx,plb-v46-1.03.a', 'xlnx,plb-v46-1.00.a', 'simple-bus']
>> arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000: failed to match any schema with compatible: ['xlnx,compound']
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000/ethernet@81c00000: failed to match any schema with compatible: ['xlnx,xps-ll-temac-1.01.b', 'xlnx,xps-ll-temac-1.00.a']
   arch/microblaze/boot/dts/system.dtb: /plb@0/xps-ll-temac@81c00000/ethernet@81c00000: failed to match any schema with compatible: ['xlnx,xps-ll-temac-1.01.b', 'xlnx,xps-ll-temac-1.00.a']
>> arch/microblaze/boot/dts/system.dtb: i2c@81600000 (xlnx,xps-iic-2.00.a): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml
>> arch/microblaze/boot/dts/system.dtb: i2c@81600000 (xlnx,xps-iic-2.00.a): Unevaluated properties are not allowed ('xlnx,clk-freq', 'xlnx,family', 'xlnx,gpo-width', 'xlnx,iic-freq', 'xlnx,scl-inertial-delay', 'xlnx,sda-inertial-delay', 'xlnx,ten-bit-adr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/xlnx,xps-iic-2.00.a.yaml
>> arch/microblaze/boot/dts/system.dtb: gpio@81400000 (xlnx,xps-gpio-1.00.a): Unevaluated properties are not allowed ('xlnx,family', 'xlnx,is-bidir', 'xlnx,is-bidir-2' were unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/xlnx,gpio-xilinx.yaml
>> arch/microblaze/boot/dts/system.dtb: gpio-leds (gpio-leds): 'green', 'heartbeat', 'red', 'yellow' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml
>> arch/microblaze/boot/dts/system.dtb: serial@84000000 (xlnx,xps-uartlite-1.00.a): Unevaluated properties are not allowed ('clock-frequency', 'device_type', 'xlnx,baudrate', 'xlnx,family' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/xlnx,opb-uartlite.yaml
>> arch/microblaze/boot/dts/system.dtb: /plb@0/debug@84400000: failed to match any schema with compatible: ['xlnx,mdm-1.00.d']
   arch/microblaze/boot/dts/system.dtb: /plb@0/mpmc@90000000: failed to match any schema with compatible: ['xlnx,mpmc-4.02.a']
   arch/microblaze/boot/dts/system.dtb: /plb@0/mpmc@90000000/sdma@84600180: failed to match any schema with compatible: ['xlnx,ll-dma-1.00.a']
   arch/microblaze/boot/dts/system.dtb: /plb@0/interrupt-controller@81800000: failed to match any schema with compatible: ['xlnx,xps-intc-1.00.a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
