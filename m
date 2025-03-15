Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A9E186E54
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Mar 2025 03:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742010546; cv=none; b=abLyRwakwxVIeL+W76DW45We2W59WrMOwvZfKteyzNgeWr4v1ps2PO0yb5a05buIY9Zo2i4jpJOWOw+/u5wvawaTp1iVKyVf26CLDnMxhGzm6l5EIdWwLH0gCj9Za8frVrJJcIG5u56Z2X34LSUymgEOOXaUoLwH+91sjpze/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742010546; c=relaxed/simple;
	bh=qfboSgj97lv3dxiWdYGpqRSl0Oir9wQ2dPho1FZ4Lfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c1oUpeQKxBbSWidfugwcUWADmre8TDfUd4RycOLUxawvNGXr9UOUNA/WL7YvGKDxeaMih+t06tu8am75nPYw4drJ4Rd1EOXLxftsKhV7PF+EJVvJQxwbCqOEb2komCOre5UX5W/CEXDVmghfZ2Qxej1rmirpqYP4IMrs4guuBWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BX+n7GKW; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BX+n7GKW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742010545; x=1773546545;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qfboSgj97lv3dxiWdYGpqRSl0Oir9wQ2dPho1FZ4Lfw=;
  b=BX+n7GKWKV+X2+w6/eb0zOKUA1Z8zqWZGCF2HABVzJM0Q5ZVhZONy0sb
   W64SN8rqSBjIPBhr+f6mDnUUp1L8DByEA7cM+cIbHC+GQhK/qrwGulOLv
   8359ry3uaaBZlFm1f16KkfTlZ0B5sfwgsCxvIpOOFnPPhvKvUlRZQNUyI
   X1guaLMYIt4yHC28eew/CssC7ah3Lsu5r8cb+Jkp0DGoZBxPGSobu/Yr6
   N/A/mI+xZq5wEmzc29tmoO5b8N1e9uFsxH3pmG5gPDxH9ZADE3p7ukKVu
   aB/xffEen6tl8GxbD+DzGbRIbiPg3k3gZoNs2CzpOjMSZRc7eyJdCGZXH
   w==;
X-CSE-ConnectionGUID: COR8dJaoTDG9aYcGXXK0nw==
X-CSE-MsgGUID: VcQNY+84RmWP1bDoBY+AWw==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="47072459"
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="47072459"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 20:49:02 -0700
X-CSE-ConnectionGUID: 4tZUOvCYQ+ie3oUIw3mmCA==
X-CSE-MsgGUID: 1reGlrdoTP2jFatwdZi1bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,249,1736841600"; 
   d="scan'208";a="126327718"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 14 Mar 2025 20:49:00 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttIWA-000B2p-1B;
	Sat, 15 Mar 2025 03:48:58 +0000
Date: Sat, 15 Mar 2025 11:48:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/trace/ring_buffer.c:6430 ring_buffer_map_get_reader() warn:
 passing positive error code '(-22),(-19)' to 'PTR_ERR'
Message-ID: <202503151139.YHMyAXAG-lkp@intel.com>
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
head:   a29967be967eebf049e89edb14c4edf9991bc929
commit: 117c39200d9d760cbd5944bb89efb7b9c51965aa ring-buffer: Introducing ring-buffer mapping functions
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: openrisc-randconfig-r071-20250314 (https://download.01.org/0day-ci/archive/20250315/202503151139.YHMyAXAG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503151139.YHMyAXAG-lkp@intel.com/

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
