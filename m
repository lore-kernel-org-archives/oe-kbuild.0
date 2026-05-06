Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 113FF20CCDC
	for <oe-kbuild@lists.linux.dev>; Wed,  6 May 2026 06:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778047634; cv=none; b=g05YD3hzRJALkqw/U79VMXWPQeiNyuMlbPERvJg/gtYjIOWYi3lcyUcwzxfHddUEKY27c/wcRfZU6nMFvh7dgpvhM5dyRdgXYJRtEqujRsYJ38YGVACqOto73WyQBgVxRJL090QHj/TGrrR0q+p5k4NihtFh2jZmZzU5ajIDxYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778047634; c=relaxed/simple;
	bh=EQVyI8bYfnQcvFk8Y6EL17EWv2itb1P/eqXdVuVZv7Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gJUxrpXkuzT1n5eXDbG/Jx5Er8BCPeShT0NJoiHL9Jk0anNB2n9rstseDjuBKVSsYO2sBzOKyhjzAUO3PlYml1IjClKMBDtqfmOEamBpdEmatNRGPKSLzZdWlf01lQ33pdMhYCiSmwuuTc8Cn8F1k66Y4u4NF23CX5aHju/9t+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JIGB9X79; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JIGB9X79"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778047634; x=1809583634;
  h=date:from:to:cc:subject:message-id;
  bh=EQVyI8bYfnQcvFk8Y6EL17EWv2itb1P/eqXdVuVZv7Y=;
  b=JIGB9X79rxmiX+aLN/48FLWlVtspEqQLl5jJUuRYfPjuONqYMULLtUm5
   WXMKm5tZpM7FSeJOBwsaEM9jRktR0IuSzFMcXQZnTA81jLLqXrSXWPyyX
   Hd1NaGOptIl6t904yaSHW/m5rcESPPeZAGljQMCpCszD76jVX3flfTz/o
   /TDF60yZ3KXDuc5Uutec05hWPUnEfUDQ8XmMZ2Mipvbvf/nAQTnG249gC
   EhsHDRqRfaSnAcOTfkWckT/+aMGmYqP5xWAkLxDJ2SAuZ+mcXQHm0XTMy
   Pu94swS9ke73OVp878QWc+y/78fcSfkdeJCbUAmTtoFfE5YPowbXQf8Rw
   w==;
X-CSE-ConnectionGUID: 2N6A162TTriUC48pCekPKQ==
X-CSE-MsgGUID: 0zbKFt2KTTSVvV0EvaALAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11777"; a="101609292"
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="101609292"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2026 23:07:13 -0700
X-CSE-ConnectionGUID: Tnyh6kUJSA26ZBM5WivUZQ==
X-CSE-MsgGUID: LwCAw+fQQ6ea9slU2DtTmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,219,1770624000"; 
   d="scan'208";a="241012224"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 May 2026 23:07:11 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKVPZ-000000006Rt-2C9n;
	Wed, 06 May 2026 06:07:09 +0000
Date: Wed, 06 May 2026 08:06:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000
 (apm,xgene-enet): Unevaluated properties are not allowed
 ('local-mac-address', 'phy-connection-type', 'phy-handle' were unexpected)
Message-ID: <202605060816.va0s0UVU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   74fe02ce122a6103f207d29fafc8b3a53de6abaf
commit: 0b467f5a7f19853d8b7a920468d795e682442b80 dt-bindings: net: Convert apm,xgene-enet to DT schema
date:   8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-2052-20260429 (https://download.01.org/0day-ci/archive/20260506/202605060816.va0s0UVU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260506/202605060816.va0s0UVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0b467f5a7f19 ("dt-bindings: net: Convert apm,xgene-enet to DT schema")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605060816.va0s0UVU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/pmu@78810000/pmucmc@7e8d0000: failed to match any schema with compatible: ['apm,xgene-pmu-mc']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/mailbox@10540000: failed to match any schema with compatible: ['apm,xgene-slimpro-mbox']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: mmc@1c000000 (arasan,sdhci-4.9a): Unevaluated properties are not allowed ('dma-coherent' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/arasan,sdhci.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/rtc@10510000: failed to match any schema with compatible: ['apm,xgene-rtc']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/mdio@17020000: failed to match any schema with compatible: ['apm,xgene-mdio-rgmii']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/apm,xgene-enet.yaml
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): Unevaluated properties are not allowed ('local-mac-address', 'phy-connection-type', 'phy-handle' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/apm,xgene-enet.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: ethernet@17020000 (apm,xgene-enet): phy-handle:0: [36, 37] is too long
   	from schema $id: http://devicetree.org/schemas/net/ethernet-controller.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /soc/dma@1f270000: failed to match any schema with compatible: ['apm,xgene-storm-dma']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
