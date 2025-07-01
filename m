Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5471F3B98
	for <oe-kbuild@lists.linux.dev>; Tue,  1 Jul 2025 18:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393205; cv=none; b=fsDZ+HH/RBKl93Wr6VDgSZqUNwpm5oeOfXyI5bdc+9X4+kYTuGpN6xo7xaeMt2y22bYmcN9PCRH3L13NTuAd3eimzqkAa1Z8SNgqfP1cGs3D77siQbUP3Kh3ALONdQ6JdIC8dtAHYc7aJU5HnQjHatzOdThKZqAIL7gmnDB2ycQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393205; c=relaxed/simple;
	bh=BHNjiZ9+qJMckv9yMZ+HdDXcKDBwkiM3dy+Q0TOwdg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VvCO3n4xT6IQO7gviVv2QRoW5MpnEQqYxgn/KsfzhsOOb+D22DAnske6zXUDsTH8PghRghRNpF8mMbocz7U7TS+C6WWGeINgk3ArJ010s03KFVjKKCWTQnLVI7xtty6UBkaLAMsxMyhb4maKremmM2ZtSVifFyr2/eZnEj2kJHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DRDoQDsm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DRDoQDsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751393203; x=1782929203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BHNjiZ9+qJMckv9yMZ+HdDXcKDBwkiM3dy+Q0TOwdg4=;
  b=DRDoQDsm7zmWaa0lKbMemL8FfAsJUXSRQ8fQB+oBbvUoyCH7zF9OwY5O
   JNgRzY1dsaMZ/gvVPVe6kbthchFKIugx9lHndzPLG+o+h6vOJFgbkUsTG
   6QzsPbY3T6zfFZvD/1LGph+In4t+ok5YZV+aZ+ddWafvSlETOzue6+IWo
   ojyAl4nv2amnSs73fGKI0hrShZx3SmV3vNEz9y0djX0q0k4Xm1PUFdhqn
   NbCvA6L4AXjkdxG2F+tfXqr6u4vBHqD0nUN7c/Hhb60GTV44qvn52TO0l
   P+5j3/zkYzR4mc7reXcpF6OjyFIrxQP0s2XxEbdJVDnkgYX6QB5KDjASo
   w==;
X-CSE-ConnectionGUID: 2cTfz6P1TZqkYwE80u775A==
X-CSE-MsgGUID: +7XnmzfzQ76MpFqSocW5hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="76221233"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="76221233"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 11:06:42 -0700
X-CSE-ConnectionGUID: xnsRvFZtSmq9YWgFo6hBmQ==
X-CSE-MsgGUID: vwWeHDGhRoewGJWtablg/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; 
   d="scan'208";a="154569430"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 01 Jul 2025 11:06:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWfNP-000aW2-0q;
	Tue, 01 Jul 2025 18:06:39 +0000
Date: Wed, 2 Jul 2025 02:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH net] virtio-net: fix a rtnl_lock() deadlock during probing
Message-ID: <202507020158.2hoKFZXE-lkp@intel.com>
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
In-Reply-To: <20250630095109.214013-1-zuozhijie@bytedance.com>
References: <20250630095109.214013-1-zuozhijie@bytedance.com>
TO: Zigit Zo <zuozhijie@bytedance.com>
TO: mst@redhat.com
TO: jasowang@redhat.com
TO: xuanzhuo@linux.alibaba.com
TO: eperezma@redhat.com
CC: zuozhijie@bytedance.com
CC: virtualization@lists.linux.dev
CC: netdev@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Zigit,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 2def09ead4ad5907988b655d1e1454003aaf8297]

url:    https://github.com/intel-lab-lkp/linux/commits/Zigit-Zo/virtio-net-fix-a-rtnl_lock-deadlock-during-probing/20250630-175257
base:   2def09ead4ad5907988b655d1e1454003aaf8297
patch link:    https://lore.kernel.org/r/20250630095109.214013-1-zuozhijie%40bytedance.com
patch subject: [PATCH net] virtio-net: fix a rtnl_lock() deadlock during probing
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-161-20250701 (https://download.01.org/0day-ci/archive/20250702/202507020158.2hoKFZXE-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507020158.2hoKFZXE-lkp@intel.com/

New smatch warnings:
drivers/net/virtio_net.c:6221 __virtnet_config_changed_work() error: uninitialized symbol 'virtio_cread_v'.
drivers/net/virtio_net.c:6225 __virtnet_config_changed_work() error: uninitialized symbol 'v'.

Old smatch warnings:
drivers/net/virtio_net.c:2108 build_skb_from_xdp_buff() error: uninitialized symbol 'nr_frags'.
drivers/net/virtio_net.c:2190 virtnet_build_xdp_buff_mrg() error: uninitialized symbol 'shinfo'.
drivers/net/virtio_net.c:3122 virtnet_update_settings() error: uninitialized symbol 'virtio_cread_v'.

vim +/virtio_cread_v +6221 drivers/net/virtio_net.c

76288b4e573e06 Stephen Hemminger  2009-01-06  6213  
d72ba54248be27 Zigit Zo           2025-06-30  6214  static void __virtnet_config_changed_work(struct work_struct *work,
d72ba54248be27 Zigit Zo           2025-06-30  6215  					  bool check_announce)
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6216  {
586d17c5a01bf1 Jason Wang         2012-04-11  6217  	struct virtnet_info *vi =
586d17c5a01bf1 Jason Wang         2012-04-11  6218  		container_of(work, struct virtnet_info, config_work);
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6219  	u16 v;
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6220  
855e0c5288177b Rusty Russell      2013-10-14 @6221  	if (virtio_cread_feature(vi->vdev, VIRTIO_NET_F_STATUS,
855e0c5288177b Rusty Russell      2013-10-14  6222  				 struct virtio_net_config, status, &v) < 0)
507613bf31f4bc Michael S. Tsirkin 2014-10-15  6223  		return;
586d17c5a01bf1 Jason Wang         2012-04-11  6224  
d72ba54248be27 Zigit Zo           2025-06-30 @6225  	if (check_announce && (v & VIRTIO_NET_S_ANNOUNCE)) {
ee89bab14e8576 Amerigo Wang       2012-08-09  6226  		netdev_notify_peers(vi->dev);
586d17c5a01bf1 Jason Wang         2012-04-11  6227  		virtnet_ack_link_announce(vi);
586d17c5a01bf1 Jason Wang         2012-04-11  6228  	}
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6229  
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6230  	/* Ignore unknown (future) status bits */
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6231  	v &= VIRTIO_NET_S_LINK_UP;
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6232  
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6233  	if (vi->status == v)
507613bf31f4bc Michael S. Tsirkin 2014-10-15  6234  		return;
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6235  
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6236  	vi->status = v;
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6237  
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6238  	if (vi->status & VIRTIO_NET_S_LINK_UP) {
faa9b39f0e9ddf Jason Baron        2018-01-05  6239  		virtnet_update_settings(vi);
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6240  		netif_carrier_on(vi->dev);
986a4f4d452dec Jason Wang         2012-12-07  6241  		netif_tx_wake_all_queues(vi->dev);
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6242  	} else {
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6243  		netif_carrier_off(vi->dev);
986a4f4d452dec Jason Wang         2012-12-07  6244  		netif_tx_stop_all_queues(vi->dev);
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6245  	}
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6246  }
9f4d26d0f3016c Mark McLoughlin    2009-01-19  6247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
