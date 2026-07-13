Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DE9233927
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Jul 2026 17:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783965486; cv=none; b=GRBUNzrD07Esw4V/YKHf4UUb6W5S6EgZkj8/K5Tr1ITnR+DVAkC9zrjGo22Hy1FuoYTq5gLCRIN38ZBW0QmtUx4V/0MxHCDn0dqg6INnB4NZwh6+3jvVA/AvVJWiiY0OPwz4fiam4q6RYzl61Beqt6qvzM69+9Udt77aQ4q4m8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783965486; c=relaxed/simple;
	bh=DEXaafX0J/sYYhyTb70NvX+GkRiw08Xe5p1h+b2LP8A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GNv+pqpk2msC8o3XxR28XCwRMAvJDxpacIApLteO2bbo4vVpubMb+qrT5TT0q/uW5C0Kln2dKqjeKQMU6NPUQge2YD+34ZG7qvgryasUr5NsN0VnDxN4tR+vSdjkgx+gOCOh+lVeWZiRCS4UnhuMaNSDtu3Z3vn4TNhaWIUnST8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDRpFJk3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDRpFJk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783965484; x=1815501484;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DEXaafX0J/sYYhyTb70NvX+GkRiw08Xe5p1h+b2LP8A=;
  b=FDRpFJk37NijXptvZ4Npx96PXwuhJCIEKhqywvpqmUw8ccx/m6F6LNvY
   UBtL/ETtH10CIJV7c4J2PIan33IsCt9J7lmKrOBslIPlOEz8uQJ+NIBjh
   O4lvfGSihNCYWuT1tNKdJKdDaXUDd6V7FRqYJzFRqA3i8xMpT2oHBQSo6
   gQZunzwYdD3CM8YjuCPhvsyvPi+ToH551LEB3HRTkbozu/pE1bUaRB712
   V1Q3R6f+zSkS2UiuhGF+Khu1h9MiZXDWBQ9Z+GQtcwiPYu+HSZFyoaVTf
   X/ejWmXyoHhl1ecXLY7Jf6CkVG6AackMCGv6VwY3/GxcjggcfQFWnWD7v
   A==;
X-CSE-ConnectionGUID: tO91QAn7QbqiLe4fEu2xfw==
X-CSE-MsgGUID: FLvnDJs4QhaT07Tc7AJ6YQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84699204"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84699204"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 10:58:03 -0700
X-CSE-ConnectionGUID: hDHVuT8uSPqiE/+r2ETr2Q==
X-CSE-MsgGUID: p+LuD8ZiQ3SxrVljjWAKkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254488594"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 13 Jul 2026 10:58:02 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjKul-00000000LwT-3WSR;
	Mon, 13 Jul 2026 17:57:59 +0000
Date: Tue, 14 Jul 2026 01:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/mips-vdso-install 3/3] make[3]: *** No
 rule to make target 'arch/mips/vdso/vdso.so.dbg'.
Message-ID: <202607140112.gjGMUNR8-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/mips-vdso-install
head:   f4c09015498520c390ab0c7ff644b545c2f7da59
commit: f4c09015498520c390ab0c7ff644b545c2f7da59 [3/3] MIPS: VDSO: Add supp=
ort for vDSO installation
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260714=
/202607140112.gjGMUNR8-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260714/202607140112.gjGMUNR8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607140112.gjGMUNR8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[3]: *** No rule to make target 'arch/mips/vdso/vdso.so.dbg'.
   make[2]: *** [Makefile:1551: arch/mips/vdso/vdso.so.dbg] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
