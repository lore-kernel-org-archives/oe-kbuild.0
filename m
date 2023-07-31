Received: from mgamail.intel.com (unknown [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153997E
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Jul 2023 00:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690762310; x=1722298310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cyokcYvfjTSS5s9In5kokRZsn1wOKsemrW+8pyvxIpM=;
  b=FFl2O8NkfIohXYGLa1/jw77HOraIieARkQ4zXhJ4dhvBkWPwCmrTzRJp
   MM197sSE/6N02jzkmQM1w2u3PlYXDjUVc3ah8H0AWNa29YiVVTj2igs8T
   4AtoVTZvmUaSuD84sw7OCCGXRz7jh+GhdAdeRj7JLgSLqKEesvacloJ1T
   INTp8/Ae4idpLUT9cdAbMhVvm7R47oOIP/kwjsHJnor9vijlZfDipyI8v
   Vrkc72FgoRDbkumbgItkD/gXfGyfTkeksHCo8SOpnmvdfNLmz6c38nZYC
   UsuXZnCT2dx8h03N0QbmC8rCZO8b7Uwd9dOfOjX/KuDfHlW6rNzISjxXu
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="435187009"
X-IronPort-AV: E=Sophos;i="6.01,243,1684825200"; 
   d="scan'208";a="435187009"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 17:11:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="871441905"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2023 17:11:49 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQGVm-0004qJ-1q;
	Mon, 31 Jul 2023 00:11:46 +0000
Date: Mon, 31 Jul 2023 08:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [akpm-mm:mm-unstable 266/338] drivers/dax/kmem.c:74:8-13: ERROR:
 invalid reference to the index variable of the iterator on line 61
Message-ID: <202307310839.tZIHRFBp-lkp@intel.com>
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
TO: Huang Ying <ying.huang@intel.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   d7928c9026c83acc1b3dd2a10ef48489aa0c56d0
commit: c5a826a35e392d073a71479cd981edad85aaca05 [266/338] dax, kmem: calculate abstract distance with general interface
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: s390-randconfig-r062-20230730 (https://download.01.org/0day-ci/archive/20230731/202307310839.tZIHRFBp-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310839.tZIHRFBp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307310839.tZIHRFBp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dax/kmem.c:74:8-13: ERROR: invalid reference to the index variable of the iterator on line 61

vim +74 drivers/dax/kmem.c

c5a826a35e392d Huang Ying 2023-07-21  54  
c5a826a35e392d Huang Ying 2023-07-21  55  static struct memory_dev_type *kmem_find_alloc_memorty_type(int adist)
c5a826a35e392d Huang Ying 2023-07-21  56  {
c5a826a35e392d Huang Ying 2023-07-21  57  	bool found = false;
c5a826a35e392d Huang Ying 2023-07-21  58  	struct memory_dev_type *mtype;
c5a826a35e392d Huang Ying 2023-07-21  59  
c5a826a35e392d Huang Ying 2023-07-21  60  	mutex_lock(&kmem_memory_type_lock);
c5a826a35e392d Huang Ying 2023-07-21 @61  	list_for_each_entry(mtype, &kmem_memory_types, list) {
c5a826a35e392d Huang Ying 2023-07-21  62  		if (mtype->adistance == adist) {
c5a826a35e392d Huang Ying 2023-07-21  63  			found = true;
c5a826a35e392d Huang Ying 2023-07-21  64  			break;
c5a826a35e392d Huang Ying 2023-07-21  65  		}
c5a826a35e392d Huang Ying 2023-07-21  66  	}
c5a826a35e392d Huang Ying 2023-07-21  67  	if (!found) {
c5a826a35e392d Huang Ying 2023-07-21  68  		mtype = alloc_memory_type(adist);
c5a826a35e392d Huang Ying 2023-07-21  69  		if (!IS_ERR(mtype))
c5a826a35e392d Huang Ying 2023-07-21  70  			list_add(&mtype->list, &kmem_memory_types);
c5a826a35e392d Huang Ying 2023-07-21  71  	}
c5a826a35e392d Huang Ying 2023-07-21  72  	mutex_unlock(&kmem_memory_type_lock);
c5a826a35e392d Huang Ying 2023-07-21  73  
c5a826a35e392d Huang Ying 2023-07-21 @74  	return mtype;
c5a826a35e392d Huang Ying 2023-07-21  75  }
c5a826a35e392d Huang Ying 2023-07-21  76  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
