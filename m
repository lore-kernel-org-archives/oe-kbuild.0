Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B891E89C
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 18:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758479092; cv=none; b=jp03r2SgEyVj5C8KBPsRg1Ona/vpQdG/3w5Gk6hIJhPIoCfCKW0OzPn4tV6abdraDNk61IVyAurOaH8bpQHbPd7mhRfsv3k7iwfnjlNAIkbBifdLGsNEq+xmjV40PE3q377cJWSos0/B9w1FgC6kr1fvq5ZTbXqglQZoNKaKBVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758479092; c=relaxed/simple;
	bh=T5AixToxj80Cau+Kx7e0O/L74jU/RoTM8lqTjN4X/lI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YsFi8i+jdYy01isgorMRPY2eUxyeTTMUiI19gBdwx+mwxZyT5M9NKHA8ndCzOoDPHBi0ghFbVMEMFsFbvowi3jXBZ0Ojneorx9PklWsQBiKJeGiPRxYTkXNF9mfaroF8pnwdqXufq16BlnUOT5Bw7JXXwsaEpAAQfV38Wvxs2mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QYBlw2OC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QYBlw2OC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758479090; x=1790015090;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T5AixToxj80Cau+Kx7e0O/L74jU/RoTM8lqTjN4X/lI=;
  b=QYBlw2OCciCZOUgybARP9emqsMNXHxELC1CKbiI7cjdWfu+BWGeybhJw
   0ATUV7jCcpwvvO6gR/fkKmnGwqL3nvXQoH+eYgMVYP/Yu0j1eKxzL1cCI
   p2PLFnmI7cnPOESzEupFan8NPXDWMz3bOEXPoUM2cVlrtVc35sm0RIr7h
   NEzUrY4L01+2tIrlfXbtsFEqAceESPsnMaACln2Uig2Lri4/oUBDygpHY
   LEZ+yGxvh4m8WCydFcMWizuGmLUbarZDipZEy03ft+STWnJgV+R3ewrdJ
   CZb2SldevOIXXUAp1pKmO72/0ZYL0EFHFnx9vhiKHeu2o8syVliNM0S8p
   g==;
X-CSE-ConnectionGUID: VHp6I2PTT4Cv05ACPaM5DQ==
X-CSE-MsgGUID: WXyTdrHiSkya8B/B0HwEmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="64388743"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="64388743"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 11:24:49 -0700
X-CSE-ConnectionGUID: lbRZDzzgSNmoWCQkNh03kQ==
X-CSE-MsgGUID: HHCtlnUwTuK4OErTvwweJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="181556782"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 21 Sep 2025 11:24:48 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0Ojt-000000003bJ-3Ytf;
	Sun, 21 Sep 2025 18:24:45 +0000
Date: Sun, 21 Sep 2025 20:24:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 10/140]
 arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a110000 (apple,t8010-i2c):
 compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c',
 'apple,t8112-i2c', 'apple,t6000-i2c']
Message-ID: <202509212017.1zGTjhct-lkp@intel.com>
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
TO: Nick Chan <towinchenmi@gmail.com>
CC: Janne Grunau <j@jannau.net>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   00c6dc8272d302876034765e34843f6abc62219f
commit: 5fe442271046eed743ee1782db097a90dafdf144 [10/140] arm64: dts: apple: t8011: Add I2C nodes
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250921/202509212017.1zGTjhct-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509212017.1zGTjhct-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509212017.1zGTjhct-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j105a.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j105a.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j120.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j120.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8011-j121.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j121.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j207.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j207.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a110000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a111000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a112000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8011-j208.dtb: i2c@20a113000 (apple,t8010-i2c): compatible:0: 'apple,t8010-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8011-j208.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t8010-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
