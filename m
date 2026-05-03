Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA31D16CD33
	for <oe-kbuild@lists.linux.dev>; Sun,  3 May 2026 20:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777841975; cv=none; b=sJzunXyXRNgO7CWeOngDvEJkBV5+6+hoCDx32fDvYOv9PyBpcwiHSEQdgfmTpeBqYARMy3EO8HtX26fBEWNKTKnblsXcOciDeu/ftrS0BFvjuBoJXmq2CHs48SFsvjEBIE6kz2Kn9oJpr3DVYNXC4T2CSVFQHiH2Xb6dmmObD/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777841975; c=relaxed/simple;
	bh=y4pEnMW8IwXLQ08O1T1pRdewNRw1t4hnoF/dJ8cmPrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=LJotJUCh8PqlsVl3NJUwAj3zmkxvTIuB3dbeJa9B1eWTnVgWnKE4/E673cHYPu+9UNUksaHsjhXeJa2aJpzHHK/iANxHzMaqQB/UiOdHzSxMtVBeSusjnllAc1iOc6Dqteacv1dyi9a4846kzv0BebybMGfQOpAaXa8ej5VlAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BiMX6+FF; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BiMX6+FF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777841972; x=1809377972;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=y4pEnMW8IwXLQ08O1T1pRdewNRw1t4hnoF/dJ8cmPrk=;
  b=BiMX6+FF+pfHERAsVPwcXHkFqN36F0LdHTjy7Jf74yA804VrPXEWJMAu
   j3cG3cR1qzJ/4ooc/VZacF5c+HVu8WmBjrXuAbQ13S4SbrJtFepBnDBH7
   aNOWF53Iy7YJFQwcl+a/YoKmQYWh8rhT540kXQ5ExcWX4G8xe4NVfSC4H
   Nr5s3Lsx4DxxHn/nWl5FPn2RfWXfSD4ZgoWvnIzSFS5d+PVOe/Awg4Oe1
   jePhQiyuL+SzcF+UHNx6X6xTlV31UFwJ6tnJv2GRAesO54q/4xKGGg40K
   QW5O0RnrlxDvNEhVXEkLz7AcnVKqHXFzQhUnCsseX8sNtZ+uq/mtiWfQt
   A==;
X-CSE-ConnectionGUID: 8U4G202mQXaYl3TlGbJfyQ==
X-CSE-MsgGUID: 2UmxfbkQQ/ijMHgtTTQ4SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="82324181"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="82324181"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 13:59:32 -0700
X-CSE-ConnectionGUID: zmhijVXUQBS+rskmzKPAjg==
X-CSE-MsgGUID: YxpgXJ4GTk2AG7X8juI+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="232195324"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 May 2026 13:59:30 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJduJ-0000000033D-1uCQ;
	Sun, 03 May 2026 20:59:22 +0000
Date: Mon, 04 May 2026 04:58:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/asm-generic/bitsperlong.h:23:2: sparse: sparse:
 Inconsistent word size. Check asm/bitsperlong.h
Message-ID: <202605040419.rbGU1erO-lkp@intel.com>
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
head:   66edb901bf874d9e0787326ba12d3548b2da8700
commit: 62357a5888ea6ef81f718eee20ad962a1101fb96 asm-generic/bitsperlong.h:=
 Add sanity checks for __BITS_PER_LONG
date:   8 weeks ago
:::::: branch date: 25 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-122-20260503 (https://download.01.org/0day-ci/arc=
hive/20260504/202605040419.rbGU1erO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260504/202605040419.rbGU1erO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 62357a5888ea ("asm-generic/bitsperlong.h: Add sanity checks for __=
BITS_PER_LONG")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605040419.rbGU1erO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/boot/pm.c: note: in included file (through arch/x86/include/uap=
i/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gener=
ic/int-ll64.h, ...):
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
   arch/x86/boot/a20.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
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
   arch/x86/boot/cmdline.c: note: in included file (through arch/x86/includ=
e/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-=
generic/int-ll64.h, ...):
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
   arch/x86/boot/regs.c: note: in included file (through arch/x86/include/u=
api/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gen=
eric/int-ll64.h, ...):
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
   arch/x86/boot/early_serial_console.c: note: in included file (through ar=
ch/x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h,=
 include/asm-generic/int-ll64.h, ...):
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
   arch/x86/boot/video.c: note: in included file (through arch/x86/include/=
uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-ge=
neric/int-ll64.h, ...):
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
   arch/x86/boot/main.c: note: in included file (through arch/x86/include/u=
api/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gen=
eric/int-ll64.h, ...):
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
   arch/x86/boot/video-bios.c: note: in included file (through arch/x86/inc=
lude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/a=
sm-generic/int-ll64.h, ...):
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
   arch/x86/boot/printf.c: note: in included file (through arch/x86/include=
/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-g=
eneric/int-ll64.h, ...):
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
   arch/x86/boot/cpu.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
