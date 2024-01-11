Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D7F3C485
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jan 2024 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IYg/kDlP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704982636; x=1736518636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OJ0TBIos7kcJnCqdbVrgfdcBN1Ckgp+F90HCaR0bTDU=;
  b=IYg/kDlPYJwqzfFgEW5Sqshdzlrw/RlXh9kK+MmzamwXoeXT2huINn7a
   iMYwOY4JPh4Lm0tPWiaHVLFxuOrNNTFTWZloFuppeZuMb+WNRuqiKB+SW
   JyLkbqpQ07cK3hHgLD1PLoJ1YV8S5HufGX6mI7PUf95fgQRxY6c6huy4z
   5CnCTFa5hhw1EbrU/Y7SHuE2agVIl18ji3NXzxDnGqCISS8KjAYZ5a6hd
   PCELekGIRkZSZXohkYTHC5dv7pD8/Ve3s34v7rjN3cKwbMtaRbDWKdTme
   i5KOja4qPK5XIS+gl+nzcDCJ+ZqYrZLKE9n0hbMK2j045E1Wfl/8EPB2l
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="12347704"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="12347704"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 06:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="905962652"
X-IronPort-AV: E=Sophos;i="6.04,186,1695711600"; 
   d="scan'208";a="905962652"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 11 Jan 2024 06:17:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNvrq-0008LI-1M;
	Thu, 11 Jan 2024 14:17:10 +0000
Date: Thu, 11 Jan 2024 22:16:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12996/13245] mm/vmalloc.c:4345 vmalloc_dump_obj()
 error: uninitialized symbol 'addr'.
Message-ID: <202401112219.sugH0jvj-lkp@intel.com>
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
TO: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Baoquan He <bhe@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9e21984d62c56a0f6d1fc6f76b646212cfd7fe88
commit: 86817057732a9ce9cefdb6f513b6554a55ebbbbb [12996/13245] mm: vmalloc: remove global vmap_area_root rb-tree
:::::: branch date: 10 hours ago
:::::: commit date: 21 hours ago
config: x86_64-randconfig-161-20240111 (https://download.01.org/0day-ci/archive/20240111/202401112219.sugH0jvj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401112219.sugH0jvj-lkp@intel.com/

smatch warnings:
mm/vmalloc.c:4345 vmalloc_dump_obj() error: uninitialized symbol 'addr'.

vim +/addr +4345 mm/vmalloc.c

a10aa579878fc6 Christoph Lameter       2008-04-28  4330  
5bb1bb353cfe34 Paul E. McKenney        2021-01-07  4331  #ifdef CONFIG_PRINTK
98f180837a896e Paul E. McKenney        2020-12-08  4332  bool vmalloc_dump_obj(void *object)
98f180837a896e Paul E. McKenney        2020-12-08  4333  {
98f180837a896e Paul E. McKenney        2020-12-08  4334  	void *objp = (void *)PAGE_ALIGN((unsigned long)object);
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4335) 	const void *caller;
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4336) 	struct vmap_area *va;
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4337) 	struct vmap_node *vn;
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4338) 	unsigned long addr;
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4339) 	unsigned int nr_pages;
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4340) 	bool success = false;
98f180837a896e Paul E. McKenney        2020-12-08  4341  
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4342) 	vn = addr_to_node((unsigned long)objp);
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4343) 
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4344) 	if (spin_trylock(&vn->busy.lock)) {
86817057732a9c Uladzislau Rezki (Sony  2024-01-02 @4345) 		va = __find_vmap_area(addr, &vn->busy.root);
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4346) 
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4347) 		if (va && va->vm) {
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4348) 			addr = (unsigned long)va->vm->addr;
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4349) 			caller = va->vm->caller;
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4350) 			nr_pages = va->vm->nr_pages;
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4351) 			success = true;
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4352) 		}
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4353) 
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4354) 		spin_unlock(&vn->busy.lock);
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4355) 	}
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4356) 
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4357) 	if (success)
bd34dcd4120d7e Paul E. McKenney        2020-12-09  4358  		pr_cont(" %u-page vmalloc region starting at %#lx allocated at %pS\n",
0818e739b5c061 Joel Fernandes (Google  2023-09-04  4359) 			nr_pages, addr, caller);
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4360) 
86817057732a9c Uladzislau Rezki (Sony  2024-01-02  4361) 	return success;
98f180837a896e Paul E. McKenney        2020-12-08  4362  }
5bb1bb353cfe34 Paul E. McKenney        2021-01-07  4363  #endif
98f180837a896e Paul E. McKenney        2020-12-08  4364  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
