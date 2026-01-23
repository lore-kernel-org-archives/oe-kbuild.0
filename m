Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B868D19CD05
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 13:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769173259; cv=none; b=olPNA1OFZ6Yxc0m3uroV5B+UZCjxw3pu7ndSY37klCR63lAp1FNVSZcfJSN2TOWEEQIuxv9hYcVqAvNq9u0f2JparACMMacS2sFH55TjcOBMeF6sec7/rHcKHBjJI3m+2mQZcyvs+TibZ74AqRfku+5oNcpYV2W2zbIFjWCkxdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769173259; c=relaxed/simple;
	bh=RLmNHy7ZwCmYroVLswUtS9NsJoK0i/ZUX7tcSGQb3OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tkjbVICFlcHPYHTuITmS/W1lBWGZ9OmZ6igoWtUa/1f+AA5av90qMI/PHwEw4veoaFuvptRfEeyIzGXQvOrrVs27nCTDjcZ2c4RYtaU73eMpt3uSm93ZhlKc7xYAKGPR+9dUyJsmvEi9IyHbGBjvvb96E6ssMMp5cL8P3iwJNGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hxgRVHum; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hxgRVHum"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769173258; x=1800709258;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=RLmNHy7ZwCmYroVLswUtS9NsJoK0i/ZUX7tcSGQb3OQ=;
  b=hxgRVHum+aqr3xICEKdJPYP7YReKxbOEbkXqZEDA0d6+tGYW7iAZC3hD
   53sdFpCHKXAksovP7l0XQKkqv9SGyR6IGg8uonXRpcdpNGFFwut7K5fMA
   1NQZ2rpr/QvVJ2XCldtS7IyzQfhzxaDNUXlZfhGp1zLE70xGxw/RLZItl
   9ywSWdwGH3PrKoAiACGw5EWPj58Zagf7LQkE8lQlvkxvgeVLhMt6/ysgX
   sHBN0o6Y7QlOpdpKOTUSDkyzkBLXlme9AS01A0ikbm0NngvtaYeY8SLnE
   WMLcFMoPYbocMunfXS0LsHF+tkObh3gM1UvbJ2jPabu+7qgE46OMkV9e+
   g==;
X-CSE-ConnectionGUID: fEg+dRlbTH2/oPJdEyw1/A==
X-CSE-MsgGUID: 52rBZeeIQZyORa2zoXu3Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70514789"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="70514789"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 05:00:57 -0800
X-CSE-ConnectionGUID: 4JhOPBvXQBmCKxzBZWsmHA==
X-CSE-MsgGUID: nM3DjS8kQL+n4Dlkz6g15Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="211484284"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2026 05:00:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjGmT-00000000Ty2-3Pbq;
	Fri, 23 Jan 2026 13:00:53 +0000
Date: Fri, 23 Jan 2026 21:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/vdso-compat-checkflags 7/7]
 include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent word
 size. Check uapi/asm/bitsperlong.h
Message-ID: <202601232056.Wq5AfpIl-lkp@intel.com>
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
k uapi/asm/bitsperlong.h"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/vdso-compat-checkflags
head:   92e33e2ec8faf236e7e5bc551c7cb18e4625140b
commit: cb0e8254ce556c124d1c33db50f4b54d320a6d40 [7/7] asm-generic/bitsperl=
ong.h: Add sanity checks for __BITS_PER_LONG
:::::: branch date: 29 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-122-20260121 (https://download.01.org/0day-ci/arc=
hive/20260123/202601232056.Wq5AfpIl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260123/202601232056.Wq5AfpIl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601232056.Wq5AfpIl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/realmode/rm/wakemain.c: note: in included file (through arch/x8=
6/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, incl=
ude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-mode.c: note: in included file (through arch/=
x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, in=
clude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/realmode/rm/regs.c: note: in included file (through arch/x86/in=
clude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/=
asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-vga.c: note: in included file (through arch/x=
86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, inc=
lude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-vesa.c: note: in included file (through arch/=
x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, in=
clude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-bios.c: note: in included file (through arch/=
x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, in=
clude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/cpuflags.c: note: in included file (through arch/x86/inclu=
de/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm=
-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/regs.c: note: in included file (through arch/x86/include/u=
api/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gen=
eric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/memory.c: note: in included file (through arch/x86/include=
/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-g=
eneric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/a20.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/pm.c: note: in included file (through arch/x86/include/uap=
i/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gener=
ic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/version.c: note: in included file (through arch/x86/includ=
e/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-=
generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/cmdline.c: note: in included file (through arch/x86/includ=
e/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-=
generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/main.c: note: in included file (through arch/x86/include/u=
api/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gen=
eric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/early_serial_console.c: note: in included file (through ar=
ch/x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h,=
 include/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/tty.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/cpucheck.c: note: in included file (through arch/x86/inclu=
de/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm=
-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/edd.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/video-bios.c: note: in included file (through arch/x86/inc=
lude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/a=
sm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/video-vga.c: note: in included file (through arch/x86/incl=
ude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/as=
m-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/video-mode.c: note: in included file (through arch/x86/inc=
lude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/a=
sm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/video-vesa.c: note: in included file (through arch/x86/inc=
lude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/a=
sm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/string.c: note: in included file (through arch/x86/include=
/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-g=
eneric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/cpu.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/video.c: note: in included file (through arch/x86/include/=
uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-ge=
neric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"
--
   arch/x86/boot/printf.c: note: in included file (through arch/x86/include=
/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-g=
eneric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check uapi/asm/bitsperlong.h
>> include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check uapi/asm/bitsperlong.h"

vim +23 include/asm-generic/bitsperlong.h

c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  21 =20
cb0e8254ce556c Thomas Wei=C3=9Fschuh 2026-01-14  22  #if __BITS_PER_LONG !=
=3D __CHAR_BIT__ * __SIZEOF_LONG__
cb0e8254ce556c Thomas Wei=C3=9Fschuh 2026-01-14 @23  #error Inconsistent wo=
rd size. Check uapi/asm/bitsperlong.h
cb0e8254ce556c Thomas Wei=C3=9Fschuh 2026-01-14  24  #endif
cb0e8254ce556c Thomas Wei=C3=9Fschuh 2026-01-14  25 =20
cb0e8254ce556c Thomas Wei=C3=9Fschuh 2026-01-14  26  #ifndef __ASSEMBLER__
cb0e8254ce556c Thomas Wei=C3=9Fschuh 2026-01-14 @27  _Static_assert(sizeof(=
long) * 8 =3D=3D __BITS_PER_LONG,
cb0e8254ce556c Thomas Wei=C3=9Fschuh 2026-01-14  28  	       "Inconsistent =
word size. Check uapi/asm/bitsperlong.h");
cb0e8254ce556c Thomas Wei=C3=9Fschuh 2026-01-14  29  #endif
cb0e8254ce556c Thomas Wei=C3=9Fschuh 2026-01-14  30 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
