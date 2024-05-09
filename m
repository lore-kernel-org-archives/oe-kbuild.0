Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5268517579
	for <oe-kbuild@lists.linux.dev>; Thu,  9 May 2024 12:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715259305; cv=none; b=ttA0R64JGx34qm2L5yNmNcBRaOByA3ZuS2JOIuC6NLePXWQs1AafKwpsUn2CkhQD+iVZvtqMtswEMKlULJJZq5p3LxAwd57iyhY6xaBLHLYh8+OoE4rhqlxrm+ftNT0iT+pTncB6uFjDJpIEZ8/h0UkyYJmMyAXo7qwmQzZG4/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715259305; c=relaxed/simple;
	bh=lQzouvyw2+THC80i/Tvs0nSisIGmGUEXnt9LSJipHBc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sJ0SPZWF/uBHc7bKgcKlNxCHTMDvMzHsZAfs8HXbK4pEWMz9rW2MnALLLpeRO82QkjQulskHeAAjn+FgyOjYd27xof5E399KGwPehJ4f+0IDLgOSvJfLU7lMQdsXkIzps5uP+r9mjEvq0UFKjgasQRBLO64adbPYTTOtKw7TRE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BTxivk2R; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BTxivk2R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715259303; x=1746795303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lQzouvyw2+THC80i/Tvs0nSisIGmGUEXnt9LSJipHBc=;
  b=BTxivk2Rox0j+1Ip+7LW6nrO5nWLdR+Z2LKWeWjASffgny51YS+amsfM
   wGdrsGkbhUbXEwJ1MR09pFys4tafnn4Akf7BNRxtWVCieUAGYxoeakI5l
   /+0t0RkneZx6F+bk7OyXQMSd7KN74AUv/qF8syZsmjU8PycJIB7DdxC/8
   Xiq8IXi8B6wFdDDClz1zcNMKnHGcV+EGDLzREioQQybBNO9rfsdeNlnIy
   ax6kASn1VA6vE22uzx7GJM7SHktyuZSGrTyEeIABLbeu/OGcuuu4zbGW6
   Nm41wdtPYzM5KLRw7fIYdZMq34H+b2fPfKC/q7kU9wUZpewUZePSQu4mC
   g==;
X-CSE-ConnectionGUID: D4M54C6HQj+QfmeMBLvgKQ==
X-CSE-MsgGUID: TeNlhylkQRGqi9hyvN3cSg==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21746159"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="21746159"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 05:55:03 -0700
X-CSE-ConnectionGUID: dBY3Y/J6SraNGVsDzAAzVg==
X-CSE-MsgGUID: a8XPqQbhQ62vTQ6CyUcT6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="29774770"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2024 05:55:02 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s53IZ-0004vY-0d;
	Thu, 09 May 2024 12:54:59 +0000
Date: Thu, 9 May 2024 20:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 11142/12321] drivers/net/virtio_net.c:4325:1-7:
 preceding lock on line 4279
Message-ID: <202405092050.xnYCOXXp-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Daniel Jurgens <danielj@nvidia.com>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Heng Qi <hengqi@linux.alibaba.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   704ba27ac55579704ba1289392448b0c66b56258
commit: 4d4ac2ececd3c42a08dd32a6e3a4aaf25f7efe44 [11142/12321] virtio_net: Add a lock for per queue RX coalesce
:::::: branch date: 6 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-104-20240509 (https://download.01.org/0day-ci/archive/20240509/202405092050.xnYCOXXp-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405092050.xnYCOXXp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/virtio_net.c:4325:1-7: preceding lock on line 4279

vim +4325 drivers/net/virtio_net.c

d7180080ddf7dc2 Heng Qi        2023-12-11  4260  
d7180080ddf7dc2 Heng Qi        2023-12-11  4261  static int virtnet_send_rx_notf_coal_cmds(struct virtnet_info *vi,
d7180080ddf7dc2 Heng Qi        2023-12-11  4262  					  struct ethtool_coalesce *ec)
d7180080ddf7dc2 Heng Qi        2023-12-11  4263  {
ff7c7d9f5261e43 Daniel Jurgens 2024-05-03  4264  	struct virtio_net_ctrl_coal_rx *coal_rx __free(kfree) = NULL;
6208799553a8587 Heng Qi        2023-12-11  4265  	bool rx_ctrl_dim_on = !!ec->use_adaptive_rx_coalesce;
d7180080ddf7dc2 Heng Qi        2023-12-11  4266  	struct scatterlist sgs_rx;
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4267  	int ret = 0;
d7180080ddf7dc2 Heng Qi        2023-12-11  4268  	int i;
d7180080ddf7dc2 Heng Qi        2023-12-11  4269  
6208799553a8587 Heng Qi        2023-12-11  4270  	if (rx_ctrl_dim_on && !virtio_has_feature(vi->vdev, VIRTIO_NET_F_VQ_NOTF_COAL))
6208799553a8587 Heng Qi        2023-12-11  4271  		return -EOPNOTSUPP;
6208799553a8587 Heng Qi        2023-12-11  4272  
6208799553a8587 Heng Qi        2023-12-11  4273  	if (rx_ctrl_dim_on && (ec->rx_coalesce_usecs != vi->intr_coal_rx.max_usecs ||
6208799553a8587 Heng Qi        2023-12-11  4274  			       ec->rx_max_coalesced_frames != vi->intr_coal_rx.max_packets))
6208799553a8587 Heng Qi        2023-12-11  4275  		return -EINVAL;
6208799553a8587 Heng Qi        2023-12-11  4276  
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4277  	/* Acquire all queues dim_locks */
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4278  	for (i = 0; i < vi->max_queue_pairs; i++)
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03 @4279  		mutex_lock(&vi->rq[i].dim_lock);
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4280  
6208799553a8587 Heng Qi        2023-12-11  4281  	if (rx_ctrl_dim_on && !vi->rx_dim_enabled) {
6208799553a8587 Heng Qi        2023-12-11  4282  		vi->rx_dim_enabled = true;
6208799553a8587 Heng Qi        2023-12-11  4283  		for (i = 0; i < vi->max_queue_pairs; i++)
6208799553a8587 Heng Qi        2023-12-11  4284  			vi->rq[i].dim_enabled = true;
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4285  		goto unlock;
6208799553a8587 Heng Qi        2023-12-11  4286  	}
6208799553a8587 Heng Qi        2023-12-11  4287  
ff7c7d9f5261e43 Daniel Jurgens 2024-05-03  4288  	coal_rx = kzalloc(sizeof(*coal_rx), GFP_KERNEL);
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4289  	if (!coal_rx) {
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4290  		ret = -ENOMEM;
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4291  		goto unlock;
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4292  	}
ff7c7d9f5261e43 Daniel Jurgens 2024-05-03  4293  
6208799553a8587 Heng Qi        2023-12-11  4294  	if (!rx_ctrl_dim_on && vi->rx_dim_enabled) {
6208799553a8587 Heng Qi        2023-12-11  4295  		vi->rx_dim_enabled = false;
6208799553a8587 Heng Qi        2023-12-11  4296  		for (i = 0; i < vi->max_queue_pairs; i++)
6208799553a8587 Heng Qi        2023-12-11  4297  			vi->rq[i].dim_enabled = false;
6208799553a8587 Heng Qi        2023-12-11  4298  	}
6208799553a8587 Heng Qi        2023-12-11  4299  
6208799553a8587 Heng Qi        2023-12-11  4300  	/* Since the per-queue coalescing params can be set,
6208799553a8587 Heng Qi        2023-12-11  4301  	 * we need apply the global new params even if they
6208799553a8587 Heng Qi        2023-12-11  4302  	 * are not updated.
6208799553a8587 Heng Qi        2023-12-11  4303  	 */
ff7c7d9f5261e43 Daniel Jurgens 2024-05-03  4304  	coal_rx->rx_usecs = cpu_to_le32(ec->rx_coalesce_usecs);
ff7c7d9f5261e43 Daniel Jurgens 2024-05-03  4305  	coal_rx->rx_max_packets = cpu_to_le32(ec->rx_max_coalesced_frames);
ff7c7d9f5261e43 Daniel Jurgens 2024-05-03  4306  	sg_init_one(&sgs_rx, coal_rx, sizeof(*coal_rx));
699b045a8e43bd1 Alvaro Karsz   2022-07-18  4307  
699b045a8e43bd1 Alvaro Karsz   2022-07-18  4308  	if (!virtnet_send_command(vi, VIRTIO_NET_CTRL_NOTF_COAL,
699b045a8e43bd1 Alvaro Karsz   2022-07-18  4309  				  VIRTIO_NET_CTRL_NOTF_COAL_RX_SET,
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4310  				  &sgs_rx)) {
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4311  		ret = -EINVAL;
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4312  		goto unlock;
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4313  	}
699b045a8e43bd1 Alvaro Karsz   2022-07-18  4314  
308d7982dcdc925 Gavin Li       2023-07-31  4315  	vi->intr_coal_rx.max_usecs = ec->rx_coalesce_usecs;
308d7982dcdc925 Gavin Li       2023-07-31  4316  	vi->intr_coal_rx.max_packets = ec->rx_max_coalesced_frames;
e9420838ab4ffb8 Heng Qi        2023-10-08  4317  	for (i = 0; i < vi->max_queue_pairs; i++) {
e9420838ab4ffb8 Heng Qi        2023-10-08  4318  		vi->rq[i].intr_coal.max_usecs = ec->rx_coalesce_usecs;
e9420838ab4ffb8 Heng Qi        2023-10-08  4319  		vi->rq[i].intr_coal.max_packets = ec->rx_max_coalesced_frames;
e9420838ab4ffb8 Heng Qi        2023-10-08  4320  	}
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4321  unlock:
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4322  	for (i = vi->max_queue_pairs - 1; i >= 0; i--)
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03  4323  		mutex_unlock(&vi->rq[i].dim_lock);
699b045a8e43bd1 Alvaro Karsz   2022-07-18  4324  
4d4ac2ececd3c42 Daniel Jurgens 2024-05-03 @4325  	return ret;
699b045a8e43bd1 Alvaro Karsz   2022-07-18  4326  }
699b045a8e43bd1 Alvaro Karsz   2022-07-18  4327  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
