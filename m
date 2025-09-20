Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7BF135A53
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Sep 2025 19:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758395986; cv=none; b=UHlKs71lkeQ5OHGHJ4q+f+VCMh32XBzasHkNUqYN2wFGqnkmTMm3+7LeGZWc5dxE43zQCJbqH7EJ45M+QqTMjkcnSIW0j0IH6a3l/OtqV4ZcY0t8t86vHqWsRsUJ6pCvY1FB0r3WL/GjEeaYlFeIbFj7D7txjcz3gehUGoVygf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758395986; c=relaxed/simple;
	bh=qkaen/s7tUvSSj+gppS/LqMcszhYv1HnZ8iXGr+QOww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mOj1Q/Ge2ftVYCBnaXdb0I/4mrTaHE4ZLxI4ZWTF4EsNoPge7LoBDxAgeSIS13g44JgZoIBT1wSYRWqvZlCkvIRDlQfhUtL3xpxa+5/hzIlbPXF9D1eyYdswlkDAeMTiLVPXtGUoWHjT3EarVj0Ha8CtiEDoOkqTSHjpEtNu2HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=he4gpTTb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="he4gpTTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758395984; x=1789931984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qkaen/s7tUvSSj+gppS/LqMcszhYv1HnZ8iXGr+QOww=;
  b=he4gpTTbZNmNh/sXaZ4nDtTgy53rkpJNgiKiVwpwlvuEwwBH25XPEj7V
   h0fbxiGnc1FU3nUeX5G2piZSLBtTW2jng19i0kv1qwnK4h4no6+ytAaAt
   QvRT4MY6Om+ww6PtjkATwIqpmOR44iYAJtcF7qVlYrHHaHkXkhf2Eua+D
   Y/bALX5R2bLEsome7z2XciasyKCqGckESPxBqKN0/5bZ4viY+P3s7UC2f
   TEPSm/lueTGNjq6WWX2p1cfxdfyCyDDBqJKWKbeAyotTooYfROfaudpoU
   pUkSGIidaXu0Gx40WZJJfUXCqG+pjIi0sTfh1AEM5BNQpLXW/J1e5NIhZ
   Q==;
X-CSE-ConnectionGUID: zvcnd/rdQmaA7KEVS7DRmg==
X-CSE-MsgGUID: LJa/dWeMRrqm0kmfkxi3Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11559"; a="78319722"
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="78319722"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2025 12:19:44 -0700
X-CSE-ConnectionGUID: ITL5bDt2QSmxzi1kH8NZiw==
X-CSE-MsgGUID: cMRJru/wT3iPmdbJdutGkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,281,1751266800"; 
   d="scan'208";a="176030393"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 20 Sep 2025 12:19:43 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v037U-000000003Tx-2u2i;
	Sat, 20 Sep 2025 19:19:40 +0000
Date: Sat, 20 Sep 2025 21:18:45 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 6/134]
 arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a110000 (apple,t7000-i2c):
 compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c',
 'apple,t8112-i2c', 'apple,t6000-i2c']
Message-ID: <202509202124.Z6dk5MyW-lkp@intel.com>
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
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250920/202509202124.Z6dk5MyW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509202124.Z6dk5MyW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509202124.Z6dk5MyW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7001-j81.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j81.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
--
   arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a110000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a110000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
   arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a111000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a111000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a112000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a112000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']
>> arch/arm64/boot/dts/apple/t7001-j82.dtb: i2c@20a113000 (apple,t7000-i2c): compatible:0: 'apple,t7000-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t7001-j82.dtb: /soc/i2c@20a113000: failed to match any schema with compatible: ['apple,t7000-i2c', 'apple,i2c']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
