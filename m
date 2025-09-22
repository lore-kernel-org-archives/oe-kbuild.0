Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660582C15A9
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 23:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758583746; cv=none; b=Uh+DMrBMzIYO0KBuMlO5mP4dEGjsem/hqNlLG3jdEZ9iRNmu7xP2kcIUnhG7m1yxadEZDKWZ37O5QYEMkX7v6QP+rfRFqI2vMNA9n1dXqieDS627xuxVNCK47CFICjmS+yXncnfJiCpE/0JfKUfEJiOWrPXmlnJ8HP2u2bQal4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758583746; c=relaxed/simple;
	bh=r8NSL63KX4KBmuzCo7pVcHSs1+ZKIoEmP1x6tjeMiMU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SeW44lOc1+3pUQmxoHFAfc8ngxEp6vgtLqHAvwv4dUkWg/JzhvSs/yYsatAd5yx8T4ege/cvg/uujCR7jj3PqxQ4kN32Cn3si2IMf7mKTMPEQkjyCHnaOsIsQLrBfQrDzgZU4UB5avV8ELhj8bpVcHH5ebXXr6YLylP4rc7bjLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpONFKJF; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpONFKJF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758583744; x=1790119744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r8NSL63KX4KBmuzCo7pVcHSs1+ZKIoEmP1x6tjeMiMU=;
  b=CpONFKJFysYCNp1/DayqROh8B5RCVl1xtewPy1Fjyqff1ugJcvS3Zrpm
   Txc3DXhZ7cNVpOJ5xHb04earm4DcSnoT6vW9/fUx3NNAACzu331/78aWW
   IguzGN3VfF0e68idNdzwQwSYvjP90pUKF8KsxoyC9G0ERHjyns/qW2qAC
   MYbgHLeZZxOAAr03JNcYyuLJaM01CKWWXiSxiqQ0046pV6v1YJVuSFMnZ
   AZwfQRW9QEfix8UX57iMOBlDSymeNWjaGXKMFpynCxrrTO7j+Sx8JIB68
   xEnwsv2EOARpvxpjy2n8lpr9Kc7DOaELDNwlq7XymkxHzBnFSPml29/a4
   A==;
X-CSE-ConnectionGUID: mrrllcVQQX+rbzNrGVFStw==
X-CSE-MsgGUID: rS2evZyvQ7WJjYHLsnwOJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60771506"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60771506"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 16:29:03 -0700
X-CSE-ConnectionGUID: 0pcVEv7vRT6FeMDb3daUSQ==
X-CSE-MsgGUID: LCtvZFyuTY2rF7CDUrDbCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="180599016"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 22 Sep 2025 16:29:02 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0pxr-000000003yn-1qtE;
	Mon, 22 Sep 2025 23:28:59 +0000
Date: Tue, 23 Sep 2025 01:28:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 19/140]
 arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic):
 nvmem-layout: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202509230103.vHUw0s00-lkp@intel.com>
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
CC: Neal Gompa <neal@gompa.dev>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 4a2544346f8f515c3e4370b44ffdf62d466b9c7a [19/140] arm64: dts: apple: Add devicetreee for t8112-j415
:::::: branch date: 35 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250923/202509230103.vHUw0s00-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250923/202509230103.vHUw0s00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509230103.vHUw0s00-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:491.25-500.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@f702,0', 'boot-error-stage@f703', 'boot-stage@f701', 'fault-shadow@867b', 'panic-count@f702,4', 'pm-setting@f801', 'rtc-offset@f900', 'shutdown-flag@f70f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: pmic@e (apple,stowe-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8112-j415.dtb: nvmem-layout (fixed-layout): 'boot-error-count@f702,0', 'panic-count@f702,4', 'shutdown-flag@f70f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/nvmem/layouts/fixed-layout.yaml#
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000: failed to match any schema with compatible: ['apple,t8112-smc', 'apple,smc']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t8112-j415.dtb: /soc/smc@23e400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
