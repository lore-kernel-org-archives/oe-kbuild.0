Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589E834040C
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 02:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783564987; cv=none; b=E3I1AJ03o/WqjRrdfgmnABDc8186FibS4aqhIksRxGQBhx9Ouiqb6rJiHbtGGEjGub+05rkoLVmZguk94MrYKfsF9bqjQ7S1MgSb4xXzCF/YsKE/GuzEHbCHLWQojlSFm1ljvqFGeWnFUO9XMjumRd/Xoy8zmey5TitRdcI2FEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783564987; c=relaxed/simple;
	bh=mPH4OqEvCIK+PpvVZbWX/EodO3wZJvozQYzXfFgQmR0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GdIG64CH1pUcCKoZsMAMb1ASkmGiGdtaLAJvnQJWRZeN7yuB4N6D1s254vMVxsasihnynfeoUIFmJbJc1r572gTugnAiyjY7w5zMsV4QTToleZWyj7MVIwrX/Yv/56nFpFNobcScafQIUqdmnCp1lDSQcXOU82nwTsDgEzuffYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kHFQ/yD1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kHFQ/yD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783564984; x=1815100984;
  h=date:from:to:cc:subject:message-id;
  bh=mPH4OqEvCIK+PpvVZbWX/EodO3wZJvozQYzXfFgQmR0=;
  b=kHFQ/yD1rCf9Jtr8T7zSlkohyL9OSoeOUifZS1oTuKGVqK8Dj4makj2M
   1HBZPNosvF/ui3C2t4o54r+vszvpyey4VUguFnS80CxasDaa+E5dyaZsY
   aXZmmRTAe1Gxe/lmn8/SiZxUoe8Uf0w0zpHAouvjQrNJfZ5KjZi4R8fQ6
   yKNlqrKn5n4iPDWdYL3mKIKW+Rz+7V20rVPbhj0Hv+M+IbWu248vXj4XW
   b/58x6yFjFqp8tn+CIUr7XHKelEjaajSVsOf8O8t8W4oCk/Dx5Uaop8EO
   l+GQ9fE0Y1STs6t9vUlQkchwh/g6+vmYD5oWfPJj52FSYIDOCo93NgfZt
   A==;
X-CSE-ConnectionGUID: tuO8z1B1TQuE84W9Pl2RHQ==
X-CSE-MsgGUID: Yg1SavQJRtOT2+jb662A7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="101665110"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="101665110"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 19:43:04 -0700
X-CSE-ConnectionGUID: y4RADDwRTG2ywW+FS/xBCA==
X-CSE-MsgGUID: Bv+iiEcYQaOHBv76viLq1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="258318837"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 08 Jul 2026 19:43:04 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whej6-000000002sf-3mpd;
	Thu, 09 Jul 2026 02:43:00 +0000
Date: Thu, 09 Jul 2026 04:42:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linuxtv-media-pending:next 15/16] htmldocs: Warning:
 MAINTAINERS references a file that doesn't exist:
 Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
Message-ID: <202607090421.gqivJwOm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Jai Luthra <jai.luthra@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: linux-doc@vger.kernel.org

tree:   https://git.linuxtv.org/media-ci/media-pending.git next
head:   bf40cc53b1e00c312046f6dd88e9054bc91865af
commit: 447ea0c26e57c1b423426e6c46d7ff89fd66eb6b [15/16] dt-bindings: media: i2c: Add Sony IMX678
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260709/202607090421.gqivJwOm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607090421.gqivJwOm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/media/i2c/sony,imx678.yaml
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
