Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67A01DFCB
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 21:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705699820; cv=none; b=IlTwnLHad10EAH+VWMxa+u5lXpCulk2waRrBCkGP7QRhPE+Xq2hHEqXlN3iun9zhojYCK5eJCzEhoIPq5aH5yRjGkAhjXyUMoggLVIgC2yfUCyMqWqrmBEnfQt0QEoES4uKMpVbZPmAXJO6rq88XHBlwap+8sNwBb70QTDoeyXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705699820; c=relaxed/simple;
	bh=iLXAs1bfl7yhy93tskzivUQwzBpDOjNNR4EvWmrfxZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=epQPaaJfYN0D7RdWq1LZeJPwAZm/xxqIluNOYkod+PZAKCmj3gD/8pcAqTzTM+b44ycyM3KJAoxcqXHxY6HHNyGFaSQ8Mlkk8LcFxY7L8Ceg0zCBPW9I7wUXCXD/r2SeXBE8ZZRxDjcY1W5X/zaEmCPmnvJYN75vSvmmt+iwGeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eR7YY7wt; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eR7YY7wt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705699817; x=1737235817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iLXAs1bfl7yhy93tskzivUQwzBpDOjNNR4EvWmrfxZU=;
  b=eR7YY7wtI6ZKZuvNpy637dFPlKGjXPRjYwDkirVIWS9hdnETe9Wfvcwp
   1sINGZxazHKzW0JMLqQ2wBggBgKGlopRLcCG1TGYk0S4lIaT0Ff4JAJ+N
   1K2p2eZOKPyD5LqlD5k16s7S+qUv4bT1jebnzywRZszng29Mad5OjXunh
   OZ6UjA1oj4QtIcIYzi5W9Teai9CB+9SHYmEkX+a68kfY+LZKSnKZn1KnJ
   xDh7+7lOlX2ZfrGRYuVWk3YYih4kjAeCDN1ST213a6SJUQuYdtciQY34n
   9Djkw9aT5GOUc2ulGjoIcqM7jmMtQ/cVSOn5z2Ft8phyJuNs90kVIdwN3
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="404611158"
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="404611158"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2024 13:30:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,206,1701158400"; 
   d="scan'208";a="672345"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2024 13:30:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQwRJ-0004RM-21;
	Fri, 19 Jan 2024 21:30:13 +0000
Date: Sat, 20 Jan 2024 05:29:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.6/linux 326/333] drivers/dma-buf/udmabuf.c:292
 udmabuf_create() error: uninitialized symbol 'mapidx'.
Message-ID: <202401200538.WfDANVQF-lkp@intel.com>
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
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: Junxiao Chang <junxiao.chang@intel.com>

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   9fe58986e8674d72a73d6e5c010afea625409635
commit: 6c62382bf45b08ce9f104a230b5bc84a1841d90c [326/333] udmabuf: Add back support for mapping hugetlb pages (v3)
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-161-20240119 (https://download.01.org/0day-ci/archive/20240120/202401200538.WfDANVQF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401200538.WfDANVQF-lkp@intel.com/

New smatch warnings:
drivers/dma-buf/udmabuf.c:292 udmabuf_create() error: uninitialized symbol 'mapidx'.

Old smatch warnings:
drivers/dma-buf/udmabuf.c:301 udmabuf_create() error: uninitialized symbol 'chunkoff'.
drivers/dma-buf/udmabuf.c:302 udmabuf_create() error: uninitialized symbol 'maxchunks'.

vim +/mapidx +292 drivers/dma-buf/udmabuf.c

fbb0de79507819 Gerd Hoffmann       2018-08-27  213  
c1bbed66899726 Gurchetan Singh     2019-12-02  214  static long udmabuf_create(struct miscdevice *device,
c1bbed66899726 Gurchetan Singh     2019-12-02  215  			   struct udmabuf_create_list *head,
c1bbed66899726 Gurchetan Singh     2019-12-02  216  			   struct udmabuf_create_item *list)
fbb0de79507819 Gerd Hoffmann       2018-08-27  217  {
fbb0de79507819 Gerd Hoffmann       2018-08-27  218  	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
fbb0de79507819 Gerd Hoffmann       2018-08-27  219  	struct file *memfd = NULL;
16c243e99d335e Vivek Kasireddy     2021-06-09  220  	struct address_space *mapping = NULL;
fbb0de79507819 Gerd Hoffmann       2018-08-27  221  	struct udmabuf *ubuf;
fbb0de79507819 Gerd Hoffmann       2018-08-27  222  	struct dma_buf *buf;
0d17455ca85ecb Gerd Hoffmann       2018-09-11  223  	pgoff_t pgoff, pgcnt, pgidx, pgbuf = 0, pglimit;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  224  	struct page *page, *hpage = NULL;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  225  	pgoff_t mapidx, chunkoff, maxchunks;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  226  	struct hstate *hpstate;
fbb0de79507819 Gerd Hoffmann       2018-08-27  227  	int seals, ret = -EINVAL;
fbb0de79507819 Gerd Hoffmann       2018-08-27  228  	u32 i, flags;
fbb0de79507819 Gerd Hoffmann       2018-08-27  229  
33f35429fc49c0 Gerd Hoffmann       2018-09-11  230  	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
fbb0de79507819 Gerd Hoffmann       2018-08-27  231  	if (!ubuf)
fbb0de79507819 Gerd Hoffmann       2018-08-27  232  		return -ENOMEM;
fbb0de79507819 Gerd Hoffmann       2018-08-27  233  
dc4716d75154b3 Gerd Hoffmann       2018-09-11  234  	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  235  	for (i = 0; i < head->count; i++) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  236  		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  237  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  238  		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  239  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  240  		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
dc4716d75154b3 Gerd Hoffmann       2018-09-11  241  		if (ubuf->pagecount > pglimit)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  242  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  243  	}
2b6dd600dd7257 Pavel Skripkin      2021-12-30  244  
2b6dd600dd7257 Pavel Skripkin      2021-12-30  245  	if (!ubuf->pagecount)
2b6dd600dd7257 Pavel Skripkin      2021-12-30  246  		goto err;
2b6dd600dd7257 Pavel Skripkin      2021-12-30  247  
33f35429fc49c0 Gerd Hoffmann       2018-09-11  248  	ubuf->pages = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->pages),
fbb0de79507819 Gerd Hoffmann       2018-08-27  249  				    GFP_KERNEL);
fbb0de79507819 Gerd Hoffmann       2018-08-27  250  	if (!ubuf->pages) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  251  		ret = -ENOMEM;
0d17455ca85ecb Gerd Hoffmann       2018-09-11  252  		goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  253  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  254  
fbb0de79507819 Gerd Hoffmann       2018-08-27  255  	pgbuf = 0;
fbb0de79507819 Gerd Hoffmann       2018-08-27  256  	for (i = 0; i < head->count; i++) {
7a1c67d7809423 Gerd Hoffmann       2018-09-11  257  		ret = -EBADFD;
fbb0de79507819 Gerd Hoffmann       2018-08-27  258  		memfd = fget(list[i].memfd);
fbb0de79507819 Gerd Hoffmann       2018-08-27  259  		if (!memfd)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  260  			goto err;
ff58105a47ede2 Al Viro             2022-08-20  261  		mapping = memfd->f_mapping;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  262  		if (!shmem_mapping(mapping) && !is_file_hugepages(memfd))
0d17455ca85ecb Gerd Hoffmann       2018-09-11  263  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  264  		seals = memfd_fcntl(memfd, F_GET_SEALS, 0);
7a1c67d7809423 Gerd Hoffmann       2018-09-11  265  		if (seals == -EINVAL)
7a1c67d7809423 Gerd Hoffmann       2018-09-11  266  			goto err;
7a1c67d7809423 Gerd Hoffmann       2018-09-11  267  		ret = -EINVAL;
7a1c67d7809423 Gerd Hoffmann       2018-09-11  268  		if ((seals & SEALS_WANTED) != SEALS_WANTED ||
fbb0de79507819 Gerd Hoffmann       2018-08-27  269  		    (seals & SEALS_DENIED) != 0)
0d17455ca85ecb Gerd Hoffmann       2018-09-11  270  			goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  271  		pgoff = list[i].offset >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  272  		pgcnt = list[i].size   >> PAGE_SHIFT;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  273  		if (is_file_hugepages(memfd)) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  274  			if (!ubuf->subpgoff) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  275  				ubuf->subpgoff = kmalloc_array(ubuf->pagecount,
6c62382bf45b08 Vivek Kasireddy     2023-08-16  276  							       sizeof(*ubuf->subpgoff),
6c62382bf45b08 Vivek Kasireddy     2023-08-16  277  							       GFP_KERNEL);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  278  				if (!ubuf->subpgoff) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  279  					ret = -ENOMEM;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  280  					goto err;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  281  				}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  282  			}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  283  			hpstate = hstate_file(memfd);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  284  			mapidx = list[i].offset >> huge_page_shift(hpstate);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  285  			chunkoff = (list[i].offset &
6c62382bf45b08 Vivek Kasireddy     2023-08-16  286  				    ~huge_page_mask(hpstate)) >> PAGE_SHIFT;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  287  			maxchunks = huge_page_size(hpstate) >> PAGE_SHIFT;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  288  		}
fbb0de79507819 Gerd Hoffmann       2018-08-27  289  		for (pgidx = 0; pgidx < pgcnt; pgidx++) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  290  			if (is_file_hugepages(memfd)) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  291  				if (!hpage) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16 @292  					hpage = find_get_page_flags(mapping, mapidx,
6c62382bf45b08 Vivek Kasireddy     2023-08-16  293  								    FGP_ACCESSED);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  294  					if (!hpage) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  295  						ret = -EINVAL;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  296  						goto err;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  297  					}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  298  				}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  299  				get_page(hpage);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  300  				ubuf->pages[pgbuf] = hpage;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  301  				ubuf->subpgoff[pgbuf++] = chunkoff << PAGE_SHIFT;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  302  				if (++chunkoff == maxchunks) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  303  					put_page(hpage);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  304  					hpage = NULL;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  305  					chunkoff = 0;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  306  					mapidx++;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  307  				}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  308  			} else {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  309  				mapidx = pgoff + pgidx;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  310  				page = shmem_read_mapping_page(mapping, mapidx);
fbb0de79507819 Gerd Hoffmann       2018-08-27  311  				if (IS_ERR(page)) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  312  					ret = PTR_ERR(page);
0d17455ca85ecb Gerd Hoffmann       2018-09-11  313  					goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  314  				}
fbb0de79507819 Gerd Hoffmann       2018-08-27  315  				ubuf->pages[pgbuf++] = page;
fbb0de79507819 Gerd Hoffmann       2018-08-27  316  			}
6c62382bf45b08 Vivek Kasireddy     2023-08-16  317  		}
fbb0de79507819 Gerd Hoffmann       2018-08-27  318  		fput(memfd);
fbb0de79507819 Gerd Hoffmann       2018-08-27  319  		memfd = NULL;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  320  		if (hpage) {
6c62382bf45b08 Vivek Kasireddy     2023-08-16  321  			put_page(hpage);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  322  			hpage = NULL;
6c62382bf45b08 Vivek Kasireddy     2023-08-16  323  		}
0d17455ca85ecb Gerd Hoffmann       2018-09-11  324  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  325  
fbb0de79507819 Gerd Hoffmann       2018-08-27  326  	exp_info.ops  = &udmabuf_ops;
fbb0de79507819 Gerd Hoffmann       2018-08-27  327  	exp_info.size = ubuf->pagecount << PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann       2018-08-27  328  	exp_info.priv = ubuf;
5c074eeabbd332 Gerd Hoffmann       2018-11-14  329  	exp_info.flags = O_RDWR;
fbb0de79507819 Gerd Hoffmann       2018-08-27  330  
c1bbed66899726 Gurchetan Singh     2019-12-02  331  	ubuf->device = device;
fbb0de79507819 Gerd Hoffmann       2018-08-27  332  	buf = dma_buf_export(&exp_info);
fbb0de79507819 Gerd Hoffmann       2018-08-27  333  	if (IS_ERR(buf)) {
fbb0de79507819 Gerd Hoffmann       2018-08-27  334  		ret = PTR_ERR(buf);
0d17455ca85ecb Gerd Hoffmann       2018-09-11  335  		goto err;
fbb0de79507819 Gerd Hoffmann       2018-08-27  336  	}
fbb0de79507819 Gerd Hoffmann       2018-08-27  337  
fbb0de79507819 Gerd Hoffmann       2018-08-27  338  	flags = 0;
fbb0de79507819 Gerd Hoffmann       2018-08-27  339  	if (head->flags & UDMABUF_FLAGS_CLOEXEC)
fbb0de79507819 Gerd Hoffmann       2018-08-27  340  		flags |= O_CLOEXEC;
fbb0de79507819 Gerd Hoffmann       2018-08-27  341  	return dma_buf_fd(buf, flags);
fbb0de79507819 Gerd Hoffmann       2018-08-27  342  
0d17455ca85ecb Gerd Hoffmann       2018-09-11  343  err:
fbb0de79507819 Gerd Hoffmann       2018-08-27  344  	while (pgbuf > 0)
fbb0de79507819 Gerd Hoffmann       2018-08-27  345  		put_page(ubuf->pages[--pgbuf]);
683a0e630cb463 Gustavo A. R. Silva 2018-09-04  346  	if (memfd)
fbb0de79507819 Gerd Hoffmann       2018-08-27  347  		fput(memfd);
6c62382bf45b08 Vivek Kasireddy     2023-08-16  348  	kfree(ubuf->subpgoff);
fbb0de79507819 Gerd Hoffmann       2018-08-27  349  	kfree(ubuf->pages);
fbb0de79507819 Gerd Hoffmann       2018-08-27  350  	kfree(ubuf);
fbb0de79507819 Gerd Hoffmann       2018-08-27  351  	return ret;
fbb0de79507819 Gerd Hoffmann       2018-08-27  352  }
fbb0de79507819 Gerd Hoffmann       2018-08-27  353  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
