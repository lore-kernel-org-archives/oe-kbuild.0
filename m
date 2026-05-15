Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B254212550
	for <oe-kbuild@lists.linux.dev>; Fri, 15 May 2026 01:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778809567; cv=none; b=kogQ8t2oqPbMGuZjhMUGbLyFXrXhkLyCxnw718yhglH+bvsZTKygRZPzd4e413oFFsWBWgij+d9YNgMafgtabcdgXfEfOFdfPnvjaRGiaV+5jW6oEI5RrAnx7924pA1Afl7iiuyo3EhcEDjs9GrgKQIo/a3y+qx2zYua849HTlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778809567; c=relaxed/simple;
	bh=LaA6YF6QINwIffXMUTPO5uujD/okkX2O/J0N/ZQ1UZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XCP8rsvL5qZdtDklwrhxYoHFN0DVxOq6GJG/6dGMjsJ+u7fPPB5KA3iP9FdIWn0meQVsTR7J+dpwKe2m/7iIoNyZEoTDhr/396cALEwc1vQbf3peH57lnZa393u4nQtPtSYt70uVq340foFvN4STs2dciRGg/PGac1fo9ExftF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O0SPMl4Q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O0SPMl4Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778809566; x=1810345566;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=LaA6YF6QINwIffXMUTPO5uujD/okkX2O/J0N/ZQ1UZM=;
  b=O0SPMl4Qzn+EcwIeKNq1Pzc3u9KSs+xZey5yXRYVmppLVbTOz9+Nr6aq
   v1eigSoHxYAuWBEueUFlrzVl93YVa7tXO9z9Ic7tWjS5rXHk0ZCOE4BZr
   Mp1JSqZFJLa1NLfUaQu/t82RwmYpFAYv+kSYfVzKJt3GshV8MPKFpNb9M
   tvkkPp7cfc5KXaZV3+dH3hf23T86Zx3rQXqtsm2NgvuqZBBcmO8qm0quv
   I7FlS6PRw2fwCJ42cUYQT9ablED9YBOD2+Ys+UraBcbJlxUQ1aQ6FiZhv
   ZnOAspIwSP14oAt4cY43Crk54rQy5qRS/MxVmokHdUEo25S2B6rbx40Fx
   Q==;
X-CSE-ConnectionGUID: Z+qKd2OIRC2pfy479NjnYA==
X-CSE-MsgGUID: LvGevAzGTZqousDSCa5Khw==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="83377044"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="83377044"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 18:46:05 -0700
X-CSE-ConnectionGUID: PSsixmZ3T+e0XSI3D6+y8A==
X-CSE-MsgGUID: Hg5xYbiHTdmxanNuA/8tmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="235507190"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 14 May 2026 18:46:05 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNhco-000000008vF-3sMs;
	Fri, 15 May 2026 01:46:02 +0000
Date: Fri, 15 May 2026 03:45:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb:
 dma-controller@42210000 (fsl,imx95-edma5): Unevaluated properties are not
 allowed ('iommus' was unexpected)
Message-ID: <202605150311.DesdFaJx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "dtcheck: binding changes may go via different =
trees"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Jo=C3=A3o Paulo Gon=C3=A7alves" <joao.goncalves@toradex.com>
CC: 0day robot <lkp@intel.com>
CC: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
CC: Francesco Dolcini <francesco@dolcini.it>
CC: Antoine Gouby <antoine.gouby@toradex.com>
CC: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
CC: Franz Schnyder <franz.schnyder@toradex.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Franz-Schnyder/dt-bi=
ndings-arm-fsl-add-Aquila-iMX95/20260513-164612
head:   05bee2706cbcd660c976dc3f538807f83d843d8a
commit: a3953abfb37a36161117d8743f0514d1360e5664 arm64: dts: freescale: add=
 Aquila iMX95 support
date:   2 days ago
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-2055-20260514 (https://download.01.org/0day-ci/arc=
hive/20260515/202605150311.DesdFaJx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260515/202605150311.DesdFaJx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150311.DesdFaJx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx95-aquila-dev.dtb: dma-controller@42210=
000 (fsl,imx95-edma5): Unevaluated properties are not allowed ('iommus' was=
 unexpected)
   	from schema $id: http://devicetree.org/schemas/dma/fsl,edma.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
