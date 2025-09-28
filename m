Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5F8200C2
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Sep 2025 07:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759042927; cv=none; b=RhdFBNfi32gouT6k9MdMZJxjMdm28ZFiipBRMbDgPrBeNwNaE/FDvWghSdyDE56OA8J5xeWNHjykh5rCTYwFMmdOg6oTM4NSUFOU9ayb7WmgWeckFN34RAZQG9Kgl9AXitXR89/yefqY6uKvXNADvodLc85nWeevffNRRgwiAz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759042927; c=relaxed/simple;
	bh=VrLoEdVIGeC2TkhF93rHF79cIyuaelicfTRiIPPpaS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rC1rpw+nlUEELob9oP4nAYot250uEbB52OezovCVU9TIWQwjcpxqDhEpUvx7NpgnQCY+X2vNy5pa+E6D7kMktPkFEvl2wM/ZF11sEkqGItyEvV9ZANephm9r0F5ZaQ7ZLcvvyOqyoTUmnWCgYT1+l81k9zap1q70CGl7OJK9qtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bNQvRyaT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bNQvRyaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759042925; x=1790578925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VrLoEdVIGeC2TkhF93rHF79cIyuaelicfTRiIPPpaS0=;
  b=bNQvRyaT17US9TozOFBExyiOGM9p5l/33/H+jzjh6vGWZ0BYrISY7LW/
   fMqp5o+QgpZ7TTMJw5nHj9U5T2BUYBGH9tZHsvSkDS/c3l9yW8/LSNUF3
   YcGUJNBPC/OfUxJEMFgNhgKncHcYZLflKyPf5PpfW+4xu1Dh7HNT81lvK
   B4wa69ztHsuomQHLeS/vrqGlxFdz9SKRNJpd0aj+BH6In6UQkgYr0gGXr
   tqnl3LeLI5PeunRcE4D9MxFJbkQGbNrgIFre7N2iycZ0Wu1QbtUReChQ/
   YyC2dGcQZz8t4OLnrpdwqkY6UDu0Kv5cl9yD/ggbVOTr2MEr1jj8tiP0E
   A==;
X-CSE-ConnectionGUID: zlydDvYTSuOKmt+aEKJDSg==
X-CSE-MsgGUID: Q21kduWmSdqu0evgd70kgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="48880837"
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="48880837"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2025 00:02:04 -0700
X-CSE-ConnectionGUID: WXHfvCkYTDCaLH/xtkz5Fw==
X-CSE-MsgGUID: rqP2YRlNSceNvfXth5ZNmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,299,1751266800"; 
   d="scan'208";a="178398139"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa009.fm.intel.com with ESMTP; 28 Sep 2025 00:02:03 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2lQ1-000000005cn-0g8c;
	Sun, 28 Sep 2025 07:02:01 +0000
Date: Sun, 28 Sep 2025 09:01:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 37/140]
 arch/arm64/boot/dts/apple/t8103-j293.dtb:
 /soc/spi@23510c000/hid-transport@0: failed to match any schema with
 compatible: ['apple,spi-hid-transport']
Message-ID: <202509280918.eT6enC3N-lkp@intel.com>
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
:::::: branch date: 7 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250928/202509280918.eT6enC3N-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250928/202509280918.eT6enC3N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509280918.eT6enC3N-lkp@intel.com/

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
