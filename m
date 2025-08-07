Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A70B19D8BC
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Aug 2025 20:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754599779; cv=none; b=eCmegCffHtFw3ctmRG6bPvHUX9i1PXzd/4ot5Kh/pDioob23wTjwQFo1yqSQTwP/aGz4Nyk0PHE11LlwVwpgQXSxqwHjk+oPo3TC5CLDqSJHNKKvYA5YNQxSh1t6wjgNs3o5t4fa4tlIFbAi12hbNYz/2IIWohzzsd/cnQ37kLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754599779; c=relaxed/simple;
	bh=ye/SHkg+S1qMQaaKqWyWYQjUQlE1r+IaNfaBOhLExY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HfRb+aKi2UHrEE4cn0t+nQ6Y+G5wNMxtn7zic0dUbfcly6ubTyFNGi2iksZY85I2Sq9mCgRzemPO6Aa42KM32pdnilyP7h6ym3SGOA68LBYPWQQKBM3JRF/O2LB1sA90u67avgYF9nQAEEqFhX5H6I+Td2qnL07qxBausG/27Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iLeSLny1; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iLeSLny1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754599777; x=1786135777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ye/SHkg+S1qMQaaKqWyWYQjUQlE1r+IaNfaBOhLExY4=;
  b=iLeSLny1QQbDVBIPYAv0pIn+xIF5gRUmN9GMO0JYiJuCM/vEqBW4pYjA
   dg8nedaSzYYKFCMiCzGgZGSB38gYmfEttUlrXViOTjDsi3K5Wd/AGcw65
   sI7J07tRbf6BpsOJhLMBSdT56dF98FpjysJHGyzHEZlqpQUt4bkhu4Tgd
   D4GCtKJffVdjImdvt722ueF7UfuY8YIZ/KLWoo/5mv/ws1SfbUAJbWUPM
   WUYlKA2q3N5Xfw+m7CnVcutq6USUtESlWV25Msel9w5moYmFFOCpxfTVy
   xi4u7OLCLttsY6LiK13vCagsfxMY96ZzTkBaFZ+lyXmzyvCS2D+32r9Rk
   A==;
X-CSE-ConnectionGUID: EAbZ/qhUQVadEhnPmrmc4Q==
X-CSE-MsgGUID: s1wIi1KYTLm/tz0DenITMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="57026031"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="57026031"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2025 13:49:37 -0700
X-CSE-ConnectionGUID: UyML0WNgThCQxxc2ve0C3g==
X-CSE-MsgGUID: VBgZuLq4RlmBbgNwBUGcQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="169617629"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 07 Aug 2025 13:49:36 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uk7YL-0003Dg-1j;
	Thu, 07 Aug 2025 20:49:33 +0000
Date: Fri, 8 Aug 2025 04:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:dt-convert 13/801]
 arch/arm/boot/dts/axis/artpec6-devboard.dtb: / (axis,artpec6-dev-board):
 '#address-cells', '#size-cells', 'aliases', 'amba@0',
 'cache-controller@faf10000', 'chosen', 'clkctrl@f8000000', 'cpus',
 'eth_phy_ref_clk', 'ext_clk', 'gtimer@faf00200', 'interrupt-c...
Message-ID: <202508080419.P9OHYtJT-lkp@intel.com>
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
:::::: branch date: 27 hours ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250807 (https://download.01.org/0day-ci/archive/20250808/202508080419.P9OHYtJT-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7b8dea265e72c3037b6b1e54d5ab51b7e14f328b)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250808/202508080419.P9OHYtJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508080419.P9OHYtJT-lkp@intel.com/

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
