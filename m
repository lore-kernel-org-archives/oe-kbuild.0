Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776FC2882C5
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 04:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773893590; cv=none; b=E+b+DGxSxYQckpT7iaCz86DKAkmi1wfJTsGxSAm45gsAk5KGy/Kq5Vyd2KpCu7tLZjnWzGlPQ2J0TgHE/fQONVYLzC3uMTN7Y0vWd01sT4t40qEvL5Aiv2ADJlDqOgjCh+E/F1gd+SDKKgy9rS3w3pMLJZn4nz8Evvk2TB7Zjyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773893590; c=relaxed/simple;
	bh=tcv/Cl3xyXW/0qMKI4QkLLJtxb/fzV2ZLPfq1Cf0Cb4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dOHWv2glk7V+e9lQC+JXy3cW/N8JoYEr68nPdx7O3z5XnrBOYJYJXn2werBDWDhur+24wG5TxWcgdBJhAuwH6Rb4SH5ZPouvMAEAfERgGpJwN65d3KeJkm9BqlAcHOTt7Pf3rONzQZkhSqW5tcU89B7p2Jud0IBD/+8On9vEpzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jIzh+BTF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jIzh+BTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773893589; x=1805429589;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=tcv/Cl3xyXW/0qMKI4QkLLJtxb/fzV2ZLPfq1Cf0Cb4=;
  b=jIzh+BTFLKiUeDARmqqo8VO7MCvrRfBn34kHflIuxoGCWS11LOIKQx70
   9Ty7lIFP0Tkat6d2gt5hd0r2hXI/n539RKzQWw9DJ4/1HUTCJEMvZYETU
   xypicXUPGqgyHagW1LBtgcIGdE2cFePETpF+Wbqu2hncYfoULMhZatrPe
   zXsu3WmXwejHK6sK/V3FeqVedQaEAyTEPUHt5aMtfM/6prjXYh+Thn8ww
   5arCq2mAxjseqFrV0eze0MqnC7u5U3N9+X94n0bu7VuCih/9LsdCQpCeH
   jNJkIkm/hM86pRjtfVkUTRl1VZCds9fup8dICBG+CgUrBoupvUa5+VVM9
   A==;
X-CSE-ConnectionGUID: c8J119HdSnuguZwIBgRtBg==
X-CSE-MsgGUID: i8+s08l6TnuLQlyVaAD0AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="73975917"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="73975917"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 21:13:08 -0700
X-CSE-ConnectionGUID: LxkTkkHXRzOvFR78zWQnkg==
X-CSE-MsgGUID: Yzy985RyTdGUyvYg6dPGAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227539889"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2026 21:13:07 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w34kq-000000000IX-41Tq;
	Thu, 19 Mar 2026 04:13:04 +0000
Date: Thu, 19 Mar 2026 12:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/loongarch/vdso/vdso.so.dbg: dynamic relocations are not
 supported
Message-ID: <202603191235.JcR1fC8t-lkp@intel.com>
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
:::::: Manual check reason: "dynamic relocations are not supported"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Nam Cao <namcao@linutronix.de>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8a30aeb0d1b4e4aaf7f7bae72f20f2ae75385ccb
commit: d2862bb9d9ca58f41319a55db0ca275774ae0c6a LoongArch: vDSO: Switch to=
 generic storage implementation
date:   1 year, 1 month ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 1 month ago
config: loongarch-randconfig-r111-20260319 (https://download.01.org/0day-ci=
/archive/20260319/202603191235.JcR1fC8t-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260319/202603191235.JcR1fC8t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603191235.JcR1fC8t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/loongarch/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/loongarch/vdso/Makefile:77: arch/loongarch/vdso/vdso.=
so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of=
 errors.
   make[2]: *** [arch/loongarch/Makefile:167: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
