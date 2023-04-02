Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299C220FF
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Apr 2023 07:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680421975; x=1711957975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6J58TzwuHnbloIl7k7fdfiuajxyK3cKbpkvfStNiI28=;
  b=iVH+j9j4uHEQa3vGWHqv7W2UUL8d/G2K0RQOApLlEW6tj866NM94LOJR
   h2/T4ZXGZXIjmxtq96epT0Nqn4QuLv1tkeNUoBUB5DCUy3SHtWEGsWaIB
   j4u/FHjHBnmrSvSB3oH1uWRqLxFtL182zBA6ex8nXm0qwPfWhJG8Gv1xO
   FDowwO8sHctibbjQKlqwbJZqtQX+VAFqi0qtcTyV62MiBpj7Pv3oVKZ9P
   EtyhF1EiEQGuLe7kfKfayYcEC/Y994CPn9dt/MxEPs9uyCUa/+lNrymVD
   uNTrP55ktOpRYybuqkgUAA6AyS3HLZmrS7ZuJk0DB7yuRlbUHIiwOKjZL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="404466319"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="404466319"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 00:52:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="829203984"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="829203984"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 02 Apr 2023 00:52:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pisWC-000NJF-1u;
	Sun, 02 Apr 2023 07:52:52 +0000
Date: Sun, 2 Apr 2023 15:52:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/math/div64.c:226:27: warning: shift by count ('64') >= precision
 of type ('64')
Message-ID: <202304021558.M73RQVg1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: lib/math/div64.c:226:27: warning: shift by count ('64') >= precision of type ('64') [-Wanalyzer-shift-count-overflow]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Seung-Woo Kim" <sw0312.kim@samsung.com>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Florian Fainelli <f.fainelli@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: d539fee9f825b0c8eac049732c83562b28a483b5 ARM: 9253/1: ubsan: select ARCH_HAS_UBSAN_SANITIZE_ALL
date:   5 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20230402 (https://download.01.org/0day-ci/archive/20230402/202304021558.M73RQVg1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d539fee9f825b0c8eac049732c83562b28a483b5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d539fee9f825b0c8eac049732c83562b28a483b5
        # save the config file
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error'  olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross ARCH=arm KBUILD_USERCFLAGS='-fanalyzer -Wno-error' 

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304021558.M73RQVg1-lkp@intel.com/

gcc_analyzer warnings: (new ones prefixed by >>)
   lib/math/div64.c: In function 'div64_u64_rem':
   lib/math/div64.c:110:21: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     110 |                 u32 rem32;
         |                     ^~~~~
     'mul_u64_u64_div_u64': events 1-4
       |
       |  197 | u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
       |      |     ^~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'mul_u64_u64_div_u64'
       |......
       |  203 |         if (ilog2(a) + ilog2(b) > 62) {
       |      |            ~
       |      |            |
       |      |            (2) following 'true' branch...
       |......
       |  219 |                 div = div64_u64_rem(b, c, &rem);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (3) ...to here
       |      |                       (4) calling 'div64_u64_rem' from 'mul_u64_u64_div_u64'
       |
       +--> 'div64_u64_rem': events 5-8
              |
              |  104 | u64 div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
              |      |     ^~~~~~~~~~~~~
              |      |     |
              |      |     (5) entry to 'div64_u64_rem'
              |......
              |  109 |         if (high == 0) {
              |      |            ~
              |      |            |
              |      |            (6) following 'true' branch (when 'high == 0')...
              |  110 |                 u32 rem32;
              |      |                     ~~~~~
              |      |                     |
              |      |                     (7) ...to here
              |      |                     (8) use of uninitialized value '<unknown>' here
              |
   lib/math/div64.c: In function 'mul_u64_u64_div_u64':
   lib/math/div64.c:199:27: warning: use of uninitialized value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     199 |         u64 res = 0, div, rem;
         |                           ^~~
     'mul_u64_u64_div_u64': event 1
       |
       |  199 |         u64 res = 0, div, rem;
       |      |                           ^~~
       |      |                           |
       |      |                           (1) use of uninitialized value '<unknown>' here
       |
>> lib/math/div64.c:226:27: warning: shift by count ('64') >= precision of type ('64') [-Wanalyzer-shift-count-overflow]
     226 |                         b >>= shift;
         |                         ~~^~~~~~~~~
     'mul_u64_u64_div_u64': event 1
       |
       |  197 | u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
       |      |     ^~~~~~~~~~~~~~~~~~~
       |      |     |
       |      |     (1) entry to 'mul_u64_u64_div_u64'
       |
     'mul_u64_u64_div_u64': event 2
       |
       |include/linux/log2.h:160:35:
       |  157 | ( \
       |      | ~~~                                
       |  158 |         __builtin_constant_p(n) ?       \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  159 |         ((n) < 2 ? 0 :                  \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  160 |          63 - __builtin_clzll(n)) :     \
       |      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
       |      |                                   |
       |      |                                   (2) following 'false' branch...
       |  161 |         (sizeof(n) <= 4) ?              \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  162 |         __ilog2_u32(n) :                \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  163 |         __ilog2_u64(n)                  \
       |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |  164 |  )
       |      |  ~                                 
   lib/math/div64.c:203:13: note: in expansion of macro 'ilog2'
       |  203 |         if (ilog2(a) + ilog2(b) > 62) {
       |      |             ^~~~~
       |
     'mul_u64_u64_div_u64': events 3-5
       |
       |include/asm-generic/bitops/fls64.h:21:21:
       |   21 |         __u32 h = x >> 32;
       |      |                   ~~^~~~~
       |      |                     |
       |      |                     (3) ...to here
       |   22 |         if (h)
       |      |            ~         
       |      |            |
       |      |            (4) following 'false' branch (when 'h == 0')...
       |   23 |                 return fls(h) + 32;
       |   24 |         return fls(x);
       |      |                ~~~~~~
       |      |                |
       |      |                (5) ...to here
       |
     'mul_u64_u64_div_u64': event 6
       |
       |include/asm-generic/bitops/builtin-fls.h:14:53:
       |   14 |         return x ? sizeof(x) * 8 - __builtin_clz(x) : 0;
       |      |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~
       |      |                                                     |
       |      |                                                     (6) following 'false' branch...
       |
     'mul_u64_u64_div_u64': event 7
       |
       |include/linux/log2.h:32:25:
       |   32 |         return fls64(n) - 1;
       |      |                ~~~~~~~~~^~~
       |      |                         |
       |      |                         (7) ...to here
       |
     'mul_u64_u64_div_u64': events 8-10
       |
       |lib/math/div64.c:203:12:
       |  203 |         if (ilog2(a) + ilog2(b) > 62) {
       |      |            ^
       |      |            |
       |      |            (8) following 'true' branch...
       |......
       |  219 |                 div = div64_u64_rem(b, c, &rem);
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (9) ...to here
       |      |                       (10) calling 'div64_u64_rem' from 'mul_u64_u64_div_u64'
       |
       +--> 'div64_u64_rem': events 11-14
              |
              |  104 | u64 div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
              |      |     ^~~~~~~~~~~~~
              |      |     |
              |      |     (11) entry to 'div64_u64_rem'
              |......
              |  109 |         if (high == 0) {
              |      |            ~
              |      |            |
              |      |            (12) following 'true' branch (when 'high == 0')...
              |  110 |                 u32 rem32;
              |      |                     ~~~~~
              |      |                     |
              |      |                     (13) ...to here
              |  111 |                 quot = div_u64_rem(dividend, divisor, &rem32);
              |      |                        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                        |
              |      |                        (14) calling 'div_u64_rem' from 'div64_u64_rem'

vim +226 lib/math/div64.c

3dc167ba5729dd Oleg Nesterov 2020-05-19  195  
3dc167ba5729dd Oleg Nesterov 2020-05-19  196  #ifndef mul_u64_u64_div_u64
3dc167ba5729dd Oleg Nesterov 2020-05-19  197  u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
3dc167ba5729dd Oleg Nesterov 2020-05-19  198  {
3dc167ba5729dd Oleg Nesterov 2020-05-19  199  	u64 res = 0, div, rem;
3dc167ba5729dd Oleg Nesterov 2020-05-19  200  	int shift;
3dc167ba5729dd Oleg Nesterov 2020-05-19  201  
3dc167ba5729dd Oleg Nesterov 2020-05-19  202  	/* can a * b overflow ? */
3dc167ba5729dd Oleg Nesterov 2020-05-19  203  	if (ilog2(a) + ilog2(b) > 62) {
3dc167ba5729dd Oleg Nesterov 2020-05-19  204  		/*
3dc167ba5729dd Oleg Nesterov 2020-05-19  205  		 * (b * a) / c is equal to
3dc167ba5729dd Oleg Nesterov 2020-05-19  206  		 *
3dc167ba5729dd Oleg Nesterov 2020-05-19  207  		 *      (b / c) * a +
3dc167ba5729dd Oleg Nesterov 2020-05-19  208  		 *      (b % c) * a / c
3dc167ba5729dd Oleg Nesterov 2020-05-19  209  		 *
3dc167ba5729dd Oleg Nesterov 2020-05-19  210  		 * if nothing overflows. Can the 1st multiplication
3dc167ba5729dd Oleg Nesterov 2020-05-19  211  		 * overflow? Yes, but we do not care: this can only
3dc167ba5729dd Oleg Nesterov 2020-05-19  212  		 * happen if the end result can't fit in u64 anyway.
3dc167ba5729dd Oleg Nesterov 2020-05-19  213  		 *
3dc167ba5729dd Oleg Nesterov 2020-05-19  214  		 * So the code below does
3dc167ba5729dd Oleg Nesterov 2020-05-19  215  		 *
3dc167ba5729dd Oleg Nesterov 2020-05-19  216  		 *      res = (b / c) * a;
3dc167ba5729dd Oleg Nesterov 2020-05-19  217  		 *      b = b % c;
3dc167ba5729dd Oleg Nesterov 2020-05-19  218  		 */
3dc167ba5729dd Oleg Nesterov 2020-05-19  219  		div = div64_u64_rem(b, c, &rem);
3dc167ba5729dd Oleg Nesterov 2020-05-19  220  		res = div * a;
3dc167ba5729dd Oleg Nesterov 2020-05-19  221  		b = rem;
3dc167ba5729dd Oleg Nesterov 2020-05-19  222  
3dc167ba5729dd Oleg Nesterov 2020-05-19  223  		shift = ilog2(a) + ilog2(b) - 62;
3dc167ba5729dd Oleg Nesterov 2020-05-19  224  		if (shift > 0) {
3dc167ba5729dd Oleg Nesterov 2020-05-19  225  			/* drop precision */
3dc167ba5729dd Oleg Nesterov 2020-05-19 @226  			b >>= shift;

:::::: The code at line 226 was first introduced by commit
:::::: 3dc167ba5729ddd2d8e3fa1841653792c295d3f1 sched/cputime: Improve cputime_adjust()

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
