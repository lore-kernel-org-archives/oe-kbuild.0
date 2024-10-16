Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA0F204F88
	for <oe-kbuild@lists.linux.dev>; Wed, 16 Oct 2024 09:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729070765; cv=none; b=auZGf+XBy+PLc0YGaTavSkJ404ig7E2JTOZ9+cqQNcxWxkRaT6HoT7joNZn4z8barWfuDhBt6/LhrLvoAZ+3JoYKt6iRDr6LY7EfwEOU5NpDc0tHB0ci5VKCpd0lsW89E+IK6ZOPA54lVVB7qRAz8tA4vpESAYbxQX0DPAxSixo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729070765; c=relaxed/simple;
	bh=gumGrLjAADREFPX4whKHcONmFAwMugZ/iTzQ1fiH01s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZdVUNi77CVUinx23V66mRlSZyFFg/BOlx5Sn+4OEZEB4/1SOeB7/zsmLf8GVlOJLy0/bMjwUnR8oZ45jqLgZKjA2R4L5imzxH1EA5yR194AF8PeG69jTL7tD1NhNMaw6GTtm15W3RDR1k5EEVk+EpLJIttNRR3pNia0Rf94OnQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEiArck6; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEiArck6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729070764; x=1760606764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gumGrLjAADREFPX4whKHcONmFAwMugZ/iTzQ1fiH01s=;
  b=ZEiArck6C1vzzDFo9IN+agMqq9wdmzGEKEQwNaCN5Zj8EaRL/3WjOrFA
   mHavi1DK//r7dI3vSDvU02ny1JRWkdRmonXIIbt3O47JjhMEB4wGl001L
   CW1ayc/2Thm/FlHbQa9uiDoo+JrzyOxjdsZVju4sEXncXQ79zYpdopzqm
   e/vCtcF6HVtZNE+XFY8cPMBS/25T4mWkstU1sIMU2W7OO0yGOgYg0ExSL
   QPXMB+vSS5GQK47qEFl0VQlS8ye0hMkoczTci/rTn7y1Nxvo30HR6zoW6
   QRrzl9AzLeys0FIMkTMbzXmXvg4s3oCmX5BvG3ToVhc277BLGBVN08e88
   Q==;
X-CSE-ConnectionGUID: Jiuhub5DTSuVvmoMU4Osxw==
X-CSE-MsgGUID: gziW7MkzTpec2tPp1Kdllg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28604938"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28604938"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 02:26:03 -0700
X-CSE-ConnectionGUID: 3krHHUdSThGMDTm98WaFsw==
X-CSE-MsgGUID: EzaJJP0lRlCMx+d+tvL1zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,207,1725346800"; 
   d="scan'208";a="77790502"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Oct 2024 02:26:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t10I4-000Kge-13;
	Wed, 16 Oct 2024 09:26:00 +0000
Date: Wed, 16 Oct 2024 17:25:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 11/44]
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning
 (unit_address_vs_reg):
 /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a
 unit name, but no reg or ranges property
Message-ID: <202410161719.zUzN6742-lkp@intel.com>
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
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 4 months ago
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241016/202410161719.zUzN6742-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241016/202410161719.zUzN6742-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410161719.zUzN6742-lkp@intel.com/

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
