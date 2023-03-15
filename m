Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 966F87E;
	Wed, 15 Mar 2023 04:03:07 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id x22so6209939wmj.3;
        Tue, 14 Mar 2023 21:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678852985;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LKipZg32j4aSYL/ldQSJVuc/wPyuqxco8uSwoElc/X8=;
        b=Zf81Oo+oWlBnof984tD+2xXftdUSEI6tRb13AeHtCVEPCFLxbywgsxT2VOSx90hj69
         wbU4X0LpP+1x4lewxwCtAcnfchfKN+HcyaHAwje3YyMYi3UKNxsvkpJ6T3rrNha7CYu7
         xNcw9bYfPSFx4OjwZxewMbmB2LJuaCBCeMzW+vHzjqt9olDKLk7Au9cU/+Bm/hNVv7hs
         fMIJcjz9L+6JEw3F8umgAA/luX+G6CIX1vVRqjT5l+TlxrSfsop8D6nY1Kreqh386oyt
         OIgxAc9WQWa90VD9fm7g+fJJ+iAoYR8y9K5zVBYQtMfgfAwE54qt9qN/v1917uQ6K3zg
         prDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678852985;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKipZg32j4aSYL/ldQSJVuc/wPyuqxco8uSwoElc/X8=;
        b=oSwVpRN0RsxO2z0J3hjWY4JlFuSXc9YmmvQPJkaUpKc9QkuJ+51Lq+iSVGqx/L0CuD
         V5xyo3eDqEF8ShnUHLJy7TjsD3OEmFxC2mv7cNEjKT/taVKvSecZ9FDNpYNiJMGZYS1K
         cm6Umc/FnaiAFzqL1esK5FVO7D8v1T7fPP25JE2sy9FpuwuAUnYupMPq0aXZAwg7WSfb
         SjOJ2mposxGHVF28g2LMFyNQAlwwdXtfAGlLAHtJRi7RyjoBtQpPxqGjSfro7JoiHYPP
         LSudvSDeGZjUG7xRElun6eVDmSw0WzZ9QQVm4AX8kL1JKXb8wOHPO4/Pl/PohByRiOyv
         KkHA==
X-Gm-Message-State: AO0yUKVuX+0chNORXaN39Mm9+YYNRQgIR3E4jx4mTI/gnp+7m2Y8S3Xd
	ePtP5Xy0aadvrRlJ4jHRt7XZmgm3bOQ=
X-Google-Smtp-Source: AK7set9+zU5NflcbfyDYbrOnB7l6MiUXZzaFVy5MWupsPgtQa4A2GoEu/V38pEZLCOuveMJkd+7oIA==
X-Received: by 2002:a05:600c:19c7:b0:3ed:2b49:1571 with SMTP id u7-20020a05600c19c700b003ed2b491571mr4683283wmq.20.1678852985252;
        Tue, 14 Mar 2023 21:03:05 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k6-20020a05600c1c8600b003e209b45f6bsm467905wms.29.2023.03.14.21.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 21:03:04 -0700 (PDT)
Date: Wed, 15 Mar 2023 07:03:00 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, mingzhe.zou@easystack.cn, colyli@suse.de,
	andrea.tomassetti-opensource@devo.com, bcache@lists.ewheeler.net
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, kent.overstreet@gmail.com,
	linux-bcache@vger.kernel.org, zoumingzhe@qq.com,
	Dongsheng Yang <dongsheng.yang@easystack.cn>,
	mingzhe <mingzhe.zou@easystack.cn>
Subject: Re: [PATCH v2 3/3] bcache: support overlay bcache
Message-ID: <ecf6a168-dd9c-4a11-a872-088030ef47a5@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230202030221.14397-3-mingzhe.zou@easystack.cn>

Hi,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/mingzhe-zou-easystack-cn/bcache-submit-writeback-inflight-dirty-writes-in-batch/20230202-110624
patch link:    https://lore.kernel.org/r/20230202030221.14397-3-mingzhe.zou%40easystack.cn
patch subject: [PATCH v2 3/3] bcache: support overlay bcache
config: ia64-randconfig-m031-20230312 (https://download.01.org/0day-ci/archive/20230315/202303150200.4UK2OWti-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303150200.4UK2OWti-lkp@intel.com/

smatch warnings:
drivers/md/bcache/super.c:1573 flash_dev_run() warn: missing error code 'err'

vim +/err +1573 drivers/md/bcache/super.c

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

Get rid of the "ret" variable and use "err" instead.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

