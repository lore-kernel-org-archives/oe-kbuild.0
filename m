Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB38526AE8
	for <oe-kbuild@lists.linux.dev>; Tue, 12 Dec 2023 23:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQWFqyFe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702422073; x=1733958073;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2L79i3LTh2VAgzh1rsDpDcfpCXl3FM6rZKuyKGn3WrA=;
  b=XQWFqyFeTNChh62EY8ZvjWz7Eoq4BHP7A3hNoEcTQD/J4pItX0TYLPQX
   MkIM3ecRsAWax2zcZEEeJMaprgInrbmFyBu7hczF7V9NJ3wrQbbXmfbzp
   dDU4rTNK/vI3kApYkBro9HGpzh/jOIFKfYvdb6vmViocAHXysPNwTMdfI
   r+IECb5z8KXTLq6TOvhFxLbzTR9y1u4t8ayq5LqKRaG/Gi3TXaZekj8be
   +ZUayd6cEFMf9PMe13BUOdHrBcwjrf8vTqkcIXLxkveAI0826gpPwYG2j
   VrKO8n6T1cdo0fgR9gN2yWRcGyExVycwwzGPHdjaghXROhIB9IVi6Z84U
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="426005612"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="426005612"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 15:01:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="749876766"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="749876766"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 12 Dec 2023 15:01:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDBkS-000Jp0-1s;
	Tue, 12 Dec 2023 23:01:08 +0000
Date: Wed, 13 Dec 2023 07:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 5/6] udmabuf: Pin the pages using memfd_pin_folios()
 API (v5)
Message-ID: <202312130653.GAeUPHvx-lkp@intel.com>
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
In-Reply-To: <20231212073803.3233055-6-vivek.kasireddy@intel.com>
References: <20231212073803.3233055-6-vivek.kasireddy@intel.com>
TO: Vivek Kasireddy <vivek.kasireddy@intel.com>
TO: dri-devel@lists.freedesktop.org
TO: linux-mm@kvack.org
CC: Dongwon Kim <dongwon.kim@intel.com>
CC: David Hildenbrand <david@redhat.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
CC: Hugh Dickins <hughd@google.com>
CC: Vivek Kasireddy <vivek.kasireddy@intel.com>
CC: Peter Xu <peterx@redhat.com>
CC: Gerd Hoffmann <kraxel@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Junxiao Chang <junxiao.chang@intel.com>
CC: Mike Kravetz <mike.kravetz@oracle.com>

Hi Vivek,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Vivek-Kasireddy/udmabuf-Use-vmf_insert_pfn-and-VM_PFNMAP-for-handling-mmap/20231212-160312
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20231212073803.3233055-6-vivek.kasireddy%40intel.com
patch subject: [PATCH v7 5/6] udmabuf: Pin the pages using memfd_pin_folios() API (v5)
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-161-20231213 (https://download.01.org/0day-ci/archive/20231213/202312130653.GAeUPHvx-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130653.GAeUPHvx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312130653.GAeUPHvx-lkp@intel.com/

smatch warnings:
drivers/dma-buf/udmabuf.c:331 udmabuf_create() error: we previously assumed 'ubuf->folios' could be null (see line 293)

vim +331 drivers/dma-buf/udmabuf.c

5b8ec1d16b07c1e Vivek Kasireddy     2023-12-11  262  
c1bbed668997268 Gurchetan Singh     2019-12-02  263  static long udmabuf_create(struct miscdevice *device,
c1bbed668997268 Gurchetan Singh     2019-12-02  264  			   struct udmabuf_create_list *head,
c1bbed668997268 Gurchetan Singh     2019-12-02  265  			   struct udmabuf_create_item *list)
fbb0de795078190 Gerd Hoffmann       2018-08-27  266  {
5b8ec1d16b07c1e Vivek Kasireddy     2023-12-11  267  	pgoff_t pgcnt, pgbuf = 0, pglimit;
fbb0de795078190 Gerd Hoffmann       2018-08-27  268  	struct file *memfd = NULL;
fbb0de795078190 Gerd Hoffmann       2018-08-27  269  	struct udmabuf *ubuf;
57a12569fe6e85c Vivek Kasireddy     2023-12-11  270  	long ret = -EINVAL;
fbb0de795078190 Gerd Hoffmann       2018-08-27  271  	u32 i, flags;
fbb0de795078190 Gerd Hoffmann       2018-08-27  272  
33f35429fc49c09 Gerd Hoffmann       2018-09-11  273  	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
fbb0de795078190 Gerd Hoffmann       2018-08-27  274  	if (!ubuf)
fbb0de795078190 Gerd Hoffmann       2018-08-27  275  		return -ENOMEM;
fbb0de795078190 Gerd Hoffmann       2018-08-27  276  
dc4716d75154b36 Gerd Hoffmann       2018-09-11  277  	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
fbb0de795078190 Gerd Hoffmann       2018-08-27  278  	for (i = 0; i < head->count; i++) {
fbb0de795078190 Gerd Hoffmann       2018-08-27  279  		if (!IS_ALIGNED(list[i].offset, PAGE_SIZE))
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  280  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  281  		if (!IS_ALIGNED(list[i].size, PAGE_SIZE))
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  282  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  283  		ubuf->pagecount += list[i].size >> PAGE_SHIFT;
dc4716d75154b36 Gerd Hoffmann       2018-09-11  284  		if (ubuf->pagecount > pglimit)
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  285  			goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  286  	}
2b6dd600dd72573 Pavel Skripkin      2021-12-30  287  
2b6dd600dd72573 Pavel Skripkin      2021-12-30  288  	if (!ubuf->pagecount)
2b6dd600dd72573 Pavel Skripkin      2021-12-30  289  		goto err;
2b6dd600dd72573 Pavel Skripkin      2021-12-30  290  
5b8ec1d16b07c1e Vivek Kasireddy     2023-12-11  291  	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
fbb0de795078190 Gerd Hoffmann       2018-08-27  292  				    GFP_KERNEL);
5b8ec1d16b07c1e Vivek Kasireddy     2023-12-11 @293  	if (!ubuf->folios) {
fbb0de795078190 Gerd Hoffmann       2018-08-27  294  		ret = -ENOMEM;
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  295  		goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  296  	}
cb2b9e0d8e97af6 Vivek Kasireddy     2023-12-11  297  	ubuf->offsets = kcalloc(ubuf->pagecount, sizeof(*ubuf->offsets),
cb2b9e0d8e97af6 Vivek Kasireddy     2023-12-11  298  				GFP_KERNEL);
cb2b9e0d8e97af6 Vivek Kasireddy     2023-12-11  299  	if (!ubuf->offsets) {
cb2b9e0d8e97af6 Vivek Kasireddy     2023-12-11  300  		ret = -ENOMEM;
cb2b9e0d8e97af6 Vivek Kasireddy     2023-12-11  301  		goto err;
cb2b9e0d8e97af6 Vivek Kasireddy     2023-12-11  302  	}
fbb0de795078190 Gerd Hoffmann       2018-08-27  303  
fbb0de795078190 Gerd Hoffmann       2018-08-27  304  	pgbuf = 0;
fbb0de795078190 Gerd Hoffmann       2018-08-27  305  	for (i = 0; i < head->count; i++) {
fbb0de795078190 Gerd Hoffmann       2018-08-27  306  		memfd = fget(list[i].memfd);
5b8ec1d16b07c1e Vivek Kasireddy     2023-12-11  307  		if (check_memfd_seals(memfd) < 0)
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  308  			goto err;
cb2b9e0d8e97af6 Vivek Kasireddy     2023-12-11  309  
fbb0de795078190 Gerd Hoffmann       2018-08-27  310  		pgcnt = list[i].size >> PAGE_SHIFT;
57a12569fe6e85c Vivek Kasireddy     2023-12-11  311  		ret = memfd_pin_folios(memfd, list[i].offset, pgcnt,
57a12569fe6e85c Vivek Kasireddy     2023-12-11  312  				       ubuf->folios + pgbuf,
57a12569fe6e85c Vivek Kasireddy     2023-12-11  313  				       ubuf->offsets + pgbuf);
cb2b9e0d8e97af6 Vivek Kasireddy     2023-12-11  314  		if (ret < 0)
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  315  			goto err;
cb2b9e0d8e97af6 Vivek Kasireddy     2023-12-11  316  
57a12569fe6e85c Vivek Kasireddy     2023-12-11  317  		pgbuf += pgcnt;
fbb0de795078190 Gerd Hoffmann       2018-08-27  318  		fput(memfd);
fbb0de795078190 Gerd Hoffmann       2018-08-27  319  		memfd = NULL;
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  320  	}
fbb0de795078190 Gerd Hoffmann       2018-08-27  321  
5b8ec1d16b07c1e Vivek Kasireddy     2023-12-11  322  	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
5b8ec1d16b07c1e Vivek Kasireddy     2023-12-11  323  	ret = export_udmabuf(ubuf, device, flags);
5b8ec1d16b07c1e Vivek Kasireddy     2023-12-11  324  	if (ret < 0)
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  325  		goto err;
fbb0de795078190 Gerd Hoffmann       2018-08-27  326  
5b8ec1d16b07c1e Vivek Kasireddy     2023-12-11  327  	return ret;
fbb0de795078190 Gerd Hoffmann       2018-08-27  328  
0d17455ca85ecbc Gerd Hoffmann       2018-09-11  329  err:
57a12569fe6e85c Vivek Kasireddy     2023-12-11  330  	while (pgbuf-- > 0)
57a12569fe6e85c Vivek Kasireddy     2023-12-11 @331  		if (ubuf->folios[pgbuf])
57a12569fe6e85c Vivek Kasireddy     2023-12-11  332  			unpin_user_page(folio_page(ubuf->folios[pgbuf], 0));
683a0e630cb463d Gustavo A. R. Silva 2018-09-04  333  	if (memfd)
fbb0de795078190 Gerd Hoffmann       2018-08-27  334  		fput(memfd);
cb2b9e0d8e97af6 Vivek Kasireddy     2023-12-11  335  	kfree(ubuf->offsets);
5b8ec1d16b07c1e Vivek Kasireddy     2023-12-11  336  	kfree(ubuf->folios);
fbb0de795078190 Gerd Hoffmann       2018-08-27  337  	kfree(ubuf);
fbb0de795078190 Gerd Hoffmann       2018-08-27  338  	return ret;
fbb0de795078190 Gerd Hoffmann       2018-08-27  339  }
fbb0de795078190 Gerd Hoffmann       2018-08-27  340  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
