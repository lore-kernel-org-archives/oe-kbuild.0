Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779EF2E403
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Dec 2024 08:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733387614; cv=none; b=TIvmAV/mEfPKELB3qPTZMlBpZ6q6ia+BnX5kMXoR/6EJD7TP2cGn5Els6TjbqH26f58MmrPrUtkqGTDilNgLVHtc7hNbCh9lb4bKzPB2DGsMAiSmHuXUrMAhcOm2xTQIZwjmoXmhAR69y37o6DH6Ui0G64YgQg1e7WbRN32rQ2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733387614; c=relaxed/simple;
	bh=t50YjWUh6SurVDfi+wfq+fdPGWq58pVo24s4c5HPzqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k4VkJGMXiSi5YuA9WACRMML3h9/Oajx9dojYSw8xiOKL/dR8lXVhWxIqMkTu1+HLUR78D+JM4he0szct11SCHyxP9S0OdK+PTTUoPrQKxgqxxLHk4GT6J9QK5u+sS0LvWDq/8w5eH9q1i2/DkoJl7OUY79cvxvWlp+73pRmB8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iKCq6Y3M; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iKCq6Y3M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733387612; x=1764923612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t50YjWUh6SurVDfi+wfq+fdPGWq58pVo24s4c5HPzqw=;
  b=iKCq6Y3MiB8Q/9b9tVKyKq0q/vvm7YK4kMJsbFhwOOv4hEQ6jVQjgre5
   GKTgZC1QkiAQqwQ2yyI5UpDA+pTiuYYMfc9DnzxOXdqmrIjmX75PVdVgj
   T/o+Jz5BkdLU95ePL0SEvo1sdOgx0utKmMCK6sFu+uW97cd1usQc6sRzd
   jES9WRjzqS7B9Q2DUMJ9qv0eWtfBWZhhmdRaseYKkbU2oED7T7kFw47qO
   xhBeM3BhTeQJxllkIWDt+TK+GeOpxMT6aJoXjVJhY0wAg6rsRgpkIKoc+
   ljxLGE8l2abjBGglGMf0I19e/2Qd6KDWSbMm1Jk69UB2SPxgZfUPDt9TL
   Q==;
X-CSE-ConnectionGUID: 4KeezkglSf2sCzC2JTxGcA==
X-CSE-MsgGUID: soC0JHQDTSGRPnlLEkqf1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33816724"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="33816724"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 00:33:31 -0800
X-CSE-ConnectionGUID: upacZJOfSBWgoeKa+oGSKg==
X-CSE-MsgGUID: heTgCel7QjWL79T2CJQ08Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="131463323"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2024 00:33:29 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ7IK-0003yV-1z;
	Thu, 05 Dec 2024 08:33:14 +0000
Date: Thu, 5 Dec 2024 16:32:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ralink/omega2p.dtb: watchdog@100:
 'interrupt-parent', 'interrupts', 'reset-names', 'resets' do not match any
 of the regexes: 'pinctrl-[0-9]+'
Message-ID: <202412051632.ANYuXS6T-lkp@intel.com>
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
TO: Sergio Paracuellos <sergio.paracuellos@gmail.com>
CC: Wim Van Sebroeck <wim@linux-watchdog.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Guenter Roeck <linux@roeck-us.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: 9023e05b7a5809593a7ea09896eee0bbb6ae1685 dt-bindings: watchdog: migrate mt7621 text bindings to YAML
date:   2 years, 2 months ago
:::::: branch date: 2 days ago
:::::: commit date: 2 years, 2 months ago
config: mips-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241205/202412051632.ANYuXS6T-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051632.ANYuXS6T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412051632.ANYuXS6T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ralink,mt7620a-soc' was expected
   	'ralink,mt7628a-soc' was expected
   	'mediatek,mt7621-soc' was expected
   	from schema $id: http://devicetree.org/schemas/mips/ralink.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: /: failed to match any schema with compatible: ['onion,omega2+', 'ralink,mt7688a-soc', 'ralink,mt7628a-soc']
   arch/mips/boot/dts/ralink/omega2p.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['mti,mips24KEc']
   arch/mips/boot/dts/ralink/omega2p.dtb: /reset-controller: failed to match any schema with compatible: ['ralink,rt2880-reset']
   arch/mips/boot/dts/ralink/omega2p.dtb: /interrupt-controller: failed to match any schema with compatible: ['mti,cpu-interrupt-controller']
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/system-controller@0: failed to match any schema with compatible: ['ralink,mt7620a-sysc', 'syscon']
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/pinmux@60: failed to match any schema with compatible: ['pinctrl-single']
>> arch/mips/boot/dts/ralink/omega2p.dtb: watchdog@100: 'interrupt-parent', 'interrupts', 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mt7621-wdt.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/interrupt-controller@200: failed to match any schema with compatible: ['ralink,rt2880-intc']
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/memory-controller@300: failed to match any schema with compatible: ['ralink,mt7620a-memc']
   arch/mips/boot/dts/ralink/omega2p.dtb: gpio@600: 'gpio-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/mediatek,mt7621-gpio.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/spi@b00: failed to match any schema with compatible: ['ralink,mt7621-spi']
   arch/mips/boot/dts/ralink/omega2p.dtb: /palmbus@10000000/i2c@900: failed to match any schema with compatible: ['mediatek,mt7621-i2c']
   arch/mips/boot/dts/ralink/omega2p.dtb: uartlite@c00: $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/omega2p.dtb: uartlite@c00: Unevaluated properties are not allowed ('reset-names' was unexpected)
--
   arch/mips/boot/dts/ralink/vocore2.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['mti,mips24KEc']
   arch/mips/boot/dts/ralink/vocore2.dtb: /reset-controller: failed to match any schema with compatible: ['ralink,rt2880-reset']
   arch/mips/boot/dts/ralink/vocore2.dtb: /interrupt-controller: failed to match any schema with compatible: ['mti,cpu-interrupt-controller']
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/system-controller@0: failed to match any schema with compatible: ['ralink,mt7620a-sysc', 'syscon']
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/pinmux@60: failed to match any schema with compatible: ['pinctrl-single']
>> arch/mips/boot/dts/ralink/vocore2.dtb: watchdog@100: 'interrupt-parent', 'interrupts', 'reset-names', 'resets' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/watchdog/mediatek,mt7621-wdt.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/interrupt-controller@200: failed to match any schema with compatible: ['ralink,rt2880-intc']
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/memory-controller@300: failed to match any schema with compatible: ['ralink,mt7620a-memc']
   arch/mips/boot/dts/ralink/vocore2.dtb: gpio@600: 'gpio-ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/mediatek,mt7621-gpio.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/spi@b00: failed to match any schema with compatible: ['ralink,mt7621-spi']
   arch/mips/boot/dts/ralink/vocore2.dtb: /palmbus@10000000/i2c@900: failed to match any schema with compatible: ['mediatek,mt7621-i2c']
   arch/mips/boot/dts/ralink/vocore2.dtb: uartlite@c00: $nodename:0: 'uartlite@c00' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/mips/boot/dts/ralink/vocore2.dtb: uartlite@c00: Unevaluated properties are not allowed ('reset-names' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
