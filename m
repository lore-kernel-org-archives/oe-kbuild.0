Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC14275AED
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Jul 2025 13:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752326748; cv=none; b=CdIci9OX9TUnQRN+Yq3dyQh88M9fLVVe+2CM2g4TNv96c8XJ4duj6/StIgXw6ZeJghAwK5OqNUmaY5nST97LwmrGCfflV5cEaOlZ9m3jDO6pU+2epVnmioRb/24tiwI2MUS5d30tf7DuVs6xRPg2CgfQSIv8OShZL1RhxzKvrjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752326748; c=relaxed/simple;
	bh=2h9P/nA3bt4bBz347zLdA+Bqnf6uCIbEE/O84YTFNoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TSc5/njTm34LymzeBzkI3PZcZSMqrn8PxqZUJPDBnPqX6O+5f3gS1OK4heGjmsZnh+k+a1jEy+RchDgrFcE+yJJdIZIq3JJaPJuvWsGK0pXnUJiI+7Z9wRGqJwuznw8poeIhWTJ3YKB/A2o7N1L0C8iWynyk3DZmx5peCSjcAD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oEGOSWbJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oEGOSWbJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752326746; x=1783862746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2h9P/nA3bt4bBz347zLdA+Bqnf6uCIbEE/O84YTFNoA=;
  b=oEGOSWbJ62rJqZIPVMJv3BTkkxTMX5CrEnfLMpOTpvh0YKnbx6PadYet
   /Baiu+Ooa41K8LbHvN9MfEVBVJLwLv1qyONUDGdXS1cL2g8GNCQPJB3tk
   qDVbssr+4Ecm4XJJrOafI1nJlW5AqfguADxd5lgWfY2QqW23vhA98gX5o
   3izgjm6oEMVj1gIZ2SR5vYcm+gQKmdh9QBZc4y1oFXQPfGNF1wGvzg54y
   Ii1XPIqeq9UKgGOvcXD7XEjOiJFzoXj5NFnkOIn5lTqxrz7XWQ9l2mZ9A
   5Tz28fXAssLQz2y4zERtXgc9sqvdo1nfWk7eRMgZi+6K+guIcw81wTyUc
   Q==;
X-CSE-ConnectionGUID: lZSp/wcqQBmTs8SkYF62fQ==
X-CSE-MsgGUID: bj2/x9LWQfiNfPXLFApXmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53813959"
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="53813959"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2025 06:25:43 -0700
X-CSE-ConnectionGUID: ZAo5HcK6Rfiu2XdnJK51zA==
X-CSE-MsgGUID: cEbMGb1bR7yyohRYtYzEOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,306,1744095600"; 
   d="scan'208";a="156658051"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Jul 2025 06:25:42 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uaaEW-0007MJ-1I;
	Sat, 12 Jul 2025 13:25:40 +0000
Date: Sat, 12 Jul 2025 21:25:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [shawnguo:imx/dt64 9/84]
 arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: /
 (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one
 must be fixed:
Message-ID: <202507122120.VldVtVWC-lkp@intel.com>
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
CC: linux-arm-kernel@lists.infradead.org
TO: Maud Spierings <maudspierings@gocontroll.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/dt64
head:   440bd77d25a61985358404bc578598817ff475c3
commit: 6121e3a4d24738d36e1fee897d5e47e0bce9cebf [9/84] arm64: dts: freescale: Add the BOE av101hdt-a10 variant of the Moduline Display
:::::: branch date: 29 hours ago
:::::: commit date: 3 weeks ago
config: arm64-randconfig-054-20250712 (https://download.01.org/0day-ci/archive/20250712/202507122120.VldVtVWC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250712/202507122120.VldVtVWC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507122120.VldVtVWC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: / (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one must be fixed:
   	['gocontroll,moduline-display', 'fsl,imx8mp'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: / (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one must be fixed:
   		['gocontroll,moduline-display', 'fsl,imx8mp'] is too short
   		'gocontroll,moduline-display' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gocontroll,moduline-display' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: / (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one must be fixed:
   		['gocontroll,moduline-display', 'fsl,imx8mp'] is too short
   		'gocontroll,moduline-display' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'gocontroll,moduline-display' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   	['gocontroll,moduline-display', 'fsl,imx8mp'] is too long
   	'gocontroll,moduline-display' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gocontroll,moduline-display' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gocontroll,moduline-display' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gocontroll,moduline-display' is not one of ['eukrea,mbimxsd25-baseboard']
--
   	'fsl,ls2081a' was expected
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-display', 'fsl,imx8mp']
--
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: / (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one must be fixed:
   	['gocontroll,moduline-display', 'fsl,imx8mp'] is too short
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: / (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one must be fixed:
   		['gocontroll,moduline-display', 'fsl,imx8mp'] is too short
   		'gocontroll,moduline-display' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'gocontroll,moduline-display' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
>> 	arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: / (gocontroll,moduline-display): compatible: 'oneOf' conditional failed, one must be fixed:
   		['gocontroll,moduline-display', 'fsl,imx8mp'] is too short
   		'gocontroll,moduline-display' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'gocontroll,moduline-display' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   	['gocontroll,moduline-display', 'fsl,imx8mp'] is too long
   	'gocontroll,moduline-display' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'gocontroll,moduline-display' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'gocontroll,moduline-display' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'gocontroll,moduline-display' is not one of ['eukrea,mbimxsd25-baseboard']
--
   	'fsl,ls2081a' was expected
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
>> arch/arm64/boot/dts/freescale/imx8mp-tx8p-ml81-moduline-display-106-av101hdt-a10.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-display', 'fsl,imx8mp']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
