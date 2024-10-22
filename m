Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4418F13D516
	for <oe-kbuild@lists.linux.dev>; Tue, 22 Oct 2024 11:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729596998; cv=none; b=CTBCZcr6ODJt4IzmxaFf8eCqphIyddioD9/A06WWj8N4RAHeGgasFSDEEgqCTSnvpea2dr+goSdRhEpWkT5SAmKkTvYsW232QPghKnnTdnvzqHRqYEy/KPu3hz+scnsLQJUIts3IdWeoXCnV5odHMFXD4YibdXyC207QR/oPJoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729596998; c=relaxed/simple;
	bh=YVfvRX/PoAeFVtLWTfJQtgWi+KYIpLR0J5wdxyMlyGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OWI36d3GIEoV8KTeRqCPypX7SvbkcEQyG/YmV7EjciccMDFYWkPJZ5ANWXyhEJ/E8pXy8m0O4LW0SQGH4E5bNThKmIeCAGNaIEuuZtgYqPtJovmAYSmoEFUbXpJIM7O4FXO93h09nm5XlqtxXogspJozufeQXuXrJ6XtAXICpfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4AwBOK0; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4AwBOK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729596996; x=1761132996;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YVfvRX/PoAeFVtLWTfJQtgWi+KYIpLR0J5wdxyMlyGw=;
  b=C4AwBOK0L7wYZsuF0dd+AUiwkdLHuUzDhR+SuDnM/c2U00A2+lzilMBX
   C2BjgSZ91XfaZkkK7y9m4DgQtjtMlJQJGVVPKTHszm/Uxrz39utMMgiNu
   4wKbZRsUinnXkjnh4sj6JSLow6iekj/4MWiw9+EMc5T9w1xkC4ho98McX
   pmGbEzEnmNOAK85AmWcC5hns3dKrYztsvI1XJn5lcx/6vy/yCHfNGyrS5
   dg+CuB9f9fjy7sCSpLs7i4X8Fmjr+butrAhS6JneZAnG4GHkARn4xGnjW
   ZoWvhG908j+ewECwLcf2eL5lrGiGy0jNsHD0CFQX7ue7nzxe+x2SKJOjB
   w==;
X-CSE-ConnectionGUID: BikrO1AQTUKU/IN5c3cVTA==
X-CSE-MsgGUID: /w6lwJBeTNaoiQJtWau4yA==
X-IronPort-AV: E=McAfee;i="6700,10204,11232"; a="33053788"
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="33053788"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2024 04:36:35 -0700
X-CSE-ConnectionGUID: BAE88KKfTWWfU7hdjEWP8Q==
X-CSE-MsgGUID: iTD12lzKRwK/2hMkVVQjcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,223,1725346800"; 
   d="scan'208";a="79784801"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Oct 2024 04:36:34 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3DBf-000TVC-2F;
	Tue, 22 Oct 2024 11:36:31 +0000
Date: Tue, 22 Oct 2024 19:35:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 1213/30000] mm/memcontrol.c:7050 uncharge_page()
 error: uninitialized symbol 'objcg'.
Message-ID: <202410221923.9WVki2nh-lkp@intel.com>
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
head:   950c74b8b6db893114b092f9fd2548037daa73f7
commit: 63472377281639f1cce1e1328288a69f9ed8beba [1213/30000] mm: memcontrol: use obj_cgroup APIs to charge kmem pages
:::::: branch date: 28 hours ago
:::::: commit date: 3 years ago
config: x86_64-randconfig-161-20241022 (https://download.01.org/0day-ci/archive/20241022/202410221923.9WVki2nh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410221923.9WVki2nh-lkp@intel.com/

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
