Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2330DB67E
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 00:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768351853; cv=none; b=RHBxR+9Sd0Dv7cHhLuAv3ZdFhk3ydEjVInIbud5VN6qQ2UGYoWrMmcvfZVrW0N+elbfR+81aEl7P7CdidrfxyCjfFBY8x3fDKd+GUXlN8ND9Ftl9/WLiOYGIXg0tw7U14vD/hfoYN8E+zgbmFX83WzqU/jHHoKPfxzAkfHEgm5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768351853; c=relaxed/simple;
	bh=XNDOrZnpu9iBFAwdIvyE2m3tbWYpfxrTir8t9VICkSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Qi0WmlDuVnLTsCZKhvfrpMJ1B5Ce/JI64BzYvSKoQg1vY19g8r1hg/jtTUrhYUwjTW1px7F5cJfEC5F/U3ut0Uooo+duo5sYC4/cRGUooyFHkwgpquzQOcT3JFficOKeyWUK7COFOG2md7+SU341CFh/mIIj/bqx58GQIUDwZtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YMQ8vWZY; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YMQ8vWZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768351853; x=1799887853;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=XNDOrZnpu9iBFAwdIvyE2m3tbWYpfxrTir8t9VICkSs=;
  b=YMQ8vWZYAsWyddisgor7YkF0Tdb8R4HG49fDnOQ9vtOb/HL+hBVLjO4t
   3F0omt+f5v6QiGp0jpcDZ9kkiuhK+uFubqGdjteaSFOsASyJU8mIZXIWv
   9WSl+Q4X96h4nVZZCPlMvAl14KDvKosRzwltrv+KqLQJrqJTZYl2O+lXx
   2uvu4NeyV0jP2g4FmVBPZzh2FFqMs3kQj5zR0XTh+HloEYa9b1y7ZV3aR
   I3xY/Xfx21cwP2TGlxDaCa3wlII4dB2U/DrkDGojY0K8SlVkFSFt5Wjhk
   YmZIE0BjvE8vJoAhvlksXbAUHxx9pNDBX6u0KtXPqgXOb3CF1+A5NQ7ZC
   g==;
X-CSE-ConnectionGUID: NuaaGTcSTk+gDtBcPZmj5g==
X-CSE-MsgGUID: 9DxltOEZRlKduu5z2y9yHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="73488039"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="73488039"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 16:50:52 -0800
X-CSE-ConnectionGUID: FV7X5v5lQ4+pOW+6T2viqw==
X-CSE-MsgGUID: rypOCNdrT1C9jOb/T+dBvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="204945874"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Jan 2026 16:50:50 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfp61-000000001GL-08Kc;
	Wed, 14 Jan 2026 00:50:49 +0000
Date: Wed, 14 Jan 2026 01:50:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tip:timers/vdso 10/14] arch/s390/kernel/vdso/getcpu.c:5:10:
 fatal error: linux/getcpu.h: No such file or directory
Message-ID: <202601140156.yyGoaFtg-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/=
vdso
head:   576d8a7a985dde4f51a4561dddc0d8734494d3de
commit: 083103ebab933fd7752e21060a2974e2e9546b1a [10/14] vdso: Remove struc=
t getcpu_cache
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
114/202601140156.yyGoaFtg-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260114/202601140156.yyGoaFtg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140156.yyGoaFtg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/s390/kernel/vdso/getcpu.c:5:10: fatal error: linux/getcpu.h: No suc=
h file or directory
       5 | #include <linux/getcpu.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.


vim +5 arch/s390/kernel/vdso/getcpu.c

80f06306240e0a arch/s390/kernel/vdso64/getcpu.c Heiko Carstens 2020-11-16  =
3 =20
80f06306240e0a arch/s390/kernel/vdso64/getcpu.c Heiko Carstens 2020-11-16  =
4  #include <linux/compiler.h>
80f06306240e0a arch/s390/kernel/vdso64/getcpu.c Heiko Carstens 2020-11-16 @=
5  #include <linux/getcpu.h>
80f06306240e0a arch/s390/kernel/vdso64/getcpu.c Heiko Carstens 2020-11-16  =
6  #include <asm/timex.h>
1ab3001b6efb78 arch/s390/kernel/vdso64/getcpu.c Heiko Carstens 2020-11-24  =
7  #include "vdso.h"
80f06306240e0a arch/s390/kernel/vdso64/getcpu.c Heiko Carstens 2020-11-16  =
8 =20

:::::: The code at line 5 was first introduced by commit
:::::: 80f06306240e0ad1c75116111be11950474dfda7 s390/vdso: reimplement getc=
pu vdso syscall

:::::: TO: Heiko Carstens <hca@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
