Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2723163
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Jan 2026 02:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768356244; cv=none; b=er//hyY7cFY4qcMnS8iZGnfowsjNmq/NVLoUjivo0+04M+0n3F/r45fYJ/jvdlZqsopAlrtmrfkxAL7s5SwJrtnBkQJIjN3upnAY8nuckj1TAbI+NJ++Zy8Cvj7yvfXqRk//cdT9vfI8AZwEKxz8SLoSu2P/LfL/BAs8bNW5nG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768356244; c=relaxed/simple;
	bh=Tq3ReuQ8ENsTY4DkC546ClL2nLEajfdkRyZi7Pecv4A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MgnJ7bsOGO/o2qXIWdIlWc0q+6I66ROtglUDg+HqURzr6azTS5hzKdUoC1CM7I+Dy3FqNE6/2HoPvvBNiu1wvrWBnwyVwc4rhCC3Q7rRVh79gvNgncQmlJCUIyP5OpABDKp01gV1mtD2z8ZAxILwpfBWBrO9r7YcdtWzQvqs8WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZI4B3hL2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZI4B3hL2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768356243; x=1799892243;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Tq3ReuQ8ENsTY4DkC546ClL2nLEajfdkRyZi7Pecv4A=;
  b=ZI4B3hL2eb3g/mQrCpzKw2CrcJCbs4gErtZLaymPm2Ae1NIPf2gPBn2O
   MqomkejbM5Xsd7oMlQ7IEmgtb3oett23gXWsFeR2Mqy4N8j3G3uVg1kOE
   BXslHxNnHFQ0x15dArYTqFdWpNRV/wvzX2dyD1TThyCH0jdYS7TtjF3LL
   SWGXI9Pj2xOLfXi98f6eUb3Vpi6BaxivLMjy/FkFuMngyz7WkJtIwKqIW
   kWSYWd0I2voCKbN38yT42Fg0uluBWDQ16jJvfcLV8UBca2JBZRiWli/hl
   HrkUhvIhEL0yUkRxRTDLu1AXZFv4LZf+Jkp0j+uRZ3iNzyv8htIBeMFjN
   A==;
X-CSE-ConnectionGUID: DBcyn9hCQVmqgPHQUJQsKA==
X-CSE-MsgGUID: ekhMO0FzTdSZycRrMMS/iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69560258"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="69560258"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 18:04:03 -0800
X-CSE-ConnectionGUID: 6quPyO+NSK+Mq8GxVRhbSg==
X-CSE-MsgGUID: 1tTxWUb5R5u1zrmSMCwSAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; 
   d="scan'208";a="203682400"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jan 2026 18:04:01 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfqEo-00000000Feg-3isw;
	Wed, 14 Jan 2026 02:03:58 +0000
Date: Wed, 14 Jan 2026 10:03:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-powerpc-align 3/3]
 arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supported
Message-ID: <202601140935.BnUvmQf5-lkp@intel.com>
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
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-powerpc-align
head:   6463c8929d2f3f4dde4bb3e5a2ad226e8e6bd731
commit: 6463c8929d2f3f4dde4bb3e5a2ad226e8e6bd731 [3/3] powerpc/vdso: Provid=
e clock_getres_time64()
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: powerpc-randconfig-002-20260114 (https://download.01.org/0day-ci/ar=
chive/20260114/202601140935.BnUvmQf5-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260114/202601140935.BnUvmQf5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601140935.BnUvmQf5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/kernel/vdso/vdso32.so.dbg: dynamic relocations are not supp=
orted
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:79: arch/powerpc/kernel/=
vdso/vdso32.so.dbg] Error 1 shuffle=3D843335742
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because =
of errors.
   make[2]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2 shuffle=
=3D843335742
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3D843335742
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3D843335742
   make: Target 'prepare' not remade because of errors.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
