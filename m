Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F946185D
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Apr 2023 13:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680959512; x=1712495512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TGgu+fPUFzpR40jM8l3LroReR8kyuCc1+EX0Sx+yv48=;
  b=KCjmDAyQIJpURc/1U1/HDcM4yveQsg9MBVxb4nmJ6T1P/VRcTnpsierQ
   rreBio4+j2ggsHyqC8dsfMPDLYlh1F3ysXSKzqJiWpnMjn4rC49pIvmqP
   d5l5aW0ppSFldqrAtw5p8KHUhO1WSyfCdPR8lnarOhb92A1kLegYKqRZg
   4FtTMkkmTVuoceHmxoFIRrcP+w6s2V0gL7/N7fd0pXYeMrTjP6rgPjv9S
   SkwguEylTurkVNWvzwpnZ2zcDM2iUHhAvM9pvPwCzjOMJ5fqUeOLRtwAr
   K386SdqWS5qxN0ffXeAB3YZl6kF8KEpx9SG0cDCiWQF/Zp8lik3+HQ43G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="429424273"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="429424273"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2023 06:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="665166051"
X-IronPort-AV: E=Sophos;i="5.98,329,1673942400"; 
   d="scan'208";a="665166051"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Apr 2023 06:11:50 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pl8M9-000TkT-1n;
	Sat, 08 Apr 2023 13:11:49 +0000
Date: Sat, 8 Apr 2023 21:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 07/10] fortify: Split reporting and avoid passing
 string pointer
Message-ID: <202304082042.7jzeZI43-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/string_helpers.c:1036:34: sparse: sparse: cast from unknown type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230407192717.636137-7-keescook@chromium.org>
References: <20230407192717.636137-7-keescook@chromium.org>
TO: Kees Cook <keescook@chromium.org>
TO: linux-hardening@vger.kernel.org
CC: Kees Cook <keescook@chromium.org>
CC: Andy Shevchenko <andy@kernel.org>
CC: Cezary Rojewski <cezary.rojewski@intel.com>
CC: Puyou Lu <puyou.lu@gmail.com>
CC: Mark Brown <broonie@kernel.org>
CC: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>
CC: Brendan Higgins <brendan.higgins@linux.dev>
CC: David Gow <davidgow@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Alexander Potapenko <glider@google.com>
CC: Zhaoyang Huang <zhaoyang.huang@unisoc.com>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Liam Howlett <liam.howlett@oracle.com>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Rasmus Villemoes <linux@rasmusvillemoes.dk>
CC: Yury Norov <yury.norov@gmail.com>
CC: "Jason A. Donenfeld" <Jason@zx2c4.com>
CC: Sander Vanheule <sander@svanheule.net>
CC: Eric Biggers <ebiggers@google.com>
CC: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
CC: Andrey Konovalov <andreyknvl@gmail.com>

Hi Kees,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/hardening]
[also build test WARNING on kees/for-next/pstore kees/for-next/kspp linus/master tip/x86/core v6.3-rc5 next-20230406]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/kunit-tool-Enable-CONFIG_FORTIFY_SOURCE-under-UML/20230408-032959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20230407192717.636137-7-keescook%40chromium.org
patch subject: [PATCH v2 07/10] fortify: Split reporting and avoid passing string pointer
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-s053-20230406 (https://download.01.org/0day-ci/archive/20230408/202304082042.7jzeZI43-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/124d051177d6812a0b5bd445a9f89e0694d56f2d
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Kees-Cook/kunit-tool-Enable-CONFIG_FORTIFY_SOURCE-under-UML/20230408-032959
        git checkout 124d051177d6812a0b5bd445a9f89e0694d56f2d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304082042.7jzeZI43-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/string_helpers.c:1027:9: sparse: sparse: undefined identifier 'EACH_FORTIFY_FUNC'
   lib/string_helpers.c:1032:25: sparse: sparse: undefined identifier 'FORTIFY_REASON_FUNC'
   lib/string_helpers.c:1033:28: sparse: sparse: undefined identifier 'FORTIFY_REASON_DIR'
   lib/string_helpers.c:1036:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1036:34: sparse: sparse: cast from unknown type
   lib/string_helpers.c:1036:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1036:34: sparse: sparse: cast from unknown type
   lib/string_helpers.c:1036:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1036:34: sparse: sparse: cast from unknown type
   lib/string_helpers.c:1036:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1036:34: sparse: sparse: cast from unknown type
   lib/string_helpers.c:1036:34: sparse: sparse: undefined identifier 'FORTIFY_FUNC_UNKNOWN'
>> lib/string_helpers.c:1036:34: sparse: sparse: cast from unknown type

vim +1036 lib/string_helpers.c

124d051177d681 Kees Cook 2023-04-07  1029  
124d051177d681 Kees Cook 2023-04-07  1030  void __fortify_report(const u8 reason)
124d051177d681 Kees Cook 2023-04-07  1031  {
124d051177d681 Kees Cook 2023-04-07  1032  	const u8 func = FORTIFY_REASON_FUNC(reason);
124d051177d681 Kees Cook 2023-04-07  1033  	const bool write = FORTIFY_REASON_DIR(reason);
124d051177d681 Kees Cook 2023-04-07  1034  	const char *name;
124d051177d681 Kees Cook 2023-04-07  1035  
124d051177d681 Kees Cook 2023-04-07 @1036  	name = fortify_func_name[min_t(u8, func, FORTIFY_FUNC_UNKNOWN)];
124d051177d681 Kees Cook 2023-04-07  1037  	WARN(1, "%s: detected buffer %s overflow\n", name, str_read_write(!write));
124d051177d681 Kees Cook 2023-04-07  1038  }
124d051177d681 Kees Cook 2023-04-07  1039  EXPORT_SYMBOL(__fortify_report);
124d051177d681 Kees Cook 2023-04-07  1040  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
