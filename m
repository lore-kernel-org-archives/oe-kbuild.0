Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCE61E6DC1
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730978411; cv=none; b=kJyviRT3QU+Z03alw99vw+BdB7slsxYR64BCZ608BGS+IoJH94NsRq2v3xsKWFEmkazuvUYE20/6ugqNuI5WWcHyqpz4oJzAZqyASk1XSoNQ3mPEMy4PkmHWltzDF1rOA2/WmJ9i1F4mk908680hWfXoXUGnvSW0yez3wY9xSdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730978411; c=relaxed/simple;
	bh=h1Kmzzux6J9mJh6EuJtyy/NAN2mEAPoOh/9CQcuWpDs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QKFl46Bb4fzceWE+luvrPzTi46n/GaRdae+Qsg3UTf8N5j3rZIoMFXSwzXrtInLU3xoppRL9wPDWTeA87rZJRd91B9nJcMLo2diioDvT/X45+augBQRQahi82UEWG4O6QKXjcfCrL65P/b0eMCOWqu25hb4HW5vxQ4tFymLIzGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUNJRXFi; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUNJRXFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730978409; x=1762514409;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h1Kmzzux6J9mJh6EuJtyy/NAN2mEAPoOh/9CQcuWpDs=;
  b=QUNJRXFiZtuE4/eWd22jjLucn7zPmVh4LWdJgKanYPi7/L+MuPX9fhTU
   kEaerqmQP9vBPacrSXI0A5QAfwf0YH7wfAacMvtpzH4aLa6KCIb+EiYBK
   zJlxdj5dZxL8ZGQmm06Qao1CEi3HHGrjxMPMJkHqDg8zSZRPhwSgDsl/R
   odF/s2wriDXmQyGUT81Bal54EvoBtfRx6f9p+sy5k0obZmTCUL1ZaGhZP
   KdtCJkxDo9XCINPzTFU9vDQ06D9MTSfx0osQ6JR75m/ewfvkldwkq8IIe
   x3kYx+NlUjbZugfDFTQqaZLWOLLBK6xtd0Ld9azbhRF9MUhQWrClVGurL
   g==;
X-CSE-ConnectionGUID: ErOgXtNzSf6etJUPhvu3rA==
X-CSE-MsgGUID: OPGDN7WYRoKqT2rFBCrKFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="41432974"
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="41432974"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2024 03:20:09 -0800
X-CSE-ConnectionGUID: xjaRwHFfQVazSWXIvJuP9g==
X-CSE-MsgGUID: p5AaQXXQQ+O6QeD1qw/sGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,265,1725346800"; 
   d="scan'208";a="108319163"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 Nov 2024 03:20:07 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t90YX-000q9i-2P;
	Thu, 07 Nov 2024 11:20:05 +0000
Date: Thu, 7 Nov 2024 19:20:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 6/9] vhost: Add kthread support in function
 vhost_worker_destroy()
Message-ID: <202411071945.ExiEHgoX-lkp@intel.com>
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
In-Reply-To: <20241105072642.898710-7-lulu@redhat.com>
References: <20241105072642.898710-7-lulu@redhat.com>
TO: Cindy Lu <lulu@redhat.com>
TO: lulu@redhat.com
TO: jasowang@redhat.com
TO: mst@redhat.com
TO: michael.christie@oracle.com
TO: sgarzare@redhat.com
TO: linux-kernel@vger.kernel.org
TO: virtualization@lists.linux-foundation.org
TO: netdev@vger.kernel.org

Hi Cindy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.12-rc6 next-20241106]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cindy-Lu/vhost-Add-a-new-parameter-to-allow-user-select-kthread/20241105-153254
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20241105072642.898710-7-lulu%40redhat.com
patch subject: [PATCH v3 6/9] vhost: Add kthread support in function vhost_worker_destroy()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071945.ExiEHgoX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411071945.ExiEHgoX-lkp@intel.com/

New smatch warnings:
drivers/vhost/vhost.c:721 vhost_worker_destroy() error: we previously assumed 'worker' could be null (see line 721)

Old smatch warnings:
drivers/vhost/vhost.c:241 vhost_worker_queue() error: we previously assumed 'worker' could be null (see line 241)
drivers/vhost/vhost.c:311 vhost_dev_flush() warn: iterator 'i' not incremented
drivers/vhost/vhost.c:678 vhost_attach_cgroups() error: uninitialized symbol 'ret'.
drivers/vhost/vhost.c:673 vhost_attach_cgroups() warn: iterator 'i' not incremented

vim +/worker +721 drivers/vhost/vhost.c

5ce995f313ce56 Jason Wang    2020-05-29  717  
1cdaafa1b8b4ef Mike Christie 2023-06-26  718  static void vhost_worker_destroy(struct vhost_dev *dev,
1cdaafa1b8b4ef Mike Christie 2023-06-26  719  				 struct vhost_worker *worker)
1a5f8090c6de99 Mike Christie 2023-03-10  720  {
e4dec2edddbd54 Cindy Lu      2024-11-05 @721  	if (!worker && !worker->fn)
1a5f8090c6de99 Mike Christie 2023-03-10  722  		return;
1a5f8090c6de99 Mike Christie 2023-03-10  723  
1cdaafa1b8b4ef Mike Christie 2023-06-26  724  	WARN_ON(!llist_empty(&worker->work_list));
1cdaafa1b8b4ef Mike Christie 2023-06-26  725  	xa_erase(&dev->worker_xa, worker->id);
e4dec2edddbd54 Cindy Lu      2024-11-05  726  	worker->fn->stop(dev->inherit_owner ? (void *)worker->vtsk :
e4dec2edddbd54 Cindy Lu      2024-11-05  727  					      (void *)worker->task);
e4dec2edddbd54 Cindy Lu      2024-11-05  728  	kfree(worker->fn);
1cdaafa1b8b4ef Mike Christie 2023-06-26  729  	kfree(worker);
1cdaafa1b8b4ef Mike Christie 2023-06-26  730  }
1cdaafa1b8b4ef Mike Christie 2023-06-26  731  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
