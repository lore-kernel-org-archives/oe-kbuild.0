Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650DA3C1097
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 08:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786954712; cv=none; b=JvtCMNh6Q4b6PyuSGlZ/l4rLytYSGQF4YCk6/XSwLGieg3dAVR+MVHD+3UuNyOnl6Wq72b2z8XipHjSYdXXjx0p1VdoE4HGzvQZxzmpZ5vW9QbWcznF+bRjWuUVN5KgYHX+Ra3Zl8kda/s1xvI2XvmQG2EqxY1P8uT//RptgiLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786954712; c=relaxed/simple;
	bh=Slaar9svjZgILwD79ZIbBMG5VjsWYBcjyvPaknDmmaE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R6cnZAwHqhYk+WvW1r+i6LOKhRxsKke6OIw7tveq01s8ArmiB4QEhoecpLJHTEhBrd63DEdVbRVVu1rRnDLLWjj1rg8POLAnEEhhxHdNCyJChVDG9dNEKgnEfwz2elq6SCz3TLc3FexQKHuBjG9zjUkn/WFhMeoVAdB0PEgl81U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6Ug1qpi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6Ug1qpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786954710; x=1818490710;
  h=date:from:to:cc:subject:message-id;
  bh=Slaar9svjZgILwD79ZIbBMG5VjsWYBcjyvPaknDmmaE=;
  b=m6Ug1qpiHR/ed3bBTc1Lo+YYGp1wOQJnfsmuTW+rpTq5dWpwM8pcMQEW
   TB3HytZY2WL9ZSpe74iYcNTwBiT/waxh/Dp9Brfr7dFj2BrGxpSqFPlUf
   MJOa8rQaX7lUAcY7il8ICXgIaVWuVlHDVZifw9dboAgMRXDm7K3bdhYaO
   irLfBnvaKz+19oVKMoq+OCoHAjhoG2J8QAvY1KNA5gg6vQ+v0rN0VPqqM
   U8EHMeNlqDCSZ17+YlbxrLaz/rAoBaheJiDFKwKqyXy5JPNVXq27ilp3Q
   vrMkLINQQYvK532VvOuLgGHaCNJs1WRdsG+NzCvDu0BjK1sd22JpJ42fD
   w==;
X-CSE-ConnectionGUID: /xo+prTFQvmHjSnZz/q2cQ==
X-CSE-MsgGUID: u3tgMtkpRkisnxds832smw==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="98086897"
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="98086897"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 01:18:29 -0700
X-CSE-ConnectionGUID: 6Y0TvZXKSfS+WhBZOUzdTw==
X-CSE-MsgGUID: SdLuggrtRjyRvFsHTFYr4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,228,1779174000"; 
   d="scan'208";a="268695244"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Aug 2026 01:18:30 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvsY7-000000006ld-42dF;
	Mon, 17 Aug 2026 08:18:27 +0000
Date: Mon, 17 Aug 2026 10:18:02 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dtb: /
 (gocontroll,moduline-iv-306-d): hardware: b'Moduline IV V3.06-D\x00' is not
 of type 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608171014.Il442EiC-lkp@intel.com>
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
TO: Maud Spierings <maudspierings@gocontroll.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d3ae59288f1e7d58d76558a6ee96d533bc5019f
commit: 3ed539cb892f2d398543f78a0c94dbe1391bd245 arm64: dts: freescale: Add the GOcontroll Moduline IV
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260817/202608171014.Il442EiC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171014.Il442EiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3ed539cb892f ("arm64: dts: freescale: Add the GOcontroll Moduline IV")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608171014.Il442EiC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'toradex,verdin-imx8mm' was expected
   	'ifm,imx8mn-vhip4' was expected
   	'avnet,sm2s-imx8mp' was expected
   	'toradex,verdin-imx8mp' was expected
   	'fsl,imx8mm' is not one of ['fsl,imx8qm', 'fsl,imx8qp']
   	'fsl,imx8mm' is not one of ['fsl,imx8qxp', 'fsl,imx8dx']
   	'fsl,vf500' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-iv-306-d', 'karo,tx8m-1610', 'fsl,imx8mm']
   arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dtb: /: failed to match any schema with compatible: ['gocontroll,moduline-iv-306-d', 'karo,tx8m-1610', 'fsl,imx8mm']
>> arch/arm64/boot/dts/freescale/imx8mm-tx8m-1610-moduline-iv-306-d.dtb: / (gocontroll,moduline-iv-306-d): hardware: b'Moduline IV V3.06-D\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
