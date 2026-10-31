Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793427329;
	b=2YEF0x5Y7FpeEEcgVNonhCoZ4UCE9OIA8eB136gCTOejzkcKcXOMyvkVE9EXXDXB6at3
	 08I3MVCKaqQLXuCUVDETmoZ1bA7OCSybI/a8dvTIYVQajz+uB+S6Vwvt+OZpakCXXAN8f
	 ZIdQY27nNYEUu4xMuAWFGf5JqkoRn+w/uj7+ncJc7hs/94Qeyo1W8gpD0T+i8LghfofHO
	 5p8Lpd7UWhhOWj/Arglrvs6I/7ph8kmtURJo47tDaMB1WdVzw6UjG6b9fJTbvQvLW7Z6b
	 jff9c66S4MT6j7s4RNckBWJtG9DG7SxCJgb57+K+kgO8ennNCq9LfYw7nKRtObWYfZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793427329;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=kWSv6A76N0H57vm4jIDBTDaOwbgQdyTJnw8Ew4KcK84=;
	b=rV7G2yOBKFFmXpaiAlU7/pR0vR76Ya2Hep6gmOO2mh38PmT1OA1sEKfqeRDB02VDIm0Y
	 v0NWwVmYM3BKSBV6wvgxyHs6GmVNn4sp/YYhbalifK1aan3cnwRxozjh/Ct9vI2/3LYz1
	 Vtp1QY20PSRQaBf5oBSVaN0RYAlCbrCZMJXURT0OXATkKQE2j7FqiWs6wWwmBz8vTItIT
	 QD8FXY49dIEo7pR9dwgcLKwcOlQ29Dle0VsbyeT4W/YPhNDXnScEpc9GRaunYYjsHC5sS
	 xqgIm38X8YGXqWnGX8X+vt1qY52GDuDBCkcfPM2ddddmndObw6ON0msZminAoiULB2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LkK80Yfs;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C27606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 06:15:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99C27606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LkK80Yfs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793427328; x=1824963328;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lfSdDkZlkgL+u4dqur1szpkcYbQc2n7bmjVOH5T+htQ=;
  b=LkK80Yfsj2U5TBaf9XezE/MHd9OdgB4rsQppTwZdzG+r93679jxdAEQM
   NWJmOqjBlSamo/tzxnT3+HyLKAkw9XPwOiXZoHh+nCBPhmodTlcTKJ99t
   YbGpez4fB8mOH1gXKsA1lw4K65KGfY4fcTqBhvr3qHteXDQt7AxxNm70H
   TmEL6Es5CC1ee11D8K8oZm7NNwECUFHy5MZovqDXN29Q/espOxH8uM9QL
   ZxJRRGUA5C2AXrTWSOPRFVy4jiOaEEnKALeVnfQ0Sok3paGps1Kks8vl0
   RMcvcp+RpmZpLawe5I3uWYTD/suZXVF9M1DtBZHeJuewVO/edMB9Kljmo
   Q==;
X-CSE-ConnectionGUID: jNl125qcSlClBim3ZweONw==
X-CSE-MsgGUID: 90mR31o6SgmyZvPtIQvw7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2202461"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2202461"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 23:15:27 -0700
X-CSE-ConnectionGUID: IkvW6rkpQ9SW9yg3krhOjQ==
X-CSE-MsgGUID: uHHBWo44Srez2sbyTRC6zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5615498"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 30 Oct 2026 23:15:26 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN2N9-000000005tD-1iPo;
	Sat, 31 Oct 2026 06:15:23 +0000
Date: Sat, 31 Oct 2026 07:14:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 19239 Killed                  clang
 -Wp,-MMD,drivers/net/ethernet/intel/ice/.ice_common.o.d -nostdinc
 -Iarch/um/include -I./arch/um/include/generated -Iinclude -I./include
 -Iarch/um/include/uapi -I./arch/um/include/generated/uapi -Iincl...
Message-ID: <202610310748.ka7ghXRr-lkp@intel.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "possibly OOM-killed compiler subprocess, not a=
 real build error"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>
CC: David Howells <dhowells@redhat.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a500a04d6f969318c05f46aedb6e73fc1963a00
commit: 488ef3560196ee10fc1c5547e1574a87068c3494 KEYS: Invert FINAL_PUT bit
date:   1 year, 5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 1 year, 5 months ago
config: um-randconfig-r2111-20261028 (https://download.01.org/0day-ci/archi=
ve/20261031/202610310748.ka7ghXRr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261031/202610310748.ka7ghXRr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 488ef3560196 ("KEYS: Invert FINAL_PUT bit")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610310748.ka7ghXRr-lkp@intel.com/

Note: functions only called from assembly code should be annotated with the=
 asmlinkage attribute
All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/ice/ice_common.c:4:
   In file included from drivers/net/ethernet/intel/ice/ice_common.h:9:
   In file included from drivers/net/ethernet/intel/ice/ice.h:12:
   In file included from include/linux/netdevice.h:38:
   In file included from include/net/net_namespace.h:43:
   In file included from include/linux/skbuff.h:17:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:12:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
>> /bin/bash: line 1: 19239 Killed                  clang -Wp,-MMD,drivers/=
net/ethernet/intel/ice/.ice_common.o.d -nostdinc -Iarch/um/include -I./arch=
/um/include/generated -Iinclude -I./include -Iarch/um/include/uapi -I./arch=
/um/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -inclu=
de include/linux/compiler-version.h -include include/linux/kconfig.h -inclu=
de include/linux/compiler_types.h -D__KERNEL__ --target=3Dx86_64-linux-gnu =
-fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-optimiza=
tion-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-argume=
nt -Iarch/x86/um -Iarch/x86/include -Iarch/x86/include/uapi -I./arch/x86/in=
clude/generated -I./arch/x86/include/generated/uapi -fmacro-prefix-map=3D=
=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char=
 -fno-common -fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno=
-3dnow -mno-avx -m32 -march=3Di686 -mtune=3Dpentium2 -ffreestanding -fprofi=
le-instr-generate -fcoverage-mapping -pg -D__arch_um__ -Iarch/um/include/sh=
ared -Iarch/x86/um/shared -Iarch/um/include/shared/skas -Dvmap=3Dkernel_vma=
p -Dlongjmp=3Dkernel_longjmp -Dsetjmp=3Dkernel_setjmp -Din6addr_loopback=3Dk=
ernel_in6addr_loopback -Din6addr_any=3Dkernel_in6addr_any -Dstrrchr=3Dkerne=
l_strrchr -D__close_range=3Dkernel__close_range -D_LARGEFILE64_SOURCE -Derr=
no=3Dkernel_errno -Dsigprocmask=3Dkernel_sigprocmask -Dmktime=3Dkernel_mkti=
me -fno-delete-null-pointer-checks -Os -fno-stack-protector -fno-omit-frame=
-pointer -fno-optimize-sibling-calls -fno-stack-clash-protection -fzero-cal=
l-used-regs=3Dused-gpr -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-s=
tack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-fun=
ction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dst=
rict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno=
-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-=
gnu -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=
=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunuse=
d -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-const-variable=
 -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-negative-value=
 -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parameter -g -gdwa=
rf-4 -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruct=
.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsig=
ned-char -Wundef -falign-functions=3D64 -Idrivers/net/ethernet/intel/ice -I=
drivers/net/ethernet/intel/ice -Idrivers/net/ethernet/intel/ice -DKBUILD_MO=
DFILE=3D'"drivers/net/ethernet/intel/ice/ice"' -DKBUILD_BASENAME=3D'"ice_co=
mmon"' -DKBUILD_MODNAME=3D'"ice"' -D__KBUILD_MODNAME=3Dkmod_ice -c -o drive=
rs/net/ethernet/intel/ice/ice_common.o drivers/net/ethernet/intel/ice/ice_c=
ommon.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
