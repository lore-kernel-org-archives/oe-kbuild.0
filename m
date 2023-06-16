Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D0F1B914
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 19:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686942981; x=1718478981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nhDAb0Htg5tzOAG0MILtt36JB5eW43VGBxjIDD9/EdI=;
  b=dtybBkWpLoaWgkWKvqJGmMXRI8dYwF8hvnBPDhMfo2n4nT31rkvrIxPa
   2I6aXWZhy0gs5VlnOPRkENi3fFOZJLDclBbfzlVUNVveskxTzr7PnvqHj
   xbqgJ7GlSXLmjfsX6FnKocq72VBfhbTNYdor7Ga/mv0uymBOwsVso0c60
   IlYskm2kkVC8KKjJzgpdG0Ug1dgHmLmm1XPytVjgnWfoBPWsV3AiHBvt9
   Pa++3zYc/v48BYGKAotLKqad4GiWdjfxv4vssf4nvw3ZRRoedbQm8l1WU
   lpREsKSl7GHYYlgdst7taOGG0IIox8n9Y47ZYNibSVI2fvAGcC7snlopj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="422946595"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="422946595"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 12:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="959725084"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="959725084"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 16 Jun 2023 12:15:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAEvG-0001ju-2I;
	Fri, 16 Jun 2023 19:15:50 +0000
Date: Sat, 17 Jun 2023 03:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vhost/vringh.c:1320 putu16_iotlb() warn: ignoring
 unreachable code.
Message-ID: <202306170341.RSzzJX6H-lkp@intel.com>
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
TO: Stefano Garzarella <sgarzare@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40f71e7cd3c6ac04293556ab0504a372393838ff
commit: 42823a871fd4e17b34034f43b36ae57bd2ed8a67 vringh: support VA with iotlb
date:   8 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 weeks ago
config: arc-randconfig-m041-20230615 (https://download.01.org/0day-ci/archive/20230617/202306170341.RSzzJX6H-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170341.RSzzJX6H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306170341.RSzzJX6H-lkp@intel.com/

smatch warnings:
drivers/vhost/vringh.c:1320 putu16_iotlb() warn: ignoring unreachable code.

vim +1320 drivers/vhost/vringh.c

9ad9c49cfe970b Jason Wang         2020-03-26  1295  
9ad9c49cfe970b Jason Wang         2020-03-26  1296  static inline int putu16_iotlb(const struct vringh *vrh,
9ad9c49cfe970b Jason Wang         2020-03-26  1297  			       __virtio16 *p, u16 val)
9ad9c49cfe970b Jason Wang         2020-03-26  1298  {
42823a871fd4e1 Stefano Garzarella 2023-04-04  1299  	struct iotlb_vec ivec;
42823a871fd4e1 Stefano Garzarella 2023-04-04  1300  	union {
42823a871fd4e1 Stefano Garzarella 2023-04-04  1301  		struct iovec iovec;
42823a871fd4e1 Stefano Garzarella 2023-04-04  1302  		struct bio_vec bvec;
42823a871fd4e1 Stefano Garzarella 2023-04-04  1303  	} iov;
42823a871fd4e1 Stefano Garzarella 2023-04-04  1304  	__virtio16 tmp;
9ad9c49cfe970b Jason Wang         2020-03-26  1305  	int ret;
9ad9c49cfe970b Jason Wang         2020-03-26  1306  
42823a871fd4e1 Stefano Garzarella 2023-04-04  1307  	ivec.iov.iovec = &iov.iovec;
42823a871fd4e1 Stefano Garzarella 2023-04-04  1308  	ivec.count = 1;
42823a871fd4e1 Stefano Garzarella 2023-04-04  1309  
9ad9c49cfe970b Jason Wang         2020-03-26  1310  	/* Atomic write is needed for putu16 */
42823a871fd4e1 Stefano Garzarella 2023-04-04  1311  	ret = iotlb_translate(vrh, (u64)(uintptr_t)p, sizeof(*p),
42823a871fd4e1 Stefano Garzarella 2023-04-04  1312  			      NULL, &ivec, VHOST_MAP_RO);
9ad9c49cfe970b Jason Wang         2020-03-26  1313  	if (ret < 0)
9ad9c49cfe970b Jason Wang         2020-03-26  1314  		return ret;
9ad9c49cfe970b Jason Wang         2020-03-26  1315  
42823a871fd4e1 Stefano Garzarella 2023-04-04  1316  	tmp = cpu_to_vringh16(vrh, val);
42823a871fd4e1 Stefano Garzarella 2023-04-04  1317  
42823a871fd4e1 Stefano Garzarella 2023-04-04  1318  	if (vrh->use_va) {
42823a871fd4e1 Stefano Garzarella 2023-04-04  1319  		ret = __put_user(tmp, (__virtio16 __user *)ivec.iov.iovec[0].iov_base);
42823a871fd4e1 Stefano Garzarella 2023-04-04 @1320  		if (ret)
42823a871fd4e1 Stefano Garzarella 2023-04-04  1321  			return ret;
42823a871fd4e1 Stefano Garzarella 2023-04-04  1322  	} else {
42823a871fd4e1 Stefano Garzarella 2023-04-04  1323  		void *kaddr = kmap_local_page(ivec.iov.bvec[0].bv_page);
42823a871fd4e1 Stefano Garzarella 2023-04-04  1324  		void *to = kaddr + ivec.iov.bvec[0].bv_offset;
42823a871fd4e1 Stefano Garzarella 2023-04-04  1325  
42823a871fd4e1 Stefano Garzarella 2023-04-04  1326  		WRITE_ONCE(*(__virtio16 *)to, tmp);
c0371782500c53 Stefano Garzarella 2023-04-04  1327  		kunmap_local(kaddr);
42823a871fd4e1 Stefano Garzarella 2023-04-04  1328  	}
9ad9c49cfe970b Jason Wang         2020-03-26  1329  
9ad9c49cfe970b Jason Wang         2020-03-26  1330  	return 0;
9ad9c49cfe970b Jason Wang         2020-03-26  1331  }
9ad9c49cfe970b Jason Wang         2020-03-26  1332  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
