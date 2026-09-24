Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3362227B4F7
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 02:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790217142; cv=none; b=NPaklyneU6BvG7eCMb1R0cqaNqwY3VaouoQjagorZY7+jIDgsqQ9VFQYpb05UWe9m8I3diiLhCRKK4B0x7qN5u6p4NT6K3U52GUwpqLY7292vW8ugP8E0SQauuMYztZ2/8KxoMY2blNvo053s1UsM940I3cY2xgpq+ogc4WuVg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790217142; c=relaxed/simple;
	bh=7aGS/v/xCOBsNGLPSSsahcUDr2DbUNwA4JT3HgN3dHc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=b57xLSX+Nii+h016T0FW8QnUE/HYQ1Yz9LYekynF9EWawPhvwnyTlZkNISgGdyVN//jnNWK6rRAmBOahHyzQ4wts7Z67/kxN6Mq6gXMyfDigCleLwASDp0LEs9OTtldKZN0c/Vk/1unFY3aHplOx33PdYoDo+qLSgI5OY+R6RdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U8I7tYpv; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U8I7tYpv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790217140; x=1821753140;
  h=date:from:to:cc:subject:message-id;
  bh=7aGS/v/xCOBsNGLPSSsahcUDr2DbUNwA4JT3HgN3dHc=;
  b=U8I7tYpvbWyXLUMcT8wYCAfQucpr3gJ/9UQfeFWna4Pzboem/n+Jjj37
   +Gl2TWsLFM5U0tDbIzfQmMean2uj5uahyqQh5Kc3v/XhjaT97WYodjz6A
   oCFN+9XpxNiVvqL0k2E31x13n8Nzok9jyajvaXPJ02Yldu6DHL873ljfh
   dbi+O3MIPK43yV/BI1ow8aFIRhJMDC+19LggkAeo7Eotnx5llA3SoGekG
   t/nO+OlgvWE759MKu8J1N5ccFTjfzIqSK5Aa29GvnK0mTnHg8nZfsJRi5
   dGTswxK2aBZEV1VBALmu2hPVfMURwRxjKgzeIiWP8UR+T1G/5tuNcSDr/
   g==;
X-CSE-ConnectionGUID: Uzrl4yRbTyy93codHJBe2Q==
X-CSE-MsgGUID: vVpOBqtAQu662XLK7fmVjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1472190"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1472190"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 19:32:20 -0700
X-CSE-ConnectionGUID: 6pco1qbxSI6EW4zZcKl6+Q==
X-CSE-MsgGUID: USQ9I02fT0K01FNQtyE9hg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Sep 2026 19:32:19 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9ZFw-00000000I76-1wv1;
	Thu, 24 Sep 2026 02:32:16 +0000
Date: Thu, 24 Sep 2026 10:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/csky/include/asm/cmpxchg.h:61:58: warning: pointer type
 mismatch in conditional expression
Message-ID: <202609241240.n0RPvY2a-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Bradley-Morgan/lib-Add-two-byte-cmpxchg-emulation-function/20260922-173350, commit: 19b4372975153aee0e5b51bf524f34f5b5324400"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bradley Morgan <brads@mainlining.org>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Bradley-Morgan/lib-Add-two-byte-cmpxchg-emulation-function/20260922-173350
head:   1eef3d8b352da80a750e9fbfdb7a33b8a0109492
commit: 19b4372975153aee0e5b51bf524f34f5b5324400 csky: Emulate two-byte cmpxchg
date:   34 hours ago
:::::: branch date: 34 hours ago
:::::: commit date: 34 hours ago
config: csky-randconfig-r1307-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241240.n0RPvY2a-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241240.n0RPvY2a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609241240.n0RPvY2a-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/csky/include/asm/atomic.h:9,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/csky/include/asm/bitops.h:69,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/csky/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/fscrypt.h:16,
                    from fs/crypto/fscrypt_private.h:15,
                    from fs/crypto/hooks.c:10:
   fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>> arch/csky/include/asm/cmpxchg.h:61:58: warning: pointer type mismatch in conditional expression
      61 |         unsigned long __new = (unsigned long)(0 ? *(ptr) : (new));      \
         |                                                          ^
   arch/csky/include/asm/cmpxchg.h:91:10: note: in expansion of macro '__cmpxchg_relaxed'
      91 |         (__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
         |          ^~~~~~~~~~~~~~~~~
   include/linux/atomic.h:68:9: note: in expansion of macro 'arch_cmpxchg_relaxed'
      68 |         op##_relaxed(args);                                             \
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion of macro '__atomic_op_release'
      80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~

sparse warnings: (new ones prefixed by >>)
>> fs/notify/mark.c:852:13: sparse: sparse: incompatible types in conditional expression (different address spaces):
   fs/notify/mark.c:852:13: sparse:    struct fsnotify_mark_connector [noderef] __rcu *
   fs/notify/mark.c:852:13: sparse:    struct fsnotify_mark_connector *
   fs/notify/mark.c:852:13: sparse: sparse: cast from unknown type

vim +61 arch/csky/include/asm/cmpxchg.h

a0ae62806ff495b Guo Ren          2018-09-05  53  
a5fb82d7e2695e6 Mark Rutland     2021-05-25  54  #define arch_xchg_relaxed(ptr, x) \
c38425df20371ea Guo Ren          2020-12-20  55  		(__xchg_relaxed((x), (ptr), sizeof(*(ptr))))
a0ae62806ff495b Guo Ren          2018-09-05  56  
c38425df20371ea Guo Ren          2020-12-20  57  #define __cmpxchg_relaxed(ptr, old, new, size)			\
a0ae62806ff495b Guo Ren          2018-09-05  58  ({								\
a0ae62806ff495b Guo Ren          2018-09-05  59  	__typeof__(ptr) __ptr = (ptr);				\
19b4372975153ae Bradley Morgan   2026-09-22  60  	unsigned long __old = (unsigned long)(0 ? *(ptr) : (old));	\
19b4372975153ae Bradley Morgan   2026-09-22 @61  	unsigned long __new = (unsigned long)(0 ? *(ptr) : (new));	\
19b4372975153ae Bradley Morgan   2026-09-22  62  	unsigned long __tmp;					\
a0ae62806ff495b Guo Ren          2018-09-05  63  	__typeof__(*(ptr)) __ret;				\
a0ae62806ff495b Guo Ren          2018-09-05  64  	switch (size) {						\
5800e77d88c0cd9 Paul E. McKenney 2024-03-27  65  	case 1:							\
19b4372975153ae Bradley Morgan   2026-09-22  66  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *)__ptr, __old, __new); \
19b4372975153ae Bradley Morgan   2026-09-22  67  		break;						\
19b4372975153ae Bradley Morgan   2026-09-22  68  	case 2:							\
19b4372975153ae Bradley Morgan   2026-09-22  69  		__ret = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *)__ptr, __old, __new); \
5800e77d88c0cd9 Paul E. McKenney 2024-03-27  70  		break;						\
a0ae62806ff495b Guo Ren          2018-09-05  71  	case 4:							\
a0ae62806ff495b Guo Ren          2018-09-05  72  		asm volatile (					\
a0ae62806ff495b Guo Ren          2018-09-05  73  		"1:	ldex.w		%0, (%3) \n"		\
a0ae62806ff495b Guo Ren          2018-09-05  74  		"	cmpne		%0, %4   \n"		\
a0ae62806ff495b Guo Ren          2018-09-05  75  		"	bt		2f       \n"		\
a0ae62806ff495b Guo Ren          2018-09-05  76  		"	mov		%1, %2   \n"		\
a0ae62806ff495b Guo Ren          2018-09-05  77  		"	stex.w		%1, (%3) \n"		\
a0ae62806ff495b Guo Ren          2018-09-05  78  		"	bez		%1, 1b   \n"		\
a0ae62806ff495b Guo Ren          2018-09-05  79  		"2:				 \n"		\
a0ae62806ff495b Guo Ren          2018-09-05  80  			: "=&r" (__ret), "=&r" (__tmp)		\
a0ae62806ff495b Guo Ren          2018-09-05  81  			: "r" (__new), "r"(__ptr), "r"(__old)	\
a0ae62806ff495b Guo Ren          2018-09-05  82  			:);					\
a0ae62806ff495b Guo Ren          2018-09-05  83  		break;						\
a0ae62806ff495b Guo Ren          2018-09-05  84  	default:						\
f940dc0f225183c Guo Ren          2022-07-31  85  		BUILD_BUG();					\
a0ae62806ff495b Guo Ren          2018-09-05  86  	}							\
a0ae62806ff495b Guo Ren          2018-09-05  87  	__ret;							\
a0ae62806ff495b Guo Ren          2018-09-05  88  })
a0ae62806ff495b Guo Ren          2018-09-05  89  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
