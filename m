Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82211883F
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 00:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787011967; cv=none; b=JgzLEck8+R38u0uE9mxz0mjEj4XZIQIhEWyMPpc7PwY2vrtLieWJMeUGwry+5a51V3+sNKJtp1Hq8/eGskI+gwYqm2JkYrbOivlLu/+23+meQDJiM8m8wqS2Ghf5XLAh4yfg5DNpSbLdgFT7wVf0GMAC0oo/yBCWk4k3O7p6N9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787011967; c=relaxed/simple;
	bh=7LR3H4mTA+YeCj8MmjUVBERFOD8jLD6P8eAgAZDm5TY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lv5LUNSEdNe0dy0ggaT1IwjQukmXCSmJ1bjnjbhKAjeH/KpxcnCQ3T4tvOKui8B+KKYI1j3ctCeTiTq0Ywm94/4DH4e/7bBIX5+pU5og9jY4R4EythRLTDV1o0z6/Ziw+/tIhQhkpt8EJcWHwpOM7NzNbD9lRCCknHHN4cixYZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gaj9ue0w; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gaj9ue0w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787011965; x=1818547965;
  h=date:from:to:cc:subject:message-id;
  bh=7LR3H4mTA+YeCj8MmjUVBERFOD8jLD6P8eAgAZDm5TY=;
  b=gaj9ue0wKqQNj1E/aJjyp4qh3Y69IwBP6IJ1gDXub4G3cpclxo3tc+rG
   plru2soK4VfIxvpKQTl3NDe16PFCfZIngbuaXru0ZoFkOXcIcNp3oO5A5
   qzu22stRg3WzDTgN2LPX5jt7eWx7vgpsgPvHOy7kQ+vs8PR5E+sa1nOH8
   SSmAtTBcM8VuwBp/Wnat4f/QEN0QdZZ7q2m3MoJRjHJVfHTn/UXKUdWMt
   +bc5FZgKZA1H4lIZ8lSpydMugdL12fGNQIV6mKi/cdwNrFT3hjoo64I6M
   Jg/g1s9HGKLXzaZpxl7P0qSI9hcX/SK8zEfWEvv4mCk7laZbX0L3qnz69
   w==;
X-CSE-ConnectionGUID: 8xLrBaIpT/yYHc94oPjrng==
X-CSE-MsgGUID: WC3WtpWqT5CFObgJCDS3WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="98160397"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="98160397"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 17:12:44 -0700
X-CSE-ConnectionGUID: 4w28cBZwQjOu4rwLM7QFQQ==
X-CSE-MsgGUID: z5AEG0dDQ+CR5pSLjAAwsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="260842345"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 17 Aug 2026 17:12:43 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww7RZ-00000000713-2LsU;
	Tue, 18 Aug 2026 00:12:41 +0000
Date: Tue, 18 Aug 2026 02:11:56 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: opp-500000000:
 opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object',
 'integer', 'array', 'boolean', 'null'
Message-ID: <202608180250.xJItoZme-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ff68e5f557f69a08fdcfa4ce8b1b809d63bd4f45
commit: e79c2c016b4389c762678bb4078fb262dccb00b5 arm64: dts: freescale: imx95-verdin: Add Dahlia carrier board
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260818/202608180250.xJItoZme-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180250.xJItoZme-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e79c2c016b43 ("arm64: dts: freescale: imx95-verdin: Add Dahlia carrier board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608180250.xJItoZme-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-dahlia', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-dahlia', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-dahlia', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-dahlia.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-dahlia', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-dahlia', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-dahlia', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-dahlia.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
