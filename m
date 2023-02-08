Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E794436E
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Feb 2023 04:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675832220; x=1707368220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=haWMZyp4HVZ6aZwKtSmIYEYitHJKbn0BGuVNolCFxpo=;
  b=ZWsjFeBMP52TlG4B9wfwKwWoBE7rSu/BWLC53MRLHsfB/ZYQ+1aZHTau
   jZ4vP31BnOX3O+WiLR0xGzRAwuPu6UspX7YjCUsQ/11hq7DwogtHJwZYR
   Z2yWM3ZZD2meWO4V3YKb66Ouv/PmkQfClsJXhYxS08aTBB2fgls5ydyVM
   7Y3gyg0oq8K6Tw/8i4jDNn+dGXVe2tZUXOYUo9aqQ16Dyt4QGoxmfE/WX
   MRdBPynTQA/Q2tKykG8Njzzse3aOAPw63yWnFOFM+AIeno6DeuUIhvlRN
   MwKjiBBXc0kll+UiiyHnUhL9cdI0aSHguDbAs1oiCDSdYU4uAlDmhVuSk
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="329736732"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="329736732"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 20:56:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="669042347"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="669042347"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 Feb 2023 20:56:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPcVl-0004Ck-2Y;
	Wed, 08 Feb 2023 04:56:49 +0000
Date: Wed, 8 Feb 2023 12:56:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: lib/math/div64.c:226:27: warning: shift by count ('64') >= precision
 of type ('64')
Message-ID: <202302081230.Y4hmOpkz-lkp@intel.com>
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
head:   0983f6bf2bfc0789b51ddf7315f644ff4da50acb
commit: d539fee9f825b0c8eac049732c83562b28a483b5 ARM: 9253/1: ubsan: select ARCH_HAS_UBSAN_SANITIZE_ALL
date:   3 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 months ago
config: arm-randconfig-c002-20230205 (https://download.01.org/0day-ci/archive/20230208/202302081230.Y4hmOpkz-lkp@intel.com/config)
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
