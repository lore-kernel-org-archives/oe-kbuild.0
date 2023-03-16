Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07142366
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Mar 2023 10:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678962870; x=1710498870;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2+CFUFNYjfvQ+MU1UISLfVUOk/wHmo+DqaYezsAbDAc=;
  b=mUqbZTnan0sAmgSyXRdSLHNip0jFP6UlkECQk1iKpANo900MkVqFJYZ9
   B5WYGfZKQhdQbtShS1lntiRry/VCUIx7L1AG+TodDCxp3YN+KyR/rzyP2
   UJ9+ehgUZ9vBt91QxBt1aY1BjSjg3+jd7dL83Onx/5/puUXJFhX2yQvwn
   DGgtZb64c/OJ5VR3SkwiU667fxzdffQQJxtszbLVinK3g6CATISiSSwA2
   ml9PtKgjRfLNGe4FsGBp1xsmcgMpZ1ClxCJKyBs+h/wSXqD6p46FVwrnz
   uFwsUFs37uWNTZ5cTzhM07sUZWUHoXnwLyt+K0EhI8GWSV89lluwXabLL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="321787252"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="321787252"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2023 03:34:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="629825014"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="629825014"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 16 Mar 2023 03:34:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pckwF-0008TK-2Z;
	Thu, 16 Mar 2023 10:34:27 +0000
Date: Thu, 16 Mar 2023 18:34:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3570/3780] io_uring/kbuf.c:221
 __io_remove_buffers() warn: variable dereferenced before check
 'bl->buf_ring' (see line 219)
Message-ID: <202303161837.uG7iAfji-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6f72958a49f68553f2b6ff713e8c8e51a34c1e1e
commit: 5d04a480457850f58b9d3ff87b7e766674eac4c4 [3570/3780] io_uring: add support for user mapped provided buffer ring
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230316/202303161837.uG7iAfji-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303161837.uG7iAfji-lkp@intel.com/

smatch warnings:
io_uring/kbuf.c:221 __io_remove_buffers() warn: variable dereferenced before check 'bl->buf_ring' (see line 219)

vim +221 io_uring/kbuf.c

3b77495a97239f Jens Axboe 2022-06-13  208  
3b77495a97239f Jens Axboe 2022-06-13  209  static int __io_remove_buffers(struct io_ring_ctx *ctx,
3b77495a97239f Jens Axboe 2022-06-13  210  			       struct io_buffer_list *bl, unsigned nbufs)
3b77495a97239f Jens Axboe 2022-06-13  211  {
3b77495a97239f Jens Axboe 2022-06-13  212  	unsigned i = 0;
3b77495a97239f Jens Axboe 2022-06-13  213  
3b77495a97239f Jens Axboe 2022-06-13  214  	/* shouldn't happen */
3b77495a97239f Jens Axboe 2022-06-13  215  	if (!nbufs)
3b77495a97239f Jens Axboe 2022-06-13  216  		return 0;
3b77495a97239f Jens Axboe 2022-06-13  217  
5d04a480457850 Jens Axboe 2023-03-14  218  	if (bl->is_mapped) {
5d04a480457850 Jens Axboe 2023-03-14 @219  		i = bl->buf_ring->tail - bl->head;
5d04a480457850 Jens Axboe 2023-03-14  220  		if (bl->is_mmap) {
5d04a480457850 Jens Axboe 2023-03-14 @221  			if (bl->buf_ring) {
5d04a480457850 Jens Axboe 2023-03-14  222  				struct page *page;
5d04a480457850 Jens Axboe 2023-03-14  223  
5d04a480457850 Jens Axboe 2023-03-14  224  				page = virt_to_head_page(bl->buf_ring);
5d04a480457850 Jens Axboe 2023-03-14  225  				if (put_page_testzero(page))
5d04a480457850 Jens Axboe 2023-03-14  226  					free_compound_page(page);
5d04a480457850 Jens Axboe 2023-03-14  227  				bl->buf_ring = NULL;
5d04a480457850 Jens Axboe 2023-03-14  228  			}
5d04a480457850 Jens Axboe 2023-03-14  229  			bl->is_mmap = 0;
5d04a480457850 Jens Axboe 2023-03-14  230  		} else if (bl->buf_nr_pages) {
3b77495a97239f Jens Axboe 2022-06-13  231  			int j;
3b77495a97239f Jens Axboe 2022-06-13  232  
3b77495a97239f Jens Axboe 2022-06-13  233  			for (j = 0; j < bl->buf_nr_pages; j++)
3b77495a97239f Jens Axboe 2022-06-13  234  				unpin_user_page(bl->buf_pages[j]);
3b77495a97239f Jens Axboe 2022-06-13  235  			kvfree(bl->buf_pages);
3b77495a97239f Jens Axboe 2022-06-13  236  			bl->buf_pages = NULL;
3b77495a97239f Jens Axboe 2022-06-13  237  			bl->buf_nr_pages = 0;
5d04a480457850 Jens Axboe 2023-03-14  238  		}
3b77495a97239f Jens Axboe 2022-06-13  239  		/* make sure it's seen as empty */
3b77495a97239f Jens Axboe 2022-06-13  240  		INIT_LIST_HEAD(&bl->buf_list);
fe19437061eda5 Jens Axboe 2023-03-14  241  		bl->is_mapped = 0;
3b77495a97239f Jens Axboe 2022-06-13  242  		return i;
3b77495a97239f Jens Axboe 2022-06-13  243  	}
3b77495a97239f Jens Axboe 2022-06-13  244  
3b77495a97239f Jens Axboe 2022-06-13  245  	/* the head kbuf is the list itself */
3b77495a97239f Jens Axboe 2022-06-13  246  	while (!list_empty(&bl->buf_list)) {
3b77495a97239f Jens Axboe 2022-06-13  247  		struct io_buffer *nxt;
3b77495a97239f Jens Axboe 2022-06-13  248  
3b77495a97239f Jens Axboe 2022-06-13  249  		nxt = list_first_entry(&bl->buf_list, struct io_buffer, list);
3b77495a97239f Jens Axboe 2022-06-13  250  		list_del(&nxt->list);
3b77495a97239f Jens Axboe 2022-06-13  251  		if (++i == nbufs)
3b77495a97239f Jens Axboe 2022-06-13  252  			return i;
3b77495a97239f Jens Axboe 2022-06-13  253  		cond_resched();
3b77495a97239f Jens Axboe 2022-06-13  254  	}
3b77495a97239f Jens Axboe 2022-06-13  255  	i++;
3b77495a97239f Jens Axboe 2022-06-13  256  
3b77495a97239f Jens Axboe 2022-06-13  257  	return i;
3b77495a97239f Jens Axboe 2022-06-13  258  }
3b77495a97239f Jens Axboe 2022-06-13  259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
