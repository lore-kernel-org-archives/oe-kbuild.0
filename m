Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063D81E0DEA
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Sep 2025 17:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758822643; cv=none; b=m68U3K9o61ASibmoGgm9QB02b6VuUo1dR9+Leezb3A3eZjZue3VRpbYRvCEmJER00+r+hmRV+s7JZlxZ5PTlm7F+T1h0v9GEKQL4o/ruZTpKz4asfwjp4K+kHd1E0uuUZcnvXFaBFDTJDWbTeb13AigvMV2k7lWfDJXpeDXEOFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758822643; c=relaxed/simple;
	bh=tguBm6EiXpp3frW8K1JTc3BW1/AqywLMwRk8jTjblYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ByWjfdc6OxXu6yquXI+yQrjl7b+6D9b6GpL1kSEdPrPhOtshpuGmh0Czs+VtiwvNyGFTr0YYjyaFoJVPcy+24qtXkcXzEPKGONd8nVqHoVcpCrfoWSgaVSIosJLJCK3tJ91PzPXeC2DpmXU+EF5E6DbpArjp0c64OvYtShwlns4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=naehTgre; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="naehTgre"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758822641; x=1790358641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tguBm6EiXpp3frW8K1JTc3BW1/AqywLMwRk8jTjblYM=;
  b=naehTgreUjdwJ2eSfYvZLHvYzVuLq0dtcF8SBhJycu1fFp6OKsuDbdky
   MsDL1abtMvPOE9LNJSGgNjNWWupzKatrxQJy1TT1UB8wyIB/wUHVVuAql
   D7pIzaCF2mvBHxoffjvAhFR0QKk7ITGk6UpVSDpA1dXZhhVMn/YASzVCj
   n+bQusU4qXurWE+3yC3HKxAFZkzU0qtwiX1qKR2g+CrQ/W5kHK6Z+hhK2
   E1/1XrFdS21dnIHdxR/+ILpQDZcEKi7N6QpHl1cVChxfST7jB3HNMTA6n
   koaFFMAEdwCp/tsbDHsQlaDaq6GNSz2NRpZeQ0aLo9/3FWyDHLwwlmCV2
   w==;
X-CSE-ConnectionGUID: eoDiTBveTXOrthVv/MFzhA==
X-CSE-MsgGUID: qB5jcLywTnST/pQ5M8p8DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11564"; a="61262222"
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="61262222"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2025 10:50:40 -0700
X-CSE-ConnectionGUID: BN6cBXIkTgqa4KQ3oo6UXA==
X-CSE-MsgGUID: HxI/JfvyTGi7BK68m/G9vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,293,1751266800"; 
   d="scan'208";a="176524587"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2025 10:50:39 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v1q72-000000004zT-3XMu;
	Thu, 25 Sep 2025 17:50:36 +0000
Date: Thu, 25 Sep 2025 19:49:57 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 6/140]
 arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a110000: failed to match
 any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
Message-ID: <202509251935.MK7KQY76-lkp@intel.com>
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
commit: 55e2d1ad882de08ee0dccc751f4cc88e3f10c3fa [6/140] arm64: dts: apple: t7001: Add I2C nodes
:::::: branch date: 4 days ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2052-20250919 (https://download.01.org/0day-ci/archive/20250925/202509251935.MK7KQY76-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250925/202509251935.MK7KQY76-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509251935.MK7KQY76-lkp@intel.com/

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
