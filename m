Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689521871
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Dec 2022 15:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672240343; x=1703776343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/9wOH6CtL9P7oBdb+C81+na/umgJVgJIgv1lrmGuVho=;
  b=ixdoBIrNy2wz8C26hy34FWYRC7uMMH5rC3TYuESudBQyOmCzM40qX14I
   LkHV9fT70lHKJg8X+Lqkb90TsotUL5m6A4XGjfHRUNaoQBOK/hp8+otPt
   Qp/0+JtbcZGneu3OYy2sMBaDW2t8FygbZKmOTth+UlXaLJW8puRi8t+1V
   6SloDRCzbjsz6P8LR2tJvcKU33GtweG90VDtetf49UDcM572PWYXvf/7p
   ybjfCBu6KhJRVndm3t3wl/44rCRGCD2M+ARhyEJC+uoyYojbN9wEZUebB
   0sYQLFPMj3HN4SFNSFmdoYGeYPj1JF2bRUba0E3C9bUmxAtSk/g2LY9qN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="319603251"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="319603251"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2022 07:12:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10574"; a="982112161"
X-IronPort-AV: E=Sophos;i="5.96,281,1665471600"; 
   d="scan'208";a="982112161"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 Dec 2022 07:12:20 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pAY6N-000Fkf-2m;
	Wed, 28 Dec 2022 15:12:19 +0000
Date: Wed, 28 Dec 2022 23:12:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [peterz-queue:core/wip-u128 14/14]
 include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates
 bits from constant value (deadbeefdeafcafe becomes fe)
Message-ID: <202212282351.i3B3Lo4S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="PVrvXL0mHcWWFJPs"
Content-Disposition: inline


--PVrvXL0mHcWWFJPs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Boqun Feng <boqun.feng@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/wip-u128
head:   c05419246aa69cd3ff3f929e232ebed1b5b49c2d
commit: c05419246aa69cd3ff3f929e232ebed1b5b49c2d [14/14] atomic: Add test cases for cmpxchg128 family
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: sparc64-randconfig-s031-20221226
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=c05419246aa69cd3ff3f929e232ebed1b5b49c2d
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/wip-u128
        git checkout c05419246aa69cd3ff3f929e232ebed1b5b49c2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   lib/atomic64_test.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, arch/sparc/include/asm/atomic.h, ...):
   arch/sparc/include/asm/cmpxchg_64.h:95:36: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes beef)
   arch/sparc/include/asm/cmpxchg_64.h:95:36: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes beef)
   arch/sparc/include/asm/cmpxchg_64.h:95:36: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes beef)
   arch/sparc/include/asm/cmpxchg_64.h:95:36: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes beef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (ffffffffaaa31337 becomes 37)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (ffffffffaaa31337 becomes 37)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (ffffffffaaa31337 becomes 37)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (ffffffffaaa31337 becomes 37)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (ffffffffaaa31337 becomes 37)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (ffffffffaaa31337 becomes 37)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (ffffffffaaa31337 becomes 37)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (ffffffffaaa31337 becomes 37)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (ffffffffdeadbeef becomes ef)
   arch/sparc/include/asm/cmpxchg_64.h:95:36: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes cafe)
   arch/sparc/include/asm/cmpxchg_64.h:97:36: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:95:36: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes cafe)
   arch/sparc/include/asm/cmpxchg_64.h:97:36: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:95:36: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes cafe)
   arch/sparc/include/asm/cmpxchg_64.h:97:36: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:95:36: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes cafe)
   arch/sparc/include/asm/cmpxchg_64.h:97:36: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes d)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes d)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes d)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes d)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes 1)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes 1)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes 1)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes 1)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (faceabadf00df001 becomes f00df001)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes d)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   lib/atomic64_test.c: note: in included file (through arch/sparc/include/asm/cmpxchg_64.h, arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, ...):
>> include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
>> include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes cafe)
>> include/asm-generic/cmpxchg-local.h:38:44: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   lib/atomic64_test.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, arch/sparc/include/asm/atomic.h, ...):
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes d)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   lib/atomic64_test.c: note: in included file (through arch/sparc/include/asm/cmpxchg_64.h, arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, ...):
>> include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
>> include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes cafe)
>> include/asm-generic/cmpxchg-local.h:38:44: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   lib/atomic64_test.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, arch/sparc/include/asm/atomic.h, ...):
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes d)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes c001d00d)
   arch/sparc/include/asm/cmpxchg_64.h:163:56: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   lib/atomic64_test.c: note: in included file (through arch/sparc/include/asm/cmpxchg_64.h, arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, ...):
>> include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
>> include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes cafe)
>> include/asm-generic/cmpxchg-local.h:38:44: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes deafcafe)
   lib/atomic64_test.c: note: in included file (through arch/sparc/include/asm/cmpxchg.h, arch/sparc/include/asm/atomic_64.h, arch/sparc/include/asm/atomic.h, ...):
   arch/sparc/include/asm/cmpxchg_64.h:161:50: sparse: sparse: cast truncates bits from constant value (aaa31337c001d00d becomes d)
   arch/sparc/include/asm/cmpxchg_64.h:161:55: sparse: sparse: cast truncates bits from constant value (deadbeefdeafcafe becomes fe)
   arch/sparc/include/asm/cmpxchg_64.h:163:51: sparse: sparse: too many warnings

vim +30 include/asm-generic/cmpxchg-local.h

068fbad288a2c1 Mathieu Desnoyers 2008-02-07   7  
aa93685afbefa0 Behan Webster     2012-11-20   8  extern unsigned long wrong_size_cmpxchg(volatile void *ptr)
aa93685afbefa0 Behan Webster     2012-11-20   9  	__noreturn;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  10  
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  11  /*
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  12   * Generic version of __cmpxchg_local (disables interrupts). Takes an unsigned
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  13   * long parameter, supporting various types of architectures.
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  14   */
6988631bdfddce Mark Rutland      2021-05-25  15  static inline unsigned long __generic_cmpxchg_local(volatile void *ptr,
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  16  		unsigned long old, unsigned long new, int size)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  17  {
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  18  	unsigned long flags, prev;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  19  
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  20  	/*
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  21  	 * Sanity checking, compile-time.
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  22  	 */
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  23  	if (size == 8 && sizeof(unsigned long) != 8)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  24  		wrong_size_cmpxchg(ptr);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  25  
5042afe7fe3239 Ingo Molnar       2009-07-03  26  	raw_local_irq_save(flags);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  27  	switch (size) {
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  28  	case 1: prev = *(u8 *)ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  29  		if (prev == old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07 @30  			*(u8 *)ptr = (u8)new;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  31  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  32  	case 2: prev = *(u16 *)ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  33  		if (prev == old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07 @34  			*(u16 *)ptr = (u16)new;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  35  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  36  	case 4: prev = *(u32 *)ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  37  		if (prev == old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07 @38  			*(u32 *)ptr = (u32)new;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  39  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  40  	case 8: prev = *(u64 *)ptr;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  41  		if (prev == old)
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  42  			*(u64 *)ptr = (u64)new;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  43  		break;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  44  	default:
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  45  		wrong_size_cmpxchg(ptr);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  46  	}
5042afe7fe3239 Ingo Molnar       2009-07-03  47  	raw_local_irq_restore(flags);
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  48  	return prev;
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  49  }
068fbad288a2c1 Mathieu Desnoyers 2008-02-07  50  

:::::: The code at line 30 was first introduced by commit
:::::: 068fbad288a2c18b75b0425fb56d241f018a1cb5 Add cmpxchg_local to asm-generic for per cpu atomic operations

:::::: TO: Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--PVrvXL0mHcWWFJPs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/sparc64 6.2.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="sparc64-linux-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_COMPAT=y
CONFIG_WATCH_QUEUE=y
# CONFIG_CROSS_MEMORY_ATTACH is not set
CONFIG_USELIB=y
CONFIG_HAVE_ARCH_AUDITSYSCALL=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS=y
CONFIG_GENERIC_MSI_IRQ=y
CONFIG_SPARSE_IRQ=y
# CONFIG_GENERIC_IRQ_DEBUGFS is not set
# end of IRQ subsystem

CONFIG_ARCH_CLOCKSOURCE_DATA=y
CONFIG_GENERIC_TIME_VSYSCALL=y
CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
CONFIG_NO_HZ_IDLE=y
CONFIG_CONTEXT_TRACKING_USER=y
CONFIG_CONTEXT_TRACKING_USER_FORCE=y
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

CONFIG_BPF=y
CONFIG_HAVE_EBPF_JIT=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
# CONFIG_BPF_JIT is not set
# CONFIG_BPF_UNPRIV_DEFAULT_OFF is not set
# end of BPF subsystem

CONFIG_PREEMPT_BUILD=y
# CONFIG_PREEMPT_NONE is not set
# CONFIG_PREEMPT_VOLUNTARY is not set
CONFIG_PREEMPT=y
CONFIG_PREEMPT_COUNT=y
CONFIG_PREEMPTION=y

#
# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
# CONFIG_TICK_CPU_ACCOUNTING is not set
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
CONFIG_PREEMPT_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_NEED_SRCU_NMI_SAFE=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_IKHEADERS=m

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_HAS_INT128=y
CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
CONFIG_BLK_CGROUP=y
# CONFIG_CGROUP_SCHED is not set
# CONFIG_CGROUP_PIDS is not set
# CONFIG_CGROUP_RDMA is not set
# CONFIG_CGROUP_FREEZER is not set
# CONFIG_CGROUP_HUGETLB is not set
CONFIG_CGROUP_DEVICE=y
# CONFIG_CGROUP_CPUACCT is not set
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
CONFIG_CGROUP_MISC=y
# CONFIG_CGROUP_DEBUG is not set
CONFIG_SOCK_CGROUP_DATA=y
# CONFIG_NAMESPACES is not set
# CONFIG_CHECKPOINT_RESTORE is not set
# CONFIG_SCHED_AUTOGROUP is not set
# CONFIG_SYSFS_DEPRECATED is not set
CONFIG_RELAY=y
# CONFIG_BLK_DEV_INITRD is not set
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
CONFIG_INITRAMFS_PRESERVE_MTIME=y
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_HAVE_UID16=y
CONFIG_SYSCTL_EXCEPTION_TRACE=y
CONFIG_EXPERT=y
# CONFIG_UID16 is not set
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
# CONFIG_POSIX_TIMERS is not set
# CONFIG_PRINTK is not set
# CONFIG_BUG is not set
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
# CONFIG_AIO is not set
CONFIG_IO_URING=y
CONFIG_ADVISE_SYSCALLS=y
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_SELFTEST is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_KCMP=y
# CONFIG_EMBEDDED is not set
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
# CONFIG_DEBUG_PERF_USE_VMALLOC is not set
# end of Kernel Performance Events And Counters

CONFIG_PROFILING=y
CONFIG_TRACEPOINTS=y
# end of General setup

CONFIG_64BIT=y
CONFIG_SPARC=y
CONFIG_SPARC64=y
CONFIG_ARCH_PROC_KCORE_TEXT=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_ARCH_ATU=y
CONFIG_STACKTRACE_SUPPORT=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_ARCH_HIBERNATION_POSSIBLE=y
CONFIG_AUDIT_ARCH=y
CONFIG_MMU=y
CONFIG_PGTABLE_LEVELS=4
CONFIG_ARCH_SUPPORTS_UPROBES=y

#
# Processor type and features
#
# CONFIG_SMP is not set
# CONFIG_HZ_100 is not set
CONFIG_HZ_250=y
# CONFIG_HZ_300 is not set
# CONFIG_HZ_1000 is not set
CONFIG_HZ=250
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_ARCH_MAY_HAVE_PC_FDC=y
CONFIG_EARLYFB=y

#
# CPU Frequency scaling
#
CONFIG_CPU_FREQ=y
CONFIG_CPU_FREQ_GOV_ATTR_SET=y
CONFIG_CPU_FREQ_GOV_COMMON=y
# CONFIG_CPU_FREQ_STAT is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE is not set
CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=y
# CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND is not set
# CONFIG_CPU_FREQ_DEFAULT_GOV_CONSERVATIVE is not set
CONFIG_CPU_FREQ_GOV_PERFORMANCE=y
CONFIG_CPU_FREQ_GOV_POWERSAVE=y
CONFIG_CPU_FREQ_GOV_USERSPACE=y
# CONFIG_CPU_FREQ_GOV_ONDEMAND is not set
CONFIG_CPU_FREQ_GOV_CONSERVATIVE=y

#
# CPU frequency scaling drivers
#
# CONFIG_SPARC_US3_CPUFREQ is not set
CONFIG_SPARC_US2E_CPUFREQ=m
# end of CPU Frequency scaling

CONFIG_US3_MC=y
CONFIG_ARCH_SPARSEMEM_ENABLE=y
CONFIG_ARCH_SPARSEMEM_DEFAULT=y
CONFIG_ARCH_FORCE_MAX_ORDER=13
CONFIG_HIBERNATE_CALLBACKS=y
CONFIG_HIBERNATION=y
CONFIG_HIBERNATION_SNAPSHOT_DEV=y
CONFIG_PM_STD_PARTITION=""
CONFIG_PM_SLEEP=y
CONFIG_PM_AUTOSLEEP=y
# CONFIG_PM_USERSPACE_AUTOSLEEP is not set
# CONFIG_PM_WAKELOCKS is not set
CONFIG_PM=y
# CONFIG_PM_DEBUG is not set
CONFIG_PM_GENERIC_DOMAINS=y
CONFIG_WQ_POWER_EFFICIENT_DEFAULT=y
CONFIG_PM_GENERIC_DOMAINS_SLEEP=y
CONFIG_PM_GENERIC_DOMAINS_OF=y
# CONFIG_CMDLINE_BOOL is not set
# end of Processor type and features

#
# Bus options (PCI etc.)
#
CONFIG_SBUS=y
CONFIG_SBUSCHAR=y
CONFIG_SUN_LDOMS=y
CONFIG_SUN_OPENPROMFS=m
CONFIG_SPARC64_PCI=y
CONFIG_SPARC64_PCI_MSI=y
# end of Bus options (PCI etc.)

CONFIG_COMPAT=y

#
# Misc Linux/SPARC drivers
#
CONFIG_SUN_OPENPROMIO=y
# CONFIG_OBP_FLASH is not set
# CONFIG_TADPOLE_TS102_UCTRL is not set
CONFIG_BBC_I2C=y
# CONFIG_ENVCTRL is not set
CONFIG_DISPLAY7SEG=y
# CONFIG_ORACLE_DAX is not set
# end of Misc Linux/SPARC drivers

#
# General architecture-dependent options
#
CONFIG_CRASH_CORE=y
# CONFIG_KPROBES is not set
CONFIG_JUMP_LABEL=y
# CONFIG_STATIC_KEYS_SELFTEST is not set
CONFIG_HAVE_64BIT_ALIGNED_ACCESS=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_HAVE_NMI=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_HAVE_NMI_WATCHDOG=y
CONFIG_HAVE_ARCH_JUMP_LABEL=y
CONFIG_MMU_GATHER_NO_FLUSH_CACHE=y
CONFIG_MMU_GATHER_MERGE_VMAS=y
CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=y
CONFIG_ARCH_WANT_OLD_COMPAT_IPC=y
CONFIG_HAVE_ARCH_SECCOMP=y
CONFIG_SECCOMP=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_CONTEXT_TRACKING_USER=y
CONFIG_HAVE_TIF_NOHZ=y
CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=y
CONFIG_SOFTIRQ_ON_OWN_STACK=y
CONFIG_ALTERNATE_USER_ADDRESS_SPACE=y
CONFIG_HAVE_EXIT_THREAD=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ODD_RT_SIGACTION=y
CONFIG_OLD_SIGSUSPEND=y
CONFIG_COMPAT_OLD_SIGACTION=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_CPU_NO_EFFICIENT_FFS=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
# end of GCOV-based kernel profiling

CONFIG_FUNCTION_ALIGNMENT=0
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
CONFIG_MODULES=y
# CONFIG_MODULE_FORCE_LOAD is not set
# CONFIG_MODULE_UNLOAD is not set
# CONFIG_MODVERSIONS is not set
# CONFIG_MODULE_SRCVERSION_ALL is not set
# CONFIG_MODULE_SIG is not set
# CONFIG_MODULE_COMPRESS_NONE is not set
CONFIG_MODULE_COMPRESS_GZIP=y
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
# CONFIG_MODULE_DECOMPRESS is not set
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
CONFIG_MODULES_TREE_LOOKUP=y
CONFIG_BLOCK=y
CONFIG_BLOCK_LEGACY_AUTOLOAD=y
CONFIG_BLK_RQ_ALLOC_TIME=y
CONFIG_BLK_DEV_BSG_COMMON=y
CONFIG_BLK_DEV_BSGLIB=y
CONFIG_BLK_DEV_INTEGRITY=y
CONFIG_BLK_DEV_INTEGRITY_T10=y
CONFIG_BLK_DEV_ZONED=y
# CONFIG_BLK_DEV_THROTTLING is not set
# CONFIG_BLK_WBT is not set
# CONFIG_BLK_CGROUP_IOLATENCY is not set
CONFIG_BLK_CGROUP_IOCOST=y
CONFIG_BLK_CGROUP_IOPRIO=y
# CONFIG_BLK_DEBUG_FS is not set
CONFIG_BLK_SED_OPAL=y
# CONFIG_BLK_INLINE_ENCRYPTION is not set

#
# Partition Types
#
CONFIG_PARTITION_ADVANCED=y
# CONFIG_ACORN_PARTITION is not set
# CONFIG_AIX_PARTITION is not set
# CONFIG_OSF_PARTITION is not set
CONFIG_AMIGA_PARTITION=y
CONFIG_ATARI_PARTITION=y
CONFIG_MAC_PARTITION=y
# CONFIG_MSDOS_PARTITION is not set
CONFIG_LDM_PARTITION=y
CONFIG_LDM_DEBUG=y
# CONFIG_SGI_PARTITION is not set
CONFIG_ULTRIX_PARTITION=y
CONFIG_SUN_PARTITION=y
# CONFIG_KARMA_PARTITION is not set
CONFIG_EFI_PARTITION=y
# CONFIG_SYSV68_PARTITION is not set
# CONFIG_CMDLINE_PARTITION is not set
# end of Partition Types

CONFIG_BLOCK_COMPAT=y
CONFIG_BLK_MQ_PCI=y
CONFIG_BLK_MQ_VIRTIO=y
CONFIG_BLK_PM=y

#
# IO Schedulers
#
CONFIG_MQ_IOSCHED_DEADLINE=y
CONFIG_MQ_IOSCHED_KYBER=y
# CONFIG_IOSCHED_BFQ is not set
# end of IO Schedulers

CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_ARCH_USE_QUEUED_SPINLOCKS=y
CONFIG_ARCH_USE_QUEUED_RWLOCKS=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF=y
CONFIG_COMPAT_BINFMT_ELF=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#
CONFIG_SWAP=y
# CONFIG_ZSWAP is not set
CONFIG_ZSMALLOC=y
CONFIG_ZSMALLOC_STAT=y

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
CONFIG_SLUB=y
# CONFIG_SLOB_DEPRECATED is not set
CONFIG_SLUB_TINY=y
CONFIG_SLAB_MERGE_DEFAULT=y
# end of SLAB allocator options

CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
# CONFIG_COMPAT_BRK is not set
CONFIG_SPARSEMEM=y
CONFIG_SPARSEMEM_EXTREME=y
CONFIG_SPARSEMEM_VMEMMAP_ENABLE=y
# CONFIG_SPARSEMEM_VMEMMAP is not set
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_PHYS_ADDR_T_64BIT=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_TRANSPARENT_HUGEPAGE=y
CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=y
# CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
CONFIG_READ_ONLY_THP_FOR_FS=y
CONFIG_NEED_PER_CPU_KM=y
CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=y
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=y
CONFIG_HAVE_SETUP_PER_CPU_AREA=y
CONFIG_CMA=y
CONFIG_CMA_DEBUG=y
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_SYSFS=y
CONFIG_CMA_AREAS=7
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_VM_EVENT_COUNTERS=y
CONFIG_PERCPU_STATS=y
CONFIG_GUP_TEST=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
# CONFIG_ANON_VMA_NAME is not set
CONFIG_USERFAULTFD=y
CONFIG_LRU_GEN=y
# CONFIG_LRU_GEN_ENABLED is not set
CONFIG_LRU_GEN_STATS=y

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
CONFIG_PCI=y
CONFIG_PCI_DOMAINS=y
CONFIG_PCI_SYSCALL=y
# CONFIG_PCIEPORTBUS is not set
CONFIG_PCIEASPM=y
CONFIG_PCIEASPM_DEFAULT=y
# CONFIG_PCIEASPM_POWERSAVE is not set
# CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
# CONFIG_PCIEASPM_PERFORMANCE is not set
CONFIG_PCIE_PTM=y
CONFIG_PCI_MSI=y
CONFIG_PCI_MSI_ARCH_FALLBACKS=y
# CONFIG_PCI_QUIRKS is not set
CONFIG_PCI_DEBUG=y
CONFIG_PCI_STUB=m
CONFIG_PCI_ATS=y
CONFIG_PCI_ECAM=y
CONFIG_PCI_BRIDGE_EMUL=y
# CONFIG_PCI_IOV is not set
CONFIG_PCI_PRI=y
# CONFIG_PCI_PASID is not set
# CONFIG_PCIE_BUS_TUNE_OFF is not set
# CONFIG_PCIE_BUS_DEFAULT is not set
CONFIG_PCIE_BUS_SAFE=y
# CONFIG_PCIE_BUS_PERFORMANCE is not set
# CONFIG_PCIE_BUS_PEER2PEER is not set
# CONFIG_VGA_ARB is not set
CONFIG_HOTPLUG_PCI=y
# CONFIG_HOTPLUG_PCI_CPCI is not set
CONFIG_HOTPLUG_PCI_SHPC=y

#
# PCI controller drivers
#
CONFIG_PCI_AARDVARK=m
# CONFIG_PCIE_XILINX_NWL is not set
# CONFIG_PCI_FTPCI100 is not set
# CONFIG_PCI_TEGRA is not set
# CONFIG_PCIE_RCAR_HOST is not set
CONFIG_PCI_HOST_COMMON=y
# CONFIG_PCI_HOST_GENERIC is not set
CONFIG_PCIE_XILINX=y
# CONFIG_PCIE_XILINX_CPM is not set
# CONFIG_PCI_XGENE is not set
# CONFIG_PCI_V3_SEMI is not set
CONFIG_PCI_VERSATILE=y
# CONFIG_PCIE_ALTERA is not set
CONFIG_PCI_HOST_THUNDER_PEM=y
CONFIG_PCI_HOST_THUNDER_ECAM=y
CONFIG_PCIE_ROCKCHIP=y
CONFIG_PCIE_ROCKCHIP_HOST=y
CONFIG_PCIE_MEDIATEK=m
CONFIG_PCIE_MEDIATEK_GEN3=y
# CONFIG_PCIE_BRCMSTB is not set
CONFIG_PCIE_MICROCHIP_HOST=y
CONFIG_PCIE_APPLE_MSI_DOORBELL_ADDR=0xfffff000
CONFIG_PCIE_APPLE=m
# CONFIG_PCIE_MT7621 is not set

#
# DesignWare PCI Core Support
#
CONFIG_PCIE_DW=y
CONFIG_PCIE_DW_HOST=y
CONFIG_PCIE_DW_PLAT=y
CONFIG_PCIE_DW_PLAT_HOST=y
CONFIG_PCI_EXYNOS=m
# CONFIG_PCI_IMX6 is not set
# CONFIG_PCIE_SPEAR13XX is not set
CONFIG_PCI_KEYSTONE=y
CONFIG_PCI_KEYSTONE_HOST=y
# CONFIG_PCI_LAYERSCAPE is not set
# CONFIG_PCI_HISI is not set
CONFIG_PCIE_QCOM=y
CONFIG_PCIE_ARMADA_8K=y
# CONFIG_PCIE_ARTPEC6_HOST is not set
# CONFIG_PCIE_ROCKCHIP_DW_HOST is not set
# CONFIG_PCIE_INTEL_GW is not set
# CONFIG_PCIE_KEEMBAY_HOST is not set
# CONFIG_PCIE_KIRIN is not set
CONFIG_PCIE_HISI_STB=y
# CONFIG_PCI_MESON is not set
CONFIG_PCIE_TEGRA194=y
CONFIG_PCIE_TEGRA194_HOST=y
CONFIG_PCIE_VISCONTI_HOST=y
# CONFIG_PCIE_UNIPHIER is not set
CONFIG_PCIE_AL=y
# CONFIG_PCIE_FU740 is not set
# end of DesignWare PCI Core Support

#
# Mobiveil PCIe Core Support
#
CONFIG_PCIE_MOBIVEIL=y
CONFIG_PCIE_MOBIVEIL_HOST=y
CONFIG_PCIE_MOBIVEIL_PLAT=y
# CONFIG_PCIE_LAYERSCAPE_GEN4 is not set
# end of Mobiveil PCIe Core Support

#
# Cadence PCIe controllers support
#
CONFIG_PCIE_CADENCE=y
CONFIG_PCIE_CADENCE_HOST=y
# CONFIG_PCIE_CADENCE_PLAT_HOST is not set
CONFIG_PCI_J721E=y
CONFIG_PCI_J721E_HOST=y
# end of Cadence PCIe controllers support
# end of PCI controller drivers

#
# PCI Endpoint
#
# CONFIG_PCI_ENDPOINT is not set
# end of PCI Endpoint

#
# PCI switch controller drivers
#
# CONFIG_PCI_SW_SWITCHTEC is not set
# end of PCI switch controller drivers

# CONFIG_CXL_BUS is not set
CONFIG_PCCARD=m
CONFIG_PCMCIA=m
# CONFIG_PCMCIA_LOAD_CIS is not set
CONFIG_CARDBUS=y

#
# PC-card bridges
#
# CONFIG_YENTA is not set
CONFIG_PD6729=m
CONFIG_I82092=m
CONFIG_PCCARD_NONSTATIC=y
CONFIG_RAPIDIO=y
CONFIG_RAPIDIO_DISC_TIMEOUT=30
# CONFIG_RAPIDIO_ENABLE_RX_TX_PORTS is not set
# CONFIG_RAPIDIO_DEBUG is not set
# CONFIG_RAPIDIO_ENUM_BASIC is not set
# CONFIG_RAPIDIO_CHMAN is not set
# CONFIG_RAPIDIO_MPORT_CDEV is not set

#
# RapidIO Switch drivers
#
# CONFIG_RAPIDIO_CPS_XX is not set
CONFIG_RAPIDIO_CPS_GEN2=m
CONFIG_RAPIDIO_RXS_GEN3=y
# end of RapidIO Switch drivers

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
# CONFIG_UEVENT_HELPER is not set
# CONFIG_DEVTMPFS is not set
CONFIG_STANDALONE=y
# CONFIG_PREVENT_FIRMWARE_BUILD is not set

#
# Firmware loader
#
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
CONFIG_FW_LOADER_COMPRESS=y
# CONFIG_FW_LOADER_COMPRESS_XZ is not set
CONFIG_FW_LOADER_COMPRESS_ZSTD=y
# CONFIG_FW_CACHE is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
CONFIG_ALLOW_DEV_COREDUMP=y
CONFIG_DEV_COREDUMP=y
# CONFIG_DEBUG_DRIVER is not set
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
# CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SPMI=y
CONFIG_REGMAP_W1=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
CONFIG_ARM_INTEGRATOR_LM=y
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
# CONFIG_HISILICON_LPC is not set
# CONFIG_INTEL_IXP4XX_EB is not set
CONFIG_QCOM_EBI2=y
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
# CONFIG_ARM_SCMI_POWER_DOMAIN is not set
CONFIG_ARM_SCMI_POWER_CONTROL=m
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=m
# CONFIG_ARM_SCPI_POWER_DOMAIN is not set
# CONFIG_FIRMWARE_MEMMAP is not set
CONFIG_FW_CFG_SYSFS=y
# CONFIG_FW_CFG_SYSFS_CMDLINE is not set
CONFIG_MTK_ADSP_IPC=m
CONFIG_QCOM_SCM=y
CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT=y
CONFIG_TURRIS_MOX_RWTM=y
CONFIG_BCM47XX_NVRAM=y
# CONFIG_BCM47XX_SPROM is not set
# CONFIG_TEE_BNXT_FW is not set
CONFIG_GOOGLE_FIRMWARE=y
CONFIG_GOOGLE_CBMEM=m
CONFIG_GOOGLE_COREBOOT_TABLE=y
CONFIG_GOOGLE_MEMCONSOLE=m
CONFIG_GOOGLE_MEMCONSOLE_COREBOOT=m
# CONFIG_GOOGLE_VPD is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=m
# CONFIG_GNSS_MTK_SERIAL is not set
CONFIG_GNSS_SIRF_SERIAL=m
# CONFIG_GNSS_UBX_SERIAL is not set
CONFIG_GNSS_USB=m
# CONFIG_MTD is not set
CONFIG_OF=y
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_PROMTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
# CONFIG_OF_OVERLAY is not set
CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=y
CONFIG_PARPORT=y
CONFIG_PARPORT_PC=m
CONFIG_PARPORT_PC_FIFO=y
# CONFIG_PARPORT_PC_SUPERIO is not set
CONFIG_PARPORT_PC_PCMCIA=m
CONFIG_PARPORT_SUNBPP=y
CONFIG_PARPORT_AX88796=y
CONFIG_PARPORT_1284=y
CONFIG_PARPORT_NOT_PC=y
CONFIG_BLK_DEV=y
CONFIG_BLK_DEV_NULL_BLK=m
CONFIG_BLK_DEV_FD=m
# CONFIG_BLK_DEV_FD_RAWCMD is not set
CONFIG_CDROM=y
CONFIG_PARIDE=m

#
# Parallel IDE high-level drivers
#
CONFIG_PARIDE_PD=m
CONFIG_PARIDE_PCD=m
CONFIG_PARIDE_PF=m
# CONFIG_PARIDE_PT is not set
# CONFIG_PARIDE_PG is not set

#
# Parallel IDE protocol modules
#
# CONFIG_PARIDE_ATEN is not set
CONFIG_PARIDE_BPCK=m
CONFIG_PARIDE_COMM=m
CONFIG_PARIDE_DSTR=m
# CONFIG_PARIDE_FIT2 is not set
# CONFIG_PARIDE_FIT3 is not set
# CONFIG_PARIDE_EPAT is not set
CONFIG_PARIDE_EPIA=m
# CONFIG_PARIDE_FRIQ is not set
CONFIG_PARIDE_FRPW=m
# CONFIG_PARIDE_KBIC is not set
# CONFIG_PARIDE_KTTI is not set
# CONFIG_PARIDE_ON20 is not set
# CONFIG_PARIDE_ON26 is not set
# CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
CONFIG_ZRAM=y
CONFIG_ZRAM_DEF_COMP_LZORLE=y
# CONFIG_ZRAM_DEF_COMP_ZSTD is not set
# CONFIG_ZRAM_DEF_COMP_LZ4 is not set
# CONFIG_ZRAM_DEF_COMP_LZO is not set
CONFIG_ZRAM_DEF_COMP="lzo-rle"
# CONFIG_ZRAM_WRITEBACK is not set
CONFIG_ZRAM_MEMORY_TRACKING=y
CONFIG_ZRAM_MULTI_COMP=y
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_LOOP_MIN_COUNT=8

#
# DRBD disabled because PROC_FS or INET not selected
#
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_COUNT=16
CONFIG_BLK_DEV_RAM_SIZE=4096
# CONFIG_SUNVDC is not set
CONFIG_VIRTIO_BLK=m
CONFIG_BLK_DEV_UBLK=y

#
# NVME Support
#
# CONFIG_BLK_DEV_NVME is not set
# CONFIG_NVME_FC is not set
CONFIG_NVME_TARGET=m
# CONFIG_NVME_TARGET_LOOP is not set
CONFIG_NVME_TARGET_FC=m
# CONFIG_NVME_TARGET_AUTH is not set
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=m
CONFIG_DUMMY_IRQ=m
# CONFIG_PHANTOM is not set
CONFIG_TIFM_CORE=y
CONFIG_TIFM_7XX1=m
# CONFIG_ICS932S401 is not set
CONFIG_ATMEL_SSC=y
CONFIG_ENCLOSURE_SERVICES=m
CONFIG_SMPRO_ERRMON=y
CONFIG_SMPRO_MISC=m
# CONFIG_HI6421V600_IRQ is not set
CONFIG_HP_ILO=m
CONFIG_QCOM_COINCELL=m
# CONFIG_QCOM_FASTRPC is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=m
CONFIG_ISL29020=y
# CONFIG_SENSORS_TSL2550 is not set
CONFIG_SENSORS_BH1770=y
CONFIG_SENSORS_APDS990X=m
CONFIG_HMC6352=y
CONFIG_DS1682=y
# CONFIG_PCH_PHUB is not set
CONFIG_SRAM=y
# CONFIG_DW_XDATA_PCIE is not set
CONFIG_PCI_ENDPOINT_TEST=m
CONFIG_XILINX_SDFEC=m
CONFIG_MISC_RTSX=m
CONFIG_HISI_HIKEY_USB=y
# CONFIG_VCPU_STALL_DETECTOR is not set
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=m
CONFIG_EEPROM_LEGACY=y
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=m
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=m
# end of EEPROM support

CONFIG_CB710_CORE=m
# CONFIG_CB710_DEBUG is not set
CONFIG_CB710_DEBUG_ASSUMPTIONS=y

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
# CONFIG_ALTERA_STAPL is not set
CONFIG_GENWQE=m
CONFIG_GENWQE_PLATFORM_ERROR_RECOVERY=0
CONFIG_ECHO=m
# CONFIG_BCM_VK is not set
# CONFIG_MISC_ALCOR_PCI is not set
CONFIG_MISC_RTSX_PCI=m
# CONFIG_MISC_RTSX_USB is not set
# CONFIG_HABANA_AI is not set
CONFIG_UACCE=y
# CONFIG_PVPANIC is not set
# CONFIG_GP_PCI1XXXX is not set
# end of Misc devices

#
# SCSI device support
#
CONFIG_SCSI_MOD=y
# CONFIG_RAID_ATTRS is not set
CONFIG_SCSI_COMMON=y
CONFIG_SCSI=y
CONFIG_SCSI_DMA=y
CONFIG_SCSI_PROC_FS=y

#
# SCSI support type (disk, tape, CD-ROM)
#
CONFIG_BLK_DEV_SD=y
CONFIG_CHR_DEV_ST=y
CONFIG_BLK_DEV_SR=y
CONFIG_CHR_DEV_SG=y
CONFIG_BLK_DEV_BSG=y
CONFIG_CHR_DEV_SCH=m
# CONFIG_SCSI_ENCLOSURE is not set
# CONFIG_SCSI_CONSTANTS is not set
CONFIG_SCSI_LOGGING=y
CONFIG_SCSI_SCAN_ASYNC=y

#
# SCSI Transports
#
# CONFIG_SCSI_SPI_ATTRS is not set
CONFIG_SCSI_SAS_ATTRS=m
CONFIG_SCSI_SAS_LIBSAS=m
CONFIG_SCSI_SAS_ATA=y
CONFIG_SCSI_SAS_HOST_SMP=y
# CONFIG_SCSI_SRP_ATTRS is not set
# end of SCSI Transports

# CONFIG_SCSI_LOWLEVEL is not set
CONFIG_SCSI_DH=y
CONFIG_SCSI_DH_RDAC=m
CONFIG_SCSI_DH_HP_SW=m
CONFIG_SCSI_DH_EMC=m
CONFIG_SCSI_DH_ALUA=y
# end of SCSI device support

CONFIG_ATA=y
CONFIG_SATA_HOST=y
# CONFIG_ATA_VERBOSE_ERROR is not set
# CONFIG_ATA_FORCE is not set
# CONFIG_SATA_PMP is not set

#
# Controllers with non-SFF native interface
#
CONFIG_SATA_AHCI=m
CONFIG_SATA_MOBILE_LPM_POLICY=0
# CONFIG_SATA_AHCI_PLATFORM is not set
CONFIG_AHCI_BRCM=m
CONFIG_AHCI_DA850=m
CONFIG_AHCI_DM816=y
# CONFIG_AHCI_DWC is not set
CONFIG_AHCI_ST=m
# CONFIG_AHCI_IMX is not set
# CONFIG_AHCI_CEVA is not set
CONFIG_AHCI_MTK=y
# CONFIG_AHCI_MVEBU is not set
# CONFIG_AHCI_SUNXI is not set
CONFIG_AHCI_TEGRA=m
CONFIG_AHCI_XGENE=y
CONFIG_AHCI_QORIQ=y
CONFIG_SATA_FSL=y
CONFIG_SATA_GEMINI=m
CONFIG_SATA_AHCI_SEATTLE=m
CONFIG_SATA_INIC162X=m
# CONFIG_SATA_ACARD_AHCI is not set
# CONFIG_SATA_SIL24 is not set
# CONFIG_ATA_SFF is not set
# CONFIG_MD is not set
# CONFIG_TARGET_CORE is not set
# CONFIG_FUSION is not set

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=y
CONFIG_FIREWIRE_OHCI=m
CONFIG_FIREWIRE_SBP2=y
CONFIG_FIREWIRE_NOSY=m
# end of IEEE 1394 (FireWire) support

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=m
CONFIG_INPUT_MATRIXKMAP=y
CONFIG_INPUT_VIVALDIFMAP=m

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=m
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=m
CONFIG_INPUT_EVDEV=y
# CONFIG_INPUT_EVBUG is not set

#
# Input Device Drivers
#
CONFIG_INPUT_KEYBOARD=y
CONFIG_KEYBOARD_ADC=y
CONFIG_KEYBOARD_ADP5520=m
# CONFIG_KEYBOARD_ADP5588 is not set
# CONFIG_KEYBOARD_ADP5589 is not set
CONFIG_KEYBOARD_ATKBD=m
# CONFIG_KEYBOARD_QT1050 is not set
# CONFIG_KEYBOARD_QT1070 is not set
CONFIG_KEYBOARD_QT2160=y
CONFIG_KEYBOARD_CLPS711X=y
# CONFIG_KEYBOARD_DLINK_DIR685 is not set
CONFIG_KEYBOARD_LKKBD=m
CONFIG_KEYBOARD_EP93XX=m
# CONFIG_KEYBOARD_GPIO is not set
CONFIG_KEYBOARD_GPIO_POLLED=y
CONFIG_KEYBOARD_TCA6416=m
CONFIG_KEYBOARD_TCA8418=m
CONFIG_KEYBOARD_MATRIX=y
# CONFIG_KEYBOARD_LM8323 is not set
CONFIG_KEYBOARD_LM8333=y
CONFIG_KEYBOARD_LPC32XX=y
# CONFIG_KEYBOARD_MAX7359 is not set
CONFIG_KEYBOARD_MCS=m
# CONFIG_KEYBOARD_MPR121 is not set
# CONFIG_KEYBOARD_SNVS_PWRKEY is not set
# CONFIG_KEYBOARD_IMX is not set
CONFIG_KEYBOARD_NEWTON=m
CONFIG_KEYBOARD_NOMADIK=y
CONFIG_KEYBOARD_TEGRA=y
CONFIG_KEYBOARD_OPENCORES=y
# CONFIG_KEYBOARD_PINEPHONE is not set
CONFIG_KEYBOARD_PXA27x=m
CONFIG_KEYBOARD_GOLDFISH_EVENTS=y
CONFIG_KEYBOARD_STOWAWAY=m
CONFIG_KEYBOARD_ST_KEYSCAN=m
CONFIG_KEYBOARD_SUNKBD=m
# CONFIG_KEYBOARD_SH_KEYSC is not set
# CONFIG_KEYBOARD_OMAP4 is not set
# CONFIG_KEYBOARD_SPEAR is not set
CONFIG_KEYBOARD_TM2_TOUCHKEY=y
# CONFIG_KEYBOARD_XTKBD is not set
CONFIG_KEYBOARD_CAP11XX=y
CONFIG_KEYBOARD_MT6779=y
CONFIG_KEYBOARD_MTK_PMIC=m
CONFIG_KEYBOARD_CYPRESS_SF=y
# CONFIG_INPUT_MOUSE is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
CONFIG_JOYSTICK_A3D=y
CONFIG_JOYSTICK_ADC=m
CONFIG_JOYSTICK_ADI=m
CONFIG_JOYSTICK_COBRA=m
CONFIG_JOYSTICK_GF2K=m
CONFIG_JOYSTICK_GRIP=m
# CONFIG_JOYSTICK_GRIP_MP is not set
CONFIG_JOYSTICK_GUILLEMOT=m
# CONFIG_JOYSTICK_INTERACT is not set
CONFIG_JOYSTICK_SIDEWINDER=y
CONFIG_JOYSTICK_TMDC=y
# CONFIG_JOYSTICK_IFORCE is not set
CONFIG_JOYSTICK_WARRIOR=y
CONFIG_JOYSTICK_MAGELLAN=m
CONFIG_JOYSTICK_SPACEORB=m
CONFIG_JOYSTICK_SPACEBALL=m
CONFIG_JOYSTICK_STINGER=m
CONFIG_JOYSTICK_TWIDJOY=m
# CONFIG_JOYSTICK_ZHENHUA is not set
CONFIG_JOYSTICK_DB9=y
CONFIG_JOYSTICK_GAMECON=y
CONFIG_JOYSTICK_TURBOGRAFX=m
CONFIG_JOYSTICK_AS5011=m
CONFIG_JOYSTICK_JOYDUMP=m
CONFIG_JOYSTICK_XPAD=y
# CONFIG_JOYSTICK_XPAD_FF is not set
# CONFIG_JOYSTICK_XPAD_LEDS is not set
CONFIG_JOYSTICK_PXRC=y
CONFIG_JOYSTICK_QWIIC=m
CONFIG_JOYSTICK_FSIA6B=y
CONFIG_JOYSTICK_SENSEHAT=m
CONFIG_INPUT_TABLET=y
# CONFIG_TABLET_USB_ACECAD is not set
CONFIG_TABLET_USB_AIPTEK=y
# CONFIG_TABLET_USB_HANWANG is not set
CONFIG_TABLET_USB_KBTAB=y
CONFIG_TABLET_USB_PEGASUS=y
CONFIG_TABLET_SERIAL_WACOM4=m
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=y
# CONFIG_RMI4_I2C is not set
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=y
CONFIG_SERIO_I8042=y
# CONFIG_SERIO_PARKBD is not set
# CONFIG_SERIO_PCIPS2 is not set
CONFIG_SERIO_LIBPS2=m
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=y
CONFIG_SERIO_PS2MULT=m
# CONFIG_SERIO_ARC_PS2 is not set
CONFIG_SERIO_APBPS2=m
CONFIG_SERIO_OLPC_APSP=y
# CONFIG_SERIO_SUN4I_PS2 is not set
CONFIG_SERIO_GPIO_PS2=m
# CONFIG_USERIO is not set
CONFIG_GAMEPORT=y
# CONFIG_GAMEPORT_NS558 is not set
CONFIG_GAMEPORT_L4=y
CONFIG_GAMEPORT_EMU10K1=y
CONFIG_GAMEPORT_FM801=y
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
# CONFIG_TTY is not set
CONFIG_SERIAL_DEV_BUS=m
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
# CONFIG_PPDEV is not set
CONFIG_IPMI_HANDLER=m
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
CONFIG_IPMI_PANIC_STRING=y
# CONFIG_IPMI_DEVICE_INTERFACE is not set
CONFIG_IPMI_SI=m
CONFIG_IPMI_SSIF=m
CONFIG_IPMI_IPMB=m
# CONFIG_IPMI_WATCHDOG is not set
# CONFIG_IPMI_POWEROFF is not set
CONFIG_IPMI_KCS_BMC=y
CONFIG_ASPEED_KCS_IPMI_BMC=y
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
# CONFIG_IPMI_KCS_BMC_CDEV_IPMI is not set
CONFIG_IPMI_KCS_BMC_SERIO=m
CONFIG_ASPEED_BT_IPMI_BMC=m
CONFIG_SSIF_IPMI_BMC=m
CONFIG_IPMB_DEVICE_INTERFACE=y
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=m
CONFIG_HW_RANDOM_BA431=m
# CONFIG_HW_RANDOM_BCM2835 is not set
CONFIG_HW_RANDOM_IPROC_RNG200=y
CONFIG_HW_RANDOM_N2RNG=y
# CONFIG_HW_RANDOM_IXP4XX is not set
CONFIG_HW_RANDOM_OMAP=m
# CONFIG_HW_RANDOM_OMAP3_ROM is not set
CONFIG_HW_RANDOM_VIRTIO=m
# CONFIG_HW_RANDOM_NOMADIK is not set
CONFIG_HW_RANDOM_STM32=m
# CONFIG_HW_RANDOM_POLARFIRE_SOC is not set
# CONFIG_HW_RANDOM_MESON is not set
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y
# CONFIG_HW_RANDOM_NPCM is not set
CONFIG_HW_RANDOM_KEYSTONE=y
CONFIG_HW_RANDOM_CCTRNG=y
# CONFIG_HW_RANDOM_XIPHERA is not set
CONFIG_HW_RANDOM_CN10K=m
CONFIG_APPLICOM=y

#
# PCMCIA character devices
#
# CONFIG_CARDMAN_4000 is not set
CONFIG_CARDMAN_4040=m
CONFIG_SCR24X=m
# end of PCMCIA character devices

# CONFIG_DEVMEM is not set
# CONFIG_DEVPORT is not set
# CONFIG_TCG_TPM is not set
# CONFIG_XILLYBUS is not set
# CONFIG_XILLYUSB is not set
# CONFIG_ADI is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
# CONFIG_I2C_COMPAT is not set
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=m

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=m
# CONFIG_I2C_MUX_GPIO is not set
# CONFIG_I2C_MUX_GPMUX is not set
# CONFIG_I2C_MUX_LTC4306 is not set
CONFIG_I2C_MUX_PCA9541=m
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_PINCTRL=m
CONFIG_I2C_MUX_REG=m
CONFIG_I2C_DEMUX_PINCTRL=m
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
# CONFIG_I2C_ALGOPCF is not set
# CONFIG_I2C_ALGOPCA is not set
# end of I2C Algorithms

#
# I2C Hardware Bus support
#

#
# PC SMBus host controller drivers
#
CONFIG_I2C_CCGX_UCSI=m
# CONFIG_I2C_ALI1535 is not set
CONFIG_I2C_ALI1563=y
CONFIG_I2C_ALI15X3=y
CONFIG_I2C_AMD756=y
# CONFIG_I2C_AMD8111 is not set
CONFIG_I2C_HIX5HD2=y
CONFIG_I2C_I801=y
# CONFIG_I2C_ISCH is not set
CONFIG_I2C_PIIX4=m
CONFIG_I2C_NFORCE2=m
CONFIG_I2C_NVIDIA_GPU=m
# CONFIG_I2C_SIS5595 is not set
# CONFIG_I2C_SIS630 is not set
CONFIG_I2C_SIS96X=m
# CONFIG_I2C_VIA is not set
# CONFIG_I2C_VIAPRO is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
CONFIG_I2C_ALTERA=m
CONFIG_I2C_ASPEED=m
CONFIG_I2C_AT91=y
CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL=y
CONFIG_I2C_AXXIA=y
CONFIG_I2C_BCM_IPROC=m
CONFIG_I2C_BCM_KONA=y
CONFIG_I2C_BRCMSTB=m
# CONFIG_I2C_CADENCE is not set
CONFIG_I2C_CBUS_GPIO=m
CONFIG_I2C_DAVINCI=y
CONFIG_I2C_DESIGNWARE_CORE=m
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=m
CONFIG_I2C_DESIGNWARE_PCI=m
# CONFIG_I2C_DIGICOLOR is not set
# CONFIG_I2C_EG20T is not set
CONFIG_I2C_EXYNOS5=y
CONFIG_I2C_GPIO=y
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
# CONFIG_I2C_HIGHLANDER is not set
# CONFIG_I2C_HISI is not set
CONFIG_I2C_IMG=m
CONFIG_I2C_IMX=y
CONFIG_I2C_IMX_LPI2C=m
CONFIG_I2C_IOP3XX=y
# CONFIG_I2C_JZ4780 is not set
# CONFIG_I2C_LPC2K is not set
# CONFIG_I2C_MICROCHIP_CORE is not set
CONFIG_I2C_MT65XX=y
CONFIG_I2C_MT7621=y
CONFIG_I2C_MV64XXX=m
CONFIG_I2C_MXS=y
# CONFIG_I2C_NPCM is not set
CONFIG_I2C_OCORES=y
# CONFIG_I2C_OMAP is not set
CONFIG_I2C_OWL=m
CONFIG_I2C_APPLE=y
# CONFIG_I2C_PCA_PLATFORM is not set
CONFIG_I2C_PNX=y
CONFIG_I2C_PXA=m
# CONFIG_I2C_PXA_SLAVE is not set
CONFIG_I2C_QCOM_CCI=m
CONFIG_I2C_QCOM_GENI=m
CONFIG_I2C_QUP=m
# CONFIG_I2C_RIIC is not set
CONFIG_I2C_RZV2M=y
CONFIG_I2C_S3C2410=m
# CONFIG_I2C_SH_MOBILE is not set
# CONFIG_I2C_SIMTEC is not set
CONFIG_I2C_ST=m
CONFIG_I2C_STM32F4=m
# CONFIG_I2C_STM32F7 is not set
CONFIG_I2C_SUN6I_P2WI=y
CONFIG_I2C_SYNQUACER=m
CONFIG_I2C_TEGRA=m
CONFIG_I2C_TEGRA_BPMP=y
CONFIG_I2C_UNIPHIER=m
CONFIG_I2C_UNIPHIER_F=m
CONFIG_I2C_VERSATILE=m
CONFIG_I2C_WMT=m
CONFIG_I2C_THUNDERX=m
# CONFIG_I2C_XILINX is not set
# CONFIG_I2C_XLP9XX is not set
CONFIG_I2C_RCAR=m

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_DIOLAN_U2C is not set
CONFIG_I2C_DLN2=m
# CONFIG_I2C_CP2615 is not set
CONFIG_I2C_PARPORT=y
# CONFIG_I2C_PCI1XXXX is not set
# CONFIG_I2C_ROBOTFUZZ_OSIF is not set
# CONFIG_I2C_TINY_USB is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
CONFIG_I2C_FSI=m
# CONFIG_I2C_VIRTIO is not set
# end of I2C Hardware Bus support

# CONFIG_I2C_STUB is not set
CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
# CONFIG_I2C_SLAVE_TESTUNIT is not set
CONFIG_I2C_DEBUG_CORE=y
CONFIG_I2C_DEBUG_ALGO=y
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
CONFIG_SPMI=y
CONFIG_SPMI_HISI3670=m
CONFIG_SPMI_MSM_PMIC_ARB=y
CONFIG_SPMI_MTK_PMIF=m
CONFIG_HSI=y
CONFIG_HSI_BOARDINFO=y

#
# HSI controllers
#

#
# HSI clients
#
# CONFIG_HSI_CHAR is not set
# CONFIG_PPS is not set

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
# CONFIG_DEBUG_PINCTRL is not set
CONFIG_PINCTRL_AMD=y
CONFIG_PINCTRL_AT91PIO4=y
# CONFIG_PINCTRL_AXP209 is not set
CONFIG_PINCTRL_BM1880=y
# CONFIG_PINCTRL_CY8C95X0 is not set
# CONFIG_PINCTRL_DA850_PUPD is not set
CONFIG_PINCTRL_EQUILIBRIUM=y
CONFIG_PINCTRL_INGENIC=y
# CONFIG_PINCTRL_LOONGSON2 is not set
# CONFIG_PINCTRL_LPC18XX is not set
CONFIG_PINCTRL_MCP23S08_I2C=m
CONFIG_PINCTRL_MCP23S08=m
CONFIG_PINCTRL_MICROCHIP_SGPIO=m
CONFIG_PINCTRL_OCELOT=m
# CONFIG_PINCTRL_PISTACHIO is not set
CONFIG_PINCTRL_ROCKCHIP=y
# CONFIG_PINCTRL_SINGLE is not set
CONFIG_PINCTRL_STMFX=m
# CONFIG_PINCTRL_SX150X is not set
# CONFIG_PINCTRL_OWL is not set
CONFIG_PINCTRL_ASPEED=y
CONFIG_PINCTRL_ASPEED_G4=y
CONFIG_PINCTRL_ASPEED_G5=y
# CONFIG_PINCTRL_ASPEED_G6 is not set
# CONFIG_PINCTRL_BCM281XX is not set
# CONFIG_PINCTRL_BCM2835 is not set
# CONFIG_PINCTRL_BCM4908 is not set
CONFIG_PINCTRL_BCM63XX=y
CONFIG_PINCTRL_BCM6318=y
# CONFIG_PINCTRL_BCM6328 is not set
CONFIG_PINCTRL_BCM6358=y
CONFIG_PINCTRL_BCM6362=y
CONFIG_PINCTRL_BCM6368=y
# CONFIG_PINCTRL_BCM63268 is not set
CONFIG_PINCTRL_IPROC_GPIO=y
CONFIG_PINCTRL_CYGNUS_MUX=y
CONFIG_PINCTRL_NS=y
# CONFIG_PINCTRL_NSP_GPIO is not set
CONFIG_PINCTRL_NS2_MUX=y
CONFIG_PINCTRL_NSP_MUX=y
CONFIG_PINCTRL_BERLIN=y
CONFIG_PINCTRL_AS370=y
CONFIG_PINCTRL_BERLIN_BG4CT=y
CONFIG_PINCTRL_LOCHNAGAR=m
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L35=y
CONFIG_PINCTRL_CS47L90=y
# CONFIG_PINCTRL_IMX8MM is not set
# CONFIG_PINCTRL_IMX8MN is not set
# CONFIG_PINCTRL_IMX8MP is not set
# CONFIG_PINCTRL_IMX8MQ is not set

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
CONFIG_PINCTRL_MTK_V2=y
CONFIG_PINCTRL_MTK_MOORE=y
CONFIG_PINCTRL_MTK_PARIS=y
# CONFIG_PINCTRL_MT2701 is not set
CONFIG_PINCTRL_MT7623=y
CONFIG_PINCTRL_MT7629=y
# CONFIG_PINCTRL_MT8135 is not set
# CONFIG_PINCTRL_MT8127 is not set
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT6765 is not set
CONFIG_PINCTRL_MT6779=m
# CONFIG_PINCTRL_MT6795 is not set
# CONFIG_PINCTRL_MT6797 is not set
CONFIG_PINCTRL_MT7622=y
# CONFIG_PINCTRL_MT7986 is not set
# CONFIG_PINCTRL_MT8167 is not set
# CONFIG_PINCTRL_MT8173 is not set
CONFIG_PINCTRL_MT8183=y
# CONFIG_PINCTRL_MT8186 is not set
CONFIG_PINCTRL_MT8188=y
# CONFIG_PINCTRL_MT8192 is not set
# CONFIG_PINCTRL_MT8195 is not set
# CONFIG_PINCTRL_MT8365 is not set
CONFIG_PINCTRL_MT8516=y
CONFIG_PINCTRL_MT6397=y
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MESON=y
CONFIG_PINCTRL_WPCM450=m
# CONFIG_PINCTRL_NPCM7XX is not set
CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=y
CONFIG_PINCTRL_PXA27X=m
CONFIG_PINCTRL_MSM=m
CONFIG_PINCTRL_APQ8064=m
# CONFIG_PINCTRL_APQ8084 is not set
CONFIG_PINCTRL_IPQ4019=m
CONFIG_PINCTRL_IPQ8064=m
CONFIG_PINCTRL_IPQ8074=m
CONFIG_PINCTRL_IPQ6018=m
# CONFIG_PINCTRL_MSM8226 is not set
CONFIG_PINCTRL_MSM8660=m
CONFIG_PINCTRL_MSM8960=m
CONFIG_PINCTRL_MDM9607=m
CONFIG_PINCTRL_MDM9615=m
CONFIG_PINCTRL_MSM8X74=m
# CONFIG_PINCTRL_MSM8909 is not set
# CONFIG_PINCTRL_MSM8916 is not set
# CONFIG_PINCTRL_MSM8953 is not set
CONFIG_PINCTRL_MSM8976=m
# CONFIG_PINCTRL_MSM8994 is not set
# CONFIG_PINCTRL_MSM8996 is not set
# CONFIG_PINCTRL_MSM8998 is not set
CONFIG_PINCTRL_QCM2290=m
CONFIG_PINCTRL_QCS404=m
CONFIG_PINCTRL_QCOM_SPMI_PMIC=m
CONFIG_PINCTRL_QCOM_SSBI_PMIC=m
CONFIG_PINCTRL_SC7180=m
# CONFIG_PINCTRL_SC7280 is not set
CONFIG_PINCTRL_SC7280_LPASS_LPI=m
CONFIG_PINCTRL_SC8180X=m
CONFIG_PINCTRL_SC8280XP=m
# CONFIG_PINCTRL_SDM660 is not set
CONFIG_PINCTRL_SDM670=m
# CONFIG_PINCTRL_SDM845 is not set
CONFIG_PINCTRL_SDX55=m
CONFIG_PINCTRL_SM6115=m
# CONFIG_PINCTRL_SM6125 is not set
CONFIG_PINCTRL_SM6350=m
CONFIG_PINCTRL_SM6375=m
CONFIG_PINCTRL_SDX65=m
CONFIG_PINCTRL_SM8150=m
CONFIG_PINCTRL_SM8250=m
CONFIG_PINCTRL_SM8250_LPASS_LPI=m
# CONFIG_PINCTRL_SM8350 is not set
# CONFIG_PINCTRL_SM8450 is not set
# CONFIG_PINCTRL_SM8450_LPASS_LPI is not set
CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
CONFIG_PINCTRL_LPASS_LPI=m

#
# Renesas pinctrl drivers
#
CONFIG_PINCTRL_RENESAS=y
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
# CONFIG_PINCTRL_PFC_EMEV2 is not set
# CONFIG_PINCTRL_PFC_R8A77995 is not set
# CONFIG_PINCTRL_PFC_R8A7794 is not set
# CONFIG_PINCTRL_PFC_R8A77990 is not set
# CONFIG_PINCTRL_PFC_R8A7779 is not set
# CONFIG_PINCTRL_PFC_R8A7790 is not set
CONFIG_PINCTRL_PFC_R8A77950=y
# CONFIG_PINCTRL_PFC_R8A77951 is not set
# CONFIG_PINCTRL_PFC_R8A7778 is not set
CONFIG_PINCTRL_PFC_R8A7793=y
# CONFIG_PINCTRL_PFC_R8A7791 is not set
CONFIG_PINCTRL_PFC_R8A77965=y
CONFIG_PINCTRL_PFC_R8A77960=y
CONFIG_PINCTRL_PFC_R8A77961=y
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
# CONFIG_PINCTRL_PFC_R8A7792 is not set
CONFIG_PINCTRL_PFC_R8A77980=y
CONFIG_PINCTRL_PFC_R8A77970=y
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
CONFIG_PINCTRL_PFC_R8A779G0=y
CONFIG_PINCTRL_PFC_R8A7740=y
CONFIG_PINCTRL_PFC_R8A73A4=y
CONFIG_PINCTRL_RZA1=y
# CONFIG_PINCTRL_RZA2 is not set
CONFIG_PINCTRL_RZG2L=y
CONFIG_PINCTRL_PFC_R8A77470=y
# CONFIG_PINCTRL_PFC_R8A7745 is not set
CONFIG_PINCTRL_PFC_R8A7742=y
CONFIG_PINCTRL_PFC_R8A7743=y
# CONFIG_PINCTRL_PFC_R8A7744 is not set
CONFIG_PINCTRL_PFC_R8A774C0=y
CONFIG_PINCTRL_PFC_R8A774E1=y
CONFIG_PINCTRL_PFC_R8A774A1=y
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
CONFIG_PINCTRL_RZN1=y
# CONFIG_PINCTRL_RZV2M is not set
CONFIG_PINCTRL_PFC_SH7203=y
CONFIG_PINCTRL_PFC_SH7264=y
CONFIG_PINCTRL_PFC_SH7269=y
# CONFIG_PINCTRL_PFC_SH7720 is not set
# CONFIG_PINCTRL_PFC_SH7722 is not set
CONFIG_PINCTRL_PFC_SH7734=y
# CONFIG_PINCTRL_PFC_SH7757 is not set
CONFIG_PINCTRL_PFC_SH7785=y
# CONFIG_PINCTRL_PFC_SH7786 is not set
# CONFIG_PINCTRL_PFC_SH73A0 is not set
CONFIG_PINCTRL_PFC_SH7723=y
# CONFIG_PINCTRL_PFC_SH7724 is not set
# CONFIG_PINCTRL_PFC_SHX3 is not set
# end of Renesas pinctrl drivers

CONFIG_PINCTRL_SAMSUNG=y
CONFIG_PINCTRL_EXYNOS=y
CONFIG_PINCTRL_EXYNOS_ARM=y
CONFIG_PINCTRL_EXYNOS_ARM64=y
CONFIG_PINCTRL_S3C24XX=y
# CONFIG_PINCTRL_S3C64XX is not set
CONFIG_PINCTRL_SPRD=y
CONFIG_PINCTRL_SPRD_SC9860=y
CONFIG_PINCTRL_STARFIVE_JH7100=m
CONFIG_PINCTRL_STM32=y
# CONFIG_PINCTRL_STM32F429 is not set
# CONFIG_PINCTRL_STM32F469 is not set
# CONFIG_PINCTRL_STM32F746 is not set
CONFIG_PINCTRL_STM32F769=y
# CONFIG_PINCTRL_STM32H743 is not set
CONFIG_PINCTRL_STM32MP135=y
# CONFIG_PINCTRL_STM32MP157 is not set
# CONFIG_PINCTRL_TI_IODELAY is not set
CONFIG_PINCTRL_UNIPHIER=y
# CONFIG_PINCTRL_UNIPHIER_LD4 is not set
CONFIG_PINCTRL_UNIPHIER_PRO4=y
# CONFIG_PINCTRL_UNIPHIER_SLD8 is not set
CONFIG_PINCTRL_UNIPHIER_PRO5=y
# CONFIG_PINCTRL_UNIPHIER_PXS2 is not set
CONFIG_PINCTRL_UNIPHIER_LD6B=y
# CONFIG_PINCTRL_UNIPHIER_LD11 is not set
CONFIG_PINCTRL_UNIPHIER_LD20=y
# CONFIG_PINCTRL_UNIPHIER_PXS3 is not set
CONFIG_PINCTRL_UNIPHIER_NX1=y
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
CONFIG_DEBUG_GPIO=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y
CONFIG_GPIO_MAX730X=y
CONFIG_GPIO_IDIO_16=m

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_ASPEED is not set
CONFIG_GPIO_ASPEED_SGPIO=y
CONFIG_GPIO_ATH79=y
# CONFIG_GPIO_RASPBERRYPI_EXP is not set
CONFIG_GPIO_BCM_KONA=y
# CONFIG_GPIO_BCM_XGS_IPROC is not set
CONFIG_GPIO_BRCMSTB=m
# CONFIG_GPIO_CADENCE is not set
CONFIG_GPIO_CLPS711X=y
CONFIG_GPIO_DWAPB=m
CONFIG_GPIO_EIC_SPRD=y
CONFIG_GPIO_EM=m
CONFIG_GPIO_FTGPIO010=y
# CONFIG_GPIO_GENERIC_PLATFORM is not set
# CONFIG_GPIO_GRGPIO is not set
CONFIG_GPIO_HISI=m
CONFIG_GPIO_HLWD=y
CONFIG_GPIO_IOP=m
CONFIG_GPIO_LOGICVC=m
# CONFIG_GPIO_LPC18XX is not set
# CONFIG_GPIO_LPC32XX is not set
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_MT7621 is not set
CONFIG_GPIO_MXC=y
# CONFIG_GPIO_MXS is not set
CONFIG_GPIO_PMIC_EIC_SPRD=m
CONFIG_GPIO_PXA=y
# CONFIG_GPIO_RCAR is not set
CONFIG_GPIO_RDA=y
# CONFIG_GPIO_ROCKCHIP is not set
CONFIG_GPIO_SAMA5D2_PIOBU=m
CONFIG_GPIO_SIFIVE=y
CONFIG_GPIO_SIOX=m
# CONFIG_GPIO_SNPS_CREG is not set
CONFIG_GPIO_SPRD=y
# CONFIG_GPIO_STP_XWAY is not set
CONFIG_GPIO_SYSCON=y
# CONFIG_GPIO_TEGRA is not set
CONFIG_GPIO_TEGRA186=y
# CONFIG_GPIO_TS4800 is not set
CONFIG_GPIO_THUNDERX=m
# CONFIG_GPIO_UNIPHIER is not set
# CONFIG_GPIO_VISCONTI is not set
# CONFIG_GPIO_VX855 is not set
CONFIG_GPIO_XGENE_SB=y
CONFIG_GPIO_XILINX=m
# CONFIG_GPIO_XLP is not set
CONFIG_GPIO_AMD_FCH=y
CONFIG_GPIO_IDT3243X=y
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=y
# CONFIG_GPIO_GW_PLD is not set
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
CONFIG_GPIO_PCA953X=m
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=m
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=y
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=m
CONFIG_GPIO_BD71815=m
# CONFIG_GPIO_BD71828 is not set
CONFIG_GPIO_BD9571MWV=m
CONFIG_GPIO_DA9055=m
# CONFIG_GPIO_DLN2 is not set
CONFIG_GPIO_JANZ_TTL=m
CONFIG_GPIO_LP3943=y
# CONFIG_GPIO_MADERA is not set
CONFIG_GPIO_MAX77650=m
# CONFIG_GPIO_RC5T583 is not set
# CONFIG_GPIO_SL28CPLD is not set
# CONFIG_GPIO_TPS65086 is not set
CONFIG_GPIO_TPS6586X=y
CONFIG_GPIO_TQMX86=m
# end of MFD GPIO expanders

#
# PCI GPIO expanders
#
CONFIG_GPIO_AMD8111=y
CONFIG_GPIO_BT8XX=y
# CONFIG_GPIO_MLXBF is not set
CONFIG_GPIO_MLXBF2=m
CONFIG_GPIO_ML_IOH=m
CONFIG_GPIO_PCH=m
CONFIG_GPIO_PCI_IDIO_16=m
# CONFIG_GPIO_PCIE_IDIO_24 is not set
CONFIG_GPIO_RDC321X=y
# end of PCI GPIO expanders

#
# USB GPIO expanders
#
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
CONFIG_GPIO_AGGREGATOR=y
CONFIG_GPIO_LATCH=y
CONFIG_GPIO_MOCKUP=m
# CONFIG_GPIO_VIRTIO is not set
CONFIG_GPIO_SIM=m
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_MATROX=y
# CONFIG_W1_MASTER_DS2490 is not set
CONFIG_W1_MASTER_DS2482=m
# CONFIG_W1_MASTER_MXC is not set
CONFIG_W1_MASTER_DS1WM=y
# CONFIG_W1_MASTER_GPIO is not set
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
# CONFIG_W1_SLAVE_DS2405 is not set
CONFIG_W1_SLAVE_DS2408=m
CONFIG_W1_SLAVE_DS2408_READBACK=y
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
CONFIG_W1_SLAVE_DS2430=y
CONFIG_W1_SLAVE_DS2431=y
# CONFIG_W1_SLAVE_DS2433 is not set
CONFIG_W1_SLAVE_DS2438=m
# CONFIG_W1_SLAVE_DS250X is not set
# CONFIG_W1_SLAVE_DS2780 is not set
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_ATC260X is not set
# CONFIG_POWER_RESET_BRCMKONA is not set
CONFIG_POWER_RESET_BRCMSTB=y
# CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
# CONFIG_POWER_RESET_GPIO is not set
CONFIG_POWER_RESET_GPIO_RESTART=y
# CONFIG_POWER_RESET_OCELOT_RESET is not set
# CONFIG_POWER_RESET_PIIX4_POWEROFF is not set
# CONFIG_POWER_RESET_LTC2952 is not set
CONFIG_POWER_RESET_MT6323=y
CONFIG_POWER_RESET_REGULATOR=y
# CONFIG_POWER_RESET_RESTART is not set
# CONFIG_POWER_RESET_TPS65086 is not set
CONFIG_POWER_RESET_KEYSTONE=y
# CONFIG_POWER_RESET_SYSCON is not set
CONFIG_POWER_RESET_SYSCON_POWEROFF=y
CONFIG_POWER_RESET_RMOBILE=y
CONFIG_REBOOT_MODE=m
# CONFIG_SYSCON_REBOOT_MODE is not set
CONFIG_POWER_RESET_SC27XX=m
CONFIG_NVMEM_REBOOT_MODE=m
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
CONFIG_PDA_POWER=y
# CONFIG_GENERIC_ADC_BATTERY is not set
CONFIG_IP5XXX_POWER=m
CONFIG_MAX8925_POWER=y
CONFIG_TEST_POWER=m
CONFIG_BATTERY_88PM860X=y
# CONFIG_CHARGER_ADP5061 is not set
CONFIG_BATTERY_ACT8945A=y
# CONFIG_BATTERY_CW2015 is not set
CONFIG_BATTERY_DS2760=y
# CONFIG_BATTERY_DS2780 is not set
CONFIG_BATTERY_DS2781=y
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_LEGO_EV3=y
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_SBS=m
# CONFIG_CHARGER_SBS is not set
# CONFIG_MANAGER_SBS is not set
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=m
CONFIG_BATTERY_BQ27XXX_HDQ=y
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
CONFIG_CHARGER_DA9150=m
# CONFIG_BATTERY_DA9150 is not set
# CONFIG_CHARGER_AXP20X is not set
# CONFIG_BATTERY_AXP20X is not set
CONFIG_AXP20X_POWER=m
CONFIG_BATTERY_MAX17040=y
CONFIG_BATTERY_MAX17042=m
CONFIG_BATTERY_MAX1721X=y
# CONFIG_CHARGER_88PM860X is not set
CONFIG_CHARGER_PCF50633=m
CONFIG_CHARGER_ISP1704=m
CONFIG_CHARGER_MAX8903=m
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_LP8788=m
CONFIG_CHARGER_GPIO=m
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=m
# CONFIG_CHARGER_LTC4162L is not set
CONFIG_CHARGER_MAX14577=m
# CONFIG_CHARGER_DETECTOR_MAX14656 is not set
# CONFIG_CHARGER_MAX77650 is not set
# CONFIG_CHARGER_MAX77976 is not set
CONFIG_CHARGER_MT6360=m
CONFIG_CHARGER_MT6370=y
CONFIG_CHARGER_QCOM_SMBB=m
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=m
CONFIG_CHARGER_BQ24735=m
# CONFIG_CHARGER_BQ2515X is not set
# CONFIG_CHARGER_BQ25890 is not set
CONFIG_CHARGER_BQ25980=y
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_CHARGER_SMB347 is not set
CONFIG_CHARGER_TPS65090=y
# CONFIG_CHARGER_TPS65217 is not set
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
# CONFIG_BATTERY_GOLDFISH is not set
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
# CONFIG_CHARGER_SC2731 is not set
# CONFIG_FUEL_GAUGE_SC27XX is not set
# CONFIG_CHARGER_UCS1002 is not set
CONFIG_CHARGER_BD99954=y
# CONFIG_RN5T618_POWER is not set
# CONFIG_BATTERY_ACER_A500 is not set
CONFIG_BATTERY_UG3105=m
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
# CONFIG_HWMON_DEBUG_CHIP is not set

#
# Native drivers
#
CONFIG_SENSORS_SMPRO=m
CONFIG_SENSORS_AD7414=m
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1025=m
CONFIG_SENSORS_ADM1026=m
CONFIG_SENSORS_ADM1029=m
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
CONFIG_SENSORS_ADT7X10=m
CONFIG_SENSORS_ADT7410=m
CONFIG_SENSORS_ADT7411=m
# CONFIG_SENSORS_ADT7462 is not set
CONFIG_SENSORS_ADT7470=m
# CONFIG_SENSORS_ADT7475 is not set
CONFIG_SENSORS_AHT10=m
# CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
CONFIG_SENSORS_AS370=m
CONFIG_SENSORS_ASC7621=m
CONFIG_SENSORS_AXI_FAN_CONTROL=m
CONFIG_SENSORS_ARM_SCPI=m
# CONFIG_SENSORS_ASB100 is not set
CONFIG_SENSORS_ASPEED=m
CONFIG_SENSORS_ATXP1=m
# CONFIG_SENSORS_BT1_PVT is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
CONFIG_SENSORS_CORSAIR_PSU=m
CONFIG_SENSORS_DRIVETEMP=m
# CONFIG_SENSORS_DS620 is not set
CONFIG_SENSORS_DS1621=m
CONFIG_SENSORS_DA9055=m
CONFIG_SENSORS_I5K_AMB=m
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
CONFIG_SENSORS_F75375S=m
CONFIG_SENSORS_GSC=m
# CONFIG_SENSORS_FSCHMD is not set
CONFIG_SENSORS_GL518SM=m
CONFIG_SENSORS_GL520SM=m
# CONFIG_SENSORS_G760A is not set
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_GPIO_FAN=m
# CONFIG_SENSORS_HIH6130 is not set
CONFIG_SENSORS_IBMAEM=m
# CONFIG_SENSORS_IBMPEX is not set
# CONFIG_SENSORS_IIO_HWMON is not set
# CONFIG_SENSORS_IT87 is not set
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=m
# CONFIG_SENSORS_LAN966X is not set
# CONFIG_SENSORS_LINEAGE is not set
# CONFIG_SENSORS_LOCHNAGAR is not set
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
# CONFIG_SENSORS_LTC2990 is not set
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
# CONFIG_SENSORS_LTC4215 is not set
# CONFIG_SENSORS_LTC4222 is not set
# CONFIG_SENSORS_LTC4245 is not set
CONFIG_SENSORS_LTC4260=m
# CONFIG_SENSORS_LTC4261 is not set
CONFIG_SENSORS_MAX127=m
# CONFIG_SENSORS_MAX16065 is not set
CONFIG_SENSORS_MAX1619=m
CONFIG_SENSORS_MAX1668=m
CONFIG_SENSORS_MAX197=m
CONFIG_SENSORS_MAX31730=m
# CONFIG_SENSORS_MAX31760 is not set
CONFIG_SENSORS_MAX6620=m
CONFIG_SENSORS_MAX6621=m
CONFIG_SENSORS_MAX6639=m
# CONFIG_SENSORS_MAX6650 is not set
CONFIG_SENSORS_MAX6697=m
CONFIG_SENSORS_MAX31790=m
CONFIG_SENSORS_MCP3021=m
CONFIG_SENSORS_TC654=m
CONFIG_SENSORS_TPS23861=m
CONFIG_SENSORS_MENF21BMC_HWMON=m
CONFIG_SENSORS_MR75203=m
CONFIG_SENSORS_LM63=m
# CONFIG_SENSORS_LM73 is not set
# CONFIG_SENSORS_LM75 is not set
CONFIG_SENSORS_LM77=m
# CONFIG_SENSORS_LM78 is not set
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=m
CONFIG_SENSORS_LM85=m
CONFIG_SENSORS_LM87=m
CONFIG_SENSORS_LM90=m
CONFIG_SENSORS_LM92=m
CONFIG_SENSORS_LM93=m
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
# CONFIG_SENSORS_PC87360 is not set
# CONFIG_SENSORS_PC87427 is not set
# CONFIG_SENSORS_NTC_THERMISTOR is not set
CONFIG_SENSORS_NCT6683=m
CONFIG_SENSORS_NCT6775_CORE=m
CONFIG_SENSORS_NCT6775=m
# CONFIG_SENSORS_NCT6775_I2C is not set
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NPCM7XX=m
CONFIG_SENSORS_NSA320=m
CONFIG_SENSORS_NZXT_KRAKEN2=m
CONFIG_SENSORS_NZXT_SMART2=m
CONFIG_SENSORS_OCC_P8_I2C=m
CONFIG_SENSORS_OCC=m
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
# CONFIG_SENSORS_PMBUS is not set
# CONFIG_SENSORS_ADM1266 is not set
# CONFIG_SENSORS_ADM1275 is not set
CONFIG_SENSORS_BEL_PFE=m
# CONFIG_SENSORS_BPA_RS600 is not set
CONFIG_SENSORS_DELTA_AHE50DC_FAN=m
# CONFIG_SENSORS_FSP_3Y is not set
# CONFIG_SENSORS_IBM_CFFPS is not set
# CONFIG_SENSORS_DPS920AB is not set
CONFIG_SENSORS_INSPUR_IPSPS=m
# CONFIG_SENSORS_IR35221 is not set
CONFIG_SENSORS_IR36021=m
CONFIG_SENSORS_IR38064=m
CONFIG_SENSORS_IR38064_REGULATOR=y
CONFIG_SENSORS_IRPS5401=m
CONFIG_SENSORS_ISL68137=m
# CONFIG_SENSORS_LM25066 is not set
CONFIG_SENSORS_LT7182S=m
# CONFIG_SENSORS_LTC2978 is not set
# CONFIG_SENSORS_LTC3815 is not set
CONFIG_SENSORS_MAX15301=m
CONFIG_SENSORS_MAX16064=m
# CONFIG_SENSORS_MAX16601 is not set
CONFIG_SENSORS_MAX20730=m
CONFIG_SENSORS_MAX20751=m
CONFIG_SENSORS_MAX31785=m
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
CONFIG_SENSORS_MP2888=m
CONFIG_SENSORS_MP2975=m
CONFIG_SENSORS_MP5023=m
CONFIG_SENSORS_PIM4328=m
CONFIG_SENSORS_PLI1209BC=m
# CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
CONFIG_SENSORS_PM6764TR=m
# CONFIG_SENSORS_PXE1610 is not set
# CONFIG_SENSORS_Q54SJ108A2 is not set
CONFIG_SENSORS_STPDDC60=m
CONFIG_SENSORS_TPS40422=m
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_TPS546D24=m
CONFIG_SENSORS_UCD9000=m
# CONFIG_SENSORS_UCD9200 is not set
# CONFIG_SENSORS_XDPE152 is not set
# CONFIG_SENSORS_XDPE122 is not set
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_PWM_FAN=m
# CONFIG_SENSORS_RASPBERRYPI_HWMON is not set
# CONFIG_SENSORS_SL28CPLD is not set
CONFIG_SENSORS_SBTSI=m
CONFIG_SENSORS_SBRMI=m
CONFIG_SENSORS_SHT15=m
# CONFIG_SENSORS_SHT21 is not set
CONFIG_SENSORS_SHT3x=m
CONFIG_SENSORS_SHT4x=m
CONFIG_SENSORS_SHTC1=m
CONFIG_SENSORS_SIS5595=m
CONFIG_SENSORS_SY7636A=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
CONFIG_SENSORS_EMC2103=m
CONFIG_SENSORS_EMC2305=m
CONFIG_SENSORS_EMC6W201=m
CONFIG_SENSORS_SMSC47M1=m
# CONFIG_SENSORS_SMSC47M192 is not set
CONFIG_SENSORS_SMSC47B397=m
CONFIG_SENSORS_STTS751=m
# CONFIG_SENSORS_SMM665 is not set
CONFIG_SENSORS_ADC128D818=m
CONFIG_SENSORS_ADS7828=m
# CONFIG_SENSORS_AMC6821 is not set
CONFIG_SENSORS_INA209=m
CONFIG_SENSORS_INA2XX=m
# CONFIG_SENSORS_INA238 is not set
# CONFIG_SENSORS_INA3221 is not set
CONFIG_SENSORS_TC74=m
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=m
# CONFIG_SENSORS_TMP103 is not set
# CONFIG_SENSORS_TMP108 is not set
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
# CONFIG_SENSORS_TMP464 is not set
# CONFIG_SENSORS_TMP513 is not set
CONFIG_SENSORS_VIA686A=m
# CONFIG_SENSORS_VT1211 is not set
# CONFIG_SENSORS_VT8231 is not set
# CONFIG_SENSORS_W83773G is not set
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
# CONFIG_SENSORS_W83792D is not set
CONFIG_SENSORS_W83793=m
CONFIG_SENSORS_W83795=m
CONFIG_SENSORS_W83795_FANCTRL=y
CONFIG_SENSORS_W83L785TS=m
# CONFIG_SENSORS_W83L786NG is not set
# CONFIG_SENSORS_W83627HF is not set
# CONFIG_SENSORS_W83627EHF is not set
CONFIG_SENSORS_ULTRA45=m
CONFIG_THERMAL=y
# CONFIG_THERMAL_STATISTICS is not set
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_OF is not set
# CONFIG_THERMAL_WRITABLE_TRIPS is not set
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
# CONFIG_THERMAL_GOV_USER_SPACE is not set
# CONFIG_THERMAL_EMULATION is not set
# CONFIG_THERMAL_MMIO is not set
# CONFIG_HISI_THERMAL is not set
CONFIG_IMX_THERMAL=m
CONFIG_IMX8MM_THERMAL=y
CONFIG_K3_THERMAL=m
# CONFIG_SPEAR_THERMAL is not set
CONFIG_SUN8I_THERMAL=m
CONFIG_ROCKCHIP_THERMAL=m
CONFIG_RCAR_THERMAL=y
# CONFIG_RCAR_GEN3_THERMAL is not set
# CONFIG_RZG2L_THERMAL is not set
CONFIG_KIRKWOOD_THERMAL=m
CONFIG_DOVE_THERMAL=m
CONFIG_ARMADA_THERMAL=y
CONFIG_DA9062_THERMAL=y
# CONFIG_MTK_THERMAL is not set

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
CONFIG_BRCMSTB_THERMAL=m
CONFIG_BCM_NS_THERMAL=m
CONFIG_BCM_SR_THERMAL=y
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
# CONFIG_TI_SOC_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# end of Samsung thermal drivers

#
# NVIDIA Tegra thermal drivers
#
CONFIG_TEGRA_SOCTHERM=y
CONFIG_TEGRA_BPMP_THERMAL=y
CONFIG_TEGRA30_TSENSOR=m
# end of NVIDIA Tegra thermal drivers

CONFIG_GENERIC_ADC_THERMAL=y

#
# Qualcomm thermal drivers
#
CONFIG_QCOM_TSENS=m
CONFIG_QCOM_SPMI_ADC_TM5=m
# CONFIG_QCOM_SPMI_TEMP_ALARM is not set
# end of Qualcomm thermal drivers

CONFIG_SPRD_THERMAL=m
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_PCIHOST_POSSIBLE=y
# CONFIG_SSB_PCIHOST is not set
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
# CONFIG_SSB_PCMCIAHOST is not set
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
CONFIG_SSB_HOST_SOC=y
# CONFIG_SSB_DRIVER_GPIO is not set
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
CONFIG_BCMA_HOST_PCI_POSSIBLE=y
# CONFIG_BCMA_HOST_PCI is not set
CONFIG_BCMA_HOST_SOC=y
# CONFIG_BCMA_DRIVER_PCI is not set
CONFIG_BCMA_DRIVER_MIPS=y
CONFIG_BCMA_PFLASH=y
CONFIG_BCMA_SFLASH=y
CONFIG_BCMA_NFLASH=y
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ACT8945A=y
CONFIG_MFD_SUN4I_GPADC=m
CONFIG_MFD_AS3711=y
CONFIG_MFD_SMPRO=m
# CONFIG_MFD_AS3722 is not set
CONFIG_PMIC_ADP5520=y
CONFIG_MFD_AAT2870_CORE=y
# CONFIG_MFD_AT91_USART is not set
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=m
CONFIG_MFD_CS47L15=y
CONFIG_MFD_CS47L35=y
# CONFIG_MFD_CS47L85 is not set
CONFIG_MFD_CS47L90=y
# CONFIG_MFD_CS47L92 is not set
CONFIG_MFD_ASIC3=y
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
# CONFIG_MFD_DA9062 is not set
# CONFIG_MFD_DA9063 is not set
CONFIG_MFD_DA9150=y
CONFIG_MFD_DLN2=m
CONFIG_MFD_ENE_KB3930=m
CONFIG_MFD_EXYNOS_LPASS=m
CONFIG_MFD_GATEWORKS_GSC=m
# CONFIG_MFD_MC13XXX_I2C is not set
# CONFIG_MFD_MP2629 is not set
CONFIG_MFD_MXS_LRADC=y
# CONFIG_MFD_MX25_TSADC is not set
CONFIG_MFD_HI6421_PMIC=y
# CONFIG_MFD_HI6421_SPMI is not set
CONFIG_MFD_HI655X_PMIC=y
# CONFIG_HTC_PASIC3 is not set
# CONFIG_LPC_ICH is not set
CONFIG_LPC_SCH=y
# CONFIG_MFD_IQS62X is not set
CONFIG_MFD_JANZ_CMODIO=m
# CONFIG_MFD_KEMPLD is not set
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=y
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=m
# CONFIG_MFD_MAX77620 is not set
CONFIG_MFD_MAX77650=m
CONFIG_MFD_MAX77686=y
# CONFIG_MFD_MAX77693 is not set
CONFIG_MFD_MAX77714=y
CONFIG_MFD_MAX77843=y
CONFIG_MFD_MAX8907=y
CONFIG_MFD_MAX8925=y
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
CONFIG_MFD_MT6360=m
CONFIG_MFD_MT6370=y
CONFIG_MFD_MT6397=m
CONFIG_MFD_MENF21BMC=y
# CONFIG_MFD_VIPERBOARD is not set
# CONFIG_MFD_NTXEC is not set
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=m
CONFIG_PCF50633_ADC=m
# CONFIG_PCF50633_GPIO is not set
# CONFIG_MFD_PM8XXX is not set
CONFIG_MFD_SPMI_PMIC=y
CONFIG_MFD_SY7636A=y
CONFIG_MFD_RDC321X=y
CONFIG_MFD_RT4831=m
CONFIG_MFD_RT5033=m
# CONFIG_MFD_RT5120 is not set
CONFIG_MFD_RC5T583=y
# CONFIG_MFD_RK808 is not set
CONFIG_MFD_RN5T618=m
# CONFIG_MFD_SEC_CORE is not set
# CONFIG_MFD_SI476X_CORE is not set
CONFIG_MFD_SIMPLE_MFD_I2C=y
CONFIG_MFD_SL28CPLD=m
CONFIG_MFD_SM501=y
# CONFIG_MFD_SM501_GPIO is not set
# CONFIG_MFD_SKY81452 is not set
# CONFIG_ABX500_CORE is not set
# CONFIG_MFD_STMPE is not set
CONFIG_MFD_SUN6I_PRCM=y
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=m
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=m
CONFIG_TPS65010=m
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=m
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TPS65217=m
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
CONFIG_MFD_TPS65219=y
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
# CONFIG_MFD_TPS65912_I2C is not set
# CONFIG_TWL4030_CORE is not set
# CONFIG_TWL6040_CORE is not set
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=m
# CONFIG_MFD_TIMBERDALE is not set
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_TQMX86=m
CONFIG_MFD_VX855=m
CONFIG_MFD_LOCHNAGAR=y
# CONFIG_MFD_ARIZONA_I2C is not set
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
# CONFIG_MFD_WM8350_I2C is not set
# CONFIG_MFD_WM8994 is not set
# CONFIG_MFD_STW481X is not set
CONFIG_MFD_ROHM_BD718XX=m
CONFIG_MFD_ROHM_BD71828=m
CONFIG_MFD_ROHM_BD957XMUF=m
CONFIG_MFD_STM32_LPTIMER=m
CONFIG_MFD_STM32_TIMERS=y
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=m
# CONFIG_MFD_WCD934X is not set
CONFIG_MFD_ATC260X=y
CONFIG_MFD_ATC260X_I2C=y
# CONFIG_MFD_KHADAS_MCU is not set
CONFIG_MFD_ACER_A500_EC=m
# CONFIG_MFD_QCOM_PM8008 is not set
CONFIG_RAVE_SP_CORE=m
# CONFIG_MFD_RSMU_I2C is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=m
CONFIG_REGULATOR_VIRTUAL_CONSUMER=m
CONFIG_REGULATOR_USERSPACE_CONSUMER=m
# CONFIG_REGULATOR_88PG86X is not set
CONFIG_REGULATOR_88PM800=y
# CONFIG_REGULATOR_88PM8607 is not set
CONFIG_REGULATOR_ACT8865=m
CONFIG_REGULATOR_ACT8945A=m
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_ANATOP=m
# CONFIG_REGULATOR_AAT2870 is not set
CONFIG_REGULATOR_AS3711=y
CONFIG_REGULATOR_ATC260X=m
CONFIG_REGULATOR_AXP20X=m
# CONFIG_REGULATOR_BCM590XX is not set
CONFIG_REGULATOR_BD71815=m
CONFIG_REGULATOR_BD71828=m
CONFIG_REGULATOR_BD718XX=m
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_BD957XMUF=m
# CONFIG_REGULATOR_DA9055 is not set
# CONFIG_REGULATOR_DA9121 is not set
# CONFIG_REGULATOR_DA9210 is not set
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=y
# CONFIG_REGULATOR_FAN53880 is not set
CONFIG_REGULATOR_GPIO=y
CONFIG_REGULATOR_HI6421=y
CONFIG_REGULATOR_HI6421V530=m
CONFIG_REGULATOR_HI655X=y
# CONFIG_REGULATOR_ISL9305 is not set
# CONFIG_REGULATOR_ISL6271A is not set
# CONFIG_REGULATOR_LOCHNAGAR is not set
# CONFIG_REGULATOR_LP3971 is not set
CONFIG_REGULATOR_LP3972=m
CONFIG_REGULATOR_LP872X=m
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LP8788=m
# CONFIG_REGULATOR_LTC3589 is not set
CONFIG_REGULATOR_LTC3676=y
# CONFIG_REGULATOR_MAX14577 is not set
CONFIG_REGULATOR_MAX1586=m
CONFIG_REGULATOR_MAX77620=y
CONFIG_REGULATOR_MAX77650=y
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=m
# CONFIG_REGULATOR_MAX8893 is not set
CONFIG_REGULATOR_MAX8907=m
# CONFIG_REGULATOR_MAX8925 is not set
# CONFIG_REGULATOR_MAX8952 is not set
CONFIG_REGULATOR_MAX20086=m
CONFIG_REGULATOR_MAX77686=m
# CONFIG_REGULATOR_MAX77693 is not set
# CONFIG_REGULATOR_MAX77802 is not set
CONFIG_REGULATOR_MAX77826=m
CONFIG_REGULATOR_MCP16502=m
# CONFIG_REGULATOR_MP5416 is not set
CONFIG_REGULATOR_MP8859=y
CONFIG_REGULATOR_MP886X=y
CONFIG_REGULATOR_MPQ7920=y
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6315=m
CONFIG_REGULATOR_MT6323=m
# CONFIG_REGULATOR_MT6331 is not set
CONFIG_REGULATOR_MT6332=m
CONFIG_REGULATOR_MT6357=m
CONFIG_REGULATOR_MT6358=m
CONFIG_REGULATOR_MT6359=m
CONFIG_REGULATOR_MT6360=m
CONFIG_REGULATOR_MT6370=m
CONFIG_REGULATOR_MT6380=m
# CONFIG_REGULATOR_MT6397 is not set
CONFIG_REGULATOR_PBIAS=y
# CONFIG_REGULATOR_PCA9450 is not set
CONFIG_REGULATOR_PCF50633=m
CONFIG_REGULATOR_PF8X00=m
CONFIG_REGULATOR_PFUZE100=y
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=m
CONFIG_REGULATOR_PV88090=m
# CONFIG_REGULATOR_QCOM_RPMH is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
CONFIG_REGULATOR_QCOM_USB_VBUS=m
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
# CONFIG_REGULATOR_RC5T583 is not set
CONFIG_REGULATOR_RN5T618=m
CONFIG_REGULATOR_ROHM=m
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4831=m
CONFIG_REGULATOR_RT5033=m
# CONFIG_REGULATOR_RT5190A is not set
CONFIG_REGULATOR_RT5759=m
# CONFIG_REGULATOR_RT6160 is not set
CONFIG_REGULATOR_RT6190=m
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=y
# CONFIG_REGULATOR_RTMV20 is not set
CONFIG_REGULATOR_RTQ6752=m
CONFIG_REGULATOR_S2MPA01=y
# CONFIG_REGULATOR_S2MPS11 is not set
CONFIG_REGULATOR_S5M8767=y
# CONFIG_REGULATOR_SC2731 is not set
CONFIG_REGULATOR_SLG51000=y
CONFIG_REGULATOR_STM32_BOOSTER=y
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STM32_PWR is not set
CONFIG_REGULATOR_STPMIC1=m
CONFIG_REGULATOR_TI_ABB=y
# CONFIG_REGULATOR_STW481X_VMMC is not set
# CONFIG_REGULATOR_SY7636A is not set
# CONFIG_REGULATOR_SY8106A is not set
# CONFIG_REGULATOR_SY8824X is not set
CONFIG_REGULATOR_SY8827N=m
# CONFIG_REGULATOR_TPS51632 is not set
CONFIG_REGULATOR_TPS6105X=m
CONFIG_REGULATOR_TPS62360=y
CONFIG_REGULATOR_TPS6286X=m
CONFIG_REGULATOR_TPS65023=m
# CONFIG_REGULATOR_TPS6507X is not set
CONFIG_REGULATOR_TPS65086=m
# CONFIG_REGULATOR_TPS65090 is not set
# CONFIG_REGULATOR_TPS65132 is not set
# CONFIG_REGULATOR_TPS65217 is not set
CONFIG_REGULATOR_TPS65219=m
# CONFIG_REGULATOR_TPS6586X is not set
CONFIG_REGULATOR_TPS68470=y
CONFIG_REGULATOR_UNIPHIER=y
CONFIG_REGULATOR_VCTRL=m
CONFIG_REGULATOR_WM8400=y
CONFIG_REGULATOR_QCOM_LABIBB=y
CONFIG_RC_CORE=y
# CONFIG_BPF_LIRC_MODE2 is not set
CONFIG_LIRC=y
CONFIG_RC_MAP=y
CONFIG_RC_DECODERS=y
# CONFIG_IR_IMON_DECODER is not set
# CONFIG_IR_JVC_DECODER is not set
CONFIG_IR_MCE_KBD_DECODER=y
# CONFIG_IR_NEC_DECODER is not set
# CONFIG_IR_RC5_DECODER is not set
# CONFIG_IR_RC6_DECODER is not set
CONFIG_IR_RCMM_DECODER=y
CONFIG_IR_SANYO_DECODER=m
CONFIG_IR_SHARP_DECODER=y
CONFIG_IR_SONY_DECODER=y
CONFIG_IR_XMP_DECODER=m
CONFIG_RC_DEVICES=y
CONFIG_IR_ENE=m
CONFIG_IR_FINTEK=m
# CONFIG_IR_GPIO_CIR is not set
# CONFIG_IR_GPIO_TX is not set
CONFIG_IR_HIX5HD2=m
# CONFIG_IR_IGORPLUGUSB is not set
# CONFIG_IR_IGUANA is not set
CONFIG_IR_IMON=m
CONFIG_IR_IMON_RAW=y
CONFIG_IR_ITE_CIR=y
# CONFIG_IR_MCEUSB is not set
CONFIG_IR_MESON=m
CONFIG_IR_MESON_TX=y
# CONFIG_IR_MTK is not set
CONFIG_IR_NUVOTON=m
CONFIG_IR_REDRAT3=y
CONFIG_IR_RX51=y
# CONFIG_IR_SERIAL is not set
CONFIG_IR_STREAMZAP=y
CONFIG_IR_SUNXI=y
CONFIG_IR_TOY=m
CONFIG_IR_TTUSBIR=m
# CONFIG_IR_WINBOND_CIR is not set
# CONFIG_RC_ATI_REMOTE is not set
# CONFIG_RC_LOOPBACK is not set
CONFIG_RC_ST=m
# CONFIG_RC_XBOX_DVD is not set
CONFIG_IR_IMG=m
# CONFIG_IR_IMG_RAW is not set
CONFIG_IR_IMG_HW=y
# CONFIG_IR_IMG_NEC is not set
CONFIG_IR_IMG_JVC=y
CONFIG_IR_IMG_SONY=y
# CONFIG_IR_IMG_SHARP is not set
# CONFIG_IR_IMG_SANYO is not set
CONFIG_IR_IMG_RC5=y
CONFIG_IR_IMG_RC6=y
CONFIG_CEC_CORE=m
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
# CONFIG_MEDIA_CEC_SUPPORT is not set
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_APERTURE_HELPERS=y
CONFIG_VIDEO_NOMODESET=y
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=m
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_KMS_HELPER=m
# CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS is not set
CONFIG_DRM_DEBUG_MODESET_LOCK=y
# CONFIG_DRM_LOAD_EDID_FIRMWARE is not set
CONFIG_DRM_DP_AUX_BUS=m
CONFIG_DRM_DISPLAY_HELPER=m
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DISPLAY_HDMI_HELPER=y
# CONFIG_DRM_DP_AUX_CHARDEV is not set
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_TTM=m
CONFIG_DRM_BUDDY=m
CONFIG_DRM_VRAM_HELPER=m
CONFIG_DRM_TTM_HELPER=m
CONFIG_DRM_GEM_DMA_HELPER=m
CONFIG_DRM_GEM_SHMEM_HELPER=m
CONFIG_DRM_SCHED=m

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=m
CONFIG_DRM_I2C_SIL164=m
CONFIG_DRM_I2C_NXP_TDA998X=m
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

CONFIG_DRM_RADEON=m
# CONFIG_DRM_RADEON_USERPTR is not set
CONFIG_DRM_AMDGPU=m
CONFIG_DRM_AMDGPU_SI=y
# CONFIG_DRM_AMDGPU_CIK is not set
# CONFIG_DRM_AMDGPU_USERPTR is not set

#
# ACP (Audio CoProcessor) Configuration
#
# CONFIG_DRM_AMD_ACP is not set
# end of ACP (Audio CoProcessor) Configuration

#
# Display Engine Configuration
#
CONFIG_DRM_AMD_DC=y
CONFIG_DRM_AMD_DC_HDCP=y
# CONFIG_DRM_AMD_DC_SI is not set
CONFIG_DEBUG_KERNEL_DC=y
# end of Display Engine Configuration

CONFIG_DRM_NOUVEAU=m
CONFIG_NOUVEAU_LEGACY_CTX_SUPPORT=y
CONFIG_NOUVEAU_DEBUG=5
CONFIG_NOUVEAU_DEBUG_DEFAULT=3
# CONFIG_NOUVEAU_DEBUG_MMU is not set
# CONFIG_NOUVEAU_DEBUG_PUSH is not set
# CONFIG_DRM_NOUVEAU_BACKLIGHT is not set
# CONFIG_DRM_KMB_DISPLAY is not set
CONFIG_DRM_VGEM=m
CONFIG_DRM_VKMS=m
# CONFIG_DRM_ROCKCHIP is not set
CONFIG_DRM_UDL=m
CONFIG_DRM_AST=m
# CONFIG_DRM_MGAG200 is not set
CONFIG_DRM_RCAR_DW_HDMI=m
# CONFIG_DRM_RCAR_USE_LVDS is not set
# CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
# CONFIG_DRM_RZG2L_MIPI_DSI is not set
CONFIG_DRM_QXL=m
# CONFIG_DRM_VIRTIO_GPU is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_ARM_VERSATILE=m
# CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596 is not set
CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0=m
CONFIG_DRM_PANEL_BOE_HIMAX8279D=m
# CONFIG_DRM_PANEL_BOE_TV101WUM_NL6 is not set
CONFIG_DRM_PANEL_DSI_CM=m
# CONFIG_DRM_PANEL_LVDS is not set
CONFIG_DRM_PANEL_SIMPLE=m
CONFIG_DRM_PANEL_EDP=m
CONFIG_DRM_PANEL_EBBG_FT8719=m
CONFIG_DRM_PANEL_ELIDA_KD35T133=m
CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=m
CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=m
CONFIG_DRM_PANEL_ILITEK_ILI9881C=m
CONFIG_DRM_PANEL_INNOLUX_P079ZCA=m
CONFIG_DRM_PANEL_JADARD_JD9365DA_H3=m
CONFIG_DRM_PANEL_JDI_LT070ME05000=m
CONFIG_DRM_PANEL_JDI_R63452=m
CONFIG_DRM_PANEL_KHADAS_TS050=m
CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04=m
CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W=m
CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829=m
CONFIG_DRM_PANEL_NEWVISION_NV3051D=m
# CONFIG_DRM_PANEL_NOVATEK_NT35510 is not set
# CONFIG_DRM_PANEL_NOVATEK_NT35560 is not set
CONFIG_DRM_PANEL_NOVATEK_NT35950=m
# CONFIG_DRM_PANEL_NOVATEK_NT36672A is not set
# CONFIG_DRM_PANEL_MANTIX_MLAF057WE51 is not set
CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=m
CONFIG_DRM_PANEL_ORISETECH_OTM8009A=m
# CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS is not set
# CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=m
CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
# CONFIG_DRM_PANEL_RAYDIUM_RM68200 is not set
# CONFIG_DRM_PANEL_RONBO_RB070D30 is not set
# CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6D16D0 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2=m
CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03=m
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=m
# CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01=m
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=m
CONFIG_DRM_PANEL_SAMSUNG_SOFEF00=m
CONFIG_DRM_PANEL_SEIKO_43WVF1G=m
CONFIG_DRM_PANEL_SHARP_LQ101R1SX01=m
CONFIG_DRM_PANEL_SHARP_LS037V7DW01=m
CONFIG_DRM_PANEL_SHARP_LS043T1LE01=m
CONFIG_DRM_PANEL_SHARP_LS060T1SX01=m
CONFIG_DRM_PANEL_SITRONIX_ST7701=m
CONFIG_DRM_PANEL_SITRONIX_ST7703=m
CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521=m
# CONFIG_DRM_PANEL_TDO_TL070WSH30 is not set
CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
# CONFIG_DRM_PANEL_VISIONOX_RM69299 is not set
CONFIG_DRM_PANEL_XINPENG_XPP055C272=m
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_CDNS_DSI is not set
# CONFIG_DRM_CHIPONE_ICN6211 is not set
CONFIG_DRM_CHRONTEL_CH7033=m
# CONFIG_DRM_CROS_EC_ANX7688 is not set
CONFIG_DRM_DISPLAY_CONNECTOR=m
# CONFIG_DRM_FSL_LDB is not set
CONFIG_DRM_ITE_IT6505=m
CONFIG_DRM_LONTIUM_LT8912B=m
CONFIG_DRM_LONTIUM_LT9211=m
# CONFIG_DRM_LONTIUM_LT9611 is not set
# CONFIG_DRM_LONTIUM_LT9611UXC is not set
CONFIG_DRM_ITE_IT66121=m
CONFIG_DRM_LVDS_CODEC=m
CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW=m
CONFIG_DRM_NXP_PTN3460=m
CONFIG_DRM_PARADE_PS8622=m
CONFIG_DRM_PARADE_PS8640=m
CONFIG_DRM_SIL_SII8620=m
CONFIG_DRM_SII902X=m
# CONFIG_DRM_SII9234 is not set
# CONFIG_DRM_SIMPLE_BRIDGE is not set
# CONFIG_DRM_THINE_THC63LVD1024 is not set
CONFIG_DRM_TOSHIBA_TC358762=m
CONFIG_DRM_TOSHIBA_TC358764=m
# CONFIG_DRM_TOSHIBA_TC358767 is not set
CONFIG_DRM_TOSHIBA_TC358768=m
# CONFIG_DRM_TOSHIBA_TC358775 is not set
# CONFIG_DRM_TI_DLPC3433 is not set
# CONFIG_DRM_TI_TFP410 is not set
# CONFIG_DRM_TI_SN65DSI83 is not set
CONFIG_DRM_TI_SN65DSI86=m
CONFIG_DRM_TI_TPD12S015=m
# CONFIG_DRM_ANALOGIX_ANX6345 is not set
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
CONFIG_DRM_ANALOGIX_ANX7625=m
# CONFIG_DRM_I2C_ADV7511 is not set
CONFIG_DRM_CDNS_MHDP8546=m
CONFIG_DRM_CDNS_MHDP8546_J721E=y
# CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI is not set
CONFIG_DRM_DW_HDMI=m
# CONFIG_DRM_DW_HDMI_CEC is not set
# end of Display Interface Bridges

# CONFIG_DRM_ETNAVIV is not set
CONFIG_DRM_HISI_HIBMC=m
CONFIG_DRM_LOGICVC=m
# CONFIG_DRM_ARCPGU is not set
CONFIG_DRM_BOCHS=m
CONFIG_DRM_CIRRUS_QEMU=m
CONFIG_DRM_GM12U320=m
CONFIG_DRM_OFDRM=m
# CONFIG_DRM_SIMPLEDRM is not set
CONFIG_DRM_TVE200=m
# CONFIG_DRM_PANFROST is not set
CONFIG_DRM_ASPEED_GFX=m
# CONFIG_DRM_TIDSS is not set
CONFIG_DRM_GUD=m
# CONFIG_DRM_SSD130X is not set
CONFIG_DRM_SPRD=m
CONFIG_DRM_LEGACY=y
CONFIG_DRM_TDFX=m
CONFIG_DRM_R128=m
CONFIG_DRM_MGA=m
CONFIG_DRM_VIA=m
CONFIG_DRM_SAVAGE=m
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=m

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
# CONFIG_FB is not set
CONFIG_MMP_DISP=m
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
CONFIG_LCD_CLASS_DEVICE=y
CONFIG_LCD_PLATFORM=y
CONFIG_BACKLIGHT_CLASS_DEVICE=y
CONFIG_BACKLIGHT_KTD253=m
CONFIG_BACKLIGHT_LM3533=m
CONFIG_BACKLIGHT_OMAP1=m
# CONFIG_BACKLIGHT_MAX8925 is not set
CONFIG_BACKLIGHT_MT6370=m
CONFIG_BACKLIGHT_QCOM_WLED=y
# CONFIG_BACKLIGHT_RT4831 is not set
CONFIG_BACKLIGHT_ADP5520=m
CONFIG_BACKLIGHT_ADP8860=y
CONFIG_BACKLIGHT_ADP8870=y
CONFIG_BACKLIGHT_88PM860X=m
# CONFIG_BACKLIGHT_PCF50633 is not set
CONFIG_BACKLIGHT_AAT2870=m
# CONFIG_BACKLIGHT_LM3639 is not set
CONFIG_BACKLIGHT_TPS65217=m
CONFIG_BACKLIGHT_AS3711=m
CONFIG_BACKLIGHT_GPIO=m
CONFIG_BACKLIGHT_LV5207LP=m
CONFIG_BACKLIGHT_BD6107=y
CONFIG_BACKLIGHT_ARCXCNN=m
# CONFIG_BACKLIGHT_RAVE_SP is not set
# CONFIG_BACKLIGHT_LED is not set
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
# end of Graphics support

CONFIG_DRM_ACCEL=y
# CONFIG_SOUND is not set

#
# HID support
#
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=m
CONFIG_HID_GENERIC=m

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
# CONFIG_HID_ACCUTOUCH is not set
# CONFIG_HID_ACRUX is not set
# CONFIG_HID_APPLE is not set
CONFIG_HID_APPLEIR=m
# CONFIG_HID_ASUS is not set
CONFIG_HID_AUREAL=m
CONFIG_HID_BELKIN=m
CONFIG_HID_BETOP_FF=m
CONFIG_HID_BIGBEN_FF=m
CONFIG_HID_CHERRY=m
CONFIG_HID_CHICONY=m
# CONFIG_HID_CORSAIR is not set
CONFIG_HID_COUGAR=y
CONFIG_HID_MACALLY=y
CONFIG_HID_CMEDIA=m
CONFIG_HID_CP2112=m
# CONFIG_HID_CREATIVE_SB0540 is not set
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=m
CONFIG_DRAGONRISE_FF=y
CONFIG_HID_EMS_FF=m
CONFIG_HID_ELAN=m
CONFIG_HID_ELECOM=m
# CONFIG_HID_ELO is not set
# CONFIG_HID_EZKEY is not set
CONFIG_HID_FT260=m
CONFIG_HID_GEMBIRD=m
CONFIG_HID_GFRM=y
CONFIG_HID_GLORIOUS=y
CONFIG_HID_HOLTEK=m
CONFIG_HOLTEK_FF=y
CONFIG_HID_VIVALDI_COMMON=m
CONFIG_HID_VIVALDI=m
CONFIG_HID_GT683R=m
# CONFIG_HID_KEYTOUCH is not set
CONFIG_HID_KYE=m
# CONFIG_HID_UCLOGIC is not set
CONFIG_HID_WALTOP=y
CONFIG_HID_VIEWSONIC=m
CONFIG_HID_VRC2=m
CONFIG_HID_XIAOMI=m
# CONFIG_HID_GYRATION is not set
CONFIG_HID_ICADE=y
CONFIG_HID_ITE=y
CONFIG_HID_JABRA=y
CONFIG_HID_TWINHAN=m
CONFIG_HID_KENSINGTON=y
# CONFIG_HID_LCPOWER is not set
CONFIG_HID_LED=y
CONFIG_HID_LENOVO=m
CONFIG_HID_LETSKETCH=m
CONFIG_HID_LOGITECH=m
CONFIG_HID_LOGITECH_DJ=m
CONFIG_HID_LOGITECH_HIDPP=m
CONFIG_LOGITECH_FF=y
CONFIG_LOGIRUMBLEPAD2_FF=y
CONFIG_LOGIG940_FF=y
CONFIG_LOGIWHEELS_FF=y
CONFIG_HID_MAGICMOUSE=y
# CONFIG_HID_MALTRON is not set
CONFIG_HID_MAYFLASH=y
# CONFIG_HID_MEGAWORLD_FF is not set
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=m
CONFIG_HID_NINTENDO=y
# CONFIG_NINTENDO_FF is not set
# CONFIG_HID_NTI is not set
CONFIG_HID_NTRIG=m
# CONFIG_HID_ORTEK is not set
# CONFIG_HID_PANTHERLORD is not set
CONFIG_HID_PENMOUNT=m
# CONFIG_HID_PETALYNX is not set
# CONFIG_HID_PICOLCD is not set
# CONFIG_HID_PLANTRONICS is not set
CONFIG_HID_PLAYSTATION=m
CONFIG_PLAYSTATION_FF=y
CONFIG_HID_PXRC=y
# CONFIG_HID_RAZER is not set
CONFIG_HID_PRIMAX=y
# CONFIG_HID_RETRODE is not set
# CONFIG_HID_ROCCAT is not set
# CONFIG_HID_SAITEK is not set
# CONFIG_HID_SAMSUNG is not set
# CONFIG_HID_SEMITEK is not set
# CONFIG_HID_SIGMAMICRO is not set
CONFIG_HID_SONY=m
CONFIG_SONY_FF=y
# CONFIG_HID_SPEEDLINK is not set
CONFIG_HID_STEAM=y
CONFIG_HID_STEELSERIES=y
# CONFIG_HID_SUNPLUS is not set
# CONFIG_HID_RMI is not set
CONFIG_HID_GREENASIA=m
# CONFIG_GREENASIA_FF is not set
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
CONFIG_HID_TIVO=m
CONFIG_HID_TOPSEED=m
# CONFIG_HID_TOPRE is not set
CONFIG_HID_THINGM=m
CONFIG_HID_THRUSTMASTER=m
CONFIG_THRUSTMASTER_FF=y
# CONFIG_HID_UDRAW_PS3 is not set
CONFIG_HID_U2FZERO=m
CONFIG_HID_WACOM=m
CONFIG_HID_WIIMOTE=m
CONFIG_HID_XINMO=y
# CONFIG_HID_ZEROPLUS is not set
# CONFIG_HID_ZYDACRON is not set
# CONFIG_HID_SENSOR_HUB is not set
# CONFIG_HID_ALPS is not set
CONFIG_HID_MCP2221=m
# end of Special HID drivers

#
# USB HID support
#
CONFIG_USB_HID=m
# CONFIG_HID_PID is not set
CONFIG_USB_HIDDEV=y

#
# USB HID Boot Protocol drivers
#
# CONFIG_USB_KBD is not set
CONFIG_USB_MOUSE=y
# end of USB HID Boot Protocol drivers
# end of USB HID support

#
# I2C HID support
#
CONFIG_I2C_HID_OF=m
CONFIG_I2C_HID_OF_ELAN=y
CONFIG_I2C_HID_OF_GOODIX=m
# end of I2C HID support

CONFIG_I2C_HID_CORE=y

#
# Intel ISH HID support
#
# end of Intel ISH HID support

#
# AMD SFH HID Support
#
CONFIG_AMD_SFH_HID=y
# end of AMD SFH HID Support
# end of HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
CONFIG_USB_LED_TRIG=y
CONFIG_USB_ULPI_BUS=m
CONFIG_USB_CONN_GPIO=y
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
CONFIG_USB_PCI=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_FEW_INIT_RETRIES=y
CONFIG_USB_DYNAMIC_MINORS=y
CONFIG_USB_OTG=y
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB=y
CONFIG_USB_OTG_FSM=y
CONFIG_USB_LEDS_TRIGGER_USBPORT=m
CONFIG_USB_AUTOSUSPEND_DELAY=2
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=m
# CONFIG_USB_XHCI_HCD is not set
CONFIG_USB_EHCI_BRCMSTB=y
CONFIG_USB_BRCMSTB=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
CONFIG_USB_EHCI_TT_NEWSCHED=y
CONFIG_USB_EHCI_PCI=y
CONFIG_USB_EHCI_FSL=y
CONFIG_USB_EHCI_HCD_NPCM7XX=y
CONFIG_USB_EHCI_HCD_OMAP=y
CONFIG_USB_EHCI_HCD_ORION=y
# CONFIG_USB_EHCI_HCD_SPEAR is not set
CONFIG_USB_EHCI_HCD_STI=m
CONFIG_USB_EHCI_HCD_AT91=m
CONFIG_USB_EHCI_SH=y
CONFIG_USB_EHCI_EXYNOS=m
CONFIG_USB_EHCI_MV=y
CONFIG_USB_CNS3XXX_EHCI=y
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=m
# CONFIG_USB_ISP116X_HCD is not set
CONFIG_USB_ISP1362_HCD=y
CONFIG_USB_OHCI_HCD=m
CONFIG_USB_OHCI_HCD_SPEAR=m
CONFIG_USB_OHCI_HCD_STI=m
# CONFIG_USB_OHCI_HCD_S3C2410 is not set
CONFIG_USB_OHCI_HCD_LPC32XX=m
CONFIG_USB_OHCI_HCD_AT91=m
CONFIG_USB_OHCI_HCD_OMAP3=m
CONFIG_USB_OHCI_HCD_DAVINCI=m
CONFIG_USB_OHCI_HCD_PCI=m
# CONFIG_USB_OHCI_HCD_SSB is not set
# CONFIG_USB_OHCI_SH is not set
CONFIG_USB_OHCI_EXYNOS=m
CONFIG_USB_CNS3XXX_OHCI=y
CONFIG_USB_OHCI_HCD_PLATFORM=m
# CONFIG_USB_UHCI_HCD is not set
CONFIG_USB_U132_HCD=y
CONFIG_USB_SL811_HCD=m
# CONFIG_USB_SL811_HCD_ISO is not set
CONFIG_USB_SL811_CS=m
CONFIG_USB_R8A66597_HCD=y
CONFIG_USB_RENESAS_USBHS_HCD=y
CONFIG_USB_HCD_BCMA=m
# CONFIG_USB_HCD_SSB is not set
# CONFIG_USB_HCD_TEST_MODE is not set
CONFIG_USB_RENESAS_USBHS=y

#
# USB Device Class drivers
#
# CONFIG_USB_PRINTER is not set
CONFIG_USB_WDM=m
# CONFIG_USB_TMC is not set

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#
CONFIG_USB_STORAGE=y
CONFIG_USB_STORAGE_DEBUG=y
CONFIG_USB_STORAGE_REALTEK=m
CONFIG_REALTEK_AUTOPM=y
CONFIG_USB_STORAGE_DATAFAB=m
CONFIG_USB_STORAGE_FREECOM=y
CONFIG_USB_STORAGE_ISD200=y
CONFIG_USB_STORAGE_USBAT=y
# CONFIG_USB_STORAGE_SDDR09 is not set
CONFIG_USB_STORAGE_SDDR55=y
# CONFIG_USB_STORAGE_JUMPSHOT is not set
CONFIG_USB_STORAGE_ALAUDA=y
# CONFIG_USB_STORAGE_ONETOUCH is not set
CONFIG_USB_STORAGE_KARMA=m
# CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
CONFIG_USB_STORAGE_ENE_UB6250=m
CONFIG_USB_UAS=y

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
CONFIG_USB_MICROTEK=y

#
# USB dual-mode controller drivers
#
CONFIG_USB_CDNS_SUPPORT=y
# CONFIG_USB_CDNS3 is not set
CONFIG_USB_FOTG210=y
CONFIG_USB_FOTG210_HCD=y
CONFIG_USB_FOTG210_UDC=y
CONFIG_USB_MTU3=m
# CONFIG_USB_MTU3_HOST is not set
CONFIG_USB_MTU3_GADGET=y
# CONFIG_USB_MTU3_DUAL_ROLE is not set
CONFIG_USB_MTU3_DEBUG=y
CONFIG_USB_MUSB_HDRC=m
CONFIG_USB_MUSB_HOST=y
# CONFIG_USB_MUSB_GADGET is not set
# CONFIG_USB_MUSB_DUAL_ROLE is not set

#
# Platform Glue Layer
#
CONFIG_USB_MUSB_TUSB6010=m
# CONFIG_USB_MUSB_UX500 is not set
# CONFIG_USB_MUSB_MEDIATEK is not set
# CONFIG_USB_MUSB_POLARFIRE_SOC is not set

#
# MUSB DMA mode
#
# CONFIG_MUSB_PIO_ONLY is not set
CONFIG_USB_DWC3=y
CONFIG_USB_DWC3_HOST=y
# CONFIG_USB_DWC3_GADGET is not set
# CONFIG_USB_DWC3_DUAL_ROLE is not set

#
# Platform Glue Driver Support
#
# CONFIG_USB_DWC3_OMAP is not set
CONFIG_USB_DWC3_EXYNOS=y
# CONFIG_USB_DWC3_HAPS is not set
# CONFIG_USB_DWC3_KEYSTONE is not set
CONFIG_USB_DWC3_ST=m
CONFIG_USB_DWC3_QCOM=m
CONFIG_USB_DWC3_XILINX=y
# CONFIG_USB_DWC3_AM62 is not set
# CONFIG_USB_DWC2 is not set
CONFIG_USB_CHIPIDEA=m
CONFIG_USB_CHIPIDEA_UDC=y
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_CHIPIDEA_PCI=m
CONFIG_USB_CHIPIDEA_MSM=m
CONFIG_USB_CHIPIDEA_IMX=m
CONFIG_USB_CHIPIDEA_GENERIC=m
CONFIG_USB_CHIPIDEA_TEGRA=m
CONFIG_USB_ISP1760=y
CONFIG_USB_ISP1761_UDC=y
# CONFIG_USB_ISP1760_HOST_ROLE is not set
CONFIG_USB_ISP1760_GADGET_ROLE=y
# CONFIG_USB_ISP1760_DUAL_ROLE is not set

#
# USB port drivers
#
# CONFIG_USB_USS720 is not set

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=m
CONFIG_USB_EMI26=y
CONFIG_USB_ADUTUX=y
CONFIG_USB_SEVSEG=y
# CONFIG_USB_LEGOTOWER is not set
CONFIG_USB_LCD=m
# CONFIG_USB_CYPRESS_CY7C63 is not set
# CONFIG_USB_CYTHERM is not set
CONFIG_USB_IDMOUSE=m
CONFIG_USB_FTDI_ELAN=y
CONFIG_USB_APPLEDISPLAY=m
CONFIG_USB_QCOM_EUD=m
CONFIG_APPLE_MFI_FASTCHARGE=y
# CONFIG_USB_SISUSBVGA is not set
# CONFIG_USB_LD is not set
CONFIG_USB_TRANCEVIBRATOR=m
CONFIG_USB_IOWARRIOR=y
# CONFIG_USB_TEST is not set
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=m
# CONFIG_USB_YUREX is not set
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=m
CONFIG_USB_HSIC_USB4604=m
CONFIG_USB_LINK_LAYER_TEST=y
# CONFIG_USB_CHAOSKEY is not set
CONFIG_BRCM_USB_PINMAP=m
CONFIG_USB_ONBOARD_HUB=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
CONFIG_KEYSTONE_USB_PHY=m
CONFIG_NOP_USB_XCEIV=y
# CONFIG_AM335X_PHY_USB is not set
CONFIG_USB_ISP1301=y
CONFIG_USB_TEGRA_PHY=y
CONFIG_USB_ULPI=y
CONFIG_USB_ULPI_VIEWPORT=y
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
CONFIG_USB_GADGET_DEBUG=y
# CONFIG_USB_GADGET_VERBOSE is not set
# CONFIG_USB_GADGET_DEBUG_FILES is not set
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2

#
# USB Peripheral Controller
#
CONFIG_USB_LPC32XX=y
# CONFIG_USB_GR_UDC is not set
CONFIG_USB_R8A66597=y
CONFIG_USB_RENESAS_USBHS_UDC=y
CONFIG_USB_RENESAS_USB3=m
CONFIG_USB_PXA27X=m
# CONFIG_USB_MV_UDC is not set
# CONFIG_USB_MV_U3D is not set
CONFIG_USB_SNP_CORE=y
CONFIG_USB_SNP_UDC_PLAT=m
CONFIG_USB_M66592=m
# CONFIG_USB_BDC_UDC is not set
CONFIG_USB_AMD5536UDC=y
CONFIG_USB_NET2272=m
# CONFIG_USB_NET2272_DMA is not set
# CONFIG_USB_NET2280 is not set
# CONFIG_USB_GOKU is not set
CONFIG_USB_EG20T=m
CONFIG_USB_GADGET_XILINX=y
CONFIG_USB_ASPEED_UDC=m
# CONFIG_USB_ASPEED_VHUB is not set
CONFIG_USB_DUMMY_HCD=m
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=m
CONFIG_USB_F_SS_LB=m
CONFIG_USB_F_FS=m
# CONFIG_USB_CONFIGFS is not set

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=m
# CONFIG_USB_ZERO_HNPTEST is not set
CONFIG_USB_GADGETFS=m
CONFIG_USB_FUNCTIONFS=m
CONFIG_USB_FUNCTIONFS_GENERIC=y
# CONFIG_USB_MASS_STORAGE is not set
# CONFIG_USB_G_PRINTER is not set
# CONFIG_USB_G_HID is not set
# CONFIG_USB_RAW_GADGET is not set
# end of USB Gadget precomposed configurations

# CONFIG_TYPEC is not set
CONFIG_USB_ROLE_SWITCH=y
CONFIG_MMC=m
CONFIG_PWRSEQ_EMMC=m
CONFIG_PWRSEQ_SIMPLE=m
CONFIG_MMC_BLOCK=m
CONFIG_MMC_BLOCK_MINORS=8
# CONFIG_MMC_TEST is not set

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
# CONFIG_MMC_SUNPLUS is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PCI=m
# CONFIG_MMC_RICOH_MMC is not set
CONFIG_MMC_SDHCI_PLTFM=m
CONFIG_MMC_SDHCI_OF_ESDHC=m
CONFIG_MMC_SDHCI_OF_SPARX5=m
CONFIG_MMC_SDHCI_CADENCE=m
CONFIG_MMC_SDHCI_CNS3XXX=m
# CONFIG_MMC_SDHCI_ESDHC_IMX is not set
CONFIG_MMC_SDHCI_DOVE=m
CONFIG_MMC_SDHCI_TEGRA=m
# CONFIG_MMC_SDHCI_S3C is not set
CONFIG_MMC_SDHCI_SPEAR=m
CONFIG_MMC_SDHCI_BCM_KONA=m
CONFIG_MMC_SDHCI_F_SDH30=m
# CONFIG_MMC_SDHCI_MILBEAUT is not set
# CONFIG_MMC_SDHCI_IPROC is not set
CONFIG_MMC_MOXART=m
CONFIG_MMC_SDHCI_ST=m
CONFIG_MMC_OMAP_HS=m
CONFIG_MMC_SDHCI_MSM=m
# CONFIG_MMC_TIFM_SD is not set
CONFIG_MMC_DAVINCI=m
CONFIG_MMC_S3C=m
# CONFIG_MMC_S3C_HW_SDIO_IRQ is not set
CONFIG_MMC_S3C_PIO=y
# CONFIG_MMC_S3C_DMA is not set
# CONFIG_MMC_SDRICOH_CS is not set
# CONFIG_MMC_SDHCI_SPRD is not set
CONFIG_MMC_TMIO_CORE=m
# CONFIG_MMC_TMIO is not set
CONFIG_MMC_SDHI=m
# CONFIG_MMC_SDHI_SYS_DMAC is not set
# CONFIG_MMC_SDHI_INTERNAL_DMAC is not set
CONFIG_MMC_UNIPHIER=m
CONFIG_MMC_CB710=m
CONFIG_MMC_VIA_SDMMC=m
# CONFIG_MMC_DW is not set
# CONFIG_MMC_SH_MMCIF is not set
CONFIG_MMC_VUB300=m
CONFIG_MMC_USHC=m
# CONFIG_MMC_USDHI6ROL0 is not set
CONFIG_MMC_REALTEK_PCI=m
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=m
CONFIG_MMC_TOSHIBA_PCI=m
CONFIG_MMC_BCM2835=m
# CONFIG_MMC_SDHCI_BRCMSTB is not set
CONFIG_MMC_SDHCI_XENON=m
CONFIG_MMC_SDHCI_OMAP=m
CONFIG_MMC_SDHCI_AM654=m
CONFIG_MMC_OWL=m
# CONFIG_MMC_LITEX is not set
# CONFIG_SCSI_UFSHCD is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set
# CONFIG_MSPRO_BLOCK is not set
# CONFIG_MS_BLOCK is not set

#
# MemoryStick Host Controller Drivers
#
# CONFIG_MEMSTICK_TIFM_MS is not set
CONFIG_MEMSTICK_JMICRON_38X=m
CONFIG_MEMSTICK_R592=y
CONFIG_MEMSTICK_REALTEK_PCI=m
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_CLASS_MULTICOLOR=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
# CONFIG_LEDS_88PM860X is not set
CONFIG_LEDS_AN30259A=y
# CONFIG_LEDS_ARIEL is not set
# CONFIG_LEDS_AW2013 is not set
CONFIG_LEDS_BCM6328=m
CONFIG_LEDS_BCM6358=m
CONFIG_LEDS_TURRIS_OMNIA=y
CONFIG_LEDS_LM3530=m
# CONFIG_LEDS_LM3532 is not set
# CONFIG_LEDS_LM3533 is not set
CONFIG_LEDS_LM3642=m
CONFIG_LEDS_LM3692X=y
# CONFIG_LEDS_MT6323 is not set
# CONFIG_LEDS_S3C24XX is not set
CONFIG_LEDS_COBALT_QUBE=y
CONFIG_LEDS_COBALT_RAQ=y
CONFIG_LEDS_SUNFIRE=y
# CONFIG_LEDS_PCA9532 is not set
CONFIG_LEDS_GPIO=m
CONFIG_LEDS_LP3944=m
CONFIG_LEDS_LP3952=m
# CONFIG_LEDS_LP50XX is not set
CONFIG_LEDS_LP55XX_COMMON=m
CONFIG_LEDS_LP5521=m
CONFIG_LEDS_LP5523=m
CONFIG_LEDS_LP5562=m
CONFIG_LEDS_LP8501=m
# CONFIG_LEDS_LP8788 is not set
# CONFIG_LEDS_LP8860 is not set
# CONFIG_LEDS_PCA955X is not set
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_REGULATOR=y
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=m
CONFIG_LEDS_ADP5520=m
CONFIG_LEDS_NS2=m
CONFIG_LEDS_NETXBIG=y
# CONFIG_LEDS_ASIC3 is not set
CONFIG_LEDS_TCA6507=y
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_MAX77650=m
CONFIG_LEDS_LM355x=y
CONFIG_LEDS_OT200=m
CONFIG_LEDS_MENF21BMC=y
# CONFIG_LEDS_IS31FL319X is not set
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
# CONFIG_LEDS_SYSCON is not set
CONFIG_LEDS_MLXREG=y
CONFIG_LEDS_USER=m
# CONFIG_LEDS_TI_LMU_COMMON is not set
CONFIG_LEDS_TPS6105X=m
# CONFIG_LEDS_IP30 is not set
CONFIG_LEDS_ACER_A500=m
CONFIG_LEDS_BCM63138=m
CONFIG_LEDS_LGM=y

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AAT1290 is not set
CONFIG_LEDS_AS3645A=m
CONFIG_LEDS_KTD2692=m
# CONFIG_LEDS_LM3601X is not set
# CONFIG_LEDS_MT6360 is not set
CONFIG_LEDS_RT4505=y
CONFIG_LEDS_RT8515=m
# CONFIG_LEDS_SGM3140 is not set

#
# RGB LED drivers
#

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
# CONFIG_LEDS_TRIGGER_TIMER is not set
CONFIG_LEDS_TRIGGER_ONESHOT=m
CONFIG_LEDS_TRIGGER_DISK=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=m
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
# CONFIG_LEDS_TRIGGER_CPU is not set
# CONFIG_LEDS_TRIGGER_ACTIVITY is not set
CONFIG_LEDS_TRIGGER_GPIO=m
# CONFIG_LEDS_TRIGGER_DEFAULT_ON is not set

#
# iptables trigger is under Netfilter config (LED target)
#
# CONFIG_LEDS_TRIGGER_TRANSIENT is not set
# CONFIG_LEDS_TRIGGER_CAMERA is not set
# CONFIG_LEDS_TRIGGER_PANIC is not set
# CONFIG_LEDS_TRIGGER_PATTERN is not set
# CONFIG_LEDS_TRIGGER_AUDIO is not set

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
CONFIG_RTC_LIB=y
CONFIG_RTC_MC146818_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
CONFIG_RTC_DEBUG=y
CONFIG_RTC_NVMEM=y

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
# CONFIG_RTC_INTF_PROC is not set
CONFIG_RTC_INTF_DEV=y
# CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
CONFIG_RTC_DRV_TEST=y

#
# I2C RTC drivers
#
CONFIG_RTC_DRV_88PM860X=m
# CONFIG_RTC_DRV_88PM80X is not set
CONFIG_RTC_DRV_ABB5ZES3=y
CONFIG_RTC_DRV_ABEOZ9=y
CONFIG_RTC_DRV_ABX80X=y
# CONFIG_RTC_DRV_BRCMSTB is not set
# CONFIG_RTC_DRV_DS1307 is not set
CONFIG_RTC_DRV_DS1374=m
# CONFIG_RTC_DRV_DS1672 is not set
# CONFIG_RTC_DRV_HYM8563 is not set
CONFIG_RTC_DRV_LP8788=m
# CONFIG_RTC_DRV_MAX6900 is not set
CONFIG_RTC_DRV_MAX8907=y
# CONFIG_RTC_DRV_MAX8925 is not set
CONFIG_RTC_DRV_MAX77686=y
CONFIG_RTC_DRV_NCT3018Y=m
CONFIG_RTC_DRV_RS5C372=y
CONFIG_RTC_DRV_ISL1208=y
CONFIG_RTC_DRV_ISL12022=y
CONFIG_RTC_DRV_ISL12026=m
# CONFIG_RTC_DRV_X1205 is not set
# CONFIG_RTC_DRV_PCF8523 is not set
CONFIG_RTC_DRV_PCF85063=y
CONFIG_RTC_DRV_PCF85363=m
CONFIG_RTC_DRV_PCF8563=y
CONFIG_RTC_DRV_PCF8583=m
CONFIG_RTC_DRV_M41T80=y
CONFIG_RTC_DRV_M41T80_WDT=y
# CONFIG_RTC_DRV_BD70528 is not set
# CONFIG_RTC_DRV_BQ32K is not set
CONFIG_RTC_DRV_TPS6586X=y
# CONFIG_RTC_DRV_RC5T583 is not set
# CONFIG_RTC_DRV_RC5T619 is not set
CONFIG_RTC_DRV_S35390A=y
CONFIG_RTC_DRV_FM3130=y
# CONFIG_RTC_DRV_RX8010 is not set
CONFIG_RTC_DRV_RX8581=m
CONFIG_RTC_DRV_RX8025=m
CONFIG_RTC_DRV_EM3027=m
# CONFIG_RTC_DRV_RV3028 is not set
# CONFIG_RTC_DRV_RV3032 is not set
# CONFIG_RTC_DRV_RV8803 is not set
CONFIG_RTC_DRV_S5M=y
CONFIG_RTC_DRV_SD3078=m

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
CONFIG_RTC_DRV_DS3232=y
CONFIG_RTC_DRV_PCF2127=y
CONFIG_RTC_DRV_RV3029C2=y
# CONFIG_RTC_DRV_RX6110 is not set

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_CMOS=y
CONFIG_RTC_DRV_DS1286=m
CONFIG_RTC_DRV_DS1511=y
# CONFIG_RTC_DRV_DS1553 is not set
CONFIG_RTC_DRV_DS1685_FAMILY=y
# CONFIG_RTC_DRV_DS1685 is not set
CONFIG_RTC_DRV_DS1689=y
# CONFIG_RTC_DRV_DS17285 is not set
# CONFIG_RTC_DRV_DS17485 is not set
# CONFIG_RTC_DRV_DS17885 is not set
# CONFIG_RTC_DRV_DS1742 is not set
CONFIG_RTC_DRV_DS2404=m
CONFIG_RTC_DRV_DA9055=m
CONFIG_RTC_DRV_STK17TA8=m
CONFIG_RTC_DRV_M48T86=y
CONFIG_RTC_DRV_M48T35=y
CONFIG_RTC_DRV_M48T59=y
CONFIG_RTC_DRV_MSM6242=y
CONFIG_RTC_DRV_BQ4802=y
# CONFIG_RTC_DRV_RP5C01 is not set
# CONFIG_RTC_DRV_V3020 is not set
# CONFIG_RTC_DRV_GAMECUBE is not set
CONFIG_RTC_DRV_SC27XX=m
CONFIG_RTC_DRV_SPEAR=y
CONFIG_RTC_DRV_PCF50633=m
CONFIG_RTC_DRV_ZYNQMP=y

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_ASM9260 is not set
CONFIG_RTC_DRV_DIGICOLOR=m
CONFIG_RTC_DRV_FSL_FTM_ALARM=y
# CONFIG_RTC_DRV_MESON is not set
# CONFIG_RTC_DRV_MESON_VRTC is not set
CONFIG_RTC_DRV_OMAP=m
# CONFIG_RTC_DRV_S3C is not set
CONFIG_RTC_DRV_EP93XX=y
# CONFIG_RTC_DRV_AT91RM9200 is not set
# CONFIG_RTC_DRV_AT91SAM9 is not set
CONFIG_RTC_DRV_RZN1=y
CONFIG_RTC_DRV_GENERIC=m
CONFIG_RTC_DRV_VT8500=m
CONFIG_RTC_DRV_SUN4V=y
CONFIG_RTC_DRV_SUNXI=m
CONFIG_RTC_DRV_STARFIRE=y
CONFIG_RTC_DRV_MV=m
# CONFIG_RTC_DRV_ARMADA38X is not set
# CONFIG_RTC_DRV_CADENCE is not set
CONFIG_RTC_DRV_FTRTC010=y
CONFIG_RTC_DRV_STMP=y
CONFIG_RTC_DRV_JZ4740=y
# CONFIG_RTC_DRV_LPC24XX is not set
# CONFIG_RTC_DRV_LPC32XX is not set
CONFIG_RTC_DRV_PM8XXX=y
CONFIG_RTC_DRV_TEGRA=y
CONFIG_RTC_DRV_MXC=y
# CONFIG_RTC_DRV_MXC_V2 is not set
# CONFIG_RTC_DRV_SNVS is not set
CONFIG_RTC_DRV_MOXART=y
CONFIG_RTC_DRV_MT2712=y
CONFIG_RTC_DRV_MT6397=m
CONFIG_RTC_DRV_MT7622=y
CONFIG_RTC_DRV_XGENE=y
CONFIG_RTC_DRV_R7301=m
CONFIG_RTC_DRV_STM32=m
# CONFIG_RTC_DRV_RTD119X is not set
# CONFIG_RTC_DRV_ASPEED is not set
CONFIG_RTC_DRV_TI_K3=m

#
# HID Sensor RTC drivers
#
CONFIG_RTC_DRV_GOLDFISH=m
CONFIG_RTC_DRV_MSC313=m
# CONFIG_DMADEVICES is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=m
# CONFIG_DMABUF_HEAPS is not set
# CONFIG_DMABUF_SYSFS_STATS is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
CONFIG_UIO=m
# CONFIG_UIO_CIF is not set
CONFIG_UIO_PDRV_GENIRQ=m
CONFIG_UIO_DMEM_GENIRQ=m
CONFIG_UIO_AEC=m
# CONFIG_UIO_SERCOS3 is not set
CONFIG_UIO_PCI_GENERIC=m
CONFIG_UIO_NETX=m
CONFIG_UIO_PRUSS=m
# CONFIG_UIO_MF624 is not set
CONFIG_VFIO=m
CONFIG_VFIO_CONTAINER=y
# CONFIG_VFIO_NOIOMMU is not set
CONFIG_VFIO_VIRQFD=y
CONFIG_VFIO_PCI_CORE=m
CONFIG_VFIO_PCI_MMAP=y
CONFIG_VFIO_PCI_INTX=y
CONFIG_VFIO_PCI=m
CONFIG_VFIO_PLATFORM=m
CONFIG_VFIO_AMBA=m
CONFIG_VFIO_PLATFORM_CALXEDAXGMAC_RESET=m
CONFIG_VFIO_PLATFORM_AMDXGBE_RESET=m
CONFIG_VFIO_PLATFORM_BCMFLEXRM_RESET=m
CONFIG_VFIO_MDEV=m
CONFIG_IRQ_BYPASS_MANAGER=m
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
# CONFIG_VIRTIO_PCI is not set
CONFIG_VIRTIO_PMEM=m
# CONFIG_VIRTIO_BALLOON is not set
# CONFIG_VIRTIO_INPUT is not set
# CONFIG_VIRTIO_MMIO is not set
# CONFIG_VHOST_MENU is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=m
# CONFIG_GREYBUS_ES2 is not set
CONFIG_COMEDI=y
CONFIG_COMEDI_DEBUG=y
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
# CONFIG_COMEDI_ISA_DRIVERS is not set
CONFIG_COMEDI_PCI_DRIVERS=m
# CONFIG_COMEDI_8255_PCI is not set
CONFIG_COMEDI_ADDI_WATCHDOG=m
CONFIG_COMEDI_ADDI_APCI_1032=m
CONFIG_COMEDI_ADDI_APCI_1500=m
CONFIG_COMEDI_ADDI_APCI_1516=m
# CONFIG_COMEDI_ADDI_APCI_1564 is not set
CONFIG_COMEDI_ADDI_APCI_16XX=m
CONFIG_COMEDI_ADDI_APCI_2032=m
CONFIG_COMEDI_ADDI_APCI_2200=m
# CONFIG_COMEDI_ADDI_APCI_3120 is not set
CONFIG_COMEDI_ADDI_APCI_3501=m
CONFIG_COMEDI_ADDI_APCI_3XXX=m
# CONFIG_COMEDI_ADL_PCI6208 is not set
CONFIG_COMEDI_ADL_PCI7X3X=m
# CONFIG_COMEDI_ADL_PCI8164 is not set
CONFIG_COMEDI_ADL_PCI9111=m
# CONFIG_COMEDI_ADL_PCI9118 is not set
CONFIG_COMEDI_ADV_PCI1710=m
CONFIG_COMEDI_ADV_PCI1720=m
# CONFIG_COMEDI_ADV_PCI1723 is not set
CONFIG_COMEDI_ADV_PCI1724=m
CONFIG_COMEDI_ADV_PCI1760=m
# CONFIG_COMEDI_ADV_PCI_DIO is not set
CONFIG_COMEDI_AMPLC_DIO200_PCI=m
CONFIG_COMEDI_AMPLC_PC236_PCI=m
CONFIG_COMEDI_AMPLC_PC263_PCI=m
# CONFIG_COMEDI_AMPLC_PCI224 is not set
CONFIG_COMEDI_AMPLC_PCI230=m
CONFIG_COMEDI_CONTEC_PCI_DIO=m
CONFIG_COMEDI_DAS08_PCI=m
CONFIG_COMEDI_DT3000=m
CONFIG_COMEDI_DYNA_PCI10XX=m
CONFIG_COMEDI_GSC_HPDI=m
CONFIG_COMEDI_MF6X4=m
# CONFIG_COMEDI_ICP_MULTI is not set
CONFIG_COMEDI_DAQBOARD2000=m
# CONFIG_COMEDI_JR3_PCI is not set
# CONFIG_COMEDI_KE_COUNTER is not set
# CONFIG_COMEDI_CB_PCIDAS64 is not set
CONFIG_COMEDI_CB_PCIDAS=m
CONFIG_COMEDI_CB_PCIDDA=m
# CONFIG_COMEDI_CB_PCIMDAS is not set
CONFIG_COMEDI_CB_PCIMDDA=m
# CONFIG_COMEDI_ME4000 is not set
CONFIG_COMEDI_ME_DAQ=m
# CONFIG_COMEDI_NI_6527 is not set
CONFIG_COMEDI_NI_65XX=m
CONFIG_COMEDI_NI_660X=m
CONFIG_COMEDI_NI_670X=m
CONFIG_COMEDI_NI_LABPC_PCI=m
CONFIG_COMEDI_NI_PCIDIO=m
# CONFIG_COMEDI_NI_PCIMIO is not set
CONFIG_COMEDI_RTD520=m
CONFIG_COMEDI_S626=m
CONFIG_COMEDI_MITE=m
CONFIG_COMEDI_NI_TIOCMD=m
# CONFIG_COMEDI_PCMCIA_DRIVERS is not set
CONFIG_COMEDI_USB_DRIVERS=m
CONFIG_COMEDI_DT9812=m
# CONFIG_COMEDI_NI_USB6501 is not set
CONFIG_COMEDI_USBDUX=m
# CONFIG_COMEDI_USBDUXFAST is not set
CONFIG_COMEDI_USBDUXSIGMA=m
# CONFIG_COMEDI_VMK80XX is not set
CONFIG_COMEDI_8254=m
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=y
# CONFIG_COMEDI_KCOMEDILIB is not set
CONFIG_COMEDI_AMPLC_DIO200=m
CONFIG_COMEDI_AMPLC_PC236=m
CONFIG_COMEDI_DAS08=m
CONFIG_COMEDI_NI_LABPC=m
CONFIG_COMEDI_NI_TIO=m
CONFIG_COMEDI_NI_ROUTING=y
CONFIG_COMEDI_TESTS=y
CONFIG_COMEDI_TESTS_EXAMPLE=y
CONFIG_COMEDI_TESTS_NI_ROUTES=y
# CONFIG_STAGING is not set
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=m
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_OLPC_XO175=y
# CONFIG_SURFACE_PLATFORMS is not set
# CONFIG_COMMON_CLK is not set
CONFIG_HWSPINLOCK=y
CONFIG_HWSPINLOCK_OMAP=y
CONFIG_HWSPINLOCK_QCOM=m
# CONFIG_HWSPINLOCK_SPRD is not set
CONFIG_HWSPINLOCK_STM32=m
CONFIG_HWSPINLOCK_SUN6I=m
CONFIG_HSEM_U8500=m

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
CONFIG_CLKSRC_MMIO=y
CONFIG_BCM2835_TIMER=y
CONFIG_BCM_KONA_TIMER=y
CONFIG_DAVINCI_TIMER=y
# CONFIG_DIGICOLOR_TIMER is not set
CONFIG_OMAP_DM_TIMER=y
# CONFIG_DW_APB_TIMER is not set
CONFIG_FTTMR010_TIMER=y
CONFIG_IXP4XX_TIMER=y
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
CONFIG_RDA_TIMER=y
CONFIG_SUN4I_TIMER=y
CONFIG_TEGRA_TIMER=y
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
CONFIG_CLKSRC_STM32_LP=y
# CONFIG_ARMV7M_SYSTICK is not set
# CONFIG_ATMEL_PIT is not set
# CONFIG_ATMEL_ST is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
# CONFIG_FSL_FTM_TIMER is not set
CONFIG_OXNAS_RPS_TIMER=y
# CONFIG_MTK_TIMER is not set
# CONFIG_SPRD_TIMER is not set
# CONFIG_CLKSRC_JCORE_PIT is not set
CONFIG_SH_TIMER_CMT=y
# CONFIG_SH_TIMER_MTU2 is not set
CONFIG_RENESAS_OSTM=y
CONFIG_SH_TIMER_TMU=y
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_PXA is not set
CONFIG_TIMER_IMX_SYS_CTR=y
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_GXP_TIMER is not set
CONFIG_MSC313E_TIMER=y
CONFIG_MICROCHIP_PIT64B=y
# CONFIG_GOLDFISH_TIMER is not set
# end of Clock Source drivers

CONFIG_MAILBOX=y
# CONFIG_IMX_MBOX is not set
CONFIG_PLATFORM_MHU=y
CONFIG_ARMADA_37XX_RWTM_MBOX=y
CONFIG_ROCKCHIP_MBOX=y
# CONFIG_ALTERA_MBOX is not set
CONFIG_HI3660_MBOX=y
CONFIG_HI6220_MBOX=m
# CONFIG_MAILBOX_TEST is not set
CONFIG_POLARFIRE_SOC_MAILBOX=m
CONFIG_QCOM_APCS_IPC=m
CONFIG_BCM_PDC_MBOX=y
CONFIG_STM32_IPCC=m
CONFIG_MTK_ADSP_MBOX=m
CONFIG_MTK_CMDQ_MBOX=m
CONFIG_SUN6I_MSGBOX=m
CONFIG_SPRD_MBOX=m
CONFIG_QCOM_IPCC=y
CONFIG_IOMMU_API=y
CONFIG_IOMMU_SUPPORT=y

#
# Generic IOMMU Pagetable Support
#
CONFIG_IOMMU_IO_PGTABLE=y
CONFIG_IOMMU_IO_PGTABLE_LPAE=y
# CONFIG_IOMMU_IO_PGTABLE_LPAE_SELFTEST is not set
CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
CONFIG_IOMMU_IO_PGTABLE_ARMV7S_SELFTEST=y
CONFIG_IOMMU_IO_PGTABLE_DART=y
# end of Generic IOMMU Pagetable Support

# CONFIG_IOMMU_DEBUGFS is not set
CONFIG_IOMMU_DEFAULT_DMA_STRICT=y
# CONFIG_IOMMU_DEFAULT_DMA_LAZY is not set
# CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
CONFIG_OF_IOMMU=y
CONFIG_IOMMUFD=m
# CONFIG_OMAP_IOMMU is not set
CONFIG_ROCKCHIP_IOMMU=y
CONFIG_SUN50I_IOMMU=y
CONFIG_IPMMU_VMSA=y
CONFIG_APPLE_DART=m
CONFIG_ARM_SMMU=m
# CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT is not set
CONFIG_S390_CCW_IOMMU=y
CONFIG_S390_AP_IOMMU=y
CONFIG_MTK_IOMMU=y
CONFIG_QCOM_IOMMU=y
# CONFIG_SPRD_IOMMU is not set

#
# Remoteproc drivers
#
CONFIG_REMOTEPROC=y
CONFIG_REMOTEPROC_CDEV=y
CONFIG_INGENIC_VPU_RPROC=y
CONFIG_MTK_SCP=y
CONFIG_MESON_MX_AO_ARC_REMOTEPROC=y
CONFIG_RCAR_REMOTEPROC=m
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_MTK_SCP=y
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=m
# end of Rpmsg drivers

CONFIG_SOUNDWIRE=y

#
# SoundWire Devices
#

#
# SOC (System On Chip) specific Drivers
#
CONFIG_OWL_PM_DOMAINS_HELPER=y
CONFIG_OWL_PM_DOMAINS=y

#
# Amlogic SoC drivers
#
CONFIG_MESON_CANVAS=m
CONFIG_MESON_CLK_MEASURE=m
CONFIG_MESON_GX_SOCINFO=y
# CONFIG_MESON_GX_PM_DOMAINS is not set
CONFIG_MESON_EE_PM_DOMAINS=y
CONFIG_MESON_MX_SOCINFO=y
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_PMGR_PWRSTATE is not set
CONFIG_APPLE_RTKIT=y
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
CONFIG_ASPEED_LPC_SNOOP=m
CONFIG_ASPEED_UART_ROUTING=y
CONFIG_ASPEED_P2A_CTRL=m
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
CONFIG_AT91_SOC_SFR=y

#
# Broadcom SoC drivers
#
# CONFIG_BCM2835_POWER is not set
# CONFIG_SOC_BCM63XX is not set
CONFIG_SOC_BRCMSTB=y
CONFIG_BCM_PMB=y
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
CONFIG_FSL_GUTS=y
CONFIG_DPAA2_CONSOLE=m
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
CONFIG_IMX_GPCV2_PM_DOMAINS=y
CONFIG_SOC_IMX8M=y
CONFIG_SOC_IMX9=y
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
CONFIG_IXP4XX_NPE=y
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
# CONFIG_LITEX_SOC_CONTROLLER is not set
# end of Enable LiteX SoC Builder specific drivers

# CONFIG_LOONGSON2_GUTS is not set

#
# MediaTek SoC drivers
#
CONFIG_MTK_CMDQ=m
CONFIG_MTK_DEVAPC=y
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_PMIC_WRAP=m
CONFIG_MTK_SCPSYS=y
CONFIG_MTK_SCPSYS_PM_DOMAINS=y
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

CONFIG_POLARFIRE_SOC_SYS_CTRL=m

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_GENI_SE=m
# CONFIG_QCOM_GSBI is not set
CONFIG_QCOM_LLCC=m
CONFIG_QCOM_RPMH=m
# CONFIG_QCOM_SMEM is not set
# CONFIG_QCOM_SMD_RPM is not set
# CONFIG_QCOM_SPM is not set
# CONFIG_QCOM_WCNSS_CTRL is not set
CONFIG_QCOM_ICC_BWMON=y
# end of Qualcomm SoC drivers

CONFIG_SOC_RENESAS=y
CONFIG_RST_RCAR=y
CONFIG_SYSC_RCAR=y
CONFIG_SYSC_RCAR_GEN4=y
# CONFIG_SYSC_R8A77995 is not set
CONFIG_SYSC_R8A7794=y
CONFIG_SYSC_R8A77990=y
# CONFIG_SYSC_R8A7779 is not set
# CONFIG_SYSC_R8A7790 is not set
# CONFIG_SYSC_R8A7795 is not set
# CONFIG_SYSC_R8A7791 is not set
# CONFIG_SYSC_R8A77965 is not set
# CONFIG_SYSC_R8A77960 is not set
CONFIG_SYSC_R8A77961=y
CONFIG_SYSC_R8A779F0=y
# CONFIG_SYSC_R8A7792 is not set
CONFIG_SYSC_R8A77980=y
# CONFIG_SYSC_R8A77970 is not set
# CONFIG_SYSC_R8A779A0 is not set
# CONFIG_SYSC_R8A779G0 is not set
CONFIG_SYSC_RMOBILE=y
CONFIG_SYSC_R8A77470=y
CONFIG_SYSC_R8A7745=y
CONFIG_SYSC_R8A7742=y
CONFIG_SYSC_R8A7743=y
# CONFIG_SYSC_R8A774C0 is not set
CONFIG_SYSC_R8A774E1=y
CONFIG_SYSC_R8A774A1=y
CONFIG_SYSC_R8A774B1=y
CONFIG_ROCKCHIP_GRF=y
CONFIG_ROCKCHIP_IODOMAIN=m
CONFIG_ROCKCHIP_PM_DOMAINS=y
CONFIG_SOC_SAMSUNG=y
CONFIG_EXYNOS_ASV_ARM=y
CONFIG_EXYNOS_CHIPID=m
CONFIG_EXYNOS_USI=m
# CONFIG_EXYNOS_PM_DOMAINS is not set
# CONFIG_EXYNOS_REGULATOR_COUPLER is not set
CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER=y
CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER=y
CONFIG_SOC_TI=y
CONFIG_UX500_SOC_ID=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
# CONFIG_EXTCON_ADC_JACK is not set
# CONFIG_EXTCON_FSA9480 is not set
CONFIG_EXTCON_GPIO=m
# CONFIG_EXTCON_MAX14577 is not set
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_MAX77843=y
CONFIG_EXTCON_PTN5150=y
CONFIG_EXTCON_QCOM_SPMI_MISC=m
# CONFIG_EXTCON_RT8973A is not set
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=y
CONFIG_MEMORY=y
CONFIG_DDR=y
# CONFIG_ATMEL_SDRAMC is not set
# CONFIG_ATMEL_EBI is not set
CONFIG_BRCMSTB_DPFE=m
CONFIG_BRCMSTB_MEMC=y
CONFIG_BT1_L2_CTL=y
CONFIG_TI_AEMIF=y
CONFIG_TI_EMIF=y
# CONFIG_MVEBU_DEVBUS is not set
# CONFIG_FSL_CORENET_CF is not set
# CONFIG_FSL_IFC is not set
CONFIG_JZ4780_NEMC=y
CONFIG_MTK_SMI=y
CONFIG_DA8XX_DDRCTL=y
CONFIG_RENESAS_RPCIF=m
CONFIG_STM32_FMC2_EBI=m
# CONFIG_SAMSUNG_MC is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=y
CONFIG_IIO_BUFFER_DMA=y
CONFIG_IIO_BUFFER_DMAENGINE=y
CONFIG_IIO_BUFFER_HW_CONSUMER=y
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=y
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
CONFIG_IIO_SW_TRIGGER=y
CONFIG_IIO_TRIGGERED_EVENT=y

#
# Accelerometers
#
CONFIG_ADXL313=y
CONFIG_ADXL313_I2C=y
CONFIG_ADXL345=m
CONFIG_ADXL345_I2C=m
CONFIG_ADXL355=y
CONFIG_ADXL355_I2C=y
CONFIG_ADXL367=m
CONFIG_ADXL367_I2C=m
# CONFIG_ADXL372_I2C is not set
CONFIG_BMA180=y
CONFIG_BMA400=m
CONFIG_BMA400_I2C=m
# CONFIG_BMC150_ACCEL is not set
# CONFIG_DA280 is not set
CONFIG_DA311=y
# CONFIG_DMARD06 is not set
CONFIG_DMARD09=y
# CONFIG_DMARD10 is not set
# CONFIG_FXLS8962AF_I2C is not set
CONFIG_IIO_KX022A=y
CONFIG_IIO_KX022A_I2C=y
CONFIG_KXSD9=m
CONFIG_KXSD9_I2C=m
CONFIG_KXCJK1013=y
CONFIG_MC3230=m
CONFIG_MMA7455=m
CONFIG_MMA7455_I2C=m
CONFIG_MMA7660=y
CONFIG_MMA8452=y
CONFIG_MMA9551_CORE=m
# CONFIG_MMA9551 is not set
CONFIG_MMA9553=m
CONFIG_MSA311=y
CONFIG_MXC4005=y
CONFIG_MXC6255=m
CONFIG_STK8312=y
CONFIG_STK8BA50=m
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7091R5=m
CONFIG_AD7291=m
CONFIG_AD7606=m
CONFIG_AD7606_IFACE_PARALLEL=m
CONFIG_AD799X=y
# CONFIG_ADI_AXI_ADC is not set
CONFIG_AT91_ADC=y
CONFIG_AT91_SAMA5D2_ADC=y
CONFIG_AXP20X_ADC=m
# CONFIG_AXP288_ADC is not set
CONFIG_BCM_IPROC_ADC=y
# CONFIG_BERLIN2_ADC is not set
CONFIG_DA9150_GPADC=y
CONFIG_DLN2_ADC=m
# CONFIG_ENVELOPE_DETECTOR is not set
# CONFIG_EXYNOS_ADC is not set
CONFIG_MXS_LRADC_ADC=y
CONFIG_HX711=m
CONFIG_INA2XX_ADC=m
# CONFIG_INGENIC_ADC is not set
CONFIG_IMX7D_ADC=m
CONFIG_IMX8QXP_ADC=m
CONFIG_LP8788_ADC=y
CONFIG_LPC18XX_ADC=y
CONFIG_LPC32XX_ADC=m
CONFIG_LTC2471=y
# CONFIG_LTC2485 is not set
# CONFIG_LTC2497 is not set
CONFIG_MAX1363=m
CONFIG_MAX9611=m
CONFIG_MCP3422=y
CONFIG_MEDIATEK_MT6360_ADC=m
CONFIG_MEDIATEK_MT6370_ADC=y
CONFIG_MEDIATEK_MT6577_AUXADC=y
CONFIG_NAU7802=m
CONFIG_NPCM_ADC=m
CONFIG_QCOM_VADC_COMMON=y
CONFIG_QCOM_SPMI_RRADC=m
CONFIG_QCOM_SPMI_IADC=y
CONFIG_QCOM_SPMI_VADC=y
CONFIG_QCOM_SPMI_ADC5=m
CONFIG_RCAR_GYRO_ADC=y
CONFIG_RN5T618_ADC=m
CONFIG_ROCKCHIP_SARADC=m
CONFIG_RICHTEK_RTQ6056=m
CONFIG_RZG2L_ADC=y
# CONFIG_SC27XX_ADC is not set
# CONFIG_SPEAR_ADC is not set
CONFIG_SD_ADC_MODULATOR=m
CONFIG_STM32_ADC_CORE=y
# CONFIG_STM32_ADC is not set
CONFIG_STM32_DFSDM_CORE=y
CONFIG_STM32_DFSDM_ADC=y
CONFIG_SUN4I_GPADC=m
CONFIG_TI_ADC081C=y
# CONFIG_TI_ADS1015 is not set
# CONFIG_TI_AM335X_ADC is not set
# CONFIG_VF610_ADC is not set
CONFIG_XILINX_XADC=y
CONFIG_XILINX_AMS=m
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=m
# end of Analog Front Ends

#
# Amplifiers
#
CONFIG_HMC425=m
# end of Amplifiers

#
# Capacitance to digital converters
#
CONFIG_AD7150=m
CONFIG_AD7746=m
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=y
# CONFIG_ATLAS_EZO_SENSOR is not set
CONFIG_BME680=y
CONFIG_BME680_I2C=y
CONFIG_CCS811=m
# CONFIG_IAQCORE is not set
# CONFIG_PMS7003 is not set
CONFIG_SCD30_CORE=m
# CONFIG_SCD30_I2C is not set
CONFIG_SCD30_SERIAL=m
# CONFIG_SCD4X is not set
# CONFIG_SENSIRION_SGP30 is not set
CONFIG_SENSIRION_SGP40=m
CONFIG_SPS30=y
CONFIG_SPS30_I2C=y
# CONFIG_SPS30_SERIAL is not set
CONFIG_SENSEAIR_SUNRISE_CO2=y
CONFIG_VZ89X=m
# end of Chemical Sensors

#
# Hid Sensor IIO Common
#
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_CORE=m

#
# Digital to analog converters
#
CONFIG_AD5064=y
# CONFIG_AD5380 is not set
# CONFIG_AD5446 is not set
CONFIG_AD5592R_BASE=y
CONFIG_AD5593R=y
# CONFIG_AD5696_I2C is not set
CONFIG_DPOT_DAC=y
CONFIG_DS4424=y
CONFIG_LPC18XX_DAC=m
# CONFIG_M62332 is not set
CONFIG_MAX517=m
CONFIG_MAX5821=y
CONFIG_MCP4725=m
CONFIG_STM32_DAC=m
CONFIG_STM32_DAC_CORE=m
# CONFIG_TI_DAC5571 is not set
CONFIG_VF610_DAC=m
# end of Digital to analog converters

#
# IIO dummy driver
#
CONFIG_IIO_DUMMY_EVGEN=m
CONFIG_IIO_SIMPLE_DUMMY=m
CONFIG_IIO_SIMPLE_DUMMY_EVENTS=y
# CONFIG_IIO_SIMPLE_DUMMY_BUFFER is not set
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
CONFIG_BMG160=y
CONFIG_BMG160_I2C=y
# CONFIG_FXAS21002C is not set
# CONFIG_MPU3050_I2C is not set
CONFIG_IIO_ST_GYRO_3AXIS=m
CONFIG_IIO_ST_GYRO_I2C_3AXIS=m
# CONFIG_ITG3200 is not set
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=m
CONFIG_MAX30100=y
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=m
# CONFIG_DHT11 is not set
# CONFIG_HDC100X is not set
CONFIG_HDC2010=y
# CONFIG_HTS221 is not set
CONFIG_HTU21=m
# CONFIG_SI7005 is not set
CONFIG_SI7020=y
# end of Humidity sensors

#
# Inertial measurement units
#
CONFIG_BMI160=y
CONFIG_BMI160_I2C=y
CONFIG_BOSCH_BNO055=y
CONFIG_BOSCH_BNO055_SERIAL=m
CONFIG_BOSCH_BNO055_I2C=y
CONFIG_FXOS8700=y
CONFIG_FXOS8700_I2C=y
CONFIG_KMX61=y
CONFIG_INV_ICM42600=m
CONFIG_INV_ICM42600_I2C=m
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
# CONFIG_IIO_ST_LSM6DSX is not set
# end of Inertial measurement units

#
# Light sensors
#
# CONFIG_ADJD_S311 is not set
CONFIG_ADUX1020=m
CONFIG_AL3010=y
# CONFIG_AL3320A is not set
# CONFIG_APDS9300 is not set
# CONFIG_APDS9960 is not set
CONFIG_AS73211=m
CONFIG_BH1750=y
# CONFIG_BH1780 is not set
CONFIG_CM32181=y
CONFIG_CM3232=m
CONFIG_CM3323=y
CONFIG_CM3605=y
CONFIG_CM36651=m
# CONFIG_GP2AP002 is not set
# CONFIG_GP2AP020A00F is not set
CONFIG_IQS621_ALS=y
CONFIG_SENSORS_ISL29018=m
# CONFIG_SENSORS_ISL29028 is not set
# CONFIG_ISL29125 is not set
CONFIG_JSA1212=y
CONFIG_RPR0521=m
CONFIG_SENSORS_LM3533=m
# CONFIG_LTR501 is not set
CONFIG_LTRF216A=m
CONFIG_LV0104CS=m
# CONFIG_MAX44000 is not set
# CONFIG_MAX44009 is not set
CONFIG_NOA1305=m
CONFIG_OPT3001=y
CONFIG_PA12203001=m
CONFIG_SI1133=y
CONFIG_SI1145=y
# CONFIG_STK3310 is not set
CONFIG_ST_UVIS25=m
CONFIG_ST_UVIS25_I2C=m
CONFIG_TCS3414=m
CONFIG_TCS3472=m
CONFIG_SENSORS_TSL2563=y
# CONFIG_TSL2583 is not set
# CONFIG_TSL2591 is not set
CONFIG_TSL2772=m
CONFIG_TSL4531=y
# CONFIG_US5182D is not set
CONFIG_VCNL4000=m
CONFIG_VCNL4035=m
# CONFIG_VEML6030 is not set
# CONFIG_VEML6070 is not set
CONFIG_VL6180=m
CONFIG_ZOPT2201=y
# end of Light sensors

#
# Magnetometer sensors
#
CONFIG_AK8974=m
CONFIG_AK8975=y
# CONFIG_AK09911 is not set
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_MAG3110=m
CONFIG_MMC35240=m
# CONFIG_IIO_ST_MAGN_3AXIS is not set
CONFIG_SENSORS_HMC5843=y
CONFIG_SENSORS_HMC5843_I2C=y
CONFIG_SENSORS_RM3100=m
CONFIG_SENSORS_RM3100_I2C=m
# CONFIG_YAMAHA_YAS530 is not set
# end of Magnetometer sensors

#
# Multiplexers
#
CONFIG_IIO_MUX=y
# end of Multiplexers

#
# Inclinometer sensors
#
# end of Inclinometer sensors

#
# Triggers - standalone
#
CONFIG_IIO_HRTIMER_TRIGGER=m
CONFIG_IIO_INTERRUPT_TRIGGER=m
CONFIG_IIO_STM32_LPTIMER_TRIGGER=y
CONFIG_IIO_STM32_TIMER_TRIGGER=y
CONFIG_IIO_TIGHTLOOP_TRIGGER=y
CONFIG_IIO_SYSFS_TRIGGER=m
# end of Triggers - standalone

#
# Linear and angular position sensors
#
# CONFIG_IQS624_POS is not set
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=m
CONFIG_AD5272=y
CONFIG_DS1803=y
CONFIG_MAX5432=m
CONFIG_MCP4018=m
# CONFIG_MCP4531 is not set
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=m
# end of Digital potentiostats

#
# Pressure sensors
#
# CONFIG_ABP060MG is not set
# CONFIG_BMP280 is not set
CONFIG_DLHL60D=y
# CONFIG_DPS310 is not set
CONFIG_HP03=y
CONFIG_ICP10100=y
# CONFIG_MPL115_I2C is not set
# CONFIG_MPL3115 is not set
CONFIG_MS5611=m
CONFIG_MS5611_I2C=m
CONFIG_MS5637=y
# CONFIG_IIO_ST_PRESS is not set
CONFIG_T5403=y
CONFIG_HP206C=m
CONFIG_ZPA2326=m
CONFIG_ZPA2326_I2C=m
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_ISL29501=m
# CONFIG_LIDAR_LITE_V2 is not set
# CONFIG_MB1232 is not set
# CONFIG_PING is not set
CONFIG_RFD77402=m
CONFIG_SRF04=m
CONFIG_SX_COMMON=y
CONFIG_SX9310=m
CONFIG_SX9324=y
CONFIG_SX9360=m
CONFIG_SX9500=y
CONFIG_SRF08=m
CONFIG_VCNL3020=y
CONFIG_VL53L0X_I2C=y
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=y
# CONFIG_MLX90614 is not set
CONFIG_MLX90632=m
# CONFIG_TMP006 is not set
# CONFIG_TMP007 is not set
CONFIG_TMP117=y
CONFIG_TSYS01=y
# CONFIG_TSYS02D is not set
# CONFIG_MAX30208 is not set
# end of Temperature sensors

CONFIG_NTB=m
CONFIG_NTB_MSI=y
# CONFIG_NTB_IDT is not set
CONFIG_NTB_EPF=m
# CONFIG_NTB_SWITCHTEC is not set
CONFIG_NTB_PINGPONG=m
# CONFIG_NTB_TOOL is not set
CONFIG_NTB_PERF=m
# CONFIG_NTB_MSI_TEST is not set
CONFIG_NTB_TRANSPORT=m
# CONFIG_PWM is not set

#
# IRQ chip support
#
# CONFIG_AL_FIC is not set
CONFIG_MADERA_IRQ=y
# CONFIG_JCORE_AIC is not set
# CONFIG_RENESAS_INTC_IRQPIN is not set
# CONFIG_RENESAS_IRQC is not set
CONFIG_RENESAS_RZA1_IRQC=y
# CONFIG_RENESAS_RZG2L_IRQC is not set
CONFIG_SL28CPLD_INTC=y
# CONFIG_TS4800_IRQ is not set
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
CONFIG_MESON_IRQ_GPIO=m
CONFIG_IMX_IRQSTEER=y
# CONFIG_IMX_INTMUX is not set
CONFIG_IMX_MU_MSI=m
CONFIG_EXYNOS_IRQ_COMBINER=y
CONFIG_MST_IRQ=y
# CONFIG_MCHP_EIC is not set
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_A10SR is not set
CONFIG_RESET_ATH79=y
CONFIG_RESET_AXS10X=y
CONFIG_RESET_BCM6345=y
# CONFIG_RESET_BERLIN is not set
CONFIG_RESET_BRCMSTB=y
CONFIG_RESET_BRCMSTB_RESCAL=m
CONFIG_RESET_HSDK=y
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_INTEL_GW is not set
CONFIG_RESET_K210=y
CONFIG_RESET_LANTIQ=y
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MCHP_SPARX5 is not set
CONFIG_RESET_MESON=y
CONFIG_RESET_MESON_AUDIO_ARB=m
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_QCOM_AOSS is not set
# CONFIG_RESET_QCOM_PDC is not set
CONFIG_RESET_RASPBERRYPI=m
CONFIG_RESET_RZG2L_USBPHY_CTRL=m
CONFIG_RESET_SCMI=y
CONFIG_RESET_SIMPLE=y
CONFIG_RESET_SOCFPGA=y
# CONFIG_RESET_STARFIVE_JH7100 is not set
CONFIG_RESET_SUNPLUS=y
CONFIG_RESET_SUNXI=y
# CONFIG_RESET_TI_SCI is not set
CONFIG_RESET_TI_SYSCON=m
# CONFIG_RESET_TI_TPS380X is not set
CONFIG_RESET_TN48M_CPLD=m
CONFIG_RESET_UNIPHIER=m
# CONFIG_RESET_UNIPHIER_GLUE is not set
# CONFIG_RESET_ZYNQ is not set
CONFIG_COMMON_RESET_HI3660=y
# CONFIG_COMMON_RESET_HI6220 is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
CONFIG_PHY_PISTACHIO_USB=y
# CONFIG_PHY_XGENE is not set
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=m
# CONFIG_PHY_SUN4I_USB is not set
CONFIG_PHY_SUN9I_USB=y
# CONFIG_PHY_SUN50I_USB3 is not set
# CONFIG_PHY_MESON8_HDMI_TX is not set
CONFIG_PHY_MESON8B_USB2=m
CONFIG_PHY_MESON_GXL_USB2=m
CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG=m
# CONFIG_PHY_MESON_G12A_USB2 is not set
CONFIG_PHY_MESON_G12A_USB3_PCIE=y
CONFIG_PHY_MESON_AXG_PCIE=m
# CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG is not set
CONFIG_PHY_MESON_AXG_MIPI_DPHY=m

#
# PHY drivers for Broadcom platforms
#
CONFIG_PHY_BCM63XX_USBH=y
CONFIG_PHY_CYGNUS_PCIE=y
CONFIG_PHY_BCM_SR_USB=y
# CONFIG_BCM_KONA_USB2_PHY is not set
# CONFIG_PHY_BCM_NS_USB2 is not set
CONFIG_PHY_NS2_USB_DRD=m
CONFIG_PHY_BRCM_SATA=y
CONFIG_PHY_BRCM_USB=m
CONFIG_PHY_BCM_SR_PCIE=y
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_CADENCE_DPHY is not set
CONFIG_PHY_CADENCE_DPHY_RX=m
CONFIG_PHY_CADENCE_SALVO=m
CONFIG_PHY_FSL_IMX8MQ_USB=y
CONFIG_PHY_MIXEL_LVDS_PHY=m
CONFIG_PHY_MIXEL_MIPI_DPHY=m
# CONFIG_PHY_FSL_IMX8M_PCIE is not set
# CONFIG_PHY_FSL_LYNX_28G is not set
# CONFIG_PHY_HI6220_USB is not set
CONFIG_PHY_HI3660_USB=y
CONFIG_PHY_HI3670_USB=m
CONFIG_PHY_HI3670_PCIE=y
CONFIG_PHY_HISTB_COMBPHY=y
# CONFIG_PHY_HISI_INNO_USB2 is not set
CONFIG_PHY_INGENIC_USB=y
# CONFIG_PHY_LANTIQ_VRX200_PCIE is not set
CONFIG_PHY_LANTIQ_RCU_USB2=m
CONFIG_ARMADA375_USBCLUSTER_PHY=y
CONFIG_PHY_BERLIN_SATA=m
CONFIG_PHY_BERLIN_USB=y
CONFIG_PHY_MVEBU_A3700_UTMI=m
# CONFIG_PHY_MVEBU_A38X_COMPHY is not set
CONFIG_PHY_MVEBU_CP110_UTMI=y
CONFIG_PHY_PXA_28NM_HSIC=y
CONFIG_PHY_PXA_28NM_USB2=y
CONFIG_PHY_PXA_USB=m
# CONFIG_PHY_MMP3_USB is not set
CONFIG_PHY_MMP3_HSIC=y
CONFIG_PHY_MTK_PCIE=m
# CONFIG_PHY_MTK_UFS is not set
CONFIG_PHY_MTK_DP=m
CONFIG_PHY_SPARX5_SERDES=y
CONFIG_PHY_LAN966X_SERDES=m
# CONFIG_PHY_CPCAP_USB is not set
CONFIG_PHY_MAPPHONE_MDM6600=y
# CONFIG_PHY_OCELOT_SERDES is not set
# CONFIG_PHY_ATH79_USB is not set
# CONFIG_PHY_QCOM_IPQ4019_USB is not set
CONFIG_PHY_QCOM_QUSB2=y
CONFIG_PHY_QCOM_USB_HS=m
CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
CONFIG_PHY_QCOM_USB_HSIC=m
# CONFIG_PHY_QCOM_USB_HS_28NM is not set
CONFIG_PHY_QCOM_USB_SS=y
CONFIG_PHY_QCOM_IPQ806X_USB=m
CONFIG_PHY_MT7621_PCI=y
CONFIG_PHY_RALINK_USB=y
CONFIG_PHY_R8A779F0_ETHERNET_SERDES=m
CONFIG_PHY_RCAR_GEN3_USB3=m
CONFIG_PHY_ROCKCHIP_DPHY_RX0=m
CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY=y
CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY=y
CONFIG_PHY_ROCKCHIP_PCIE=y
CONFIG_PHY_ROCKCHIP_SNPS_PCIE3=y
CONFIG_PHY_ROCKCHIP_TYPEC=y
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
CONFIG_PHY_EXYNOS_PCIE=y
CONFIG_PHY_SAMSUNG_UFS=y
# CONFIG_PHY_SAMSUNG_USB2 is not set
CONFIG_PHY_EXYNOS5_USBDRD=y
# CONFIG_PHY_UNIPHIER_USB2 is not set
CONFIG_PHY_UNIPHIER_USB3=y
# CONFIG_PHY_UNIPHIER_PCIE is not set
CONFIG_PHY_UNIPHIER_AHCI=y
CONFIG_PHY_ST_SPEAR1310_MIPHY=m
CONFIG_PHY_ST_SPEAR1340_MIPHY=y
CONFIG_PHY_STIH407_USB=m
CONFIG_PHY_SUNPLUS_USB=m
CONFIG_PHY_TEGRA194_P2U=y
CONFIG_PHY_DA8XX_USB=y
CONFIG_PHY_DM816X_USB=m
# CONFIG_OMAP_CONTROL_PHY is not set
# CONFIG_TI_PIPE3 is not set
CONFIG_PHY_TUSB1210=m
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
CONFIG_PHY_INTEL_LGM_COMBO=y
CONFIG_PHY_INTEL_LGM_EMMC=m
CONFIG_PHY_INTEL_THUNDERBAY_EMMC=y
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_DTPM is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
CONFIG_ARM_CCN=m
CONFIG_ARM_CMN=y
CONFIG_ARM_SMMU_V3_PMU=y
# CONFIG_FSL_IMX8_DDR_PMU is not set
CONFIG_XGENE_PMU=y
CONFIG_ARM_DMC620_PMU=m
# CONFIG_MARVELL_CN10K_TAD_PMU is not set
CONFIG_ALIBABA_UNCORE_DRW_PMU=m
CONFIG_HNS3_PMU=y
# CONFIG_MARVELL_CN10K_DDR_PMU is not set
CONFIG_MESON_DDR_PMU=y
# end of Performance monitor support

CONFIG_RAS=y
CONFIG_USB4=y
# CONFIG_USB4_DEBUGFS_WRITE is not set
CONFIG_USB4_DMA_TEST=m

#
# Android
#
CONFIG_ANDROID_BINDER_IPC=y
CONFIG_ANDROID_BINDERFS=y
CONFIG_ANDROID_BINDER_DEVICES="binder,hwbinder,vndbinder"
CONFIG_ANDROID_BINDER_IPC_SELFTEST=y
# end of Android

CONFIG_LIBNVDIMM=m
CONFIG_BLK_DEV_PMEM=m
# CONFIG_BTT is not set
# CONFIG_OF_PMEM is not set
CONFIG_NVDIMM_KEYS=y
# CONFIG_NVDIMM_SECURITY_TEST is not set
CONFIG_DAX=m
CONFIG_DEV_DAX=m
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_APPLE_EFUSES is not set
CONFIG_NVMEM_BCM_OCOTP=m
CONFIG_NVMEM_BRCM_NVRAM=y
CONFIG_NVMEM_IMX_IIM=m
CONFIG_NVMEM_IMX_OCOTP=y
# CONFIG_NVMEM_JZ4780_EFUSE is not set
# CONFIG_NVMEM_LAN9662_OTPC is not set
CONFIG_NVMEM_LAYERSCAPE_SFP=m
CONFIG_NVMEM_LPC18XX_EEPROM=y
# CONFIG_NVMEM_LPC18XX_OTP is not set
CONFIG_NVMEM_MESON_MX_EFUSE=y
CONFIG_NVMEM_MICROCHIP_OTPC=y
# CONFIG_NVMEM_MTK_EFUSE is not set
# CONFIG_NVMEM_MXS_OCOTP is not set
# CONFIG_NVMEM_NINTENDO_OTP is not set
CONFIG_NVMEM_QCOM_QFPROM=m
CONFIG_NVMEM_RAVE_SP_EEPROM=m
CONFIG_NVMEM_RMEM=y
# CONFIG_NVMEM_ROCKCHIP_EFUSE is not set
CONFIG_NVMEM_ROCKCHIP_OTP=m
# CONFIG_NVMEM_SC27XX_EFUSE is not set
CONFIG_NVMEM_SNVS_LPGPR=y
CONFIG_NVMEM_SPMI_SDAM=m
# CONFIG_NVMEM_SPRD_EFUSE is not set
CONFIG_NVMEM_STM32_ROMEM=y
CONFIG_NVMEM_SUNPLUS_OCOTP=y
CONFIG_NVMEM_UNIPHIER_EFUSE=y
CONFIG_NVMEM_VF610_OCOTP=y

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=y
CONFIG_STM_PROTO_SYS_T=m
# CONFIG_STM_DUMMY is not set
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_STM_SOURCE_FTRACE=y
CONFIG_INTEL_TH=m
CONFIG_INTEL_TH_PCI=m
# CONFIG_INTEL_TH_GTH is not set
CONFIG_INTEL_TH_STH=m
CONFIG_INTEL_TH_MSU=m
CONFIG_INTEL_TH_PTI=m
# CONFIG_INTEL_TH_DEBUG is not set
# CONFIG_HISI_PTT is not set
# end of HW tracing support

# CONFIG_FPGA is not set
CONFIG_FSI=y
# CONFIG_FSI_NEW_DEV_NODE is not set
CONFIG_FSI_MASTER_GPIO=m
# CONFIG_FSI_MASTER_HUB is not set
CONFIG_FSI_MASTER_ASPEED=y
CONFIG_FSI_SCOM=y
CONFIG_TEE=m
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_GPIO=m
CONFIG_MUX_MMIO=m
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=m
# CONFIG_SIOX_BUS_GPIO is not set
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
CONFIG_INTERCONNECT_QCOM_OSM_L3=m
# CONFIG_INTERCONNECT_SAMSUNG is not set
# CONFIG_COUNTER is not set
CONFIG_MOST=y
# CONFIG_MOST_USB_HDM is not set
CONFIG_MOST_CDEV=y
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_IOMAP=y
# CONFIG_EXT2_FS is not set
CONFIG_EXT3_FS=y
# CONFIG_EXT3_FS_POSIX_ACL is not set
CONFIG_EXT3_FS_SECURITY=y
CONFIG_EXT4_FS=y
CONFIG_EXT4_USE_FOR_EXT2=y
# CONFIG_EXT4_FS_POSIX_ACL is not set
CONFIG_EXT4_FS_SECURITY=y
CONFIG_EXT4_DEBUG=y
CONFIG_JBD2=y
# CONFIG_JBD2_DEBUG is not set
CONFIG_FS_MBCACHE=y
# CONFIG_REISERFS_FS is not set
CONFIG_JFS_FS=m
# CONFIG_JFS_POSIX_ACL is not set
# CONFIG_JFS_SECURITY is not set
# CONFIG_JFS_DEBUG is not set
CONFIG_JFS_STATISTICS=y
CONFIG_XFS_FS=y
CONFIG_XFS_SUPPORT_V4=y
# CONFIG_XFS_QUOTA is not set
# CONFIG_XFS_POSIX_ACL is not set
CONFIG_XFS_RT=y
# CONFIG_XFS_ONLINE_SCRUB is not set
# CONFIG_XFS_WARN is not set
# CONFIG_XFS_DEBUG is not set
CONFIG_GFS2_FS=y
CONFIG_BTRFS_FS=m
# CONFIG_BTRFS_FS_POSIX_ACL is not set
# CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
CONFIG_BTRFS_FS_RUN_SANITY_TESTS=y
# CONFIG_BTRFS_DEBUG is not set
CONFIG_BTRFS_ASSERT=y
# CONFIG_BTRFS_FS_REF_VERIFY is not set
CONFIG_NILFS2_FS=m
CONFIG_F2FS_FS=m
# CONFIG_F2FS_STAT_FS is not set
CONFIG_F2FS_FS_XATTR=y
# CONFIG_F2FS_FS_POSIX_ACL is not set
CONFIG_F2FS_FS_SECURITY=y
CONFIG_F2FS_CHECK_FS=y
# CONFIG_F2FS_FAULT_INJECTION is not set
CONFIG_F2FS_FS_COMPRESSION=y
# CONFIG_F2FS_FS_LZO is not set
# CONFIG_F2FS_FS_LZ4 is not set
# CONFIG_F2FS_FS_ZSTD is not set
# CONFIG_F2FS_IOSTAT is not set
# CONFIG_F2FS_UNFAIR_RWSEM is not set
CONFIG_ZONEFS_FS=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
# CONFIG_FILE_LOCKING is not set
CONFIG_FS_ENCRYPTION=y
CONFIG_FS_ENCRYPTION_ALGS=y
CONFIG_FS_VERITY=y
CONFIG_FS_VERITY_DEBUG=y
# CONFIG_FS_VERITY_BUILTIN_SIGNATURES is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
# CONFIG_INOTIFY_USER is not set
CONFIG_FANOTIFY=y
# CONFIG_QUOTA is not set
CONFIG_QUOTACTL=y
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
# CONFIG_OVERLAY_FS_XINO_AUTO is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=y
CONFIG_FSCACHE_STATS=y
CONFIG_FSCACHE_DEBUG=y
CONFIG_CACHEFILES=m
# CONFIG_CACHEFILES_DEBUG is not set
CONFIG_CACHEFILES_ONDEMAND=y
# end of Caches

#
# CD-ROM/DVD Filesystems
#
CONFIG_ISO9660_FS=y
CONFIG_JOLIET=y
# CONFIG_ZISOFS is not set
CONFIG_UDF_FS=m
# end of CD-ROM/DVD Filesystems

#
# DOS/FAT/EXFAT/NT Filesystems
#
CONFIG_FAT_FS=y
# CONFIG_MSDOS_FS is not set
CONFIG_VFAT_FS=y
CONFIG_FAT_DEFAULT_CODEPAGE=437
CONFIG_FAT_DEFAULT_IOCHARSET="iso8859-1"
# CONFIG_FAT_DEFAULT_UTF8 is not set
CONFIG_EXFAT_FS=m
CONFIG_EXFAT_DEFAULT_IOCHARSET="utf8"
# CONFIG_NTFS_FS is not set
# CONFIG_NTFS3_FS is not set
# end of DOS/FAT/EXFAT/NT Filesystems

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_KCORE=y
# CONFIG_PROC_SYSCTL is not set
# CONFIG_PROC_PAGE_MONITOR is not set
CONFIG_PROC_CHILDREN=y
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
# CONFIG_TMPFS_POSIX_ACL is not set
CONFIG_TMPFS_XATTR=y
CONFIG_TMPFS_INODE64=y
CONFIG_HUGETLBFS=y
CONFIG_HUGETLB_PAGE=y
CONFIG_MEMFD_CREATE=y
CONFIG_ARCH_HAS_GIGANTIC_PAGE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=m
# CONFIG_NLS_CODEPAGE_737 is not set
# CONFIG_NLS_CODEPAGE_775 is not set
CONFIG_NLS_CODEPAGE_850=m
# CONFIG_NLS_CODEPAGE_852 is not set
CONFIG_NLS_CODEPAGE_855=y
CONFIG_NLS_CODEPAGE_857=y
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=y
CONFIG_NLS_CODEPAGE_862=y
# CONFIG_NLS_CODEPAGE_863 is not set
CONFIG_NLS_CODEPAGE_864=y
# CONFIG_NLS_CODEPAGE_865 is not set
CONFIG_NLS_CODEPAGE_866=m
# CONFIG_NLS_CODEPAGE_869 is not set
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
CONFIG_NLS_CODEPAGE_932=y
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=m
CONFIG_NLS_ISO8859_1=y
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=y
# CONFIG_NLS_ISO8859_7 is not set
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=y
CONFIG_NLS_KOI8_R=y
CONFIG_NLS_KOI8_U=m
# CONFIG_NLS_MAC_ROMAN is not set
CONFIG_NLS_MAC_CELTIC=y
CONFIG_NLS_MAC_CENTEURO=y
CONFIG_NLS_MAC_CROATIAN=y
# CONFIG_NLS_MAC_CYRILLIC is not set
CONFIG_NLS_MAC_GAELIC=m
# CONFIG_NLS_MAC_GREEK is not set
CONFIG_NLS_MAC_ICELAND=y
CONFIG_NLS_MAC_INUIT=y
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
# CONFIG_NLS_UTF8 is not set
CONFIG_UNICODE=y
CONFIG_UNICODE_NORMALIZATION_SELFTEST=y
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
# CONFIG_BIG_KEYS is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
CONFIG_USER_DECRYPTED_DATA=y
CONFIG_KEY_DH_OPERATIONS=y
CONFIG_KEY_NOTIFICATIONS=y
# CONFIG_SECURITY_DMESG_RESTRICT is not set
# CONFIG_SECURITY is not set
# CONFIG_SECURITYFS is not set
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
# CONFIG_INIT_STACK_NONE is not set
CONFIG_INIT_STACK_ALL_PATTERN=y
# CONFIG_INIT_STACK_ALL_ZERO is not set
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
# CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
# CONFIG_ZERO_CALL_USED_REGS is not set
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_XOR_BLOCKS=m
CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=y
CONFIG_CRYPTO_NULL=m
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=m
CONFIG_CRYPTO_AUTHENC=m
CONFIG_CRYPTO_TEST=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=m
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=m
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=y
CONFIG_CRYPTO_SM2=y
CONFIG_CRYPTO_CURVE25519=m
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
# CONFIG_CRYPTO_ARIA is not set
# CONFIG_CRYPTO_BLOWFISH is not set
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_SERPENT=y
CONFIG_CRYPTO_SM4=y
CONFIG_CRYPTO_SM4_GENERIC=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=m
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
# CONFIG_CRYPTO_CFB is not set
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=m
CONFIG_CRYPTO_KEYWRAP=m
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=y
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XCTR=m
CONFIG_CRYPTO_XTS=y
CONFIG_CRYPTO_NHPOLY1305=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
CONFIG_CRYPTO_AEGIS128=y
CONFIG_CRYPTO_CHACHA20POLY1305=y
# CONFIG_CRYPTO_CCM is not set
# CONFIG_CRYPTO_GCM is not set
# CONFIG_CRYPTO_SEQIV is not set
CONFIG_CRYPTO_ECHAINIV=m
# CONFIG_CRYPTO_ESSIV is not set
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CMAC=y
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=m
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_POLYVAL=m
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=m
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
# CONFIG_CRYPTO_SM3_GENERIC is not set
CONFIG_CRYPTO_STREEBOG=y
# CONFIG_CRYPTO_VMAC is not set
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=m
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=m
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
# CONFIG_CRYPTO_842 is not set
CONFIG_CRYPTO_LZ4=y
# CONFIG_CRYPTO_LZ4HC is not set
CONFIG_CRYPTO_ZSTD=y
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
CONFIG_CRYPTO_KDF800108_CTR=y
# end of Random number generation

#
# Userspace interface
#
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y

#
# Accelerated Cryptographic Algorithms for CPU (sparc64)
#
# CONFIG_CRYPTO_DES_SPARC64 is not set
CONFIG_CRYPTO_CRC32C_SPARC64=y
CONFIG_CRYPTO_MD5_SPARC64=y
CONFIG_CRYPTO_SHA1_SPARC64=y
# CONFIG_CRYPTO_SHA256_SPARC64 is not set
CONFIG_CRYPTO_SHA512_SPARC64=y
# CONFIG_CRYPTO_AES_SPARC64 is not set
CONFIG_CRYPTO_CAMELLIA_SPARC64=y
# end of Accelerated Cryptographic Algorithms for CPU (sparc64)

# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=m
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
# CONFIG_PKCS7_MESSAGE_PARSER is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_BLACKLIST_KEYRING is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_RAID6_PQ=m
# CONFIG_RAID6_PQ_BENCHMARK is not set
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
# CONFIG_CORDIC is not set
# CONFIG_PRIME_NUMBERS is not set
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_STMP_DEVICE=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_GF128MUL=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=m
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=m
# CONFIG_CRC32_SLICEBY8 is not set
CONFIG_CRC32_SLICEBY4=y
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
# CONFIG_CRC7 is not set
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
CONFIG_RANDOM32_SELFTEST=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_COMPRESS=y
CONFIG_ZSTD_DECOMPRESS=y
# CONFIG_XZ_DEC is not set
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=m
CONFIG_REED_SOLOMON_ENC16=y
CONFIG_REED_SOLOMON_DEC16=y
CONFIG_INTERVAL_TREE=y
CONFIG_INTERVAL_TREE_SPAN_ITER=y
CONFIG_XARRAY_MULTI=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_IOPORT_MAP=y
CONFIG_HAS_DMA=y
CONFIG_DMA_OPS=y
CONFIG_NEED_SG_DMA_LENGTH=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_ARCH_DMA_ADDR_T_64BIT=y
CONFIG_DMA_API_DEBUG=y
CONFIG_DMA_API_DEBUG_SG=y
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_IOMMU_HELPER=y
CONFIG_GLOB=y
# CONFIG_GLOB_SELFTEST is not set
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_OID_REGISTRY=y
CONFIG_SG_POOL=y
CONFIG_MEMREGION=y
CONFIG_STACKDEPOT=y
CONFIG_REF_TRACKER=y
CONFIG_SBITMAP=y
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_SYMBOLIC_ERRNAME is not set
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
CONFIG_DEBUG_INFO_DWARF5=y
# CONFIG_DEBUG_INFO_REDUCED is not set
CONFIG_DEBUG_INFO_COMPRESSED_NONE=y
# CONFIG_DEBUG_INFO_COMPRESSED_ZLIB is not set
CONFIG_DEBUG_INFO_SPLIT=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
CONFIG_GDB_SCRIPTS=y
CONFIG_FRAME_WARN=2048
# CONFIG_STRIP_ASM_SYMS is not set
CONFIG_READABLE_ASM=y
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_VMLINUX_MAP is not set
CONFIG_DEBUG_FORCE_WEAK_PER_CPU=y
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
CONFIG_MAGIC_SYSRQ_SERIAL=y
CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=""
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_KGDB=y
# CONFIG_KGDB_HONOUR_BLOCKLIST is not set
# CONFIG_KGDB_TESTS is not set
# CONFIG_KGDB_KDB is not set
# CONFIG_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_PAGE_OWNER=y
CONFIG_PAGE_POISONING=y
CONFIG_DEBUG_PAGE_REF=y
# CONFIG_DEBUG_OBJECTS is not set
# CONFIG_SHRINKER_DEBUG is not set
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
CONFIG_DEBUG_STACK_USAGE=y
# CONFIG_SCHED_STACK_END_CHECK is not set
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
# CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=120
# CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
CONFIG_WQ_WATCHDOG=y
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHED_DEBUG is not set
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

# CONFIG_DEBUG_TIMEKEEPING is not set
CONFIG_DEBUG_PREEMPT=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
CONFIG_PROVE_LOCKING=y
# CONFIG_PROVE_RAW_LOCK_NESTING is not set
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_LOCK_ALLOC=y
CONFIG_LOCKDEP=y
CONFIG_LOCKDEP_SMALL=y
CONFIG_LOCKDEP_CIRCULAR_QUEUE_BITS=12
# CONFIG_DEBUG_LOCKDEP is not set
# CONFIG_DEBUG_ATOMIC_SLEEP is not set
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=m
# CONFIG_SCF_TORTURE_TEST is not set
# CONFIG_CSD_LOCK_WAIT_DEBUG is not set
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_TRACE_IRQFLAGS=y
# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
# CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
CONFIG_DEBUG_KOBJECT=y
CONFIG_HAVE_DEBUG_BUGVERBOSE=y

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
# CONFIG_DEBUG_PLIST is not set
CONFIG_DEBUG_SG=y
CONFIG_DEBUG_NOTIFIERS=y
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
# CONFIG_DEBUG_MAPLE_TREE is not set
# end of Debug kernel data structures

# CONFIG_DEBUG_CREDENTIALS is not set

#
# RCU Debugging
#
CONFIG_PROVE_RCU=y
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_REF_SCALE_TEST=m
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

# CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
CONFIG_NOP_TRACER=y
CONFIG_HAVE_FUNCTION_TRACER=y
CONFIG_HAVE_FUNCTION_GRAPH_TRACER=y
CONFIG_HAVE_DYNAMIC_FTRACE=y
CONFIG_HAVE_FTRACE_MCOUNT_RECORD=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_HAVE_C_RECORDMCOUNT=y
CONFIG_TRACE_CLOCK=y
CONFIG_RING_BUFFER=y
CONFIG_EVENT_TRACING=y
CONFIG_CONTEXT_SWITCH_TRACER=y
CONFIG_PREEMPTIRQ_TRACEPOINTS=y
CONFIG_TRACING=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set
# CONFIG_STRICT_DEVMEM is not set

#
# sparc Debugging
#
# CONFIG_DEBUG_DCFLUSH is not set
# end of sparc Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
# CONFIG_NOTIFIER_ERROR_INJECTION is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
CONFIG_RUNTIME_TESTING_MENU=y
CONFIG_LKDTM=m
CONFIG_TEST_MIN_HEAP=m
CONFIG_TEST_DIV64=y
# CONFIG_BACKTRACE_SELF_TEST is not set
CONFIG_TEST_REF_TRACKER=m
CONFIG_RBTREE_TEST=m
CONFIG_REED_SOLOMON_TEST=m
CONFIG_INTERVAL_TREE_TEST=m
CONFIG_PERCPU_TEST=m
CONFIG_ATOMIC64_SELFTEST=y
# CONFIG_TEST_HEXDUMP is not set
CONFIG_STRING_SELFTEST=m
# CONFIG_TEST_STRING_HELPERS is not set
# CONFIG_TEST_KSTRTOX is not set
CONFIG_TEST_PRINTF=m
# CONFIG_TEST_SCANF is not set
CONFIG_TEST_BITMAP=y
# CONFIG_TEST_UUID is not set
CONFIG_TEST_XARRAY=y
# CONFIG_TEST_MAPLE_TREE is not set
# CONFIG_TEST_RHASHTABLE is not set
# CONFIG_TEST_IDA is not set
# CONFIG_TEST_LKM is not set
# CONFIG_TEST_BITOPS is not set
CONFIG_TEST_VMALLOC=m
CONFIG_TEST_USER_COPY=m
CONFIG_FIND_BIT_BENCHMARK=y
CONFIG_TEST_FIRMWARE=m
# CONFIG_TEST_UDELAY is not set
CONFIG_TEST_STATIC_KEYS=m
# CONFIG_TEST_MEMCAT_P is not set
# CONFIG_TEST_MEMINIT is not set
CONFIG_TEST_FREE_PAGES=m
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking

CONFIG_WARN_MISSING_DOCUMENTS=y
CONFIG_WARN_ABI_ERRORS=y
# end of Kernel hacking

--PVrvXL0mHcWWFJPs--
