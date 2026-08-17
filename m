Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD363DAACA
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 14:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786976738; cv=none; b=V8wp3X+XOwpd5AKMlU5PQ9XddtrDkJ5ktny1q2L7mrC5hjeIARNZ0O68iMPSNDXMkq2x/WruexzuezpCSiw5Gzvgnc7XZOttEIcUQdzzvHzR7IQcVG4CKLK0JIONyLh5xROENQrue99M/Xr3fbwepTY18u7g2GoVC+cPBBOOKK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786976738; c=relaxed/simple;
	bh=S1cwWL0CIj8GPuGMMZgYZZ3rZRULVlUFgLTR43ba5uc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WRcHE2y+2RDwJ3LjHfPU+LrojJOgFDK/4wB2130H3RN4RrnNKWvYLvwN0QqEEJuZBi/OLmkDyLDiXZYziusb21weqjh0rUpibyXc/yzI5DQ26tJc4k14PaMurzMsSuW3fexV5oLbPukGRtpUk4k9dX3kBaCN6Wj0glnC9x8D+w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Le29Dene; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Le29Dene"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786976736; x=1818512736;
  h=date:from:to:cc:subject:message-id;
  bh=S1cwWL0CIj8GPuGMMZgYZZ3rZRULVlUFgLTR43ba5uc=;
  b=Le29DeneLao5Gx1cWE35UB/cWdo83QbhpFtskPGnlIXXYi8QiKoyB0jP
   ejJYHKj1M4wylkd+/PAE2iS1Smg2FyJ28KBh8iui62Z0XZUd93QUSwoS5
   L5nZgEO1QpWQmVLCjZeYkRujTuqnKHHUQlcQKJ7c+WeQqUjzeO1zpJn8u
   51sJmDogFojLHS3YajVHPJkOF4WE3VbISPZNQJL+pz5AdMod2oxOjiKKl
   T3TjlkZ+9wYiHC5axdVoLFoGRqfmkLITLH31X6wmP2mKODv/fuocH77nV
   AM6SCbf360gkGGjhWXdoaH5Yo4KM5fxk08jQCzd3B4u/azNivqU6mdksc
   A==;
X-CSE-ConnectionGUID: R//9xm4uTDqMLtXA5n0YmA==
X-CSE-MsgGUID: LjBAFEQATcuCE59V43K8Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="86410190"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="86410190"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 07:25:35 -0700
X-CSE-ConnectionGUID: rOLJNb0NRbmXWzxql8NqSQ==
X-CSE-MsgGUID: xWoIFr6XQUG+7F3r1nbPew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="270130637"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 Aug 2026 07:25:35 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvyHM-000000006rJ-2dLy;
	Mon, 17 Aug 2026 14:25:32 +0000
Date: Mon, 17 Aug 2026 16:24:33 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: 
 arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dtb:
 ethernet-phy@0: adi,led-polarity: b'\x00\x00\x00\x01' is not of type
 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608171651.UrPlMXVS-lkp@intel.com>
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
TO: Josua Mayer <josua@solid-run.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8d3ae59288f1e7d58d76558a6ee96d533bc5019f
commit: 79f63593c7b07109f79c1d3fc54bb4fc3eeaf29e arm64: dts: freescale: add support for solidrun solidsense-n8 board
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260817/202608171651.UrPlMXVS-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608171651.UrPlMXVS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 79f63593c7b0 ("arm64: dts: freescale: add support for solidrun solidsense-n8 board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608171651.UrPlMXVS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml
   arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dtb: /: failed to match any schema with compatible: ['solidrun,solidsense-n8-compact', 'fsl,imx8mn']
>> arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dtb: ethernet-phy@0: adi,led-polarity: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx8mn-solidsense-n8-compact.dtb: ethernet-phy@0: adi,link-st-polarity: b'\x00\x00\x00\x01' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
