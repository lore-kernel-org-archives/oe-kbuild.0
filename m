Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB141E3DD3
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Jan 2025 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736255923; cv=none; b=cIUalBZqd+NURUqGv6jnb7kz+46TwXoP6sQnpRBmQEouD+CCgktBptmIRwSRYKfuy9IJazgls6LBG9xEZ+84uRg7i2ntWmEIO0c4uDh5NJTWCwy/AgEfWtGCsfDVKli/XYSmI0XOKg2aGC1Xu1ICfMCt47rFKMzaRryz7PiOpCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736255923; c=relaxed/simple;
	bh=cemST7LZAW26SBvQrLPWn5ZJGa+V3R0hgBS2RbQrTE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qEeWb2S1g00Ln0tkWl8l3146uOEzCq2iFqRwtU2AQONLudJdDeb6WIirqKV9nRd4f1LVld9nOhqJXcBdTFzBmaULBf2417rcfFlXpUpR9iIyQ0KlfCQ3gqWb0pzmArLRHigRPs5oyaUGr1vnHIaKh7pVmiPd76RvOLJNxIET0bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gYY1FsHT; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gYY1FsHT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736255918; x=1767791918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cemST7LZAW26SBvQrLPWn5ZJGa+V3R0hgBS2RbQrTE0=;
  b=gYY1FsHTMBV96ZbQaz+8U26Y4Om3nZAIW4jhROkQEH9xqODM7LReIRn7
   ffSWOrx7bt7kykt9N/c2Zrx3Fjceu4GgjTComV13/FkPFTiZrFOkNwtwt
   W41ZwKw1BjBrDWxxpcsQ5Zcf+FBl1jm7rRuwvlN94eboyuwFZkNs9JLxp
   rlt5sEMn4pN+HNK/SwfNXLtD9Zn/P8+ZUWHZhh7L1VYj8TbTu0/KFTWqU
   Oiz4JR8CYWkSnbkEjgWVY2Ml8fVZ4yiypzb/thMy4pMmRbkWwczrPRsgn
   AJa5/USE2l/xDdDYsFPaDJ2sP8xptsw1qJv0W5Cd6WbGfcn5om2kFKKr3
   Q==;
X-CSE-ConnectionGUID: HzdaxUxSRW6DaR8LybAstA==
X-CSE-MsgGUID: jjIxUtMwSqiUN4wUFSP5Hw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="47428182"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; 
   d="scan'208";a="47428182"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 05:18:38 -0800
X-CSE-ConnectionGUID: 9Hf6ApZ5TkGjARqECQh8/A==
X-CSE-MsgGUID: oQ+SK5PiR8SrS62LrjLxKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107852797"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Jan 2025 05:18:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tV9Td-000Eix-2H;
	Tue, 07 Jan 2025 13:18:33 +0000
Date: Tue, 7 Jan 2025 21:17:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 188/190]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dma-controller@24a980000:
 failed to match any schema with compatible: ['apple,t8103-admac2',
 'apple,admac2']
Message-ID: <202501072129.UHNpvBIG-lkp@intel.com>
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
TO: Sasha Finkelstein <fnkl.kernel@gmail.com>
CC: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   222665071e36671757433aab95e9edd4075ffb9f
commit: 30b025da438595454905479e8c236cf03d5bd7be [188/190] arm64: dts: apple: Add AOP and subdevices
:::::: branch date: 4 days ago
:::::: commit date: 8 days ago
config: arm64-randconfig-051-20250104 (https://download.01.org/0day-ci/archive/20250107/202501072129.UHNpvBIG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250107/202501072129.UHNpvBIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501072129.UHNpvBIG-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8103-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8103-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spmi@23d0d9300/pmu@f: failed to match any schema with compatible: ['apple,sera-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spmi@23d0d9300/pmu@f: failed to match any schema with compatible: ['apple,sera-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spmi@23d0d9300/pmu@f/rtc_nvmem@d000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/spmi@23d0d9300/pmu@f/scrpad_nvmem@a000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8103-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8103-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/aop@24ac00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: mbox@271c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j274.dtb: efuse@23d2bc000: Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000: iommus: [[151, 0], [152, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j274.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8103-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8103-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spmi@23d0d9300/pmu@f: failed to match any schema with compatible: ['apple,sera-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spmi@23d0d9300/pmu@f: failed to match any schema with compatible: ['apple,sera-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spmi@23d0d9300/pmu@f/rtc_nvmem@d000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spmi@23d0d9300/pmu@f/scrpad_nvmem@a000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8103-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8103-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/aop@24ac00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: mbox@271c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: efuse@23d2bc000: Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000: iommus: [[153, 0], [154, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8103-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8103-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spmi@23d0d9300/pmu@f: failed to match any schema with compatible: ['apple,sera-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spmi@23d0d9300/pmu@f: failed to match any schema with compatible: ['apple,sera-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spmi@23d0d9300/pmu@f/rtc_nvmem@d000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spmi@23d0d9300/pmu@f/scrpad_nvmem@a000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8103-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8103-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/aop@24ac00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: mbox@271c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: efuse@23d2bc000: Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000: iommus: [[153, 0], [154, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8103-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8103-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spmi@23d0d9300/pmu@f: failed to match any schema with compatible: ['apple,sera-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spmi@23d0d9300/pmu@f: failed to match any schema with compatible: ['apple,sera-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spmi@23d0d9300/pmu@f/rtc_nvmem@d000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/spmi@23d0d9300/pmu@f/scrpad_nvmem@a000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8103-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8103-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/aop@24ac00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: mbox@271c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j456.dtb: efuse@23d2bc000: Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000: iommus: [[152, 0], [153, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j456.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8103-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spmi@23d0d9300: failed to match any schema with compatible: ['apple,t8103-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spmi@23d0d9300/pmu@f: failed to match any schema with compatible: ['apple,sera-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spmi@23d0d9300/pmu@f: failed to match any schema with compatible: ['apple,sera-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spmi@23d0d9300/pmu@f/rtc_nvmem@d000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/spmi@23d0d9300/pmu@f/scrpad_nvmem@a000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8103-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8103-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8103-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/aop@24ac00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: mbox@271c08000: 'resets' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: /soc/dcp@271c00000: failed to match any schema with compatible: ['apple,t8103-dcpext', 'apple,dcpext']
   arch/arm64/boot/dts/apple/t8103-j457.dtb: efuse@23d2bc000: Unevaluated properties are not allowed ('efuse@430,26', 'efuse@430,29', 'efuse@430,31', 'efuse@434,15', 'efuse@434,21', 'efuse@434,23', 'efuse@434,9', 'efuse@438,12', 'efuse@438,14', 'efuse@438,19', 'efuse@438,25', 'efuse@438,31', 'efuse@438,9' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000: iommus: [[152, 0], [153, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t8103-j457.dtb: usb@382280000: Unevaluated properties are not allowed ('iommus' was unexpected)
--
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6000-pmgr-misc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spmi@2920a1300/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/aop@293c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@38b304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: iommu@38b30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6000-pmgr-misc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spmi@2920a1300/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/aop@293c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@38b304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: iommu@38b30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j314', 'apple,panel-mini-led', 'apple,panel']
--
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6000-pmgr-misc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spmi@2920a1300/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/aop@293c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@38b304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: iommu@38b30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
--
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6000-pmgr-misc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spmi@2920a1300/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/aop@293c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@38b304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: iommu@38b30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/dcp@38bc00000/panel: failed to match any schema with compatible: ['apple,panel-j316', 'apple,panel-mini-led', 'apple,panel']
--
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6000-pmgr-misc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/aop@293c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: iommu@38b304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: iommu@38b30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
--
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/power-management@28e20c000: failed to match any schema with compatible: ['apple,t6000-pmgr-misc']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300: failed to match any schema with compatible: ['apple,t6000-spmi', 'apple,spmi']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300/pmu@f: failed to match any schema with compatible: ['apple,maverick-pmu', 'apple,spmi-pmu']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300/pmu@f/rtc_nvmem@1400: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300/pmu@f/legacy_nvmem@6000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/spmi@2920a1300/pmu@f/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dma-controller@293980000: failed to match any schema with compatible: ['apple,t6000-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/aop@293c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@38b304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: iommu@38b30c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/audio-controller@39b500000: failed to match any schema with compatible: ['apple,t6000-dpaudio', 'apple,dpaudio']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/dcp@38bc00000: failed to match any schema with compatible: ['apple,t6000-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
--
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d714000/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/spmi@23d714000/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: efuse@23d2c8000: compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: efuse@23d2c8000: Unevaluated properties are not allowed ('compatible', 'efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24a808000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24a808000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@24a808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8112-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8112-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/aop@24ac00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t8112-j413.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: iommu@24e808000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j413.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
--
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d714000/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/spmi@23d714000/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: efuse@23d2c8000: compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: efuse@23d2c8000: Unevaluated properties are not allowed ('compatible', 'efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24a808000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24a808000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@24a808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8112-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8112-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/aop@24ac00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24e808000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: iommu@24e808000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
--
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d714000/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/spmi@23d714000/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: efuse@23d2c8000: compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: efuse@23d2c8000: Unevaluated properties are not allowed ('compatible', 'efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@24a808000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@24a808000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@24a808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8112-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8112-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/aop@24ac00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t8112-j473.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@24e808000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: iommu@24e808000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j473.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
--
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d714000/pmu@e/rtc_nvmem@f800: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d714000/pmu@e/legacy_nvmem@f700: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/spmi@23d714000/pmu@e/scrpad_nvmem@8000: failed to match any schema with compatible: ['apple,spmi-pmu-nvmem']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: efuse@23d2c8000: compatible:0: 'apple,t8112-efuses' is not one of ['apple,t8103-efuses', 'apple,t6000-efuses']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: efuse@23d2c8000: Unevaluated properties are not allowed ('compatible', 'efuse@480,20', 'efuse@480,23', 'efuse@480,25', 'efuse@480,28', 'efuse@480,30', 'efuse@484,15', 'efuse@484,17', 'efuse@484,30', 'efuse@484,9', 'efuse@488,13', 'efuse@488,19', 'efuse@488,25', 'efuse@488,27', 'efuse@488,8' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/efuse@23d2c8000: failed to match any schema with compatible: ['apple,t8112-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24a808000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24a808000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@24a808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8112-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/dma-controller@24a980000: failed to match any schema with compatible: ['apple,t8112-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/aop@24ac00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t8112-j493.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/mtp@24e400000: failed to match any schema with compatible: ['apple,t8112-mtp', 'apple,t8112-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24e808000: compatible:0: 'apple,t8112-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: iommu@24e808000: compatible: ['apple,t8112-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t8112-j493.dtb: /soc/iommu@24e808000: failed to match any schema with compatible: ['apple,t8112-dart', 'apple,t8110-dart']
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: mbox@2a6408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mbox@2a6408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a6808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a6808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@2a6808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/aop@2a6c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: mbox@2a6408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mbox@2a6408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a6808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a6808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@2a6808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/aop@2a6c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: mbox@2a6408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mbox@2a6408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a6808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a6808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@2a6808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/aop@2a6c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: mbox@2a6408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mbox@2a6408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a6808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a6808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@2a6808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/aop@2a6c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@2a6408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@2a6408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a6808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a6808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@2a6808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/aop@2a6c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: mbox@2a6408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mbox@2a6408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a6808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a6808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@2a6808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/aop@2a6c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: mbox@2a6408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mbox@2a6408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a6808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a6808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@2a6808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/aop@2a6c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
--
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: mbox@2a6408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mbox@2a6408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a6808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a6808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@2a6808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/dma-controller@2a6980000: failed to match any schema with compatible: ['apple,t6020-admac2', 'apple,admac2']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/aop@2a6c00000: failed to match any schema with compatible: ['apple,aop']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: audio: apple,decm-ratios: b'\x0f\x05\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: mbox@2a9408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
