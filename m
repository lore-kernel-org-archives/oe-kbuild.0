Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3559CA4A
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 01:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694742612; x=1726278612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3UG+AzApWuf8x9XO7Hzx5Rg3uXrAiE11B37MdVXpDdg=;
  b=jjFCXwq3wnnxwGrEXKd1E+HIXlSkrcREYOyq6oFXRNFMCg8HDBH9qY9C
   nUUwTowYee1Em2GNNAr6JFcS/M6eCl4hZNoPIn3ElwVifnMoef8OX0Z5Y
   H21DSwao1kljgiqgFjKUcE9QjGiNIwzzO3AGOUXR1OqiaisZMyN5w6/o5
   dxQueSPJRfWFWfC1RwRymSuMYRQYM3VrUgRwQ6zc2rnaGpy+OPSstQnYf
   7Vd2TMD+9X5RnKQ0mXoY/OkmK8e8t/NGAtFS8nqHktIPxWRlfkFnbNtE6
   7/9N6gn2Sc1nYlYohHZB3RgthsPb7ZxkrVLtrQRSEXzcF68JHvBG3VkEE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="410074401"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="410074401"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2023 18:50:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="694550187"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; 
   d="scan'208";a="694550187"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Sep 2023 18:50:09 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgxyB-0002HR-0I;
	Fri, 15 Sep 2023 01:50:07 +0000
Date: Fri, 15 Sep 2023 09:49:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 846/1095] drivers/dax/kmem.c:74:8-13: ERROR:
 invalid reference to the index variable of the iterator on line 61
Message-ID: <202309150959.WgiONEmO-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Huang Ying <ying.huang@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98897dc735cf6635f0966f76eb0108354168fb15
commit: cb826bb2f6e132253d68b931d64b8d3973bf6095 [846/1095] dax, kmem: calculate abstract distance with general interface
:::::: branch date: 23 hours ago
:::::: commit date: 9 days ago
config: x86_64-randconfig-104-20230912 (https://download.01.org/0day-ci/archive/20230915/202309150959.WgiONEmO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309150959.WgiONEmO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202309150959.WgiONEmO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dax/kmem.c:74:8-13: ERROR: invalid reference to the index variable of the iterator on line 61

vim +74 drivers/dax/kmem.c

cb826bb2f6e132 Huang Ying 2023-08-16  54  
cb826bb2f6e132 Huang Ying 2023-08-16  55  static struct memory_dev_type *kmem_find_alloc_memory_type(int adist)
cb826bb2f6e132 Huang Ying 2023-08-16  56  {
cb826bb2f6e132 Huang Ying 2023-08-16  57  	bool found = false;
cb826bb2f6e132 Huang Ying 2023-08-16  58  	struct memory_dev_type *mtype;
cb826bb2f6e132 Huang Ying 2023-08-16  59  
cb826bb2f6e132 Huang Ying 2023-08-16  60  	mutex_lock(&kmem_memory_type_lock);
cb826bb2f6e132 Huang Ying 2023-08-16 @61  	list_for_each_entry(mtype, &kmem_memory_types, list) {
cb826bb2f6e132 Huang Ying 2023-08-16  62  		if (mtype->adistance == adist) {
cb826bb2f6e132 Huang Ying 2023-08-16  63  			found = true;
cb826bb2f6e132 Huang Ying 2023-08-16  64  			break;
cb826bb2f6e132 Huang Ying 2023-08-16  65  		}
cb826bb2f6e132 Huang Ying 2023-08-16  66  	}
cb826bb2f6e132 Huang Ying 2023-08-16  67  	if (!found) {
cb826bb2f6e132 Huang Ying 2023-08-16  68  		mtype = alloc_memory_type(adist);
cb826bb2f6e132 Huang Ying 2023-08-16  69  		if (!IS_ERR(mtype))
cb826bb2f6e132 Huang Ying 2023-08-16  70  			list_add(&mtype->list, &kmem_memory_types);
cb826bb2f6e132 Huang Ying 2023-08-16  71  	}
cb826bb2f6e132 Huang Ying 2023-08-16  72  	mutex_unlock(&kmem_memory_type_lock);
cb826bb2f6e132 Huang Ying 2023-08-16  73  
cb826bb2f6e132 Huang Ying 2023-08-16 @74  	return mtype;
cb826bb2f6e132 Huang Ying 2023-08-16  75  }
cb826bb2f6e132 Huang Ying 2023-08-16  76  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
