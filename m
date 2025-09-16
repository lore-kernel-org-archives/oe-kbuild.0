Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E001240604
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Sep 2025 04:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757998394; cv=none; b=b1ICbGYIgpm8zWAS/1z89OuV6030NmjlyAzwris8v54REKa5TU4+oSGsRC2gmeT3zEaB1u95M7F9SOFi9zm57lOpisv/89s0bhsowoXN8sXkcsawp0DoqW02zd30c/qUAgOCWgc1omQPrDPeeX+INpdJthnr5UR8SKlgop2dzpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757998394; c=relaxed/simple;
	bh=v5s3tYFu+H3HEyJANsp8lCznakKaE4qanIeURd+Byd8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iCLnQ7pDOxpCdqa5YhNYuHEOYKvyc5GitaCsEAPLFQEGDo2b20QxZ8ceco4ynkrwU4e983wSvuQvdVX4Wug/aiNYWSs6BXwp8oc4aNRdrw9ZI35bEaX1qNPNLPVEgMeV984LVk1o2solguUVUqC1Ie1eGZmb0OLoWGmwNRoV74k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nglknkcS; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nglknkcS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757998392; x=1789534392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v5s3tYFu+H3HEyJANsp8lCznakKaE4qanIeURd+Byd8=;
  b=nglknkcSU0kCJtn65LbSvlb/nacjZN3dK+rktGMm1G+Q1PqCutc9AltP
   V+YAoGnOh+GXZZ8XV3ZfE8n2fJeJyPzqm0XyddUahLPfsEVR+DRUwIqUz
   TQ7mqnDvaZl51iHj9oUrJJsMSHOHNZDzrkL8hFWenVlM++eQSbcYwbvSV
   +kZOx6NIrOPZ7qoZN+D8Rva8dFXA4Dk2Tk6esUFR/KR5/PYtbSYo7i30S
   ENI4q9gGaFqyc+6v6xHkhEcQ35zwZtmXgRRY53SRMekVuZIoOWAesE3FO
   uI0tR+O82qRGVlwmSqOYQ8tP6S++DVx3zPuK8gqZ1wXHlb7hZaSmWd0Eb
   Q==;
X-CSE-ConnectionGUID: 4phSchuyQtaHMa8iyvoKmA==
X-CSE-MsgGUID: U81o4hfaTyidIfgMRDtaqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="59489528"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="59489528"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2025 21:53:11 -0700
X-CSE-ConnectionGUID: 2rLvyWDUS02pQ4zJi4Ai/w==
X-CSE-MsgGUID: ttGWSqH7RouURAGKrxOxVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; 
   d="scan'208";a="174381747"
Received: from lkp-server01.sh.intel.com (HELO 5b01dd97f97c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Sep 2025 21:53:10 -0700
Received: from kbuild by 5b01dd97f97c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyNgh-00010F-0k;
	Tue, 16 Sep 2025 04:53:07 +0000
Date: Tue, 16 Sep 2025 12:52:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 4/4] arm64: dts: add Protonic PRT8ML board
Message-ID: <202509161238.XivYVKTW-lkp@intel.com>
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
In-Reply-To: <20250910-imx8mp-prt8ml-v1-4-fd04aed15670@pengutronix.de>
References: <20250910-imx8mp-prt8ml-v1-4-fd04aed15670@pengutronix.de>
TO: Jonas Rebmann <jre@pengutronix.de>
TO: Andrew Lunn <andrew@lunn.ch>
TO: Vladimir Oltean <olteanv@gmail.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev@vger.kernel.org
TO: Eric Dumazet <edumazet@google.com>
TO: Jakub Kicinski <kuba@kernel.org>
TO: Paolo Abeni <pabeni@redhat.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Liam Girdwood <lgirdwood@gmail.com>
TO: Mark Brown <broonie@kernel.org>
TO: Shengjiu Wang <shengjiu.wang@nxp.com>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-sound@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Jonas Rebmann <jre@pengutronix.de>
CC: Lucas Stach <l.stach@pengutronix.de>
CC: David Jander <david@protonic.nl>
CC: Oleksij Rempel <o.rempel@pengutronix.de>

Hi Jonas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on d34bbb45b57c90a5c1bcac5f327df79ddfbfe957]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonas-Rebmann/dt-bindings-net-dsa-nxp-sja1105-Add-reset-gpios-property/20250910-203727
base:   d34bbb45b57c90a5c1bcac5f327df79ddfbfe957
patch link:    https://lore.kernel.org/r/20250910-imx8mp-prt8ml-v1-4-fd04aed15670%40pengutronix.de
patch subject: [PATCH 4/4] arm64: dts: add Protonic PRT8ML board
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250916 (https://download.01.org/0day-ci/archive/20250916/202509161238.XivYVKTW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250916/202509161238.XivYVKTW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509161238.XivYVKTW-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[72, 6], [72, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-prt8ml.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[72, 6], [72, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
