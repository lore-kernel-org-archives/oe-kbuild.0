Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81A8A31
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Feb 2023 20:49:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675457357; x=1706993357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7mvf9+IYvjg18fVslOiEXTpulPUEjzyzKHyfZzBWj4k=;
  b=O5PGrumgacdE20gu8H8LZJFW0WLdi7DyBJ0iSXMouU2npoGY1Trwtxwq
   FBlKRInJqkhwmUD8DcCSRh0pAO5lqUhQ5hK/FToHZHXTFzoKyMsq2CUY0
   WZ5DnNErkpLSk5sWbaGQyQE4Vgs3oGtI6xDhoe8RdE/igGTu7LMsBWPDq
   mki5hMUdu58SWrx+5/W5uGheRRhZJz6vYJ4RKlhcUXqZAxtU35xe+YCrD
   hNyzXzk6J9cZUIg0IgBa9d8cv4ZYBaHMeYZ9Lfd8+grg2sVSz3/efuBRx
   RTBpQhBmJDyRdkXo6GBI2Yz8Ibq/gzR10u5c1nlArDcO6ZDYV3FvOzqz3
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="393441465"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="393441465"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 12:49:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="911272982"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="911272982"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Feb 2023 12:49:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO2zi-0000kV-1Y;
	Fri, 03 Feb 2023 20:49:14 +0000
Date: Sat, 4 Feb 2023 04:48:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 3/3] bcache: support overlay bcache
Message-ID: <202302040450.L9x6GFfq-lkp@intel.com>
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
[also build test WARNING on v6.2-rc6 next-20230203]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mingzhe-zou-easystack-cn/bcache-submit-writeback-inflight-dirty-writes-in-batch/20230202-110624
patch link:    https://lore.kernel.org/r/20230202030221.14397-3-mingzhe.zou%40easystack.cn
patch subject: [PATCH v2 3/3] bcache: support overlay bcache
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-m031-20230202 (https://download.01.org/0day-ci/archive/20230204/202302040450.L9x6GFfq-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

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
