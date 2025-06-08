Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2FF33EA
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 03:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749351973; cv=none; b=ZoGeXsyk+F9H06gVuGiDWJBFopPGuWhwjyKY/qMHn2EuI9PzAY9YiknZt4xo12VMjqthM0883n5LWdJ7/D351bofG4uHFl//qiU2RT7aAGsheiVqjILpgtctCsrMboiNhBKbLCHqY5S0SD/b+2Dvme7bIUay7s1YU3h6OeDVuNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749351973; c=relaxed/simple;
	bh=83ifaGLU3aCKCeoWN5ioGPqmeCKQdEPW8lsCbWna6hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UZyJgmxYpt+JQk8rVt7nWH5IUv+/QDo4fW7rWt0l3hjBGg/lqg1WVgD7PnHw5Fk7qZ7vYi8KdbrotckVnPlOgpfQ3Ds5n++cglntKhspCkzNNcmhqFU7OKRgQ5LF+iqy3skjuQmeBqYh5Uuw89/818lNqjP7Em3vwUf+sl+1nNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G3EO1qKx; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3EO1qKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749351972; x=1780887972;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=83ifaGLU3aCKCeoWN5ioGPqmeCKQdEPW8lsCbWna6hc=;
  b=G3EO1qKxrmtejEKGrB9a1HWZevyJiGPpoHoMrSjXm6agUpKYmvZe//NI
   eLMhfr7pnIYzfqGtSXmDcGDuhI4eyYBw7W5ntr9+bnlQSEMaR4RGKmjoo
   ecJZCZozgpUuzuPaOMUks817eqVgj4JTmGy3ACYoafx5skxv56hG4W/BA
   vSvImJXtuiolrtFK71WZbnjbYX5Ub9JdH1WannQtgNOfppv+0sAAuuJCV
   rUiR2E+eJyJ/kUAYOJZt4Q3NN6Pp3hCLFxWLvZjSb3/2MUcsvTYxi2Rc4
   pLeqpbaRaJiyp0rw5YMcVSGUcmDODyXpROER9KLvzYLz7AqEKtizvYqB3
   Q==;
X-CSE-ConnectionGUID: pIL2QccYRq2jwYkqLRADpQ==
X-CSE-MsgGUID: gd2Tz14WSCqKSaBWx6YVAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51341649"
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="51341649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 20:06:11 -0700
X-CSE-ConnectionGUID: YDJnX2qzRh6ClPRGzIYZ2w==
X-CSE-MsgGUID: ub8czJXsST6p+rXXRd8BVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,219,1744095600"; 
   d="scan'208";a="146080184"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 07 Jun 2025 20:06:11 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO6MK-00069V-0s;
	Sun, 08 Jun 2025 03:06:08 +0000
Date: Sun, 8 Jun 2025 11:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 03/10] ARM: dts: imx6ul: support Engicam MicroGEA BMM
 board
Message-ID: <202506081040.yhVXdWta-lkp@intel.com>
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
In-Reply-To: <20250607093342.2248695-4-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-4-dario.binacchi@amarulasolutions.com>
TO: Dario Binacchi <dario.binacchi@amarulasolutions.com>
TO: linux-kernel@vger.kernel.org
CC: Matteo Lisi <matteo.lisi@engicam.com>
CC: linux-amarula@amarulasolutions.com
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Fabio Estevam <festevam@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: Rob Herring <robh@kernel.org>
CC: Sascha Hauer <s.hauer@pengutronix.de>
CC: Shawn Guo <shawnguo@kernel.org>
CC: devicetree@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org

Hi Dario,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bdc7f8c5adad50dad2ec762e317f8b212f5782ac]

url:    https://github.com/intel-lab-lkp/linux/commits/Dario-Binacchi/dt-bindings-arm-fsl-support-Engicam-MicroGEA-BMM-board/20250607-173700
base:   bdc7f8c5adad50dad2ec762e317f8b212f5782ac
patch link:    https://lore.kernel.org/r/20250607093342.2248695-4-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH 03/10] ARM: dts: imx6ul: support Engicam MicroGEA BMM board
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm-randconfig-052-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081040.yhVXdWta-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081040.yhVXdWta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506081040.yhVXdWta-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-bmm.dtb: sgtl5000@a (fsl,sgtl5000): Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/fsl,sgtl5000.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
