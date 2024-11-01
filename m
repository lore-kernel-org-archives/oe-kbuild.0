Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D896E1BC2A
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 13:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730467403; cv=none; b=AHGWnMkwUxg4HYKGx1VjQ85ZqQHGvkimb4vNpeWMElo+oQkdn2E0NTkjLaSucnv/JKu9peGpleb0k4G/nWSj5bCKxSKdpk/dt5UIZYD1knH3D1SGNKyoOKZacBwubweAslr5OUDmxxWk05CgSdcEac3muuoupk3dbCV5VoDclB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730467403; c=relaxed/simple;
	bh=WNFYm7cUFdBfgBGT5+nfdKTA41JaJY+jQpwY55l8Fu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MaAxPf2oFAWk1TWzcUb6l5pIMqFW3R9b/CnQ7kKbeNkfKt/y0RZNXvwdTuMXQUML+FuJecy4JUqBNdys15YViTjMUxyATOCx6jezaQKdvjsB4rom/DN2Q7g51zIa80jiDIyEKg0wylhkQZd0cUOFTI+CazzhWzdN6U3+i+EaeFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mrkkbPOE; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrkkbPOE"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d49a7207cso1327506f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 01 Nov 2024 06:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730467399; x=1731072199; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ssSRHGucCIdHWlypyPzA16lT6xHQNS6ZvVdZxw56Yzk=;
        b=mrkkbPOEk3Ky7Ew/5S5+agI1wr+dqvd70q2XV+kaik2YjA5xejfCz5Ez2RKHJ+8IBD
         kSKHFTgSOtNhOgJtp2drQsN83tXkTzfGTE/hGwKoUsQCN4U9Qik3vvGNmgv3IvSNQ4Kn
         /lkJ+Sf9l3BG4YJyWEQeGxHQIcykotEXoyqHMvnG4K4Rd7Wo4TRCozG+0LfbMafDn7v3
         qcxY8R5yqPoy8GmflnpkQXlbCg7hAk97yCJ+YM/bZfazU7o2LGEW/81Y/juUCf7z03JK
         SKVs8T1YRcZyQ0w70R4zDj6v90okGtispOU0KRduikQpxyTNKAzumCOnSNz0vB1vvaIG
         HWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730467399; x=1731072199;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ssSRHGucCIdHWlypyPzA16lT6xHQNS6ZvVdZxw56Yzk=;
        b=jkuoJJIVBZDoyNQo+ErpS4VyZEN934yPSaHHHG4R5A3OTblXcrBWNaL1bFLlOqBJxa
         p8GXbZ1oGupmvW/B2FgCbBp/8POQj3/8oNlhTRkv6DsPoVjvWXptyHQBxeX/BXS18eMo
         /RvjRxwHO8bO9nGq3TQMqUUEbrxSAbOC3PonJOH/uUJ960FaxW7hCzNtj8Tf99YMk324
         0tuSxEZoLhsTsVB1+5wpyP7f7U3hJfprGkfEebAcdZTpdlZz/fWzcpJD1QvFWBGQoU89
         kOawx9BzsnzjHJnulHxf3VqrrXAMSwxi4HzHgFTgXTw8IQW/XHjGXtdKjTIksypUGk/a
         SfUA==
X-Gm-Message-State: AOJu0YzbMmEvzVaJb6+YueIWb3RBknjqLk1KIXQIfuyNmOYiO2vaKOC/
	nrbYdf597LmW6gTKQVvRKC3SeLq04lgkez+P3dR5uOmWmiYMV3KrSK7ElxGKNN66DsJdu7PZq91
	s
X-Google-Smtp-Source: AGHT+IHrQPLC+hz5zDCLZ3Vdt7Vmbn353qZAkOC/IpUsmtGsVVkuzpjLAo+M5zDt8yFLl9EjoYCqkA==
X-Received: by 2002:a5d:5c01:0:b0:37d:461d:b1ea with SMTP id ffacd0b85a97d-381c7ab30b1mr3307612f8f.48.1730467398923;
        Fri, 01 Nov 2024 06:23:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4d1fsm5159542f8f.38.2024.11.01.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:23:18 -0700 (PDT)
Date: Fri, 1 Nov 2024 16:23:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 387/387] drivers/md/dm-bow.c:666
 dm_bow_ctr() warn: missing error code 'ret'
Message-ID: <baa5e619-53ed-45a8-876c-6a2e2afecb1d@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   6a622c20579dfeb7db056fc9b624d4abb73c8081
commit: 0ce3eb37e9eab307def1bad31c028d86ae7b2ea1 [387/387] ANDROID: dm-bow: Add dm-bow feature
config: x86_64-randconfig-161-20241029 (https://download.01.org/0day-ci/archive/20241101/202411012054.D1zpW7a2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411012054.D1zpW7a2-lkp@intel.com/

smatch warnings:
drivers/md/dm-bow.c:666 dm_bow_ctr() warn: missing error code 'ret'

vim +/ret +666 drivers/md/dm-bow.c

0ce3eb37e9eab3 Paul Lawrence 2018-10-23  622  static int dm_bow_ctr(struct dm_target *ti, unsigned int argc, char **argv)
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  623  {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  624  	struct bow_context *bc;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  625  	struct bow_range *br;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  626  	int ret;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  627  	struct mapped_device *md = dm_table_get_md(ti->table);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  628  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  629  	if (argc != 1) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  630  		ti->error = "Invalid argument count";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  631  		return -EINVAL;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  632  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  633  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  634  	bc = kzalloc(sizeof(*bc), GFP_KERNEL);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  635  	if (!bc) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  636  		ti->error = "Cannot allocate bow context";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  637  		return -ENOMEM;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  638  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  639  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  640  	ti->num_flush_bios = 1;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  641  	ti->num_discard_bios = 1;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  642  	ti->num_write_same_bios = 1;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  643  	ti->private = bc;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  644  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  645  	ret = dm_get_device(ti, argv[0], dm_table_get_mode(ti->table),
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  646  			    &bc->dev);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  647  	if (ret) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  648  		ti->error = "Device lookup failed";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  649  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  650  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  651  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  652  	if (bc->dev->bdev->bd_queue->limits.max_discard_sectors == 0) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  653  		bc->dev->bdev->bd_queue->limits.discard_granularity = 1 << 12;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  654  		bc->dev->bdev->bd_queue->limits.max_hw_discard_sectors = 1 << 15;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  655  		bc->dev->bdev->bd_queue->limits.max_discard_sectors = 1 << 15;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  656  		bc->forward_trims = false;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  657  	} else {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  658  		bc->forward_trims = true;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  659  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  660  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  661  	bc->block_size = bc->dev->bdev->bd_queue->limits.logical_block_size;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  662  	bc->block_shift = ilog2(bc->block_size);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  663  	bc->log_sector = kzalloc(bc->block_size, GFP_KERNEL);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  664  	if (!bc->log_sector) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  665  		ti->error = "Cannot allocate log sector";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23 @666  		goto bad;

Needs a "ret = -ENOMEM;"

0ce3eb37e9eab3 Paul Lawrence 2018-10-23  667  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  668  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  669  	init_completion(&bc->kobj_holder.completion);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  670  	ret = kobject_init_and_add(&bc->kobj_holder.kobj, &bow_ktype,
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  671  				   &disk_to_dev(dm_disk(md))->kobj, "%s",
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  672  				   "bow");
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  673  	if (ret) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  674  		ti->error = "Cannot create sysfs node";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  675  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  676  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  677  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  678  	mutex_init(&bc->ranges_lock);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  679  	bc->ranges = RB_ROOT;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  680  	bc->bufio = dm_bufio_client_create(bc->dev->bdev, bc->block_size, 1, 0,
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  681  					   NULL, NULL);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  682  	if (IS_ERR(bc->bufio)) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  683  		ti->error = "Cannot initialize dm-bufio";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  684  		ret = PTR_ERR(bc->bufio);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  685  		bc->bufio = NULL;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  686  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  687  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  688  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  689  	bc->workqueue = alloc_workqueue("dm-bow",
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  690  					WQ_CPU_INTENSIVE | WQ_MEM_RECLAIM
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  691  					| WQ_UNBOUND, num_online_cpus());
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  692  	if (!bc->workqueue) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  693  		ti->error = "Cannot allocate workqueue";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  694  		ret = -ENOMEM;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  695  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  696  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  697  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  698  	INIT_LIST_HEAD(&bc->trimmed_list);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  699  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  700  	br = kzalloc(sizeof(*br), GFP_KERNEL);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  701  	if (!br) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  702  		ti->error = "Cannot allocate ranges";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  703  		ret = -ENOMEM;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  704  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  705  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  706  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  707  	br->sector = ti->len;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  708  	br->type = TOP;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  709  	rb_link_node(&br->node, NULL, &bc->ranges.rb_node);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  710  	rb_insert_color(&br->node, &bc->ranges);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  711  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  712  	br = kzalloc(sizeof(*br), GFP_KERNEL);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  713  	if (!br) {
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  714  		ti->error = "Cannot allocate ranges";
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  715  		ret = -ENOMEM;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  716  		goto bad;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  717  	}
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  718  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  719  	br->sector = 0;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  720  	br->type = UNCHANGED;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  721  	rb_link_node(&br->node, bc->ranges.rb_node,
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  722  		     &bc->ranges.rb_node->rb_left);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  723  	rb_insert_color(&br->node, &bc->ranges);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  724  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  725  	ti->discards_supported = true;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  726  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  727  	return 0;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  728  
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  729  bad:
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  730  	dm_bow_dtr(ti);
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  731  	return ret;
0ce3eb37e9eab3 Paul Lawrence 2018-10-23  732  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

