Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C66D19CC14
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 15:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779378066; cv=none; b=Pj6Agz4nuv0QI5ZgurcIWx6y/I8Q4YL4cik2pzF5EUtw+V0NBTPCYIlooptrBxQ8+VcZ8L1uPjmS6jJvrdtv41OwHb14DaRIgcWtfT42b+nLwr2j3Qn0KpgB/gNyxN4TL1//Gbv7onRDAO27SCdyU6TCX69Gbldl+4/s+1MZaAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779378066; c=relaxed/simple;
	bh=c+T+zupRDm8/bZ1EH3KJ98ZZ080yOL3vRvnXdXzyNvw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xc2fWz0c/EhTmshjZcA612tSrt0z/GMvU07zKL4iWlgO+NJ9EAMY/BBay3Oz430S9aMfam6vG7G2sWGDoLoZEwLy/+nIX9UPt6sAxJ8GsyBhgeqgQht6jYLQ16P7uPaAPgnrA7WwEV6NMF5/kkurEZXAM4s8dqqOj8XmOvsN/0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bDp8v2aS; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bDp8v2aS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779378064; x=1810914064;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c+T+zupRDm8/bZ1EH3KJ98ZZ080yOL3vRvnXdXzyNvw=;
  b=bDp8v2aSinkSvSEsDTCD9QFshpzpVNdxEeCyyofthO6fQ1YO7zAUq8ci
   4mQSiXOjrShi+BFsLYbDcWQtJcHurpUHCbbiEGdVyYFHLOyVVmkNKA1Tn
   xofXIJGIgCYFcYkIkoeWvCXKDysDS/Jt1Ts6cav2WcTepuZOu1DIJ90Do
   beRS4Fwc16n4nTvsQlfZNSx3x+aVVhRQB1UllwL20WibcBgCINWkqlKRL
   E/U3c3fpFczgDH/ODash8zSVqzMcbgw3b8/mri29tQoiSK6b6KnunFUqR
   zedFNxfGBQCC4rjeKikD2/eGYXW/0vQbkw/M/KlIC+4PB/IDIuOQBPUjN
   g==;
X-CSE-ConnectionGUID: QQPwFP1JTPuynfsF3Qs2nQ==
X-CSE-MsgGUID: YpClDYP0RFeb5FXv3VJ5Aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="91409130"
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="91409130"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 08:41:04 -0700
X-CSE-ConnectionGUID: Znnv/95CQvm0v05lI4rFEw==
X-CSE-MsgGUID: zlamjoxjRYGyzanzr8Whbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,160,1774335600"; 
   d="scan'208";a="244570050"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 21 May 2026 08:41:04 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ5W8-00000000Ax7-3Z2d;
	Thu, 21 May 2026 15:41:00 +0000
Date: Thu, 21 May 2026 17:40:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for
 S32G platforms
Message-ID: <202605211704.G7ns4l57-lkp@intel.com>
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
In-Reply-To: <20260520151007.4193688-2-khristineandreea.barbulescu@oss.nxp.com>
References: <20260520151007.4193688-2-khristineandreea.barbulescu@oss.nxp.com>
TO: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
TO: Chester Lin <chester62515@gmail.com>
TO: Matthias Brugger <mbrugger@suse.com>
TO: Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: linux-arm-kernel@lists.infradead.org
CC: imx@lists.linux.dev
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: NXP S32 Linux <s32@nxp.com>
CC: Christophe Lizzi <clizzi@redhat.com>
CC: Alberto Ruiz <aruizrui@redhat.com>
CC: Enric Balletbo <eballetb@redhat.com>

Hi Khristine,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v7.1-rc4 next-20260521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khristine-Andreea-Barbulescu/arm64-dts-Add-usbphynop-and-usbotg-pinctrl-for-S32G-platforms/20260520-233219
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260520151007.4193688-2-khristineandreea.barbulescu%40oss.nxp.com
patch subject: [PATCH v2 1/1] arm64: dts: Add usbphynop and usbotg pinctrl for S32G platforms
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: arm64-randconfig-2051-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211704.G7ns4l57-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211704.G7ns4l57-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605211704.G7ns4l57-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/s32g274a-evb.dtb: usb@44064000 (nxp,s32g2-usb): Unevaluated properties are not allowed ('fsl,usbmisc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
>> arch/arm64/boot/dts/freescale/s32g274a-rdb2.dtb: usb@44064000 (nxp,s32g2-usb): Unevaluated properties are not allowed ('fsl,usbmisc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
--
   arch/arm64/boot/dts/freescale/s32g3.dtsi:868.27-874.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"
>> arch/arm64/boot/dts/freescale/s32g399a-rdb3.dtb: usb@44064000 (nxp,s32g3-usb): Unevaluated properties are not allowed ('fsl,usbmisc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
