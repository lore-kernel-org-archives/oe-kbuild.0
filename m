Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794038002;
	b=sCFNyI0jTcTPLbCtAlh9gOVrmDylaXTd8kCHvwFPaLpJVFWYjZOBTcNu3MkjQplPCmdF
	 dDkUODKvYMo0xxJ7nzb7vxShFJpHeJ0s+jrBgvA4vz+kiYRSYPu1cjCWXwlgXX5v55d8b
	 xJ9hMGPbfWmUJRY5h3LeqLAhKk5MplMAfxXJNBa8IhSwHCKl3HjOJq22sNDZon2zG2SfW
	 vrRM8O1XJ8zkNfnKCguLaNfqaVj4iq9htQiWM0PkauE/SI8u6L7rgyh/5itTmlsWdt0zG
	 EqfBEXAeVv7goo7J28T0WD8/PSCZVQA3S9UE9OzfY2YmvHVW5lnk6Pn4PK3d3MOyGwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794038002;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=+04LABIvyj+pkvKvwlPM0O32+/JZBBuGhWYIwNjgYIs=;
	b=JWI/k5g6BoAOAWZvuwOYvhwfUV6/tuDxux50ENrIkyc43GMYHgPCvjvsQ+uQUy61IVJR
	 lLW6VF80bSieZb3K4Y/njgdLbzBSSI1H+u6N3OPtcDg9FAK59hQz6obfmiYyfrJNI0Ekt
	 FT1SFcDqfFPlKPfa1xJofvKWiyrKu/97ItBXx5wQcmUK5vj6k9C8Q3uNUq/qtk38740l0
	 eEnGyEO3/AQtbujkNnyIeHK9WY+X/LqgdQoeCuzIk6s6jAA28LYjd4cUO88RKTtdGKeOx
	 g533pQyxDF01OSexmXphDcX71XZO+5Ih7CsmZA5Kn8nhIt84ZX1km8u8VAYOHh2FrIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SbT9oTRc;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A49606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 07:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10A49606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SbT9oTRc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794038001; x=1825574001;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AxgAwBtsIV9hkBS8C7irPizsNazLWqJK26RbhFlW1/E=;
  b=SbT9oTRclAL/TdrKVxOHZjMkjXhPAYnwC2iFZk7R5dxRJB2JCmN4cW4f
   Exl5sCo0PqwxkMJxzN5cLGxwar62AkDNS9nFJP0ZdJzROHSlCLcxeXOrq
   6qF+OWj8mhuHZpMh4SbpBChAknNxvLgxoIlDDIHTOvOtyLYCzKYgKu27i
   hIdBUrB5jIEShbx/7J2f1msaDT5jTs1mbeqeYMoO1V5wAQKXSl4B2bM3h
   AFVNyMHwTwTRaXaTgcVBYweeUXodToYMIualW9DEcBHDYnI6WpYFRmaWQ
   UU+1zLzA70fJUAnt9RgO+Ppxm793N5Zct1zcWmKpyBufDosJGOSOqIrl9
   g==;
X-CSE-ConnectionGUID: J+9vTYDWThqJcPzJP7MHug==
X-CSE-MsgGUID: 7CSF9lB0Q7SeImzoSxJgDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2730047"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2730047"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 23:53:20 -0800
X-CSE-ConnectionGUID: 4rsQVv75S6GXycyLjpA3mg==
X-CSE-MsgGUID: 0J8IFjOaQfeYofVhk/zprg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="9205983"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 06 Nov 2026 23:53:20 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPbEg-00000000AbN-2fnY;
	Sat, 07 Nov 2026 07:53:14 +0000
Date: Sat, 07 Nov 2026 08:52:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-tools-relpath 5/8]
 tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No such
 file or directory
Message-ID: <202611070823.f66dTD3E-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-tools-relpath
head:   90ff35376f573e147b3c331d2694e0d3e9e7760f
commit: dc78834d6b6f09539bd5b9b6f07475400f30d374 [5/8] deleteme
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: csky-randconfig-2200-20261107 (https://download.01.org/0day-ci/arch=
ive/20261107/202611070823.f66dTD3E-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261107/202611070823.f66dTD3E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611070823.f66dTD3E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from builtin-check.c:15:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/builtin-check=
.o] Error 1 shuffle=3D2776899342
   In file included from check.c:14:
>> tools/objtool/include/objtool/cfi.h:9:10: fatal error: arch/cfi_regs.h: =
No such file or directory
       9 | #include <arch/cfi_regs.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/check.h:10,
                    from tools/objtool/include/objtool/trace.h:9,
                    from trace.c:6:
>> tools/objtool/include/objtool/cfi.h:9:10: fatal error: arch/cfi_regs.h: =
No such file or directory
       9 | #include <arch/cfi_regs.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/check.o] Erro=
r 1 shuffle=3D2776899342
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from klp-symid.c:26:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from objtool.c:16:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/trace.o] Erro=
r 1 shuffle=3D2776899342
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from disas.c:9:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/objtool.o] Er=
ror 1 shuffle=3D2776899342
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/disas.o] Erro=
r 1 shuffle=3D2776899342
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/klp-symid.o] =
Error 1 shuffle=3D2776899342
>> special.c:14:10: fatal error: arch/special.h: No such file or directory
      14 | #include <arch/special.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from signal.c:14:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/signal.o] Err=
or 1 shuffle=3D2776899342
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/special.o] Er=
ror 1 shuffle=3D2776899342
   In file included from elf.c:25:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/elf.o] Error =
1 shuffle=3D2776899342
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from weak.c:10:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/weak.o] Error=
 1 shuffle=3D2776899342
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:125: tools/objtool/objtool-in.o] Error 2 shuffle=
=3D2776899342
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:74: objtool] Error 2 shuffle=3D2776899342
   make[2]: *** [Makefile:1632: tools/objtool] Error 2 shuffle=3D2776899342
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3D2776899342
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3D2776899342
   make: Target 'prepare' not remade because of errors.


vim +19 tools/objtool/include/objtool/elf.h

3b92486fa1a905c tools/objtool/include/objtool/elf.h Josh Poimboeuf 2025-09-=
17  16 =20
3b92486fa1a905c tools/objtool/include/objtool/elf.h Josh Poimboeuf 2025-09-=
17  17  #include <objtool/endianness.h>
0d83da43b1e1c8c tools/objtool/include/objtool/elf.h Josh Poimboeuf 2025-09-=
17  18  #include <objtool/checksum_types.h>
53257a977a69b5e tools/objtool/include/objtool/elf.h Josh Poimboeuf 2023-05-=
30 @19  #include <arch/elf.h>
442f04c34a1a467 tools/objtool/elf.h                 Josh Poimboeuf 2016-02-=
28  20 =20

:::::: The code at line 19 was first introduced by commit
:::::: 53257a977a69b5eabbaafb64dcd767d2a4fef2b3 objtool: Consolidate rel/re=
la handling

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Josh Poimboeuf <jpoimboe@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
