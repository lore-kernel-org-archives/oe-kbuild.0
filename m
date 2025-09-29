Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A203241673
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Sep 2025 08:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759133175; cv=none; b=TlxTdQJO9z3h3sIvRNtWcwYbiTAMvYTbti9kszX7PgkLUOAc2Rw9ZWavo+wMT0litZ92AYibPchA6QEtM8n4vT/DumKzT6RsFUfriYWKL7CocCjmWmT6kvOc9xZ1YWiPTYbGcGW/qf3XN6L3MYIqDK8i3Z+OYLXDHH2OBDeL+Zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759133175; c=relaxed/simple;
	bh=bS4khnnpgPPbzYusMIBh7YogSvYoLUxKTnQLWE9UpuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LfhOTCzRBzZM+mznm41py3SI8yLbaX/04nYnCj6RCQRgdnOb8hPx68UNS9tnuXCM7ECWJ7pEqJYiBfri7LzQuAPS+ShyfR2Vx6//NlGurCZ2h7bOjYMpJLfMiR+YMreWmhcSZHAx6YHaO85YJ/feH4J+w04Bp63hcybjmRTXPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nPgMUkcg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nPgMUkcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759133173; x=1790669173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bS4khnnpgPPbzYusMIBh7YogSvYoLUxKTnQLWE9UpuQ=;
  b=nPgMUkcgqUgyeUsWFTfMoyAiYyaXZE5PsQ89WyY/wl5eCyUoT+jlN/E6
   nCGfHQ4+9qBI9Zd3GRcyFKHceUqReQnJsuipNyHlAE52cAJTZI+sQ/5b3
   GjIPGbWGIsqPnba/GREQCc2kgtP6z29klcxxkZCSFYmJ8ASLDf3TbASDn
   vefqDjMv+blHam1yXB7iAHPPLWr1njsLc4nGu0sTJFPrt873lKmfoKX9q
   DiiW87BSA5o4b2H2LS1H8VKUkWORQpcKxx2yZXEj3Pc8n9YUE1Q6DhQO8
   SlKxKpUhyhw73Uavj9mEbMfQwyWH3ojOLdWlDIoRkB0xj5rOgRq8SFe2J
   w==;
X-CSE-ConnectionGUID: dcJg6KHTSOStPPKtykK0KA==
X-CSE-MsgGUID: uEIWZOgYSv6K0gyP0TJoKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="60404802"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="60404802"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 01:06:11 -0700
X-CSE-ConnectionGUID: /oPiSpYvQNG1RiDtY+ZZPA==
X-CSE-MsgGUID: FSKKH+/mSgiQQV+2zN1K7w==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa003.fm.intel.com with ESMTP; 29 Sep 2025 01:06:10 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v38tc-000000005nV-0wmW;
	Mon, 29 Sep 2025 08:06:08 +0000
Date: Mon, 29 Sep 2025 10:06:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 37/140]
 arch/arm64/boot/dts/apple/t8103-j313.dtb:
 /soc/spi@23510c000/hid-transport@0: failed to match any schema with
 compatible: ['apple,spi-hid-transport']
Message-ID: <202509291041.9baVCEUi-lkp@intel.com>
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
:::::: branch date: 8 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250929/202509291041.9baVCEUi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291041.9baVCEUi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509291041.9baVCEUi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8103.dtsi:477.25-486.7: Warning (graph_child_address): /soc/dsi@228600000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: /soc/spi@23510c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): nvmem-layout: 'oneOf' conditional failed, one must be fixed:
   	'boot-error-count@9f02,0', 'panic-count@9f02,4', 'shutdown-flag@9f0f,3' do not match any of the regexes: '@[a-f0-9]+$', '^pinctrl-[0-9]+$'
   	'#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	'kontron,sl28-vpd' was expected
   	'onie,tlv-layout' was expected
   	'fixed-layout' is not one of ['u-boot,env', 'u-boot,env-redundant-bool', 'u-boot,env-redundant-count', 'brcm,env']
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): nvmem-layout: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'boot-error-count@9f02,0', 'boot-error-stage@9f03', 'boot-stage@9f01', 'fault-shadow@a67b', 'panic-count@9f02,4', 'pm-setting@d001', 'rtc-offset@d100', 'shutdown-flag@9f0f,3', 'socd@ab00' were unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,spmi-nvmem.yaml#
   arch/arm64/boot/dts/apple/t8103-j313.dtb: pmic@f (apple,sera-pmic): Unevaluated properties are not allowed ('nvmem-layout' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
