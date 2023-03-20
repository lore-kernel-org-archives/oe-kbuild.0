Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372ED10E5
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Mar 2023 05:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679289813; x=1710825813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1SngVUAfOFQki5qICVqPdwn67W6m4GmJtFGCesP1IkY=;
  b=fzNZmpZ4SNaxpCKGZAAylC2KkEcRKNL6HzsZBGRZJqtgB7kNmEb0UiV+
   HDAOWne9NbTr95CmE+rT8FIjC80vE3IisueZgz9N2BBX4R/qcBwPJzrwY
   PHcueGnNmzVTwbPO/ZvtV+hHNMpjhSTpODg/v/eyki8WKYbdvj+guLHmC
   rQgBLUrzDMaLi4D8/bu++XBSRbv/hEU2BaDsseK42KfdlgZaM99XDHsIH
   AUAu3snes1kL1fYdhKn7WPJxiTnh3bFpSs7NGehN8soMuvWHbJDAHA+Vy
   lOtId1tfWtQ88KCif1wrB7J3r1qt7TL17u60DzvaerG+MNjwqyKqs8d0x
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="322418967"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="322418967"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 22:23:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="855162865"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="855162865"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Mar 2023 22:23:31 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pe7zW-000AqE-1W;
	Mon, 20 Mar 2023 05:23:30 +0000
Date: Mon, 20 Mar 2023 13:23:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: fs/erofs/fscache.c:226 erofs_fscache_meta_read_folio() warn: passing
 a valid pointer to 'PTR_ERR'
Message-ID: <202303201347.CUVG0SPi-lkp@intel.com>
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
TO: Sun Ke <sunke32@huawei.com>
CC: Gao Xiang <xiang@kernel.org>
CC: Jingbo Xu <jefflexu@linux.alibaba.com>
CC: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e8d018dd0257f744ca50a729e3d042cf2ec9da65
commit: 5bd9628b784cc5e38e1c7ebb680bbd6ee741230e erofs: fix error return code in erofs_fscache_{meta_,}read_folio
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230320/202303201347.CUVG0SPi-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303201347.CUVG0SPi-lkp@intel.com/

smatch warnings:
fs/erofs/fscache.c:226 erofs_fscache_meta_read_folio() warn: passing a valid pointer to 'PTR_ERR'
fs/erofs/fscache.c:307 erofs_fscache_read_folio() warn: passing a valid pointer to 'PTR_ERR'

vim +/PTR_ERR +226 fs/erofs/fscache.c

ec00b5e29ce3a2 Jeffle Xu      2022-04-25  208  
fdaf9a5840acaa Linus Torvalds 2022-05-24  209  static int erofs_fscache_meta_read_folio(struct file *data, struct folio *folio)
5375e7c8b0fef1 Jeffle Xu      2022-04-25  210  {
5375e7c8b0fef1 Jeffle Xu      2022-04-25  211  	int ret;
5375e7c8b0fef1 Jeffle Xu      2022-04-25  212  	struct super_block *sb = folio_mapping(folio)->host->i_sb;
d435d53228dd03 Xin Yin        2022-05-09  213  	struct netfs_io_request *rreq;
5375e7c8b0fef1 Jeffle Xu      2022-04-25  214  	struct erofs_map_dev mdev = {
5375e7c8b0fef1 Jeffle Xu      2022-04-25  215  		.m_deviceid = 0,
5375e7c8b0fef1 Jeffle Xu      2022-04-25  216  		.m_pa = folio_pos(folio),
5375e7c8b0fef1 Jeffle Xu      2022-04-25  217  	};
5375e7c8b0fef1 Jeffle Xu      2022-04-25  218  
5375e7c8b0fef1 Jeffle Xu      2022-04-25  219  	ret = erofs_map_dev(sb, &mdev);
5375e7c8b0fef1 Jeffle Xu      2022-04-25  220  	if (ret)
5375e7c8b0fef1 Jeffle Xu      2022-04-25  221  		goto out;
5375e7c8b0fef1 Jeffle Xu      2022-04-25  222  
d435d53228dd03 Xin Yin        2022-05-09  223  	rreq = erofs_fscache_alloc_request(folio_mapping(folio),
d435d53228dd03 Xin Yin        2022-05-09  224  				folio_pos(folio), folio_size(folio));
5bd9628b784cc5 Sun Ke         2022-08-15  225  	if (IS_ERR(rreq)) {
5bd9628b784cc5 Sun Ke         2022-08-15 @226  		ret = PTR_ERR(rreq);
d435d53228dd03 Xin Yin        2022-05-09  227  		goto out;
5bd9628b784cc5 Sun Ke         2022-08-15  228  	}
d435d53228dd03 Xin Yin        2022-05-09  229  
d435d53228dd03 Xin Yin        2022-05-09  230  	return erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
d435d53228dd03 Xin Yin        2022-05-09  231  				rreq, mdev.m_pa);
5375e7c8b0fef1 Jeffle Xu      2022-04-25  232  out:
5375e7c8b0fef1 Jeffle Xu      2022-04-25  233  	folio_unlock(folio);
5375e7c8b0fef1 Jeffle Xu      2022-04-25  234  	return ret;
5375e7c8b0fef1 Jeffle Xu      2022-04-25  235  }
5375e7c8b0fef1 Jeffle Xu      2022-04-25  236  
fdaf9a5840acaa Linus Torvalds 2022-05-24  237  static int erofs_fscache_read_folio_inline(struct folio *folio,
bd735bdaa62fb6 Jeffle Xu      2022-04-25  238  					 struct erofs_map_blocks *map)
bd735bdaa62fb6 Jeffle Xu      2022-04-25  239  {
bd735bdaa62fb6 Jeffle Xu      2022-04-25  240  	struct super_block *sb = folio_mapping(folio)->host->i_sb;
bd735bdaa62fb6 Jeffle Xu      2022-04-25  241  	struct erofs_buf buf = __EROFS_BUF_INITIALIZER;
bd735bdaa62fb6 Jeffle Xu      2022-04-25  242  	erofs_blk_t blknr;
bd735bdaa62fb6 Jeffle Xu      2022-04-25  243  	size_t offset, len;
bd735bdaa62fb6 Jeffle Xu      2022-04-25  244  	void *src, *dst;
bd735bdaa62fb6 Jeffle Xu      2022-04-25  245  
bd735bdaa62fb6 Jeffle Xu      2022-04-25  246  	/* For tail packing layout, the offset may be non-zero. */
bd735bdaa62fb6 Jeffle Xu      2022-04-25  247  	offset = erofs_blkoff(map->m_pa);
bd735bdaa62fb6 Jeffle Xu      2022-04-25  248  	blknr = erofs_blknr(map->m_pa);
bd735bdaa62fb6 Jeffle Xu      2022-04-25  249  	len = map->m_llen;
bd735bdaa62fb6 Jeffle Xu      2022-04-25  250  
bd735bdaa62fb6 Jeffle Xu      2022-04-25  251  	src = erofs_read_metabuf(&buf, sb, blknr, EROFS_KMAP);
bd735bdaa62fb6 Jeffle Xu      2022-04-25  252  	if (IS_ERR(src))
bd735bdaa62fb6 Jeffle Xu      2022-04-25  253  		return PTR_ERR(src);
bd735bdaa62fb6 Jeffle Xu      2022-04-25  254  
bd735bdaa62fb6 Jeffle Xu      2022-04-25  255  	dst = kmap_local_folio(folio, 0);
bd735bdaa62fb6 Jeffle Xu      2022-04-25  256  	memcpy(dst, src + offset, len);
bd735bdaa62fb6 Jeffle Xu      2022-04-25  257  	memset(dst + len, 0, PAGE_SIZE - len);
bd735bdaa62fb6 Jeffle Xu      2022-04-25  258  	kunmap_local(dst);
bd735bdaa62fb6 Jeffle Xu      2022-04-25  259  
bd735bdaa62fb6 Jeffle Xu      2022-04-25  260  	erofs_put_metabuf(&buf);
bd735bdaa62fb6 Jeffle Xu      2022-04-25  261  	return 0;
bd735bdaa62fb6 Jeffle Xu      2022-04-25  262  }
bd735bdaa62fb6 Jeffle Xu      2022-04-25  263  
fdaf9a5840acaa Linus Torvalds 2022-05-24  264  static int erofs_fscache_read_folio(struct file *file, struct folio *folio)
1442b02b66ad2c Jeffle Xu      2022-04-25  265  {
1442b02b66ad2c Jeffle Xu      2022-04-25  266  	struct inode *inode = folio_mapping(folio)->host;
1442b02b66ad2c Jeffle Xu      2022-04-25  267  	struct super_block *sb = inode->i_sb;
1442b02b66ad2c Jeffle Xu      2022-04-25  268  	struct erofs_map_blocks map;
1442b02b66ad2c Jeffle Xu      2022-04-25  269  	struct erofs_map_dev mdev;
d435d53228dd03 Xin Yin        2022-05-09  270  	struct netfs_io_request *rreq;
1442b02b66ad2c Jeffle Xu      2022-04-25  271  	erofs_off_t pos;
1442b02b66ad2c Jeffle Xu      2022-04-25  272  	loff_t pstart;
1442b02b66ad2c Jeffle Xu      2022-04-25  273  	int ret;
1442b02b66ad2c Jeffle Xu      2022-04-25  274  
1442b02b66ad2c Jeffle Xu      2022-04-25  275  	DBG_BUGON(folio_size(folio) != EROFS_BLKSIZ);
1442b02b66ad2c Jeffle Xu      2022-04-25  276  
1442b02b66ad2c Jeffle Xu      2022-04-25  277  	pos = folio_pos(folio);
1442b02b66ad2c Jeffle Xu      2022-04-25  278  	map.m_la = pos;
1442b02b66ad2c Jeffle Xu      2022-04-25  279  
1442b02b66ad2c Jeffle Xu      2022-04-25  280  	ret = erofs_map_blocks(inode, &map, EROFS_GET_BLOCKS_RAW);
1442b02b66ad2c Jeffle Xu      2022-04-25  281  	if (ret)
1442b02b66ad2c Jeffle Xu      2022-04-25  282  		goto out_unlock;
1442b02b66ad2c Jeffle Xu      2022-04-25  283  
1442b02b66ad2c Jeffle Xu      2022-04-25  284  	if (!(map.m_flags & EROFS_MAP_MAPPED)) {
1442b02b66ad2c Jeffle Xu      2022-04-25  285  		folio_zero_range(folio, 0, folio_size(folio));
1442b02b66ad2c Jeffle Xu      2022-04-25  286  		goto out_uptodate;
1442b02b66ad2c Jeffle Xu      2022-04-25  287  	}
1442b02b66ad2c Jeffle Xu      2022-04-25  288  
bd735bdaa62fb6 Jeffle Xu      2022-04-25  289  	if (map.m_flags & EROFS_MAP_META) {
fdaf9a5840acaa Linus Torvalds 2022-05-24  290  		ret = erofs_fscache_read_folio_inline(folio, &map);
bd735bdaa62fb6 Jeffle Xu      2022-04-25  291  		goto out_uptodate;
bd735bdaa62fb6 Jeffle Xu      2022-04-25  292  	}
bd735bdaa62fb6 Jeffle Xu      2022-04-25  293  
1442b02b66ad2c Jeffle Xu      2022-04-25  294  	mdev = (struct erofs_map_dev) {
1442b02b66ad2c Jeffle Xu      2022-04-25  295  		.m_deviceid = map.m_deviceid,
1442b02b66ad2c Jeffle Xu      2022-04-25  296  		.m_pa = map.m_pa,
1442b02b66ad2c Jeffle Xu      2022-04-25  297  	};
1442b02b66ad2c Jeffle Xu      2022-04-25  298  
1442b02b66ad2c Jeffle Xu      2022-04-25  299  	ret = erofs_map_dev(sb, &mdev);
1442b02b66ad2c Jeffle Xu      2022-04-25  300  	if (ret)
1442b02b66ad2c Jeffle Xu      2022-04-25  301  		goto out_unlock;
1442b02b66ad2c Jeffle Xu      2022-04-25  302  
d435d53228dd03 Xin Yin        2022-05-09  303  
d435d53228dd03 Xin Yin        2022-05-09  304  	rreq = erofs_fscache_alloc_request(folio_mapping(folio),
d435d53228dd03 Xin Yin        2022-05-09  305  				folio_pos(folio), folio_size(folio));
5bd9628b784cc5 Sun Ke         2022-08-15  306  	if (IS_ERR(rreq)) {
5bd9628b784cc5 Sun Ke         2022-08-15 @307  		ret = PTR_ERR(rreq);
d435d53228dd03 Xin Yin        2022-05-09  308  		goto out_unlock;
5bd9628b784cc5 Sun Ke         2022-08-15  309  	}
d435d53228dd03 Xin Yin        2022-05-09  310  
1442b02b66ad2c Jeffle Xu      2022-04-25  311  	pstart = mdev.m_pa + (pos - map.m_la);
d435d53228dd03 Xin Yin        2022-05-09  312  	return erofs_fscache_read_folios_async(mdev.m_fscache->cookie,
d435d53228dd03 Xin Yin        2022-05-09  313  				rreq, pstart);
1442b02b66ad2c Jeffle Xu      2022-04-25  314  
1442b02b66ad2c Jeffle Xu      2022-04-25  315  out_uptodate:
1442b02b66ad2c Jeffle Xu      2022-04-25  316  	if (!ret)
1442b02b66ad2c Jeffle Xu      2022-04-25  317  		folio_mark_uptodate(folio);
1442b02b66ad2c Jeffle Xu      2022-04-25  318  out_unlock:
1442b02b66ad2c Jeffle Xu      2022-04-25  319  	folio_unlock(folio);
1442b02b66ad2c Jeffle Xu      2022-04-25  320  	return ret;
1442b02b66ad2c Jeffle Xu      2022-04-25  321  }
1442b02b66ad2c Jeffle Xu      2022-04-25  322  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
