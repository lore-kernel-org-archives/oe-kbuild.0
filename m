Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836D327E05A
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Sep 2025 07:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758438769; cv=none; b=csHh7UHIboGxXGdwgT+mx13KE74ufLuLXCBT0Okxsfqho2/Db57j6bALNNbTr3wKWP6qpK/87UFt6fEkhugSctQVdFK6BtFgJp6txvAB0ETlOeClEeD1WPqVXD/t5KuCGVBrnNBHoBPgk6AX9Rwh40z/lO+ltzq9rfMF2CBtYf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758438769; c=relaxed/simple;
	bh=A6GmCQ4dynC5RPH7L2M0++fGaegRf92ka3iVyTAtUso=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e5klV/dLIJMLAShG0Ei5xNE/H9jFp9iFdwDJXFFw4rTJxz/dE4MYDulu6Kex2GupahOXkv3l/i57DvulO++Zvej8lDo+kvC3iwF1EzEXPm5kpR+5Ou3IBskfV7A/lZEiYdApdGkPLSpMA4AjG/+FmCWfQ2m4WJdi3O0lRi5zMwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GwMowApY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GwMowApY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758438768; x=1789974768;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A6GmCQ4dynC5RPH7L2M0++fGaegRf92ka3iVyTAtUso=;
  b=GwMowApY9/Kv24QPsxJsV6o/ndVKMsy3hhN48n59IjKAirVA3nmk+7Dz
   uTsAWMBz2+SClGdyq2uVVySQOFz5rJWoBtdkx7caqFA4V+fc7HpwYCJpk
   jyrZDVC7NR2gIO6Pz+bsfMlwHugb1xH3a1L/+w7iIeSqyq3C14I73T/eO
   xcXSadSry7kjLDDpPvZ289f8Rd6JHt74SNw1p01Hv2Q41h2PyQ3qoSMRF
   aRfYnDWfZs5ds/LKFw0Tv0XNLhWd4c9o/SNoTjhiNvIqyDXW5et/jkO2W
   wFdxj5uVLwoO7TbIhmdoWfszap9kq5hMrKG2oi1Ctpj50aaBRsJSb83Dw
   g==;
X-CSE-ConnectionGUID: AW4AOaYWSsKpeAAEOXHfsQ==
X-CSE-MsgGUID: /viBQQY5TdmeOejv8MwcSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="70981809"
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="70981809"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 00:12:47 -0700
X-CSE-ConnectionGUID: iAoujQgcRRyMcz03LbWG0g==
X-CSE-MsgGUID: Mvm01oYFSSKwaAkHlxEh/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,282,1751266800"; 
   d="scan'208";a="180227239"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 21 Sep 2025 00:12:44 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0EFX-000000003Xt-2Sf0;
	Sun, 21 Sep 2025 07:12:43 +0000
Date: Sun, 21 Sep 2025 09:12:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 6/134]
 arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a110000: failed to match
 any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
Message-ID: <202509210905.UiMqyWNT-lkp@intel.com>
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
commit: 55e2d1ad882de08ee0dccc751f4cc88e3f10c3fa [6/134] arm64: dts: apple: t7001: Add I2C nodes
:::::: branch date: 2 weeks ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250921/202509210905.UiMqyWNT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250921/202509210905.UiMqyWNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509210905.UiMqyWNT-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
