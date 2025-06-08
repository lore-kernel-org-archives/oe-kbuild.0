Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC6E1E1E04
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jun 2025 06:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749364351; cv=none; b=ol+WammwJgdNueu6ZGhYE0avUymXvORXjiZytiIRbmGb2wBJUdRFJVruMEo6eKtvMoJI7F9fYYNo9rEcqALYs07zSOO+MS4RHqGUqaFxBlVbs9cOmgbFD+Nwxs4IPjRnIp8/inKCHOzD5sKyI4aIUlr0VDwayveqdvL6sRldGas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749364351; c=relaxed/simple;
	bh=XsSqTPya4DEkO2ZFB1vEdFgbLMtiUsDRYYr+6u5weHk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=grtZyxRISqTC05tmR8X+nici/RaBQdlJIzZFY5SUZqe//Q67GR2J74PenC0h5057MoDOycsHz+6qu6TKcLAulJrTayz3HGLnK08n8CrHv452fdMzma/aTvXFD2edcHH5nPiRxVe3M3ppP1zDsT9wUNgjSHzBs9EAigr5C3GldRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ffwhfuVx; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ffwhfuVx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749364349; x=1780900349;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XsSqTPya4DEkO2ZFB1vEdFgbLMtiUsDRYYr+6u5weHk=;
  b=ffwhfuVxdaaVekdfvspEbatxkEy9vXdDbndEBApTDoPd9fkjBnstzAWm
   3Bi5GB0ngvCbGINL4fzy3uxYZCF4o7Y5HD/FZNPxFMoQ/osAxQn3jZazN
   yxd9dKc2t9m2bONXlPgLjuGLSuZtTC6qRMZQcisKDNoX0Wsb/rVy47oGt
   gwoWKBmmsRFaGaWuzBtDG78pXDoJvngORUCZhfoH5JuHgBqxg1r2nnI63
   MD69kxM1ZTIBYmXPPrFLLoWC1H0n9qLvbXx5C2ZBG9L6Crc/ugwDiBzng
   pU57GNOWs6KYSLAfSZYObZe0noxUGGrMEPe7POHFVu7sWKGUVrnB33o0a
   g==;
X-CSE-ConnectionGUID: 7ELZqVbpQeK3lNbntpEOHA==
X-CSE-MsgGUID: lqftH7ZESDG3lw/2tt7gcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="55269653"
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="55269653"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 23:32:27 -0700
X-CSE-ConnectionGUID: 6Vx5YCfqQeGmRCW3RyCZtA==
X-CSE-MsgGUID: G9Lc9+qPSyyIsq+Y2ozG9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,220,1744095600"; 
   d="scan'208";a="146799536"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Jun 2025 23:32:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uO9Zv-0006EH-25;
	Sun, 08 Jun 2025 06:32:23 +0000
Date: Sun, 8 Jun 2025 14:31:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 07/10] ARM: dts: imx6ul: support Engicam MicroGEA RMM
 board
Message-ID: <202506081446.CEsheazU-lkp@intel.com>
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
In-Reply-To: <20250607093342.2248695-8-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-8-dario.binacchi@amarulasolutions.com>
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
patch link:    https://lore.kernel.org/r/20250607093342.2248695-8-dario.binacchi%40amarulasolutions.com
patch subject: [PATCH 07/10] ARM: dts: imx6ul: support Engicam MicroGEA RMM board
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: arm-randconfig-052-20250608 (https://download.01.org/0day-ci/archive/20250608/202506081446.CEsheazU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250608/202506081446.CEsheazU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506081446.CEsheazU-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: cpu@0 (arm,cortex-a7): Unevaluated properties are not allowed ('fsl,soc-operating-points', 'soc-supply' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea-rmm.dtb: nand-controller@1806000 (fsl,imx6q-gpmi-nand): Unevaluated properties are not allowed ('nand-ecc-mode', 'nand-ecc-step-size', 'nand-ecc-strength', 'nand-on-flash-bbt' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/gpmi-nand.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
