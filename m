Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4EA85283
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Aug 2024 19:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723838357; cv=none; b=qVidWY/tVpyGFFaLYj6Ayn6IO1kIwvZ8nSjzVfg4PvlV2KKpYCxWyEdp6JrayXbJ8sTExU/uBAKZod/esweeGWHnvlPmIpGbaj6i/smDPbgColC5+jYkPrNh5ouFuq5O7Ng6QU0yTP6DLNnvWiiUK4qiP3nECdwwgYnj46e5+cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723838357; c=relaxed/simple;
	bh=eTSMTb6jS0bO83p5iDNJB/Mc8KgEeIay6FRMIjRZlPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qOcCIA9U4fdtQRzDpUHKwiQRFf2pRxPr61TFjl7edfkd1jfoDf0na/X4BYCCcL0aHs5H384gOdOH3RoSt8GMfqeAUXi2soIqZsSWLxpDkV720PJmQIathLM6lBgrVbqEqbkQsO8reGjdtOKAkmotY23wRtlRTJbKLEeKpSmowXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bFTIN3/5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bFTIN3/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723838355; x=1755374355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eTSMTb6jS0bO83p5iDNJB/Mc8KgEeIay6FRMIjRZlPA=;
  b=bFTIN3/56iAk5ImwNyUyJ2w6YMnysHa86iKhNVq3uzQQHUfDs5kYiWS8
   56oXpWw9BVJuFlLNd0jybDW+eGx0/MYG8D9hWPgzElu83JDAFlw3lUSmJ
   R4+CAmSMp4yv8OHsbj2+0wU4DLceblMK006Tn33w7dUZAvO+ZAkQzahvh
   85ob9AK0NaBIKeugDbEPwhSCFnIXoC7EEJpZ8TBdpda3wc1P4mTx+uDEp
   qsBN1Ff4ov28nHhbTOB/wz1YX8p3TpotQ5mNTYVAftu/07PIHaxgv7WoI
   iTxLgoNmw5Qvg1kKbsf+BVHIN5zF1ZU0jB6dqeTNU42rgHger46j0FAEv
   Q==;
X-CSE-ConnectionGUID: ladI31gxS5GTM3VYikSvuw==
X-CSE-MsgGUID: 4oUTAoMLRdisftOXGt6PQw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33557112"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="33557112"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 12:59:14 -0700
X-CSE-ConnectionGUID: 8Ds4/qlrT1Sh4HoG6b2eHg==
X-CSE-MsgGUID: AFKUO1XYSuCH25VfSn2s7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59407480"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 16 Aug 2024 12:59:13 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf36N-0006t4-1J;
	Fri, 16 Aug 2024 19:59:11 +0000
Date: Sat, 17 Aug 2024 03:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: wdt@18060008:
 $nodename:0: 'wdt@18060008' does not match
 '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202408170313.VIpr0upd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nik Bune <n2h9z4@gmail.com>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   296c871d2904cff2b4742702ef94512ab467a8e3
commit: 70f272bde8c31267288740fa8da587c74b03b33c dt-bindings: watchdog: qca,ar7130-wdt: convert txt to yaml
date:   8 months ago
:::::: branch date: 61 minutes ago
:::::: commit date: 8 months ago
config: mips-randconfig-051-20240817 (https://download.01.org/0day-ci/archive/20240817/202408170313.VIpr0upd-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170313.VIpr0upd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408170313.VIpr0upd-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar9132-cpu-intc', 'qca,ar7100-cpu-intc']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /interrupt-controller: failed to match any schema with compatible: ['qca,ar9132-cpu-intc', 'qca,ar7100-cpu-intc']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: uart@18020000: $nodename:0: 'uart@18020000' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: uart@18020000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar9132-gpio', 'qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/gpio@18040000: failed to match any schema with compatible: ['qca,ar9132-gpio', 'qca,ar7100-gpio']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9132-pll', 'qca,ar9130-pll']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/pll-controller@18050000: failed to match any schema with compatible: ['qca,ar9132-pll', 'qca,ar9130-pll']
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: wdt@18060008: $nodename:0: 'wdt@18060008' does not match '^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/qca,ar7130-wdt.yaml#
>> arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: wdt@18060008: Unevaluated properties are not allowed ('clock-names', 'clocks', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/watchdog/qca,ar7130-wdt.yaml#
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar9132-misc-intc', 'qca,ar7100-misc-intc']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/apb/interrupt-controller@18060010: failed to match any schema with compatible: ['qca,ar9132-misc-intc', 'qca,ar7100-misc-intc']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar9132-spi', 'qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/spi@1f000000: failed to match any schema with compatible: ['qca,ar9132-spi', 'qca,ar7100-spi']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /ahb/spi@1f000000/flash@0: failed to match any schema with compatible: ['s25sl064a']
   arch/mips/boot/dts/qca/ar9132_tl_wr1043nd_v1.dtb: /usb-phy: failed to match any schema with compatible: ['qca,ar7100-usb-phy']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
