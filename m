Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13CB12FF9D
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Apr 2024 15:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712245524; cv=none; b=ie9AY+bH+fsuB22oP4ikuT8k2NneVJFkF+8CwAOo4ETAVsT9368eNunNBO7OwwUtO+vlqxs0KBkZe8ZhtYFqavQXyxg5DAxDwJAXrRQLBDnZNz8P9M9Bj3ROOlbLGfuTQUPxs2QCQecnhL58W6j6ki7if0VWKUWRu4L8rYxOYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712245524; c=relaxed/simple;
	bh=6btX6in2nyqV9EkZmRxsLzEvLm/MVeoPDQechSvF6+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lsgfZOqeUnv7emvLgj34slWLGgjUbGX1vXv6NKjujoiEQPAmNv5q8zbbcWyjgQFj7PG5/k89Reo+DEE4PAiYhkQBsq1ixCQy89czLtO/EMg+QOvcTQuWBilhAw4SGqEsySvigOejiRXNam6EvVILoFLxiXBlNDFokvyF6baZGoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JJ0Wfugl; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JJ0Wfugl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712245523; x=1743781523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6btX6in2nyqV9EkZmRxsLzEvLm/MVeoPDQechSvF6+w=;
  b=JJ0WfuglzvXOVbgr5Rx5Itwhprg5pSP9OQdxLxauBrCB7eN0NeUMjUvG
   O6dLEFbx21dhjEDFMasd5SddXrb9qRz0Hsm6BMbdD4wn8Tp497EMpP6ib
   jGupbnnjAW3/c9LgwjNUP0R3U5/c8a4oNmULZ4XiXY1U3b8SgIWJg3m0I
   JXoX1KTa3H1ExkSm504tbqCPHvpvQDzyNkB+Wk+o2l7LEYpipNPZv/SWR
   0gBIAy+ATwjPeUSvHAo/WiAcgAvLp0DfOFKy5W4plLbyUIrXEIjyH+4zh
   0Ayd425SEm2o6hTXtMSHhJ1bEIDPT6kcb/B2ATvkWCbX9xLLZXBIpeFeO
   g==;
X-CSE-ConnectionGUID: AQZZwfipT9WLYSSgubIU/A==
X-CSE-MsgGUID: J6owHGESSBSmvWfWlpRVVw==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="10511312"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="10511312"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2024 08:44:58 -0700
X-CSE-ConnectionGUID: jtBDV/11QOmMN5VczyHi1g==
X-CSE-MsgGUID: H0bflp9QTSSaBtTO6YAIxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; 
   d="scan'208";a="18870698"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2024 08:44:57 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rsPGo-0001E2-1j;
	Thu, 04 Apr 2024 15:44:54 +0000
Date: Thu, 4 Apr 2024 23:44:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [rostedt-trace:trace/ring-buffer-prealloc 3/15]
 kernel/trace/ring_buffer.c:6254:19-25: WARNING: Consider using vma_pages
 helper on vma
Message-ID: <202404042343.ZCcDPY4X-lkp@intel.com>
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
TO: Vincent Donnefort <vdonnefort@google.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git trace/ring-buffer-prealloc
head:   9d075d4dc5b36849ef23fd132764443511519ede
commit: cde700d243282a307139a886c396fcd8829e8bbd [3/15] ring-buffer: Introducing ring-buffer mapping functions
:::::: branch date: 23 hours ago
:::::: commit date: 6 days ago
config: i386-randconfig-051-20240404 (https://download.01.org/0day-ci/archive/20240404/202404042343.ZCcDPY4X-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202404042343.ZCcDPY4X-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/trace/ring_buffer.c:6254:19-25: WARNING: Consider using vma_pages helper on vma

vim +6254 kernel/trace/ring_buffer.c

cde700d243282a Vincent Donnefort 2024-03-26  6212  
cde700d243282a Vincent Donnefort 2024-03-26  6213  #define subbuf_page(off, start) \
cde700d243282a Vincent Donnefort 2024-03-26  6214  	virt_to_page((void *)((start) + ((off) << PAGE_SHIFT)))
cde700d243282a Vincent Donnefort 2024-03-26  6215  
cde700d243282a Vincent Donnefort 2024-03-26  6216  #define foreach_subbuf_page(sub_order, start, page)		\
cde700d243282a Vincent Donnefort 2024-03-26  6217  	page = subbuf_page(0, (start));				\
cde700d243282a Vincent Donnefort 2024-03-26  6218  	for (int __off = 0; __off < (1 << (sub_order));		\
cde700d243282a Vincent Donnefort 2024-03-26  6219  	     __off++, page = subbuf_page(__off, (start)))
cde700d243282a Vincent Donnefort 2024-03-26  6220  
cde700d243282a Vincent Donnefort 2024-03-26  6221  /*
cde700d243282a Vincent Donnefort 2024-03-26  6222   *   +--------------+  pgoff == 0
cde700d243282a Vincent Donnefort 2024-03-26  6223   *   |   meta page  |
cde700d243282a Vincent Donnefort 2024-03-26  6224   *   +--------------+  pgoff == 1
cde700d243282a Vincent Donnefort 2024-03-26  6225   *   |   000000000  |
cde700d243282a Vincent Donnefort 2024-03-26  6226   *   +--------------+  pgoff == (1 << subbuf_order)
cde700d243282a Vincent Donnefort 2024-03-26  6227   *   | subbuffer 0  |
cde700d243282a Vincent Donnefort 2024-03-26  6228   *   |              |
cde700d243282a Vincent Donnefort 2024-03-26  6229   *   +--------------+  pgoff == (2 * (1 << subbuf_order))
cde700d243282a Vincent Donnefort 2024-03-26  6230   *   | subbuffer 1  |
cde700d243282a Vincent Donnefort 2024-03-26  6231   *   |              |
cde700d243282a Vincent Donnefort 2024-03-26  6232   *         ...
cde700d243282a Vincent Donnefort 2024-03-26  6233   */
cde700d243282a Vincent Donnefort 2024-03-26  6234  static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
cde700d243282a Vincent Donnefort 2024-03-26  6235  			struct vm_area_struct *vma)
cde700d243282a Vincent Donnefort 2024-03-26  6236  {
cde700d243282a Vincent Donnefort 2024-03-26  6237  	unsigned long nr_subbufs, nr_pages, vma_pages, pgoff = vma->vm_pgoff;
cde700d243282a Vincent Donnefort 2024-03-26  6238  	unsigned int subbuf_pages, subbuf_order;
cde700d243282a Vincent Donnefort 2024-03-26  6239  	struct page **pages;
cde700d243282a Vincent Donnefort 2024-03-26  6240  	int p = 0, s = 0;
cde700d243282a Vincent Donnefort 2024-03-26  6241  	int err;
cde700d243282a Vincent Donnefort 2024-03-26  6242  
cde700d243282a Vincent Donnefort 2024-03-26  6243  	lockdep_assert_held(&cpu_buffer->mapping_lock);
cde700d243282a Vincent Donnefort 2024-03-26  6244  
cde700d243282a Vincent Donnefort 2024-03-26  6245  	subbuf_order = cpu_buffer->buffer->subbuf_order;
cde700d243282a Vincent Donnefort 2024-03-26  6246  	subbuf_pages = 1 << subbuf_order;
cde700d243282a Vincent Donnefort 2024-03-26  6247  
cde700d243282a Vincent Donnefort 2024-03-26  6248  	if (subbuf_order && pgoff % subbuf_pages)
cde700d243282a Vincent Donnefort 2024-03-26  6249  		return -EINVAL;
cde700d243282a Vincent Donnefort 2024-03-26  6250  
cde700d243282a Vincent Donnefort 2024-03-26  6251  	nr_subbufs = cpu_buffer->nr_pages + 1;
cde700d243282a Vincent Donnefort 2024-03-26  6252  	nr_pages = ((nr_subbufs + 1) << subbuf_order) - pgoff;
cde700d243282a Vincent Donnefort 2024-03-26  6253  
cde700d243282a Vincent Donnefort 2024-03-26 @6254  	vma_pages = (vma->vm_end - vma->vm_start) >> PAGE_SHIFT;
cde700d243282a Vincent Donnefort 2024-03-26  6255  	if (!vma_pages || vma_pages > nr_pages)
cde700d243282a Vincent Donnefort 2024-03-26  6256  		return -EINVAL;
cde700d243282a Vincent Donnefort 2024-03-26  6257  
cde700d243282a Vincent Donnefort 2024-03-26  6258  	nr_pages = vma_pages;
cde700d243282a Vincent Donnefort 2024-03-26  6259  
cde700d243282a Vincent Donnefort 2024-03-26  6260  	pages = kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
cde700d243282a Vincent Donnefort 2024-03-26  6261  	if (!pages)
cde700d243282a Vincent Donnefort 2024-03-26  6262  		return -ENOMEM;
cde700d243282a Vincent Donnefort 2024-03-26  6263  
cde700d243282a Vincent Donnefort 2024-03-26  6264  	if (!pgoff) {
cde700d243282a Vincent Donnefort 2024-03-26  6265  		unsigned long meta_page_padding;
cde700d243282a Vincent Donnefort 2024-03-26  6266  
cde700d243282a Vincent Donnefort 2024-03-26  6267  		pages[p++] = virt_to_page(cpu_buffer->meta_page);
cde700d243282a Vincent Donnefort 2024-03-26  6268  
cde700d243282a Vincent Donnefort 2024-03-26  6269  		/*
cde700d243282a Vincent Donnefort 2024-03-26  6270  		 * Pad with the zero-page to align the meta-page with the
cde700d243282a Vincent Donnefort 2024-03-26  6271  		 * sub-buffers.
cde700d243282a Vincent Donnefort 2024-03-26  6272  		 */
cde700d243282a Vincent Donnefort 2024-03-26  6273  		meta_page_padding = subbuf_pages - 1;
cde700d243282a Vincent Donnefort 2024-03-26  6274  		while (meta_page_padding-- && p < nr_pages)
cde700d243282a Vincent Donnefort 2024-03-26  6275  			pages[p++] = ZERO_PAGE(0);
cde700d243282a Vincent Donnefort 2024-03-26  6276  	} else {
cde700d243282a Vincent Donnefort 2024-03-26  6277  		/* Skip the meta-page */
cde700d243282a Vincent Donnefort 2024-03-26  6278  		pgoff -= subbuf_pages;
cde700d243282a Vincent Donnefort 2024-03-26  6279  
cde700d243282a Vincent Donnefort 2024-03-26  6280  		s += pgoff / subbuf_pages;
cde700d243282a Vincent Donnefort 2024-03-26  6281  	}
cde700d243282a Vincent Donnefort 2024-03-26  6282  
cde700d243282a Vincent Donnefort 2024-03-26  6283  	while (s < nr_subbufs && p < nr_pages) {
cde700d243282a Vincent Donnefort 2024-03-26  6284  		struct page *page;
cde700d243282a Vincent Donnefort 2024-03-26  6285  
cde700d243282a Vincent Donnefort 2024-03-26  6286  		foreach_subbuf_page(subbuf_order, cpu_buffer->subbuf_ids[s], page) {
cde700d243282a Vincent Donnefort 2024-03-26  6287  			if (p >= nr_pages)
cde700d243282a Vincent Donnefort 2024-03-26  6288  				break;
cde700d243282a Vincent Donnefort 2024-03-26  6289  
cde700d243282a Vincent Donnefort 2024-03-26  6290  			pages[p++] = page;
cde700d243282a Vincent Donnefort 2024-03-26  6291  		}
cde700d243282a Vincent Donnefort 2024-03-26  6292  		s++;
cde700d243282a Vincent Donnefort 2024-03-26  6293  	}
cde700d243282a Vincent Donnefort 2024-03-26  6294  
cde700d243282a Vincent Donnefort 2024-03-26  6295  	err = vm_insert_pages(vma, vma->vm_start, pages, &nr_pages);
cde700d243282a Vincent Donnefort 2024-03-26  6296  
cde700d243282a Vincent Donnefort 2024-03-26  6297  	kfree(pages);
cde700d243282a Vincent Donnefort 2024-03-26  6298  
cde700d243282a Vincent Donnefort 2024-03-26  6299  	return err;
cde700d243282a Vincent Donnefort 2024-03-26  6300  }
cde700d243282a Vincent Donnefort 2024-03-26  6301  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
