Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A641DC9B1
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758479812; cv=none; b=lJy1HjQmpONrWmhSpbw3c00XCeRZpKko0GRAT+i/8MHJ/j1Tg9FKU/8Dxsr1DCXspkQlZyhxZRizr9uMvh/3+yQAsljWLrV1+HW2ksh2l+onseR0f2OO4UhXLiYDCw/LEvDqoeGdAbWoWn7q1IFofhrFDxMylsvT3OgRVk+BbAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758479812; c=relaxed/simple;
	bh=Zua2IWX08TbAr0GW66cgIbJinOBQ7bD4Rb2O+irKgqc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LTG9CQx3tlobBMFcOksMW3/VuO7LeU1kJpkFYqOENce0mvyPBQxq3ZXlpsHOo0siKSoJZyQ/wqGMVgzuGaL1YdVUqQiBkmKZ7CXwbjxcEtgEqF2s70YXwuSaFlLSLT2leEleUncO8P3ZVB8zrDTqydLcSaJsNh9Sub5uokVLxq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hPyA2CcL; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hPyA2CcL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758479810; x=1790015810;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zua2IWX08TbAr0GW66cgIbJinOBQ7bD4Rb2O+irKgqc=;
  b=hPyA2CcLoi2uqNoJdz/VEcvSwGkQ1VnYGqBd5E/YRZrV7+GdfnlGqXmM
   EyTn80Wv2j0NmoLJE5u3zlfu7Mt4hDOqgbSakgt8glWwUtBlRWe+Izd/Z
   ftCGsl+LsNa6+wjkcJUC3dNssVaz423oqgJQAJmc/GIheOlfboN7br7MG
   XEntU8ZRmE0NkjXxwsbSsSfTxzUE8WYDrcVt0O4lmij/pANrGawsU3YDb
   vyzu5IU6TaQGGLxC3EL4S4/1ncnScLAUh/UzZKk7kNM8CoVy9mrGRtkM7
   tmm34fvQ8rW6RldGQsjV7u31ax/DPA+CTaXmokuU4H9AUKi2RshOPUnOb
   w==;
X-CSE-ConnectionGUID: 08JGoB6ZQDmsadcxaR8hWQ==
X-CSE-MsgGUID: NCrrztrSTUGkvlDX4oTEyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="60810902"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="60810902"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 11:36:50 -0700
X-CSE-ConnectionGUID: wx8lG82sQBmXvlbhnhFbHA==
X-CSE-MsgGUID: 923ZJlbTRvSGYOaGz8/7Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="180555398"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 21 Sep 2025 11:36:48 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0OvV-000000003bN-3idj;
	Sun, 21 Sep 2025 18:36:45 +0000
Date: Sun, 21 Sep 2025 20:36:26 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 8/140]
 arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a110000: failed to
 match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
Message-ID: <202509212007.rsuAgx6H-lkp@intel.com>
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
head:   703a105e4188c8c9e084375a48f08853cf64cfca
commit: 3e2609b31b3e5960f37aee0ec9ba54aeeb2dd3ee [8/140] arm64: dts: apple: s8001: Add I2C nodes
:::::: branch date: 6 hours ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250921/202509212007.rsuAgx6H-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509212007.rsuAgx6H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509212007.rsuAgx6H-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8001-j127.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8001-j127.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8001-j128.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8001-j128.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/s8001-j98a.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8001-j98a.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a110000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a111000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a112000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/s8001-j99a.dtb: i2c@20a113000 (apple,s8000-i2c): compatible:0: 'apple,s8000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/s8001-j99a.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,s8000-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
