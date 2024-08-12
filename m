Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676F1188CA7
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Aug 2024 16:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723481916; cv=none; b=l81go9l/LHCn72JnapI4OvhD/VW1iN3fpG8ikJQcu/P0WMWg91CopAyzr7KKxjytZ7uMybj3KCGxZZI6UoMlWo4lNm8jSw4HmH0GYriWqS5hRwuDFIiRsq6DLTX+2lz0a8NHq6WAfcZufcLd9udJVa46Af5udcdsDrbJaHQfz9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723481916; c=relaxed/simple;
	bh=+OgpFeDweNwx54zrX4NqFH8VHaotrkAd+lkgDw4g7/k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k35zLOl0GP8Ryh/F6u2jBgOz1N2+yIQBbUI6r46wbRuLayB6ICJRHzz0aLkQvLv62nrpKEP/ee4NDOXBW996O+yC+OEE6LoD3ocS2LByi08ZaUCzJolazuNlz8Mc5mr9t0ua1hWi7zXlcXavai6BltiMLYDahKkXAHDyYs+pyxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTbR1VbL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTbR1VbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723481913; x=1755017913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+OgpFeDweNwx54zrX4NqFH8VHaotrkAd+lkgDw4g7/k=;
  b=RTbR1VbLEt4ngXXVjymQHiCJIznHgqREOh4Uq40uYNJKDfrgbfHDiTd5
   8YD1QGDk/2xN1NznGabKKkLxrihnvZtb6PpkjCQS2VN11v5DHO3KzrjMO
   ZzFe/sF9BtZNTATipgDj865noM8qQ9sGxVzStA5Xir5HIhy9U1ML51ogR
   79j6gfOZGHZrnWwBkQh0nETeFJNSG58ScO6ua8Hjzq5k7Zdr50nouMDlw
   YiRhBauSfwf9bjIugZHEY26RuszxoCFykBpTtlbejefRkhjQ48Y2KwhJK
   qBdEM45J0rLVrzEhsva/oUv42S9eOPc1QlZ+bld7TSkSMYCfbv5cu0shR
   Q==;
X-CSE-ConnectionGUID: ioHK+hfvS8S6I/2clZMXxw==
X-CSE-MsgGUID: c7G64UeETvmvdX5bWE47YQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="39120131"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="39120131"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 09:58:33 -0700
X-CSE-ConnectionGUID: 6YoCo1mdRK2Qsaohh8XLQA==
X-CSE-MsgGUID: nUwV6VpoT72YN9eSVavJ9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58384124"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 12 Aug 2024 09:58:32 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sdYMz-000Bzn-0U;
	Mon, 12 Aug 2024 16:58:29 +0000
Date: Tue, 13 Aug 2024 00:58:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [frank-w-bpi-r2-4.14:6.6-r4-dango 113/128]
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi:23.23-28.4: Warning
 (unit_address_vs_reg): /oscillator@0: node has a unit name, but no reg or
 ranges property
Message-ID: <202408130035.btko5vPg-lkp@intel.com>
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
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r4-dango
head:   ba4657ffe6fcd1055887a3a4fe1a1ad2e7701a74
commit: 06da2ed22862264f357f97b426765d224cfc2363 [113/128] reset: add reset constant for lvts
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-001-20240812 (https://download.01.org/0day-ci/archive/20240813/202408130035.btko5vPg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240813/202408130035.btko5vPg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408130035.btko5vPg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:23.23-28.4: Warning (unit_address_vs_reg): /oscillator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1075.23-1096.5: Warning (unit_address_vs_reg): /soc/tphy@11c50000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1108.23-1130.5: Warning (unit_address_vs_reg): /soc/xphy@11e10000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt7988a-rfb.dts:24.9-26.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt7988a.dtsi:783.16-790.5: Warning (simple_bus_reg): /soc/pwm-fan: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1075.23-1096.5: Warning (simple_bus_reg): /soc/tphy@11c50000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1108.23-1130.5: Warning (simple_bus_reg): /soc/xphy@11e10000: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt7988a.dtsi:1167.27-1328.5: Warning (avoid_unnecessary_addr_size): /soc/switch@15020000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +23 arch/arm64/boot/dts/mediatek/mt7988a.dtsi

0d9a5db479beca Daniel Golle 2023-02-22  16  
0d9a5db479beca Daniel Golle 2023-02-22  17  / {
0d9a5db479beca Daniel Golle 2023-02-22  18  	compatible = "mediatek,mt7988";
0d9a5db479beca Daniel Golle 2023-02-22  19  	interrupt-parent = <&gic>;
0d9a5db479beca Daniel Golle 2023-02-22  20  	#address-cells = <2>;
0d9a5db479beca Daniel Golle 2023-02-22  21  	#size-cells = <2>;
0d9a5db479beca Daniel Golle 2023-02-22  22  
0d9a5db479beca Daniel Golle 2023-02-22 @23  	clk40m: oscillator@0 {

:::::: The code at line 23 was first introduced by commit
:::::: 0d9a5db479becac364c301ea6df393f875ad4326 mediatek: add mt7988a rfb device target

:::::: TO: Daniel Golle <daniel@makrotopia.org>
:::::: CC: Frank Wunderlich <frank-w@public-files.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
