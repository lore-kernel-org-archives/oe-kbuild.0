Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A772B340293
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 10:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433675; cv=none; b=sUNaJSXpiP0syrvQeut52zwgmjNHtUX00g3p8wyXgaCXMYi79FB91KPjHx2u2I3zKGgZwZJQmIsVp3wDR95FtX4BUyMaubK/cu0m8cmxfpKD5EkkDOeocF8GIU6/vuHsPDnpaGclaPegneui4DIGdCWiFuv4c642vwEHRFa4hlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433675; c=relaxed/simple;
	bh=HfXEbTN6kxRlo/782kxYiSQZfhn/t/jd/vEWflKMaQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=EOOBRBeq8n4wyJgtHShknCUHTaGPHrLJCzX4iNWl59dLp55m4dfcI2tmAFpLem22nvuMyajlabyfnmeqOm1DCVw75yoAdm1ru+DwZiXG6Rfk6kBav8y/PXc8IIj/q8yojGGMFp3TSzgjm46ZAhYgkXgeZsH5KXAtlIgNpPjZT8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZccuQHgm; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZccuQHgm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774433672; x=1805969672;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HfXEbTN6kxRlo/782kxYiSQZfhn/t/jd/vEWflKMaQs=;
  b=ZccuQHgmqbg2bOWBv/Jv+LpVbrp/YgcQ0LkO1l/sFeK2qAV7tXo9q/0Z
   gnGwFJm/kk2g35aMpyTPb/RegiZHTTV1CjN3Jzqmk961Y0/dmK9WSo5Zs
   wg15k1a3ARiOszztbBgi+O6qfW2o7LD33CS9ftOl9iYEuL13r/jzRmz32
   5PhwZXtiCIDzwj4Tk23v83gZyKsR21EsF9CqFNHK70AHs+O+wpRcxCet7
   C/jhDGYdHaMhMp8wyLeeJcCWG3/oHyGGqlxJgoc6TA5RKZeWATA2+KY8E
   9unaPyEC9UU1xCr0D+ZpgRoe6Vd2VSfsVr4tbgGD6iwI1N22PapCldhZv
   w==;
X-CSE-ConnectionGUID: JfxE186hSbKO/dCn6RogNQ==
X-CSE-MsgGUID: cxrux9MXQyumWzz4YJZzBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75488549"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75488549"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:14:31 -0700
X-CSE-ConnectionGUID: QS2Mp24hR8+E8WVcHplFhQ==
X-CSE-MsgGUID: s72sckmgQeadpI/l43m52g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="224893916"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 25 Mar 2026 03:14:30 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5LFr-0000000074R-2O6j;
	Wed, 25 Mar 2026 10:14:27 +0000
Date: Wed, 25 Mar 2026 11:14:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kunit-kselftests 3/18]
 include/uapi/linux/const.h:20:25: error: conversion from 'long long unsigned
 int' to 'long unsigned int' changes value from '4294967296' to '0'
Message-ID: <202603251113.Xklg4OPQ-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kunit-kselftests
head:   6816331cc815bfc31edb2ff1aaad0d882f0bf92b
commit: fb3ab97786e927b684927c71a78479a10f6d2995 [3/18] run-tests
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
325/202603251113.Xklg4OPQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260325/202603251113.Xklg4OPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603251113.Xklg4OPQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/vdso/const.h:5,
                    from include/vdso/bits.h:5,
                    from include/linux/bits.h:5,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/platform_device.h:13,
                    from test/ndtest.c:4:
   test/ndtest.c: In function 'ndtest_init':
>> include/uapi/linux/const.h:20:25: error: conversion from 'long long unsi=
gned int' to 'long unsigned int' changes value from '4294967296' to '0' [-W=
error=3Doverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:54:41: note: in expansion of macro '_AC'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   test/ndtest.c:949:39: note: in expansion of macro 'SZ_4G'
     949 |         if (gen_pool_add(ndtest_pool, SZ_4G, SZ_4G, NUMA_NO_NODE=
)) {
         |                                       ^~~~~
>> include/uapi/linux/const.h:20:25: error: conversion from 'long long unsi=
gned int' to 'size_t' {aka 'unsigned int'} changes value from '4294967296' =
to '0' [-Werror=3Doverflow]
      20 | #define __AC(X,Y)       (X##Y)
         |                         ^~~~~~
   include/uapi/linux/const.h:21:25: note: in expansion of macro '__AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~
   include/linux/sizes.h:54:41: note: in expansion of macro '_AC'
      54 | #define SZ_4G                           _AC(0x100000000, ULL)
         |                                         ^~~
   test/ndtest.c:949:46: note: in expansion of macro 'SZ_4G'
     949 |         if (gen_pool_add(ndtest_pool, SZ_4G, SZ_4G, NUMA_NO_NODE=
)) {
         |                                              ^~~~~
   cc1: all warnings being treated as errors
--
   In file included from arch/x86/include/asm/bug.h:193,
                    from arch/x86/include/asm/alternative.h:9,
                    from arch/x86/include/asm/nospec-branch.h:10,
                    from arch/x86/include/asm/irqflags.h:9,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/mmzone.h:8,
                    from include/linux/memremap.h:5,
                    from test/iomap.c:5:
   test/iomap.c: In function 'nfit_test_release_region':
>> test/iomap.c:236:41: error: format '%llx' expects argument of type 'long=
 long unsigned int', but argument 3 has type 'resource_size_t' {aka 'unsign=
ed int'} [-Werror=3Dformat=3D]
     236 |                                         "%s: start: %llx n: %llx=
 mismatch: %pr\n",
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
     237 |                                                 __func__, start,=
 n, res);
         |                                                           ~~~~~
         |                                                           |
         |                                                           resour=
ce_size_t {aka unsigned int}
   include/asm-generic/bug.h:133:31: note: in definition of macro '__WARN_p=
rintf'
     133 |                 __warn_printk(arg);                             =
        \
         |                               ^~~
   test/iomap.c:235:25: note: in expansion of macro 'WARN'
     235 |                         WARN(!res || resource_size(res) !=3D n,
         |                         ^~~~
   test/iomap.c:236:56: note: format string is defined here
     236 |                                         "%s: start: %llx n: %llx=
 mismatch: %pr\n",
         |                                                     ~~~^
         |                                                        |
         |                                                        long long=
 unsigned int
         |                                                     %x
   test/iomap.c:236:41: error: format '%llx' expects argument of type 'long=
 long unsigned int', but argument 4 has type 'resource_size_t' {aka 'unsign=
ed int'} [-Werror=3Dformat=3D]
     236 |                                         "%s: start: %llx n: %llx=
 mismatch: %pr\n",
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~
     237 |                                                 __func__, start,=
 n, res);
         |                                                                 =
 ~
         |                                                                 =
 |
         |                                                                 =
 resource_size_t {aka unsigned int}
   include/asm-generic/bug.h:133:31: note: in definition of macro '__WARN_p=
rintf'
     133 |                 __warn_printk(arg);                             =
        \
         |                               ^~~
   test/iomap.c:235:25: note: in expansion of macro 'WARN'
     235 |                         WARN(!res || resource_size(res) !=3D n,
         |                         ^~~~
   test/iomap.c:236:64: note: format string is defined here
     236 |                                         "%s: start: %llx n: %llx=
 mismatch: %pr\n",
         |                                                             ~~~^
         |                                                                |
         |                                                                l=
ong long unsigned int
         |                                                             %x
   In file included from include/asm-generic/bug.h:31:
   test/iomap.c: In function 'nfit_test_request_region':
>> include/linux/kern_levels.h:5:25: error: format '%llx' expects argument =
of type 'long long unsigned int', but argument 3 has type 'resource_size_t'=
 {aka 'unsigned int'} [-Werror=3Dformat=3D]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header=
 */
         |                         ^~~~~~
   include/linux/printk.h:134:25: note: in definition of macro 'no_printk'
     134 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages =
*/
         |                         ^~~~~~~~
   include/linux/printk.h:641:19: note: in expansion of macro 'KERN_DEBUG'
     641 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   test/iomap.c:260:33: note: in expansion of macro 'pr_debug'
     260 |                                 pr_debug("%s: start: %llx n: %ll=
x overflow: %pr\n",
         |                                 ^~~~~~~~
   include/linux/kern_levels.h:5:25: error: format '%llx' expects argument =
of type 'long long unsigned int', but argument 4 has type 'resource_size_t'=
 {aka 'unsigned int'} [-Werror=3Dformat=3D]
       5 | #define KERN_SOH        "\001"          /* ASCII Start Of Header=
 */
         |                         ^~~~~~
   include/linux/printk.h:134:25: note: in definition of macro 'no_printk'
     134 |                 _printk(fmt, ##__VA_ARGS__);            \
         |                         ^~~
   include/linux/kern_levels.h:15:25: note: in expansion of macro 'KERN_SOH'
      15 | #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages =
*/
         |                         ^~~~~~~~
   include/linux/printk.h:641:19: note: in expansion of macro 'KERN_DEBUG'
     641 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |                   ^~~~~~~~~~
   test/iomap.c:260:33: note: in expansion of macro 'pr_debug'
     260 |                                 pr_debug("%s: start: %llx n: %ll=
x overflow: %pr\n",
         |                                 ^~~~~~~~
   cc1: all warnings being treated as errors


vim +20 include/uapi/linux/const.h

9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
 6 =20
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
 7  /* Some constant macros are used in both assembler and
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
 8   * C code.  Therefore we cannot annotate them always with
6df95fd7ad9a842 include/linux/const.h      Randy Dunlap        2007-05-08  =
 9   * 'UL' and other type specifiers unilaterally.  We
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
10   * use the following macros to deal with this.
74ef649fe847fdf include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  =
11   *
74ef649fe847fdf include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  =
12   * Similarly, _AT() will cast an expression with a type in C, but
74ef649fe847fdf include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  =
13   * leave it unchanged in asm.
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
14   */
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
15 =20
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
16  #ifdef __ASSEMBLY__
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
17  #define _AC(X,Y)	X
74ef649fe847fdf include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  =
18  #define _AT(T,X)	X
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
19  #else
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02 @=
20  #define __AC(X,Y)	(X##Y)
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02 @=
21  #define _AC(X,Y)	__AC(X,Y)
74ef649fe847fdf include/linux/const.h      Jeremy Fitzhardinge 2008-01-30  =
22  #define _AT(T,X)	((T)(X))
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
23  #endif
9d291e787b2b71d include/asm-x86_64/const.h Vivek Goyal         2007-05-02  =
24 =20

:::::: The code at line 20 was first introduced by commit
:::::: 9d291e787b2b71d1b57e5fbb24ba9c70e748ed84 [PATCH] x86-64: Assembly sa=
fe page.h and pgtable.h

:::::: TO: Vivek Goyal <vgoyal@in.ibm.com>
:::::: CC: Andi Kleen <andi@basil.nowhere.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
