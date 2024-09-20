Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA3017588
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Sep 2024 06:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726812143; cv=none; b=u6lzSrwSAQrnEN6yIkiGLwalpXIrHtlVb5z3KWXYFTzF2BvfUInJj3zPdsIHUOIxnrKym5McDSwrMCtASvAbn7szIACJnj9a1UumoBySAupsmBj/KKzz6QlyELJUIuo10rM+GYWZt1zZdojHKTInN0PxQho951jrUVYacbGUM3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726812143; c=relaxed/simple;
	bh=qk+QnysgtK7/K8Tk1V9uhRq/WdATU3lgWT0g79rv45g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iZDQUaznITSOi5GRvpQVkaX6gRRn2mRB1CSYe4DPS5OKYiCVFLsNB0Mb5Ttwqv/dowYMgC5ynZumUmyG2RoZbvvN871rxeS+ZBbWmnMRfgGGZWIJckpSjwa9jtqIBk3eg8MTcJ26yVDaUBRnu/Ld9NoeibCcEb2oh9bEEMc8e7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/8fqf0R; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/8fqf0R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726812142; x=1758348142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qk+QnysgtK7/K8Tk1V9uhRq/WdATU3lgWT0g79rv45g=;
  b=d/8fqf0RE0qqeoA2NQzlsZsttg+HiJmQKQmOEnbsch6yvJlbgpNeMXz7
   TZRKKxb+UdEnYEi33aRcYzMhXgj21yuKu6obU3/PPP3rO3NZirmrG8deb
   GUtwQ2wEFX3YevKS6txAfq33KJdCy2ba+jSnOQGdFJe409MM4GmtyjJGD
   UWBefPkn3RjYqd/CZ7Ee351SQ7wq7PrN1YJwOVAtIlWAUIzOSvGbukBWA
   4KsuD6PaZlW3F7htgixPnp+wSYmB7/7rEhvALRkIL24j222HNnwztdkiI
   QzzI7tsVm2sc7JYopG775vUiNGfjC5QSDTKOdNjGr0QVnvXX2JlYUyuah
   Q==;
X-CSE-ConnectionGUID: CdrZCp+2RQ2gViUpVg9ZrA==
X-CSE-MsgGUID: aFCRw/geTuWbye3GQDF6Qw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25956568"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="25956568"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 23:02:21 -0700
X-CSE-ConnectionGUID: EOBPUj/GRVqkOrAEz2pKiw==
X-CSE-MsgGUID: 68sG8nOHQ6GMgOAOV/zdNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="74718362"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 19 Sep 2024 23:02:20 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srWif-000E0y-33;
	Fri, 20 Sep 2024 06:02:17 +0000
Date: Fri, 20 Sep 2024 14:01:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0: $nodename:0:
 'expander@0' does not match '^serial(@.*)?$'
Message-ID: <202409201309.9jDjgowv-lkp@intel.com>
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
TO: Hugo Villeneuve <hvilleneuve@dimonoff.com>
CC: Rob Herring <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   baeb9a7d8b60b021d907127509c44507539c15e5
commit: 0d447e927ee86e9ff89010085a47a275c2bb5594 dt-bindings: sc16is7xx: convert to YAML
date:   12 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 12 months ago
config: mips-randconfig-051-20240920 (https://download.01.org/0day-ci/archive/20240920/202409201309.9jDjgowv-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 8663a75fa2f31299ab8d1d90288d9df92aadee88)
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201309.9jDjgowv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409201309.9jDjgowv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/rtc/ingenic,rtc.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: /rtc@10003000: failed to match any schema with compatible: ['ingenic,x1000-rtc', 'ingenic,jz4780-rtc']
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: pin-controller@10010000: $nodename:0: 'pin-controller@10010000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: serial@10032000: 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: serial@10032000: 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/ingenic,uart.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: spi@10043000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/ingenic,spi.yaml#
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0: $nodename:0: 'expander@0' does not match '^serial(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml#
>> arch/mips/boot/dts/ingenic/cu1000-neo.dtb: expander@0: Unevaluated properties are not allowed ('sc16is752' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/nxp,sc16is7xx.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000: $nodename:0: 'i2c-controller@10050000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000: 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10050000: 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10051000: $nodename:0: 'i2c-controller@10051000' does not match '^i2c@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/i2c/ingenic,i2c.yaml#
   arch/mips/boot/dts/ingenic/cu1000-neo.dtb: i2c-controller@10052000: $nodename:0: 'i2c-controller@10052000' does not match '^i2c@[0-9a-f]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
