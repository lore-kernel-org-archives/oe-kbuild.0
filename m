Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6EF5215054
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Mar 2025 06:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742193417; cv=none; b=mVdEO07j+Ns9H5Kv12wuzJAfm0Fz+/4TOwoFr8eH+KwfT549FJs1Z0imizQon6UD0MmOa2ftoyz+GtFceF9u26TI1ZQiQQNS3+5ASdZhq72lNlss4jeImqG+1hnfnGVBkbQ2XBVuO1x4Ia7nuUoF9DOVU/0vA135u+BSWl8Pe34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742193417; c=relaxed/simple;
	bh=h5jP1MjF1yuUKRDIS+UwZXnwmI7yRDPBGlpEeJSijmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kvg+S+/gT5EkRRRsOLFeYGGLE9p17T6H2JAQn/yAILXIEtC9+o1xhvbLWlkaCbbn3bQznNruK/t7/LNrHnGh1+YJHE7ZqJmLGxUVvY66HOAqBWINpbGu7sFjT9l5SrWTlUVZz4+wzc0CQqr77vy5epHCNqV9hwfxsWvoXN/J9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PuyZ4g/R; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PuyZ4g/R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742193415; x=1773729415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h5jP1MjF1yuUKRDIS+UwZXnwmI7yRDPBGlpEeJSijmM=;
  b=PuyZ4g/RMVqgKJSL/D6JcvRdx+FPka3ZtKrWUlUVzC92EpsnsnVAlz9o
   h9nmkbodA8QhaGRoSuGOxZde2S+rdb4EdXSBPKBqnvjrBAAIDTXMVTPyW
   baA/56gwfaFD7u4MM311KnHY0jJxYxHv0SbI712LZWoGe5vFeT96XPQJK
   SR/pmyDkPdlkKrCk2FolgdKPl9fM0agI+kOyS2Zjx4Eo6BrEX74o049qd
   EPpzJiBhky9dcoXnqJORDoEAMLXL7hDDOiEMKWxekZow5v279DKms4ptC
   zoUN/lb3KDC6PrygKyFCGDj724a6BxSo09UvH2dfraAgEyC7E4CPrbZvf
   Q==;
X-CSE-ConnectionGUID: bcE9TZB5RO6DpWVCpvcP2Q==
X-CSE-MsgGUID: xi/yoMqqR5Ka7ecfwm/pPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="54270732"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="54270732"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2025 23:36:54 -0700
X-CSE-ConnectionGUID: 16FFrJ+uS1W8nk/WhXbNBg==
X-CSE-MsgGUID: LWu63Ry+RUaaHukCJGs0Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; 
   d="scan'208";a="126881021"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Mar 2025 23:36:54 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tu45j-000CWN-01;
	Mon, 17 Mar 2025 06:36:51 +0000
Date: Mon, 17 Mar 2025 14:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/ring_buffer.c:6430 ring_buffer_map_get_reader() warn:
 passing positive error code '(-22),(-19)' to 'PTR_ERR'
Message-ID: <202503171447.H1lkRtMx-lkp@intel.com>
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
TO: Vincent Donnefort <vdonnefort@google.com>
CC: "Steven Rostedt (Google)" <rostedt@goodmis.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4701f33a10702d5fc577c32434eb62adde0a1ae1
commit: 117c39200d9d760cbd5944bb89efb7b9c51965aa ring-buffer: Introducing ring-buffer mapping functions
date:   10 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250317/202503171447.H1lkRtMx-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503171447.H1lkRtMx-lkp@intel.com/

smatch warnings:
kernel/trace/ring_buffer.c:6430 ring_buffer_map_get_reader() warn: passing positive error code '(-22),(-19)' to 'PTR_ERR'

vim +6430 kernel/trace/ring_buffer.c

117c39200d9d760 Vincent Donnefort 2024-05-10  6421  
117c39200d9d760 Vincent Donnefort 2024-05-10  6422  int ring_buffer_map_get_reader(struct trace_buffer *buffer, int cpu)
117c39200d9d760 Vincent Donnefort 2024-05-10  6423  {
117c39200d9d760 Vincent Donnefort 2024-05-10  6424  	struct ring_buffer_per_cpu *cpu_buffer;
117c39200d9d760 Vincent Donnefort 2024-05-10  6425  	unsigned long reader_size;
117c39200d9d760 Vincent Donnefort 2024-05-10  6426  	unsigned long flags;
117c39200d9d760 Vincent Donnefort 2024-05-10  6427  
117c39200d9d760 Vincent Donnefort 2024-05-10  6428  	cpu_buffer = rb_get_mapped_buffer(buffer, cpu);
117c39200d9d760 Vincent Donnefort 2024-05-10  6429  	if (IS_ERR(cpu_buffer))
117c39200d9d760 Vincent Donnefort 2024-05-10 @6430  		return (int)PTR_ERR(cpu_buffer);
117c39200d9d760 Vincent Donnefort 2024-05-10  6431  
117c39200d9d760 Vincent Donnefort 2024-05-10  6432  	raw_spin_lock_irqsave(&cpu_buffer->reader_lock, flags);
117c39200d9d760 Vincent Donnefort 2024-05-10  6433  
117c39200d9d760 Vincent Donnefort 2024-05-10  6434  consume:
117c39200d9d760 Vincent Donnefort 2024-05-10  6435  	if (rb_per_cpu_empty(cpu_buffer))
117c39200d9d760 Vincent Donnefort 2024-05-10  6436  		goto out;
117c39200d9d760 Vincent Donnefort 2024-05-10  6437  
117c39200d9d760 Vincent Donnefort 2024-05-10  6438  	reader_size = rb_page_size(cpu_buffer->reader_page);
117c39200d9d760 Vincent Donnefort 2024-05-10  6439  
117c39200d9d760 Vincent Donnefort 2024-05-10  6440  	/*
117c39200d9d760 Vincent Donnefort 2024-05-10  6441  	 * There are data to be read on the current reader page, we can
117c39200d9d760 Vincent Donnefort 2024-05-10  6442  	 * return to the caller. But before that, we assume the latter will read
117c39200d9d760 Vincent Donnefort 2024-05-10  6443  	 * everything. Let's update the kernel reader accordingly.
117c39200d9d760 Vincent Donnefort 2024-05-10  6444  	 */
117c39200d9d760 Vincent Donnefort 2024-05-10  6445  	if (cpu_buffer->reader_page->read < reader_size) {
117c39200d9d760 Vincent Donnefort 2024-05-10  6446  		while (cpu_buffer->reader_page->read < reader_size)
117c39200d9d760 Vincent Donnefort 2024-05-10  6447  			rb_advance_reader(cpu_buffer);
117c39200d9d760 Vincent Donnefort 2024-05-10  6448  		goto out;
117c39200d9d760 Vincent Donnefort 2024-05-10  6449  	}
117c39200d9d760 Vincent Donnefort 2024-05-10  6450  
117c39200d9d760 Vincent Donnefort 2024-05-10  6451  	if (WARN_ON(!rb_get_reader_page(cpu_buffer)))
117c39200d9d760 Vincent Donnefort 2024-05-10  6452  		goto out;
117c39200d9d760 Vincent Donnefort 2024-05-10  6453  
117c39200d9d760 Vincent Donnefort 2024-05-10  6454  	goto consume;
117c39200d9d760 Vincent Donnefort 2024-05-10  6455  
117c39200d9d760 Vincent Donnefort 2024-05-10  6456  out:
117c39200d9d760 Vincent Donnefort 2024-05-10  6457  	/* Some archs do not have data cache coherency between kernel and user-space */
117c39200d9d760 Vincent Donnefort 2024-05-10  6458  	flush_dcache_folio(virt_to_folio(cpu_buffer->reader_page->page));
117c39200d9d760 Vincent Donnefort 2024-05-10  6459  
117c39200d9d760 Vincent Donnefort 2024-05-10  6460  	rb_update_meta_page(cpu_buffer);
117c39200d9d760 Vincent Donnefort 2024-05-10  6461  
117c39200d9d760 Vincent Donnefort 2024-05-10  6462  	raw_spin_unlock_irqrestore(&cpu_buffer->reader_lock, flags);
117c39200d9d760 Vincent Donnefort 2024-05-10  6463  	rb_put_mapped_buffer(cpu_buffer);
117c39200d9d760 Vincent Donnefort 2024-05-10  6464  
117c39200d9d760 Vincent Donnefort 2024-05-10  6465  	return 0;
117c39200d9d760 Vincent Donnefort 2024-05-10  6466  }
117c39200d9d760 Vincent Donnefort 2024-05-10  6467  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
