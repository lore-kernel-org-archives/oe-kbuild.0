Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794041678;
	b=YszedN8I30FBmh3dW6W4u0orhoHhY6iEJfSwXKwv6IKaEj0lqh0otBu62vhWCDiUvhYX
	 rx/HDHuV6la3RCjo0uZ/KV+6zQv70q32uGqtISntgraHcLn+5CWTpiA/+cx+oj1zFprvI
	 SYbSE0khG2a4D8PCD3Zl4VpGngBVtF9nGW/LVYYgKD79madJ5FaJSeeXxHTvnogd0KtuD
	 4DczrExKzibTg8OEprpVbs0P0Pq4/Ep8MctcKRfK/HRRuoET2AFhd4iFmOFFCs41vxxKB
	 7Bm0BxEqaXwhQVqrH43+tHQd3JrSfDMF/Fo0gMc23TczwGq+GjVmlmuU+tHQK9L2s3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794041678;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=m47rJEPnHs0nMitzI2bkqQwCPXmpQ9WsxB/0jrIT+h0=;
	b=mKDL//LwziWQekqCBa7WL+WSO2hoVuiUSTed60lJDBTJ8Gl6xnXDP1fcvt/dxjolyocO
	 GklpJqqUWrZ5fFCYVZrjB+CKh+Cy/hHVuHwq2pQCT7owmi8V7sgs+MUKtUjnNaAraUjJu
	 qD6yvhuGfYWuFq/LudfQTb7vLb5Gpy1L1OO6yOygNSlBmfYzKEwowoHUr951l1vmPtuz1
	 lg5fOW2sJK72SkR98Px4HdcSUtmZUQRaikgkV32eBMXLSE07B8qEOdLwqNyqr4UG6Ytvj
	 iGFTD1ThV5q0Y6dKK2G6O0lDOfnSfyENqy+AEkwAw2yOroWhV4kXxf9IaH70STkgFuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ja3P94vV;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BBA606A32C
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 08:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4BBA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ja3P94vV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794041677; x=1825577677;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WrrC2CkBRciNSqo9llsCsEXWIABi/PvAOdvSGac8v5I=;
  b=Ja3P94vVwmnAOzyil+oeZexMPT/R8uDpbTVJ46GlsvJvdjs5dLqZlkbt
   U1QXU1tGTFSAeoJKwGgoMoj+R7Cf6ojBDGnJ6Ya+1cHQGwhBkzWkHqhGc
   orzi9lh6T7T3EtjUI373EnsEETehJD6mXN1airhgRvbBNdu0FJ2AfxGHu
   jysDtBdol1FhShSP6bdmG/P6sj1VafIayeK3TomhkX6fYyiqLU0ho3K0Y
   NyfJLXeVrnsm0Tpd08ruPuSVcDcd5aumFAgKklq8VypW0LEIxX3ztAhXO
   QI7GGaIKh6pyIRHBpvJiy8ToFLSgkhu1YI8Eq3NVGsmu5ifeJ7tPTNg64
   g==;
X-CSE-ConnectionGUID: JaaRLe6YRG6u7eGweqrmBg==
X-CSE-MsgGUID: +eKSWPHfSO2sRQrloezUvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2746431"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2746431"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 00:54:36 -0800
X-CSE-ConnectionGUID: B97uPNh9RYSH8R2jlHAsTg==
X-CSE-MsgGUID: FaoW9szxRz6fGlR6hXIRzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7795953"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Nov 2026 00:54:35 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPcBz-00000000AcM-0Dsu;
	Sat, 07 Nov 2026 08:54:31 +0000
Date: Sat, 07 Nov 2026 09:54:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-tools-relpath 5/8]
 tools/objtool/include/objtool/cfi.h:9:10: fatal error: 'arch/cfi_regs.h' file
 not found
Message-ID: <202611070915.gan2Q1ya-lkp@intel.com>
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
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: hexagon-randconfig-r2102-20261107 (https://download.01.org/0day-ci/=
archive/20261107/202611070915.gan2Q1ya-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 0fa=
861dbbf46e5a75f621406fd91cb015d8754bf)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261107/202611070915.gan2Q1ya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611070915.gan2Q1ya-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from trace.c:6:
   In file included from tools/objtool/include/objtool/trace.h:9:
   In file included from tools/objtool/include/objtool/check.h:10:
>> tools/objtool/include/objtool/cfi.h:9:10: fatal error: 'arch/cfi_regs.h'=
 file not found
       9 | #include <arch/cfi_regs.h>
         |          ^~~~~~~~~~~~~~~~~
>> special.c:14:10: fatal error: 'arch/special.h' file not found
      14 | #include <arch/special.h>
         |          ^~~~~~~~~~~~~~~~
   In file included from builtin-check.c:15:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: 'arch/elf.h' fil=
e not found
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   In file included from weak.c:10:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: 'arch/elf.h' fil=
e not found
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   In file included from check.c:14:
>> tools/objtool/include/objtool/cfi.h:9:10: fatal error: 'arch/cfi_regs.h'=
 file not found
       9 | #include <arch/cfi_regs.h>
         |          ^~~~~~~~~~~~~~~~~
   In file included from elf.c:25:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: 'arch/elf.h' fil=
e not found
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   In file included from signal.c:14:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: 'arch/elf.h' fil=
e not found
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   In file included from objtool.c:16:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: 'arch/elf.h' fil=
e not found
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   1 error generated.
   1 error generated.
   In file included from klp-symid.c:26:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: 'arch/elf.h' fil=
e not found
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/trace.o] Erro=
r 1 shuffle=3D2572319931
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/objtool.o] Er=
ror 1 shuffle=3D2572319931
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/builtin-check=
.o] Error 1 shuffle=3D2572319931
   In file included from disas.c:9:
   In file included from tools/objtool/include/objtool/arch.h:11:
   In file included from tools/objtool/include/objtool/objtool.h:13:
>> tools/objtool/include/objtool/elf.h:19:10: fatal error: 'arch/elf.h' fil=
e not found
      19 | #include <arch/elf.h>
         |          ^~~~~~~~~~~~
   1 error generated.
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/klp-symid.o] =
Error 1 shuffle=3D2572319931
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/signal.o] Err=
or 1 shuffle=3D2572319931
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/weak.o] Error=
 1 shuffle=3D2572319931
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/special.o] Er=
ror 1 shuffle=3D2572319931
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/elf.o] Error =
1 shuffle=3D2572319931
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/disas.o] Erro=
r 1 shuffle=3D2572319931
   1 error generated.
   make[5]: *** [tools/build/Makefile.build:96: tools/objtool/check.o] Erro=
r 1 shuffle=3D2572319931
   make[5]: Target '__build' not remade because of errors.
   make[4]: *** [Makefile:125: tools/objtool/objtool-in.o] Error 2 shuffle=
=3D2572319931
   make[4]: Target 'all' not remade because of errors.
   make[3]: *** [Makefile:74: objtool] Error 2 shuffle=3D2572319931
   make[2]: *** [Makefile:1632: tools/objtool] Error 2 shuffle=3D2572319931
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3D2572319931
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3D2572319931
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
