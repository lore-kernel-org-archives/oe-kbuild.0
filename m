Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794128192;
	b=a71sPsjQIRnFLvsaDXd71gLeFWd/Ypuzy84Q3WGIMwfSLl2IsAnySX/hUa63lqy/7yms
	 x/rDm/AYtdhf2Jhjs0Y80q+NJtJnOMtZrf5QB0/GZ6niD4ZDOx/goxxklAaiicT+q274q
	 E50eRJE077Fr4Hd/IiAxqXaTBQMaCWaUPXikqZSWB+88aB1qogpT0b8CGUmMpRjG/0iV1
	 6Gl9BJn7/9/3rV+QgO01eFPFfmjGpeJlxsOZ5Kx0NNbTBAY5cfMvAIftvq4IErkxS0dfb
	 2QK5QaJj0CXhF9U7kEp9zo9ojQ8og5tKSjf3lID12Yvy0eTG0qkGOD6x4jfX7l49DNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794128192;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=UwMWYoRh++czEhxNe9GTI995TA0GSyg1XT9mtMNLB+Q=;
	b=zGz6ARFFLii6A/JYG1747Jpgaip06o9Rlwy91yGhqHkP1zHJqL6/FhJld8GzYG7BnJtu
	 WVmF/Z5/eiHKOdWyK4G1n9nKJKVb3gbvQDszc6Rh9PQBn3yS6dSQVeMAvnMWmlB5D92Tw
	 ty+nDskUWrPAO43SmvxGPBBRHZqdomDtDgSQ1ue54bBYtrWmoyyipF4FE2+MUS6BNIe/4
	 cpjI80lpbSuRzsMON16Rqmc1tfwwGQuy2C6iFZ7sZDGYcFSzO9TDlGqs/RCmdjDUFK2W1
	 8rWCqOMb7ZqpAb43eiq1Xmjf/cSa6s13LONSplhu9/qdVOAoMnRHS1rKYZtbcNQpbRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9PRMT+w;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E2C606A31C
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Nov 2026 08:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51E2C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9PRMT+w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794128192; x=1825664192;
  h=date:from:to:cc:subject:message-id;
  bh=GUxBdTWdMQZHW5V7LPDXNKBQ/Ibe/U19IDnRynAb5JI=;
  b=I9PRMT+wc+LGhG4VC9k6zZ4bfjlHdR+KX2NvyvpaoqBmDMvBzsAu4dRE
   aONLusYzNwio6s4P8BvzCQFetODEmioxhSP49TXuUDh2y6lR7oQ5q9qZh
   uXQpbQfPTzsDZOVAC9i9Isulq7u0Q2SxS5nbLEWWMbAryoo4Me35YXyJ1
   RjOmkuwpwoq1DarEGLwfKctmUV1v/JTVweoOHd3Uf2WUycl6RlyDgg+YE
   0/RZz8xFwo3fMf12Sw+Ou4aya2D2UXB9HpueXeObrTZIFhctanfX2dMLU
   KyjHx+f87iTEAFEK83P69ycUoW6CaZ8Ij9BXIkw6rcRo4VQMZcaCzP55D
   Q==;
X-CSE-ConnectionGUID: 51R4RL0FTzqDykBtTIcnug==
X-CSE-MsgGUID: KKn6Y16lTfKgQ0YKlkvyMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2763111"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2763111"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 00:56:31 -0800
X-CSE-ConnectionGUID: IKuon4nJTlil6QnfSy9o7A==
X-CSE-MsgGUID: 8lbOSJERTty3YuTIK42VzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7760193"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Nov 2026 00:56:29 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPyhP-00000000BMV-1MCs;
	Sun, 08 Nov 2026 08:56:27 +0000
Date: Sun, 08 Nov 2026 09:56:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linusw-nomadik:b4/ux500-gpio-hogs 2/2]
 arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: gpio@101e7000 (st,nomadik-gpio):
 Unevaluated properties are not allowed ('ngpio' was unexpected)
Message-ID: <202611080951.7HldjLx6-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Linus Walleij <linusw@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git b4/ux500-gpio-hogs
head:   378b80bd19fdca0c1aabc1cb5bfb3dd2593c7bf9
commit: 378b80bd19fdca0c1aabc1cb5bfb3dd2593c7bf9 [2/2] dt-bindings: gpio: nomadik: Describe DB8500 and GPIO hogs
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261108/202611080951.7HldjLx6-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611080951.7HldjLx6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611080951.7HldjLx6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:619.26-624.5: Warning (unit_address_vs_reg): /src@101e0000/pclkmsp3@48M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:625.24-630.5: Warning (unit_address_vs_reg): /src@101e0000/mspclk3@48M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:631.24-636.5: Warning (unit_address_vs_reg): /src@101e0000/mshcclk@48M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:637.24-643.5: Warning (unit_address_vs_reg): /src@101e0000/usbmclk@48M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:644.24-649.5: Warning (unit_address_vs_reg): /src@101e0000/rngcclk@48M: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:692.7-715.4: Warning (unit_address_vs_reg): /i2c0: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/st/ste-nomadik-stn8815.dtsi:718.7-739.4: Warning (unit_address_vs_reg): /i2c1: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: / (calaosystems,usb-s8815): False schema does not allow {'device_type': ['memory'], 'reg': [[0, 67108864], [134217728, 67108864]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml
>> arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: gpio@101e7000 (st,nomadik-gpio): Unevaluated properties are not allowed ('ngpio' was unexpected)
   	from schema $id: http://devicetree.org/schemas/gpio/st,nomadik-gpio.yaml
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: gpio@101e7000 (st,nomadik-gpio): ngpio: b'\x00\x00\x00\x1c' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: /pinctrl: failed to match any schema with compatible: ['stericsson,stn8815-pinctrl']
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: pinctrl (stericsson,stn8815-pinctrl): nomadik-gpio-chips: b'\x00\x00\x00\x05\x00\x00\x00\x06\x00\x00\x00\x07\x00\x00\x00\x08' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: mmcsd_default_cfg1: ste,output: b'\x00\x00\x00\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/st/ste-nomadik-s8815.dtb: i2c0_default_cfg: ste,input: b'\x00\x00\x00\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
