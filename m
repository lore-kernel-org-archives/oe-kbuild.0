Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FE7202C5C
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Dec 2025 22:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766873345; cv=none; b=eYOtR4Y61kpXVNv63DL6JijE7DKkCnNsx6nzBGXb7ag3ywTKZpfRNtlwc8Nt+Mf2kxt7dHi6KoeprknlX1uITMkKjFbCGpLyQIqT629HxhL2vtAPGDXbDsTrjTor0G2CtYiNtv9MSSb32tBBJvy+Lp2+MILbYSiUGX+7leL63sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766873345; c=relaxed/simple;
	bh=vqaNnMZs67niWAUGPTow132zPqWLoTqhFqe/FjIhcu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tcZMtsSNC7+vD2edF6K4UFnbNDXg+1LEdl8OPkSkaAtPxNRXGr3T7nCO63/G6w10//sN/Hu2lQabvJWb1uwHW/DSx+08+qKHyVTSTbgv9yITnpPx5FVONK+smgVYX5nbaP822oueIWMU16YhwpY3EzOsF0cPURJq0yG6cF1uXaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KaMiREkD; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KaMiREkD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766873343; x=1798409343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vqaNnMZs67niWAUGPTow132zPqWLoTqhFqe/FjIhcu8=;
  b=KaMiREkD8CmI6RTdUdzQfXhnfv7xKlJ9WyybOt0ClQLemuNj9+yOF6Cm
   Cncl6QFoPC44kb4P8UY4O+aCoPIBE7k6ND83lJVXLqWhScqly25CAV9Og
   uIIuAs238082rKqEGpdocduf1PB9ZcXbevL3tmpyqKTea/ajUhcBBz1Lu
   YL8dVlpwmbd+2B5yvEznftKQ4aPt5wIZcKPdH9DzO32hWrSxxwc5hPS4n
   BrgcaWRxvP4m9Q7F1+XmMYsdAQ1w8fusq/LB49e4WHFgt6MBqa2gKVMgN
   s/BIJMCrDJKQQ9/kBNXlbX5wl6qs5DuJV08j+vR6atVTmZR7cXJGUm7HB
   A==;
X-CSE-ConnectionGUID: X9h4m1bjRd+pBqp1cAliLg==
X-CSE-MsgGUID: RNPz5b2oRQuIjUZwPBPG8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68628026"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="68628026"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 13:59:44 -0800
X-CSE-ConnectionGUID: /wbcUZaySTSuWIBvslR/zQ==
X-CSE-MsgGUID: bTJTNcbrTSuFHqHNu/HRcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="200914242"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Dec 2025 13:59:43 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZcK4-000000007HQ-3IE8;
	Sat, 27 Dec 2025 21:59:40 +0000
Date: Sat, 27 Dec 2025 22:59:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 75/128]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: iommu@27130c000
 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202512272247.KYZoQYhV-lkp@intel.com>
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
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   51bf311a24a70b86e55dc44e36185917f29e1676
commit: 8b7e508a66a02b84b5beb5d98ecc54e00fb97701 [75/128] arm64: dts: apple: t8103: Add dcpext/dispext0 nodes
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251227/202512272247.KYZoQYhV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272247.KYZoQYhV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512272247.KYZoQYhV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@4008 (apple,t8103-pmgr-pwrstate): 'apple,force-disable', 'apple,force-reset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: power-controller@4010 (apple,t8103-pmgr-pwrstate): 'apple,force-disable', 'apple,force-reset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: smc@23e400000 (apple,t8103-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: iommu@271304000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: iommu@27130c000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: mbox@271c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@4008 (apple,t8103-pmgr-pwrstate): 'apple,force-disable', 'apple,force-reset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: power-controller@4010 (apple,t8103-pmgr-pwrstate): 'apple,force-disable', 'apple,force-reset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: smc@23e400000 (apple,t8103-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: iommu@271304000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: iommu@27130c000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: mbox@271c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@4008 (apple,t8103-pmgr-pwrstate): 'apple,force-disable', 'apple,force-reset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: power-controller@4010 (apple,t8103-pmgr-pwrstate): 'apple,force-disable', 'apple,force-reset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: smc@23e400000 (apple,t8103-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: iommu@271304000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: iommu@27130c000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: mbox@271c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@4008 (apple,t8103-pmgr-pwrstate): 'apple,force-disable', 'apple,force-reset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: power-controller@4010 (apple,t8103-pmgr-pwrstate): 'apple,force-disable', 'apple,force-reset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: smc@23e400000 (apple,t8103-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: iommu@271304000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: iommu@27130c000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: mbox@271c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@4008 (apple,t8103-pmgr-pwrstate): 'apple,force-disable', 'apple,force-reset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: power-controller@4010 (apple,t8103-pmgr-pwrstate): 'apple,force-disable', 'apple,force-reset' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: smc@23e400000 (apple,t8103-smc): 'rtc' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/apple,smc.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: iommu@271304000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: iommu@27130c000 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: mbox@271c08000 (apple,t8103-asc-mailbox): 'resets' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: efuse@23d2bc000 (apple,t8103-efuses): Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@382280000: failed to match any schema with compatible: ['apple,t8103-dwc3']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/phy@383000000: failed to match any schema with compatible: ['apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/usb@502280000: failed to match any schema with compatible: ['apple,t8103-dwc3']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
