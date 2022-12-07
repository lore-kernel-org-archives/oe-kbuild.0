Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45607625
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Dec 2022 06:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670395560; x=1701931560;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K7sP2d719B6KzjuRdkZ0XHZ0HPTXIIujfIuLTh0BQAo=;
  b=BEeeVCLvS40RkWFH/mdUMoxuf1LHR2+9exlIOZezzPAWKul8U5yXGVTQ
   O/iR9wnJUkezgcMs7dSczxY7H202NucYhw2amzDQnPgP6KK6nVvA0hIDc
   3CkdzHsyVOAXiBkkM389qS/2+5vu8Ra8bNQEwZ/AFZVgKs8kbpHS2A/gd
   NqGEB7igd2d/encfABPslbWIZM3JfS6EDwhh6EhzWhqeelkR5J6juO/oM
   cd68OOg5raIcOGbYRrttjGVVwL6X4JCdPFEKiyA76WXCR21DD3vzWCNi4
   IxHHuT9tVe8lNJnxVE+MrgYKntiwaA2V8C7uhJydY0xNalJoKZuzJ8BhI
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="315532004"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="315532004"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2022 22:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10553"; a="648610583"
X-IronPort-AV: E=Sophos;i="5.96,223,1665471600"; 
   d="scan'208";a="648610583"
Received: from lkp-server01.sh.intel.com (HELO b5d47979f3ad) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 06 Dec 2022 22:45:57 -0800
Received: from kbuild by b5d47979f3ad with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p2oBo-00001N-1C;
	Wed, 07 Dec 2022 06:45:56 +0000
Date: Wed, 7 Dec 2022 14:45:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android13-5.15-arcvm 73/132] fs/proc/task_mmu.c:
 linux/mm_inline.h is included more than once.
Message-ID: <202212071403.Ha6avC4r-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android13-5.15-arcvm
head:   d448a637f1580ff077f332ee8244e6f87da86d92
commit: 8cbd6a28104fcbe846a6d9ec56c2819068829de3 [73/132] CHROMIUM: mm: per-process reclaim
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> fs/proc/task_mmu.c: linux/mm_inline.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
