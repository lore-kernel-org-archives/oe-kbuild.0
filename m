Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F72B21579F
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 19:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752867894; cv=none; b=JCRYd9dkmMrDHsz0g12ne3HN517YjvUNd2Sk+Eldvf+5IOzgl1JWlVEWWHX+p2IkgS8vOQPi3IW91Yr5R274HtGueZUYzqFCMrbQXHvELU/syHY5uJTwSG+7hC1bzBv3EbGUEecsRtUNYoCs4vHt6cyXf93mAVdns8+bTRbRR5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752867894; c=relaxed/simple;
	bh=2UErMmzhKoZyQkQS8Z8bnCVQGT+uUAJtGIOHcaA9Wds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ktnUY7K5CKWck26KlTfBoVk9YYk2cpiZbih+sy/H/rLT0XtWdnyluPLMv6VT1aAkZv2KRAtunKpiL2PwPXZ+KKkUZfd6RnPgFlH61KIwmRZ/62JS76oU2pUTC2NkMwQh7vK+KnbwDyBmJX59VdWa9F9LVhO1iV2GUZSH6s8z1Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHHnT420; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHHnT420"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752867893; x=1784403893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2UErMmzhKoZyQkQS8Z8bnCVQGT+uUAJtGIOHcaA9Wds=;
  b=gHHnT420tlUONntgopvr8brHe7J5Re+CZeul7B6OrCRc+knDlDYOHQsu
   K8SnyIifB3fLF0QmIogJ9HCCvMMs7dFZtXuc4HEHNCUt4E7Wap2jTsDBP
   UiRVsKDhIJBFw8juZtHXCTBCW1cvQSpQEC20CpWmQvv6fLn9qtA+m3CI0
   JS82VFatx5gjdZ648g7bMHQe8eHmG/WhmMuvQNI1e1wY6GTQR2KNvw3t2
   qLXcrSI6uYAWJzxTJ3UU8vE5u2kOz+uMC4mew07I3Iep1Vek2EQbh6iMx
   JkLM6xv+FHMk2IRRAHieHsG7cCBDsn8YjPEENXUIIJhJ43sb4+BrTPnUK
   g==;
X-CSE-ConnectionGUID: 0ltfY7JyRsC21znnzUMMXQ==
X-CSE-MsgGUID: L81aHqgZQ2KWKLEQM5CJQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="72621032"
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="72621032"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 12:44:52 -0700
X-CSE-ConnectionGUID: ft8ELCFJRE+dvTVO/jEyHw==
X-CSE-MsgGUID: t8kqayHwR7SBTQzGsDMqfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,322,1744095600"; 
   d="scan'208";a="195263408"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 18 Jul 2025 12:44:50 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucr0g-000Eyz-0P;
	Fri, 18 Jul 2025 19:44:46 +0000
Date: Sat, 19 Jul 2025 03:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
Message-ID: <202507190311.yLHy531l-lkp@intel.com>
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
In-Reply-To: <20250717-add-support-for-meta-clemente-bmc-v8-2-2ff6afb36b0e@fii-foxconn.com>
References: <20250717-add-support-for-meta-clemente-bmc-v8-2-2ff6afb36b0e@fii-foxconn.com>
TO: Leo Wang <leo.jt.wang@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Joel Stanley <joel@jms.id.au>
TO: Andrew Jeffery <andrew@codeconstruct.com.au>
TO: Kees Cook <kees@kernel.org>
TO: Tony Luck <tony.luck@intel.com>
TO: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
TO: Geert Uytterhoeven <geert+renesas@glider.be>
TO: Magnus Damm <magnus.damm@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-aspeed@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: linux-hardening@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: leo.jt.wang@fii-foxconn.com
CC: george.kw.lee@fii-foxconn.com
CC: bruce.jy.hung@fii-foxconn.com
CC: Leo Wang <leo.jt.wang@gmail.com>

Hi Leo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 52da431bf03b5506203bca27fe14a97895c80faf]

url:    https://github.com/intel-lab-lkp/linux/commits/Leo-Wang/dt-bindings-arm-aspeed-add-Meta-Clemente-board/20250717-230223
base:   52da431bf03b5506203bca27fe14a97895c80faf
patch link:    https://lore.kernel.org/r/20250717-add-support-for-meta-clemente-bmc-v8-2-2ff6afb36b0e%40fii-foxconn.com
patch subject: [PATCH v8 2/2] ARM: dts: aspeed: clemente: add Meta Clemente BMC
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm-randconfig-052-20250718 (https://download.01.org/0day-ci/archive/20250719/202507190311.yLHy531l-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507190311.yLHy531l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507190311.yLHy531l-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740100:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: sdc@1e740000 (aspeed,ast2600-sd-controller): sdhci@1e740200:compatible: ['aspeed,ast2600-sdhci', 'sdhci'] is too long
   	from schema $id: http://devicetree.org/schemas/mmc/aspeed,sdhci.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740100: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/sdc@1e740000/sdhci@1e740200: failed to match any schema with compatible: ['aspeed,ast2600-sdhci', 'sdhci']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@34 (maxim,max1363): '#address-cells', '#size-cells', 'channel@0', 'channel@1', 'channel@2', 'channel@3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max1363.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: adc@35 (maxim,max1363): '#address-cells', '#size-cells', 'channel@0', 'channel@1', 'channel@2', 'channel@3' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/iio/adc/maxim,max1363.yaml#
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: i2c@600 (aspeed,ast2600-i2c-bus): Unevaluated properties are not allowed ('aspeed,enable-byte' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/aspeed,i2c.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: fsi@1e79b000 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: fsi@1e79b100 (aspeed,ast2600-fsi-master): compatible: ['aspeed,ast2600-fsi-master', 'fsi-master'] is too long
   	from schema $id: http://devicetree.org/schemas/fsi/aspeed,ast2600-fsi-master.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/fsi@1e79b100: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-clemente.dtb: /ahb/apb/dma-controller@1e79e000: failed to match any schema with compatible: ['aspeed,ast2600-udma']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
