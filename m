Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25253A939
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Mar 2023 18:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678820336; x=1710356336;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R4T2KKMED9lCA1ym9EHIbvkpa4NqZCMOZqSeAsNDbRc=;
  b=IjrxuV7qUt0RJ/eClpzSdZE8X2h8+47I8SCWyfLU4AGyXvC5dv1XHyE9
   RK2NPQT7MaaPxeEfnK+1oXnW3e6QO37dseYWiutDSf7SbG7EJ3R5IUSiJ
   VzrHU12GqpdIRa3O/3zojf+qx0ss+3GHbueYP2QbwZUVqkRlXhYhvxLp4
   s76m/AI33mPFPnPDaPnrzihafeCZMjPjQ+pp1YlONHJfh4Q7yGzltVSnh
   KM458Um3gMF6O/3aNYJkZJMqm9atRaqykTitptuoIaDQjdb6gA1Kw+Ezx
   8w2bkAX8xzqIRRioOxiG4YpYODicd9TdZMjMdD/gBcUN0bXEcbVXE5fpk
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="317913584"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="317913584"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2023 11:58:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="672450600"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400"; 
   d="scan'208";a="672450600"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 14 Mar 2023 11:58:54 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pc9rE-00077k-1v;
	Tue, 14 Mar 2023 18:58:48 +0000
Date: Wed, 15 Mar 2023 02:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] bcache: support overlay bcache
Message-ID: <202303150200.4UK2OWti-lkp@intel.com>
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
In-Reply-To: <20230202030221.14397-3-mingzhe.zou@easystack.cn>
References: <20230202030221.14397-3-mingzhe.zou@easystack.cn>
TO: mingzhe.zou@easystack.cn
TO: colyli@suse.de
TO: andrea.tomassetti-opensource@devo.com
TO: bcache@lists.ewheeler.net
CC: kent.overstreet@gmail.com
CC: linux-bcache@vger.kernel.org
CC: zoumingzhe@qq.com
CC: Dongsheng Yang <dongsheng.yang@easystack.cn>
CC: mingzhe <mingzhe.zou@easystack.cn>

Hi,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc2 next-20230314]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mingzhe-zou-easystack-cn/bcache-submit-writeback-inflight-dirty-writes-in-batch/20230202-110624
patch link:    https://lore.kernel.org/r/20230202030221.14397-3-mingzhe.zou%40easystack.cn
patch subject: [PATCH v2 3/3] bcache: support overlay bcache
:::::: branch date: 6 weeks ago
:::::: commit date: 6 weeks ago
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230315/202303150200.4UK2OWti-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303150200.4UK2OWti-lkp@intel.com/

smatch warnings:
drivers/md/bcache/super.c:1573 flash_dev_run() warn: missing error code 'err'

vim +/err +1573 drivers/md/bcache/super.c

cafe563591446c Kent Overstreet   2013-03-23  1539  
cafe563591446c Kent Overstreet   2013-03-23  1540  static int flash_dev_run(struct cache_set *c, struct uuid_entry *u)
cafe563591446c Kent Overstreet   2013-03-23  1541  {
bbce89267a538f Dongsheng Yang    2023-02-02  1542  	int ret;
2961c3bbcaec0e Luis Chamberlain  2021-10-15  1543  	int err = -ENOMEM;
cafe563591446c Kent Overstreet   2013-03-23  1544  	struct bcache_device *d = kzalloc(sizeof(struct bcache_device),
cafe563591446c Kent Overstreet   2013-03-23  1545  					  GFP_KERNEL);
cafe563591446c Kent Overstreet   2013-03-23  1546  	if (!d)
2961c3bbcaec0e Luis Chamberlain  2021-10-15  1547  		goto err_ret;
cafe563591446c Kent Overstreet   2013-03-23  1548  
cafe563591446c Kent Overstreet   2013-03-23  1549  	closure_init(&d->cl, NULL);
cafe563591446c Kent Overstreet   2013-03-23  1550  	set_closure_fn(&d->cl, flash_dev_flush, system_wq);
cafe563591446c Kent Overstreet   2013-03-23  1551  
cafe563591446c Kent Overstreet   2013-03-23  1552  	kobject_init(&d->kobj, &bch_flash_dev_ktype);
cafe563591446c Kent Overstreet   2013-03-23  1553  
4e1ebae3ee4e0c Coly Li           2020-10-01  1554  	if (bcache_device_init(d, block_bytes(c->cache), u->sectors,
c62b37d96b6eb3 Christoph Hellwig 2020-07-01  1555  			NULL, &bcache_flash_ops))
cafe563591446c Kent Overstreet   2013-03-23  1556  		goto err;
cafe563591446c Kent Overstreet   2013-03-23  1557  
cafe563591446c Kent Overstreet   2013-03-23  1558  	bcache_device_attach(d, c, u - c->uuids);
175206cf9ab631 Tang Junhui       2017-09-07  1559  	bch_sectors_dirty_init(d);
cafe563591446c Kent Overstreet   2013-03-23  1560  	bch_flash_dev_request_init(d);
2961c3bbcaec0e Luis Chamberlain  2021-10-15  1561  	err = add_disk(d->disk);
2961c3bbcaec0e Luis Chamberlain  2021-10-15  1562  	if (err)
2961c3bbcaec0e Luis Chamberlain  2021-10-15  1563  		goto err;
cafe563591446c Kent Overstreet   2013-03-23  1564  
bbce89267a538f Dongsheng Yang    2023-02-02  1565  	err = kobject_add(&d->kobj, &disk_to_dev(d->disk)->kobj, "bcache_fdev");
2961c3bbcaec0e Luis Chamberlain  2021-10-15  1566  	if (err)
cafe563591446c Kent Overstreet   2013-03-23  1567  		goto err;
cafe563591446c Kent Overstreet   2013-03-23  1568  
bbce89267a538f Dongsheng Yang    2023-02-02  1569  	ret = sysfs_create_link_nowarn(&disk_to_dev(d->disk)->kobj,
bbce89267a538f Dongsheng Yang    2023-02-02  1570  				       &d->kobj, "bcache");
bbce89267a538f Dongsheng Yang    2023-02-02  1571  	if (ret && ret != -EEXIST) {
bbce89267a538f Dongsheng Yang    2023-02-02  1572  		pr_err("Couldn't create lagacy flash dev ->bcache");
bbce89267a538f Dongsheng Yang    2023-02-02 @1573  		goto err;
bbce89267a538f Dongsheng Yang    2023-02-02  1574  	}
bbce89267a538f Dongsheng Yang    2023-02-02  1575  
cafe563591446c Kent Overstreet   2013-03-23  1576  	bcache_device_link(d, c, "volume");
cafe563591446c Kent Overstreet   2013-03-23  1577  
5342fd4255021e Coly Li           2021-01-04  1578  	if (bch_has_feature_obso_large_bucket(&c->cache->sb)) {
5342fd4255021e Coly Li           2021-01-04  1579  		pr_err("The obsoleted large bucket layout is unsupported, set the bcache device into read-only\n");
5342fd4255021e Coly Li           2021-01-04  1580  		pr_err("Please update to the latest bcache-tools to create the cache device\n");
5342fd4255021e Coly Li           2021-01-04  1581  		set_disk_ro(d->disk, 1);
5342fd4255021e Coly Li           2021-01-04  1582  	}
5342fd4255021e Coly Li           2021-01-04  1583  
cafe563591446c Kent Overstreet   2013-03-23  1584  	return 0;
cafe563591446c Kent Overstreet   2013-03-23  1585  err:
cafe563591446c Kent Overstreet   2013-03-23  1586  	kobject_put(&d->kobj);
2961c3bbcaec0e Luis Chamberlain  2021-10-15  1587  err_ret:
2961c3bbcaec0e Luis Chamberlain  2021-10-15  1588  	return err;
cafe563591446c Kent Overstreet   2013-03-23  1589  }
cafe563591446c Kent Overstreet   2013-03-23  1590  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
