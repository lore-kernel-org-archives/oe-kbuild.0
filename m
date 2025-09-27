Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B3D231858
	for <oe-kbuild@lists.linux.dev>; Sat, 27 Sep 2025 18:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758997385; cv=none; b=uyeQxTsxXTVKj6cBuLPacY3bBLFaV8kukBUpedPhc3i3ygsya3xyeitnXd34HYEwKf01qVM7Qw9MrI5dqHZp5LJdOXb/VoGV70gX7ePI+OAaSN96aSCSYz+6PjKmf2+vdZQC3aPAPyuMlx556+JSbY905Rkx8wqmGO7eDoiyKv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758997385; c=relaxed/simple;
	bh=nIOHJo5H/z3txDZ27WMwMazgAlpTzsBxWQGDgKsjy5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bbYwNd199mL3A1V+KtBtBm7HadYFJNVXIcxy8T4LnSgg6QExnRmas+0s07V5VEuP6JNj6en+L9SrCSGI1QI4W38YlIi2exrEPr3YtIv2Tb2u8WXwESf7tfjf9MleycxMrefCPcPz5zPks8Dcn1T5ecWEiFxMpJBZmwxoz/tddqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IxdKa+bP; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IxdKa+bP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758997383; x=1790533383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nIOHJo5H/z3txDZ27WMwMazgAlpTzsBxWQGDgKsjy5Q=;
  b=IxdKa+bP9rgx5dtpSfUNNiHRxhAXiOLL9eyRP3tXx8GowSNAk4KlTC/r
   NITr2JTK1P7TDjmWn82zM6jt4+Y1w8vMX9qSlCBMSMMksptBeFWO9NvQ1
   82iB3hytD9gLuNPevSsstAbhp0cS4iWTB2gQjeVge+wOw1eOK/1h4VkQP
   97iq1Q/nN4ti+whRQoinW3Kmw67+Ouw/mbIKQOhWjULvWXIf8fcH2u6+N
   Ayp5Ibd8/dEgPa4J7MAkFa7BZa4wInH1LhfITLhCKner8WoQ8OgpwBczr
   O9CSGgWWD2mcJqDq7PDJUyTTFS20lR1L1EpRppt2W58qaioHFIJWuBIat
   w==;
X-CSE-ConnectionGUID: IhdCxM+pR/2iOz1dVhOiXw==
X-CSE-MsgGUID: 53gHQOSNTiyVSga9AC4FyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11566"; a="61466716"
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="61466716"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2025 11:23:01 -0700
X-CSE-ConnectionGUID: FZDrf6ZzReq50he2Tp7I9Q==
X-CSE-MsgGUID: 9ngzpQPRQkac0QCXu+rCzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,298,1751266800"; 
   d="scan'208";a="177696908"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa007.jf.intel.com with ESMTP; 27 Sep 2025 11:23:01 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v2ZZR-000000005Y5-337t;
	Sat, 27 Sep 2025 18:22:57 +0000
Date: Sat, 27 Sep 2025 20:22:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 23/140]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000/rtc: failed to
 match any schema with compatible: ['apple,smc-rtc']
Message-ID: <202509272041.UuWBjI7V-lkp@intel.com>
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
commit: 94a27052ade10376b9e6992882c3685605450a56 [23/140] arm64: dts: apple: t600x: Add smc_rtc node
:::::: branch date: 6 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250927/202509272041.UuWBjI7V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250927/202509272041.UuWBjI7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509272041.UuWBjI7V-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6000-j314s.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
--
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j314c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
--
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: /soc/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6001-j375c.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
--
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000: failed to match any schema with compatible: ['apple,t6000-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000/gpio: failed to match any schema with compatible: ['apple,smc-gpio']
>> arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000/rtc: failed to match any schema with compatible: ['apple,smc-rtc']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: /soc@200000000/smc@290400000/reboot: failed to match any schema with compatible: ['apple,smc-reboot']
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@6002,0', 'panic-count@6002,4', 'shutdown-flag@600f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t6002-j375d.dtb: pmic@f (apple,maverick-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@6002,0', 'boot-error-stage@6003', 'boot-stage@6001', 'fault-shadow@867b', 'panic-count@6002,4', 'pm-setting@1405', 'rtc-offset@1411', 'shutdown-flag@600f,3', 'socd@8b00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
