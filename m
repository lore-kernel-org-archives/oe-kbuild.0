Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3152C9D
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Mar 2023 14:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679151047; x=1710687047;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BkvV3H/CpKiO3nSsCEyOLTHPstr9G3R1MqE66a9e16g=;
  b=L3AMr8uz8O3B2KutUxgVijmaC2AxaY0/oKsstM0On+JIU3x7AYebxQ4+
   5tQj8xyyZotwiF5lnEI0AQ129z5kKj1AvTNdThyK0N4p5W+Vkn4+iGfFG
   kDhRyhGukWVqSkJXk+uzWVn5rLuBOUYnIa6K25VkY4ubwD7E+D5+pHkBC
   bQBcaCHlS5zVcOex7S59krmeZC8s/jFni1UmsESIEXrIP1I+gtdlx1+rM
   wZUj6eOC01XDvN3mVNIzliwAls+n2fam3bXiXgTV66PJDGxAuhLdWAgSr
   q0bQ6qP/NTkxUZy7FHo3jJQo7JFSOyDtHTOT9aa1cwtT0zlfXhiDJCrND
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="401015152"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="401015152"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 07:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="657879775"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="657879775"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Mar 2023 07:50:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdXtN-000A7G-1n;
	Sat, 18 Mar 2023 14:50:45 +0000
Date: Sat, 18 Mar 2023 22:49:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
 7/31] arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is
 included more than once.
Message-ID: <202303182227.uHR09uSw-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split-pointless-c13
head:   961fd7e75191ae82383f80c1dfd97559f14965b8
commit: 6e863d123cc67f8fb660aa54f971a01ddc56b5b2 [7/31] arm64: memory: Make virt_to_pfn() a static inline
:::::: branch date: 10 days ago
:::::: commit date: 9 weeks ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303182227.uHR09uSw-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/include/asm/memory.h: asm-generic/memory_model.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
