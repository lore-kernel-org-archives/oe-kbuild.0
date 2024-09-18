Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4229410A1C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Sep 2024 02:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726626956; cv=none; b=t/wbKV7Opj49OO4gAn0NJaW/GJptxRTxWoX4Wmdr1MTQhJGG8o2X0/1SXceXr0MEQQxx77XDCOO3SSsGzszvihv7rysfPNLKwScnW0kh2jbUR0ImA5NydpaKJrHNfZLEDERxaKH5+hjmOaAqaUAJLSfVOOHHpmQhFjq8+f8pk20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726626956; c=relaxed/simple;
	bh=D020oU2GSRWiRFj291GUxB66uPIaNDynB5sIS/tPqJE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qxUWoKHTkg/RWkKt64TK8rLCdJZYObWTTmVxHjJRpUjJrojCieRWm4ABj3ULeMUoIWbxqemX/IZiiWmrpNlCTtsfmI38FxJ0sv23Atp5hjdhNp19gYE7aQ2yizJpwyctw0Zn0TeuoyXqEqTuBXdIHspoSe+DOiBWWtQYP4wwGgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9GOfxjw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9GOfxjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726626954; x=1758162954;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D020oU2GSRWiRFj291GUxB66uPIaNDynB5sIS/tPqJE=;
  b=Z9GOfxjwxdibUEDjTZrLOXzxNJkA412cAKGBoOoeLNvYjnCa+Y61RSFo
   kP/4eGZbIxPpovCZNy76Vrhj/StiZnrV2aT6g3K61+1b9/hcDYgKYSJS5
   kIkxmvqbdo7utFPd3+IIFUgd2wa6/mznKggIyV7DMGK/JlhGpCphZqF+J
   5y/V/dUWVwpVdnaPfLGvea0Ineaz8o+VWpbwI1eC4zsJqzWINBsfUf8t4
   jMNKcenpsPJqHuYzxTVDmdyqKPLclTmqxVjawSJDPjZ2M0x1aKSlM7ell
   FCmg7W9cgPohkI+Mv/9lNJBerOqWPijAnBS+I2QzGN7/KvxkeAq8tw8H1
   A==;
X-CSE-ConnectionGUID: 7miN2X/xQLi+OcM2Yj2O7Q==
X-CSE-MsgGUID: MK3+Syw+SkS0BU0FGfiyNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="28425834"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="28425834"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2024 19:35:54 -0700
X-CSE-ConnectionGUID: gwD6GRHIRQuUM7NGUF4UJQ==
X-CSE-MsgGUID: m6DQEq9FSt2hjuc7LeOlhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="69374746"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Sep 2024 19:35:52 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqkXl-000BoE-2r;
	Wed, 18 Sep 2024 02:35:49 +0000
Date: Wed, 18 Sep 2024 10:34:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 1727/30000] mm/memcontrol.c:7050 uncharge_page()
 error: uninitialized symbol 'objcg'.
Message-ID: <202409181017.Hf4FdIlC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1b6ac823ff98dd4dbd1b6bff478a1b9b44855f67
commit: 63472377281639f1cce1e1328288a69f9ed8beba [1727/30000] mm: memcontrol: use obj_cgroup APIs to charge kmem pages
:::::: branch date: 4 days ago
:::::: commit date: 2 years, 11 months ago
config: x86_64-randconfig-161-20240913 (https://download.01.org/0day-ci/archive/20240918/202409181017.Hf4FdIlC-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409181017.Hf4FdIlC-lkp@intel.com/

smatch warnings:
mm/memcontrol.c:7050 uncharge_page() error: uninitialized symbol 'objcg'.

vim +/objcg +7050 mm/memcontrol.c

747db954cab64c Johannes Weiner         2014-08-08  7003  
a9d5adeeb4b2c7 Jérôme Glisse           2017-09-08  7004  static void uncharge_page(struct page *page, struct uncharge_gather *ug)
747db954cab64c Johannes Weiner         2014-08-08  7005  {
9f762dbe19b9f1 Johannes Weiner         2020-06-03  7006  	unsigned long nr_pages;
63472377281639 Muchun Song             2021-10-30  7007  	struct mem_cgroup *memcg;
63472377281639 Muchun Song             2021-10-30  7008  	struct obj_cgroup *objcg;
9f762dbe19b9f1 Johannes Weiner         2020-06-03  7009  
747db954cab64c Johannes Weiner         2014-08-08  7010  	VM_BUG_ON_PAGE(PageLRU(page), page);
747db954cab64c Johannes Weiner         2014-08-08  7011  
747db954cab64c Johannes Weiner         2014-08-08  7012  	/*
747db954cab64c Johannes Weiner         2014-08-08  7013  	 * Nobody should be changing or seriously looking at
63472377281639 Muchun Song             2021-10-30  7014  	 * page memcg or objcg at this point, we have fully
2983331575bfb2 Johannes Weiner         2014-12-10  7015  	 * exclusive access to the page.
747db954cab64c Johannes Weiner         2014-08-08  7016  	 */
63472377281639 Muchun Song             2021-10-30  7017  	if (PageMemcgKmem(page)) {
63472377281639 Muchun Song             2021-10-30  7018  		objcg = __page_objcg(page);
63472377281639 Muchun Song             2021-10-30  7019  		/*
63472377281639 Muchun Song             2021-10-30  7020  		 * This get matches the put at the end of the function and
63472377281639 Muchun Song             2021-10-30  7021  		 * kmem pages do not hold memcg references anymore.
63472377281639 Muchun Song             2021-10-30  7022  		 */
63472377281639 Muchun Song             2021-10-30  7023  		memcg = get_mem_cgroup_from_objcg(objcg);
63472377281639 Muchun Song             2021-10-30  7024  	} else {
63472377281639 Muchun Song             2021-10-30  7025  		memcg = __page_memcg(page);
63472377281639 Muchun Song             2021-10-30  7026  	}
63472377281639 Muchun Song             2021-10-30  7027  
63472377281639 Muchun Song             2021-10-30  7028  	if (!memcg)
63472377281639 Muchun Song             2021-10-30  7029  		return;
747db954cab64c Johannes Weiner         2014-08-08  7030  
63472377281639 Muchun Song             2021-10-30  7031  	if (ug->memcg != memcg) {
a9d5adeeb4b2c7 Jérôme Glisse           2017-09-08  7032  		if (ug->memcg) {
a9d5adeeb4b2c7 Jérôme Glisse           2017-09-08  7033  			uncharge_batch(ug);
a9d5adeeb4b2c7 Jérôme Glisse           2017-09-08  7034  			uncharge_gather_clear(ug);
747db954cab64c Johannes Weiner         2014-08-08  7035  		}
63472377281639 Muchun Song             2021-10-30  7036  		ug->memcg = memcg;
66a3bf90a949b5 Muchun Song             2021-10-30  7037  		ug->dummy_page = page;
f1796544a0ca0f Michal Hocko            2020-09-04  7038  
f1796544a0ca0f Michal Hocko            2020-09-04  7039  		/* pairs with css_put in uncharge_batch */
63472377281639 Muchun Song             2021-10-30  7040  		css_get(&memcg->css);
747db954cab64c Johannes Weiner         2014-08-08  7041  	}
747db954cab64c Johannes Weiner         2014-08-08  7042  
d8c6546b1aea84 Matthew Wilcox (Oracle  2019-09-23  7043) 	nr_pages = compound_nr(page);
9f762dbe19b9f1 Johannes Weiner         2020-06-03  7044  
63472377281639 Muchun Song             2021-10-30  7045  	if (PageMemcgKmem(page)) {
63472377281639 Muchun Song             2021-10-30  7046  		ug->nr_memory += nr_pages;
9f762dbe19b9f1 Johannes Weiner         2020-06-03  7047  		ug->nr_kmem += nr_pages;
63472377281639 Muchun Song             2021-10-30  7048  
63472377281639 Muchun Song             2021-10-30  7049  		page->memcg_data = 0;
63472377281639 Muchun Song             2021-10-30 @7050  		obj_cgroup_put(objcg);
63472377281639 Muchun Song             2021-10-30  7051  	} else {
63472377281639 Muchun Song             2021-10-30  7052  		/* LRU pages aren't accounted at the root level */
63472377281639 Muchun Song             2021-10-30  7053  		if (!mem_cgroup_is_root(memcg))
63472377281639 Muchun Song             2021-10-30  7054  			ug->nr_memory += nr_pages;
492cf0b0c21dc6 Roman Gushchin          2021-10-30  7055  		ug->pgpgout++;
747db954cab64c Johannes Weiner         2014-08-08  7056  
d1b942b7ac549e Roman Gushchin          2021-10-30  7057  		page->memcg_data = 0;
63472377281639 Muchun Song             2021-10-30  7058  	}
63472377281639 Muchun Song             2021-10-30  7059  
63472377281639 Muchun Song             2021-10-30  7060  	css_put(&memcg->css);
a9d5adeeb4b2c7 Jérôme Glisse           2017-09-08  7061  }
a9d5adeeb4b2c7 Jérôme Glisse           2017-09-08  7062  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
