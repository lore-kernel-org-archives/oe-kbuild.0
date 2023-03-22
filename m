Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C608F58
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 17:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679506610; x=1711042610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w/9LzMFAtWm/dUUfD/zTATYD+r1mUZmLarIGjy+CvfE=;
  b=al5QMT1GecYtNzGmWGHJJ9w2NzF6aQE6OWalsv1I7qGSw3f1ys1eQD5C
   dwmK51dQ4LF9aoWbAg7fLsyf6uq9ezoyUvHRaMBp+IgHh/sWImOYHwOgC
   Yw5Bd2ncLc3uIHreuaLH4NL3ZNNOVSp5iKgZ1pMlV5pbvx7/FjBDxIdIp
   aZ771hlbn6n6hCUwRHjT4x1pkWbZentl8zVxY11FkA+7g1Tg9KylSdosJ
   HXRWPUiz/0j7GgB4eeQjqIUkCAWefOt327p17oOm2CX3tUyT0qvDd6r9c
   rmVpQN/rYPZfGxnUGAIjaUXzB7/Yba2NS/DcXhtkHi+CL9MPaBqCB758P
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319674993"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="319674993"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 10:36:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="659255373"
X-IronPort-AV: E=Sophos;i="5.98,282,1673942400"; 
   d="scan'208";a="659255373"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 22 Mar 2023 10:36:48 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pf2OG-000DWq-00;
	Wed, 22 Mar 2023 17:36:48 +0000
Date: Thu, 23 Mar 2023 01:36:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:x86/shstk 22/40] mm/internal.h:501 is_stack_mapping() warn:
 bitwise AND condition is false here
Message-ID: <202303230135.80IlRtl2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Rick Edgecombe <rick.p.edgecombe@intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: "Yu-cheng Yu" <yu-cheng.yu@intel.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86/shstk
head:   b642e9e5f0dc797f543b431d4ba910a3da72a074
commit: 4c8e07c3b6db4a514b03f2f2455e81e512d2f785 [22/40] mm/mmap: Add shadow stack pages to memory accounting
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230323/202303230135.80IlRtl2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303230135.80IlRtl2-lkp@intel.com/

New smatch warnings:
mm/internal.h:501 is_stack_mapping() warn: bitwise AND condition is false here

Old smatch warnings:
include/linux/mm.h:3145 stack_guard_start_gap() warn: bitwise AND condition is false here

vim +501 mm/internal.h

d977d56ce5b3e8 Konstantin Khlebnikov 2016-02-02  492  
30bdbb78009e67 Konstantin Khlebnikov 2016-02-02  493  /*
4c8e07c3b6db4a Rick Edgecombe        2023-03-18  494   * Stack area (including shadow stacks)
30bdbb78009e67 Konstantin Khlebnikov 2016-02-02  495   *
30bdbb78009e67 Konstantin Khlebnikov 2016-02-02  496   * VM_GROWSUP / VM_GROWSDOWN VMAs are always private anonymous:
30bdbb78009e67 Konstantin Khlebnikov 2016-02-02  497   * do_mmap() forbids all other combinations.
30bdbb78009e67 Konstantin Khlebnikov 2016-02-02  498   */
d977d56ce5b3e8 Konstantin Khlebnikov 2016-02-02  499  static inline bool is_stack_mapping(vm_flags_t flags)
d977d56ce5b3e8 Konstantin Khlebnikov 2016-02-02  500  {
4c8e07c3b6db4a Rick Edgecombe        2023-03-18 @501  	return ((flags & VM_STACK) == VM_STACK) || (flags & VM_SHADOW_STACK);
d977d56ce5b3e8 Konstantin Khlebnikov 2016-02-02  502  }
d977d56ce5b3e8 Konstantin Khlebnikov 2016-02-02  503  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
