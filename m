Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC28539B
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Dec 2023 08:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyPaIFM7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701592554; x=1733128554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uc21+AAxqZtcRb9B4r3uGLgXGlhqijDWX9U7aRCNwg8=;
  b=PyPaIFM7jas7OS48kLPY1+M/ChHVqO3nqmYFIlONVXNQ8V0kRtuk/Qmt
   is+TfUFpZ+llBUnfeeueEv0DoW9QlJyLgUzj/RfZH+MB/lUmvX1WWoJ3a
   6P1Q995eMcytUcabRiPbXWgavMqOgydpR9ziQqa1nHC8eUXQZppYB0NWa
   81XQ0vwOsqE9cnAHOtIgiFuyp3RDo/8jUlfCKeRmxX7/fcTqJwuqfyfbf
   S6NjS1CONwQUn/XDO83vVmZLRtfOtvDESm5iRcOn3FyvznQutRcDNwdWJ
   e9tKvCiILy0wqK2kakqcS/0H/QPTWKipLIesxQmyzLv3Vsoui4XBu1isB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="392509074"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="392509074"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 00:35:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="888193131"
X-IronPort-AV: E=Sophos;i="6.04,247,1695711600"; 
   d="scan'208";a="888193131"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 03 Dec 2023 00:35:52 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9hx8-0006SW-2x;
	Sun, 03 Dec 2023 08:35:50 +0000
Date: Sun, 3 Dec 2023 16:35:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/loongson2ef/lemote-2f/pm.c:32:undefined reference to
 `i8042_command'
Message-ID: <202312031528.uWlbRPTK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   968f35f4ab1c0966ceb39af3c89f2e24afedf878
commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.debug: make DEBUG_INFO selectable from a choice
date:   1 year, 8 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 1 year, 8 months ago
config: mips-randconfig-r021-20220102 (https://download.01.org/0day-ci/archive/20231203/202312031528.uWlbRPTK-lkp@intel.com/config)
compiler: mips64el-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231203/202312031528.uWlbRPTK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312031528.uWlbRPTK-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips64el-linux-ld: arch/mips/loongson2ef/lemote-2f/pm.o: in function `i8042_enable_kbd_port':
>> arch/mips/loongson2ef/lemote-2f/pm.c:32:(.text+0xe0): undefined reference to `i8042_command'
>> mips64el-linux-ld: arch/mips/loongson2ef/lemote-2f/pm.c:41:(.text+0x100): undefined reference to `i8042_command'


vim +32 arch/mips/loongson2ef/lemote-2f/pm.c

a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  29  
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  30  static int i8042_enable_kbd_port(void)
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  31  {
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11 @32  	if (i8042_command(&i8042_ctr, I8042_CMD_CTL_RCTR)) {
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  33  		pr_err("i8042.c: Can't read CTR while enabling i8042 kbd port."
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  34  		       "\n");
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  35  		return -EIO;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  36  	}
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  37  
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  38  	i8042_ctr &= ~I8042_CTR_KBDDIS;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  39  	i8042_ctr |= I8042_CTR_KBDINT;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  40  
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11 @41  	if (i8042_command(&i8042_ctr, I8042_CMD_CTL_WCTR)) {
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  42  		i8042_ctr &= ~I8042_CTR_KBDINT;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  43  		i8042_ctr |= I8042_CTR_KBDDIS;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  44  		pr_err("i8042.c: Failed to enable KBD port.\n");
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  45  
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  46  		return -EIO;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  47  	}
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  48  
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  49  	return 0;
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  50  }
a9e8641f4c252f arch/mips/loongson/lemote-2f/pm.c Wu Zhangjin 2009-11-11  51  

:::::: The code at line 32 was first introduced by commit
:::::: a9e8641f4c252f93875cf30cb28c0f333539f0bf MIPS: Yeeloong 2F: Add board specific suspend support

:::::: TO: Wu Zhangjin <wuzhangjin@gmail.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
