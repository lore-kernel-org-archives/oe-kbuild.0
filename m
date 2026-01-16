Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDBB030FC08
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jan 2026 00:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768525108; cv=none; b=iiiNvFf2YKkSRl+SfJuMHYrg/S1Eb0zaYX86tLJLLnZsLuTriBiie9GET1QJeJ8aUjodA9fbqk6djEzEHtLlcXuTCs38dwg8zRcBuxnE0eooMR+InIleVR9Ls7V4J6LkL8QLKAf8xojpiuEYD7ik+WWlilfZgODQXwSWYk3UjsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768525108; c=relaxed/simple;
	bh=+h3xmiB7qmbsQWsAhvI/QsMMNoCm3zefreJBa5CMAFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=h13HiQE1PF93RAiyLnyVRI1xhBg6Bp/IGFnzWWA0C/lMcwCvleWf2MhaLUgVKz2EXnemrHsZJHWsk12zWJLWV5DzP7+CvON43to9Qvy/Kh9UC2vdV8xyOGWffljnFwmEaVhzGz3nQbdvwX/cawhIboQM9aHdx73vWeAsfrfS4Yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bSJVzhwJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bSJVzhwJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768525107; x=1800061107;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+h3xmiB7qmbsQWsAhvI/QsMMNoCm3zefreJBa5CMAFg=;
  b=bSJVzhwJdPQEfnY9x8xnLIiHvEmFGjDp0FxfTiFXAmJnGlivX7/Hrpcx
   Or6PjicOgjnpgVo0XSdwHTCb5tStqfCOyYSzSAyZYFXbhGqyPX65lVMUI
   ZX1KiAuJ7+rTpKms5sOdD88c+OZbWHVniWZ13lwDmS2YCJC26z4QmQ/+g
   NhMKm19Hfm0CLL+F6zfBNU/uAVyV5l0SYF8hZ3zlyhUb9/wNKqC2nxJlT
   j/aCydNEMqBYDAsR/9dJ9dU1mX5pta6tw0w3GIY5TcCrGZOwH6UckztTg
   NLQrlErN9Ri4G0vMXvCgCKLyDs+p50WLPcftxvc2+sGBGAv+Nf69Pw7n0
   A==;
X-CSE-ConnectionGUID: pUKTCPSHRn6PtISu3WJWJA==
X-CSE-MsgGUID: WizZZjJ4TDKQagBZsRp9hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="87417689"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; 
   d="scan'208";a="87417689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 16:58:26 -0800
X-CSE-ConnectionGUID: xU9GiTpYR0GXDyMOcwyXew==
X-CSE-MsgGUID: 1H5MA+Y4Tj2Otd3WPQtpAw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Jan 2026 16:58:25 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgYAQ-00000000KBA-47UO;
	Fri, 16 Jan 2026 00:58:22 +0000
Date: Fri, 16 Jan 2026 08:57:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/bits-per-long-check 5/6]
 include/asm-generic/bitsperlong.h:16:2: sparse: sparse: Inconsistent word
 size. Check asm/bitsperlong.h
Message-ID: <202601160814.ChBOth9e-lkp@intel.com>
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
sm-generic/bitsperlong.h:16:2: sparse: sparse: Inconsistent word size. Chec=
k asm/bitsperlong.h"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/bits-per-long-check
head:   5f5f4e8866517fab6df5dd9e5371657b2cfd5263
commit: 5a087ccf80596cebd4b934d454f222fb4b9df632 [5/6] BUILD_VDSO
:::::: branch date: 14 hours ago
:::::: commit date: 15 hours ago
config: sparc64-randconfig-r111-20260116 (https://download.01.org/0day-ci/a=
rchive/20260116/202601160814.ChBOth9e-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260116/202601160814.ChBOth9e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601160814.ChBOth9e-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through=
 arch/sparc/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll=
64.h, ...):
>> include/asm-generic/bitsperlong.h:16:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through=
 arch/sparc/include/asm/atomic.h, include/linux/atomic.h, include/asm-gener=
ic/bitops/lock.h, ...):
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:37:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:38:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:53:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:53:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:53:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:53:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:54:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:54:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:54:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:54:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:55:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:55:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:55:1: sparse: sparse: Expected ) in f=
unction declarator
   arch/sparc/include/asm/atomic_64.h:55:1: sparse: sparse: got *
   arch/sparc/include/asm/atomic_64.h:70:46: sparse: sparse: Expected ) in =
function declarator
   arch/sparc/include/asm/atomic_64.h:70:46: sparse: sparse: got *
   arch/sparc/vdso/vdso32/vclock_gettime.c: note: in included file (through=
 include/linux/atomic.h, include/asm-generic/bitops/lock.h, arch/sparc/incl=
ude/asm/bitops_64.h, ...):
   include/linux/atomic/atomic-arch-fallback.h:2581:36: sparse: sparse: Exp=
ected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2581:36: sparse: sparse: got=
 *
   include/linux/atomic/atomic-arch-fallback.h:2583:16: sparse: sparse: Exp=
ected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2583:16: sparse: sparse: got=
 !
   include/linux/atomic/atomic-arch-fallback.h:2583:16: sparse: sparse: Try=
ing to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2583:16: sparse: sparse: Exp=
ected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2583:16: sparse: sparse: got=
 }
   include/linux/atomic/atomic-arch-fallback.h:2583:16: sparse: sparse: Exp=
ected ) in nested declarator
   include/linux/atomic/atomic-arch-fallback.h:2583:16: sparse: sparse: got=
 volatile
   include/linux/atomic/atomic-arch-fallback.h:2583:16: sparse: sparse: Try=
ing to use reserved word 'const' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2583:16: sparse: sparse: Exp=
ected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2583:16: sparse: sparse: got=
 }
   include/linux/atomic/atomic-arch-fallback.h:2584:1: sparse: sparse: Expe=
cted ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2584:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2604:13: sparse: sparse: Exp=
ected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2604:13: sparse: sparse: got=
 (
   include/linux/atomic/atomic-arch-fallback.h:2604:9: sparse: sparse: Tryi=
ng to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Exp=
ected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got=
 !
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Try=
ing to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Exp=
ected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got=
 }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Exp=
ected ) in nested declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got=
 volatile
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Try=
ing to use reserved word 'const' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Exp=
ected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got=
 }
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Exp=
ected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got=
 *
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Try=
ing to use reserved word 'typeof' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: Exp=
ected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2605:23: sparse: sparse: got=
 }
   include/linux/atomic/atomic-arch-fallback.h:2606:9: sparse: sparse: Expe=
cted ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2606:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2609:9: sparse: sparse: Expe=
cted ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2609:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2613:1: sparse: sparse: Expe=
cted ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2613:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: Expe=
cted ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: got !
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: Tryi=
ng to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: Expe=
cted ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: Tryi=
ng to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: Expe=
cted ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: got {
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: Expe=
cted ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: Expe=
cted ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2629:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: Expe=
cted ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2630:1: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: Try=
ing to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: Exp=
ected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: got=
 {
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: Exp=
ected ) in function declarator
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: got=
 !
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: Try=
ing to use reserved word 'if' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: Exp=
ected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: got=
 }
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: Try=
ing to use reserved word 'do' as identifier
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: Exp=
ected ; at end of declaration
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: got=
 {
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: Exp=
ected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: got=
 }
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: Exp=
ected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: got=
 }
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: Exp=
ected ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2650:17: sparse: sparse: got=
 }
   include/linux/atomic/atomic-arch-fallback.h:2651:9: sparse: sparse: Expe=
cted ; at the end of type declaration
   include/linux/atomic/atomic-arch-fallback.h:2651:9: sparse: sparse: got }
   include/linux/atomic/atomic-arch-fallback.h:2654:9: sparse: sparse: Expe=
cted ; at the end of type declaration

vim +16 include/asm-generic/bitsperlong.h

c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  13 =20
5a087ccf80596c Thomas Wei=C3=9Fschuh 2026-01-14  14  #ifndef BUILD_VDSO
5a087ccf80596c Thomas Wei=C3=9Fschuh 2026-01-14  15  #if BITS_PER_LONG !=3D =
__BITS_PER_LONG
c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13 @16  #error Inconsistent word si=
ze. Check asm/bitsperlong.h
c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  17  #endif
5a087ccf80596c Thomas Wei=C3=9Fschuh 2026-01-14  18  #endif
c31ae4bb4a9fa4 Arnd Bergmann    2009-05-13  19 =20

:::::: The code at line 16 was first introduced by commit
:::::: c31ae4bb4a9fa4606a74c0a4fb61b74f804e861e asm-generic: introduce asm/=
bitsperlong.h

:::::: TO: Arnd Bergmann <arnd@arndb.de>
:::::: CC: Arnd Bergmann <arnd@klappe2.(none)>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
