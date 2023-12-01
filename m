Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B245787D
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Dec 2023 20:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e9QBfbYu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701462603; x=1732998603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Lw+SxGIb/rsRa/RC0ItoHnw4cJZFziDcwQSeIFpK5g=;
  b=e9QBfbYu3e7myM6mADv628W1LMth9YMA/cX1fSRZQDkL788h4lnB+Ggm
   CeDWcqDFwUv1VNKdjoDrMU6HTrXHuyjC/X37m9590hxV+EUFKmRPRFNlO
   l79e3wshA6p7sKXWY8NmluDMy+1pYj3y7MBhS9d7YBCagYCgSSH/LN6c1
   paC5Cumceu4TK1HcYjV87bWGLLF598zLlwU7B+WyYYtmzZfhFhmOp9oGC
   CmPf/A8SBY6yX3Iqq26m9/pTRLwf2A83JP/DcoEzUucsA+MViuyPC7Wi+
   w/qQDtVMJImq+PyJNSmgaDmyQAfT3hMz4MsI6KCu0+owYU/OuI4IviRMa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="6836754"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="6836754"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2023 12:30:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10911"; a="943193418"
X-IronPort-AV: E=Sophos;i="6.04,242,1695711600"; 
   d="scan'208";a="943193418"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 01 Dec 2023 12:30:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9A99-0004GB-01;
	Fri, 01 Dec 2023 20:29:59 +0000
Date: Sat, 2 Dec 2023 04:29:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/vhost/vringh.c:1320 putu16_iotlb() warn: ignoring
 unreachable code.
Message-ID: <202312020416.kzLtRPwd-lkp@intel.com>
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
head:   994d5c58e50e91bb02c7be4a91d5186292a895c8
commit: 42823a871fd4e17b34034f43b36ae57bd2ed8a67 vringh: support VA with iotlb
date:   8 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 8 months ago
config: hexagon-randconfig-r071-20231124 (https://download.01.org/0day-ci/archive/20231202/202312020416.kzLtRPwd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231202/202312020416.kzLtRPwd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312020416.kzLtRPwd-lkp@intel.com/

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
