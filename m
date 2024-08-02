Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B9BBE4F
	for <oe-kbuild@lists.linux.dev>; Fri,  2 Aug 2024 01:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722562981; cv=none; b=LJEdRDvMcnFmA27yi+wwnGYH0YYODTEBn6nyMRPMUxRdFGQFf+FAyA71EHGGI/Vxv2Y9DXxdSI/Kkuz5ilVexxuDwO8uizHGXoF51RXBXklS02njiMfEc4c/WjBXwG+3bexaq5sBlfSDfmY10NBRodR/eicD5GXSCa/fQpNYjEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722562981; c=relaxed/simple;
	bh=gj8a5TrEjnssUnu3Iknnel3QZ7ChRRPUCa7f97qpEMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=deL4WxFI9PYtAvVD9JQetfLr2wSpvCApxw44xztHm81yP0fC5EbA42yBSpstE1tfLCGo7y1b8U45kWIff/WxU8ugwYnLUJdJHvaP1GchTKt3TZrocS76Yl9skG9YPB8btMelhcqF+YXuIiTYOD26+C/kUy6yz/ugiOUg0Z0BDsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SaHzpE/I; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SaHzpE/I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722562978; x=1754098978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gj8a5TrEjnssUnu3Iknnel3QZ7ChRRPUCa7f97qpEMM=;
  b=SaHzpE/I0JAYAd8s44nY5RAR3gIsEPdzUqzC2KnQhViMzUlpI9JbH572
   Mnon14DNd+TGYIJjdonHGeQBoZMEhyiBeIfbsjnVbw4zPWve8kIDgduAM
   lYijRtKk14TYmaUyoduxWQaWOs0kDUTvwxPwwi5tc6F7bunxQz1G+lgOY
   CN1zmcZFd6Zpi3VMbccI0mFm3THsc2K23CKPhv9ae0O9npa4rOI33nSX2
   QmlIDGm7X7lbnlzxIryH8DSD66aTNXcC5XWMwgoZjKl3PSsivYkuLI36P
   6A4xYVL+1vXHoKR7apDwCN7w+qDpcY3+A5GjTHAEI7hrUGbpwCbwZJ4gl
   g==;
X-CSE-ConnectionGUID: I1Y4M2RRSU65HCcKDgOF4A==
X-CSE-MsgGUID: GIo1f0qbR6CSqLBAxWNEUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11151"; a="20144589"
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="20144589"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2024 18:42:58 -0700
X-CSE-ConnectionGUID: weHMJe25SRCnucLxQiQc0Q==
X-CSE-MsgGUID: 86tQNvrgQHCZhdtjtprnkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,256,1716274800"; 
   d="scan'208";a="60261946"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Aug 2024 18:42:56 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZhJm-000wDM-1M;
	Fri, 02 Aug 2024 01:42:54 +0000
Date: Fri, 2 Aug 2024 09:42:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/for-next 3/4]
 arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34:
 regulators: 'boost' does not match any of the regexes:
 '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$',
 'pinctrl-[0-9]+'
Message-ID: <202408020905.CDsHnmKW-lkp@intel.com>
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
TO: Chris Morgan <macromorgan@hotmail.com>
CC: "Chen-Yu Tsai" <wens@csie.org>
CC: Andre Przywara <andre.przywara@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/for-next
head:   2873085a8cd52a55ed6ae80f94032f912a3f9a91
commit: c712e5d0985628b1df13930489b49b740e610a2b [3/4] arm64: dts: allwinner: h616: Change RG35XX Series from r_rsb to r_i2c
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-randconfig-051-20240802 (https://download.01.org/0day-ci/archive/20240802/202408020905.CDsHnmKW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev4+g23441a4
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240802/202408020905.CDsHnmKW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408020905.CDsHnmKW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-plus.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#
--
   arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi:147.6-938.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-h.dtb: pmic@34: regulators: 'boost' does not match any of the regexes: '^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/x-powers,axp152.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
