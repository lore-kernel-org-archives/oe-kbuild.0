Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3E225C816
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Aug 2025 07:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755156805; cv=none; b=nATsEJiYDR3+1OpCMEynz30BM2E2uklQMDj/9mPo2K0I7cSvLU+FTPco3dxEXFM//TzzDez2J3AC3F7bQk5o+4vAiM95UC6RUay0z0lL0kD9Zpzi4/EriCoNzhRw0+IiWuZjwPFS8A3xyHsVpZ8LZ1EpsX0xrux8kdev/xWsLPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755156805; c=relaxed/simple;
	bh=8SKPobSF/ajpN1W3ooa7JhwSeenm/s+GJ2iXXXI8iPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MaumBMS4O19hLcnpbvPBC/miPKQyGZsRRW74Eh4W1mpHhkS3zrR3ehKA6Cf2VzrD5CoK4WiU69fkc7gH/KWc7a5F15d26gK2KcxZjxq4mpKn0u2kMlxPeLYArEEg4PhA8PN0Jzr1Q6FQr7M4bS63jYeU7duzxF61opx90mWP3AI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JeVFlcAl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JeVFlcAl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755156803; x=1786692803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8SKPobSF/ajpN1W3ooa7JhwSeenm/s+GJ2iXXXI8iPo=;
  b=JeVFlcAlpu9wYX7VECGCocYB/fAqF2PQ9qu3Qp43zha3jt7JlHtARhw7
   0MZwRQnAS4JDQHLtAWhSNAYkXCJlCeUYr039vNGUvTDYBJ6nBPOcDgRRK
   NcUH6F5j3k1xlPPrjHrnP46hq/5TEOTdSoQbleJvlQs3ThsiKz33ulY1T
   SnXJtJZ6BwjZVEL3kw2UtBej0KrsyoUe4Puqw6luts9OT67V+ItHq1uzN
   QCDWS9rC9g75yxaAZJy+9EhZvMzxyNCCKAA7PF7CgNLnIxRbOfSyQQ4W5
   vrb/gGBDOkGOt7VDK1mgCwBJ4fhmmkHhF1iJ7tgMem1sf9T3Fwf69A8AT
   g==;
X-CSE-ConnectionGUID: m5Z28knpSfq7WEPAXDmzAA==
X-CSE-MsgGUID: 4ScpjRMOQCG4k3ZuA3PHPQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="80042560"
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="80042560"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 00:33:23 -0700
X-CSE-ConnectionGUID: WH/J0540ScuoieV0ko+n7Q==
X-CSE-MsgGUID: CJ5WSBOARumNqG3MPPb+2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,287,1747724400"; 
   d="scan'208";a="170825927"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 14 Aug 2025 00:33:21 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umSSc-000Ahg-1O;
	Thu, 14 Aug 2025 07:33:18 +0000
Date: Thu, 14 Aug 2025 15:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 1/4] dt-bindings: can: m_can: Add wakeup properties
Message-ID: <202508141550.I0fwfEIW-lkp@intel.com>
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
In-Reply-To: <20250812-topic-mcan-wakeup-source-v6-12-v8-1-6972a810d63b@baylibre.com>
References: <20250812-topic-mcan-wakeup-source-v6-12-v8-1-6972a810d63b@baylibre.com>
TO: "Markus Schneider-Pargmann" <msp@baylibre.com>
TO: Chandrasekar Ramakrishnan <rcsekar@samsung.com>
TO: "Marc Kleine-Budde" <mkl@pengutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
CC: Vishal Mahaveer <vishalm@ti.com>
CC: Kevin Hilman <khilman@baylibre.com>
CC: Dhruva Gole <d-gole@ti.com>
CC: Sebin Francis <sebin.francis@ti.com>
CC: Kendall Willis <k-willis@ti.com>
CC: Akashdeep Kaur <a-kaur@ti.com>
CC: Simon Horman <horms@kernel.org>
CC: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
CC: linux-can@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: "Markus Schneider-Pargmann" <msp@baylibre.com>

Hi Markus,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f5ae30d69d7543eee0d70083daf4de8fe15d585]

url:    https://github.com/intel-lab-lkp/linux/commits/Markus-Schneider-Pargmann/dt-bindings-can-m_can-Add-wakeup-properties/20250812-172519
base:   8f5ae30d69d7543eee0d70083daf4de8fe15d585
patch link:    https://lore.kernel.org/r/20250812-topic-mcan-wakeup-source-v6-12-v8-1-6972a810d63b%40baylibre.com
patch subject: [PATCH v8 1/4] dt-bindings: can: m_can: Add wakeup properties
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-051-20250813 (https://download.01.org/0day-ci/archive/20250814/202508141550.I0fwfEIW-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250814/202508141550.I0fwfEIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508141550.I0fwfEIW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: can@4400f000 (bosch,m_can): pinctrl-names:1: 'wakeup' was expected
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#
>> arch/arm/boot/dts/st/stm32mp157c-ultra-fly-sbc.dtb: can@4400f000 (bosch,m_can): Unevaluated properties are not allowed ('pinctrl-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/can/bosch,m_can.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
