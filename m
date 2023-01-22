Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3C436D
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 10:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674383845; x=1705919845;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Bh9hmEnBSRaE4cX2Khl8NIAR2qCiprJLfBMtitLoLDs=;
  b=gnSD7ptbbLQ8QTTI/wQb+4zomZyZDdk/LNmHjQ4PHbh36qyFEq2Aldj6
   6PjxrclPnZwLNTtCpsMlUzTUp4pj3kO1pySLO1HHr0E6ZPFH4semaezSW
   P5G0S6MrvgEidMIc5CLD50ocyaEGpK/Kv9fojiJ7oFa41k4XNqDrH5jL4
   QK0ace76uVCcc4MKIWcHs1ITANdrJE3cG0f1mADYAWdoP3T714XFHjamN
   OgCUqtgI8G21zGqUBXgP2lHkLz7DUMmhLUBOnjBVXLydVQ8sTo4d3iPbU
   8ZlHRASbnDBZA9OfjevA/UhiXgvmpdGErNrsL5S07EQty6Y3jfCuPE2fI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="305547187"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="305547187"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 02:37:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="661180074"
X-IronPort-AV: E=Sophos;i="5.97,237,1669104000"; 
   d="scan'208";a="661180074"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Jan 2023 02:37:23 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJXj1-0004xg-0g;
	Sun, 22 Jan 2023 10:37:23 +0000
Date: Sun, 22 Jan 2023 18:36:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:hf-5k-rc4 18/19] include/linux/printk.h:347:9: sparse: this
 was the original definition
Message-ID: <202301221805.Zdx9PK5q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: include/linux/printk.h:347:9: sparse: this was the original definition"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>

tree:   https://github.com/jimc/linux.git hf-5k-rc4
head:   0b3fc8ac339994de91403db75a445b884c8e63dd
commit: 12389eb0d15904d817da779d102c72f2c3944579 [18/19] test-dyndbg: tune sub-module behavior
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arc-randconfig-s031-20230122 (https://download.01.org/0day-ci/archive/20230122/202301221805.Zdx9PK5q-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jimc/linux/commit/12389eb0d15904d817da779d102c72f2c3944579
        git remote add jimc https://github.com/jimc/linux.git
        git fetch --no-tags jimc hf-5k-rc4
        git checkout 12389eb0d15904d817da779d102c72f2c3944579
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   lib/test_dynamic_debug_submod.c: note: in included file:
   lib/test_dynamic_debug.c:16:11: sparse: sparse: preprocessor token pr_fmt redefined
   lib/test_dynamic_debug_submod.c: note: in included file (through include/linux/kernel.h, include/linux/cpumask.h, include/linux/mm_types_task.h, ...):
>> include/linux/printk.h:347:9: sparse: this was the original definition
   lib/test_dynamic_debug_submod.c: note: in included file:
   lib/test_dynamic_debug.c:98:1: sparse: sparse: symbol '__UNIQUE_ID_ddebug_class_user181' was not declared. Should it be static?
   lib/test_dynamic_debug.c:99:1: sparse: sparse: symbol '__UNIQUE_ID_ddebug_class_user182' was not declared. Should it be static?
   lib/test_dynamic_debug.c:100:1: sparse: sparse: symbol '__UNIQUE_ID_ddebug_class_user183' was not declared. Should it be static?
   lib/test_dynamic_debug.c:101:1: sparse: sparse: symbol '__UNIQUE_ID_ddebug_class_user184' was not declared. Should it be static?
--
   lib/test_dynamic_debug.c:13:11: sparse: sparse: preprocessor token pr_fmt redefined
   lib/test_dynamic_debug.c: note: in included file (through include/linux/kernel.h, include/linux/cpumask.h, include/linux/mm_types_task.h, ...):
>> include/linux/printk.h:347:9: sparse: this was the original definition
   lib/test_dynamic_debug.c:113:1: sparse: sparse: symbol 'map_disjoint_bits_classnames' was not declared. Should it be static?
   lib/test_dynamic_debug.c:128:1: sparse: sparse: symbol 'map_disjoint_names_classnames' was not declared. Should it be static?
   lib/test_dynamic_debug.c:133:1: sparse: sparse: symbol 'map_level_num_classnames' was not declared. Should it be static?
   lib/test_dynamic_debug.c:138:1: sparse: sparse: symbol 'map_level_names_classnames' was not declared. Should it be static?

vim +347 include/linux/printk.h

01c313dded34a1 Arnd Bergmann   2017-11-13  332  
90c165f0de3ada Ricardo Cañuelo 2020-04-03  333  /**
90c165f0de3ada Ricardo Cañuelo 2020-04-03  334   * pr_fmt - used by the pr_*() macros to generate the printk format string
90c165f0de3ada Ricardo Cañuelo 2020-04-03  335   * @fmt: format string passed from a pr_*() macro
90c165f0de3ada Ricardo Cañuelo 2020-04-03  336   *
90c165f0de3ada Ricardo Cañuelo 2020-04-03  337   * This macro can be used to generate a unified format string for pr_*()
90c165f0de3ada Ricardo Cañuelo 2020-04-03  338   * macros. A common use is to prefix all pr_*() messages in a file with a common
90c165f0de3ada Ricardo Cañuelo 2020-04-03  339   * string. For example, defining this at the top of a source file:
90c165f0de3ada Ricardo Cañuelo 2020-04-03  340   *
90c165f0de3ada Ricardo Cañuelo 2020-04-03  341   *        #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
90c165f0de3ada Ricardo Cañuelo 2020-04-03  342   *
90c165f0de3ada Ricardo Cañuelo 2020-04-03  343   * would prefix all pr_info, pr_emerg... messages in the file with the module
90c165f0de3ada Ricardo Cañuelo 2020-04-03  344   * name.
90c165f0de3ada Ricardo Cañuelo 2020-04-03  345   */
968ab1838a5d48 Linus Torvalds  2010-11-15  346  #ifndef pr_fmt
968ab1838a5d48 Linus Torvalds  2010-11-15 @347  #define pr_fmt(fmt) fmt
968ab1838a5d48 Linus Torvalds  2010-11-15  348  #endif
968ab1838a5d48 Linus Torvalds  2010-11-15  349  

:::::: The code at line 347 was first introduced by commit
:::::: 968ab1838a5d48f02f5b471aa1d0e59e2cc2ccbc include/linux/kernel.h: Move logging bits to include/linux/printk.h

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
