Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B2E2584
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Mar 2023 12:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679488182; x=1711024182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SnSzvN2q8UDWy5PcrkbsIRtuoYYx8QX8A9N27o7vqaM=;
  b=ZvkNHhRbvisnNJ/PaQPXVzBasRKeQBVRy0rxvc5Ez6NLM5/o8wMFDXTU
   vsSpxRQrAumzEuDpqRY4fAgYlKH6mbOLGnM2d6YDzomDwUXsZ4ZQcNeXx
   IH+uej2twIX53e7wgKJtNb1aSxK6v9it3fz7nFspu/WXQnYC1bAlw49bO
   te8ww8Fs5P4AAcvQ4UkerB47KXV9bMt+enFvs2AQbmUIPRgpweCrZ2hHj
   W2sA+tE8g2AzpZJwu6YWLgFEQJa/IUy9WFr9d9069olKgfGabu3W0yHQ9
   DbyspSN7IJCxwaIR7aSzBkNKL6LTf2AOAy32o/5iuIn+fnDsPiRqs0Fu0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="366935066"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="366935066"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 05:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="771021585"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="771021585"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2023 05:29:37 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pexay-000DJ2-36;
	Wed, 22 Mar 2023 12:29:36 +0000
Date: Wed, 22 Mar 2023 20:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:x86/shstk 21/40] include/linux/mm.h:3145
 stack_guard_start_gap() warn: bitwise AND condition is false here
Message-ID: <202303222047.1AP5Kdjv-lkp@intel.com>
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
commit: 2d4ef66720386d567e64e95008d4bdd0812bcbd2 [21/40] mm: Add guard pages around a shadow stack.
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230322/202303222047.1AP5Kdjv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303222047.1AP5Kdjv-lkp@intel.com/

smatch warnings:
include/linux/mm.h:3145 stack_guard_start_gap() warn: bitwise AND condition is false here

vim +3145 include/linux/mm.h

ce6d42f2e4a2d9 Liam Howlett   2021-06-28  3138  
2d4ef66720386d Rick Edgecombe 2023-03-18  3139  static inline unsigned long stack_guard_start_gap(struct vm_area_struct *vma)
2d4ef66720386d Rick Edgecombe 2023-03-18  3140  {
2d4ef66720386d Rick Edgecombe 2023-03-18  3141  	if (vma->vm_flags & VM_GROWSDOWN)
2d4ef66720386d Rick Edgecombe 2023-03-18  3142  		return stack_guard_gap;
2d4ef66720386d Rick Edgecombe 2023-03-18  3143  
2d4ef66720386d Rick Edgecombe 2023-03-18  3144  	/* See reasoning around the VM_SHADOW_STACK definition */
2d4ef66720386d Rick Edgecombe 2023-03-18 @3145  	if (vma->vm_flags & VM_SHADOW_STACK)
2d4ef66720386d Rick Edgecombe 2023-03-18  3146  		return PAGE_SIZE;
2d4ef66720386d Rick Edgecombe 2023-03-18  3147  
2d4ef66720386d Rick Edgecombe 2023-03-18  3148  	return 0;
2d4ef66720386d Rick Edgecombe 2023-03-18  3149  }
2d4ef66720386d Rick Edgecombe 2023-03-18  3150  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
