Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE0AF28E00
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Nov 2023 15:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J67nTzX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700925214; x=1732461214;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TnlsBiG5jvMlOKxhAZd+9m9nr6oV6Lxb2kkZotaoaYU=;
  b=J67nTzX0Hdw/gqmqa+yA7kdIdUXDFz0mTwjoB4Pu98FJ3rruPeMNwoEf
   DzopVECQS8NVfnxy1S0cHsi0BhVVPx/BrphXkrA6WbE+nh4+jA3arYWH6
   2MTqCB052SWq3InGzfUwugazFfwOavy7Zex8s8DXKovAMwSCDIEFFEqEK
   fHOCbZWNZzzojjqoHI2f7VcKxveyRF31JiLovF+v3eGMu5nPyd6+jMOzr
   v7cc51PTqyiAG4JAh4sTDltRYrXVCkQZHY6IbwKNLK89WpIfuGD7Lx7s+
   taRgf9b5ldodZfjzyjzzTSFb5RI5I63eBVpjPmPIlPyDYrjuU18375Irq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="396424279"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="396424279"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 07:13:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="1099352261"
X-IronPort-AV: E=Sophos;i="6.04,226,1695711600"; 
   d="scan'208";a="1099352261"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 25 Nov 2023 07:13:32 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6uLa-00047E-05;
	Sat, 25 Nov 2023 15:13:30 +0000
Date: Sat, 25 Nov 2023 23:13:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hch-xfs:xfs-zoned 36/65] fs/iomap/buffered-io.c:2127
 iomap_rewrite_range() error: uninitialized symbol 'folio_end'.
Message-ID: <202311252130.sO3YytsF-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   f5b3c0ffa575a5035e6d607b616c05638ed48937
commit: cc4a639e3052fefb385f63a0db5dfe07db4e9d58 [36/65] iomap: add a iomap_rewrite_range helper
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: x86_64-randconfig-161-20231125 (https://download.01.org/0day-ci/archive/20231125/202311252130.sO3YytsF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231125/202311252130.sO3YytsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311252130.sO3YytsF-lkp@intel.com/

New smatch warnings:
fs/iomap/buffered-io.c:2127 iomap_rewrite_range() error: uninitialized symbol 'folio_end'.

Old smatch warnings:
fs/iomap/buffered-io.c:1762 iomap_add_to_ioend() error: we previously assumed 'wpc->ioend' could be null (see line 1739)

vim +/folio_end +2127 fs/iomap/buffered-io.c

cc4a639e3052fe Christoph Hellwig 2023-11-24  2074  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2075  int
cc4a639e3052fe Christoph Hellwig 2023-11-24  2076  iomap_rewrite_range(struct address_space *mapping, loff_t pos, size_t len,
cc4a639e3052fe Christoph Hellwig 2023-11-24  2077  		struct iomap_writepage_ctx *wpc)
cc4a639e3052fe Christoph Hellwig 2023-11-24  2078  {
cc4a639e3052fe Christoph Hellwig 2023-11-24  2079  	struct inode *inode = mapping->host;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2080  	u64 end_pos = pos + len;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2081  	int error = 0;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2082  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2083  	inode_attach_wb(inode, NULL);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2084  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2085  	while (pos < end_pos) {
cc4a639e3052fe Christoph Hellwig 2023-11-24  2086  		struct folio *folio;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2087  		unsigned count = 0;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2088  		u64 folio_end;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2089  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2090  		folio = iomap_read_mapping_page(mapping, pos, end_pos);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2091  		if (IS_ERR(folio)) {
cc4a639e3052fe Christoph Hellwig 2023-11-24  2092  			error = PTR_ERR(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2093  			break;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2094  		}
cc4a639e3052fe Christoph Hellwig 2023-11-24  2095  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2096  		folio_lock(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2097  		if (folio->mapping != mapping) {
cc4a639e3052fe Christoph Hellwig 2023-11-24  2098  			folio_unlock(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2099  			goto folio_put;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2100  		}
cc4a639e3052fe Christoph Hellwig 2023-11-24  2101  		folio_end = folio_pos(folio) + folio_size(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2102  		len = min(folio_end, end_pos) - pos;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2103  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2104  		folio_wait_writeback(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2105  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2106  		/*
cc4a639e3052fe Christoph Hellwig 2023-11-24  2107  		 * If we're writing out the whole folio, clear the dirty bit.
cc4a639e3052fe Christoph Hellwig 2023-11-24  2108  		 */
cc4a639e3052fe Christoph Hellwig 2023-11-24  2109  		if (folio_test_dirty(folio) &&
cc4a639e3052fe Christoph Hellwig 2023-11-24  2110  		    folio_pos(folio) == pos && folio_end == end_pos)
cc4a639e3052fe Christoph Hellwig 2023-11-24  2111  			folio_clear_dirty(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2112  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2113  		iomap_start_writeback(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2114  		error = iomap_writepage_map_blocks(wpc, NULL, inode, folio, pos,
cc4a639e3052fe Christoph Hellwig 2023-11-24  2115  				len, &count);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2116  		if (count)
cc4a639e3052fe Christoph Hellwig 2023-11-24  2117  			wpc->nr_folios++;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2118  		if (!error) {
cc4a639e3052fe Christoph Hellwig 2023-11-24  2119  			iomap_clear_range_dirty(folio,
cc4a639e3052fe Christoph Hellwig 2023-11-24  2120  				offset_in_folio(folio, pos), len);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2121  		}
cc4a639e3052fe Christoph Hellwig 2023-11-24  2122  		iomap_end_writeback(folio, count);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2123  folio_put:
cc4a639e3052fe Christoph Hellwig 2023-11-24  2124  		folio_put(folio);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2125  		if (error)
cc4a639e3052fe Christoph Hellwig 2023-11-24  2126  			break;
cc4a639e3052fe Christoph Hellwig 2023-11-24 @2127  		pos = folio_end;
cc4a639e3052fe Christoph Hellwig 2023-11-24  2128  	}
cc4a639e3052fe Christoph Hellwig 2023-11-24  2129  
cc4a639e3052fe Christoph Hellwig 2023-11-24  2130  	return iomap_submit_ioend(wpc, error);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2131  }
cc4a639e3052fe Christoph Hellwig 2023-11-24  2132  EXPORT_SYMBOL_GPL(iomap_rewrite_range);
cc4a639e3052fe Christoph Hellwig 2023-11-24  2133  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
