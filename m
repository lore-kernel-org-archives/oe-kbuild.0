Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04F95667
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Dec 2023 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1dbE1n8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702808167; x=1734344167;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NeJCI9Rfv/bkjC3WNZff/hEojT6DDZOKqhv27+VbM+Q=;
  b=f1dbE1n80+SGnTKHFvayNqN1PJ0Uz6EelzqlaWMuDjJqrPJ8Eo04v6Uy
   iEzCerGTT7i6b+Fbwougp2SRgKFfi2M5Y3JuRk+0j+SrfTOGs/U4f9sxS
   A+GWc4FEqZFfYHeFyG10SWHX+VPnmVHLD0RjBrSiT4WGWMirQX1M5IDNI
   gMKCOCT+qKTgY0/HVLE141YSPWYG8WwXRqPX4Qu53SgFsAqg4f/Mo2Mvl
   eJuDaEaxsFPvgMOfyihBFCnROfZm3IhB9NE8sQtYLcvcUhMO5OCvmmo4d
   j0lNwskCK6JnvOLkni9457giYWeHAfCyC1SV+ObacxjovNL5DC7oZkydX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="374908923"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="374908923"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 02:16:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="751439473"
X-IronPort-AV: E=Sophos;i="6.04,283,1695711600"; 
   d="scan'208";a="751439473"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Dec 2023 02:16:04 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEoBm-0002w5-2K;
	Sun, 17 Dec 2023 10:16:02 +0000
Date: Sun, 17 Dec 2023 18:15:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 705/8213] fs/ceph/addr.c:998:(.text+0x4b0e):
 relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312171804.TSRgJYwK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "csky general problem: relocation truncated to fit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Chengming Zhou <zhouchengming@bytedance.com>
CC: Vlastimil Babka <vbabka@suse.cz>
CC: Hyeonggon Yoo <42.hyeyoo@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   17cb8a20bde66a520a2ca7aad1063e1ce7382240
commit: 24c6a097b5a270e05c6e99a99da66b91be81fd7d [705/8213] slub: Reflow ___slab_alloc()
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: csky-randconfig-s032-20211008 (https://download.01.org/0day-ci/archive/20231217/202312171804.TSRgJYwK-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312171804.TSRgJYwK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312171804.TSRgJYwK-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/fuse/inode.o: defined in discarded section `.exit.text' of fs/fuse/inode.o
   `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
   `.exit.text' referenced in section `__jump_table' of fs/ceph/super.o: defined in discarded section `.exit.text' of fs/ceph/super.o
   fs/ceph/addr.o: in function `ceph_writepages_start':
>> fs/ceph/addr.c:998:(.text+0x4b0e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/ceph/addr.c:998:(.text+0x4b1a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/ceph/addr.c:998:(.text+0x4b22): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/ceph/addr.c:998:(.text+0x4b26): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/ceph/addr.c:1373:(.text+0x4b36): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/ceph/addr.c:1373:(.text+0x4b44): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/ceph/addr.c:1373:(.text+0x4b48): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/ceph/addr.c:1373:(.text+0x4b4c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/ceph/addr.c:1045:(.text+0x4b8c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/ceph/addr.c:1223:(.text+0x4c48): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   fs/ceph/addr.o: in function `ceph_writepages_start':
   include/linux/mm.h:1315:(.text+0x4c84): additional relocation overflows omitted from the output


vim +998 fs/ceph/addr.c

1d3576fd10f0d7a Sage Weil               2009-10-06   935  
1d3576fd10f0d7a Sage Weil               2009-10-06   936  /*
1d3576fd10f0d7a Sage Weil               2009-10-06   937   * initiate async writeback
1d3576fd10f0d7a Sage Weil               2009-10-06   938   */
1d3576fd10f0d7a Sage Weil               2009-10-06   939  static int ceph_writepages_start(struct address_space *mapping,
1d3576fd10f0d7a Sage Weil               2009-10-06   940  				 struct writeback_control *wbc)
1d3576fd10f0d7a Sage Weil               2009-10-06   941  {
1d3576fd10f0d7a Sage Weil               2009-10-06   942  	struct inode *inode = mapping->host;
1d3576fd10f0d7a Sage Weil               2009-10-06   943  	struct ceph_inode_info *ci = ceph_inode(inode);
5995d90d2d19f33 Xiubo Li                2023-06-12   944  	struct ceph_fs_client *fsc = ceph_inode_to_fs_client(inode);
38d46409c4639a1 Xiubo Li                2023-06-12   945  	struct ceph_client *cl = fsc->client;
fc2744aa12da718 Yan, Zheng              2013-05-31   946  	struct ceph_vino vino = ceph_vino(inode);
2a2d927e35dd8dc Yan, Zheng              2017-09-01   947  	pgoff_t index, start_index, end = -1;
80e755fedebc8de Sage Weil               2010-03-31   948  	struct ceph_snap_context *snapc = NULL, *last_snapc = NULL, *pgsnapc;
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04   949) 	struct folio_batch fbatch;
1d3576fd10f0d7a Sage Weil               2009-10-06   950  	int rc = 0;
93407472a21b82f Fabian Frederick        2017-02-27   951  	unsigned int wsize = i_blocksize(inode);
1d3576fd10f0d7a Sage Weil               2009-10-06   952  	struct ceph_osd_request *req = NULL;
1f934b00e907527 Yan, Zheng              2017-08-30   953  	struct ceph_writeback_ctl ceph_wbc;
590e9d9861f5f21 Yan, Zheng              2017-09-03   954  	bool should_loop, range_whole = false;
af9cc401ce7452f Yan, Zheng              2018-03-04   955  	bool done = false;
1702e79734104d7 Jeff Layton             2021-12-07   956  	bool caching = ceph_is_cache_enabled(inode);
7d41870d65db028 Xiubo Li                2023-03-08   957  	xa_mark_t tag;
1d3576fd10f0d7a Sage Weil               2009-10-06   958  
503d4fa6ee28e8d NeilBrown               2022-03-22   959  	if (wbc->sync_mode == WB_SYNC_NONE &&
503d4fa6ee28e8d NeilBrown               2022-03-22   960  	    fsc->write_congested)
503d4fa6ee28e8d NeilBrown               2022-03-22   961  		return 0;
503d4fa6ee28e8d NeilBrown               2022-03-22   962  
38d46409c4639a1 Xiubo Li                2023-06-12   963  	doutc(cl, "%llx.%llx (mode=%s)\n", ceph_vinop(inode),
1d3576fd10f0d7a Sage Weil               2009-10-06   964  	      wbc->sync_mode == WB_SYNC_NONE ? "NONE" :
1d3576fd10f0d7a Sage Weil               2009-10-06   965  	      (wbc->sync_mode == WB_SYNC_ALL ? "ALL" : "HOLD"));
1d3576fd10f0d7a Sage Weil               2009-10-06   966  
5d6451b1489ad17 Jeff Layton             2021-08-31   967  	if (ceph_inode_is_shutdown(inode)) {
6c93df5db628e71 Yan, Zheng              2016-04-15   968  		if (ci->i_wrbuffer_ref > 0) {
38d46409c4639a1 Xiubo Li                2023-06-12   969  			pr_warn_ratelimited_client(cl,
38d46409c4639a1 Xiubo Li                2023-06-12   970  				"%llx.%llx %lld forced umount\n",
38d46409c4639a1 Xiubo Li                2023-06-12   971  				ceph_vinop(inode), ceph_ino(inode));
6c93df5db628e71 Yan, Zheng              2016-04-15   972  		}
a341d4df87487ae Yan, Zheng              2015-07-01   973  		mapping_set_error(mapping, -EIO);
1d3576fd10f0d7a Sage Weil               2009-10-06   974  		return -EIO; /* we're in a forced umount, don't write! */
1d3576fd10f0d7a Sage Weil               2009-10-06   975  	}
95cca2b44e54b00 Yan, Zheng              2017-07-11   976  	if (fsc->mount_options->wsize < wsize)
3d14c5d2b6e15c2 Yehuda Sadeh            2010-04-06   977  		wsize = fsc->mount_options->wsize;
1d3576fd10f0d7a Sage Weil               2009-10-06   978  
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04   979) 	folio_batch_init(&fbatch);
1d3576fd10f0d7a Sage Weil               2009-10-06   980  
590e9d9861f5f21 Yan, Zheng              2017-09-03   981  	start_index = wbc->range_cyclic ? mapping->writeback_index : 0;
590e9d9861f5f21 Yan, Zheng              2017-09-03   982  	index = start_index;
1d3576fd10f0d7a Sage Weil               2009-10-06   983  
7d41870d65db028 Xiubo Li                2023-03-08   984  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages) {
7d41870d65db028 Xiubo Li                2023-03-08   985  		tag = PAGECACHE_TAG_TOWRITE;
7d41870d65db028 Xiubo Li                2023-03-08   986  	} else {
7d41870d65db028 Xiubo Li                2023-03-08   987  		tag = PAGECACHE_TAG_DIRTY;
7d41870d65db028 Xiubo Li                2023-03-08   988  	}
1d3576fd10f0d7a Sage Weil               2009-10-06   989  retry:
1d3576fd10f0d7a Sage Weil               2009-10-06   990  	/* find oldest snap context with dirty data */
05455e1177f7684 Yan, Zheng              2017-09-02   991  	snapc = get_oldest_context(inode, &ceph_wbc, NULL);
1d3576fd10f0d7a Sage Weil               2009-10-06   992  	if (!snapc) {
1d3576fd10f0d7a Sage Weil               2009-10-06   993  		/* hmm, why does writepages get called when there
1d3576fd10f0d7a Sage Weil               2009-10-06   994  		   is no dirty data? */
38d46409c4639a1 Xiubo Li                2023-06-12   995  		doutc(cl, " no snap context with dirty data?\n");
1d3576fd10f0d7a Sage Weil               2009-10-06   996  		goto out;
1d3576fd10f0d7a Sage Weil               2009-10-06   997  	}
38d46409c4639a1 Xiubo Li                2023-06-12  @998  	doutc(cl, " oldest snapc is %p seq %lld (%d snaps)\n", snapc,
38d46409c4639a1 Xiubo Li                2023-06-12   999  	      snapc->seq, snapc->num_snaps);
fc2744aa12da718 Yan, Zheng              2013-05-31  1000  
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1001  	should_loop = false;
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1002  	if (ceph_wbc.head_snapc && snapc != last_snapc) {
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1003  		/* where to start/end? */
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1004  		if (wbc->range_cyclic) {
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1005  			index = start_index;
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1006  			end = -1;
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1007  			if (index > 0)
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1008  				should_loop = true;
38d46409c4639a1 Xiubo Li                2023-06-12  1009  			doutc(cl, " cyclic, start at %lu\n", index);
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1010  		} else {
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1011  			index = wbc->range_start >> PAGE_SHIFT;
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1012  			end = wbc->range_end >> PAGE_SHIFT;
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1013  			if (wbc->range_start == 0 && wbc->range_end == LLONG_MAX)
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1014  				range_whole = true;
38d46409c4639a1 Xiubo Li                2023-06-12  1015  			doutc(cl, " not cyclic, %lu to %lu\n", index, end);
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1016  		}
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1017  	} else if (!ceph_wbc.head_snapc) {
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1018  		/* Do not respect wbc->range_{start,end}. Dirty pages
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1019  		 * in that range can be associated with newer snapc.
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1020  		 * They are not writeable until we write all dirty pages
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1021  		 * associated with 'snapc' get written */
1582af2eaaf17cb Yan, Zheng              2018-03-06  1022  		if (index > 0)
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1023  			should_loop = true;
38d46409c4639a1 Xiubo Li                2023-06-12  1024  		doutc(cl, " non-head snapc, range whole\n");
1d3576fd10f0d7a Sage Weil               2009-10-06  1025  	}
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1026  
7d41870d65db028 Xiubo Li                2023-03-08  1027  	if (wbc->sync_mode == WB_SYNC_ALL || wbc->tagged_writepages)
7d41870d65db028 Xiubo Li                2023-03-08  1028  		tag_pages_for_writeback(mapping, index, end);
7d41870d65db028 Xiubo Li                2023-03-08  1029  
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1030  	ceph_put_snap_context(last_snapc);
1d3576fd10f0d7a Sage Weil               2009-10-06  1031  	last_snapc = snapc;
1d3576fd10f0d7a Sage Weil               2009-10-06  1032  
af9cc401ce7452f Yan, Zheng              2018-03-04  1033  	while (!done && index <= end) {
5b64640cf65be4a Yan, Zheng              2016-01-07  1034  		int num_ops = 0, op_idx;
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1035) 		unsigned i, nr_folios, max_pages, locked_pages = 0;
5b64640cf65be4a Yan, Zheng              2016-01-07  1036  		struct page **pages = NULL, **data_pages;
1d3576fd10f0d7a Sage Weil               2009-10-06  1037  		struct page *page;
0e5ecac71683665 Yan, Zheng              2017-08-31  1038  		pgoff_t strip_unit_end = 0;
5b64640cf65be4a Yan, Zheng              2016-01-07  1039  		u64 offset = 0, len = 0;
a0102bda5bc0991 Jeff Layton             2020-07-30  1040  		bool from_pool = false;
1d3576fd10f0d7a Sage Weil               2009-10-06  1041  
0e5ecac71683665 Yan, Zheng              2017-08-31  1042  		max_pages = wsize >> PAGE_SHIFT;
1d3576fd10f0d7a Sage Weil               2009-10-06  1043  
1d3576fd10f0d7a Sage Weil               2009-10-06  1044  get_more_pages:
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1045) 		nr_folios = filemap_get_folios_tag(mapping, &index,
7d41870d65db028 Xiubo Li                2023-03-08  1046  						   end, tag, &fbatch);
38d46409c4639a1 Xiubo Li                2023-06-12  1047  		doutc(cl, "pagevec_lookup_range_tag got %d\n", nr_folios);
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1048) 		if (!nr_folios && !locked_pages)
1d3576fd10f0d7a Sage Weil               2009-10-06  1049  			break;
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1050) 		for (i = 0; i < nr_folios && locked_pages < max_pages; i++) {
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1051) 			page = &fbatch.folios[i]->page;
38d46409c4639a1 Xiubo Li                2023-06-12  1052  			doutc(cl, "? %p idx %lu\n", page, page->index);
1d3576fd10f0d7a Sage Weil               2009-10-06  1053  			if (locked_pages == 0)
1d3576fd10f0d7a Sage Weil               2009-10-06  1054  				lock_page(page);  /* first page */
1d3576fd10f0d7a Sage Weil               2009-10-06  1055  			else if (!trylock_page(page))
1d3576fd10f0d7a Sage Weil               2009-10-06  1056  				break;
1d3576fd10f0d7a Sage Weil               2009-10-06  1057  
1d3576fd10f0d7a Sage Weil               2009-10-06  1058  			/* only dirty pages, or our accounting breaks */
1d3576fd10f0d7a Sage Weil               2009-10-06  1059  			if (unlikely(!PageDirty(page)) ||
1d3576fd10f0d7a Sage Weil               2009-10-06  1060  			    unlikely(page->mapping != mapping)) {
38d46409c4639a1 Xiubo Li                2023-06-12  1061  				doutc(cl, "!dirty or !mapping %p\n", page);
1d3576fd10f0d7a Sage Weil               2009-10-06  1062  				unlock_page(page);
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1063  				continue;
1d3576fd10f0d7a Sage Weil               2009-10-06  1064  			}
af9cc401ce7452f Yan, Zheng              2018-03-04  1065  			/* only if matching snap context */
af9cc401ce7452f Yan, Zheng              2018-03-04  1066  			pgsnapc = page_snap_context(page);
af9cc401ce7452f Yan, Zheng              2018-03-04  1067  			if (pgsnapc != snapc) {
38d46409c4639a1 Xiubo Li                2023-06-12  1068  				doutc(cl, "page snapc %p %lld != oldest %p %lld\n",
af9cc401ce7452f Yan, Zheng              2018-03-04  1069  				      pgsnapc, pgsnapc->seq, snapc, snapc->seq);
1582af2eaaf17cb Yan, Zheng              2018-03-06  1070  				if (!should_loop &&
1582af2eaaf17cb Yan, Zheng              2018-03-06  1071  				    !ceph_wbc.head_snapc &&
1582af2eaaf17cb Yan, Zheng              2018-03-06  1072  				    wbc->sync_mode != WB_SYNC_NONE)
1582af2eaaf17cb Yan, Zheng              2018-03-06  1073  					should_loop = true;
1d3576fd10f0d7a Sage Weil               2009-10-06  1074  				unlock_page(page);
af9cc401ce7452f Yan, Zheng              2018-03-04  1075  				continue;
1d3576fd10f0d7a Sage Weil               2009-10-06  1076  			}
1f934b00e907527 Yan, Zheng              2017-08-30  1077  			if (page_offset(page) >= ceph_wbc.i_size) {
a628304ebe6ab02 Matthew Wilcox (Oracle  2022-02-09  1078) 				struct folio *folio = page_folio(page);
a628304ebe6ab02 Matthew Wilcox (Oracle  2022-02-09  1079) 
38d46409c4639a1 Xiubo Li                2023-06-12  1080  				doutc(cl, "folio at %lu beyond eof %llu\n",
a628304ebe6ab02 Matthew Wilcox (Oracle  2022-02-09  1081) 				      folio->index, ceph_wbc.i_size);
c95f1c5f436badb Erqi Chen               2019-07-24  1082  				if ((ceph_wbc.size_stable ||
a628304ebe6ab02 Matthew Wilcox (Oracle  2022-02-09  1083) 				    folio_pos(folio) >= i_size_read(inode)) &&
a628304ebe6ab02 Matthew Wilcox (Oracle  2022-02-09  1084) 				    folio_clear_dirty_for_io(folio))
a628304ebe6ab02 Matthew Wilcox (Oracle  2022-02-09  1085) 					folio_invalidate(folio, 0,
a628304ebe6ab02 Matthew Wilcox (Oracle  2022-02-09  1086) 							folio_size(folio));
a628304ebe6ab02 Matthew Wilcox (Oracle  2022-02-09  1087) 				folio_unlock(folio);
af9cc401ce7452f Yan, Zheng              2018-03-04  1088  				continue;
af9cc401ce7452f Yan, Zheng              2018-03-04  1089  			}
af9cc401ce7452f Yan, Zheng              2018-03-04  1090  			if (strip_unit_end && (page->index > strip_unit_end)) {
38d46409c4639a1 Xiubo Li                2023-06-12  1091  				doutc(cl, "end of strip unit %p\n", page);
1d3576fd10f0d7a Sage Weil               2009-10-06  1092  				unlock_page(page);
1d3576fd10f0d7a Sage Weil               2009-10-06  1093  				break;
1d3576fd10f0d7a Sage Weil               2009-10-06  1094  			}
1702e79734104d7 Jeff Layton             2021-12-07  1095  			if (PageWriteback(page) || PageFsCache(page)) {
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1096  				if (wbc->sync_mode == WB_SYNC_NONE) {
38d46409c4639a1 Xiubo Li                2023-06-12  1097  					doutc(cl, "%p under writeback\n", page);
1d3576fd10f0d7a Sage Weil               2009-10-06  1098  					unlock_page(page);
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1099  					continue;
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1100  				}
38d46409c4639a1 Xiubo Li                2023-06-12  1101  				doutc(cl, "waiting on writeback %p\n", page);
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1102  				wait_on_page_writeback(page);
1702e79734104d7 Jeff Layton             2021-12-07  1103  				wait_on_page_fscache(page);
1d3576fd10f0d7a Sage Weil               2009-10-06  1104  			}
1d3576fd10f0d7a Sage Weil               2009-10-06  1105  
1d3576fd10f0d7a Sage Weil               2009-10-06  1106  			if (!clear_page_dirty_for_io(page)) {
38d46409c4639a1 Xiubo Li                2023-06-12  1107  				doutc(cl, "%p !clear_page_dirty_for_io\n", page);
1d3576fd10f0d7a Sage Weil               2009-10-06  1108  				unlock_page(page);
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1109  				continue;
1d3576fd10f0d7a Sage Weil               2009-10-06  1110  			}
1d3576fd10f0d7a Sage Weil               2009-10-06  1111  
e5975c7c8eb6aea Alex Elder              2013-03-14  1112  			/*
e5975c7c8eb6aea Alex Elder              2013-03-14  1113  			 * We have something to write.  If this is
e5975c7c8eb6aea Alex Elder              2013-03-14  1114  			 * the first locked page this time through,
5b64640cf65be4a Yan, Zheng              2016-01-07  1115  			 * calculate max possinle write size and
5b64640cf65be4a Yan, Zheng              2016-01-07  1116  			 * allocate a page array
e5975c7c8eb6aea Alex Elder              2013-03-14  1117  			 */
1d3576fd10f0d7a Sage Weil               2009-10-06  1118  			if (locked_pages == 0) {
5b64640cf65be4a Yan, Zheng              2016-01-07  1119  				u64 objnum;
5b64640cf65be4a Yan, Zheng              2016-01-07  1120  				u64 objoff;
dccbf08005df800 Ilya Dryomov            2018-02-17  1121  				u32 xlen;
5b64640cf65be4a Yan, Zheng              2016-01-07  1122  
1d3576fd10f0d7a Sage Weil               2009-10-06  1123  				/* prepare async write request */
6285bc231277419 Alex Elder              2012-10-02  1124  				offset = (u64)page_offset(page);
dccbf08005df800 Ilya Dryomov            2018-02-17  1125  				ceph_calc_file_object_mapping(&ci->i_layout,
dccbf08005df800 Ilya Dryomov            2018-02-17  1126  							      offset, wsize,
5b64640cf65be4a Yan, Zheng              2016-01-07  1127  							      &objnum, &objoff,
dccbf08005df800 Ilya Dryomov            2018-02-17  1128  							      &xlen);
dccbf08005df800 Ilya Dryomov            2018-02-17  1129  				len = xlen;
8c71897be2ddfd8 Henry C Chang           2011-05-03  1130  
3fb99d483e614bc Yanhu Cao               2017-07-21  1131  				num_ops = 1;
5b64640cf65be4a Yan, Zheng              2016-01-07  1132  				strip_unit_end = page->index +
09cbfeaf1a5a67b Kirill A. Shutemov      2016-04-01  1133  					((len - 1) >> PAGE_SHIFT);
88486957f9fbf52 Alex Elder              2013-03-14  1134  
5b64640cf65be4a Yan, Zheng              2016-01-07  1135  				BUG_ON(pages);
88486957f9fbf52 Alex Elder              2013-03-14  1136  				max_pages = calc_pages_for(0, (u64)len);
6da2ec56059c3c7 Kees Cook               2018-06-12  1137  				pages = kmalloc_array(max_pages,
6da2ec56059c3c7 Kees Cook               2018-06-12  1138  						      sizeof(*pages),
fc2744aa12da718 Yan, Zheng              2013-05-31  1139  						      GFP_NOFS);
88486957f9fbf52 Alex Elder              2013-03-14  1140  				if (!pages) {
a0102bda5bc0991 Jeff Layton             2020-07-30  1141  					from_pool = true;
a0102bda5bc0991 Jeff Layton             2020-07-30  1142  					pages = mempool_alloc(ceph_wb_pagevec_pool, GFP_NOFS);
e5975c7c8eb6aea Alex Elder              2013-03-14  1143  					BUG_ON(!pages);
88486957f9fbf52 Alex Elder              2013-03-14  1144  				}
5b64640cf65be4a Yan, Zheng              2016-01-07  1145  
5b64640cf65be4a Yan, Zheng              2016-01-07  1146  				len = 0;
5b64640cf65be4a Yan, Zheng              2016-01-07  1147  			} else if (page->index !=
09cbfeaf1a5a67b Kirill A. Shutemov      2016-04-01  1148  				   (offset + len) >> PAGE_SHIFT) {
a0102bda5bc0991 Jeff Layton             2020-07-30  1149  				if (num_ops >= (from_pool ?  CEPH_OSD_SLAB_OPS :
5b64640cf65be4a Yan, Zheng              2016-01-07  1150  							     CEPH_OSD_MAX_OPS)) {
5b64640cf65be4a Yan, Zheng              2016-01-07  1151  					redirty_page_for_writepage(wbc, page);
5b64640cf65be4a Yan, Zheng              2016-01-07  1152  					unlock_page(page);
5b64640cf65be4a Yan, Zheng              2016-01-07  1153  					break;
5b64640cf65be4a Yan, Zheng              2016-01-07  1154  				}
5b64640cf65be4a Yan, Zheng              2016-01-07  1155  
5b64640cf65be4a Yan, Zheng              2016-01-07  1156  				num_ops++;
5b64640cf65be4a Yan, Zheng              2016-01-07  1157  				offset = (u64)page_offset(page);
5b64640cf65be4a Yan, Zheng              2016-01-07  1158  				len = 0;
1d3576fd10f0d7a Sage Weil               2009-10-06  1159  			}
1d3576fd10f0d7a Sage Weil               2009-10-06  1160  
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1161) 			/* note position of first page in fbatch */
38d46409c4639a1 Xiubo Li                2023-06-12  1162  			doutc(cl, "%llx.%llx will write page %p idx %lu\n",
38d46409c4639a1 Xiubo Li                2023-06-12  1163  			      ceph_vinop(inode), page, page->index);
2baba25019ec564 Yehuda Sadeh            2009-12-18  1164  
5b64640cf65be4a Yan, Zheng              2016-01-07  1165  			if (atomic_long_inc_return(&fsc->writeback_count) >
5b64640cf65be4a Yan, Zheng              2016-01-07  1166  			    CONGESTION_ON_THRESH(
503d4fa6ee28e8d NeilBrown               2022-03-22  1167  				    fsc->mount_options->congestion_kb))
503d4fa6ee28e8d NeilBrown               2022-03-22  1168  				fsc->write_congested = true;
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1169  
d55207717ded95c Jeff Layton             2022-08-25  1170  			if (IS_ENCRYPTED(inode)) {
d55207717ded95c Jeff Layton             2022-08-25  1171  				pages[locked_pages] =
d55207717ded95c Jeff Layton             2022-08-25  1172  					fscrypt_encrypt_pagecache_blocks(page,
d55207717ded95c Jeff Layton             2022-08-25  1173  						PAGE_SIZE, 0,
d55207717ded95c Jeff Layton             2022-08-25  1174  						locked_pages ? GFP_NOWAIT : GFP_NOFS);
d55207717ded95c Jeff Layton             2022-08-25  1175  				if (IS_ERR(pages[locked_pages])) {
d55207717ded95c Jeff Layton             2022-08-25  1176  					if (PTR_ERR(pages[locked_pages]) == -EINVAL)
38d46409c4639a1 Xiubo Li                2023-06-12  1177  						pr_err_client(cl,
38d46409c4639a1 Xiubo Li                2023-06-12  1178  							"inode->i_blkbits=%hhu\n",
38d46409c4639a1 Xiubo Li                2023-06-12  1179  							inode->i_blkbits);
d55207717ded95c Jeff Layton             2022-08-25  1180  					/* better not fail on first page! */
d55207717ded95c Jeff Layton             2022-08-25  1181  					BUG_ON(locked_pages == 0);
d55207717ded95c Jeff Layton             2022-08-25  1182  					pages[locked_pages] = NULL;
d55207717ded95c Jeff Layton             2022-08-25  1183  					redirty_page_for_writepage(wbc, page);
d55207717ded95c Jeff Layton             2022-08-25  1184  					unlock_page(page);
d55207717ded95c Jeff Layton             2022-08-25  1185  					break;
d55207717ded95c Jeff Layton             2022-08-25  1186  				}
d55207717ded95c Jeff Layton             2022-08-25  1187  				++locked_pages;
d55207717ded95c Jeff Layton             2022-08-25  1188  			} else {
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1189  				pages[locked_pages++] = page;
d55207717ded95c Jeff Layton             2022-08-25  1190  			}
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1191  
d55207717ded95c Jeff Layton             2022-08-25  1192  			fbatch.folios[i] = NULL;
8ff2d290c8ce77c Jeff Layton             2021-04-05  1193  			len += thp_size(page);
1d3576fd10f0d7a Sage Weil               2009-10-06  1194  		}
1d3576fd10f0d7a Sage Weil               2009-10-06  1195  
1d3576fd10f0d7a Sage Weil               2009-10-06  1196  		/* did we get anything? */
1d3576fd10f0d7a Sage Weil               2009-10-06  1197  		if (!locked_pages)
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1198) 			goto release_folios;
1d3576fd10f0d7a Sage Weil               2009-10-06  1199  		if (i) {
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1200  			unsigned j, n = 0;
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1201) 			/* shift unused page to beginning of fbatch */
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1202) 			for (j = 0; j < nr_folios; j++) {
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1203) 				if (!fbatch.folios[j])
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1204  					continue;
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1205  				if (n < j)
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1206) 					fbatch.folios[n] = fbatch.folios[j];
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1207  				n++;
0713e5f24b7deb8 Yan, Zheng              2017-08-31  1208  			}
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1209) 			fbatch.nr = n;
1d3576fd10f0d7a Sage Weil               2009-10-06  1210  
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1211) 			if (nr_folios && i == nr_folios &&
1d3576fd10f0d7a Sage Weil               2009-10-06  1212  			    locked_pages < max_pages) {
38d46409c4639a1 Xiubo Li                2023-06-12  1213  				doutc(cl, "reached end fbatch, trying for more\n");
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1214) 				folio_batch_release(&fbatch);
1d3576fd10f0d7a Sage Weil               2009-10-06  1215  				goto get_more_pages;
1d3576fd10f0d7a Sage Weil               2009-10-06  1216  			}
1d3576fd10f0d7a Sage Weil               2009-10-06  1217  		}
1d3576fd10f0d7a Sage Weil               2009-10-06  1218  
5b64640cf65be4a Yan, Zheng              2016-01-07  1219  new_request:
d55207717ded95c Jeff Layton             2022-08-25  1220  		offset = ceph_fscrypt_page_offset(pages[0]);
5b64640cf65be4a Yan, Zheng              2016-01-07  1221  		len = wsize;
5b64640cf65be4a Yan, Zheng              2016-01-07  1222  
5b64640cf65be4a Yan, Zheng              2016-01-07  1223  		req = ceph_osdc_new_request(&fsc->client->osdc,
5b64640cf65be4a Yan, Zheng              2016-01-07  1224  					&ci->i_layout, vino,
5b64640cf65be4a Yan, Zheng              2016-01-07  1225  					offset, &len, 0, num_ops,
1f934b00e907527 Yan, Zheng              2017-08-30  1226  					CEPH_OSD_OP_WRITE, CEPH_OSD_FLAG_WRITE,
1f934b00e907527 Yan, Zheng              2017-08-30  1227  					snapc, ceph_wbc.truncate_seq,
1f934b00e907527 Yan, Zheng              2017-08-30  1228  					ceph_wbc.truncate_size, false);
5b64640cf65be4a Yan, Zheng              2016-01-07  1229  		if (IS_ERR(req)) {
5b64640cf65be4a Yan, Zheng              2016-01-07  1230  			req = ceph_osdc_new_request(&fsc->client->osdc,
5b64640cf65be4a Yan, Zheng              2016-01-07  1231  						&ci->i_layout, vino,
5b64640cf65be4a Yan, Zheng              2016-01-07  1232  						offset, &len, 0,
5b64640cf65be4a Yan, Zheng              2016-01-07  1233  						min(num_ops,
5b64640cf65be4a Yan, Zheng              2016-01-07  1234  						    CEPH_OSD_SLAB_OPS),
5b64640cf65be4a Yan, Zheng              2016-01-07  1235  						CEPH_OSD_OP_WRITE,
54ea0046b6fe36e Ilya Dryomov            2017-02-11  1236  						CEPH_OSD_FLAG_WRITE,
1f934b00e907527 Yan, Zheng              2017-08-30  1237  						snapc, ceph_wbc.truncate_seq,
1f934b00e907527 Yan, Zheng              2017-08-30  1238  						ceph_wbc.truncate_size, true);
5b64640cf65be4a Yan, Zheng              2016-01-07  1239  			BUG_ON(IS_ERR(req));
5b64640cf65be4a Yan, Zheng              2016-01-07  1240  		}
d55207717ded95c Jeff Layton             2022-08-25  1241  		BUG_ON(len < ceph_fscrypt_page_offset(pages[locked_pages - 1]) +
d55207717ded95c Jeff Layton             2022-08-25  1242  			     thp_size(pages[locked_pages - 1]) - offset);
5b64640cf65be4a Yan, Zheng              2016-01-07  1243  
1464de9f813e355 Xiubo Li                2023-05-09  1244  		if (!ceph_inc_osd_stopping_blocker(fsc->mdsc)) {
1464de9f813e355 Xiubo Li                2023-05-09  1245  			rc = -EIO;
1464de9f813e355 Xiubo Li                2023-05-09  1246  			goto release_folios;
1464de9f813e355 Xiubo Li                2023-05-09  1247  		}
5b64640cf65be4a Yan, Zheng              2016-01-07  1248  		req->r_callback = writepages_finish;
5b64640cf65be4a Yan, Zheng              2016-01-07  1249  		req->r_inode = inode;
5b64640cf65be4a Yan, Zheng              2016-01-07  1250  
5b64640cf65be4a Yan, Zheng              2016-01-07  1251  		/* Format the osd request message and submit the write */
5b64640cf65be4a Yan, Zheng              2016-01-07  1252  		len = 0;
5b64640cf65be4a Yan, Zheng              2016-01-07  1253  		data_pages = pages;
5b64640cf65be4a Yan, Zheng              2016-01-07  1254  		op_idx = 0;
5b64640cf65be4a Yan, Zheng              2016-01-07  1255  		for (i = 0; i < locked_pages; i++) {
d55207717ded95c Jeff Layton             2022-08-25  1256  			struct page *page = ceph_fscrypt_pagecache_page(pages[i]);
d55207717ded95c Jeff Layton             2022-08-25  1257  
d55207717ded95c Jeff Layton             2022-08-25  1258  			u64 cur_offset = page_offset(page);
1702e79734104d7 Jeff Layton             2021-12-07  1259  			/*
1702e79734104d7 Jeff Layton             2021-12-07  1260  			 * Discontinuity in page range? Ceph can handle that by just passing
1702e79734104d7 Jeff Layton             2021-12-07  1261  			 * multiple extents in the write op.
1702e79734104d7 Jeff Layton             2021-12-07  1262  			 */
5b64640cf65be4a Yan, Zheng              2016-01-07  1263  			if (offset + len != cur_offset) {
1702e79734104d7 Jeff Layton             2021-12-07  1264  				/* If it's full, stop here */
3fb99d483e614bc Yanhu Cao               2017-07-21  1265  				if (op_idx + 1 == req->r_num_ops)
5b64640cf65be4a Yan, Zheng              2016-01-07  1266  					break;
1702e79734104d7 Jeff Layton             2021-12-07  1267  
1702e79734104d7 Jeff Layton             2021-12-07  1268  				/* Kick off an fscache write with what we have so far. */
1702e79734104d7 Jeff Layton             2021-12-07  1269  				ceph_fscache_write_to_cache(inode, offset, len, caching);
1702e79734104d7 Jeff Layton             2021-12-07  1270  
1702e79734104d7 Jeff Layton             2021-12-07  1271  				/* Start a new extent */
5b64640cf65be4a Yan, Zheng              2016-01-07  1272  				osd_req_op_extent_dup_last(req, op_idx,
5b64640cf65be4a Yan, Zheng              2016-01-07  1273  							   cur_offset - offset);
38d46409c4639a1 Xiubo Li                2023-06-12  1274  				doutc(cl, "got pages at %llu~%llu\n", offset,
38d46409c4639a1 Xiubo Li                2023-06-12  1275  				      len);
5b64640cf65be4a Yan, Zheng              2016-01-07  1276  				osd_req_op_extent_osd_data_pages(req, op_idx,
5b64640cf65be4a Yan, Zheng              2016-01-07  1277  							data_pages, len, 0,
a0102bda5bc0991 Jeff Layton             2020-07-30  1278  							from_pool, false);
5b64640cf65be4a Yan, Zheng              2016-01-07  1279  				osd_req_op_extent_update(req, op_idx, len);
5b64640cf65be4a Yan, Zheng              2016-01-07  1280  
5b64640cf65be4a Yan, Zheng              2016-01-07  1281  				len = 0;
5b64640cf65be4a Yan, Zheng              2016-01-07  1282  				offset = cur_offset;
5b64640cf65be4a Yan, Zheng              2016-01-07  1283  				data_pages = pages + i;
5b64640cf65be4a Yan, Zheng              2016-01-07  1284  				op_idx++;
5b64640cf65be4a Yan, Zheng              2016-01-07  1285  			}
5b64640cf65be4a Yan, Zheng              2016-01-07  1286  
d55207717ded95c Jeff Layton             2022-08-25  1287  			set_page_writeback(page);
1702e79734104d7 Jeff Layton             2021-12-07  1288  			if (caching)
d55207717ded95c Jeff Layton             2022-08-25  1289  				ceph_set_page_fscache(page);
8ff2d290c8ce77c Jeff Layton             2021-04-05  1290  			len += thp_size(page);
5b64640cf65be4a Yan, Zheng              2016-01-07  1291  		}
1702e79734104d7 Jeff Layton             2021-12-07  1292  		ceph_fscache_write_to_cache(inode, offset, len, caching);
5b64640cf65be4a Yan, Zheng              2016-01-07  1293  
1f934b00e907527 Yan, Zheng              2017-08-30  1294  		if (ceph_wbc.size_stable) {
1f934b00e907527 Yan, Zheng              2017-08-30  1295  			len = min(len, ceph_wbc.i_size - offset);
5b64640cf65be4a Yan, Zheng              2016-01-07  1296  		} else if (i == locked_pages) {
e1966b49446a439 Yan, Zheng              2015-06-18  1297  			/* writepages_finish() clears writeback pages
e1966b49446a439 Yan, Zheng              2015-06-18  1298  			 * according to the data length, so make sure
e1966b49446a439 Yan, Zheng              2015-06-18  1299  			 * data length covers all locked pages */
8ff2d290c8ce77c Jeff Layton             2021-04-05  1300  			u64 min_len = len + 1 - thp_size(page);
1f934b00e907527 Yan, Zheng              2017-08-30  1301  			len = get_writepages_data_length(inode, pages[i - 1],
1f934b00e907527 Yan, Zheng              2017-08-30  1302  							 offset);
5b64640cf65be4a Yan, Zheng              2016-01-07  1303  			len = max(len, min_len);
e1966b49446a439 Yan, Zheng              2015-06-18  1304  		}
d55207717ded95c Jeff Layton             2022-08-25  1305  		if (IS_ENCRYPTED(inode))
d55207717ded95c Jeff Layton             2022-08-25  1306  			len = round_up(len, CEPH_FSCRYPT_BLOCK_SIZE);
d55207717ded95c Jeff Layton             2022-08-25  1307  
38d46409c4639a1 Xiubo Li                2023-06-12  1308  		doutc(cl, "got pages at %llu~%llu\n", offset, len);
1d3576fd10f0d7a Sage Weil               2009-10-06  1309  
d55207717ded95c Jeff Layton             2022-08-25  1310  		if (IS_ENCRYPTED(inode) &&
d55207717ded95c Jeff Layton             2022-08-25  1311  		    ((offset | len) & ~CEPH_FSCRYPT_BLOCK_MASK))
38d46409c4639a1 Xiubo Li                2023-06-12  1312  			pr_warn_client(cl,
38d46409c4639a1 Xiubo Li                2023-06-12  1313  				"bad encrypted write offset=%lld len=%llu\n",
38d46409c4639a1 Xiubo Li                2023-06-12  1314  				offset, len);
d55207717ded95c Jeff Layton             2022-08-25  1315  
5b64640cf65be4a Yan, Zheng              2016-01-07  1316  		osd_req_op_extent_osd_data_pages(req, op_idx, data_pages, len,
a0102bda5bc0991 Jeff Layton             2020-07-30  1317  						 0, from_pool, false);
5b64640cf65be4a Yan, Zheng              2016-01-07  1318  		osd_req_op_extent_update(req, op_idx, len);
e5975c7c8eb6aea Alex Elder              2013-03-14  1319  
5b64640cf65be4a Yan, Zheng              2016-01-07  1320  		BUG_ON(op_idx + 1 != req->r_num_ops);
e5975c7c8eb6aea Alex Elder              2013-03-14  1321  
a0102bda5bc0991 Jeff Layton             2020-07-30  1322  		from_pool = false;
5b64640cf65be4a Yan, Zheng              2016-01-07  1323  		if (i < locked_pages) {
5b64640cf65be4a Yan, Zheng              2016-01-07  1324  			BUG_ON(num_ops <= req->r_num_ops);
5b64640cf65be4a Yan, Zheng              2016-01-07  1325  			num_ops -= req->r_num_ops;
5b64640cf65be4a Yan, Zheng              2016-01-07  1326  			locked_pages -= i;
5b64640cf65be4a Yan, Zheng              2016-01-07  1327  
5b64640cf65be4a Yan, Zheng              2016-01-07  1328  			/* allocate new pages array for next request */
5b64640cf65be4a Yan, Zheng              2016-01-07  1329  			data_pages = pages;
6da2ec56059c3c7 Kees Cook               2018-06-12  1330  			pages = kmalloc_array(locked_pages, sizeof(*pages),
5b64640cf65be4a Yan, Zheng              2016-01-07  1331  					      GFP_NOFS);
5b64640cf65be4a Yan, Zheng              2016-01-07  1332  			if (!pages) {
a0102bda5bc0991 Jeff Layton             2020-07-30  1333  				from_pool = true;
a0102bda5bc0991 Jeff Layton             2020-07-30  1334  				pages = mempool_alloc(ceph_wb_pagevec_pool, GFP_NOFS);
5b64640cf65be4a Yan, Zheng              2016-01-07  1335  				BUG_ON(!pages);
5b64640cf65be4a Yan, Zheng              2016-01-07  1336  			}
5b64640cf65be4a Yan, Zheng              2016-01-07  1337  			memcpy(pages, data_pages + i,
5b64640cf65be4a Yan, Zheng              2016-01-07  1338  			       locked_pages * sizeof(*pages));
5b64640cf65be4a Yan, Zheng              2016-01-07  1339  			memset(data_pages + i, 0,
5b64640cf65be4a Yan, Zheng              2016-01-07  1340  			       locked_pages * sizeof(*pages));
5b64640cf65be4a Yan, Zheng              2016-01-07  1341  		} else {
5b64640cf65be4a Yan, Zheng              2016-01-07  1342  			BUG_ON(num_ops != req->r_num_ops);
5b64640cf65be4a Yan, Zheng              2016-01-07  1343  			index = pages[i - 1]->index + 1;
5b64640cf65be4a Yan, Zheng              2016-01-07  1344  			/* request message now owns the pages array */
5b64640cf65be4a Yan, Zheng              2016-01-07  1345  			pages = NULL;
5b64640cf65be4a Yan, Zheng              2016-01-07  1346  		}
e5975c7c8eb6aea Alex Elder              2013-03-14  1347  
c453bdb535341b5 Jeff Layton             2023-10-04  1348  		req->r_mtime = inode_get_mtime(inode);
a8af0d682ae0c9c Jeff Layton             2022-06-30  1349  		ceph_osdc_start_request(&fsc->client->osdc, req);
1d3576fd10f0d7a Sage Weil               2009-10-06  1350  		req = NULL;
1d3576fd10f0d7a Sage Weil               2009-10-06  1351  
5b64640cf65be4a Yan, Zheng              2016-01-07  1352  		wbc->nr_to_write -= i;
5b64640cf65be4a Yan, Zheng              2016-01-07  1353  		if (pages)
5b64640cf65be4a Yan, Zheng              2016-01-07  1354  			goto new_request;
5b64640cf65be4a Yan, Zheng              2016-01-07  1355  
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1356  		/*
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1357  		 * We stop writing back only if we are not doing
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1358  		 * integrity sync. In case of integrity sync we have to
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1359  		 * keep going until we have written all the pages
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1360  		 * we tagged for writeback prior to entering this loop.
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1361  		 */
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1362  		if (wbc->nr_to_write <= 0 && wbc->sync_mode == WB_SYNC_NONE)
af9cc401ce7452f Yan, Zheng              2018-03-04  1363  			done = true;
1d3576fd10f0d7a Sage Weil               2009-10-06  1364  
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1365) release_folios:
38d46409c4639a1 Xiubo Li                2023-06-12  1366  		doutc(cl, "folio_batch release on %d folios (%p)\n",
38d46409c4639a1 Xiubo Li                2023-06-12  1367  		      (int)fbatch.nr, fbatch.nr ? fbatch.folios[0] : NULL);
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1368) 		folio_batch_release(&fbatch);
1d3576fd10f0d7a Sage Weil               2009-10-06  1369  	}
1d3576fd10f0d7a Sage Weil               2009-10-06  1370  
1d3576fd10f0d7a Sage Weil               2009-10-06  1371  	if (should_loop && !done) {
1d3576fd10f0d7a Sage Weil               2009-10-06  1372  		/* more to do; loop back to beginning of file */
38d46409c4639a1 Xiubo Li                2023-06-12  1373  		doutc(cl, "looping back to beginning of file\n");
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1374  		end = start_index - 1; /* OK even when start_index == 0 */
f275635ee0b6641 Yan, Zheng              2017-09-01  1375  
f275635ee0b6641 Yan, Zheng              2017-09-01  1376  		/* to write dirty pages associated with next snapc,
f275635ee0b6641 Yan, Zheng              2017-09-01  1377  		 * we need to wait until current writes complete */
f275635ee0b6641 Yan, Zheng              2017-09-01  1378  		if (wbc->sync_mode != WB_SYNC_NONE &&
f275635ee0b6641 Yan, Zheng              2017-09-01  1379  		    start_index == 0 && /* all dirty pages were checked */
f275635ee0b6641 Yan, Zheng              2017-09-01  1380  		    !ceph_wbc.head_snapc) {
f275635ee0b6641 Yan, Zheng              2017-09-01  1381  			struct page *page;
f275635ee0b6641 Yan, Zheng              2017-09-01  1382  			unsigned i, nr;
f275635ee0b6641 Yan, Zheng              2017-09-01  1383  			index = 0;
f275635ee0b6641 Yan, Zheng              2017-09-01  1384  			while ((index <= end) &&
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1385) 			       (nr = filemap_get_folios_tag(mapping, &index,
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1386) 						(pgoff_t)-1,
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1387) 						PAGECACHE_TAG_WRITEBACK,
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1388) 						&fbatch))) {
f275635ee0b6641 Yan, Zheng              2017-09-01  1389  				for (i = 0; i < nr; i++) {
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1390) 					page = &fbatch.folios[i]->page;
f275635ee0b6641 Yan, Zheng              2017-09-01  1391  					if (page_snap_context(page) != snapc)
f275635ee0b6641 Yan, Zheng              2017-09-01  1392  						continue;
f275635ee0b6641 Yan, Zheng              2017-09-01  1393  					wait_on_page_writeback(page);
f275635ee0b6641 Yan, Zheng              2017-09-01  1394  				}
590a2b5f0a9b740 Vishal Moola (Oracle    2023-01-04  1395) 				folio_batch_release(&fbatch);
f275635ee0b6641 Yan, Zheng              2017-09-01  1396  				cond_resched();
f275635ee0b6641 Yan, Zheng              2017-09-01  1397  			}
f275635ee0b6641 Yan, Zheng              2017-09-01  1398  		}
f275635ee0b6641 Yan, Zheng              2017-09-01  1399  
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1400  		start_index = 0;
1d3576fd10f0d7a Sage Weil               2009-10-06  1401  		index = 0;
1d3576fd10f0d7a Sage Weil               2009-10-06  1402  		goto retry;
1d3576fd10f0d7a Sage Weil               2009-10-06  1403  	}
1d3576fd10f0d7a Sage Weil               2009-10-06  1404  
1d3576fd10f0d7a Sage Weil               2009-10-06  1405  	if (wbc->range_cyclic || (range_whole && wbc->nr_to_write > 0))
1d3576fd10f0d7a Sage Weil               2009-10-06  1406  		mapping->writeback_index = index;
1d3576fd10f0d7a Sage Weil               2009-10-06  1407  
1d3576fd10f0d7a Sage Weil               2009-10-06  1408  out:
1d3576fd10f0d7a Sage Weil               2009-10-06  1409  	ceph_osdc_put_request(req);
2a2d927e35dd8dc Yan, Zheng              2017-09-01  1410  	ceph_put_snap_context(last_snapc);
38d46409c4639a1 Xiubo Li                2023-06-12  1411  	doutc(cl, "%llx.%llx dend - startone, rc = %d\n", ceph_vinop(inode),
38d46409c4639a1 Xiubo Li                2023-06-12  1412  	      rc);
1d3576fd10f0d7a Sage Weil               2009-10-06  1413  	return rc;
1d3576fd10f0d7a Sage Weil               2009-10-06  1414  }
1d3576fd10f0d7a Sage Weil               2009-10-06  1415  

:::::: The code at line 998 was first introduced by commit
:::::: 38d46409c4639a1d659ebfa70e27a8bed6b8ee1d ceph: print cluster fsid and client global_id in all debug logs

:::::: TO: Xiubo Li <xiubli@redhat.com>
:::::: CC: Ilya Dryomov <idryomov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
