Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E4FBF9
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 15:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S7WtBTb8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699199439; x=1730735439;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0ZUTRqMMRYWecgrRP1k/hjcFLsPScizDHLLj1inSjjw=;
  b=S7WtBTb89HuheJZ6WPkIqQSVoEBJ4bI4+IpBJ/GodY/kmP+6Omkn6bNk
   wrYxDMQpnKM/cYm+OOLwAd/2Dk6rk+iP3jrNQ3S5Ks0gsE/CnJCgXO5ap
   Yo8LFsY8tyA4hSgp0GQ0e9XG/gx+E8F20WEV/26GOU6s5FLEwlE+KJjtD
   /XXjKMzdDzMis6bf2OFit0Bdw2R/W/wBuxlKDMjaAR4Wbf7hhfhmW+Kdj
   VqPiycw5TYJKbD2F6DTxNR2omqVNl/B0taH4rMtqWDQt9hRtYJk1S/6G2
   uCUzLH8jwcmIcyhRFWgab+4/STWYwWw/flZCFKjzQpke7Dpad4yPRVQlt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="368491614"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="368491614"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 07:50:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="10229048"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Nov 2023 07:50:38 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzfOW-0005ZY-00;
	Sun, 05 Nov 2023 15:50:36 +0000
Date: Sun, 5 Nov 2023 23:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/btrfs/inode.c:1794 run_delalloc_compressed() error: 'blkcg_css'
 dereferencing possible ERR_PTR()
Message-ID: <202311052324.yVOp4bhf-lkp@intel.com>
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
CC: David Sterba <dsterba@suse.com>
CC: Anand Jain <anand.jain@oracle.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: bb7b05fe1b51e2ae529cbbd4c582ec83503f121a btrfs: rename cow_file_range_async to run_delalloc_compressed
date:   5 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-161-20231104 (https://download.01.org/0day-ci/archive/20231105/202311052324.yVOp4bhf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231105/202311052324.yVOp4bhf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311052324.yVOp4bhf-lkp@intel.com/

New smatch warnings:
fs/btrfs/inode.c:1794 run_delalloc_compressed() error: 'blkcg_css' dereferencing possible ERR_PTR()

Old smatch warnings:
fs/btrfs/inode.c:189 data_reloc_print_warning_inode() warn: missing unwind goto?
fs/btrfs/inode.c:555 insert_inline_extent() error: we previously assumed 'compressed_pages' could be null (see line 524)

vim +/blkcg_css +1794 fs/btrfs/inode.c

771ed689d2cd53 Chris Mason       2008-11-06  1722  
bb7b05fe1b51e2 Christoph Hellwig 2023-05-31  1723  static bool run_delalloc_compressed(struct btrfs_inode *inode,
ec39f7696ccfac Chris Mason       2019-07-10  1724  				    struct writeback_control *wbc,
ec39f7696ccfac Chris Mason       2019-07-10  1725  				    struct page *locked_page,
771ed689d2cd53 Chris Mason       2008-11-06  1726  				    u64 start, u64 end, int *page_started,
fac07d2b091542 David Sterba      2019-10-29  1727  				    unsigned long *nr_written)
771ed689d2cd53 Chris Mason       2008-11-06  1728  {
751b64318d4c6b Nikolay Borisov   2020-06-03  1729  	struct btrfs_fs_info *fs_info = inode->root->fs_info;
ec39f7696ccfac Chris Mason       2019-07-10  1730  	struct cgroup_subsys_state *blkcg_css = wbc_blkcg_css(wbc);
97db120451e20c Nikolay Borisov   2019-03-12  1731  	struct async_cow *ctx;
97db120451e20c Nikolay Borisov   2019-03-12  1732  	struct async_chunk *async_chunk;
771ed689d2cd53 Chris Mason       2008-11-06  1733  	unsigned long nr_pages;
97db120451e20c Nikolay Borisov   2019-03-12  1734  	u64 num_chunks = DIV_ROUND_UP(end - start, SZ_512K);
97db120451e20c Nikolay Borisov   2019-03-12  1735  	int i;
b1c16ac978fd40 Nikolay Borisov   2019-04-01  1736  	unsigned nofs_flag;
bf9486d6dd2351 Bart Van Assche   2022-07-14  1737  	const blk_opf_t write_flags = wbc_to_write_flags(wbc);
771ed689d2cd53 Chris Mason       2008-11-06  1738  
b1c16ac978fd40 Nikolay Borisov   2019-04-01  1739  	nofs_flag = memalloc_nofs_save();
b1c16ac978fd40 Nikolay Borisov   2019-04-01  1740  	ctx = kvmalloc(struct_size(ctx, chunks, num_chunks), GFP_KERNEL);
b1c16ac978fd40 Nikolay Borisov   2019-04-01  1741  	memalloc_nofs_restore(nofs_flag);
973fb26e81a9f5 Christoph Hellwig 2023-05-31  1742  	if (!ctx)
973fb26e81a9f5 Christoph Hellwig 2023-05-31  1743  		return false;
b1c16ac978fd40 Nikolay Borisov   2019-04-01  1744  
973fb26e81a9f5 Christoph Hellwig 2023-05-31  1745  	unlock_extent(&inode->io_tree, start, end, NULL);
973fb26e81a9f5 Christoph Hellwig 2023-05-31  1746  	set_bit(BTRFS_INODE_HAS_ASYNC_EXTENT, &inode->runtime_flags);
97db120451e20c Nikolay Borisov   2019-03-12  1747  
97db120451e20c Nikolay Borisov   2019-03-12  1748  	async_chunk = ctx->chunks;
97db120451e20c Nikolay Borisov   2019-03-12  1749  	atomic_set(&ctx->num_chunks, num_chunks);
97db120451e20c Nikolay Borisov   2019-03-12  1750  
97db120451e20c Nikolay Borisov   2019-03-12  1751  	for (i = 0; i < num_chunks; i++) {
973fb26e81a9f5 Christoph Hellwig 2023-05-31  1752  		u64 cur_end = min(end, start + SZ_512K - 1);
771ed689d2cd53 Chris Mason       2008-11-06  1753  
bd4691a0e866e7 Nikolay Borisov   2019-01-03  1754  		/*
bd4691a0e866e7 Nikolay Borisov   2019-01-03  1755  		 * igrab is called higher up in the call chain, take only the
bd4691a0e866e7 Nikolay Borisov   2019-01-03  1756  		 * lightweight reference for the callback lifetime
bd4691a0e866e7 Nikolay Borisov   2019-01-03  1757  		 */
751b64318d4c6b Nikolay Borisov   2020-06-03  1758  		ihold(&inode->vfs_inode);
9e895a8f7e1232 Qu Wenruo         2021-09-27  1759  		async_chunk[i].async_cow = ctx;
99a81a444448ef David Sterba      2022-10-28  1760  		async_chunk[i].inode = inode;
97db120451e20c Nikolay Borisov   2019-03-12  1761  		async_chunk[i].start = start;
97db120451e20c Nikolay Borisov   2019-03-12  1762  		async_chunk[i].end = cur_end;
97db120451e20c Nikolay Borisov   2019-03-12  1763  		async_chunk[i].write_flags = write_flags;
97db120451e20c Nikolay Borisov   2019-03-12  1764  		INIT_LIST_HEAD(&async_chunk[i].extents);
97db120451e20c Nikolay Borisov   2019-03-12  1765  
1d53c9e6723022 Chris Mason       2019-07-10  1766  		/*
1d53c9e6723022 Chris Mason       2019-07-10  1767  		 * The locked_page comes all the way from writepage and its
1d53c9e6723022 Chris Mason       2019-07-10  1768  		 * the original page we were actually given.  As we spread
1d53c9e6723022 Chris Mason       2019-07-10  1769  		 * this large delalloc region across multiple async_chunk
1d53c9e6723022 Chris Mason       2019-07-10  1770  		 * structs, only the first struct needs a pointer to locked_page
1d53c9e6723022 Chris Mason       2019-07-10  1771  		 *
1d53c9e6723022 Chris Mason       2019-07-10  1772  		 * This way we don't need racey decisions about who is supposed
1d53c9e6723022 Chris Mason       2019-07-10  1773  		 * to unlock it.
1d53c9e6723022 Chris Mason       2019-07-10  1774  		 */
1d53c9e6723022 Chris Mason       2019-07-10  1775  		if (locked_page) {
ec39f7696ccfac Chris Mason       2019-07-10  1776  			/*
ec39f7696ccfac Chris Mason       2019-07-10  1777  			 * Depending on the compressibility, the pages might or
ec39f7696ccfac Chris Mason       2019-07-10  1778  			 * might not go through async.  We want all of them to
ec39f7696ccfac Chris Mason       2019-07-10  1779  			 * be accounted against wbc once.  Let's do it here
ec39f7696ccfac Chris Mason       2019-07-10  1780  			 * before the paths diverge.  wbc accounting is used
ec39f7696ccfac Chris Mason       2019-07-10  1781  			 * only for foreign writeback detection and doesn't
ec39f7696ccfac Chris Mason       2019-07-10  1782  			 * need full accuracy.  Just account the whole thing
ec39f7696ccfac Chris Mason       2019-07-10  1783  			 * against the first page.
ec39f7696ccfac Chris Mason       2019-07-10  1784  			 */
ec39f7696ccfac Chris Mason       2019-07-10  1785  			wbc_account_cgroup_owner(wbc, locked_page,
ec39f7696ccfac Chris Mason       2019-07-10  1786  						 cur_end - start);
1d53c9e6723022 Chris Mason       2019-07-10  1787  			async_chunk[i].locked_page = locked_page;
1d53c9e6723022 Chris Mason       2019-07-10  1788  			locked_page = NULL;
1d53c9e6723022 Chris Mason       2019-07-10  1789  		} else {
1d53c9e6723022 Chris Mason       2019-07-10  1790  			async_chunk[i].locked_page = NULL;
1d53c9e6723022 Chris Mason       2019-07-10  1791  		}
1d53c9e6723022 Chris Mason       2019-07-10  1792  
ec39f7696ccfac Chris Mason       2019-07-10  1793  		if (blkcg_css != blkcg_root_css) {
ec39f7696ccfac Chris Mason       2019-07-10 @1794  			css_get(blkcg_css);
ec39f7696ccfac Chris Mason       2019-07-10  1795  			async_chunk[i].blkcg_css = blkcg_css;
3480373ebdf762 Christoph Hellwig 2023-03-27  1796  			async_chunk[i].write_flags |= REQ_BTRFS_CGROUP_PUNT;
ec39f7696ccfac Chris Mason       2019-07-10  1797  		} else {
ec39f7696ccfac Chris Mason       2019-07-10  1798  			async_chunk[i].blkcg_css = NULL;
ec39f7696ccfac Chris Mason       2019-07-10  1799  		}
ec39f7696ccfac Chris Mason       2019-07-10  1800  
a0cac0ec961f0d Omar Sandoval     2019-09-16  1801  		btrfs_init_work(&async_chunk[i].work, async_cow_start,
a0cac0ec961f0d Omar Sandoval     2019-09-16  1802  				async_cow_submit, async_cow_free);
771ed689d2cd53 Chris Mason       2008-11-06  1803  
97db120451e20c Nikolay Borisov   2019-03-12  1804  		nr_pages = DIV_ROUND_UP(cur_end - start, PAGE_SIZE);
0b246afa62b0cf Jeff Mahoney      2016-06-22  1805  		atomic_add(nr_pages, &fs_info->async_delalloc_pages);
771ed689d2cd53 Chris Mason       2008-11-06  1806  
97db120451e20c Nikolay Borisov   2019-03-12  1807  		btrfs_queue_work(fs_info->delalloc_workers, &async_chunk[i].work);
771ed689d2cd53 Chris Mason       2008-11-06  1808  
771ed689d2cd53 Chris Mason       2008-11-06  1809  		*nr_written += nr_pages;
771ed689d2cd53 Chris Mason       2008-11-06  1810  		start = cur_end + 1;
771ed689d2cd53 Chris Mason       2008-11-06  1811  	}
771ed689d2cd53 Chris Mason       2008-11-06  1812  	*page_started = 1;
973fb26e81a9f5 Christoph Hellwig 2023-05-31  1813  	return true;
be20aa9dbadc8c Chris Mason       2007-12-17  1814  }
be20aa9dbadc8c Chris Mason       2007-12-17  1815  

:::::: The code at line 1794 was first introduced by commit
:::::: ec39f7696ccfac85b3eea41eba7d6f747ee4ce8d Btrfs: use REQ_CGROUP_PUNT for worker thread submitted bios

:::::: TO: Chris Mason <clm@fb.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
