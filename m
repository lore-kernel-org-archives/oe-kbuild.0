Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794052593;
	b=eob0dFZ+IXNPbR7vY4qe0KIJijJBV0aRyemVWzZ21e1nHs2IMTs2sjyIXX0DYfgoWMc/
	 DC2f8wKJswEt4tjseNdb1vVi81xt4GGEPnZ9N3Ykkw+lNTQpPO6+ZHfoYhRTyiF98PtBh
	 fY00twqgCtRBztU6xkAJkbA4egvzwoYsXLrlzAvF5t41eGHRxhMRgERTEYW+WM84OzLCX
	 KAyDg3QSO6koF9LzZIUwllNtnuBU3p+dS8P7+lBPGS1chB5aNDzfL+YhxEPBB7pLrXDWT
	 /aOvmZC3ogDQIB0UEHWrBZ18dZHoMeTGl5RV83boMLniXaEsjqwK8PHrtEwHFWDkdLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794052593;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=8NRuuAOrariZ9N6zXJCHwkR+U5rL+YWyPiutIONy7pE=;
	b=Dwv4kkuzUqucGXvzTS6tBKH8egPXbi99rETSaY+Ej+3XPnB5MQ5EulQGX0lZbp/YFOgA
	 XnR/IuZgOHlZoGSaH5/xgNzJWJOlbBHNPrZ97+xeTZIpn2KbaqBv3DsXCEr5Q8YnZPRuG
	 tb2n/meC8BggVlgMT1M/BrdzY7z/b2brE6zBOiNvO4E97KnqbkS5IJ9RBp825uzmKmNl/
	 CqOO3La/XSFKTWhZ2V5qW60BFA3Z/tu0ln6/9QZ/8GANzN1l8SNAvriePFngfQrOkjzmf
	 UTb8Ik5EuhsiZ+6ZUl7haAMipmqJtU3ejBBg/0w7emw0oYI+QEYzmusGhRYmYM12gcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a3rvdlNR;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F608606A32C
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 11:56:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F608606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a3rvdlNR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794052592; x=1825588592;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ndL5bGcUcrFkSaNjzQJynXr2Gh9L8h/9XH0KjRmgksY=;
  b=a3rvdlNRMtl6nEFamxdPIgsiTkr8jEWMxVc6DUxzI6bwnapAerKk8Yd7
   klPpq1Te/hYbSMDw8TlLlrQyl84FuN0dReZDadxkz44vRKGgn6enPtCXj
   myP5mgSy9xK66BbDY4pKA0NbtpEwHnYG6rQnjfjU56r3nuCGsi2i7hSGF
   HZJ4R2Y7ewfmYTdGfd5x7LvbKE2ZTeBNzYKd8usn92Ky28iL8kasWnN4E
   mvxGb/PmJdgIkq6Sm+XUR3uqxT1vtiI3CmH+00gNDT0Gz0hFpjaHWBam7
   J9zoxacqfQTpCSnL7VW//FuYLhseFu6KXGzTe0RJSlPTT9a7uSQayHgWZ
   w==;
X-CSE-ConnectionGUID: MqhT9b+6QrKExX0ej1V27Q==
X-CSE-MsgGUID: pSE85baGQceayVb5H2EXeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2843094"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2843094"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 03:56:32 -0800
X-CSE-ConnectionGUID: FXZENuhwRQSQ/XdYv7sPcw==
X-CSE-MsgGUID: dSNhH5oGQWSKKaIiBQPYsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7352379"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 07 Nov 2026 03:56:30 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPf24-00000000qmt-2u4U;
	Sat, 07 Nov 2026 11:56:28 +0000
Date: Sat, 07 Nov 2026 19:56:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-tools-relpath 5/8]
 tools/objtool/include/objtool/cfi.h:9:10: fatal error: arch/cfi_regs.h: No
 such file or directory
Message-ID: <202611071944.oZ7mIZRz-lkp@intel.com>
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
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: csky-randconfig-1001-20261107 (https://download.01.org/0day-ci/arch=
ive/20261107/202611071944.oZ7mIZRz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261107/202611071944.oZ7mIZRz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611071944.oZ7mIZRz-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from tools/objtool/include/objtool/check.h:10,
                    from tools/objtool/include/objtool/trace.h:9,
                    from trace.c:6:
>> tools/objtool/include/objtool/cfi.h:9:10: fatal error: arch/cfi_regs.h: =
No such file or directory
       9 | #include <arch/cfi_regs.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/trace.o] Erro=
r 1 shuffle=3D1313628075
>> special.c:14:10: fatal error: arch/special.h: No such file or directory
      14 | #include <arch/special.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
   In file included from check.c:14:
>> tools/objtool/include/objtool/cfi.h:9:10: fatal error: arch/cfi_regs.h: =
No such file or directory
       9 | #include <arch/cfi_regs.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/special.o] Er=
ror 1 shuffle=3D1313628075
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/check.o] Erro=
r 1 shuffle=3D1313628075
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from weak.c:10:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from klp-symid.c:26:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/weak.o] Error=
 1 shuffle=3D1313628075
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/klp-symid.o] =
Error 1 shuffle=3D1313628075
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from objtool.c:16:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from builtin-check.c:15:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/objtool.o] Er=
ror 1 shuffle=3D1313628075
   In file included from elf.c:25:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from signal.c:14:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/builtin-check=
.o] Error 1 shuffle=3D1313628075
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/signal.o] Err=
or 1 shuffle=3D1313628075
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/elf.o] Error =
1 shuffle=3D1313628075
   In file included from tools/objtool/include/objtool/objtool.h:13,
                    from tools/objtool/include/objtool/arch.h:11,
                    from disas.c:9:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: arch/elf.h: No s=
uch file or directory
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   compilation terminated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/disas.o] Erro=
r 1 shuffle=3D1313628075
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:125: tools/objtool/objtool-in.o] Error 2 shuffle=
=3D1313628075
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:74: objtool] Error 2 shuffle=3D1313628075
   make[2]: *** [Makefile:1632: tools/objtool] Error 2 shuffle=3D1313628075
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3D1313628075
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3D1313628075
   make: Target 'prepare' not remade because of errors.


vim +9 tools/objtool/include/objtool/cfi.h

baa41469a7b992 tools/objtool/cfi.h                 Josh Poimboeuf 2017-06-2=
8   8 =20
7786032e52cb02 tools/objtool/include/objtool/cfi.h Vasily Gorbik  2020-11-1=
3  @9  #include <arch/cfi_regs.h>
8b946cc38e063f tools/objtool/include/objtool/cfi.h Peter Zijlstra 2021-06-2=
4  10  #include <linux/list.h>
6f8ca67683962d tools/objtool/cfi.h                 Julien Thierry 2020-03-2=
7  11 =20

:::::: The code at line 9 was first introduced by commit
:::::: 7786032e52cb02982a7154993b5d88c9c7a31ba5 objtool: Rework header incl=
ude paths

:::::: TO: Vasily Gorbik <gor@linux.ibm.com>
:::::: CC: Josh Poimboeuf <jpoimboe@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
