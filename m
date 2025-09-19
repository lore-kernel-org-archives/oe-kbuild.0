Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F2C34BA5A
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Sep 2025 00:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758243206; cv=none; b=EK53WA2z+gRPGsnP7Ci3Hwb2WOItymd11Gyuire1xuAKjLsw/h9bpjkF9BNVzKQdWJ8E4+HjapZJ5A1rrOVpg++nv7c2/38J8KvolW9cKpnthiVrTC4q7GCNOnXXDPMERtBzHmsrYAtpsCbS4JKEOcfm2gIeA+SC+g9a+sBJGxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758243206; c=relaxed/simple;
	bh=DlxtTvAlCrNzFdNhLtn6Xwbmp+RQMl6pqHMAZP4B2H8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dR6myJk8/kz7LtSuviReyGbS1+BXnQavCMKH6RsCtEnQ96zCe4GL7ej2Nk7vCfMVMrvrmNHIZvqXcmKxc/HSQmoCyDRd/moSLShS8O067MBMlhUpT1xLDgaFWLmEZy1Ttlq/WN5mDjIsqHVbydhl/upco6aEOEa52wvIKzQk6TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NQK2niTB; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NQK2niTB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758243204; x=1789779204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DlxtTvAlCrNzFdNhLtn6Xwbmp+RQMl6pqHMAZP4B2H8=;
  b=NQK2niTBgbBcfflm1H24tni4Iua1R0c2BeufGALofT1ScWswZ3hhZhvh
   bBizmDIdheFTDg9E6P7hJV905oNZh/5tjtvnoQIc77PhhOhcy3T3jvpVC
   CIshdfR07d61baZcIP3mgi0yBFUHwZ6qmfNJH9MK2tULEK8AZFU5ZGW6/
   qibP9sx/2PVJc3H5diOo/288KCjttDty0w2NA2UsdgQEp9ITpG61RTwiD
   6fHCukfASucuq9HBDtQvvDa7d72MPo5vU7OVGrh8UfbL1cZ5boZWfP+2y
   QcbdnxJZMOK91jbQs3X5kMQheNXrtbk7JYtL2tEUwJt9lzqjUap3C9/ev
   w==;
X-CSE-ConnectionGUID: BVUnnBCiTkyacokEdz9MlQ==
X-CSE-MsgGUID: +tusDdZfTlaVvp9DMPqF7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="71699319"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="71699319"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 17:53:24 -0700
X-CSE-ConnectionGUID: E8LwuSnaRV6JifxgtCVTJA==
X-CSE-MsgGUID: pLQ9zZ+4SEqJiT+NHyyXww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="175307927"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2025 17:53:23 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzPNI-0003rT-3C;
	Fri, 19 Sep 2025 00:53:20 +0000
Date: Fri, 19 Sep 2025 08:53:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
Message-ID: <202509190827.6DpaP4wY-lkp@intel.com>
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
In-Reply-To: <20250918014053.696710-2-rpimentel.silva@gmail.com>
References: <20250918014053.696710-2-rpimentel.silva@gmail.com>
TO: Rogerio Pimentel <rpimentel.silva@gmail.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
CC: kernel@pengutronix.de
CC: festevam@gmail.com
CC: alexander.stein@ew.tq-group.com
CC: dario.binacchi@amarulasolutions.com
CC: marex@denx.de
CC: Markus.Niebel@tq-group.com
CC: y.moog@phytec.de
CC: joao.goncalves@toradex.com
CC: frieder.schrempf@kontron.de
CC: josua@solid-run.com
CC: francesco.dolcini@toradex.com
CC: primoz.fiser@norik.com
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Rogerio Pimentel <rpimentel.silva@gmail.com>

Hi Rogerio,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on next-20250918]
[cannot apply to robh/for-next linus/master v6.17-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rogerio-Pimentel/arm64-dts-add-support-for-NXP-i-MX8MP-FRDM-board/20250918-094625
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250918014053.696710-2-rpimentel.silva%40gmail.com
patch subject: [PATCH 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: arm64-randconfig-051-20250919 (https://download.01.org/0day-ci/archive/20250919/202509190827.6DpaP4wY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509190827.6DpaP4wY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509190827.6DpaP4wY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx8mp-frdm.dtb: isp@32e10000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-frdm.dtb: isp@32e10000 (fsl,imx8mp-isp): power-domains: [[65, 6], [65, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-frdm.dtb: isp@32e20000 (fsl,imx8mp-isp): 'power-domain-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
   arch/arm64/boot/dts/freescale/imx8mp-frdm.dtb: isp@32e20000 (fsl,imx8mp-isp): power-domains: [[65, 6], [65, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/media/rockchip-isp1.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-frdm.dtb: gpio-leds (gpio-leds): 'blue', 'green', 'red' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
