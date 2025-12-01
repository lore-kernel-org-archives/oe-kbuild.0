Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46078189F43
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Dec 2025 08:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764576025; cv=none; b=qJZAZGwg1rZCtNx7Z2BWpQESIVAYtenw1sjkr0mAeR012jPsFHVEhCkDgVx7ovpd3RJvyt9KYqvFzNlRhIMtd533ZccEnnAqEyk+jxoD6Z55XQLaU59Ld0CJfbsCDpViMGRpoCgXCE1MvaAaWv0FLIlqolgSKTwDdl3S6HNEARo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764576025; c=relaxed/simple;
	bh=5eeyy04kvvZQ4b8C3k3sHUgwauvhU2g4cAKyXCPzJj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B82i3p3W8b9SBqK9gnO7hgnrU69/za40F1S2CqQMzuJSiCuFfNQgUg2EfoCgUGTf5U9QCXsGFw7xMg8W0aKRElInNMIDyEfJORdUQS1/ZFoBTumEE0ybaXLP/kbuufaVPXhtVl9OMP8On2wwLx8lkwyk+37LF5lrSvZnB+50rJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CV6myR5z; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CV6myR5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764576023; x=1796112023;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5eeyy04kvvZQ4b8C3k3sHUgwauvhU2g4cAKyXCPzJj4=;
  b=CV6myR5zN8GbsKYgVouD3prnKhwwO9cQ5MVIn9h5Wk5jwTt/e3NUj8e2
   uEULBUsMOiUxMqPzhDvyk6cZfl26bJmuso7+qi/pZ8ofOwrGDYL61abSK
   0G3iJPdMG5mw8wc1tKdu0B8HtEQOD5A078dTmnkzIINlRh0wSZClfIIIq
   TflJI+fxibby4WIfu5oCw5eHU8G00vaxoXH98JGK9eM/MigiVLHdOfl4g
   nCrpS5ANullQaPqaYaZyDPmqLxn8AFPw6kcGoYdKAOSQZr5qZhIGpP3L2
   qkSYakVe2VeRwdlczFKLJoLglEh3PMS/GDKvp3XAQjFftS/bdumcr4EmH
   Q==;
X-CSE-ConnectionGUID: u5lLAf3fSkWU/Wvu5lwCXg==
X-CSE-MsgGUID: SUiAEodaTSOqGhLsO02xgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="65687373"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="65687373"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 00:00:22 -0800
X-CSE-ConnectionGUID: TZa3G/cPTcS2tu0JDW3oGw==
X-CSE-MsgGUID: 7wHvVJUNTseLW0/9N9QQhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; 
   d="scan'208";a="193822816"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 01 Dec 2025 00:00:21 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPypW-000000008Oz-2Bix;
	Mon, 01 Dec 2025 08:00:18 +0000
Date: Mon, 1 Dec 2025 15:59:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/ring_buffer.c:7052 __rb_map_vma() warn: potentially one
 past the end of array 'pages[p]'
Message-ID: <202512011536.6LjXvKSv-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d0a66e4bb9081d75c82ec4957c50034cb0ea449
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   10 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 10 months ago
config: loongarch-randconfig-r073-20251201 (https://download.01.org/0day-ci/archive/20251201/202512011536.6LjXvKSv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project b3428bb966f1de8aa48375ffee0eba04ede133b7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512011536.6LjXvKSv-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:7052 __rb_map_vma() warn: potentially one past the end of array 'pages[p]'
kernel/trace/ring_buffer.c:7052 __rb_map_vma() warn: potentially one past the end of array 'pages[p]'
kernel/trace/ring_buffer.c:7052 __rb_map_vma() warn: potentially one past the end of array 'pages[p]'
kernel/trace/ring_buffer.c:7052 __rb_map_vma() warn: potentially one past the end of array 'pages[p]'

vim +7052 kernel/trace/ring_buffer.c

117c39200d9d76 Vincent Donnefort       2024-05-10  6979  
117c39200d9d76 Vincent Donnefort       2024-05-10  6980  /*
117c39200d9d76 Vincent Donnefort       2024-05-10  6981   *   +--------------+  pgoff == 0
117c39200d9d76 Vincent Donnefort       2024-05-10  6982   *   |   meta page  |
117c39200d9d76 Vincent Donnefort       2024-05-10  6983   *   +--------------+  pgoff == 1
117c39200d9d76 Vincent Donnefort       2024-05-10  6984   *   | subbuffer 0  |
117c39200d9d76 Vincent Donnefort       2024-05-10  6985   *   |              |
117c39200d9d76 Vincent Donnefort       2024-05-10  6986   *   +--------------+  pgoff == (1 + (1 << subbuf_order))
117c39200d9d76 Vincent Donnefort       2024-05-10  6987   *   | subbuffer 1  |
117c39200d9d76 Vincent Donnefort       2024-05-10  6988   *   |              |
117c39200d9d76 Vincent Donnefort       2024-05-10  6989   *         ...
117c39200d9d76 Vincent Donnefort       2024-05-10  6990   */
117c39200d9d76 Vincent Donnefort       2024-05-10  6991  #ifdef CONFIG_MMU
117c39200d9d76 Vincent Donnefort       2024-05-10  6992  static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
117c39200d9d76 Vincent Donnefort       2024-05-10  6993  			struct vm_area_struct *vma)
117c39200d9d76 Vincent Donnefort       2024-05-10  6994  {
b96c312551b241 Thorsten Blum           2024-07-09  6995  	unsigned long nr_subbufs, nr_pages, nr_vma_pages, pgoff = vma->vm_pgoff;
117c39200d9d76 Vincent Donnefort       2024-05-10  6996  	unsigned int subbuf_pages, subbuf_order;
117c39200d9d76 Vincent Donnefort       2024-05-10  6997  	struct page **pages;
117c39200d9d76 Vincent Donnefort       2024-05-10  6998  	int p = 0, s = 0;
117c39200d9d76 Vincent Donnefort       2024-05-10  6999  	int err;
117c39200d9d76 Vincent Donnefort       2024-05-10  7000  
117c39200d9d76 Vincent Donnefort       2024-05-10  7001  	/* Refuse MP_PRIVATE or writable mappings */
117c39200d9d76 Vincent Donnefort       2024-05-10  7002  	if (vma->vm_flags & VM_WRITE || vma->vm_flags & VM_EXEC ||
117c39200d9d76 Vincent Donnefort       2024-05-10  7003  	    !(vma->vm_flags & VM_MAYSHARE))
117c39200d9d76 Vincent Donnefort       2024-05-10  7004  		return -EPERM;
117c39200d9d76 Vincent Donnefort       2024-05-10  7005  
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7006  	subbuf_order = cpu_buffer->buffer->subbuf_order;
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7007  	subbuf_pages = 1 << subbuf_order;
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7008  
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7009  	if (subbuf_order && pgoff % subbuf_pages)
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7010  		return -EINVAL;
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7011  
117c39200d9d76 Vincent Donnefort       2024-05-10  7012  	/*
117c39200d9d76 Vincent Donnefort       2024-05-10  7013  	 * Make sure the mapping cannot become writable later. Also tell the VM
117c39200d9d76 Vincent Donnefort       2024-05-10  7014  	 * to not touch these pages (VM_DONTCOPY | VM_DONTEXPAND).
117c39200d9d76 Vincent Donnefort       2024-05-10  7015  	 */
117c39200d9d76 Vincent Donnefort       2024-05-10  7016  	vm_flags_mod(vma, VM_DONTCOPY | VM_DONTEXPAND | VM_DONTDUMP,
117c39200d9d76 Vincent Donnefort       2024-05-10  7017  		     VM_MAYWRITE);
117c39200d9d76 Vincent Donnefort       2024-05-10  7018  
117c39200d9d76 Vincent Donnefort       2024-05-10  7019  	lockdep_assert_held(&cpu_buffer->mapping_lock);
117c39200d9d76 Vincent Donnefort       2024-05-10  7020  
117c39200d9d76 Vincent Donnefort       2024-05-10  7021  	nr_subbufs = cpu_buffer->nr_pages + 1; /* + reader-subbuf */
c58a812c8e49ad Edward Adam Davis       2024-12-18  7022  	nr_pages = ((nr_subbufs + 1) << subbuf_order); /* + meta-page */
c58a812c8e49ad Edward Adam Davis       2024-12-18  7023  	if (nr_pages <= pgoff)
c58a812c8e49ad Edward Adam Davis       2024-12-18  7024  		return -EINVAL;
c58a812c8e49ad Edward Adam Davis       2024-12-18  7025  
c58a812c8e49ad Edward Adam Davis       2024-12-18  7026  	nr_pages -= pgoff;
117c39200d9d76 Vincent Donnefort       2024-05-10  7027  
b96c312551b241 Thorsten Blum           2024-07-09  7028  	nr_vma_pages = vma_pages(vma);
b96c312551b241 Thorsten Blum           2024-07-09  7029  	if (!nr_vma_pages || nr_vma_pages > nr_pages)
117c39200d9d76 Vincent Donnefort       2024-05-10  7030  		return -EINVAL;
117c39200d9d76 Vincent Donnefort       2024-05-10  7031  
b96c312551b241 Thorsten Blum           2024-07-09  7032  	nr_pages = nr_vma_pages;
117c39200d9d76 Vincent Donnefort       2024-05-10  7033  
117c39200d9d76 Vincent Donnefort       2024-05-10  7034  	pages = kcalloc(nr_pages, sizeof(*pages), GFP_KERNEL);
117c39200d9d76 Vincent Donnefort       2024-05-10  7035  	if (!pages)
117c39200d9d76 Vincent Donnefort       2024-05-10  7036  		return -ENOMEM;
117c39200d9d76 Vincent Donnefort       2024-05-10  7037  
117c39200d9d76 Vincent Donnefort       2024-05-10  7038  	if (!pgoff) {
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7039  		unsigned long meta_page_padding;
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7040  
117c39200d9d76 Vincent Donnefort       2024-05-10  7041  		pages[p++] = virt_to_page(cpu_buffer->meta_page);
117c39200d9d76 Vincent Donnefort       2024-05-10  7042  
117c39200d9d76 Vincent Donnefort       2024-05-10  7043  		/*
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7044  		 * Pad with the zero-page to align the meta-page with the
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7045  		 * sub-buffers.
117c39200d9d76 Vincent Donnefort       2024-05-10  7046  		 */
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7047  		meta_page_padding = subbuf_pages - 1;
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7048  		while (meta_page_padding-- && p < nr_pages) {
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7049  			unsigned long __maybe_unused zero_addr =
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7050  				vma->vm_start + (PAGE_SIZE * p);
117c39200d9d76 Vincent Donnefort       2024-05-10  7051  
eb2dcde9f970ed Vincent Donnefort       2024-06-28 @7052  			pages[p++] = ZERO_PAGE(zero_addr);
117c39200d9d76 Vincent Donnefort       2024-05-10  7053  		}
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7054  	} else {
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7055  		/* Skip the meta-page */
eb2dcde9f970ed Vincent Donnefort       2024-06-28  7056  		pgoff -= subbuf_pages;
117c39200d9d76 Vincent Donnefort       2024-05-10  7057  
117c39200d9d76 Vincent Donnefort       2024-05-10  7058  		s += pgoff / subbuf_pages;
117c39200d9d76 Vincent Donnefort       2024-05-10  7059  	}
117c39200d9d76 Vincent Donnefort       2024-05-10  7060  
117c39200d9d76 Vincent Donnefort       2024-05-10  7061  	while (p < nr_pages) {
b9c6820f029aba Steven Rostedt (Google  2024-05-15  7062) 		struct page *page = virt_to_page((void *)cpu_buffer->subbuf_ids[s]);
117c39200d9d76 Vincent Donnefort       2024-05-10  7063  		int off = 0;
117c39200d9d76 Vincent Donnefort       2024-05-10  7064  
117c39200d9d76 Vincent Donnefort       2024-05-10  7065  		if (WARN_ON_ONCE(s >= nr_subbufs)) {
117c39200d9d76 Vincent Donnefort       2024-05-10  7066  			err = -EINVAL;
117c39200d9d76 Vincent Donnefort       2024-05-10  7067  			goto out;
117c39200d9d76 Vincent Donnefort       2024-05-10  7068  		}
117c39200d9d76 Vincent Donnefort       2024-05-10  7069  
117c39200d9d76 Vincent Donnefort       2024-05-10  7070  		for (; off < (1 << (subbuf_order)); off++, page++) {
117c39200d9d76 Vincent Donnefort       2024-05-10  7071  			if (p >= nr_pages)
117c39200d9d76 Vincent Donnefort       2024-05-10  7072  				break;
117c39200d9d76 Vincent Donnefort       2024-05-10  7073  
117c39200d9d76 Vincent Donnefort       2024-05-10  7074  			pages[p++] = page;
117c39200d9d76 Vincent Donnefort       2024-05-10  7075  		}
117c39200d9d76 Vincent Donnefort       2024-05-10  7076  		s++;
117c39200d9d76 Vincent Donnefort       2024-05-10  7077  	}
117c39200d9d76 Vincent Donnefort       2024-05-10  7078  
117c39200d9d76 Vincent Donnefort       2024-05-10  7079  	err = vm_insert_pages(vma, vma->vm_start, pages, &nr_pages);
117c39200d9d76 Vincent Donnefort       2024-05-10  7080  
117c39200d9d76 Vincent Donnefort       2024-05-10  7081  out:
117c39200d9d76 Vincent Donnefort       2024-05-10  7082  	kfree(pages);
117c39200d9d76 Vincent Donnefort       2024-05-10  7083  
117c39200d9d76 Vincent Donnefort       2024-05-10  7084  	return err;
117c39200d9d76 Vincent Donnefort       2024-05-10  7085  }
117c39200d9d76 Vincent Donnefort       2024-05-10  7086  #else
117c39200d9d76 Vincent Donnefort       2024-05-10  7087  static int __rb_map_vma(struct ring_buffer_per_cpu *cpu_buffer,
117c39200d9d76 Vincent Donnefort       2024-05-10  7088  			struct vm_area_struct *vma)
117c39200d9d76 Vincent Donnefort       2024-05-10  7089  {
117c39200d9d76 Vincent Donnefort       2024-05-10  7090  	return -EOPNOTSUPP;
117c39200d9d76 Vincent Donnefort       2024-05-10  7091  }
117c39200d9d76 Vincent Donnefort       2024-05-10  7092  #endif
117c39200d9d76 Vincent Donnefort       2024-05-10  7093  

:::::: The code at line 7052 was first introduced by commit
:::::: eb2dcde9f970ed8d3669444d47c8524b4bdf7d32 ring-buffer: Align meta-page to sub-buffers for improved TLB usage

:::::: TO: Vincent Donnefort <vdonnefort@google.com>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
