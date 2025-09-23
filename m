Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B38E414AD20
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 17:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758647013; cv=none; b=L2nQ5vgQi/OjNfhzwoyKGW8zg1mpDIA89UYIDvHrccIQVUt6W2bksWaMoCOKWpZVXOF3fRJz3fSjjbj5TDScEIj0+fzNMtvk9xP+N5wxMnpqTShRSs60Kk2DuYKOj6LvIjUu6cgvgAnUCOxmtT8ol3kwJv8THpD6HMJAWF6iv28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758647013; c=relaxed/simple;
	bh=SFqoK/lK2tsmcuhwkr/HwxWkDNDD/paamRWPxxJ6S1U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F5HvZWNp2p5fUlplku2pycHZojp+BsXQaXQtHKPzMRGZKLPmD9GoiYTlhGdCf1u8KhfzUKPolS/m0WTjIPuSJRt1FfCURviw++kW6EnuAMFRsFcrLGQAJLgInGk5cQ073knlQw65Sxg4eVbAp2wQGlNeVg9CXZg/XTnyxrnHfHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeGGjsBF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeGGjsBF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758647011; x=1790183011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SFqoK/lK2tsmcuhwkr/HwxWkDNDD/paamRWPxxJ6S1U=;
  b=eeGGjsBFJkZIP+n4jZDi7aYf/1evoVQT4tevc+MN1Aag6KAJ7GrrJVry
   f8GrWkIylDjyq7ZdophUWS+Tvsda6fcWaIabjXViAhvs8lYGNhO8rQkBG
   yTS/6fsk+EQGck4qOTG+FGcnHGClcETR0xYXFbTlk00AUzKYzhyR6laev
   nkj9sRvE2whbN0cSog2GgMOrU9C5ORMY5PF9j1UnRdpbKOKQVkh3z7rYC
   1fy8CsEeMUmxsMxQB71QGB/yF0ixIIPzxi+wR9wd8iDN3jkCNAiVRRw67
   2qAETPLHA5XbsW6vbp9gbyNbF0nxm4VB3HzSPCYINsan3QMNuvxbwudJI
   g==;
X-CSE-ConnectionGUID: BXe86wiiSQynZ3eG8k8Pgw==
X-CSE-MsgGUID: qMDtdPngSOGOLB8hmE1ewA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60857795"
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="60857795"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 10:03:13 -0700
X-CSE-ConnectionGUID: MEfHlheqSyK9BuweHhCg0g==
X-CSE-MsgGUID: wgAj5cKmRpiW6p09ihRUSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,288,1751266800"; 
   d="scan'208";a="181984077"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa005.jf.intel.com with ESMTP; 23 Sep 2025 10:03:12 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v16Q1-000000004FV-1Dyb;
	Tue, 23 Sep 2025 17:03:09 +0000
Date: Tue, 23 Sep 2025 19:02:15 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 37/140]
 arch/arm64/boot/dts/apple/t8103-j293.dtb:
 /soc/spi@23510c000/hid-transport@0: failed to match any schema with
 compatible: ['apple,spi-hid-transport']
Message-ID: <202509231956.Utp5PkEr-lkp@intel.com>
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
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 380fcb05e751317b6a3ed7348f2cd69c39d7ea26 [37/140] arm64: dts: apple: t8103: Add spi3 keyboard node
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250923/202509231956.Utp5PkEr-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509231956.Utp5PkEr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509231956.Utp5PkEr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/apple/t8103.dtsi:488.26-492.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t8103-j293.dtb: pmic@f (apple,sera-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j293.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
