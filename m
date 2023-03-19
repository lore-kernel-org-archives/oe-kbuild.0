Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DA97C
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 20:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679258061; x=1710794061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yc9xzSkpI2tVBuaiBza6k00/gbRU9UM2LyOrySvde/Q=;
  b=IS+9TfNezv3UI28Ne0Yp204wjY/Fo2m5l9dqdYTZGQIIebI1V45XNb05
   KXMY061q0dTngmd01F7SktLeSHBlETLaJ0C116hqAm7fbHWVuCyPVksI4
   Dgkn3admEfT4x+Y0aWXyLSxtfWHoa0OXjs2wuBiV30Dyajeb6sOnED1bE
   wUxcUIoKzas7OL76QjHaKrovPz2AJEq7OJv7qiIzhJpvoNM/nq6ef5gH9
   dlSVdyM6tALtiI1vTRYkJYw7nkSS+63cZUkf2NsgM4YJ004ySt/yg/7rU
   QrSgcxo+xi36X6rIPHU4fEiliJofgtaSKzz03RGcdEimp1gg2Rvtof4Zf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="322380883"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="322380883"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2023 13:34:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10654"; a="749860643"
X-IronPort-AV: E=Sophos;i="5.98,274,1673942400"; 
   d="scan'208";a="749860643"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Mar 2023 13:34:19 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdzjO-000AeE-0q;
	Sun, 19 Mar 2023 20:34:18 +0000
Date: Mon, 20 Mar 2023 04:33:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/block/nbd.c:1563 nbd_open() warn: passing a valid pointer to
 'PTR_ERR'
Message-ID: <202303200401.f9MokspP-lkp@intel.com>
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
TO: Yu Kuai <yukuai3@huawei.com>
CC: Jens Axboe <axboe@kernel.dk>
CC: Hou Tao <houtao1@huawei.com>
CC: Josef Bacik <josef@toxicpanda.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eaba52d63bfcf0047ce3a1bb011b35d4f066df8e
commit: c55b2b983b0fa012942c3eb16384b2b722caa810 nbd: fix race between nbd_alloc_config() and module removal
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-m031-20230319 (https://download.01.org/0day-ci/archive/20230320/202303200401.f9MokspP-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303200401.f9MokspP-lkp@intel.com/

New smatch warnings:
drivers/block/nbd.c:1563 nbd_open() warn: passing a valid pointer to 'PTR_ERR'
drivers/block/nbd.c:1978 nbd_genl_connect() warn: passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
arch/riscv/include/asm/atomic.h:204 arch_atomic_fetch_add_unless() warn: inconsistent indenting

vim +/PTR_ERR +1563 drivers/block/nbd.c

5ea8d10802ec4c Josef Bacik       2017-04-06  1537  
5ea8d10802ec4c Josef Bacik       2017-04-06  1538  static int nbd_open(struct block_device *bdev, fmode_t mode)
5ea8d10802ec4c Josef Bacik       2017-04-06  1539  {
5ea8d10802ec4c Josef Bacik       2017-04-06  1540  	struct nbd_device *nbd;
5ea8d10802ec4c Josef Bacik       2017-04-06  1541  	int ret = 0;
5ea8d10802ec4c Josef Bacik       2017-04-06  1542  
5ea8d10802ec4c Josef Bacik       2017-04-06  1543  	mutex_lock(&nbd_index_mutex);
5ea8d10802ec4c Josef Bacik       2017-04-06  1544  	nbd = bdev->bd_disk->private_data;
5ea8d10802ec4c Josef Bacik       2017-04-06  1545  	if (!nbd) {
5ea8d10802ec4c Josef Bacik       2017-04-06  1546  		ret = -ENXIO;
5ea8d10802ec4c Josef Bacik       2017-04-06  1547  		goto out;
5ea8d10802ec4c Josef Bacik       2017-04-06  1548  	}
c6a4759ea0c9a7 Josef Bacik       2017-04-06  1549  	if (!refcount_inc_not_zero(&nbd->refs)) {
c6a4759ea0c9a7 Josef Bacik       2017-04-06  1550  		ret = -ENXIO;
c6a4759ea0c9a7 Josef Bacik       2017-04-06  1551  		goto out;
c6a4759ea0c9a7 Josef Bacik       2017-04-06  1552  	}
5ea8d10802ec4c Josef Bacik       2017-04-06  1553  	if (!refcount_inc_not_zero(&nbd->config_refs)) {
5ea8d10802ec4c Josef Bacik       2017-04-06  1554  		struct nbd_config *config;
5ea8d10802ec4c Josef Bacik       2017-04-06  1555  
5ea8d10802ec4c Josef Bacik       2017-04-06  1556  		mutex_lock(&nbd->config_lock);
5ea8d10802ec4c Josef Bacik       2017-04-06  1557  		if (refcount_inc_not_zero(&nbd->config_refs)) {
5ea8d10802ec4c Josef Bacik       2017-04-06  1558  			mutex_unlock(&nbd->config_lock);
5ea8d10802ec4c Josef Bacik       2017-04-06  1559  			goto out;
5ea8d10802ec4c Josef Bacik       2017-04-06  1560  		}
c55b2b983b0fa0 Yu Kuai           2022-05-21  1561  		config = nbd_alloc_config();
c55b2b983b0fa0 Yu Kuai           2022-05-21  1562  		if (IS_ERR(config)) {
c55b2b983b0fa0 Yu Kuai           2022-05-21 @1563  			ret = PTR_ERR(config);
5ea8d10802ec4c Josef Bacik       2017-04-06  1564  			mutex_unlock(&nbd->config_lock);
5ea8d10802ec4c Josef Bacik       2017-04-06  1565  			goto out;
5ea8d10802ec4c Josef Bacik       2017-04-06  1566  		}
c55b2b983b0fa0 Yu Kuai           2022-05-21  1567  		nbd->config = config;
5ea8d10802ec4c Josef Bacik       2017-04-06  1568  		refcount_set(&nbd->config_refs, 1);
c6a4759ea0c9a7 Josef Bacik       2017-04-06  1569  		refcount_inc(&nbd->refs);
5ea8d10802ec4c Josef Bacik       2017-04-06  1570  		mutex_unlock(&nbd->config_lock);
1aba169e770911 Josh Triplett     2020-12-17  1571  		if (max_part)
38430f0876fa8b Christoph Hellwig 2020-09-21  1572  			set_bit(GD_NEED_PART_SCAN, &bdev->bd_disk->state);
fe1f9e6659ca61 Josef Bacik       2018-05-16  1573  	} else if (nbd_disconnected(nbd->config)) {
1aba169e770911 Josh Triplett     2020-12-17  1574  		if (max_part)
38430f0876fa8b Christoph Hellwig 2020-09-21  1575  			set_bit(GD_NEED_PART_SCAN, &bdev->bd_disk->state);
5ea8d10802ec4c Josef Bacik       2017-04-06  1576  	}
5ea8d10802ec4c Josef Bacik       2017-04-06  1577  out:
5ea8d10802ec4c Josef Bacik       2017-04-06  1578  	mutex_unlock(&nbd_index_mutex);
5ea8d10802ec4c Josef Bacik       2017-04-06  1579  	return ret;
5ea8d10802ec4c Josef Bacik       2017-04-06  1580  }
5ea8d10802ec4c Josef Bacik       2017-04-06  1581  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
