Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B1E13FEE
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Sep 2025 09:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758878636; cv=none; b=ZW6IdZ2Wfp/0P56HUksfTBPYiLNDW/rJ9UXzf7UZ6BOfAU/ymIrwy6AUtrUZz1auATeLUZECjd/LdX3FgISg+AkwRZdq/smRSCeHW/QhaYFWnXbNocFJi5zdqA1+gkdB4KSxTnG6wVdykzOs+PyqvdvnUsI1x3TVKTIE+zgz5uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758878636; c=relaxed/simple;
	bh=o0d+sKXUeodpMWOoPeS8sg/X513UA5vDmqPSj1HrFE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uKBxtTqHJQgAobjwHaOUX/l+DE2U+1wDYcHLrK0TtMWqwKdvtUfqeK6l7gQlkpeBiM7XcdHxLgWpeF6wRzacBScAb1OZp5sg10OS72Tqu1iAR+lYI0E4I0YPQLt/rTd54hE/5WclPI9Y0ZKBIF4NyoXafEwhA0orStLgviV6/8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ER/ohNSH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ER/ohNSH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758878635; x=1790414635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o0d+sKXUeodpMWOoPeS8sg/X513UA5vDmqPSj1HrFE0=;
  b=ER/ohNSHK16c+dyY31fBn8K/x8RNykNAzKmIOmau2CffewciXzGi97lC
   flTz+Zu3zx0CvHIQMlRZshlNl26IB+EFyNLYXAZxIGqyVjged5M/WyPTU
   8+MzQV59liEwpPliONpaC5fYLlWbxYmveCzp3uDqGhREUNKH7QlMpa/uN
   tphKk2wYMFJ47k5atkKfkHWVbwhEWo05Pk4FI4XBAR9oDYjQlb6RfMeen
   iuhAIKktkdFM39gtJ8VUUan542d2YeZ6LLsUbmefC+tvzz5ycL1A8fkkC
   9Q7onekcG3V/mVVol7fFy/lJMIOlyKdIb2H04nNlymnPnDU9Q1L0F3q/g
   Q==;
X-CSE-ConnectionGUID: g9Ok6IeqQ3+/F715ZpRHUA==
X-CSE-MsgGUID: 4p3o5D1lSVm4CtvEJ15RDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65021814"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="65021814"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2025 02:23:48 -0700
X-CSE-ConnectionGUID: uXLdC53PTt+WG/295oHW/A==
X-CSE-MsgGUID: EaWmxSTVQuyTrXZYkeY/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,294,1751266800"; 
   d="scan'208";a="177958059"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa008.fm.intel.com with ESMTP; 26 Sep 2025 02:23:46 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v24g3-000000005Av-3vk2;
	Fri, 26 Sep 2025 09:23:43 +0000
Date: Fri, 26 Sep 2025 11:23:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 11/140]
 arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e200000 (apple,t8015-i2c):
 compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c',
 'apple,t8112-i2c', 'apple,t6000-i2c']
Message-ID: <202509261153.BD9grKXJ-lkp@intel.com>
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
commit: 55c1cf8feecc1cce2203fcd6433548e213a3fa6b [11/140] arm64: dts: apple: t8015: Add I2C nodes
:::::: branch date: 5 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250926/202509261153.BD9grKXJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261153.BD9grKXJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509261153.BD9grKXJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d201.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d20.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d20.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d211.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d211.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d21.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d21.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
--
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d221.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d221.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e200000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e200000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e204000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e204000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e208000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e208000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t8015-d22.dtb: i2c@22e20c000 (apple,t8015-i2c): compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t8015-d22.dtb: /soc/i2c@22e20c000: failed to match any schema with compatible: ['apple,t8015-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
