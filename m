Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858652D77F7
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Aug 2026 10:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787047851; cv=none; b=D2JJS9KCBq/cEezaO0wCopSxgwR0Ccn8d8vZmFmll6SsfCd/RJOuk06atZzhKL9YneA2/gPvt3AtXvgFIeTA2XcwWs0nKLNPGNVE3+K/UW5Ax7Aq2wLrKRi6D0aTanm6kJMWkxTQwSTf4gyBTjomx7/KyCyreukPGE9OByOrLeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787047851; c=relaxed/simple;
	bh=vxK8LxpLL7VapJss67PtbfPJ0p0RR6AmwWLeef2gD+0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kI4AgB0GKWHlFwNXDAW+dKRG9ui9KmGeyNvJ7R2fimBzP8/e883aSDVrLHRIvOxy06xqR6URPxdmbsWl7hQUx8g/+Sw69iLPjszvg9lvA/3MXiniVkahhHxuXqHsTLfnH0o3VHZ4/SNmN3QvxVJk43WIQQqFwb5DZoOvvXxm5S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Te16LC/U; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Te16LC/U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787047849; x=1818583849;
  h=date:from:to:cc:subject:message-id;
  bh=vxK8LxpLL7VapJss67PtbfPJ0p0RR6AmwWLeef2gD+0=;
  b=Te16LC/UiaoaZi1kr5o9O0Iw3geo2/78m/qpogRidcTJru39oHnLD2XC
   gAvZme7Wwkc39ds/S/OK7KSU7SzfngpbJK/1uAKaKq+5eyFb61txJjx/+
   vnc9kL+5ExtT6rfGRYjtJ3piNum7PaF6dCCx2JcwEEGbFoJeH38RLFuhc
   XRR28Gw8BWwmJwF73mPiRNMl7YjAGeka5/8/vDRrWgH3RQUo0aUmYbsak
   wH6LrsR/Cn0kA+OpthSYWmXnwHVvWg7yn/mvIhBiI7wQF0m741Z/yj8ZJ
   dTRnF7qqGWiti4t4KETIOnx7muAHEYQpj0x6IzSRl4FdBhJaDoJt7/IZ+
   w==;
X-CSE-ConnectionGUID: a3MhnikoQ9OVqOFXAahVBQ==
X-CSE-MsgGUID: 4sZvHWQQRQCfl6H1c/2X7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87411393"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87411393"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 03:10:49 -0700
X-CSE-ConnectionGUID: D3XrEHx5RUK40js9ytf3tg==
X-CSE-MsgGUID: 4romNkshSxKTfsSZXmLuJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="269020953"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 03:10:48 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwGmL-0000000074j-3ONi;
	Tue, 18 Aug 2026 10:10:45 +0000
Date: Tue, 18 Aug 2026 12:10:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: opp-500000000:
 opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object',
 'integer', 'array', 'boolean', 'null'
Message-ID: <202608181211.WeKpufjq-lkp@intel.com>
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
head:   0f23d56f17fdfc7db69d51f64c8b91bbab947aa9
commit: e77f8e6bba733392896b978548cc771c143280d8 arm64: dts: freescale: imx95-verdin: Add Yavia carrier board
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260818/202608181211.WeKpufjq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608181211.WeKpufjq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e77f8e6bba73 ("arm64: dts: freescale: imx95-verdin: Add Yavia carrier board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608181211.WeKpufjq-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-yavia', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-yavia', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-nonwifi-yavia', 'toradex,verdin-imx95-nonwifi', 'toradex,verdin-imx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-yavia.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
--
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'toradex,verdin-imx95' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-yavia', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-yavia', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
   arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: /: failed to match any schema with compatible: ['toradex,verdin-imx95-wifi-yavia', 'toradex,verdin-imx95-wifi', 'toradex,verdin-imx95', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-verdin-wifi-yavia.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
