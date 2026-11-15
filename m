Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794703543;
	b=Ut2TvUeRwl8V9zWIcDdXavb0lki1t+aK+nv3xMOMGYt4Vsl0GX558PybVwD+6QTJ7ltO
	 v6Qkx1sqpGa68ra1wJzu2HCPGMhqbli5maLmON/C3HRxAxCVk4KCbizCVMx3INHaWcJGB
	 E+yvvihKHkbw1PjP2WlFpxZxuwgCCBeLqU7AMPV3spVwBSmhjD80P87gm3YN1VO8iclTr
	 hHkLf6UTeNzmH46Mk5/uDgKOmW4rJu8mlqNhLQGMik5edb8xW9Gnq3+6BY5Tx5sYqKVdo
	 KHG2bUHdpL4cFGFCXOZfxAhJ9ZKEhhr3jM/7uCcpt77sU03+HRYqALS/0iBS3pQjQ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794703543;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=m8/ZqgN0QIKxWrtjMcHL/hg3tcJ1ny6z7TqSQAyfStY=;
	b=LnEWj2xwiPBUwZpDVLUJKHnyFrFz9vWDDrRKUMscD2sXres8Gfpef2Wey72CxTL02uJM
	 eIQVPTakqUzA89grm+Lar6cTqBPR1UbTU4l5RYBcS6JvKpPe18DlsCeLsVxtiYqVi8KUs
	 QaLZgLErKE31j0s92NCay4Vtl5eSSB+ksur+2msZBcXxWhsuTU1MvRQM6Wo7YzmQ2qqYy
	 8oCiNWq0TJYEm+5F36B64W7vcfwD9AhtdinTzd76HExW+EtNJl9QlhldkgO2eop0YBmdI
	 O3cpRjzusMay+A3C3VFRwUzZW05sOX6kpa3Si5UseTGxWp6y7zrdFO11SLH3MMcicmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kEGky298;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D434606A323
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 00:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D434606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kEGky298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794703542; x=1826239542;
  h=date:from:to:cc:subject:message-id;
  bh=GS7GkQyRO+sXlx8CRpWbEoMvl1uyT4T/OC3t/yizrjs=;
  b=kEGky298ZodXBMzUadYf/pjpjxh5p8gO9gd9aiBTx4pSZgs8/Am7jSY6
   aBW/DfYaXynXRyGp7ryCgPnrfkv+CVAGkdrFIZIB5aLTApDiMAe3K9C+h
   9l/pUAV0boIttVeWPYZ/E+/ddXkXBHAEpupcNEHu8PV0KcpL5+ScAC22k
   GtjkKdSR0tzWHxYqGbGWvjGNPppszjw/YC7NY8beDcV/W22dZInNFDWB/
   KzdpUIg9K7YdyjgzoygIg9QZPsjMfXeRiV+oM+0i8yMZ5BF7Oo/CmvNey
   l5FHs5obh9KsJhuQLaplerdg3ZbG5bcLdlaIj7aNDNaTzmgVUNs8AdCVd
   A==;
X-CSE-ConnectionGUID: eVqmQz5PTxGFeIJI28pPgw==
X-CSE-MsgGUID: 55bGkLQeSfqT28nXdPiWeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3553576"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3553576"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 16:45:42 -0800
X-CSE-ConnectionGUID: WEDmOZsAQOig7XeEN8ToTw==
X-CSE-MsgGUID: UwcyWOvvSGqJBxYO2d3klQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9166268"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 14 Nov 2026 16:45:41 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSONG-000000001x8-2l1G;
	Sun, 15 Nov 2026 00:45:38 +0000
Date: Sun, 15 Nov 2026 01:45:05 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:asahi-soc/for-next 47/49]
 arch/arm64/boot/dts/apple/t8142-j704.dtb: watchdog@3882b0000
 (apple,t8142-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202611150130.8u56DHnn-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yureka Lilian <yureka@cyberchaos.dev>
CC: Sven Peter <sven@kernel.org>

tree:   https://github.com/AsahiLinux/linux asahi-soc/for-next
head:   28855296b06c296478ccf5e9ad2abde02d2bdfdb
commit: b9a12ab2c2d51978de749e7f937f6656f0867a37 [47/49] arm64: dts: apple: Add minimal t8142 (M5) device trees
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261115/202611150130.8u56DHnn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611150130.8u56DHnn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611150130.8u56DHnn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8142-j704.dtb: watchdog@3882b0000 (apple,t8142-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8142-wdt' is not one of ['apple,t6020-wdt', 'apple,t6030-wdt', 'apple,t6031-wdt', 'apple,t8122-wdt', 'apple,t8132-wdt', 'apple,t8140-wdt']
   	'apple,t8142-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
>> arch/arm64/boot/dts/apple/t8142-j704.dtb: /soc/watchdog@3882b0000: failed to match any schema with compatible: ['apple,t8142-wdt', 'apple,t8103-wdt']
--
>> arch/arm64/boot/dts/apple/t8142-j813.dtb: watchdog@3882b0000 (apple,t8142-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8142-wdt' is not one of ['apple,t6020-wdt', 'apple,t6030-wdt', 'apple,t6031-wdt', 'apple,t8122-wdt', 'apple,t8132-wdt', 'apple,t8140-wdt']
   	'apple,t8142-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
>> arch/arm64/boot/dts/apple/t8142-j813.dtb: /soc/watchdog@3882b0000: failed to match any schema with compatible: ['apple,t8142-wdt', 'apple,t8103-wdt']
--
>> arch/arm64/boot/dts/apple/t8142-j815.dtb: watchdog@3882b0000 (apple,t8142-wdt): compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t8142-wdt' is not one of ['apple,t6020-wdt', 'apple,t6030-wdt', 'apple,t6031-wdt', 'apple,t8122-wdt', 'apple,t8132-wdt', 'apple,t8140-wdt']
   	'apple,t8142-wdt' is not one of ['apple,s5l8960x-wdt', 'apple,t7000-wdt', 'apple,s8000-wdt', 'apple,t8010-wdt', 'apple,t8015-wdt', 'apple,t8103-wdt', 'apple,t8112-wdt', 'apple,t6000-wdt']
   	'apple,wdt' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/apple,wdt.yaml
>> arch/arm64/boot/dts/apple/t8142-j815.dtb: /soc/watchdog@3882b0000: failed to match any schema with compatible: ['apple,t8142-wdt', 'apple,t8103-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
