Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73DE44460
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gmdARIvC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697554787; x=1729090787;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OKUTuX/DUovWfMNN7GgGkHPxBXuIB6//liRkduUcTgY=;
  b=gmdARIvCTfvmqhwRMiKxrbAGuj6E2ysk/S3Wtr7SCry4vs6nnIA5Kjag
   u92bGE6BET720DzKOyWg4sz5i3d2eGkpZeXdZuQGlfHax+WfoXHvi3NIA
   zVca8ZWSMHsF5pq+Sd8Ag9HFMerSFnElWt4RBzgIWG5YecjntzB5rXQln
   1BwVYvSeRVv70T79+mzL/4Ark2DSKKMMdgbvrCKxwk4ogRcgsd3mkwMQR
   7R3jvKPEjI7v3mYggp5JKaJp8KoVgw2yFAAPFr51TJdYRbRrZLAmZk4fz
   PnjItHD8V9ePe8OSAhQ9kSibTU8epanNczf6eLRp0FH3dcjJemOiaC3zL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="7357335"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="7357335"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 07:59:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="1003383859"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="1003383859"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 17 Oct 2023 07:59:44 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qslXk-0009iM-1P;
	Tue, 17 Oct 2023 14:59:38 +0000
Date: Tue, 17 Oct 2023 22:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/iomap/buffered-io.c:678 iomap_write_begin() warn: bitwise AND
 condition is false here
Message-ID: <202310172223.bVBxUtfx-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: Jens Axboe <axboe@kernel.dk>
CC: Luis Chamberlain <mcgrof@kernel.org>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 925c86a19bacf8ce10eb666328fb3fa5aff7b951 fs: add CONFIG_BUFFER_HEAD
date:   3 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 3 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310172223.bVBxUtfx-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310172223.bVBxUtfx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310172223.bVBxUtfx-lkp@intel.com/

smatch warnings:
fs/iomap/buffered-io.c:678 iomap_write_begin() warn: bitwise AND condition is false here
fs/iomap/buffered-io.c:748 iomap_write_end() warn: bitwise AND condition is false here
fs/iomap/buffered-io.c:1251 iomap_folio_mkwrite_iter() warn: bitwise AND condition is false here

vim +678 fs/iomap/buffered-io.c

69f4a26c1e0c7c Gao Xiang               2021-08-03  630  
d7b64041164ca1 Dave Chinner            2022-11-29  631  static int iomap_write_begin(struct iomap_iter *iter, loff_t pos,
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  632) 		size_t len, struct folio **foliop)
afc51aaa22f26c Darrick J. Wong         2019-07-15  633  {
471859f57d4253 Andreas Gruenbacher     2023-01-15  634  	const struct iomap_folio_ops *folio_ops = iter->iomap.folio_ops;
fad0a1ab34f777 Christoph Hellwig       2021-08-10  635  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
d1bd0b4ebfe052 Matthew Wilcox (Oracle  2021-11-03  636) 	struct folio *folio;
afc51aaa22f26c Darrick J. Wong         2019-07-15  637  	int status = 0;
afc51aaa22f26c Darrick J. Wong         2019-07-15  638  
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  639  	BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  640  	if (srcmap != &iter->iomap)
c039b997927263 Goldwyn Rodrigues       2019-10-18  641  		BUG_ON(pos + len > srcmap->offset + srcmap->length);
afc51aaa22f26c Darrick J. Wong         2019-07-15  642  
afc51aaa22f26c Darrick J. Wong         2019-07-15  643  	if (fatal_signal_pending(current))
afc51aaa22f26c Darrick J. Wong         2019-07-15  644  		return -EINTR;
afc51aaa22f26c Darrick J. Wong         2019-07-15  645  
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  646) 	if (!mapping_large_folio_support(iter->inode->i_mapping))
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  647) 		len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  648) 
07c22b56685dd7 Andreas Gruenbacher     2023-01-15  649  	folio = __iomap_get_folio(iter, pos, len);
9060bc4d3aca61 Andreas Gruenbacher     2023-01-15  650  	if (IS_ERR(folio))
98321b5139f92a Andreas Gruenbacher     2023-01-15  651  		return PTR_ERR(folio);
d7b64041164ca1 Dave Chinner            2022-11-29  652  
d7b64041164ca1 Dave Chinner            2022-11-29  653  	/*
d7b64041164ca1 Dave Chinner            2022-11-29  654  	 * Now we have a locked folio, before we do anything with it we need to
d7b64041164ca1 Dave Chinner            2022-11-29  655  	 * check that the iomap we have cached is not stale. The inode extent
d7b64041164ca1 Dave Chinner            2022-11-29  656  	 * mapping can change due to concurrent IO in flight (e.g.
d7b64041164ca1 Dave Chinner            2022-11-29  657  	 * IOMAP_UNWRITTEN state can change and memory reclaim could have
d7b64041164ca1 Dave Chinner            2022-11-29  658  	 * reclaimed a previously partially written page at this index after IO
d7b64041164ca1 Dave Chinner            2022-11-29  659  	 * completion before this write reaches this file offset) and hence we
d7b64041164ca1 Dave Chinner            2022-11-29  660  	 * could do the wrong thing here (zero a page range incorrectly or fail
d7b64041164ca1 Dave Chinner            2022-11-29  661  	 * to zero) and corrupt data.
d7b64041164ca1 Dave Chinner            2022-11-29  662  	 */
471859f57d4253 Andreas Gruenbacher     2023-01-15  663  	if (folio_ops && folio_ops->iomap_valid) {
471859f57d4253 Andreas Gruenbacher     2023-01-15  664  		bool iomap_valid = folio_ops->iomap_valid(iter->inode,
d7b64041164ca1 Dave Chinner            2022-11-29  665  							 &iter->iomap);
d7b64041164ca1 Dave Chinner            2022-11-29  666  		if (!iomap_valid) {
d7b64041164ca1 Dave Chinner            2022-11-29  667  			iter->iomap.flags |= IOMAP_F_STALE;
d7b64041164ca1 Dave Chinner            2022-11-29  668  			status = 0;
d7b64041164ca1 Dave Chinner            2022-11-29  669  			goto out_unlock;
d7b64041164ca1 Dave Chinner            2022-11-29  670  		}
d7b64041164ca1 Dave Chinner            2022-11-29  671  	}
d7b64041164ca1 Dave Chinner            2022-11-29  672  
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  673) 	if (pos + len > folio_pos(folio) + folio_size(folio))
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  674) 		len = folio_pos(folio) + folio_size(folio) - pos;
afc51aaa22f26c Darrick J. Wong         2019-07-15  675  
c039b997927263 Goldwyn Rodrigues       2019-10-18  676  	if (srcmap->type == IOMAP_INLINE)
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  677) 		status = iomap_write_begin_inline(iter, folio);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10 @678  	else if (srcmap->flags & IOMAP_F_BUFFER_HEAD)
d1bd0b4ebfe052 Matthew Wilcox (Oracle  2021-11-03  679) 		status = __block_write_begin_int(folio, pos, len, NULL, srcmap);
afc51aaa22f26c Darrick J. Wong         2019-07-15  680  	else
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  681) 		status = __iomap_write_begin(iter, pos, len, folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  682  
afc51aaa22f26c Darrick J. Wong         2019-07-15  683  	if (unlikely(status))
afc51aaa22f26c Darrick J. Wong         2019-07-15  684  		goto out_unlock;
afc51aaa22f26c Darrick J. Wong         2019-07-15  685  
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  686) 	*foliop = folio;
afc51aaa22f26c Darrick J. Wong         2019-07-15  687  	return 0;
afc51aaa22f26c Darrick J. Wong         2019-07-15  688  
afc51aaa22f26c Darrick J. Wong         2019-07-15  689  out_unlock:
7a70a5085ed028 Andreas Gruenbacher     2023-01-15  690  	__iomap_put_folio(iter, pos, 0, folio);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  691  	iomap_write_failed(iter->inode, pos, len);
afc51aaa22f26c Darrick J. Wong         2019-07-15  692  
afc51aaa22f26c Darrick J. Wong         2019-07-15  693  	return status;
afc51aaa22f26c Darrick J. Wong         2019-07-15  694  }
afc51aaa22f26c Darrick J. Wong         2019-07-15  695  
e25ba8cbfd16bb Matthew Wilcox (Oracle  2020-09-21  696) static size_t __iomap_write_end(struct inode *inode, loff_t pos, size_t len,
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  697) 		size_t copied, struct folio *folio)
afc51aaa22f26c Darrick J. Wong         2019-07-15  698  {
cd1e5afe5503ed Matthew Wilcox (Oracle  2021-04-28  699) 	struct iomap_page *iop = to_iomap_page(folio);
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  700) 	flush_dcache_folio(folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  701  
afc51aaa22f26c Darrick J. Wong         2019-07-15  702  	/*
afc51aaa22f26c Darrick J. Wong         2019-07-15  703  	 * The blocks that were entirely written will now be uptodate, so we
7479c505b4ab5e Matthew Wilcox (Oracle  2022-04-29  704) 	 * don't have to worry about a read_folio reading them and overwriting a
f1f264b4c134ee Andreas Gruenbacher     2021-08-02  705  	 * partial write.  However, if we've encountered a short write and only
afc51aaa22f26c Darrick J. Wong         2019-07-15  706  	 * partially written into a block, it will not be marked uptodate, so a
7479c505b4ab5e Matthew Wilcox (Oracle  2022-04-29  707) 	 * read_folio might come in and destroy our partial write.
afc51aaa22f26c Darrick J. Wong         2019-07-15  708  	 *
f1f264b4c134ee Andreas Gruenbacher     2021-08-02  709  	 * Do the simplest thing and just treat any short write to a
f1f264b4c134ee Andreas Gruenbacher     2021-08-02  710  	 * non-uptodate page as a zero-length write, and force the caller to
f1f264b4c134ee Andreas Gruenbacher     2021-08-02  711  	 * redo the whole thing.
afc51aaa22f26c Darrick J. Wong         2019-07-15  712  	 */
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  713) 	if (unlikely(copied < len && !folio_test_uptodate(folio)))
afc51aaa22f26c Darrick J. Wong         2019-07-15  714  		return 0;
431c0566bb6078 Matthew Wilcox (Oracle  2021-04-28  715) 	iomap_set_range_uptodate(folio, iop, offset_in_folio(folio, pos), len);
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  716) 	filemap_dirty_folio(inode->i_mapping, folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  717  	return copied;
afc51aaa22f26c Darrick J. Wong         2019-07-15  718  }
afc51aaa22f26c Darrick J. Wong         2019-07-15  719  
fad0a1ab34f777 Christoph Hellwig       2021-08-10  720  static size_t iomap_write_end_inline(const struct iomap_iter *iter,
9c4ce08dd21145 Matthew Wilcox (Oracle  2021-05-02  721) 		struct folio *folio, loff_t pos, size_t copied)
afc51aaa22f26c Darrick J. Wong         2019-07-15  722  {
fad0a1ab34f777 Christoph Hellwig       2021-08-10  723  	const struct iomap *iomap = &iter->iomap;
afc51aaa22f26c Darrick J. Wong         2019-07-15  724  	void *addr;
afc51aaa22f26c Darrick J. Wong         2019-07-15  725  
9c4ce08dd21145 Matthew Wilcox (Oracle  2021-05-02  726) 	WARN_ON_ONCE(!folio_test_uptodate(folio));
69f4a26c1e0c7c Gao Xiang               2021-08-03  727  	BUG_ON(!iomap_inline_data_valid(iomap));
afc51aaa22f26c Darrick J. Wong         2019-07-15  728  
9c4ce08dd21145 Matthew Wilcox (Oracle  2021-05-02  729) 	flush_dcache_folio(folio);
9c4ce08dd21145 Matthew Wilcox (Oracle  2021-05-02  730) 	addr = kmap_local_folio(folio, pos);
ab069d5fdcd145 Matthew Wilcox (Oracle  2021-08-04  731) 	memcpy(iomap_inline_data(iomap, pos), addr, copied);
ab069d5fdcd145 Matthew Wilcox (Oracle  2021-08-04  732) 	kunmap_local(addr);
afc51aaa22f26c Darrick J. Wong         2019-07-15  733  
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  734  	mark_inode_dirty(iter->inode);
afc51aaa22f26c Darrick J. Wong         2019-07-15  735  	return copied;
afc51aaa22f26c Darrick J. Wong         2019-07-15  736  }
afc51aaa22f26c Darrick J. Wong         2019-07-15  737  
e25ba8cbfd16bb Matthew Wilcox (Oracle  2020-09-21  738) /* Returns the number of bytes copied.  May be 0.  Cannot be an errno. */
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  739  static size_t iomap_write_end(struct iomap_iter *iter, loff_t pos, size_t len,
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  740) 		size_t copied, struct folio *folio)
afc51aaa22f26c Darrick J. Wong         2019-07-15  741  {
fad0a1ab34f777 Christoph Hellwig       2021-08-10  742  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  743  	loff_t old_size = iter->inode->i_size;
e25ba8cbfd16bb Matthew Wilcox (Oracle  2020-09-21  744) 	size_t ret;
afc51aaa22f26c Darrick J. Wong         2019-07-15  745  
c039b997927263 Goldwyn Rodrigues       2019-10-18  746  	if (srcmap->type == IOMAP_INLINE) {
9c4ce08dd21145 Matthew Wilcox (Oracle  2021-05-02  747) 		ret = iomap_write_end_inline(iter, folio, pos, copied);
c039b997927263 Goldwyn Rodrigues       2019-10-18 @748  	} else if (srcmap->flags & IOMAP_F_BUFFER_HEAD) {
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  749  		ret = block_write_end(NULL, iter->inode->i_mapping, pos, len,
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  750) 				copied, &folio->page, NULL);
afc51aaa22f26c Darrick J. Wong         2019-07-15  751  	} else {
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  752) 		ret = __iomap_write_end(iter->inode, pos, len, copied, folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  753  	}
afc51aaa22f26c Darrick J. Wong         2019-07-15  754  
afc51aaa22f26c Darrick J. Wong         2019-07-15  755  	/*
afc51aaa22f26c Darrick J. Wong         2019-07-15  756  	 * Update the in-memory inode size after copying the data into the page
afc51aaa22f26c Darrick J. Wong         2019-07-15  757  	 * cache.  It's up to the file system to write the updated size to disk,
afc51aaa22f26c Darrick J. Wong         2019-07-15  758  	 * preferably after I/O completion so that no stale data is exposed.
afc51aaa22f26c Darrick J. Wong         2019-07-15  759  	 */
afc51aaa22f26c Darrick J. Wong         2019-07-15  760  	if (pos + ret > old_size) {
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  761  		i_size_write(iter->inode, pos + ret);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  762  		iter->iomap.flags |= IOMAP_F_SIZE_CHANGED;
afc51aaa22f26c Darrick J. Wong         2019-07-15  763  	}
7a70a5085ed028 Andreas Gruenbacher     2023-01-15  764  	__iomap_put_folio(iter, pos, ret, folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  765  
afc51aaa22f26c Darrick J. Wong         2019-07-15  766  	if (old_size < pos)
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  767  		pagecache_isize_extended(iter->inode, old_size, pos);
afc51aaa22f26c Darrick J. Wong         2019-07-15  768  	if (ret < len)
d74999c8c060df Andreas Gruenbacher     2022-05-05  769  		iomap_write_failed(iter->inode, pos + ret, len - ret);
afc51aaa22f26c Darrick J. Wong         2019-07-15  770  	return ret;
afc51aaa22f26c Darrick J. Wong         2019-07-15  771  }
afc51aaa22f26c Darrick J. Wong         2019-07-15  772  

:::::: The code at line 678 was first introduced by commit
:::::: 1b5c1e36dc0e0f15de9717e81508934cbc3daf15 iomap: pass an iomap_iter to various buffered I/O helpers

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
