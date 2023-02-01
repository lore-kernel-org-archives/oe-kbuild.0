Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6255B8483
	for <oe-kbuild@lists.linux.dev>; Wed,  1 Feb 2023 18:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675274714; x=1706810714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ulhaxX2A9Jjc45y0mBBzIlTjlRVyCarXiMa8mtGH+8=;
  b=gUnMaVn6sBNDmkf9eLYuJKsxuvz+iq9uw7OnGvKTZVpJ9GvNtSLe2BTZ
   k/4D3+9H6xwTa8gA8xLlGSQ2yXeiIF2QFYIbJ1MsF2vvbd9MfF5gUuS8x
   pvAsiPNXgKhLzl9CYqpMnpVj1pn6VlCg+zTd40B+XC8JD32wfX8d6qwPe
   +lETpbTB4mHCYiOcNEso+79jLefWj/wWK2oQFCiZICRtY9TsCxGrv7iZG
   ar/IMGZ73HsFXfvQKTWBUnq4obaivs1j8RzdpKQKNqwnLxuGQ+Kr7QWuN
   luf9Q4nft5PIIwP7vTDsSrPQ+UiSU8BKMe/2ZJz1aKv/ty/CBXmixnLVJ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="390615851"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="390615851"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 10:04:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="788972546"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="788972546"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 01 Feb 2023 10:03:46 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNHSO-0005fK-1k;
	Wed, 01 Feb 2023 18:03:40 +0000
Date: Thu, 2 Feb 2023 02:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8821/9815] mm/zsmalloc.c:1619:72: warning:
 Parameter 'handle' can be declared as pointer to const [constParameter]
Message-ID: <202302020127.8jJUKhkv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/zsmalloc.c:1619:72: warning: Parameter 'handle' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Nhat Pham <nphamcs@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   66eee64b235411d512bed4d672c2d00683239daf
commit: 278425ca22837bad466ac6558024b10424d3b82a [8821/9815] zsmalloc: fix a race with deferred_handles storing
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 278425ca22837bad466ac6558024b10424d3b82a
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   mm/zsmalloc.c:2249:16: warning: Local variable 'obj_allocated' shadows outer function [shadowFunction]
    unsigned long obj_allocated = zs_stat_get(class, OBJ_ALLOCATED);
                  ^
   mm/zsmalloc.c:940:13: note: Shadowed declaration
   static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
               ^
   mm/zsmalloc.c:2249:16: note: Shadow variable
    unsigned long obj_allocated = zs_stat_get(class, OBJ_ALLOCATED);
                  ^
>> mm/zsmalloc.c:1619:72: warning: Parameter 'handle' can be declared as pointer to const [constParameter]
   static void obj_free(int class_size, unsigned long obj, unsigned long *handle)
                                                                          ^
   mm/zsmalloc.c:2198:15: warning: Uninitialized variables: zspage.huge, zspage.fullness, zspage.class, zspage.isolated, zspage.magic, zspage.inuse, zspage.freeobj, zspage.first_page, zspage.pool, zspage.lock [uninitvar]
     lock_zspage(zspage);
                 ^
   mm/zsmalloc.c:2188:20: note: Assuming condition is false
     if (class->index != i)
                      ^
   mm/zsmalloc.c:2198:15: note: Uninitialized variables: zspage.huge, zspage.fullness, zspage.class, zspage.isolated, zspage.magic, zspage.inuse, zspage.freeobj, zspage.first_page, zspage.pool, zspage.lock
     lock_zspage(zspage);
                 ^
>> mm/zsmalloc.c:2198:15: warning: Uninitialized variables: zspage.huge, zspage.fullness, zspage.class, zspage.isolated, zspage.magic, zspage.inuse, zspage.freeobj, zspage.first_page, zspage.lru, zspage.under_reclaim, zspage.pool, zspage.lock [uninitvar]
     lock_zspage(zspage);
                 ^
   mm/zsmalloc.c:2188:20: note: Assuming condition is false
     if (class->index != i)
                      ^
   mm/zsmalloc.c:2198:15: note: Uninitialized variables: zspage.huge, zspage.fullness, zspage.class, zspage.isolated, zspage.magic, zspage.inuse, zspage.freeobj, zspage.first_page, zspage.lru, zspage.under_reclaim, zspage.pool, zspage.lock
     lock_zspage(zspage);
                 ^
   mm/zsmalloc.c:642:16: warning: Local variable 'obj_allocated' shadows outer function [shadowFunction]
    unsigned long obj_allocated, obj_used, pages_used, freeable;
                  ^
   mm/zsmalloc.c:940:13: note: Shadowed declaration
   static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
               ^
   mm/zsmalloc.c:642:16: note: Shadow variable
    unsigned long obj_allocated, obj_used, pages_used, freeable;
                  ^

vim +/handle +1619 mm/zsmalloc.c

61989a80fb3ac9 drivers/staging/zsmalloc/zsmalloc-main.c Nitin Gupta 2012-01-09  1618  
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10 @1619  static void obj_free(int class_size, unsigned long obj, unsigned long *handle)
61989a80fb3ac9 drivers/staging/zsmalloc/zsmalloc-main.c Nitin Gupta 2012-01-09  1620  {
61989a80fb3ac9 drivers/staging/zsmalloc/zsmalloc-main.c Nitin Gupta 2012-01-09  1621  	struct link_free *link;
3783689a1aa82e mm/zsmalloc.c                            Minchan Kim 2016-07-26  1622  	struct zspage *zspage;
3783689a1aa82e mm/zsmalloc.c                            Minchan Kim 2016-07-26  1623  	struct page *f_page;
bfd093f5e7f09c mm/zsmalloc.c                            Minchan Kim 2016-07-26  1624  	unsigned long f_offset;
bfd093f5e7f09c mm/zsmalloc.c                            Minchan Kim 2016-07-26  1625  	unsigned int f_objidx;
af4ee5e977acb1 mm/zsmalloc.c                            Minchan Kim 2014-12-12  1626  	void *vaddr;
61989a80fb3ac9 drivers/staging/zsmalloc/zsmalloc-main.c Nitin Gupta 2012-01-09  1627  
2e40e163a25af3 mm/zsmalloc.c                            Minchan Kim 2015-04-15  1628  	obj_to_location(obj, &f_page, &f_objidx);
0a5f079b810765 mm/zsmalloc.c                            Minchan Kim 2022-01-21  1629  	f_offset = (class_size * f_objidx) & ~PAGE_MASK;
3783689a1aa82e mm/zsmalloc.c                            Minchan Kim 2016-07-26  1630  	zspage = get_zspage(f_page);
61989a80fb3ac9 drivers/staging/zsmalloc/zsmalloc-main.c Nitin Gupta 2012-01-09  1631  
c78062612fb525 mm/zsmalloc.c                            Minchan Kim 2015-04-15  1632  	vaddr = kmap_atomic(f_page);
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1633  	link = (struct link_free *)(vaddr + f_offset);
61989a80fb3ac9 drivers/staging/zsmalloc/zsmalloc-main.c Nitin Gupta 2012-01-09  1634  
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1635  	if (handle) {
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1636  #ifdef CONFIG_ZPOOL
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1637  		/* Stores the (deferred) handle in the object's header */
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1638  		*handle |= OBJ_DEFERRED_HANDLE_TAG;
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1639  		*handle &= ~OBJ_ALLOCATED_TAG;
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1640  
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1641  		if (likely(!ZsHugePage(zspage)))
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1642  			link->deferred_handle = *handle;
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1643  		else
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1644  			f_page->index = *handle;
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1645  #endif
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1646  	} else {
61989a80fb3ac9 drivers/staging/zsmalloc/zsmalloc-main.c Nitin Gupta 2012-01-09  1647  		/* Insert this object in containing zspage's freelist */
a41ec880aa7bee mm/zsmalloc.c                            Minchan Kim 2022-01-21  1648  		if (likely(!ZsHugePage(zspage)))
3b1d9ca65a80ce mm/zsmalloc.c                            Minchan Kim 2016-07-26  1649  			link->next = get_freeobj(zspage) << OBJ_TAG_BITS;
a41ec880aa7bee mm/zsmalloc.c                            Minchan Kim 2022-01-21  1650  		else
a41ec880aa7bee mm/zsmalloc.c                            Minchan Kim 2022-01-21  1651  			f_page->index = 0;
bfd093f5e7f09c mm/zsmalloc.c                            Minchan Kim 2016-07-26  1652  		set_freeobj(zspage, f_objidx);
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1653  	}
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1654  
278425ca22837b mm/zsmalloc.c                            Nhat Pham   2023-01-10  1655  	kunmap_atomic(vaddr);
3783689a1aa82e mm/zsmalloc.c                            Minchan Kim 2016-07-26  1656  	mod_zspage_inuse(zspage, -1);
c78062612fb525 mm/zsmalloc.c                            Minchan Kim 2015-04-15  1657  }
c78062612fb525 mm/zsmalloc.c                            Minchan Kim 2015-04-15  1658  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
