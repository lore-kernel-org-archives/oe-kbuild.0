Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943B320D4FC
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jun 2026 08:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780561504; cv=none; b=qv0J12TAgV8nQfOWIl9d5En+QISNypHQdKnYT3lSV1U6SYuQ8w0Y+Z+bflh9M0BbPHq86n07T4cXJRnO7BxtaTKnSiZFui02P0Hrr6q4FuEfY4UuQA+rXwhtSOzb3KaADLzwjB538wuxuViUVdJdRNctHa1tVCEIwscxtZ8ICcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780561504; c=relaxed/simple;
	bh=kGMdhaMxaMhie1pwunqgt8qjOyYx4HOxcL7NpBiu/ng=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=u2uN86SusNmjqE5Bb484Nz/NKimaacKysXGzwv/JdOvr6IE9hHmUGBU9kXpatPdchlQCRu1Of7tVBuFEjvOaaENjPzApBC+xmwaZoyZVpwaIjosAIsLDGnso31u02ZjeZF/9NBWC7MbckTeChnH47G9YPxvw/wEQSBXNAmACT2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CzO/GQTb; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CzO/GQTb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780561502; x=1812097502;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kGMdhaMxaMhie1pwunqgt8qjOyYx4HOxcL7NpBiu/ng=;
  b=CzO/GQTbtoML9EsfvmkxHNqd6cy/Hyn7Iytmh1DbFj0q+GutsPVIMLaL
   A5pvG9VhRCU8tSiww+ftm6OmQkEM7pNULIqEGjjASvTYajaDBgCQYvLUI
   38fG4HC3Psg68sgvFovZVztawwRCVkYZRcFaaoTm9d5Bsy3dz25qwE+8S
   v5BoQGpkoLBxL0ZA1/1PhiV2/B54iOpNI53/LyXDlKAKQc5vUTC/02K6E
   iHoqAw02E587uNcDfHlnAvrlM9VkOWOsHrwY7BkHY0S/mxXEGS5jYQEOW
   NfLnV/Y5WO1mLYPK+6rvhTztBI1cfuED9Fv7Dm6yCaFCY5xHiLO7xJGy+
   Q==;
X-CSE-ConnectionGUID: rN6MQEkqTvGbF+1SVs3ieQ==
X-CSE-MsgGUID: B1HDLtcTRpmmlPSuAy3yYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="92492211"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="92492211"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 01:25:02 -0700
X-CSE-ConnectionGUID: a+mXljpDQuKlNM+FJm5qSA==
X-CSE-MsgGUID: 01I7hrClRvedW+pYc+4A6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; 
   d="scan'208";a="246306204"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 04 Jun 2026 01:25:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wV3Nq-00000000ESg-1uwW;
	Thu, 04 Jun 2026 08:24:58 +0000
Date: Thu, 04 Jun 2026 16:24:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/asm-generic/bitsperlong.h:23:2: sparse: sparse:
 Inconsistent word size. Check asm/bitsperlong.h
Message-ID: <202606041601.s1E0tZVC-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: include/a=
sm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent word size. Chec=
k asm/bitsperlong.h"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
commit: 62357a5888ea6ef81f718eee20ad962a1101fb96 asm-generic/bitsperlong.h:=
 Add sanity checks for __BITS_PER_LONG
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-122-20260604 (https://download.01.org/0day-ci/arc=
hive/20260604/202606041601.s1E0tZVC-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260604/202606041601.s1E0tZVC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 62357a5888ea ("asm-generic/bitsperlong.h: Add sanity checks for __=
BITS_PER_LONG")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606041601.s1E0tZVC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/realmode/rm/video-mode.c: note: in included file (through arch/=
x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, in=
clude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/realmode/rm/wakemain.c: note: in included file (through arch/x8=
6/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, incl=
ude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/realmode/rm/regs.c: note: in included file (through arch/x86/in=
clude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/=
asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-vga.c: note: in included file (through arch/x=
86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, inc=
lude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-vesa.c: note: in included file (through arch/=
x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, in=
clude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-bios.c: note: in included file (through arch/=
x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, in=
clude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/cpuflags.c: note: in included file (through arch/x86/inclu=
de/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm=
-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/version.c: note: in included file (through arch/x86/includ=
e/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-=
generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/cpucheck.c: note: in included file (through arch/x86/inclu=
de/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm=
-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/memory.c: note: in included file (through arch/x86/include=
/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-g=
eneric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/regs.c: note: in included file (through arch/x86/include/u=
api/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gen=
eric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/video-bios.c: note: in included file (through arch/x86/inc=
lude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/a=
sm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/video-vesa.c: note: in included file (through arch/x86/inc=
lude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/a=
sm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/cmdline.c: note: in included file (through arch/x86/includ=
e/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-=
generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/early_serial_console.c: note: in included file (through ar=
ch/x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h,=
 include/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/edd.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/video-vga.c: note: in included file (through arch/x86/incl=
ude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/as=
m-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/a20.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/main.c: note: in included file (through arch/x86/include/u=
api/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gen=
eric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/video.c: note: in included file (through arch/x86/include/=
uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-ge=
neric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/video-mode.c: note: in included file (through arch/x86/inc=
lude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/a=
sm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/cpu.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/string.c: note: in included file (through arch/x86/include=
/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-g=
eneric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/pm.c: note: in included file (through arch/x86/include/uap=
i/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gener=
ic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/tty.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/printf.c: note: in included file (through arch/x86/include=
/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-g=
eneric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"

vim +23 include/asm-generic/bitsperlong.h

c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  21 =20
62357a5888ea6e Thomas Wei=C3=9Fschuh 2026-03-02  22  #if __CHAR_BIT__ * __S=
IZEOF_LONG__ !=3D __BITS_PER_LONG
62357a5888ea6e Thomas Wei=C3=9Fschuh 2026-03-02 @23  #error Inconsistent wo=
rd size. Check asm/bitsperlong.h
62357a5888ea6e Thomas Wei=C3=9Fschuh 2026-03-02  24  #endif
62357a5888ea6e Thomas Wei=C3=9Fschuh 2026-03-02  25 =20
62357a5888ea6e Thomas Wei=C3=9Fschuh 2026-03-02  26  #ifndef __ASSEMBLER__
62357a5888ea6e Thomas Wei=C3=9Fschuh 2026-03-02 @27  _Static_assert(sizeof(=
long) * 8 =3D=3D __BITS_PER_LONG,
62357a5888ea6e Thomas Wei=C3=9Fschuh 2026-03-02  28  	       "Inconsistent =
word size. Check asm/bitsperlong.h");
62357a5888ea6e Thomas Wei=C3=9Fschuh 2026-03-02  29  #endif
62357a5888ea6e Thomas Wei=C3=9Fschuh 2026-03-02  30 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
