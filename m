Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B964D318130
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Dec 2025 10:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766745207; cv=none; b=DXzr+sPnG/Iz22F4DWZZ55vrJOGx1qIinZXXoKo3OgaSHSXgYv6qQdN5yv+4w5u63j/lS79F6Yz3yzEr/L5vSMq8Qrt3bWciSsxky4bh9dG2kJ2MU2EveSgWI3xVqX5rZmF/JN8365cJpsfnOLYKfgScEAmCkmXYEMliPlOGCYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766745207; c=relaxed/simple;
	bh=OPK9dENQftA+dOB+RevoceEGQmRjFxMr5+9CBtRcK0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K977ltuVzzw/3Lpo3wn4qZLfIXN0MK3j1EAEVqxNT5WxbF080eb2HlnaiMRIW3n/FfmQ3X5swMC9r2/2beBJHtw2C3RiSTCSt2g5bggeD18IXgFxYqgiWUKO3pKvcvmtdsix/Qo38703rP2HVXJ5S0pxdSajap6UxvK44scUJHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U1pGEI5b; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U1pGEI5b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766745205; x=1798281205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OPK9dENQftA+dOB+RevoceEGQmRjFxMr5+9CBtRcK0g=;
  b=U1pGEI5bkGDQxttDITaHpw4F5dvPsXILtz5xfCpFYvlH5ynCMLB3+gt4
   TkfZzUAiMkDQnb4Q47GDrZ5Rv9pcfHhEtYP/s6PQb6sx24blqWUy64sDA
   yBROWSzcFKHi0dtKCJOCg75PAX9eapapaMhPVDUUvqRfqqcp3g+7tArmn
   d48CvYJvEiBQKB4b/P79m+bsKkQrMJ6zbp1sg0KAWkXMs+R2d5r+SobKb
   PxU8GcxcXnlKGWtVnRUaO9Zj07GnRFrh1lVGph/GKY0gSmOlOJB0bWA5k
   35W43lEOf0efISsnIVtNTUZ/ixDEy2hqTCBrWJB1SS6SOLCuc5QQ3ppL5
   w==;
X-CSE-ConnectionGUID: 0rRVtFXRTC2OCvt6zQaRTQ==
X-CSE-MsgGUID: 5gv29dyqTMq1mSbzCSLPag==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68439681"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68439681"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 02:33:24 -0800
X-CSE-ConnectionGUID: e1CbWsXeQf62ZgGFlb4ldw==
X-CSE-MsgGUID: 6MXNKq5bSSyhtpGigMFLbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="204504420"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 26 Dec 2025 02:33:23 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZ58K-000000006rE-3frT;
	Fri, 26 Dec 2025 10:33:20 +0000
Date: Fri, 26 Dec 2025 11:33:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 75/128]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: iommu@27130c000
 (apple,t8103-dart): 'apple,dma-range' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202512261148.ykhNRcg7-lkp@intel.com>
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
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-2052-20251224 (https://download.01.org/0day-ci/archive/20251226/202512261148.ykhNRcg7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512261148.ykhNRcg7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512261148.ykhNRcg7-lkp@intel.com/

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
