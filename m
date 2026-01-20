Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A31B358D38
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Jan 2026 05:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768885301; cv=none; b=dDyZnQBoD5K2yyRw25ItEkYCtzIkmyEvRhD5vZe0GfdpQYycXfGvY5pe73p70FtbA0CGPsS2/BWUPSHZ0l2dy/kbIS/1Epe1IXvXXvCZPKU+WuhXohPIpakg0aQSg0pUajQHauFB/caX/xDhE+TczFi2jMYty/7Cd7Y3/Nm85ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768885301; c=relaxed/simple;
	bh=ON/Sy1KLfNiAAmC3V7W7RK3uKrs1Aiq9vC/QegDl4fo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RBiKhYquw5PLw99XBjCimcdWXTlBxO28PzXJtF1Jd5WQyQSiQKyi7QiVC814231LMZhuAza9JegI6gLCHGk4zLH3ZS0T67Qcz4gxZzGq4sqyGpFB2qPytkDiv2tHDcz9otRejj8SaCMWqBQ2sy/u7SVLBt97wJ3jyvpoMeQYYdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lwnzjlO1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lwnzjlO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768885299; x=1800421299;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ON/Sy1KLfNiAAmC3V7W7RK3uKrs1Aiq9vC/QegDl4fo=;
  b=lwnzjlO12ksaNXGSCVGRm8QiA6BeoJs4HOrh9ZAQ4Z42nISxinhvvOYt
   J/nVx3jcvkmgJRwJo8EJMdfCTUPPwnLRXIcDiZ8q1vVvwKCSiromC8zve
   kBF1SYZbGMnZthCJxz6+gD0ufaPpGbza3T8G6k00II/RTo33cyIaoMJZ0
   JIv7z5pNvIKTWdTnEM3JWvNZ+BNHMP+t6jTtvsqj6gYTt6rvrjhQRtBcS
   lw2cpdblb3byH2OorBFFntAYyJsV1X+O26RuQepvOK2z/rSUTCV/QWFFa
   uD+SvimV1sLdqrpnwR3iaOGDmsDipAV8oaPn4jdsuVFA3UJDhM0Nptkl5
   Q==;
X-CSE-ConnectionGUID: mwV14eESRIKLdd49XmXQeQ==
X-CSE-MsgGUID: 37/wSdzlRt+WMdFQbllDIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70058017"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="70058017"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 21:01:39 -0800
X-CSE-ConnectionGUID: l6yfHcgjQOq7pxlvuSuE8g==
X-CSE-MsgGUID: gXAlqSFTTo+mYfT9rHN7gw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 Jan 2026 21:01:37 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi3rz-00000000Oan-2B9m;
	Tue, 20 Jan 2026 05:01:35 +0000
Date: Tue, 20 Jan 2026 13:01:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-compat-checkflags 6/6]
 include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsistent
 word size. Check uapi/asm/bitsperlong.h
Message-ID: <202601201247.v3LW2tCd-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: include/u=
api/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsistent word size.=
 Check uapi/asm/bitsperlong.h"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-compat-checkflags
head:   2c10d418835ea89400ff0c01e5d51f62a1ae93be
commit: 2c10d418835ea89400ff0c01e5d51f62a1ae93be [6/6] asm-generic/bitsperl=
ong.h: Add sanity checks for __BITS_PER_LONG
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-122-20260120 (https://download.01.org/0day-ci/arc=
hive/20260120/202601201247.v3LW2tCd-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260120/202601201247.v3LW2tCd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601201247.v3LW2tCd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/realmode/rm/wakemain.c: note: in included file (through include=
/asm-generic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-mode.c: note: in included file (through inclu=
de/asm-generic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/realmode/rm/regs.c: note: in included file (through include/asm=
-generic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-vga.c: note: in included file (through includ=
e/asm-generic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-bios.c: note: in included file (through inclu=
de/asm-generic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-vesa.c: note: in included file (through inclu=
de/asm-generic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/version.c: note: in included file (through include/asm-gen=
eric/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/memory.c: note: in included file (through include/asm-gene=
ric/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/a20.c: note: in included file (through include/asm-generic=
/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/cpuflags.c: note: in included file (through include/asm-ge=
neric/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/cmdline.c: note: in included file (through include/asm-gen=
eric/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/pm.c: note: in included file (through include/asm-generic/=
bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/early_serial_console.c: note: in included file (through in=
clude/asm-generic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, .=
..):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/edd.c: note: in included file (through include/asm-generic=
/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/tty.c: note: in included file (through include/asm-generic=
/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/regs.c: note: in included file (through include/asm-generi=
c/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/main.c: note: in included file (through include/asm-generi=
c/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/cpucheck.c: note: in included file (through include/asm-ge=
neric/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/video-bios.c: note: in included file (through include/asm-=
generic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/video-vga.c: note: in included file (through include/asm-g=
eneric/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/video-mode.c: note: in included file (through include/asm-=
generic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/video.c: note: in included file (through include/asm-gener=
ic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/video-vesa.c: note: in included file (through include/asm-=
generic/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/printf.c: note: in included file (through include/asm-gene=
ric/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/string.c: note: in included file (through include/asm-gene=
ric/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/cpu.c: note: in included file (through include/asm-generic=
/bitsperlong.h, arch/x86/include/uapi/asm/bitsperlong.h, ...):
>> include/uapi/asm-generic/bitsperlong.h:34:2: sparse: sparse: Inconsisten=
t word size. Check uapi/asm/bitsperlong.h
>> include/uapi/asm-generic/bitsperlong.h:38:33: sparse: sparse: static ass=
ertion failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"

vim +34 include/uapi/asm-generic/bitsperlong.h

3c7a8e190bc580 Paolo Bonzini    2023-12-12  30 =20
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14  31  /* Consistency checks =
*/
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14  32  #ifdef __KERNEL__
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14  33  #if __BITS_PER_LONG !=
=3D __CHAR_BIT__ * __SIZEOF_LONG__
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14 @34  #error Inconsistent wo=
rd size. Check uapi/asm/bitsperlong.h
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14  35  #endif
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14  36 =20
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14  37  #ifndef __ASSEMBLER__
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14 @38  _Static_assert(sizeof(=
long) * 8 =3D=3D __BITS_PER_LONG,
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14  39  	       "Inconsistent =
word size. Check uapi/asm/bitsperlong.h");
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14  40  #endif
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14  41  #endif /* __KERNEL__ */
2c10d418835ea8 Thomas Wei=C3=9Fschuh 2026-01-14  42 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
