Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89CE1D516F
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Oct 2024 12:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729772518; cv=none; b=H1MLpTpoYj1TFXtUFFOOUyeDJtpg88QdvyEN41sTJklQWtrvsY44E7zO82GWEJfSWL1YtGXM7Y6Jm9q9K3DUDYTfpupMgEyB1qtgJilCRg7+VAuQOm7zJlgwtsP5GacvexYr3cqgvrzOm7fBX/Z4RoE28MSVkXQfURoc/wyjBM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729772518; c=relaxed/simple;
	bh=0WGqFGuDz46TFLFzDi7L70roXCo3GhNxAZJK1eq4+WY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AQ4xALvdqAzxj8REsjiJ4DNFIBFPa89aC/Ak82chgQryEJcFMC06E0OjaxOMAJDqsKdO7IdRU/mLtxb+moD5qQ7sPpKG7EYGfI6fwPmoqbSXtQhwmGhQyWIxv44iRdVniNYSMv8HhMy6Z+dS6ZsyCKZ4YSTSaw9JHWNfi35hWHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KKPklpfU; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KKPklpfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729772516; x=1761308516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0WGqFGuDz46TFLFzDi7L70roXCo3GhNxAZJK1eq4+WY=;
  b=KKPklpfU7NJ3OW8/gaRNU5c3Pa/h0rlz3uZFac4NjfTlVfDK0g5HtdyO
   cDKMQs98lH2ugcsQNa2AwNuFMoYHh3fen7FaZgvBf2WLUUkk5gHO8yDNz
   vTPa3CA5VI6NkXciwJSLhEaIbj6RoVItTQB/yeSLnOKHa9aWgRoCcFjt6
   tou4Wwxd75v05N2xhjLcpzl5PSHMIH2waG8ccQ5tlprZecZj1oYqAqjjx
   7ScBhQZFZm97xhNadP2wvnvZ9L/udUKXtUC1hU9yTWl/5A6Av6viBno3e
   egc/BB3k540/P0j7OXGXwfC2fO2hK4KaK2/WhgGI9gvlTCrTVUNrOpFAr
   g==;
X-CSE-ConnectionGUID: HyzJadHMT2GeBZlXzc+tnw==
X-CSE-MsgGUID: Ig4K+ZajS/Kalrv5ADOfcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29170019"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29170019"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 05:21:55 -0700
X-CSE-ConnectionGUID: nkE3FQXCS/ytbgI8JbTUPg==
X-CSE-MsgGUID: y4pMuLV5QUWs+cuVWYBJOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="80563045"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2024 05:21:52 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3wqc-000WOy-2s;
	Thu, 24 Oct 2024 12:21:50 +0000
Date: Thu, 24 Oct 2024 20:21:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 09/13] fuse: convert retrieves to use folios
Message-ID: <202410242024.6Gddbkwd-lkp@intel.com>
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
In-Reply-To: <20241022185443.1891563-10-joannelkoong@gmail.com>
References: <20241022185443.1891563-10-joannelkoong@gmail.com>
TO: Joanne Koong <joannelkoong@gmail.com>
TO: miklos@szeredi.hu
TO: linux-fsdevel@vger.kernel.org
CC: josef@toxicpanda.com
CC: bernd.schubert@fastmail.fm
CC: willy@infradead.org
CC: kernel-team@meta.com

Hi Joanne,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mszeredi-fuse/for-next]
[also build test WARNING on next-20241024]
[cannot apply to akpm-mm/mm-everything linus/master v6.12-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joanne-Koong/fuse-support-folios-in-struct-fuse_args_pages-and-fuse_copy_pages/20241023-025923
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/20241022185443.1891563-10-joannelkoong%40gmail.com
patch subject: [PATCH v2 09/13] fuse: convert retrieves to use folios
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242024.6Gddbkwd-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410242024.6Gddbkwd-lkp@intel.com/

New smatch warnings:
fs/fuse/dev.c:1773 fuse_retrieve() error: uninitialized symbol 'num_folios'.

Old smatch warnings:
fs/fuse/dev.c:1410 fuse_dev_do_read() warn: inconsistent returns '&fiq->lock'.

vim +/num_folios +1773 fs/fuse/dev.c

2d45ba381a74a7 Miklos Szeredi        2010-07-12  1734  
fcee216beb9c15 Max Reitz             2020-05-06  1735  static int fuse_retrieve(struct fuse_mount *fm, struct inode *inode,
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1736  			 struct fuse_notify_retrieve_out *outarg)
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1737  {
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1738  	int err;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1739  	struct address_space *mapping = inode->i_mapping;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1740  	pgoff_t index;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1741  	loff_t file_size;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1742  	unsigned int num;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1743  	unsigned int offset;
0157443c56bcc5 Geert Uytterhoeven    2010-09-30  1744  	size_t total_len = 0;
3efcf3762555d0 Joanne Koong          2024-10-22  1745  	unsigned int num_folios;
3efcf3762555d0 Joanne Koong          2024-10-22  1746  	unsigned int num_pages, cur_pages = 0;
fcee216beb9c15 Max Reitz             2020-05-06  1747  	struct fuse_conn *fc = fm->fc;
75b399dda5be1e Miklos Szeredi        2019-09-10  1748  	struct fuse_retrieve_args *ra;
75b399dda5be1e Miklos Szeredi        2019-09-10  1749  	size_t args_size = sizeof(*ra);
75b399dda5be1e Miklos Szeredi        2019-09-10  1750  	struct fuse_args_pages *ap;
75b399dda5be1e Miklos Szeredi        2019-09-10  1751  	struct fuse_args *args;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1752  
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  1753  	offset = outarg->offset & ~PAGE_MASK;
4d53dc99baf139 Maxim Patlasov        2012-10-26  1754  	file_size = i_size_read(inode);
4d53dc99baf139 Maxim Patlasov        2012-10-26  1755  
7640682e67b33c Kirill Smelkov        2019-03-27  1756  	num = min(outarg->size, fc->max_write);
4d53dc99baf139 Maxim Patlasov        2012-10-26  1757  	if (outarg->offset > file_size)
4d53dc99baf139 Maxim Patlasov        2012-10-26  1758  		num = 0;
4d53dc99baf139 Maxim Patlasov        2012-10-26  1759  	else if (outarg->offset + num > file_size)
4d53dc99baf139 Maxim Patlasov        2012-10-26  1760  		num = file_size - outarg->offset;
4d53dc99baf139 Maxim Patlasov        2012-10-26  1761  
4d53dc99baf139 Maxim Patlasov        2012-10-26  1762  	num_pages = (num + offset + PAGE_SIZE - 1) >> PAGE_SHIFT;
5da784cce4308a Constantine Shulyupin 2018-09-06  1763  	num_pages = min(num_pages, fc->max_pages);
4d53dc99baf139 Maxim Patlasov        2012-10-26  1764  
3efcf3762555d0 Joanne Koong          2024-10-22  1765  	args_size += num_pages * (sizeof(ap->folios[0]) + sizeof(ap->folio_descs[0]));
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1766  
75b399dda5be1e Miklos Szeredi        2019-09-10  1767  	ra = kzalloc(args_size, GFP_KERNEL);
75b399dda5be1e Miklos Szeredi        2019-09-10  1768  	if (!ra)
75b399dda5be1e Miklos Szeredi        2019-09-10  1769  		return -ENOMEM;
75b399dda5be1e Miklos Szeredi        2019-09-10  1770  
75b399dda5be1e Miklos Szeredi        2019-09-10  1771  	ap = &ra->ap;
3efcf3762555d0 Joanne Koong          2024-10-22  1772  	ap->folios = (void *) (ra + 1);
3efcf3762555d0 Joanne Koong          2024-10-22 @1773  	ap->folio_descs = (void *) (ap->folios + num_folios);
3efcf3762555d0 Joanne Koong          2024-10-22  1774  	ap->uses_folios = true;
75b399dda5be1e Miklos Szeredi        2019-09-10  1775  
75b399dda5be1e Miklos Szeredi        2019-09-10  1776  	args = &ap->args;
75b399dda5be1e Miklos Szeredi        2019-09-10  1777  	args->nodeid = outarg->nodeid;
75b399dda5be1e Miklos Szeredi        2019-09-10  1778  	args->opcode = FUSE_NOTIFY_REPLY;
75b399dda5be1e Miklos Szeredi        2019-09-10  1779  	args->in_numargs = 2;
75b399dda5be1e Miklos Szeredi        2019-09-10  1780  	args->in_pages = true;
75b399dda5be1e Miklos Szeredi        2019-09-10  1781  	args->end = fuse_retrieve_end;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1782  
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  1783  	index = outarg->offset >> PAGE_SHIFT;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1784  
3efcf3762555d0 Joanne Koong          2024-10-22  1785  	while (num && cur_pages < num_pages) {
0ce6e287bc7ab7 Josef Bacik           2024-09-30  1786  		struct folio *folio;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1787  		unsigned int this_num;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1788  
0ce6e287bc7ab7 Josef Bacik           2024-09-30  1789  		folio = filemap_get_folio(mapping, index);
0ce6e287bc7ab7 Josef Bacik           2024-09-30  1790  		if (IS_ERR(folio))
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1791  			break;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1792  
09cbfeaf1a5a67 Kirill A. Shutemov    2016-04-01  1793  		this_num = min_t(unsigned, num, PAGE_SIZE - offset);
3efcf3762555d0 Joanne Koong          2024-10-22  1794  		ap->folios[ap->num_folios] = folio;
3efcf3762555d0 Joanne Koong          2024-10-22  1795  		ap->folio_descs[ap->num_folios].offset = offset;
3efcf3762555d0 Joanne Koong          2024-10-22  1796  		ap->folio_descs[ap->num_folios].length = this_num;
3efcf3762555d0 Joanne Koong          2024-10-22  1797  		ap->num_folios++;
3efcf3762555d0 Joanne Koong          2024-10-22  1798  		cur_pages++;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1799  
c9e67d483776d8 Miklos Szeredi        2012-09-04  1800  		offset = 0;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1801  		num -= this_num;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1802  		total_len += this_num;
48706d0a91583d Miklos Szeredi        2011-12-13  1803  		index++;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1804  	}
75b399dda5be1e Miklos Szeredi        2019-09-10  1805  	ra->inarg.offset = outarg->offset;
75b399dda5be1e Miklos Szeredi        2019-09-10  1806  	ra->inarg.size = total_len;
75b399dda5be1e Miklos Szeredi        2019-09-10  1807  	args->in_args[0].size = sizeof(ra->inarg);
75b399dda5be1e Miklos Szeredi        2019-09-10  1808  	args->in_args[0].value = &ra->inarg;
75b399dda5be1e Miklos Szeredi        2019-09-10  1809  	args->in_args[1].size = total_len;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1810  
fcee216beb9c15 Max Reitz             2020-05-06  1811  	err = fuse_simple_notify_reply(fm, args, outarg->notify_unique);
75b399dda5be1e Miklos Szeredi        2019-09-10  1812  	if (err)
fcee216beb9c15 Max Reitz             2020-05-06  1813  		fuse_retrieve_end(fm, args, err);
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1814  
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1815  	return err;
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1816  }
2d45ba381a74a7 Miklos Szeredi        2010-07-12  1817  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
