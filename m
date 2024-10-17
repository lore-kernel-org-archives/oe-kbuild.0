Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0F641C6C
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Oct 2024 03:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729136459; cv=none; b=UHxQlzODQgoJwxnFg0SLv0Q0dKZzC03bgMW7R2W5MtwhJBmjNHukNknHXRxCE0XzzlQa4HwNom/j322NBIfrDNxpUo68bwnf1739eD8oxOvE/KBLUMI+RizKGkaTk2P1dHyzcwOi9an+l4V08swvrYgSMYKLT1ba9Nu9iUce6eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729136459; c=relaxed/simple;
	bh=y5NE9jap14rJKLYVXbTMYJnq1P69dGAbvCWs72uDxZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C4/oqZdXTiW+2kW+44+dZ89bgOGXqVyByWRgmPCKXWo67YqKCaUiYakdjuU1Yb3oUJGkb2oZaaVB8f69a+pOGROQbRjd82tPjRifQsqGcFRi3+FQbF3SxEf8rRALzrFi9ApQpGXEX1xdkZmLuglmMVdSq8AixdGm0ztiHMEUGuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KCRknAj2; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KCRknAj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729136456; x=1760672456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y5NE9jap14rJKLYVXbTMYJnq1P69dGAbvCWs72uDxZY=;
  b=KCRknAj28uLBqjjLs+1mRYD/Mf4g4e4tcpCznq98i7pgIJ+cXO+eXccD
   jt9QEiJdU/jsL+coJ7PVBqyMB8pbErdLr0L9hoejjFo0mSADWI8ZG1iwS
   fr5fjn5mbCn0hHaUXemFsP7xQxcddAFDN7BLkcusyuTjnpYgiurJnSp91
   e+nXho3A3oRSia57vm5RmYzSfmmshJRlrQ7Z5b7lSYXfEXOJEWc7Slk9d
   WeyyjZJWXCHo2K6Mf0xBuUVdcmzIgvT2OcGWONwo05QU3Gg4zdU7aOtNg
   /V4F73Y68Q4Xk5ZjmBPRAw8RLAIXbGfbEL5epiKTrajCOYC+OiFa65SmY
   w==;
X-CSE-ConnectionGUID: CKpdhsA+Sxut/s75Wl3kLQ==
X-CSE-MsgGUID: 7z2Wn7FsR8GlWSxwldPvXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51153613"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="51153613"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 20:40:56 -0700
X-CSE-ConnectionGUID: r1r4Ns8kT/qBdAWjjjJUfQ==
X-CSE-MsgGUID: Yd9wBuMwRx+7Fc/oLzw34w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; 
   d="scan'208";a="83485052"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 16 Oct 2024 20:40:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1HNc-000Lgx-1i;
	Thu, 17 Oct 2024 03:40:52 +0000
Date: Thu, 17 Oct 2024 11:39:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 11/44]
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning
 (unit_address_vs_reg):
 /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a
 unit name, but no reg or ranges property
Message-ID: <202410171143.hA4mhbfW-lkp@intel.com>
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
CC: vigneshr@ti.com
CC: nm@ti.com
TO: Vaishnav Achath <vaishnav.a@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 453e0e54ada305a3320d743e5511ee0fe844f23f [11/44] arm64: dts: ti: k3-j721e-mcu-wakeup: Add HyperBus node
:::::: branch date: 32 hours ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241017/202410171143.hA4mhbfW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241017/202410171143.hA4mhbfW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410171143.hA4mhbfW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning (unit_address_vs_reg): /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:71.39-76.8: Warning (unit_address_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1909.34-1918.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:725.25-751.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:773.25-799.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:821.25-847.4: Warning (unique_unit_address): /bus@100000/pcie@2920000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2920000)
--
>> arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning (unit_address_vs_reg): /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:71.39-76.8: Warning (unit_address_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:725.25-751.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:773.25-799.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:821.25-847.4: Warning (unique_unit_address): /bus@100000/pcie@2920000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2920000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:869.25-895.4: Warning (unique_unit_address): /bus@100000/pcie@2930000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2930000)

vim +184 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi

453e0e54ada305 Vaishnav Achath 2023-06-07 @184  		hbmc_mux: mux-controller@47000004 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
