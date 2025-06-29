Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2161DF979
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Jun 2025 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751190973; cv=none; b=UKHpBpa8QafvagnYSNX/WmGzwxwZv/Nuhds9rSPN1IKKvwemzJgsBoghO3MCmePk2b3MPJC635/JmFb5/1qRMerbeosuQjbmbuXnNx1W1ow3U1Gn6y5zxcFvhaoF2JfVGyQO3va8IZRo3cqvRo2SA/drb4XxtoqgWI0mo53ulss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751190973; c=relaxed/simple;
	bh=5xE8g5S3eOJcO9t7cRVrg/NO2rFNbxJkBsEo6PllGbw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u/BLw/ca40F9WrZUf/YSL43AsQ6zOlTFLZLMPAhMM+U0WkDphPiWv7tAcPdFO2N3cuuIH5w0SoHEHugDS7NVx1QEZVlGRkJkIik48Kpi9ZL7Srv+e5vCIo63WrLfKR7mCaGljh5xFKX2Gy3cBKdJNBhNS6BD2S+mYW0aBjVBqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CJk5ot2g; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CJk5ot2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751190971; x=1782726971;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5xE8g5S3eOJcO9t7cRVrg/NO2rFNbxJkBsEo6PllGbw=;
  b=CJk5ot2g674Fcojf4YRCPYZDAEm9yOEqqjEMgnCZ4JbO4ja2wBj4oiX8
   yGg+mdoLHWLe19kTz/Q5JrA8HTqm8eLFGATcJJvC5h3aO8TUKqoA84wGJ
   D3sg9vKMWGe/WBvA5XgT0dCbouU74TkDQOBMdP5b7qjK7GSBIFJ4ZH7Lc
   /hTKmAuKu/RqxwoPKYwYfR3lLBEyWC644zRYnc+rX874HVllWQJ9MWmiq
   t35CMsS622uwuBMba+mizUdcN9w2jDzJpCJGW/cnThg2A9rpZjHbwHH/4
   ScamwJgFsqGRU4KFylrMl09z/wSe0CJMoiwj7noKpyJFNsXj97K4S2FNY
   w==;
X-CSE-ConnectionGUID: qT3wHQSPTM6bbyMISZtDEw==
X-CSE-MsgGUID: Wdry8OfjTR6FVz1kHSiHCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53527316"
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="53527316"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2025 02:56:09 -0700
X-CSE-ConnectionGUID: YKfqJGz/SwC3zHolxszbKQ==
X-CSE-MsgGUID: lRrAtagZQOWyYTo7cK/fYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,275,1744095600"; 
   d="scan'208";a="176876220"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Jun 2025 02:56:08 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVola-000XoY-2C;
	Sun, 29 Jun 2025 09:56:06 +0000
Date: Sun, 29 Jun 2025 17:55:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: /
 (fsl,imx93-11x11-frdm): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202506291721.TpDHUIwJ-lkp@intel.com>
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
TO: Fabian Pflug <f.pflug@pengutronix.de>
CC: Tomeu Vizoso <tomeu@tomeuvizoso.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   e9ec6ae1b117158f2361317ce2bac44bc9731d77
commit: ab8d0290a971b84a8c79e92b987cdb5ceb04d003 arm64: dts: freescale: add support for NXP i.MX93 FRDM
date:   6 days ago
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-051-20250627 (https://download.01.org/0day-ci/archive/20250629/202506291721.TpDHUIwJ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250629/202506291721.TpDHUIwJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506291721.TpDHUIwJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts:298.10-309.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: / (fsl,imx93-11x11-frdm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx93-11x11-frdm', 'fsl,imx93'] is too short
>> 	arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: / (fsl,imx93-11x11-frdm): compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,imx93-11x11-frdm', 'fsl,imx93'] is too short
   		'fsl,imx93-11x11-frdm' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'fsl,imx93-11x11-frdm' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
>> 	arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: / (fsl,imx93-11x11-frdm): compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,imx93-11x11-frdm', 'fsl,imx93'] is too short
   		'fsl,imx93-11x11-frdm' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'fsl,imx93-11x11-frdm' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   	['fsl,imx93-11x11-frdm', 'fsl,imx93'] is too long
   	'fsl,imx93-11x11-frdm' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'fsl,imx93-11x11-frdm' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'fsl,imx93-11x11-frdm' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'fsl,imx93-11x11-frdm' is not one of ['eukrea,mbimxsd25-baseboard']
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
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: /: failed to match any schema with compatible: ['fsl,imx93-11x11-frdm', 'fsl,imx93']
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
