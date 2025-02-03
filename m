Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AE192AF10
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 20:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738615523; cv=none; b=kS0rpsRhoGkmbmjMX8KpaNw629BtRn8/MqmtzUZBhWDlz+f+4wBJP9MlHvuA5elU2BFv6Ca4TPUA8A/W5iTtz5EWJtWX1KPsBI6AaCuE9odu5pNaz5v8rj2MgJfe3m8fCoFCeNKaSynUg6MUYLJISY7tCW2xbnuACNVdMnKih50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738615523; c=relaxed/simple;
	bh=MpN8L4CLHm+SQSPjxp0XydxHR6IrcBuroygPuihC3W0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mf9Ynwz6FtCjrm/OhDvg3g2/wqj41YlLjvb/cXqqubrOzngZjEMtX/yqKZGPuDqhKylS1cXTRaAkK5aJkgXHLoC+rnEwNIks38v3bVM8WB4Z2OgI3rUejxnrs9x57f5nqlsdvW9NiPDQc0r2IdHQmYhPToFofzX5i0/IiUMD14k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tuB1HPPJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tuB1HPPJ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4363ae65100so57485415e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 03 Feb 2025 12:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738615518; x=1739220318; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FRhtmI/uDAoDSTEeDWSfb1KpMoIg3bUqUeBuBij+1gQ=;
        b=tuB1HPPJbCQ618pbVgIux+6b+hgXqH1FwZrAPZ0qwR+bvF1Dv6g6Nj6szmfx0O8Est
         xD7MJ1Ach9GiDXUKseWPiNEQ7W/63lnpGPII4I5XdEsjTmd7gJPRi65KQpWXnapkRwbc
         uDl3wn9VOTyN2avqFXSopSbztPCwJDewt1JCbza2RlNaobNJHBMOg2OpXXoLP5giBk/o
         9Lb+EuhLMj37CqiT4XFIwDgfH2U/LW5cMZJUsm3bnYHKUiHiUpoZpltqf2xd2RHkKY+W
         dHGO0QL7Qj78ifnsjSKjWjGbv5ShrJAOe1GiJGWTmxGvmRhTaAE6FC0h+d6bBrytcNWx
         qomA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738615518; x=1739220318;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FRhtmI/uDAoDSTEeDWSfb1KpMoIg3bUqUeBuBij+1gQ=;
        b=MiVb4YqOXCFFmV7Zr0caeBHK0cmDiZTkPWthYwXaCcxoSYxRKCleA6eVjlVXfL9hWb
         7eq0uGgOCs8hCZT32Me5h84cbZhbzgWKADTPNmIfqOtoM0GBCIkUw3q8VfIhi+miXUhl
         l/wqxP3BpMismWB90LdlYHQlsqaKWqK0xN9WriBKgMQF0aibPTNb2cJpXn5V54J6ALBn
         YHR7Yb1H2NyoJEGxAKpQqPNV69GcN5vLFvAokD4Afuct6Of/bbozUu84AgNaHCZtoco0
         tQJG7IxrJsUvlhhqUMLxkifPITRY9RkAHBekhMQxQdqOh+LvixPsEB7yYUn13fmfErEb
         0ydg==
X-Gm-Message-State: AOJu0YytE1gfWtEZTWtUJjPtlRBR1nvhQbPJ4b7EVKOcHjwPGb6MuScR
	hkfMO861P3CNhZYPLYGV/xKduOJTOvo3cWvOIs4Y1e97h8pMvfoVU4P+Q0XBVkR1z77iEQTp99T
	O
X-Gm-Gg: ASbGncsogyDkEn5Enrwj+kmroemrzHNx/WUidDz7Cdzul2nRPwIF5BP4jRRsjbbT+Nd
	WK8w8Wm1fz6RneAUtOyUPq/HqkRbVzfD86ZDle57UyP+u/iI0v7RhP4wCjXIG7lZ4rGLYHY7tRR
	Zqqw08ZXw8/7lgiuzD7wsXtGhzHwSZwh2bnU68T0jck92P68kYsOeCMFGP7Ki0iAZz95gs7UM1C
	k9k1n5db5ERw9LT2u/JjFt+G9eNrUuRra3fsHVE6fwMIYluZP2FrXYNAx3VJ/7yt1c48P1gV7v7
	C5H2J1shxr7tmZCF7G60
X-Google-Smtp-Source: AGHT+IGAHmadQEPVrkKo2vX9BbRBCDTixgXFVxDPIae3lJnx5uehsBLoASKpv0g4rAmflweAayAPQw==
X-Received: by 2002:a05:600c:5486:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-438dc40d3fdmr216080795e9.21.1738615517950;
        Mon, 03 Feb 2025 12:45:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-438dcc6dfb5sm206330575e9.31.2025.02.03.12.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 12:45:17 -0800 (PST)
Date: Mon, 3 Feb 2025 23:45:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-rebase 3/59] drivers/block/zloop.c:1004
 zloop_ctl_add() warn: missing error code 'ret'
Message-ID: <3e7a7170-8e9c-4228-ace9-7edb9941948f@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-rebase
head:   5cee788f85c03e72a78f0fa3347d499e4db1d621
commit: 5865d129d01ab863a2b45ebeb87f806475d74c84 [3/59] block: new zoned loop block device driver
config: arm-randconfig-r071-20250203 (https://download.01.org/0day-ci/archive/20250203/202502032357.36dqVCQt-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502032357.36dqVCQt-lkp@intel.com/

smatch warnings:
drivers/block/zloop.c:1004 zloop_ctl_add() warn: missing error code 'ret'

vim +/ret +1004 drivers/block/zloop.c

5865d129d01ab8 Damien Le Moal 2025-01-31   881  static int zloop_ctl_add(struct zloop_options *opts)
5865d129d01ab8 Damien Le Moal 2025-01-31   882  {
5865d129d01ab8 Damien Le Moal 2025-01-31   883  	struct queue_limits lim = {
5865d129d01ab8 Damien Le Moal 2025-01-31   884  		.max_hw_sectors		= SZ_1M >> SECTOR_SHIFT,
5865d129d01ab8 Damien Le Moal 2025-01-31   885  		.max_hw_zone_append_sectors = SZ_1M >> SECTOR_SHIFT,
5865d129d01ab8 Damien Le Moal 2025-01-31   886  		.chunk_sectors		= opts->zone_size,
5865d129d01ab8 Damien Le Moal 2025-01-31   887  		.features		= BLK_FEAT_ZONED,
5865d129d01ab8 Damien Le Moal 2025-01-31   888  	};
5865d129d01ab8 Damien Le Moal 2025-01-31   889  	unsigned int nr_zones, i, j;
5865d129d01ab8 Damien Le Moal 2025-01-31   890  	struct zloop_device *zlo;
5865d129d01ab8 Damien Le Moal 2025-01-31   891  	int ret = -EINVAL;
5865d129d01ab8 Damien Le Moal 2025-01-31   892  	bool restore;
5865d129d01ab8 Damien Le Moal 2025-01-31   893  
5865d129d01ab8 Damien Le Moal 2025-01-31   894  	__module_get(THIS_MODULE);
5865d129d01ab8 Damien Le Moal 2025-01-31   895  
5865d129d01ab8 Damien Le Moal 2025-01-31   896  	nr_zones = opts->capacity >> ilog2(opts->zone_size);
5865d129d01ab8 Damien Le Moal 2025-01-31   897  	if (opts->nr_conv_zones >= nr_zones) {
5865d129d01ab8 Damien Le Moal 2025-01-31   898  		pr_err("Invalid number of conventional zones %u\n",
5865d129d01ab8 Damien Le Moal 2025-01-31   899  		       opts->nr_conv_zones);
5865d129d01ab8 Damien Le Moal 2025-01-31   900  		goto out;
5865d129d01ab8 Damien Le Moal 2025-01-31   901  	}
5865d129d01ab8 Damien Le Moal 2025-01-31   902  
5865d129d01ab8 Damien Le Moal 2025-01-31   903  	zlo = kvzalloc(struct_size(zlo, zones, nr_zones), GFP_KERNEL);
5865d129d01ab8 Damien Le Moal 2025-01-31   904  	if (!zlo) {
5865d129d01ab8 Damien Le Moal 2025-01-31   905  		ret = -ENOMEM;
5865d129d01ab8 Damien Le Moal 2025-01-31   906  		goto out;
5865d129d01ab8 Damien Le Moal 2025-01-31   907  	}
5865d129d01ab8 Damien Le Moal 2025-01-31   908  	zlo->state = Zlo_creating;
5865d129d01ab8 Damien Le Moal 2025-01-31   909  
5865d129d01ab8 Damien Le Moal 2025-01-31   910  	ret = mutex_lock_killable(&zloop_ctl_mutex);
5865d129d01ab8 Damien Le Moal 2025-01-31   911  	if (ret)
5865d129d01ab8 Damien Le Moal 2025-01-31   912  		goto out_free_dev;
5865d129d01ab8 Damien Le Moal 2025-01-31   913  
5865d129d01ab8 Damien Le Moal 2025-01-31   914  	/* Allocate id, if @opts->id >= 0, we're requesting that specific id */
5865d129d01ab8 Damien Le Moal 2025-01-31   915  	if (opts->id >= 0) {
5865d129d01ab8 Damien Le Moal 2025-01-31   916  		ret = idr_alloc(&zloop_index_idr, zlo,
5865d129d01ab8 Damien Le Moal 2025-01-31   917  				  opts->id, opts->id + 1, GFP_KERNEL);
5865d129d01ab8 Damien Le Moal 2025-01-31   918  		if (ret == -ENOSPC)
5865d129d01ab8 Damien Le Moal 2025-01-31   919  			ret = -EEXIST;
5865d129d01ab8 Damien Le Moal 2025-01-31   920  	} else {
5865d129d01ab8 Damien Le Moal 2025-01-31   921  		ret = idr_alloc(&zloop_index_idr, zlo, 0, 0, GFP_KERNEL);
5865d129d01ab8 Damien Le Moal 2025-01-31   922  	}
5865d129d01ab8 Damien Le Moal 2025-01-31   923  	mutex_unlock(&zloop_ctl_mutex);
5865d129d01ab8 Damien Le Moal 2025-01-31   924  	if (ret < 0)
5865d129d01ab8 Damien Le Moal 2025-01-31   925  		goto out_free_dev;
5865d129d01ab8 Damien Le Moal 2025-01-31   926  
5865d129d01ab8 Damien Le Moal 2025-01-31   927  	zlo->id = ret;
5865d129d01ab8 Damien Le Moal 2025-01-31   928  	zlo->zone_shift = ilog2(opts->zone_size);
5865d129d01ab8 Damien Le Moal 2025-01-31   929  	zlo->zone_size = opts->zone_size;
5865d129d01ab8 Damien Le Moal 2025-01-31   930  	if (opts->zone_capacity)
5865d129d01ab8 Damien Le Moal 2025-01-31   931  		zlo->zone_capacity = opts->zone_capacity;
5865d129d01ab8 Damien Le Moal 2025-01-31   932  	else
5865d129d01ab8 Damien Le Moal 2025-01-31   933  		zlo->zone_capacity = zlo->zone_size;
5865d129d01ab8 Damien Le Moal 2025-01-31   934  	zlo->nr_zones = nr_zones;
5865d129d01ab8 Damien Le Moal 2025-01-31   935  	zlo->nr_conv_zones = opts->nr_conv_zones;
5865d129d01ab8 Damien Le Moal 2025-01-31   936  	zlo->buffered_io = opts->buffered_io;
5865d129d01ab8 Damien Le Moal 2025-01-31   937  
5865d129d01ab8 Damien Le Moal 2025-01-31   938  	zlo->workqueue = alloc_workqueue("zloop%d", WQ_UNBOUND | WQ_FREEZABLE,
5865d129d01ab8 Damien Le Moal 2025-01-31   939  				opts->nr_queues * opts->queue_depth, zlo->id);
5865d129d01ab8 Damien Le Moal 2025-01-31   940  	if (!zlo->workqueue) {
5865d129d01ab8 Damien Le Moal 2025-01-31   941  		ret = -ENOMEM;
5865d129d01ab8 Damien Le Moal 2025-01-31   942  		goto out_free_idr;
5865d129d01ab8 Damien Le Moal 2025-01-31   943  	}
5865d129d01ab8 Damien Le Moal 2025-01-31   944  
5865d129d01ab8 Damien Le Moal 2025-01-31   945  	if (opts->base_dir)
5865d129d01ab8 Damien Le Moal 2025-01-31   946  		zlo->base_dir = kstrdup(opts->base_dir, GFP_KERNEL);
5865d129d01ab8 Damien Le Moal 2025-01-31   947  	else
5865d129d01ab8 Damien Le Moal 2025-01-31   948  		zlo->base_dir = kstrdup(ZLOOP_DEF_BASE_DIR, GFP_KERNEL);
5865d129d01ab8 Damien Le Moal 2025-01-31   949  	if (!zlo->base_dir) {
5865d129d01ab8 Damien Le Moal 2025-01-31   950  		ret = -ENOMEM;
5865d129d01ab8 Damien Le Moal 2025-01-31   951  		goto out_destroy_workqueue;
5865d129d01ab8 Damien Le Moal 2025-01-31   952  	}
5865d129d01ab8 Damien Le Moal 2025-01-31   953  
5865d129d01ab8 Damien Le Moal 2025-01-31   954  	zlo->data_dir = zloop_filp_open_fmt(O_RDONLY | O_DIRECTORY, 0, "%s/%u",
5865d129d01ab8 Damien Le Moal 2025-01-31   955  					    zlo->base_dir, zlo->id);
5865d129d01ab8 Damien Le Moal 2025-01-31   956  	if (IS_ERR(zlo->data_dir)) {
5865d129d01ab8 Damien Le Moal 2025-01-31   957  		ret = PTR_ERR(zlo->data_dir);
5865d129d01ab8 Damien Le Moal 2025-01-31   958  		pr_warn("Failed to open directory %s/%u (err=%d)\n",
5865d129d01ab8 Damien Le Moal 2025-01-31   959  			zlo->base_dir, zlo->id, ret);
5865d129d01ab8 Damien Le Moal 2025-01-31   960  		goto out_free_base_dir;
5865d129d01ab8 Damien Le Moal 2025-01-31   961  	}
5865d129d01ab8 Damien Le Moal 2025-01-31   962  
5865d129d01ab8 Damien Le Moal 2025-01-31   963  	/*
5865d129d01ab8 Damien Le Moal 2025-01-31   964  	 * If we already have zone files, we are restoring a device created by a
5865d129d01ab8 Damien Le Moal 2025-01-31   965  	 * previous add operation. In this case, zloop_init_zone() will check
5865d129d01ab8 Damien Le Moal 2025-01-31   966  	 * that the zone files are consistent with the zone configuration given.
5865d129d01ab8 Damien Le Moal 2025-01-31   967  	 */
5865d129d01ab8 Damien Le Moal 2025-01-31   968  	restore = zloop_dev_exists(zlo);
5865d129d01ab8 Damien Le Moal 2025-01-31   969  	for (i = 0; i < nr_zones; i++) {
5865d129d01ab8 Damien Le Moal 2025-01-31   970  		ret = zloop_init_zone(zlo, opts, i, restore);
5865d129d01ab8 Damien Le Moal 2025-01-31   971  		if (ret)
5865d129d01ab8 Damien Le Moal 2025-01-31   972  			goto out_close_files;
5865d129d01ab8 Damien Le Moal 2025-01-31   973  	}
5865d129d01ab8 Damien Le Moal 2025-01-31   974  
5865d129d01ab8 Damien Le Moal 2025-01-31   975  	lim.physical_block_size = zlo->block_size;
5865d129d01ab8 Damien Le Moal 2025-01-31   976  	lim.logical_block_size = zlo->block_size;
5865d129d01ab8 Damien Le Moal 2025-01-31   977  
5865d129d01ab8 Damien Le Moal 2025-01-31   978  	zlo->tag_set.ops = &zloop_mq_ops;
5865d129d01ab8 Damien Le Moal 2025-01-31   979  	zlo->tag_set.nr_hw_queues = opts->nr_queues;
5865d129d01ab8 Damien Le Moal 2025-01-31   980  	zlo->tag_set.queue_depth = opts->queue_depth;
5865d129d01ab8 Damien Le Moal 2025-01-31   981  	zlo->tag_set.numa_node = NUMA_NO_NODE;
5865d129d01ab8 Damien Le Moal 2025-01-31   982  	zlo->tag_set.cmd_size = sizeof(struct zloop_cmd);
5865d129d01ab8 Damien Le Moal 2025-01-31   983  	zlo->tag_set.driver_data = zlo;
5865d129d01ab8 Damien Le Moal 2025-01-31   984  
5865d129d01ab8 Damien Le Moal 2025-01-31   985  	ret = blk_mq_alloc_tag_set(&zlo->tag_set);
5865d129d01ab8 Damien Le Moal 2025-01-31   986  	if (ret) {
5865d129d01ab8 Damien Le Moal 2025-01-31   987  		pr_err("blk_mq_alloc_tag_set failed (err=%d)\n", ret);
5865d129d01ab8 Damien Le Moal 2025-01-31   988  		goto out_close_files;
5865d129d01ab8 Damien Le Moal 2025-01-31   989  	}
5865d129d01ab8 Damien Le Moal 2025-01-31   990  
5865d129d01ab8 Damien Le Moal 2025-01-31   991  	zlo->disk = blk_mq_alloc_disk(&zlo->tag_set, &lim, zlo);
5865d129d01ab8 Damien Le Moal 2025-01-31   992  	if (IS_ERR(zlo->disk)) {
5865d129d01ab8 Damien Le Moal 2025-01-31   993  		pr_err("blk_mq_alloc_disk failed (err=%d)\n", ret);
5865d129d01ab8 Damien Le Moal 2025-01-31   994  		ret = PTR_ERR(zlo->disk);
5865d129d01ab8 Damien Le Moal 2025-01-31   995  		goto out_cleanup_tags;
5865d129d01ab8 Damien Le Moal 2025-01-31   996  	}
5865d129d01ab8 Damien Le Moal 2025-01-31   997  	zlo->disk->flags = GENHD_FL_NO_PART;
5865d129d01ab8 Damien Le Moal 2025-01-31   998  	zlo->disk->fops = &zloop_fops;
5865d129d01ab8 Damien Le Moal 2025-01-31   999  	zlo->disk->private_data = zlo;
5865d129d01ab8 Damien Le Moal 2025-01-31  1000  	sprintf(zlo->disk->disk_name, "zloop%d", zlo->id);
5865d129d01ab8 Damien Le Moal 2025-01-31  1001  	set_capacity(zlo->disk, (u64)lim.chunk_sectors * zlo->nr_zones);
5865d129d01ab8 Damien Le Moal 2025-01-31  1002  
5865d129d01ab8 Damien Le Moal 2025-01-31  1003  	if (blk_revalidate_disk_zones(zlo->disk))

	ret = blk_revalidate_disk_zones(zlo->disk);
	if (ret)

5865d129d01ab8 Damien Le Moal 2025-01-31 @1004  		goto out_cleanup_disk;
5865d129d01ab8 Damien Le Moal 2025-01-31  1005  
5865d129d01ab8 Damien Le Moal 2025-01-31  1006  	ret = add_disk(zlo->disk);
5865d129d01ab8 Damien Le Moal 2025-01-31  1007  	if (ret) {
5865d129d01ab8 Damien Le Moal 2025-01-31  1008  		pr_err("add_disk failed (err=%d)\n", ret);
5865d129d01ab8 Damien Le Moal 2025-01-31  1009  		goto out_cleanup_disk;
5865d129d01ab8 Damien Le Moal 2025-01-31  1010  	}
5865d129d01ab8 Damien Le Moal 2025-01-31  1011  
5865d129d01ab8 Damien Le Moal 2025-01-31  1012  	mutex_lock(&zloop_ctl_mutex);
5865d129d01ab8 Damien Le Moal 2025-01-31  1013  	zlo->state = Zlo_live;
5865d129d01ab8 Damien Le Moal 2025-01-31  1014  	mutex_unlock(&zloop_ctl_mutex);
5865d129d01ab8 Damien Le Moal 2025-01-31  1015  
5865d129d01ab8 Damien Le Moal 2025-01-31  1016  	pr_info("Added device %d: %u zones of %llu MB, %u B block size\n",
5865d129d01ab8 Damien Le Moal 2025-01-31  1017  		zlo->id, zlo->nr_zones,
5865d129d01ab8 Damien Le Moal 2025-01-31  1018  		((sector_t)zlo->zone_size << SECTOR_SHIFT) >> 20,
5865d129d01ab8 Damien Le Moal 2025-01-31  1019  		zlo->block_size);
5865d129d01ab8 Damien Le Moal 2025-01-31  1020  
5865d129d01ab8 Damien Le Moal 2025-01-31  1021  	return 0;
5865d129d01ab8 Damien Le Moal 2025-01-31  1022  
5865d129d01ab8 Damien Le Moal 2025-01-31  1023  out_cleanup_disk:
5865d129d01ab8 Damien Le Moal 2025-01-31  1024  	put_disk(zlo->disk);
5865d129d01ab8 Damien Le Moal 2025-01-31  1025  out_cleanup_tags:
5865d129d01ab8 Damien Le Moal 2025-01-31  1026  	blk_mq_free_tag_set(&zlo->tag_set);
5865d129d01ab8 Damien Le Moal 2025-01-31  1027  out_close_files:
5865d129d01ab8 Damien Le Moal 2025-01-31  1028  	for (j = 0; j < i; j++) {
5865d129d01ab8 Damien Le Moal 2025-01-31  1029  		struct zloop_zone *zone = &zlo->zones[j];
5865d129d01ab8 Damien Le Moal 2025-01-31  1030  
5865d129d01ab8 Damien Le Moal 2025-01-31  1031  		if (!IS_ERR_OR_NULL(zone->file))
5865d129d01ab8 Damien Le Moal 2025-01-31  1032  			fput(zone->file);
5865d129d01ab8 Damien Le Moal 2025-01-31  1033  	}
5865d129d01ab8 Damien Le Moal 2025-01-31  1034  	fput(zlo->data_dir);
5865d129d01ab8 Damien Le Moal 2025-01-31  1035  out_free_base_dir:
5865d129d01ab8 Damien Le Moal 2025-01-31  1036  	kfree(zlo->base_dir);
5865d129d01ab8 Damien Le Moal 2025-01-31  1037  out_destroy_workqueue:
5865d129d01ab8 Damien Le Moal 2025-01-31  1038  	destroy_workqueue(zlo->workqueue);
5865d129d01ab8 Damien Le Moal 2025-01-31  1039  out_free_idr:
5865d129d01ab8 Damien Le Moal 2025-01-31  1040  	mutex_lock(&zloop_ctl_mutex);
5865d129d01ab8 Damien Le Moal 2025-01-31  1041  	idr_remove(&zloop_index_idr, zlo->id);
5865d129d01ab8 Damien Le Moal 2025-01-31  1042  	mutex_unlock(&zloop_ctl_mutex);
5865d129d01ab8 Damien Le Moal 2025-01-31  1043  out_free_dev:
5865d129d01ab8 Damien Le Moal 2025-01-31  1044  	kvfree(zlo);
5865d129d01ab8 Damien Le Moal 2025-01-31  1045  out:
5865d129d01ab8 Damien Le Moal 2025-01-31  1046  	module_put(THIS_MODULE);
5865d129d01ab8 Damien Le Moal 2025-01-31  1047  	if (ret == -ENOENT)
5865d129d01ab8 Damien Le Moal 2025-01-31  1048  		ret = -EINVAL;
5865d129d01ab8 Damien Le Moal 2025-01-31  1049  	return ret;
5865d129d01ab8 Damien Le Moal 2025-01-31  1050  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

