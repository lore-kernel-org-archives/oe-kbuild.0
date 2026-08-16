Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40CFFEEA8
	for <oe-kbuild@lists.linux.dev>; Sun, 16 Aug 2026 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786905805; cv=none; b=O2snuf7zNwypoTj/4qHdKrgdZJRgiG5zW9pfQu9dH2FseqvxnVn8sXe6mnycdYW78jymI8eELbK3spDqNK6lzh1OZ2GqsxyPWTXnFJioHi9JFTMHbEoUUxr8opr521lUSEfJcitg8JnqgWtUjBmiiQ6/1kqn1I8xcQaNslNcpvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786905805; c=relaxed/simple;
	bh=A0pqRr8tbz8+DTSb5YNoh3l8KcNqyMIGfbEiFpYrAPw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XY2L1jpyC5S/FutuOO1JxhFQPjVr8Um7Gg1XfMAh7c5BEDpWy6jk7JpOvNYll7pefdMW2UKzrl7VUgALBficb79NjV8N5MxeMnvtGkd4KMJUFAfpq7HCesopkZsxv+gyUZ54DPvYv/oUS16Go8rFRF2MEolA9oW6uJFGV8hAUEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lc5wuvNl; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lc5wuvNl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786905803; x=1818441803;
  h=date:from:to:cc:subject:message-id;
  bh=A0pqRr8tbz8+DTSb5YNoh3l8KcNqyMIGfbEiFpYrAPw=;
  b=lc5wuvNlIujmaPHBcvKKxOGosg8L9ZPqy2RXgPrQ5X2c75uHwtkHHmxL
   U1SxHc7j0fGXFZ1Ymrq0vYQ87hizNv8JGeUxHLt8YNYtgPbTJRAUp92Ye
   Xw/JzLJIJ7HSkKF2MNKSy/1Aaj9MeXkTqkEj6644LyuweIaDnbK7V6sBp
   QYyRNzo/J1CQm2P8C9WF09ao0IgYxDyGkgELeaXpLhAaGfyDiMhMSarW/
   81LQ5g1qluR23K3bqtaciDLotoUTk6mGxIzeZ08wrhndMcUk34KCG6TVa
   6+KqHqU9beOR5hZ8mLIEU/hgtDlyC5w3cnvswKvZR5CkuO1UuOvhUzlRS
   w==;
X-CSE-ConnectionGUID: 0u1VQ5T2QKSQON7hmAgUOg==
X-CSE-MsgGUID: Lq1Lm4KfSFiKdbXDBI+x/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="104772994"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="104772994"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 11:43:23 -0700
X-CSE-ConnectionGUID: 9Z6X9eSjRaamdXhwTeyxRg==
X-CSE-MsgGUID: 9W0rQHcTQBWfT3YgB6uNXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="262955150"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 16 Aug 2026 11:43:22 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvfpH-000000006cf-2UE9;
	Sun, 16 Aug 2026 18:43:19 +0000
Date: Sun, 16 Aug 2026 20:43:18 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb:
 opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type
 'object', 'integer', 'array', 'boolean', 'null'
Message-ID: <202608162051.oDbCqvqh-lkp@intel.com>
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
TO: Lei Xu <lei.xu@nxp.com>
CC: Shawn Guo <shawnguo@kernel.org>
CC: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dcb68831eac76dbfda1cf5930d3003d938890d34
commit: 9bdfeed989b126a3c9c5a6f74ad2d96784b69d27 arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-2054-20260813 (https://download.01.org/0day-ci/archive/20260816/202608162051.oDbCqvqh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608162051.oDbCqvqh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9bdfeed989b1 ("arm64: dts: freescale: imx95: Add support for i.MX95 15x15 FRDM board")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608162051.oDbCqvqh-lkp@intel.com/

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
   arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: /: failed to match any schema with compatible: ['fsl,imx95-15x15-frdm', 'fsl,imx95']
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: opp-800000000: opp-hz-real: b'\x00\x00\x00\x00/\xaf\x08\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dtb: opp-1000000000: opp-hz-real: b'\x00\x00\x00\x00;\x9a\xca\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
