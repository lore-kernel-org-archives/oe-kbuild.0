Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A4E8821
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Aug 2025 01:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755220711; cv=none; b=NFKtDYMU/KD4AwCxGDnCFbiHE5KsP0DAgMj3LPqCjgP4iKFZ2gL9+KiPHUEwKfHG8XMMlCjReW5kl/q5TIbkJ3gTIHwxZBQeA3mVSgQpWlZ0V3U7kc47fzd7iedoo0CkjVLOV7mOMU9UZKYNJam040GkqpJfInuS1twj7qVo1V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755220711; c=relaxed/simple;
	bh=LlYwnqkHeDZ3J+eqpNDFrIn7FPCEk9tahoq3dNf983U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RRzTVSykjIwI+5B6GNpl11aal01pSG1AEApglc8SRto6FTRhsa/OjbmHIxnWFkk/w8c4H/AvIrUsr/C00JwvhQwjOCq/KvZD5QPH95Sgu9ecODm5t/wI0PyBePcuCmEo+bsBeZwj9VvuKV7kSv6dVZ8o11n2I2L4YWUxLw9pC/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C+FlR1mi; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C+FlR1mi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755220710; x=1786756710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LlYwnqkHeDZ3J+eqpNDFrIn7FPCEk9tahoq3dNf983U=;
  b=C+FlR1mim06Wj/rN3v0racFmWJqjRsV/UavT9CujvJDNIvb2ZmJOfGDN
   tra3z2zno2V++ayKUuPHgMdbWN/Ws8Cq2ZHZXgH2O7/lxu0/k3+LfMiTg
   xmI9qsoo6q1rb+NoPaun+4CprtXPoL6BPx6cCZsL3gHAo/wyre7/SRjUZ
   YhUOHYdcnMxkDx9Hx3603nc232tH6MHwc9PZdRTzxyfSlrdcbVpZjLYb9
   1aqId9uo6GMJ5hkIAfr7DLV8mCLnEW3l4OmT9zCN99biiolMgKq9UjSIj
   PmTNSvx7LKnBsJM+/uJ8elzFakVWGgw229inrurQeX60iUmy3R6vmFe/H
   Q==;
X-CSE-ConnectionGUID: 6Pj1K8xIRBSwiIsFagssLw==
X-CSE-MsgGUID: HoFp+vTVRSyPxjds6bLUtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="68633489"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="68633489"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 18:18:29 -0700
X-CSE-ConnectionGUID: nTthVHPbTYSUCA/eegdpBw==
X-CSE-MsgGUID: oGehEJTcS0uuLlrVLU+l/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="190600797"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 14 Aug 2025 18:18:28 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umj5N-000BPw-1J;
	Fri, 15 Aug 2025 01:18:25 +0000
Date: Fri, 15 Aug 2025 09:17:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 634/801] arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb:
 ucc@2200 (fsl,t1040-ucc-uart): 'cell-index', 'interrupt-parent',
 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
Message-ID: <202508150912.6GH7xbFA-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   6752ef54777b7f91fb5cae7cfac46af194c15d1b
commit: 021c150d48dc42ef655a72530d3bc3f56857b66d [634/801] dt-bindings: soc: Convert fsl/cpm_qe/fsl,t1040-ucc-uart to DT schema
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: powerpc-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250815/202508150912.6GH7xbFA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150912.6GH7xbFA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508150912.6GH7xbFA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qe@ffe140000 (fsl,qe): $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qe@ffe140000 (fsl,qe): interrupt-controller@80: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: qe@ffe140000 (fsl,qe): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: ucc@2200 (fsl,t1040-ucc-uart): 'cell-index', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,t1040-ucc-uart.yaml#
   arch/powerpc/boot/dts/fsl/t1040d4rdb.dtb: interrupt-controller@80 (fsl,qe-ic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qe@ffe140000 (fsl,qe): $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qe@ffe140000 (fsl,qe): interrupt-controller@80: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: qe@ffe140000 (fsl,qe): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040qds.dtb: ucc@2200 (fsl,t1040-ucc-uart): 'cell-index', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,t1040-ucc-uart.yaml#
   arch/powerpc/boot/dts/fsl/t1040qds.dtb: interrupt-controller@80 (fsl,qe-ic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qe@ffe140000 (fsl,qe): $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qe@ffe140000 (fsl,qe): interrupt-controller@80: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: qe@ffe140000 (fsl,qe): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: ucc@2200 (fsl,t1040-ucc-uart): 'cell-index', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,t1040-ucc-uart.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb-rev-a.dtb: interrupt-controller@80 (fsl,qe-ic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qe@ffe140000 (fsl,qe): $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qe@ffe140000 (fsl,qe): interrupt-controller@80: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: qe@ffe140000 (fsl,qe): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1040rdb.dtb: ucc@2200 (fsl,t1040-ucc-uart): 'cell-index', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,t1040-ucc-uart.yaml#
   arch/powerpc/boot/dts/fsl/t1040rdb.dtb: interrupt-controller@80 (fsl,qe-ic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qe@ffe140000 (fsl,qe): $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qe@ffe140000 (fsl,qe): interrupt-controller@80: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: qe@ffe140000 (fsl,qe): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: ucc@2200 (fsl,t1040-ucc-uart): 'cell-index', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,t1040-ucc-uart.yaml#
   arch/powerpc/boot/dts/fsl/t1042d4rdb.dtb: interrupt-controller@80 (fsl,qe-ic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qe@ffe140000 (fsl,qe): $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qe@ffe140000 (fsl,qe): interrupt-controller@80: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: qe@ffe140000 (fsl,qe): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042qds.dtb: ucc@2200 (fsl,t1040-ucc-uart): 'cell-index', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,t1040-ucc-uart.yaml#
   arch/powerpc/boot/dts/fsl/t1042qds.dtb: interrupt-controller@80 (fsl,qe-ic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qe@ffe140000 (fsl,qe): $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qe@ffe140000 (fsl,qe): interrupt-controller@80: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: qe@ffe140000 (fsl,qe): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb.dtb: ucc@2200 (fsl,t1040-ucc-uart): 'cell-index', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,t1040-ucc-uart.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb.dtb: interrupt-controller@80 (fsl,qe-ic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#
--
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qe@ffe140000 (fsl,qe): $nodename:0: 'qe@ffe140000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qe@ffe140000 (fsl,qe): interrupt-controller@80: '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qe@ffe140000 (fsl,qe): compatible: ['fsl,qe'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: qe@ffe140000 (fsl,qe): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'compatible', 'device_type', 'ucc@2000', 'ucc@2200' were unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe.yaml#
>> arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: ucc@2200 (fsl,t1040-ucc-uart): 'cell-index', 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,t1040-ucc-uart.yaml#
   arch/powerpc/boot/dts/fsl/t1042rdb_pi.dtb: interrupt-controller@80 (fsl,qe-ic): '#address-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe-ic.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
