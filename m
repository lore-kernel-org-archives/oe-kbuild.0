Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E852244E8C
	for <oe-kbuild@lists.linux.dev>; Fri,  8 Aug 2025 22:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754692472; cv=none; b=P4WN9tq/IC5GxnJKQSdmFU2b9isSWpqi+dKX+93nwaL4eXSSNWl1RNtCS6p2Ehgbc3NZQ18TJ4d7Ox9Egp4vL/jY9SDI1X6i+vlwRavZiEyjkYEncxujCEm5wNggJ9ei0rtnk2uoc8ygTU7DPV7hAFT5JqCQP2wVh4KPM0H+oAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754692472; c=relaxed/simple;
	bh=y60Qwf82d1Avj+LYqybyxEclLH2QszJrzuc5J/Pnevo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jprg2hp1PRA+zwq6yaJGwAQjlV5ktNYVhUOwREU6k7EsWcvzTA5e8A4yOOiJ9ZJ6/ZrrIRkg8mNyT24nRjwGxLuiG8uT+1fLx0AG/GcbTgdedQNOn2RumTVxVh4203jcoxbqtXc4lbUizLM++xLoMOcaPtj887HI5ZHMtD2/TyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MjUQehVH; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MjUQehVH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754692471; x=1786228471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y60Qwf82d1Avj+LYqybyxEclLH2QszJrzuc5J/Pnevo=;
  b=MjUQehVHgCzJe28x9Snn69o0H0ORSSNN5azLzmfOmZcengSIGPTJlLjI
   N7hMZyJXbMVQamfny91xbzgl62RG5FZcVkEc2ZzJijOc44bSxVPHI6u7X
   ShqaTCe5NU9muQgGINumRIdwH+LOs+DnztmdOm/PkUX2J+izE/l4cmA8l
   TyztANmpOJkC572tzq/WGeh+AgIurgyK5Wqsq1CgXuXhAJ/8GkYtNRKvF
   DOeRO7IVuy+qlWDbDH18aW1r+GGjkJJmYaGA45X0H0Ft0Gcct/VtsReUS
   LbSZmaG5+9IYNdLu08AhKF9luQtbDYNlzEIyGpLfkydHMXU+y3os3ERh8
   g==;
X-CSE-ConnectionGUID: zS93DjuLQcGMPGLNc4NISA==
X-CSE-MsgGUID: rUNmQZB0TUa4FJ7GTsdxPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="56970328"
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="56970328"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 15:34:31 -0700
X-CSE-ConnectionGUID: G0HOrxsWQSaXAM5OnGa2/g==
X-CSE-MsgGUID: UK6jfztsRfKalyepRO/KJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,278,1747724400"; 
   d="scan'208";a="169881999"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2025 15:34:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukVfP-0004N8-0Z;
	Fri, 08 Aug 2025 22:34:27 +0000
Date: Sat, 9 Aug 2025 06:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 13/801]
 arch/arm/boot/dts/axis/artpec6-devboard.dtb: / (axis,artpec6-dev-board):
 '#address-cells', '#size-cells', 'aliases', 'amba@0',
 'cache-controller@faf10000', 'chosen', 'clkctrl@f8000000', 'cpus',
 'eth_phy_ref_clk', 'ext_clk', 'gtimer@faf00200', 'interrupt-c...
Message-ID: <202508090619.2ghsoE81-lkp@intel.com>
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
commit: a27e7886c1e8ece6f1e80e13fcbfc4eabc19c850 [13/801] dt-bindings: arm: Convert axis,artpec6 to DT schema
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: arm-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250809/202508090619.2ghsoE81-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090619.2ghsoE81-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508090619.2ghsoE81-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/axis/artpec6.dtsi:229.9-387.4: Warning (unit_address_vs_reg): /amba@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/axis/artpec6-devboard.dts:22.9-25.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/axis/artpec6.dtsi:72.26-75.4: Warning (unique_unit_address_if_enabled): /syscon@f8000000: duplicate unit-address (also used in node /clkctrl@f8000000)
>> arch/arm/boot/dts/axis/artpec6-devboard.dtb: / (axis,artpec6-dev-board): '#address-cells', '#size-cells', 'aliases', 'amba@0', 'cache-controller@faf10000', 'chosen', 'clkctrl@f8000000', 'cpus', 'eth_phy_ref_clk', 'ext_clk', 'gtimer@faf00200', 'interrupt-controller@faf01000', 'interrupt-parent', 'memory', 'model', 'pcie@f8050000', 'pcie_ep@f8050000', 'pinctrl@f801d000', 'pmu', 'psci', 'scu@faf00000', 'syscon@f8000000', 'timer@faf00600' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/axis,artpec6.yaml#
   arch/arm/boot/dts/axis/artpec6-devboard.dtb: / (axis,artpec6-dev-board): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[0, 1073741824]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
   arch/arm/boot/dts/axis/artpec6-devboard.dtb: psci (arm,psci-0.2): 'psci_version', 'system_reset' do not match any of the regexes: '^pinctrl-[0-9]+$', '^power-domain-'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
   arch/arm/boot/dts/axis/artpec6-devboard.dtb: psci (arm,psci-0.2): 'cpu_off' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
   arch/arm/boot/dts/axis/artpec6-devboard.dtb: /pinctrl@f801d000: failed to match any schema with compatible: ['axis,artpec6-pinctrl']
   arch/arm/boot/dts/axis/artpec6-devboard.dtb: amba@0 (simple-bus): $nodename:0: 'amba@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
