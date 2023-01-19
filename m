Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314CC17CD
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 03:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674099632; x=1705635632;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=srUn4oZZ5AaSI0EmOvvHu3V/YuQC+ZYCM+Xm6v3fiTM=;
  b=mxiDRbUmID9ySjX5lq7hQZzcq6fRiyFMvBItq+tnbOqGGLELgjXnGIaB
   YIs9/+2r5fhVN68QSMNZBNr09df7CURDZlMO2rujVpyCEdpG0C2wPSAYA
   Pi+/o2mLxtmQKPOQX6xjvI3Ut3lVg3tw/ouHcFdju3a7UKaN0fuSwbImo
   5MkzTDRmNKR0K5MtW/DueoypeybgMpR7Yrd0h1Hrten8NVX9pMydPRhBI
   7yCrArx99rOcaBDN1BWmt5W7PL41lVKtsap3e7bL7+GIybzDKQsJbW1gF
   CtfxeLiYrXM1Df7rxRLKHEBu/19WVWbNldyH1pW0XwZNlguTMom5AtD+T
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323867770"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323867770"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 19:40:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="637530236"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="637530236"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Jan 2023 19:40:30 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pILmv-00012d-2s;
	Thu, 19 Jan 2023 03:40:29 +0000
Date: Thu, 19 Jan 2023 11:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/kasan/report.c:143:20: warning: unused function
 'kasan_kunit_test_suite_executing'
Message-ID: <202301191156.RnY7QXNi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andrey Konovalov <andreyknvl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: c8c7016f50c85688d71feea2dba1bd955d5f5358 kasan: fail non-kasan KUnit tests on KASAN reports
date:   5 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
config: x86_64-randconfig-a004-20230116 (https://download.01.org/0day-ci/archive/20230119/202301191156.RnY7QXNi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c8c7016f50c85688d71feea2dba1bd955d5f5358
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c8c7016f50c85688d71feea2dba1bd955d5f5358
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash mm/kasan/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> mm/kasan/report.c:143:20: warning: unused function 'kasan_kunit_test_suite_executing' [-Wunused-function]
   static inline bool kasan_kunit_test_suite_executing(void) { return false; }
                      ^
   1 warning generated.


vim +/kasan_kunit_test_suite_executing +143 mm/kasan/report.c

c8c7016f50c8568 Andrey Konovalov 2022-11-30  142  
c8c7016f50c8568 Andrey Konovalov 2022-11-30 @143  static inline bool kasan_kunit_test_suite_executing(void) { return false; }
c8c7016f50c8568 Andrey Konovalov 2022-11-30  144  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
