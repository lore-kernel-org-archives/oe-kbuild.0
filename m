Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67500372
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 04:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730954639; cv=none; b=DDyEMUwmUIyGrbHGA0svjq+fO/bmNhQ7+4NlrKcPhTYznJr2iCyguvgr8AV9QSE2GaIF1607zU6o1ZApd/YP1hhqsXUshAZxYMOglchCiJpoQgCQi7x6BMyIbUVXCbcK4Mlv4Uh2hxZJMoKMteiCYybJCJ1b6Yl6arOfQvtqAxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730954639; c=relaxed/simple;
	bh=VGw4dYPNVFl/JvxnmY/3QTHoouLcr1O//Zjc8jzp0NI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t8kMqsJO2dAyr1XPe4cU0bdPNZyP+DOB41Xc32dOKqWeVykc6dFr+WzGg0mykgBCCdMiEh1lrP5+lPt7GId3gJMLI9uMWqamMVwWtN+PZVQ6/zIgvmDCQMkJ1nOuAMVr3tHRZlm63ZyNw8aRFXB56TuluWywEE29CaY9JJQmVrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W9Yrdqme; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W9Yrdqme"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730954638; x=1762490638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VGw4dYPNVFl/JvxnmY/3QTHoouLcr1O//Zjc8jzp0NI=;
  b=W9YrdqmewkK7ENWu4+doYUiKJLiQixq74F0W/0XvQRe4s4CG/UyRAOBc
   aNqxntZ54EpGyn69LCNqtc5McdYsHVihdgvGNNolJbKh9JoUv9F2DxQuE
   UvjMiipObnZ2bGdiPZ94jz/YbjqLRYicjqQYCYVWLQkrG3+qi/L/XM1mY
   vR3fH8+KMzMhCFAdQDxqioYFsSh+fGlzCbZwDkyCLMP1/56pdi3/uA9Sd
   dJi6G9IIovhXXhe4jpWSGaP8JptzpLHP1OVv/fVPywf4vqtLzmBy3I5bu
   yADNNSM4ihjR6GqK+6wJY8KkzUydbrxlCFkWXs3DwRVjMwAQ/Z1rSGjp3
   w==;
X-CSE-ConnectionGUID: oZCvetiETP+8OujpwFuQ2A==
X-CSE-MsgGUID: VtwmgvXbT1eBUgfaSHf44g==
X-IronPort-AV: E=McAfee;i="6700,10204,11248"; a="42183816"
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="42183816"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 20:43:58 -0800
X-CSE-ConnectionGUID: uMIShX7TQw66EgKhpfb7iA==
X-CSE-MsgGUID: nPhGfZTIT6SmkANOH56NEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,264,1725346800"; 
   d="scan'208";a="84854634"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2024 20:43:55 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8uN7-000ppO-1a;
	Thu, 07 Nov 2024 04:43:53 +0000
Date: Thu, 7 Nov 2024 12:42:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 5/9] vhost: Add kthread support in function
 vhost_worker_queue()
Message-ID: <202411071251.tQLG8K6C-lkp@intel.com>
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
In-Reply-To: <20241105072642.898710-6-lulu@redhat.com>
References: <20241105072642.898710-6-lulu@redhat.com>
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
patch link:    https://lore.kernel.org/r/20241105072642.898710-6-lulu%40redhat.com
patch subject: [PATCH v3 5/9] vhost: Add kthread support in function vhost_worker_queue()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071251.tQLG8K6C-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411071251.tQLG8K6C-lkp@intel.com/

New smatch warnings:
drivers/vhost/vhost.c:241 vhost_worker_queue() error: we previously assumed 'worker' could be null (see line 241)

Old smatch warnings:
drivers/vhost/vhost.c:311 vhost_dev_flush() warn: iterator 'i' not incremented
drivers/vhost/vhost.c:678 vhost_attach_cgroups() error: uninitialized symbol 'ret'.
drivers/vhost/vhost.c:673 vhost_attach_cgroups() warn: iterator 'i' not incremented

vim +/worker +241 drivers/vhost/vhost.c

3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  237  
228a27cf78afc63 Mike Christie      2023-06-26  238  static void vhost_worker_queue(struct vhost_worker *worker,
0921dddcb589803 Mike Christie      2023-06-26  239  			       struct vhost_work *work)
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  240  {
001268765c12bbf Cindy Lu           2024-11-05 @241  	if (!worker && !worker->fn)
001268765c12bbf Cindy Lu           2024-11-05  242  		return;
001268765c12bbf Cindy Lu           2024-11-05  243  
04b96e5528ca971 Jason Wang         2016-04-25  244  	if (!test_and_set_bit(VHOST_WORK_QUEUED, &work->flags)) {
04b96e5528ca971 Jason Wang         2016-04-25  245  		/* We can only add the work to the list after we're
04b96e5528ca971 Jason Wang         2016-04-25  246  		 * sure it was not in the list.
635abf01918157e Peng Tao           2016-12-07  247  		 * test_and_set_bit() implies a memory barrier.
04b96e5528ca971 Jason Wang         2016-04-25  248  		 */
0921dddcb589803 Mike Christie      2023-06-26  249  		llist_add(&work->node, &worker->work_list);
001268765c12bbf Cindy Lu           2024-11-05  250  		worker->fn->wakeup(worker->dev->inherit_owner ?
001268765c12bbf Cindy Lu           2024-11-05  251  					   (void *)worker->vtsk :
001268765c12bbf Cindy Lu           2024-11-05  252  					   (void *)worker->task);
3a4d5c94e959359 Michael S. Tsirkin 2010-01-14  253  	}
ac9fde2474d04bd Qin Chuanyu        2013-06-07  254  }
0921dddcb589803 Mike Christie      2023-06-26  255  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
