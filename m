Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1453A6B8D
	for <oe-kbuild@lists.linux.dev>; Sun, 17 May 2026 16:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779034066; cv=none; b=Ve1G7fMDdOFeQDtybA+rfYLQLDxdkNMJ2kIJ0jNsGG3USH/Sg9DGN8/oNBbTnAsk1YRleJv98QZZz5oYB5F3C05KK0Uvup4CAtfcHo0oVISfv0CiSTdyGbC1Xn5G7t+m7ckbSohwYjHDz3ttxcFIOszOENfclC55HviVktiGL9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779034066; c=relaxed/simple;
	bh=OPG3yGhcl7JxMAGLLXnzxsSfDzlGgtfS/VUI0tfjlmk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Y22CcLI2LRr9G0Nr/a6Lr1elSt3jWqLPj148vDDknjJOH+8m5hnMew3gIWx0Mg3Axp2cTT/ju3MP3ktW6a3W0SLTgxlbWyFjVlVemVud1uX0kkvpcuoesJFr7DVR5OuAWsZ2v7ZOW0/z9F6d/FhwXRUjlzuP9uz/b6TgLNOoYas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBUCcBRp; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBUCcBRp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779034064; x=1810570064;
  h=date:from:to:cc:subject:message-id;
  bh=OPG3yGhcl7JxMAGLLXnzxsSfDzlGgtfS/VUI0tfjlmk=;
  b=EBUCcBRpINj6ChI5RqMh7jMSepW2FaaJn4mBXOsOl56TNCeIYJ/qN5Ib
   tyJZ4CorxJAGIvQfwlQ5MSNmO6jOsTADbh61UHV2ccatdBpRW4d77zSN7
   wYqytUQEkkBBoD6A0Z34Hc6cJZc61qN2NdTUq11wiGNisUlNyS31Ag+y+
   D/Cy1eXnKSbtUvHO9I2Mo4HAisntippzBnpPjQpgZz3Qpjcj7a3BCbjux
   CsCkt+8mWkXe0a4cbeKFmdiOSGEDOLn6wkFjqMSd0AKfDmToiPHwbjCWQ
   obR/baFIsKsHK9YnKUrsboiKbeR3rZwGVEjrvW5EatL+P+iJXvD2h+Xv5
   w==;
X-CSE-ConnectionGUID: 5J9dTgX5RVSr8v0+BZiLYQ==
X-CSE-MsgGUID: R/Ui1gk5T+STivoIdM9ETw==
X-IronPort-AV: E=McAfee;i="6800,10657,11789"; a="105363285"
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="105363285"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2026 09:07:43 -0700
X-CSE-ConnectionGUID: 1v4dcxSbSw+mZ488y8r8cQ==
X-CSE-MsgGUID: aI5lyWEhTXih4BDVA09efg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,240,1770624000"; 
   d="scan'208";a="236156439"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 17 May 2026 09:07:43 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wOe1k-000000009Yz-2Qce;
	Sun, 17 May 2026 16:07:40 +0000
Date: Sun, 17 May 2026 18:07:00 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [asahilinux:bits/000-devicetree 9/114]
 arch/arm64/boot/dts/apple/t6000-j314s.dtb:
 /soc/spi@39b10c000/hid-transport@0: failed to match any schema with
 compatible: ['apple,spi-hid-transport']
Message-ID: <202605171804.PmpNJGZr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Janne Grunau <j@jannau.net>

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   2d563843e07af55de0249a409021af705f586961
commit: 8889bf8cff77db2d9655f7f54bbc363c6b4d8895 [9/114] arm64: dts: apple: j31[46]: Add keyboard nodes
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-2055-20260516 (https://download.01.org/0day-ci/archive/20260517/202605171804.PmpNJGZr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260517/202605171804.PmpNJGZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605171804.PmpNJGZr-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t6000-j314s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6001-j314c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6000-j316s.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']
--
>> arch/arm64/boot/dts/apple/t6001-j316c.dtb: /soc/spi@39b10c000/hid-transport@0: failed to match any schema with compatible: ['apple,spi-hid-transport']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
