Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57832E7BCA
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Aug 2025 16:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755967281; cv=none; b=Fv4WiNa8FUaja7bYBgubl2Ce9Iv4yYaEoUcezB7sWFyBH7wO8GQP4kdaeNCY+mudOh1N88WCPPL2Qz9lRNr7x1jHokZ3PDg60CxPQmzVoOA1f07XaI54kCwWlvoaTpZVjRlwKa7LsWDUmqpYzDmITyvE/MNWRpvPlu44dFZJwyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755967281; c=relaxed/simple;
	bh=FwsdD0bGjjF0g8duX20VYEc7Ott97h73vhAzyL/j4AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jIxEsFSKfO4MNtOCgUz+6ZA+syTaN4Oh4AuW766d6EulN0VPqizPwQPLR5djNhGyEKLiG2Nyt8OooGeK/HwmWVyxTlBGQnKbBdEhvhQp67dUUn+rMIM8659Nc+ti4NyOWZgfqeqC+A5y229QY2ST1fPnLcK5+kc+9JKS9mjv36Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DY7iB3s3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DY7iB3s3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755967279; x=1787503279;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FwsdD0bGjjF0g8duX20VYEc7Ott97h73vhAzyL/j4AQ=;
  b=DY7iB3s3Yacmp1pm6KUjBgBx/BhBa4l/BQ0amVhbdS5jZOpjr7/tscrI
   phInDadkTAl3hgEvHUEjEFm1g0fhJ7+JKo/vNvjBFYh2Gx6mScbSpxWzi
   e8xCGQs/sKCfxsQpXO4oCq71WMPDRmThgXS1CMZBt0KUmP96kvkHyC0Iz
   5lMOVKFsi0rlbWRYjYJ9D/OzTgVIBZDo8YqUbZHFw+o8oVuPEcys9H7JS
   w9Fd7R+rMtIAnxJAiIJ/MXqw6l0cEyy6Ctd/pWpt22COwjzTZGroo3yk+
   W3SLZNIF+YxnnZf9fhboNf7M/Apd61CYXSxYUJ5wlqeAgm0Oy8d7/PBQI
   A==;
X-CSE-ConnectionGUID: pl3LOK6KTl+AMmSE3s7n3A==
X-CSE-MsgGUID: JQzsDc7NQoqdLjUwjwda4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="69348884"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69348884"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 09:41:17 -0700
X-CSE-ConnectionGUID: l2uBhxRQRy2jpAfh7S0blA==
X-CSE-MsgGUID: V1CbcGC7T3u66udO7tSMyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173211274"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 23 Aug 2025 09:41:16 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uprIU-000MQl-12;
	Sat, 23 Aug 2025 16:41:01 +0000
Date: Sun, 24 Aug 2025 00:40:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 35/45]
 arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi
 (arm,scmi): Unevaluated properties are not allowed ('protocol@80',
 'protocol@81', 'protocol@82', 'protocol@84' were unexpected)
Message-ID: <202508240005.4AXldVGn-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Peng Fan <peng.fan@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   5a796a700ff8a26b8c17bfa5b789dd24ce19c3b6
commit: 770fcc6856e986b4dc976d22e64083a4a772a69f [35/45] arm64: dts: imx95: Add LMM/CPU nodes
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: arm64-randconfig-051-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240005.4AXldVGn-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240005.4AXldVGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508240005.4AXldVGn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa.dtsi:276.9-288.5: Warning (graph_child_address): /soc/bus@42000000/i2c@42530000/dp-bridge@f/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('linux,code' was unexpected)
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
>> arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: scmi (arm,scmi): Unevaluated properties are not allowed ('protocol@80', 'protocol@81', 'protocol@82', 'protocol@84' were unexpected)
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c300000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#
   arch/arm64/boot/dts/freescale/imx95-tqma9596sa-mb-smarc-2.dtb: pcie@4c380000 (fsl,imx95-pcie): clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
