Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5871D2C9D
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Feb 2023 09:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675676589; x=1707212589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F/5KPEsq/CE6l7/3+3ytSpwuh3fc0mXFL0LslDJ8RzU=;
  b=FuWqG/w9d9Xf5pt/I9nKdOJsUV1C8h1Ehzaxwrugbjh9jFYNlDhRE9MF
   Tm8YImmVJdIHI7zOJNIcl+p4GNQf9Iabwq4+xPKILNL8nIigrvqXpkmTI
   Y5OSG4mTCDOFebryePpMWVl3AuI1Ggd6l+uie2aX6KgYj/I1joa/NhY4T
   EiK/7zw2QoJwMoJrfqFVy+fzXBsKLpGaRpZ5UVW7WcCeL4i4zIlIGZWfH
   rREnwe8tU0nQ+HlNK75tA3Kge66jpNSobHrm2pvs4uQ70B84PDCBqdu/x
   lQnyeM04Nqfds3kKVB5dgTB1EUWliSli0gBlW5ckwjpp+nsCyJTqmi3Fs
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="317177312"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="317177312"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 01:42:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="735060799"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="735060799"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2023 01:42:53 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOy1U-0002TY-20;
	Mon, 06 Feb 2023 09:42:52 +0000
Date: Mon, 6 Feb 2023 17:42:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/math/div64.c:226:27: warning: shift by count ('64') >= precision
 of type ('64')
Message-ID: <202302061756.eUpw7mEJ-lkp@intel.com>
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
head:   d2d11f342b179f1894a901f143ec7c008caba43e
commit: d539fee9f825b0c8eac049732c83562b28a483b5 ARM: 9253/1: ubsan: select ARCH_HAS_UBSAN_SANITIZE_ALL
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20230205 (https://download.01.org/0day-ci/archive/20230206/202302061756.eUpw7mEJ-lkp@intel.com/config)
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

gcc_analyzer warnings: (new ones prefixed by >>)
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
       |      |                 ~~~   ~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                 |     |
       |      |                 |     (4) calling 'div64_u64_rem' from 'mul_u64_u64_div_u64'
       |      |                 (3) ...to here
       |
       +--> 'div64_u64_rem': events 5-7
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
              |      |                 ~~~
              |      |                 |
              |      |                 (7) ...to here
              |
       <------+
       |
     'mul_u64_u64_div_u64': events 8-13
       |
       |  219 |                 div = div64_u64_rem(b, c, &rem);
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (8) returning to 'mul_u64_u64_div_u64' from 'div64_u64_rem'
       |......
       |  224 |                 if (shift > 0) {
       |      |                    ~   
       |      |                    |
       |      |                    (9) following 'true' branch (when 'shift > 0')...
       |  225 |                         /* drop precision */
       |  226 |                         b >>= shift;
       |      |                         ~~~~~~~~~~~
       |      |                         | |
       |      |                         | (11) following 'true' branch...
       |      |                         | (12) ...to here
       |      |                         | (13) shift by count '64' here
       |      |                         (10) ...to here
       |

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
