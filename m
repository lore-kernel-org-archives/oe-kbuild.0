Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2538B4502F
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 03:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761708913; cv=none; b=Uz+kqqoTxN1b7QdX/o6Vz8RXMoH2IAJqxcGB3wWFwNUbmkYIr9tFRbCbZJ0Z1yhagEf6SLiz0J2wiRm9pnA2LVxAHFs8/Nep/7VByb1Wu0GtLrPqly9yw1vFRDk2wSuJo/f0DZsPFQNZhBE/cDUb2SZgTysVFlTpL+LfIeu8zxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761708913; c=relaxed/simple;
	bh=usiJrma8iabAtHe18i9+zx6QpIoiPvFq6tEDyE7EgZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T+60Tm3KJaMzK5HwwIAIMOhMRT6aeOE0tIRRjHxyrY8DkvnpCc5JPN1LDJIn0e+2EKzfOoQNLrlxzCUbGI39hQu3QGbBFYVlDDkP4lG0UUvnfGCgL/0CWtngJPvdSftt8fFpoP/cqtWtTSBWXYrAc7Al9p3UEooMNg2o2MRU5rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fkHGfu+X; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fkHGfu+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761708911; x=1793244911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=usiJrma8iabAtHe18i9+zx6QpIoiPvFq6tEDyE7EgZ8=;
  b=fkHGfu+Xz2B4CdMKfFdXextEZJ1DyQwaHeLI+WzErdS5WOrjZgGXOMi4
   /sGvUvdxsXtk7kUmHVvBnex5aU/oGeFxzbwVJAUvXU0uM4n2hsBNqPP37
   Y6sk+vpV7ujk4bQOBmgHf2Uw4zcR/EFoLF8BWCWd5cx4FtFqLb7RAS8Wi
   +KqH6EZEjeLK5Pu6pGpj6vE1fB2UdAwfQTCkV+p9YVexyb+jXeC7dn2lq
   Z1ljbFY7vv1HVfIm/lkMzfc5VTxugKKLuR1cdokvWbWD6Hg+yMhxi/ois
   3Bd3YeslvPSsh7AYIZ1dFs96Ogq5dUWTlZ8DleNtaOh6A/E+uIrPA7I2S
   g==;
X-CSE-ConnectionGUID: LoPux5L5TrWhmGGEu301bA==
X-CSE-MsgGUID: GwRwicf6Q02ZTR7KuB2R0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62849148"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="62849148"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 20:35:10 -0700
X-CSE-ConnectionGUID: C9S1NBH/SbOMMXyx1x4wnQ==
X-CSE-MsgGUID: +0sZ+1SgSQOoqcc6O+xVZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="222752493"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Oct 2025 20:35:10 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDwxn-000000000rw-0nlR;
	Wed, 29 Oct 2025 03:35:07 +0000
Date: Wed, 29 Oct 2025 04:34:08 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/nios2/boot/dts/10m50_devboard.dtb: serial@18001530
 (altr,juart-1.0): 'interrupt-parent', 'interrupts', 'reg' do not match any
 of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202510290450.DOXoUh4w-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: ed2a6ff0234e21cd5e56b63d8bff80120bbe5f15 dt-bindings: serial: Convert altr,juart-1.0 to DT schema
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: nios2-randconfig-2052-20251024 (https://download.01.org/0day-ci/archive/20251029/202510290450.DOXoUh4w-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290450.DOXoUh4w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510290450.DOXoUh4w-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: sopc@0 (altr,avalon): clock@1: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: sopc@0 (altr,avalon): $nodename:0: 'sopc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0: failed to match any schema with compatible: ['altr,avalon', 'simple-bus']
>> arch/nios2/boot/dts/10m50_devboard.dtb: serial@18001530 (altr,juart-1.0): 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serial/altr,juart-1.0.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: serial@18001600 (altr,16550-FIFO32): auto-flow-control: 1 is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/sysid@18001528: failed to match any schema with compatible: ['altr,sysid-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:2: 'tx_csr' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:3: 's1' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names: ['control_port', 'rx_csr', 'rx_desc', 'rx_resp', 'tx_csr', 'tx_desc'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
--
   arch/nios2/boot/dts/3c120_devboard.dts:46.11-50.4: Warning (unique_unit_address_if_enabled): /memory@0: duplicate unit-address (also used in node /sopc@0)
   arch/nios2/boot/dts/3c120_devboard.dtb: /: failed to match any schema with compatible: ['altr,qsys_ghrd_3c120']
   arch/nios2/boot/dts/3c120_devboard.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['altr,nios2-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: sopc@0 (altr,avalon): $nodename:0: 'sopc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0: failed to match any schema with compatible: ['altr,avalon', 'simple-bus']
   arch/nios2/boot/dts/3c120_devboard.dtb: bridge@8000000 (simple-bus): $nodename:0: 'bridge@8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/timer@400000: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/timer@8000: failed to match any schema with compatible: ['altr,timer-1.0']
>> arch/nios2/boot/dts/3c120_devboard.dtb: serial@4d50 (altr,juart-1.0): 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serial/altr,juart-1.0.yaml
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/serial@4c80: failed to match any schema with compatible: ['altr,uart-1.0']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
