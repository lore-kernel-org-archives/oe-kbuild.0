Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A64018411E
	for <oe-kbuild@lists.linux.dev>; Wed, 29 May 2024 16:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000772; cv=none; b=c+r65zm+AJrei9Z9f9sCcEVmNjucKHZih/YWVFgDTccMdXinojMK2ej+9uYuAvzCogY4t0v2bNMX44x5xK75KyILgerSV1zRqyNPPP1C3+npynP9IycOollFzxlWq2f0gDQPBprKGz4zMsUCVhJIf4qT4OWgzdrIH1xFjWuFWKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000772; c=relaxed/simple;
	bh=pjnJMVf/6cVXHao975M1GE6CKVeelqmCfa3iYoZEd7w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UkU7Pet3C5Vx6jbQQt3OA7dpuX4kb6f8XoWlOktHysw7TZB9gRMGTUKfqL1knm6lrvgNt0YZg5jRkqdwpIyrY/eTMxQacsU15TNh9i/0JlJ4/h+tk/vxZVQEQVIW2xIz2xoLTUmBkDT5OTSoX9LO73bD4ONnzBDHk8S/kZi1HtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BtEt/9Nm; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BtEt/9Nm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717000771; x=1748536771;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pjnJMVf/6cVXHao975M1GE6CKVeelqmCfa3iYoZEd7w=;
  b=BtEt/9NmPQptDCB6N092PHCP+4bfySzOHEFS6e3B1VoyIk1RgONFnsqT
   OZfjSYIaMkglAe1/bAsWDYNRMaNL/yQvDeqxxdmpv0Q7Mt8UJd6Eaf0sp
   s5F28FBxIyTXbEToFY5EsV/O1ckrVerLkeJfbN5CPR7Ar3w/7oPvlVonh
   pUTcUXBo1FjwuOPGQix6BbTWjRbvlCXG6fulexkyJS2csoI3v4kk2WkPl
   4VFTiDKelgt6f0rmlnFlxc88P1FVaDbxYv9jgYP0n1MXLOd6U/ytwlixw
   ZdscjlXgJG5jB7d8qBuZhEzQS2qvAJEWkMunGtz586xBpAwzz1hUodHRC
   g==;
X-CSE-ConnectionGUID: Fh2yF3YVRsWnNWAhvvYv/g==
X-CSE-MsgGUID: Ee8OlP1jTLW9CJYaAKZE2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24551603"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="24551603"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 09:39:30 -0700
X-CSE-ConnectionGUID: EVQHwQilRYem5bnkPB9bSQ==
X-CSE-MsgGUID: bQrabHEaSb28P1NaJe11Zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; 
   d="scan'208";a="35961670"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 May 2024 09:39:29 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCMKk-000Dx5-1j;
	Wed, 29 May 2024 16:39:26 +0000
Date: Thu, 30 May 2024 00:39:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 7/7] iomap: Return the folio from iomap_write_begin()
Message-ID: <202405300028.ZTOIuctX-lkp@intel.com>
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
In-Reply-To: <20240528164829.2105447-8-willy@infradead.org>
References: <20240528164829.2105447-8-willy@infradead.org>
TO: "Matthew Wilcox (Oracle)" <willy@infradead.org>
TO: Christoph Hellwig <hch@lst.de>
CC: "Matthew Wilcox (Oracle)" <willy@infradead.org>
CC: linux-fsdevel@vger.kernel.org
CC: linux-ext4@vger.kernel.org

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.10-rc1 next-20240529]
[cannot apply to tytso-ext4/dev jack-fs/for_next hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Wilcox-Oracle/fs-Introduce-buffered_write_operations/20240529-005213
base:   linus/master
patch link:    https://lore.kernel.org/r/20240528164829.2105447-8-willy%40infradead.org
patch subject: [PATCH 7/7] iomap: Return the folio from iomap_write_begin()
:::::: branch date: 24 hours ago
:::::: commit date: 24 hours ago
config: openrisc-randconfig-r081-20240529 (https://download.01.org/0day-ci/archive/20240530/202405300028.ZTOIuctX-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202405300028.ZTOIuctX-lkp@intel.com/

smatch warnings:
fs/iomap/buffered-io.c:826 iomap_write_begin() error: uninitialized symbol 'status'.

vim +/status +826 fs/iomap/buffered-io.c

69f4a26c1e0c7c Gao Xiang               2021-08-03  766  
07d07cfe38427e Matthew Wilcox (Oracle  2024-05-28  767) static struct folio *iomap_write_begin(struct iomap_iter *iter, loff_t pos,
07d07cfe38427e Matthew Wilcox (Oracle  2024-05-28  768) 		size_t len)
afc51aaa22f26c Darrick J. Wong         2019-07-15  769  {
471859f57d4253 Andreas Gruenbacher     2023-01-15  770  	const struct iomap_folio_ops *folio_ops = iter->iomap.folio_ops;
fad0a1ab34f777 Christoph Hellwig       2021-08-10  771  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
d1bd0b4ebfe052 Matthew Wilcox (Oracle  2021-11-03  772) 	struct folio *folio;
07d07cfe38427e Matthew Wilcox (Oracle  2024-05-28  773) 	int status;
afc51aaa22f26c Darrick J. Wong         2019-07-15  774  
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  775  	BUG_ON(pos + len > iter->iomap.offset + iter->iomap.length);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  776  	if (srcmap != &iter->iomap)
c039b997927263 Goldwyn Rodrigues       2019-10-18  777  		BUG_ON(pos + len > srcmap->offset + srcmap->length);
afc51aaa22f26c Darrick J. Wong         2019-07-15  778  
afc51aaa22f26c Darrick J. Wong         2019-07-15  779  	if (fatal_signal_pending(current))
07d07cfe38427e Matthew Wilcox (Oracle  2024-05-28  780) 		return ERR_PTR(-EINTR);
afc51aaa22f26c Darrick J. Wong         2019-07-15  781  
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  782) 	if (!mapping_large_folio_support(iter->inode->i_mapping))
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  783) 		len = min_t(size_t, len, PAGE_SIZE - offset_in_page(pos));
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  784) 
07c22b56685dd7 Andreas Gruenbacher     2023-01-15  785  	folio = __iomap_get_folio(iter, pos, len);
9060bc4d3aca61 Andreas Gruenbacher     2023-01-15  786  	if (IS_ERR(folio))
07d07cfe38427e Matthew Wilcox (Oracle  2024-05-28  787) 		return folio;
d7b64041164ca1 Dave Chinner            2022-11-29  788  
d7b64041164ca1 Dave Chinner            2022-11-29  789  	/*
d7b64041164ca1 Dave Chinner            2022-11-29  790  	 * Now we have a locked folio, before we do anything with it we need to
d7b64041164ca1 Dave Chinner            2022-11-29  791  	 * check that the iomap we have cached is not stale. The inode extent
d7b64041164ca1 Dave Chinner            2022-11-29  792  	 * mapping can change due to concurrent IO in flight (e.g.
d7b64041164ca1 Dave Chinner            2022-11-29  793  	 * IOMAP_UNWRITTEN state can change and memory reclaim could have
d7b64041164ca1 Dave Chinner            2022-11-29  794  	 * reclaimed a previously partially written page at this index after IO
d7b64041164ca1 Dave Chinner            2022-11-29  795  	 * completion before this write reaches this file offset) and hence we
d7b64041164ca1 Dave Chinner            2022-11-29  796  	 * could do the wrong thing here (zero a page range incorrectly or fail
d7b64041164ca1 Dave Chinner            2022-11-29  797  	 * to zero) and corrupt data.
d7b64041164ca1 Dave Chinner            2022-11-29  798  	 */
471859f57d4253 Andreas Gruenbacher     2023-01-15  799  	if (folio_ops && folio_ops->iomap_valid) {
471859f57d4253 Andreas Gruenbacher     2023-01-15  800  		bool iomap_valid = folio_ops->iomap_valid(iter->inode,
d7b64041164ca1 Dave Chinner            2022-11-29  801  							 &iter->iomap);
d7b64041164ca1 Dave Chinner            2022-11-29  802  		if (!iomap_valid) {
d7b64041164ca1 Dave Chinner            2022-11-29  803  			iter->iomap.flags |= IOMAP_F_STALE;
d7b64041164ca1 Dave Chinner            2022-11-29  804  			goto out_unlock;
d7b64041164ca1 Dave Chinner            2022-11-29  805  		}
d7b64041164ca1 Dave Chinner            2022-11-29  806  	}
d7b64041164ca1 Dave Chinner            2022-11-29  807  
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  808) 	if (pos + len > folio_pos(folio) + folio_size(folio))
d454ab82bc7f4a Matthew Wilcox (Oracle  2021-12-09  809) 		len = folio_pos(folio) + folio_size(folio) - pos;
afc51aaa22f26c Darrick J. Wong         2019-07-15  810  
c039b997927263 Goldwyn Rodrigues       2019-10-18  811  	if (srcmap->type == IOMAP_INLINE)
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  812) 		status = iomap_write_begin_inline(iter, folio);
1b5c1e36dc0e0f Christoph Hellwig       2021-08-10  813  	else if (srcmap->flags & IOMAP_F_BUFFER_HEAD)
d1bd0b4ebfe052 Matthew Wilcox (Oracle  2021-11-03  814) 		status = __block_write_begin_int(folio, pos, len, NULL, srcmap);
afc51aaa22f26c Darrick J. Wong         2019-07-15  815  	else
bc6123a84a71b5 Matthew Wilcox (Oracle  2021-05-02  816) 		status = __iomap_write_begin(iter, pos, len, folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  817  
afc51aaa22f26c Darrick J. Wong         2019-07-15  818  	if (unlikely(status))
afc51aaa22f26c Darrick J. Wong         2019-07-15  819  		goto out_unlock;
afc51aaa22f26c Darrick J. Wong         2019-07-15  820  
07d07cfe38427e Matthew Wilcox (Oracle  2024-05-28  821) 	return folio;
afc51aaa22f26c Darrick J. Wong         2019-07-15  822  
afc51aaa22f26c Darrick J. Wong         2019-07-15  823  out_unlock:
7a70a5085ed028 Andreas Gruenbacher     2023-01-15  824  	__iomap_put_folio(iter, pos, 0, folio);
afc51aaa22f26c Darrick J. Wong         2019-07-15  825  
07d07cfe38427e Matthew Wilcox (Oracle  2024-05-28 @826) 	return ERR_PTR(status);
afc51aaa22f26c Darrick J. Wong         2019-07-15  827  }
afc51aaa22f26c Darrick J. Wong         2019-07-15  828  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
