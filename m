Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13513595A
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Jun 2025 06:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749969986; cv=none; b=Ti39vn/fOeqAMpliGcCksIwANO23OwA57ewG5aDOOlwhC9woyFDLU6HPmi2i8uyQnZLPTh5EMSrzljgIDk+8FwMB0H8fbQY8Hr58K9pTNuefSHzX1/isAXlKUw+PRcNdtkPHU4bxZdZ9g01ZsG2q+eu9B9ucsGhHk0BHDQTYmYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749969986; c=relaxed/simple;
	bh=lqJ8pxTMjokcw2ne6JO36IW+P4xwNDucNJ1KCnuK9wk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IIiEfIDf7WcNmSZo9HDUp/4P5sGMVbAtIVlYP5agavo4VNLCqhov+KTR9xn4fbAyPFm1+hxlpH3wYumvnIgYIS5TtUkX0cSh7kijC26dsRWUalhiFdlZlu4lrQjYbRJyLX07wHpBNcxdoSP/5aQdi82F5KaLrDKBi+Ojt/pIcZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrWURhhf; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrWURhhf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749969984; x=1781505984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lqJ8pxTMjokcw2ne6JO36IW+P4xwNDucNJ1KCnuK9wk=;
  b=lrWURhhfRN8TSJdrc+8cupllKHpMB66sFFQYp+Sj8H5zh4jM8wjhwH/M
   ocD12ILtjMdY3/IzIY00oGchZX2LzcKmzMA39ImGBu3lOgJ2t0rzkVTbE
   FaDNhvFKLbkpMUJxY2NXJ7QL15AoWW1pQ9Z87KB/nTZ4pdUCgeit3RqyE
   MqGA6biBaTWNIKa4yHiS9oprxerJ014Q8lEQ9CpYONL4boD9OEC+beXXm
   m4d4Z3QvdcjARF1Ltx7S4krsThLpACsDr94RT9GSyejHVzKq+wJt266I0
   Ff6XF8hXH7oK/JZP1k09DQSD+eH0uvYxq+5B+qWEI6OnW6zO+EtsZtOP5
   A==;
X-CSE-ConnectionGUID: 2ZRIm8xtRzKgZ2msbbwx5g==
X-CSE-MsgGUID: J8MoyWn0TICUX3xAzahBXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="52278556"
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="52278556"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 23:46:23 -0700
X-CSE-ConnectionGUID: 2NS5+BJ8TEGvuBfLiS6AaQ==
X-CSE-MsgGUID: hdwyT62BTfOpLbd9tBPLsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,238,1744095600"; 
   d="scan'208";a="148071402"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Jun 2025 23:46:23 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQh8G-000EAq-0G;
	Sun, 15 Jun 2025 06:46:20 +0000
Date: Sun, 15 Jun 2025 14:45:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/3] arm64: dts: add description for solidrun imx8mp
 hummingboard variants
Message-ID: <202506151401.T24k6jbz-lkp@intel.com>
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
In-Reply-To: <20250614-imx8mp-sr-som-v1-3-3ca3269883c4@solid-run.com>
References: <20250614-imx8mp-sr-som-v1-3-3ca3269883c4@solid-run.com>
TO: Josua Mayer <josua@solid-run.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: Yazan Shhady <yazan.shhady@solid-run.com>
CC: Mikhail Anikin <mikhail.anikin@solid-run.com>
CC: Jon Nettleton <jon@solid-run.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Josua Mayer <josua@solid-run.com>

Hi Josua,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Josua-Mayer/dt-bindings-arm-fsl-Add-bindings-for-SolidRun-i-MX8MP-SoM-and-boards/20250614-222309
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250614-imx8mp-sr-som-v1-3-3ca3269883c4%40solid-run.com
patch subject: [PATCH 3/3] arm64: dts: add description for solidrun imx8mp hummingboard variants
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: arm64-randconfig-052-20250615 (https://download.01.org/0day-ci/archive/20250615/202506151401.T24k6jbz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506151401.T24k6jbz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506151401.T24k6jbz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi:75.9-80.4: Warning (unit_address_vs_reg): /soc@0/bus@32c00000/dsi@32e60000/port@1: node has a unit name, but no reg or ranges property

vim +75 arch/arm64/boot/dts/freescale/imx8mp-hummingboard-pulse-mini-hdmi.dtsi

88094d1b0c4d92 Josua Mayer 2025-06-14  70  
88094d1b0c4d92 Josua Mayer 2025-06-14  71  &mipi_dsi {
88094d1b0c4d92 Josua Mayer 2025-06-14  72  	samsung,esc-clock-frequency = <10000000>;
88094d1b0c4d92 Josua Mayer 2025-06-14  73  	status = "okay";
88094d1b0c4d92 Josua Mayer 2025-06-14  74  
88094d1b0c4d92 Josua Mayer 2025-06-14 @75  	port@1 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
