Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579CF234979
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 18:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742668826; cv=none; b=pKBZVgZs+jfRHGInbJc0BtYkZ6qHmy+6Ki3ciTofICCAX6KcG+d6Vvnae8P+JzcdsNEg9VVYrwDYAc/mLehbA+v4WVWgzhaWY9R++YP6Sz/6Jy9pPk10/nVQ31I79mMORhCQ6rj+GF14UbyYP0z6nvFKBU/N05Rq7QfYZ+BXkh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742668826; c=relaxed/simple;
	bh=ktZDnE7+MkoDAL+G6SYUnNYwPgrZPWZ//9VzVh5NDas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R2Ty1FD9QRlwC0dDw3LDe3ett+wMdcZ5FjjI0vdi8QZyNRZl05ApB02n0gyDRhTIFh9lHaYAr47QHxpra8901yg5SvmJcezpK+IRXEdWrrgMiV3aairK/BjfjwzRaNBhDcpibg/LInOJo5vvN7u398CgZ6/t+otZlWUGDaEgXTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HyLjNuoF; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HyLjNuoF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742668824; x=1774204824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ktZDnE7+MkoDAL+G6SYUnNYwPgrZPWZ//9VzVh5NDas=;
  b=HyLjNuoFoWuuBYZcDlLRuolrxuMsllzZOjBL79NeZeOrJO0YgcsoGBKx
   al4dLbRsnZkX/vnBWwQfxb7X8cL5wC/cW4FEQNNOUPIOudjUmecYBswVK
   6I0WRlgXzAML5WDb2bRkuAHd1Zk+CaycInSOzmE3GyFZhdzPIS7rNwQ+A
   ohnbZGHZDSfVTSFTcXj1nrswz0fZBZOLA1IFnve3XH4wZN9UeI83VeLKH
   2FBJa4uCBffn8aXn42bW1vQektsIncgLCVt/BNFjhWp4YgGnNlhPei/jU
   IwcyLBlM/IwDY3nHcV1n0sDjOXC08RjVvnfvVWBUVX41saMl01GisDk3T
   A==;
X-CSE-ConnectionGUID: bNvqDcL5SJ2xXasnRwa1+Q==
X-CSE-MsgGUID: fy2PgjTHS5yuXIPU0F1Y2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="47691134"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="47691134"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 11:40:24 -0700
X-CSE-ConnectionGUID: v2xSj/SaTRW9z3ZJKrMxxw==
X-CSE-MsgGUID: M7GtClgBSr+/QVxtvhu+7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="154568044"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 22 Mar 2025 11:40:22 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw3lb-0002Kp-1U;
	Sat, 22 Mar 2025 18:40:19 +0000
Date: Sun, 23 Mar 2025 02:39:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [vireshk:virtio/msg-xen 7/21] drivers/virtio/virtio_msg.c:534
 virtio_msg_register() error: we previously assumed 'vmdev' could be null
 (see line 509)
Message-ID: <202503230220.eCERpgG9-lkp@intel.com>
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
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vireshk/linux.git virtio/msg-xen
head:   dd4f28ef237ef9221a468ffabacdaebb282483c4
commit: 0b9cfce02499ff45fc7c387c0cbcdbba91967b4c [7/21] virtio-msg: Add support for FFA based channel bus
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r071-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230220.eCERpgG9-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503230220.eCERpgG9-lkp@intel.com/

smatch warnings:
drivers/virtio/virtio_msg.c:534 virtio_msg_register() error: we previously assumed 'vmdev' could be null (see line 509)
drivers/virtio/virtio_msg.c:534 virtio_msg_register() error: we previously assumed 'vmdev->ops' could be null (see line 509)

vim +/vmdev +534 drivers/virtio/virtio_msg.c

1dea9ff9390f7a Viresh Kumar 2024-08-16  499  
1dea9ff9390f7a Viresh Kumar 2024-08-16  500  int virtio_msg_register(struct virtio_msg_device *vmdev)
1dea9ff9390f7a Viresh Kumar 2024-08-16  501  {
1dea9ff9390f7a Viresh Kumar 2024-08-16  502  	int ret;
1dea9ff9390f7a Viresh Kumar 2024-08-16  503  
1dea9ff9390f7a Viresh Kumar 2024-08-16  504  	/*
1dea9ff9390f7a Viresh Kumar 2024-08-16  505  	 * Field expected to be filled by underlying architecture specific
1dea9ff9390f7a Viresh Kumar 2024-08-16  506  	 * transport layer are vmdev->data (optional), vmdev->ops, and
1dea9ff9390f7a Viresh Kumar 2024-08-16  507  	 * vmdev->vdev.dev.parent.
1dea9ff9390f7a Viresh Kumar 2024-08-16  508  	 */
1dea9ff9390f7a Viresh Kumar 2024-08-16 @509  	if (!vmdev || !vmdev->ops || !vmdev->ops->send) {
1dea9ff9390f7a Viresh Kumar 2024-08-16  510  		ret = -EINVAL;
1dea9ff9390f7a Viresh Kumar 2024-08-16  511  		goto out;
1dea9ff9390f7a Viresh Kumar 2024-08-16  512  	}
1dea9ff9390f7a Viresh Kumar 2024-08-16  513  
1dea9ff9390f7a Viresh Kumar 2024-08-16  514  	virtio_msg_async_init(&vmdev->async);
1dea9ff9390f7a Viresh Kumar 2024-08-16  515  	vmdev->vdev.config = &virtio_msg_config_ops;
1dea9ff9390f7a Viresh Kumar 2024-08-16  516  	vmdev->vdev.dev.release = virtio_msg_release_dev;
1dea9ff9390f7a Viresh Kumar 2024-08-16  517  	INIT_LIST_HEAD(&vmdev->virtqueues);
1dea9ff9390f7a Viresh Kumar 2024-08-16  518  	spin_lock_init(&vmdev->lock);
1dea9ff9390f7a Viresh Kumar 2024-08-16  519  
1dea9ff9390f7a Viresh Kumar 2024-08-16  520  	if (vmdev->ops->synchronize_cbs)
1dea9ff9390f7a Viresh Kumar 2024-08-16  521  		virtio_msg_config_ops.synchronize_cbs = vmsg_synchronize_cbs;
1dea9ff9390f7a Viresh Kumar 2024-08-16  522  
1dea9ff9390f7a Viresh Kumar 2024-08-16  523  	ret = vmsg_get_device_info(vmdev);
1dea9ff9390f7a Viresh Kumar 2024-08-16  524  	if (ret)
1dea9ff9390f7a Viresh Kumar 2024-08-16  525  		goto out;
1dea9ff9390f7a Viresh Kumar 2024-08-16  526  
1dea9ff9390f7a Viresh Kumar 2024-08-16  527  	ret = register_virtio_device(&vmdev->vdev);
1dea9ff9390f7a Viresh Kumar 2024-08-16  528  	if (ret)
1dea9ff9390f7a Viresh Kumar 2024-08-16  529  		put_device(&vmdev->vdev.dev);
1dea9ff9390f7a Viresh Kumar 2024-08-16  530  
1dea9ff9390f7a Viresh Kumar 2024-08-16  531  	return ret;
1dea9ff9390f7a Viresh Kumar 2024-08-16  532  
1dea9ff9390f7a Viresh Kumar 2024-08-16  533  out:
1dea9ff9390f7a Viresh Kumar 2024-08-16 @534  	vmdev->ops->release(vmdev);
1dea9ff9390f7a Viresh Kumar 2024-08-16  535  	return ret;
1dea9ff9390f7a Viresh Kumar 2024-08-16  536  }
1dea9ff9390f7a Viresh Kumar 2024-08-16  537  EXPORT_SYMBOL_GPL(virtio_msg_register);
1dea9ff9390f7a Viresh Kumar 2024-08-16  538  

:::::: The code at line 534 was first introduced by commit
:::::: 1dea9ff9390f7af23eb310a5499f504b7b681bd4 virtio: Add support for virtio-msg transport

:::::: TO: Viresh Kumar <viresh.kumar@linaro.org>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
