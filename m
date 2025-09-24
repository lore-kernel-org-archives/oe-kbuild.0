Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4B928B4F0
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Sep 2025 21:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758750990; cv=none; b=Malcs31E5jhbZ3nGFvHK/JXG1if+R4Y1Vaf+sOP3TUlVHDTpsQwJFUpbECS4RTm1xTIDE8p7S0rqrFCH3/ZPR8/kZGcrnAuiiCGwm9RMoBAZnbAyAF+IBURjIuLsUoqGVvzVRTUCU7wFUPqqGAuFCmpGXkcHSkG62RItcrdOzto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758750990; c=relaxed/simple;
	bh=e+4Y8j93b8Rhaxwb6b+rjG7Mxhpe5kt0ZkFQGWtF9GA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P1+/chJhkLo5oRSazQYNJTDD8D5eKoFvm8C7N2jqoAEQlVOEuy5uWd1C1kw42mefqXktIHFjC7ji2LJNTwf2FuWVAaRC32u1mT2sHo6c4Gl2AwMDA/aHRJdW1t3IoQTGIVFbtvOmx85CsgCee4Sa30/rjNnae5uq7Lg8GIFu4Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmiYogqZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmiYogqZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758750988; x=1790286988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e+4Y8j93b8Rhaxwb6b+rjG7Mxhpe5kt0ZkFQGWtF9GA=;
  b=JmiYogqZASdFkmm5XCQGuzw4o1H6i9c2jsG5BZUlY03x2NeaNVCWU0VE
   Ya1Ec2zfsNDrhn3l9HosztPxghfAjdb9gZXzwShvi64l0RdembeUwnA5Z
   TiZhLBVZHvGkQ/7tyCvi0NF/0L8AVXvnsHbUw5qaV/vOzvPfkl3LaMkBa
   1BWZ1LnHNvHuBemmvSGMBTh820Vf7xJSAtTE9XxjCdFGuo5hwCrCZlPXz
   qfA8NJAacLGqdj80/H+8UY2a0weV21nXZ4jZ/suGWSlqL9LC+fEsVLJe0
   F6PM1hUiIHv/HnRGMJ7f1NQQ/OnWtBrN/Gfq0bUAwzDyzw+516rb5mP8V
   Q==;
X-CSE-ConnectionGUID: Ii5PzFBGSq+c8t3zC5wqgw==
X-CSE-MsgGUID: qYePRlpESji/jo7nzUyHZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11563"; a="83665050"
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="83665050"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 14:56:28 -0700
X-CSE-ConnectionGUID: 0H/GkXWHTFqnkHy1r8GYLw==
X-CSE-MsgGUID: XX20R2/LTAyoZxJ5tAPVDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,291,1751266800"; 
   d="scan'208";a="177219834"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 24 Sep 2025 14:56:27 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1XTM-000000004ej-3Jht;
	Wed, 24 Sep 2025 21:56:24 +0000
Date: Wed, 24 Sep 2025 23:56:14 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 4/140]
 arch/arm64/boot/dts/apple/s5l8960x-j87.dtb: /soc/i2c@20a111000: failed to
 match any schema with compatible: ['apple,s5l8960x-i2c', 'apple,i2c']
Message-ID: <202509242354.xm6e4obc-lkp@intel.com>
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
commit: fc876907e6a86b06499a0e67a1ca21389ba74b5d [4/140] arm64: dts: apple: s5l8960x: Add I2C nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250924/202509242354.xm6e4obc-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509242354.xm6e4obc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509242354.xm6e4obc-lkp@intel.com/

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
