Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4F830129
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Dec 2023 22:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RUkyFfxu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702851327; x=1734387327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FCBmFwnlZzeaklkqC+V0i6LIREcrAekLp/bKssKaulk=;
  b=RUkyFfxuyAuaAAA32nnK9s72WNW2SGXmL88cYKYWgxcfx9L8rGneuOKK
   BRuNp2xlfR/mWw878LCzb7I6LlUJod6p49rlfUVhSu+Zu93UVRoMOSyx1
   8e6dLixXSr9mVaWuW5bRIZevLc+7+Uh7etXlbFvmyEV/UKQ+KMpT6uZLg
   ra9jGE9MC6sUglTQPy+W70acSTjGDojo+CQ110PZdTzuhTkPeEhycecyz
   mwwv2Uz06YqCEtvku3LgJvdy9E4BbC11TV3YN2c/GuEr6tBWQFVqpPuyo
   hm4iEXQHPro7ZjrNoVSzznyXdb+3LB2XFOeRqrXW5g8e9lJwwxzY0W0It
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="16989766"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="16989766"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 14:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="841274080"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="841274080"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 17 Dec 2023 14:15:22 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEzPs-0003TI-0V;
	Sun, 17 Dec 2023 22:15:20 +0000
Date: Mon, 18 Dec 2023 06:14:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/vhost/vhost.c:937:16: sparse: sparse: cast from restricted
 __virtio16
Message-ID: <202312180604.PJESvFM8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jason Wang <jasowang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0e389834672c723435a44818ed2cabc4dad24429
commit: 20c384f1ea1a0bc7320bc445c72dd02d2970d594 vhost: refine vhost and vringh kconfig
date:   3 years, 9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 years, 9 months ago
config: alpha-randconfig-r123-20231116 (https://download.01.org/0day-ci/archive/20231218/202312180604.PJESvFM8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231218/202312180604.PJESvFM8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312180604.PJESvFM8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1527:54: sparse: sparse: self-comparison always evaluates to false
   drivers/vhost/vhost.c:1528:54: sparse: sparse: self-comparison always evaluates to false
   drivers/vhost/vhost.c:1529:55: sparse: sparse: self-comparison always evaluates to false
   drivers/vhost/vhost.c:1782:46: sparse: sparse: self-comparison always evaluates to false
   drivers/vhost/vhost.c:1863:48: sparse: sparse: self-comparison always evaluates to false
>> drivers/vhost/vhost.c:937:16: sparse: sparse: cast from restricted __virtio16
>> drivers/vhost/vhost.c:937:16: sparse: sparse: cast from restricted __virtio16
   drivers/vhost/vhost.c:937:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:937:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:937:16: sparse:     got restricted __virtio16 [noderef] __user *
>> drivers/vhost/vhost.c:937:16: sparse: sparse: cast from restricted __virtio16
>> drivers/vhost/vhost.c:937:16: sparse: sparse: cast from restricted __virtio16
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *addr @@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:922:16: sparse: sparse: cast from restricted __virtio16
   drivers/vhost/vhost.c:922:16: sparse: sparse: cast from restricted __virtio16
   drivers/vhost/vhost.c:922:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got restricted __virtio16 [noderef] [usertype] __user * @@
   drivers/vhost/vhost.c:922:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:922:16: sparse:     got restricted __virtio16 [noderef] [usertype] __user *
   drivers/vhost/vhost.c:922:16: sparse: sparse: cast from restricted __virtio16
   drivers/vhost/vhost.c:922:16: sparse: sparse: cast from restricted __virtio16
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *addr @@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1014:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:1014:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:1014:16: sparse:     got restricted __virtio16 [noderef] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *addr @@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:989:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:     got restricted __virtio16 [noderef] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *addr @@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:995:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:995:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:995:16: sparse:     got restricted __virtio16 [noderef] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *addr @@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:944:16: sparse: sparse: cast from restricted __virtio16
   drivers/vhost/vhost.c:944:16: sparse: sparse: cast from restricted __virtio16
   drivers/vhost/vhost.c:944:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:944:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:944:16: sparse:     got restricted __virtio16 [noderef] __user *
   drivers/vhost/vhost.c:944:16: sparse: sparse: cast from restricted __virtio16
   drivers/vhost/vhost.c:944:16: sparse: sparse: cast from restricted __virtio16
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *addr @@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1002:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:1002:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:1002:16: sparse:     got restricted __virtio16 [noderef] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *addr @@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:1008:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got restricted __virtio16 [noderef] [usertype] __user * @@
   drivers/vhost/vhost.c:1008:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:1008:16: sparse:     got restricted __virtio16 [noderef] [usertype] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *addr @@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:989:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:     got restricted __virtio16 [noderef] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *addr @@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *
   drivers/vhost/vhost.c:989:16: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got restricted __virtio16 [noderef] __user * @@
   drivers/vhost/vhost.c:989:16: sparse:     expected void *addr
   drivers/vhost/vhost.c:989:16: sparse:     got restricted __virtio16 [noderef] __user *
   drivers/vhost/vhost.c:900:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __user *addr @@     got void *addr @@
   drivers/vhost/vhost.c:900:42: sparse:     expected void [noderef] __user *addr
   drivers/vhost/vhost.c:900:42: sparse:     got void *addr
   drivers/vhost/vhost.c:753:17: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __user * @@     got void * @@
   drivers/vhost/vhost.c:753:17: sparse:     expected void [noderef] __user *
   drivers/vhost/vhost.c:753:17: sparse:     got void *

vim +937 drivers/vhost/vhost.c

3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  743  
f889491380582b Jason Wang         2017-02-28  744  static inline void __user *vhost_vq_meta_fetch(struct vhost_virtqueue *vq,
f889491380582b Jason Wang         2017-02-28  745  					       u64 addr, unsigned int size,
f889491380582b Jason Wang         2017-02-28  746  					       int type)
f889491380582b Jason Wang         2017-02-28  747  {
f889491380582b Jason Wang         2017-02-28  748  	const struct vhost_umem_node *node = vq->meta_iotlb[type];
f889491380582b Jason Wang         2017-02-28  749  
f889491380582b Jason Wang         2017-02-28  750  	if (!node)
f889491380582b Jason Wang         2017-02-28  751  		return NULL;
f889491380582b Jason Wang         2017-02-28  752  
f889491380582b Jason Wang         2017-02-28 @753  	return (void *)(uintptr_t)(node->userspace_addr + addr - node->start);
f889491380582b Jason Wang         2017-02-28  754  }
f889491380582b Jason Wang         2017-02-28  755  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  756  /* Can we switch to this memory table? */
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  757  /* Caller should have device mutex but not vq mutex */
ddd3d4081ffa80 Stefan Hajnoczi    2018-04-11  758  static bool memory_access_ok(struct vhost_dev *d, struct vhost_umem *umem,
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  759  			     int log_all)
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  760  {
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  761  	int i;
d47effe1be0c4f Krishna Kumar      2011-03-01  762  
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  763  	for (i = 0; i < d->nvqs; ++i) {
ddd3d4081ffa80 Stefan Hajnoczi    2018-04-11  764  		bool ok;
ea16c51433510f Michael S. Tsirkin 2014-06-05  765  		bool log;
ea16c51433510f Michael S. Tsirkin 2014-06-05  766  
3ab2e420ec1caf Asias He           2013-04-27  767  		mutex_lock(&d->vqs[i]->mutex);
ea16c51433510f Michael S. Tsirkin 2014-06-05  768  		log = log_all || vhost_has_feature(d->vqs[i], VHOST_F_LOG_ALL);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  769  		/* If ring is inactive, will check when it's enabled. */
3ab2e420ec1caf Asias He           2013-04-27  770  		if (d->vqs[i]->private_data)
a9709d6874d551 Jason Wang         2016-06-23  771  			ok = vq_memory_access_ok(d->vqs[i]->log_base,
a9709d6874d551 Jason Wang         2016-06-23  772  						 umem, log);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  773  		else
ddd3d4081ffa80 Stefan Hajnoczi    2018-04-11  774  			ok = true;
3ab2e420ec1caf Asias He           2013-04-27  775  		mutex_unlock(&d->vqs[i]->mutex);
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  776  		if (!ok)
ddd3d4081ffa80 Stefan Hajnoczi    2018-04-11  777  			return false;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  778  	}
ddd3d4081ffa80 Stefan Hajnoczi    2018-04-11  779  	return true;
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  780  }
3a4d5c94e95935 Michael S. Tsirkin 2010-01-14  781  
6b1e6cc7855b09 Jason Wang         2016-06-23  782  static int translate_desc(struct vhost_virtqueue *vq, u64 addr, u32 len,
6b1e6cc7855b09 Jason Wang         2016-06-23  783  			  struct iovec iov[], int iov_size, int access);
bfe2bc512884d0 Jason Wang         2016-06-23  784  
72952cc0614b61 Michael S. Tsirkin 2016-12-06  785  static int vhost_copy_to_user(struct vhost_virtqueue *vq, void __user *to,
bfe2bc512884d0 Jason Wang         2016-06-23  786  			      const void *from, unsigned size)
bfe2bc512884d0 Jason Wang         2016-06-23  787  {
6b1e6cc7855b09 Jason Wang         2016-06-23  788  	int ret;
6b1e6cc7855b09 Jason Wang         2016-06-23  789  
6b1e6cc7855b09 Jason Wang         2016-06-23  790  	if (!vq->iotlb)
bfe2bc512884d0 Jason Wang         2016-06-23  791  		return __copy_to_user(to, from, size);
6b1e6cc7855b09 Jason Wang         2016-06-23  792  	else {
6b1e6cc7855b09 Jason Wang         2016-06-23  793  		/* This function should be called after iotlb
6b1e6cc7855b09 Jason Wang         2016-06-23  794  		 * prefetch, which means we're sure that all vq
6b1e6cc7855b09 Jason Wang         2016-06-23  795  		 * could be access through iotlb. So -EAGAIN should
6b1e6cc7855b09 Jason Wang         2016-06-23  796  		 * not happen in this case.
6b1e6cc7855b09 Jason Wang         2016-06-23  797  		 */
6b1e6cc7855b09 Jason Wang         2016-06-23  798  		struct iov_iter t;
f889491380582b Jason Wang         2017-02-28  799  		void __user *uaddr = vhost_vq_meta_fetch(vq,
f889491380582b Jason Wang         2017-02-28  800  				     (u64)(uintptr_t)to, size,
7ced6c98c7ab7a Eric Auger         2018-04-11  801  				     VHOST_ADDR_USED);
f889491380582b Jason Wang         2017-02-28  802  
f889491380582b Jason Wang         2017-02-28  803  		if (uaddr)
f889491380582b Jason Wang         2017-02-28  804  			return __copy_to_user(uaddr, from, size);
f889491380582b Jason Wang         2017-02-28  805  
6b1e6cc7855b09 Jason Wang         2016-06-23  806  		ret = translate_desc(vq, (u64)(uintptr_t)to, size, vq->iotlb_iov,
6b1e6cc7855b09 Jason Wang         2016-06-23  807  				     ARRAY_SIZE(vq->iotlb_iov),
6b1e6cc7855b09 Jason Wang         2016-06-23  808  				     VHOST_ACCESS_WO);
6b1e6cc7855b09 Jason Wang         2016-06-23  809  		if (ret < 0)
6b1e6cc7855b09 Jason Wang         2016-06-23  810  			goto out;
6b1e6cc7855b09 Jason Wang         2016-06-23  811  		iov_iter_init(&t, WRITE, vq->iotlb_iov, ret, size);
6b1e6cc7855b09 Jason Wang         2016-06-23  812  		ret = copy_to_iter(from, size, &t);
6b1e6cc7855b09 Jason Wang         2016-06-23  813  		if (ret == size)
6b1e6cc7855b09 Jason Wang         2016-06-23  814  			ret = 0;
6b1e6cc7855b09 Jason Wang         2016-06-23  815  	}
6b1e6cc7855b09 Jason Wang         2016-06-23  816  out:
6b1e6cc7855b09 Jason Wang         2016-06-23  817  	return ret;
bfe2bc512884d0 Jason Wang         2016-06-23  818  }
bfe2bc512884d0 Jason Wang         2016-06-23  819  
bfe2bc512884d0 Jason Wang         2016-06-23  820  static int vhost_copy_from_user(struct vhost_virtqueue *vq, void *to,
72952cc0614b61 Michael S. Tsirkin 2016-12-06  821  				void __user *from, unsigned size)
bfe2bc512884d0 Jason Wang         2016-06-23  822  {
6b1e6cc7855b09 Jason Wang         2016-06-23  823  	int ret;
6b1e6cc7855b09 Jason Wang         2016-06-23  824  
6b1e6cc7855b09 Jason Wang         2016-06-23  825  	if (!vq->iotlb)
bfe2bc512884d0 Jason Wang         2016-06-23  826  		return __copy_from_user(to, from, size);
6b1e6cc7855b09 Jason Wang         2016-06-23  827  	else {
6b1e6cc7855b09 Jason Wang         2016-06-23  828  		/* This function should be called after iotlb
6b1e6cc7855b09 Jason Wang         2016-06-23  829  		 * prefetch, which means we're sure that vq
6b1e6cc7855b09 Jason Wang         2016-06-23  830  		 * could be access through iotlb. So -EAGAIN should
6b1e6cc7855b09 Jason Wang         2016-06-23  831  		 * not happen in this case.
6b1e6cc7855b09 Jason Wang         2016-06-23  832  		 */
f889491380582b Jason Wang         2017-02-28  833  		void __user *uaddr = vhost_vq_meta_fetch(vq,
f889491380582b Jason Wang         2017-02-28  834  				     (u64)(uintptr_t)from, size,
f889491380582b Jason Wang         2017-02-28  835  				     VHOST_ADDR_DESC);
6b1e6cc7855b09 Jason Wang         2016-06-23  836  		struct iov_iter f;
f889491380582b Jason Wang         2017-02-28  837  
f889491380582b Jason Wang         2017-02-28  838  		if (uaddr)
f889491380582b Jason Wang         2017-02-28  839  			return __copy_from_user(to, uaddr, size);
f889491380582b Jason Wang         2017-02-28  840  
6b1e6cc7855b09 Jason Wang         2016-06-23  841  		ret = translate_desc(vq, (u64)(uintptr_t)from, size, vq->iotlb_iov,
6b1e6cc7855b09 Jason Wang         2016-06-23  842  				     ARRAY_SIZE(vq->iotlb_iov),
6b1e6cc7855b09 Jason Wang         2016-06-23  843  				     VHOST_ACCESS_RO);
6b1e6cc7855b09 Jason Wang         2016-06-23  844  		if (ret < 0) {
6b1e6cc7855b09 Jason Wang         2016-06-23  845  			vq_err(vq, "IOTLB translation failure: uaddr "
6b1e6cc7855b09 Jason Wang         2016-06-23  846  			       "%p size 0x%llx\n", from,
6b1e6cc7855b09 Jason Wang         2016-06-23  847  			       (unsigned long long) size);
6b1e6cc7855b09 Jason Wang         2016-06-23  848  			goto out;
6b1e6cc7855b09 Jason Wang         2016-06-23  849  		}
6b1e6cc7855b09 Jason Wang         2016-06-23  850  		iov_iter_init(&f, READ, vq->iotlb_iov, ret, size);
6b1e6cc7855b09 Jason Wang         2016-06-23  851  		ret = copy_from_iter(to, size, &f);
6b1e6cc7855b09 Jason Wang         2016-06-23  852  		if (ret == size)
6b1e6cc7855b09 Jason Wang         2016-06-23  853  			ret = 0;
6b1e6cc7855b09 Jason Wang         2016-06-23  854  	}
6b1e6cc7855b09 Jason Wang         2016-06-23  855  
6b1e6cc7855b09 Jason Wang         2016-06-23  856  out:
6b1e6cc7855b09 Jason Wang         2016-06-23  857  	return ret;
6b1e6cc7855b09 Jason Wang         2016-06-23  858  }
6b1e6cc7855b09 Jason Wang         2016-06-23  859  
f889491380582b Jason Wang         2017-02-28  860  static void __user *__vhost_get_user_slow(struct vhost_virtqueue *vq,
f889491380582b Jason Wang         2017-02-28  861  					  void __user *addr, unsigned int size,
f889491380582b Jason Wang         2017-02-28  862  					  int type)
6b1e6cc7855b09 Jason Wang         2016-06-23  863  {
6b1e6cc7855b09 Jason Wang         2016-06-23  864  	int ret;
6b1e6cc7855b09 Jason Wang         2016-06-23  865  
6b1e6cc7855b09 Jason Wang         2016-06-23  866  	ret = translate_desc(vq, (u64)(uintptr_t)addr, size, vq->iotlb_iov,
6b1e6cc7855b09 Jason Wang         2016-06-23  867  			     ARRAY_SIZE(vq->iotlb_iov),
6b1e6cc7855b09 Jason Wang         2016-06-23  868  			     VHOST_ACCESS_RO);
6b1e6cc7855b09 Jason Wang         2016-06-23  869  	if (ret < 0) {
6b1e6cc7855b09 Jason Wang         2016-06-23  870  		vq_err(vq, "IOTLB translation failure: uaddr "
6b1e6cc7855b09 Jason Wang         2016-06-23  871  			"%p size 0x%llx\n", addr,
6b1e6cc7855b09 Jason Wang         2016-06-23  872  			(unsigned long long) size);
6b1e6cc7855b09 Jason Wang         2016-06-23  873  		return NULL;
6b1e6cc7855b09 Jason Wang         2016-06-23  874  	}
6b1e6cc7855b09 Jason Wang         2016-06-23  875  
6b1e6cc7855b09 Jason Wang         2016-06-23  876  	if (ret != 1 || vq->iotlb_iov[0].iov_len != size) {
6b1e6cc7855b09 Jason Wang         2016-06-23  877  		vq_err(vq, "Non atomic userspace memory access: uaddr "
6b1e6cc7855b09 Jason Wang         2016-06-23  878  			"%p size 0x%llx\n", addr,
6b1e6cc7855b09 Jason Wang         2016-06-23  879  			(unsigned long long) size);
6b1e6cc7855b09 Jason Wang         2016-06-23  880  		return NULL;
6b1e6cc7855b09 Jason Wang         2016-06-23  881  	}
6b1e6cc7855b09 Jason Wang         2016-06-23  882  
6b1e6cc7855b09 Jason Wang         2016-06-23  883  	return vq->iotlb_iov[0].iov_base;
6b1e6cc7855b09 Jason Wang         2016-06-23  884  }
6b1e6cc7855b09 Jason Wang         2016-06-23  885  
f889491380582b Jason Wang         2017-02-28  886  /* This function should be called after iotlb
f889491380582b Jason Wang         2017-02-28  887   * prefetch, which means we're sure that vq
f889491380582b Jason Wang         2017-02-28  888   * could be access through iotlb. So -EAGAIN should
f889491380582b Jason Wang         2017-02-28  889   * not happen in this case.
f889491380582b Jason Wang         2017-02-28  890   */
f889491380582b Jason Wang         2017-02-28  891  static inline void __user *__vhost_get_user(struct vhost_virtqueue *vq,
f889491380582b Jason Wang         2017-02-28  892  					    void *addr, unsigned int size,
f889491380582b Jason Wang         2017-02-28  893  					    int type)
f889491380582b Jason Wang         2017-02-28  894  {
f889491380582b Jason Wang         2017-02-28  895  	void __user *uaddr = vhost_vq_meta_fetch(vq,
f889491380582b Jason Wang         2017-02-28  896  			     (u64)(uintptr_t)addr, size, type);
f889491380582b Jason Wang         2017-02-28  897  	if (uaddr)
f889491380582b Jason Wang         2017-02-28  898  		return uaddr;
f889491380582b Jason Wang         2017-02-28  899  
f889491380582b Jason Wang         2017-02-28  900  	return __vhost_get_user_slow(vq, addr, size, type);
f889491380582b Jason Wang         2017-02-28  901  }
f889491380582b Jason Wang         2017-02-28  902  
6b1e6cc7855b09 Jason Wang         2016-06-23  903  #define vhost_put_user(vq, x, ptr)		\
6b1e6cc7855b09 Jason Wang         2016-06-23  904  ({ \
6b1e6cc7855b09 Jason Wang         2016-06-23  905  	int ret = -EFAULT; \
6b1e6cc7855b09 Jason Wang         2016-06-23  906  	if (!vq->iotlb) { \
6b1e6cc7855b09 Jason Wang         2016-06-23  907  		ret = __put_user(x, ptr); \
6b1e6cc7855b09 Jason Wang         2016-06-23  908  	} else { \
6b1e6cc7855b09 Jason Wang         2016-06-23  909  		__typeof__(ptr) to = \
f889491380582b Jason Wang         2017-02-28  910  			(__typeof__(ptr)) __vhost_get_user(vq, ptr,	\
f889491380582b Jason Wang         2017-02-28  911  					  sizeof(*ptr), VHOST_ADDR_USED); \
6b1e6cc7855b09 Jason Wang         2016-06-23  912  		if (to != NULL) \
6b1e6cc7855b09 Jason Wang         2016-06-23  913  			ret = __put_user(x, to); \
6b1e6cc7855b09 Jason Wang         2016-06-23  914  		else \
6b1e6cc7855b09 Jason Wang         2016-06-23  915  			ret = -EFAULT;	\
6b1e6cc7855b09 Jason Wang         2016-06-23  916  	} \
6b1e6cc7855b09 Jason Wang         2016-06-23  917  	ret; \
6b1e6cc7855b09 Jason Wang         2016-06-23  918  })
6b1e6cc7855b09 Jason Wang         2016-06-23  919  
7b5d753ebc22c5 Jason Wang         2019-05-24  920  static inline int vhost_put_avail_event(struct vhost_virtqueue *vq)
7b5d753ebc22c5 Jason Wang         2019-05-24  921  {
7b5d753ebc22c5 Jason Wang         2019-05-24  922  	return vhost_put_user(vq, cpu_to_vhost16(vq, vq->avail_idx),
7b5d753ebc22c5 Jason Wang         2019-05-24  923  			      vhost_avail_event(vq));
7b5d753ebc22c5 Jason Wang         2019-05-24  924  }
7b5d753ebc22c5 Jason Wang         2019-05-24  925  
7b5d753ebc22c5 Jason Wang         2019-05-24  926  static inline int vhost_put_used(struct vhost_virtqueue *vq,
7b5d753ebc22c5 Jason Wang         2019-05-24  927  				 struct vring_used_elem *head, int idx,
7b5d753ebc22c5 Jason Wang         2019-05-24  928  				 int count)
7b5d753ebc22c5 Jason Wang         2019-05-24  929  {
7b5d753ebc22c5 Jason Wang         2019-05-24  930  	return vhost_copy_to_user(vq, vq->used->ring + idx, head,
7b5d753ebc22c5 Jason Wang         2019-05-24  931  				  count * sizeof(*head));
7b5d753ebc22c5 Jason Wang         2019-05-24  932  }
7b5d753ebc22c5 Jason Wang         2019-05-24  933  
7b5d753ebc22c5 Jason Wang         2019-05-24  934  static inline int vhost_put_used_flags(struct vhost_virtqueue *vq)
7b5d753ebc22c5 Jason Wang         2019-05-24  935  
7b5d753ebc22c5 Jason Wang         2019-05-24  936  {
7b5d753ebc22c5 Jason Wang         2019-05-24 @937  	return vhost_put_user(vq, cpu_to_vhost16(vq, vq->used_flags),
7b5d753ebc22c5 Jason Wang         2019-05-24  938  			      &vq->used->flags);
7b5d753ebc22c5 Jason Wang         2019-05-24  939  }
7b5d753ebc22c5 Jason Wang         2019-05-24  940  

:::::: The code at line 937 was first introduced by commit
:::::: 7b5d753ebc22c5b6935a70ce9a857dc6220784f8 vhost: fine grain userspace memory accessors

:::::: TO: Jason Wang <jasowang@redhat.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
