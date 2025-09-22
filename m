Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8998BA59
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Sep 2025 00:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758499314; cv=none; b=OD31gaLEvy6G6+Nse0Ki7FfaOqYpXdMnEUsr3+Q8WS2TD8pI+vsOOvUdRpbXY/jHf+p80JUbFU/7D1yqye2xaxNyX5GH2EBy8ypo3riPLMoYDMWjq1YFQ57Lgdo/ewsGWe0sWCDXE3RaF1WCDVt8VnuQdiTTdIc+HmCszh990A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758499314; c=relaxed/simple;
	bh=yjKVIzvoWRXidIqTei6BXhXspMLTHvb7QTcHH3tS4IM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vEZ3l0M/jUxfsnXZzncLTxu4cnI1W/Q6RW7xx1z0Sad8da+gp3VQ/BBpvT1Je6iGk6RwD+5JcykNeMU4Z/vAkDxnLyZ3BX3eoOxLQBhSFXX6IlIeWlsgwQ0CWrWpNtxZrdQA/ShV0qs3fGEFLT6BcWg8dgZzohFdyt177273ASs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMtUyAQa; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMtUyAQa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758499313; x=1790035313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yjKVIzvoWRXidIqTei6BXhXspMLTHvb7QTcHH3tS4IM=;
  b=UMtUyAQadXKKNu0Dv/litCKB2LJ8Zb2ahuJc2tHE1bgD36m0Lq/mPKoY
   8aSvnG6EI46AMO8HSuTrMgTQFeZ+Xo3SQBwajVeqBu18ZrdtGaktEekTL
   Z3ziXf+F7TpfsiiYutchEwQX4Fy9rT9XBB/Cb13Hm466bV7V5BeAcPAa8
   73RB1Oz9XGoQIM1gvC3d+I1MwYXYx41O06omhrNsl6HMerCHrQ2R1RT6b
   8o0iVre9CXes+/tz39NBJuNQ1NLF+fUI12LqGYjNMYYYqRUla06jIgAUD
   TYI9iiTohHrBGH4X1x+e7s4eILUczFQ6Hnep2AAAhHMZrXxYcQumg+GbC
   g==;
X-CSE-ConnectionGUID: RmPdZdWkRiGMPM2yeDxtfw==
X-CSE-MsgGUID: muOg0FFLTGO3aqxj37bnaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11560"; a="72126882"
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="72126882"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2025 17:01:51 -0700
X-CSE-ConnectionGUID: HHYqe8eeRHCAzF8N0+6G+A==
X-CSE-MsgGUID: eOlZWVe3QvuAkkT+av05xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,283,1751266800"; 
   d="scan'208";a="180357812"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 21 Sep 2025 17:01:49 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0U03-000000003cr-0hQQ;
	Mon, 22 Sep 2025 00:01:47 +0000
Date: Mon, 22 Sep 2025 02:01:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 11/140]
 arch/arm64/boot/dts/apple/t8015-d201.dtb: i2c@22e200000 (apple,t8015-i2c):
 compatible:0: 'apple,t8015-i2c' is not one of ['apple,t8103-i2c',
 'apple,t8112-i2c', 'apple,t6000-i2c']
Message-ID: <202509220259.UDk8zmjK-lkp@intel.com>
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
:::::: branch date: 12 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-2051-20250919 (https://download.01.org/0day-ci/archive/20250922/202509220259.UDk8zmjK-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ce5124856e019792783de9630d0c5a1f0aaf2d9d)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509220259.UDk8zmjK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509220259.UDk8zmjK-lkp@intel.com/

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
