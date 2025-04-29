Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3432920409A
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 05:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906300; cv=none; b=IG1dr0YWqH5K0G63Rh6kqzSqRA5/AxOx9rHif2FL4xHOCjDqTrlYJos/IjDNpdYTip/mdjENHqefRdIbelIQv9YoTMbJ02OpZrECuHcONSyGXG5+3jeh+pnJt0qqMWxGB2hU6GblKaaNwstN5YcXProj+JI4ZN0QDZ8kwMxHJzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906300; c=relaxed/simple;
	bh=k5AGAJzAhYRRJVvEjK6+yAoVBNG0R2oe9Xlm4YdwpQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ajDmm7QLmJHefUuG1/7zdz0N+MxJKEzufIreh1zvGIWIcfAKE+gQyVyobWe+9URkV2j2wcwiyBR71vWDJASSpKOcv/G2NxW/teEtZO1tYSidIi1g6/3Pw1w/yAG0hX2eK3BK1sEYwZHvqjYltnvsCHnUtexZhxHkqgiOJBCApxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VLvhxmxK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VLvhxmxK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745906298; x=1777442298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k5AGAJzAhYRRJVvEjK6+yAoVBNG0R2oe9Xlm4YdwpQY=;
  b=VLvhxmxKqHEaZpm3LTZJy3Saz9WSQE8AHFcktqAusuX8IAn3gyOZR16/
   SNh099n8Qpv8sAH9OKdwwuIy8K6zCtr5L8C8mKteeyVtBedIjxWul8Rk1
   rhSybY7OOOOi5tSVp4074aIqlRf+eR2qGxhxyp1UGt9ZI7U5FANSfufkA
   YxQQmY4UnvHWmXNMbWKIti/DBEw9IRpOYOsoXMetAGToz11Ksk4GZyz7x
   Pe1/+QWGPXa6x29PznFxp3EjzJ4u3s6s27CJONc7EEGzrHjowHWsStlIb
   wRC+9YbRlA43SAOdh+HwUhqOiz7BCjvQ2dObERlVMvPWty2pVl5cvJgsQ
   w==;
X-CSE-ConnectionGUID: bNRj4OrHT8S5TRzjE3NQYA==
X-CSE-MsgGUID: jFqqj3DUR6miucJKISCg+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="47655628"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="47655628"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 22:58:17 -0700
X-CSE-ConnectionGUID: VNyC9tMeTiWtQWNQlU6NSQ==
X-CSE-MsgGUID: hcP36xEZT72/kieDj0Dz5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="156958120"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 28 Apr 2025 22:58:17 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9dyw-0000V1-1P;
	Tue, 29 Apr 2025 05:58:14 +0000
Date: Tue, 29 Apr 2025 13:57:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-5.4 1/1]
 drivers/dma-buf/heaps/system_heap.c:351 system_heap_buf_free() error: buffer
 overflow 'pools' 3 <= 3 (assuming for loop doesn't break)
Message-ID: <202504291334.co8G1svG-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   cd8e74fa0fa3de9f66c12c5c2c2868442d2f6728
commit: e3919bfeb0066ab9b5f9765e5610b95672990e64 [1/1] ANDROID: dma-buf: system_heap: Add deferred freeing to the system heap
:::::: branch date: 3 days ago
:::::: commit date: 4 years, 3 months ago
config: x86_64-randconfig-161-20250429 (https://download.01.org/0day-ci/archive/20250429/202504291334.co8G1svG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504291334.co8G1svG-lkp@intel.com/

smatch warnings:
drivers/dma-buf/heaps/system_heap.c:351 system_heap_buf_free() error: buffer overflow 'pools' 3 <= 3 (assuming for loop doesn't break)

vim +351 drivers/dma-buf/heaps/system_heap.c

44008f99d9ca07 John Stultz 2019-06-06  325  
e3919bfeb0066a John Stultz 2020-12-09  326  static void system_heap_buf_free(struct deferred_freelist_item *item,
e3919bfeb0066a John Stultz 2020-12-09  327  				 enum df_reason reason)
fc004422dadc12 John Stultz 2020-09-25  328  {
e3919bfeb0066a John Stultz 2020-12-09  329  	struct system_heap_buffer *buffer;
fc004422dadc12 John Stultz 2020-09-25  330  	struct sg_table *table;
fc004422dadc12 John Stultz 2020-09-25  331  	struct scatterlist *sg;
44008f99d9ca07 John Stultz 2019-06-06  332  	int i, j;
44008f99d9ca07 John Stultz 2019-06-06  333  
e3919bfeb0066a John Stultz 2020-12-09  334  	buffer = container_of(item, struct system_heap_buffer, deferred_free);
44008f99d9ca07 John Stultz 2019-06-06  335  	/* Zero the buffer pages before adding back to the pool */
e3919bfeb0066a John Stultz 2020-12-09  336  	if (reason == DF_NORMAL)
e3919bfeb0066a John Stultz 2020-12-09  337  		if (system_heap_zero_buffer(buffer))
e3919bfeb0066a John Stultz 2020-12-09  338  			reason = DF_UNDER_PRESSURE; // On failure, just free
fc004422dadc12 John Stultz 2020-09-25  339  
fc004422dadc12 John Stultz 2020-09-25  340  	table = &buffer->sg_table;
703f43c5810e08 John Stultz 2020-09-26  341  	for_each_sg(table->sgl, sg, table->nents, i) {
703f43c5810e08 John Stultz 2020-09-26  342  		struct page *page = sg_page(sg);
703f43c5810e08 John Stultz 2020-09-26  343  
e3919bfeb0066a John Stultz 2020-12-09  344  		if (reason == DF_UNDER_PRESSURE) {
e3919bfeb0066a John Stultz 2020-12-09  345  			__free_pages(page, compound_order(page));
e3919bfeb0066a John Stultz 2020-12-09  346  		} else {
44008f99d9ca07 John Stultz 2019-06-06  347  			for (j = 0; j < NUM_ORDERS; j++) {
44008f99d9ca07 John Stultz 2019-06-06  348  				if (compound_order(page) == orders[j])
44008f99d9ca07 John Stultz 2019-06-06  349  					break;
44008f99d9ca07 John Stultz 2019-06-06  350  			}
44008f99d9ca07 John Stultz 2019-06-06 @351  			dmabuf_page_pool_free(pools[j], page);
703f43c5810e08 John Stultz 2020-09-26  352  		}
e3919bfeb0066a John Stultz 2020-12-09  353  	}
fc004422dadc12 John Stultz 2020-09-25  354  	sg_free_table(table);
c02e6ccc5a4aab John Stultz 2019-12-03  355  	kfree(buffer);
c02e6ccc5a4aab John Stultz 2019-12-03  356  }
c02e6ccc5a4aab John Stultz 2019-12-03  357  

:::::: The code at line 351 was first introduced by commit
:::::: 44008f99d9ca0793e2562967e1da01fa74ee4a41 ANDROID: dma-buf: system_heap: Add pagepool support to system heap

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
