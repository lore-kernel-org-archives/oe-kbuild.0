Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1F5133EA
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Feb 2023 10:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675939599; x=1707475599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gc8hDrfmTGgQ7jI/4Tq1U07ofcx6Lu7mMekXmD9A/rs=;
  b=Z0GshWv1qFMwbBcO82O0GrT/ePutPUiUGEJXTLVMRz5AprmF306cDVdI
   nII6p9leXpAjBbRwUMNbGCVBr/NrMZXVJKf8OM/FxlRGJLH8ysV1JPWw3
   7mudl6hpMSPQhJ2vNIboOMFL6XW9Yfrq1qo6fqUy/s1Jx0b0trkClvHY7
   uWgpN0WJnQTVFDBdLOPb6Wc9CwkghWffVwPn5xNU0QlidRjhvdQs7g36k
   j35duIBDfyLaXc2Q4w7NsgEiqmLxMJwX3jt+lAhrEaSkrnI6o8TRsx8X8
   bIoPPNIDE+6nrs6SPZAKU1Br34+jGTR+jpQnbiupkF9fy+7qDa14/5ZY2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310428581"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="310428581"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 02:46:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="736290445"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="736290445"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Feb 2023 02:46:38 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ4Rp-00050w-17;
	Thu, 09 Feb 2023 10:46:37 +0000
Date: Thu, 9 Feb 2023 18:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/kasan/kasan_test.c:1155 rcu_uaf_reclaim() warn: statement has no
 effect 8
Message-ID: <202302091841.Vm0kZ0kt-lkp@intel.com>
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
TO: Andrey Konovalov <andreyknvl@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Marco Elver <elver@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0983f6bf2bfc0789b51ddf7315f644ff4da50acb
commit: 8516e837cab0b2c740b90603b66039aa7dcecda4 kasan: migrate kasan_rcu_uaf test to kunit
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: xtensa-randconfig-m031-20230209 (https://download.01.org/0day-ci/archive/20230209/202302091841.Vm0kZ0kt-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302091841.Vm0kZ0kt-lkp@intel.com

smatch warnings:
mm/kasan/kasan_test.c:1155 rcu_uaf_reclaim() warn: statement has no effect 8
mm/kasan/kasan_test.c:1155 rcu_uaf_reclaim() error: dereferencing freed memory 'fp'

vim +1155 mm/kasan/kasan_test.c

8516e837cab0b2 Andrey Konovalov 2022-09-27  1148  
8516e837cab0b2 Andrey Konovalov 2022-09-27  1149  static void rcu_uaf_reclaim(struct rcu_head *rp)
8516e837cab0b2 Andrey Konovalov 2022-09-27  1150  {
8516e837cab0b2 Andrey Konovalov 2022-09-27  1151  	struct kasan_rcu_info *fp =
8516e837cab0b2 Andrey Konovalov 2022-09-27  1152  		container_of(rp, struct kasan_rcu_info, rcu);
8516e837cab0b2 Andrey Konovalov 2022-09-27  1153  
8516e837cab0b2 Andrey Konovalov 2022-09-27  1154  	kfree(fp);
8516e837cab0b2 Andrey Konovalov 2022-09-27 @1155  	((volatile struct kasan_rcu_info *)fp)->i;
8516e837cab0b2 Andrey Konovalov 2022-09-27  1156  }
8516e837cab0b2 Andrey Konovalov 2022-09-27  1157  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
