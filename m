Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6346425F79A
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 10:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758365685; cv=none; b=qvhuh9AfJ1IqD3xtyQInMAhrE9jSLA9WPoLeHjDk/iNet1Bb5mSmfXHFs0pBNsCihVpPKYL+FpQRIKJ+FPKdT3jkrcaHWAg00UCFNTPLoDmY4v8TFqGYTmdtyxav5ifIcasyLsz3vXhlUjBOjjnGZZZe339tgETMR9ULx8K2pwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758365685; c=relaxed/simple;
	bh=JegK/3XqCNfdyqxNkosbc1PsswTrX7iRkaCBOE8WDTo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YYTYXVt5/oQ9TtM0S1kBDcmLhzaDpYeuC6zXnkLU91nanxuN2f1zNUwulkNK2AmrxoZM7CnoH3m7ocSKSFhosqjD77zzsd1kmV4qqQJO8sG7Y/xprgs/nBpac0oi9wWQEXipUsUBcKLiLn3Yl/If6ptAX//EtcM5IAILBl/kgpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eomlvryR; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eomlvryR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758365683; x=1789901683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JegK/3XqCNfdyqxNkosbc1PsswTrX7iRkaCBOE8WDTo=;
  b=eomlvryRrZKFtiaFJEbXVQD7XURxHn/lWjPYvnW9ID/rC0PaywWpAC6U
   klsB2LCfDTraJ0OI2yXtRBS85aIXxYvqii8snioROW3yF+rBRZd/bnBCW
   ewiJFA9EYpET5tHzkuy2gSJ5jRIDczr3xhT1LECEiNHpKSpctCxcQ07dP
   UEDIcbKdzF3Kei0QstNpB9b/XsZvkk4nz+oP2gNM58CicKW77NUmj/n6i
   dncBACHomzTQpEIDbCbJ0xQuD+q4Ktve3/HqlaJcbzZ+cO+hoxfnWzzxc
   2Jx5hPucgvB4uH1VJkV7f2Mh+5nsTg6VVE9EXy7eK+MmRNy3bFV7us64f
   g==;
X-CSE-ConnectionGUID: zbaSjE2cTJmQKRxAeM2hOQ==
X-CSE-MsgGUID: k5EOCZlfQGif7O2nG1Ct3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="63326297"
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="63326297"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 03:54:42 -0700
X-CSE-ConnectionGUID: ffJGCzD0T9GhBXIi+y8PyA==
X-CSE-MsgGUID: Nl5dFYQiRSeOA/5kWj4IKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,280,1751266800"; 
   d="scan'208";a="175605908"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 20 Sep 2025 03:54:42 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1uzvEl-000000003Rh-0iy9;
	Sat, 20 Sep 2025 10:54:39 +0000
Date: Sat, 20 Sep 2025 12:54:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 4/134]
 arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a111000: failed to
 match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
Message-ID: <202509201245.420v0QpF-lkp@intel.com>
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
commit: fc876907e6a86b06499a0e67a1ca21389ba74b5d [4/134] arm64: dts: apple: s5l8960x: Add I2C nodes
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250920/202509201245.420v0QpF-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509201245.420v0QpF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509201245.420v0QpF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a110000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a111000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a112000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: i2c@20a113000 (apple,s5l8960x-i2c): compatible:0: 'apple,s5l8960x-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s5l8960x-n51.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
