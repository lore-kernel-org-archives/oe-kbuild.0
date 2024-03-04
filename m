Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5480A175B4
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Mar 2024 08:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709539808; cv=none; b=RUE8L8leRFwTumej45XPY5XdygF6WrZ01gXR+43m28Nlm6ERL5Ya5uyjbaItQNyRnk3VmzKHiZ1vqxZVWgns6hupeI7gURsCDtnP6oM1jFnhvgL55xdEGssI482eFsGo1++C96x362Wa5b0372xBJBuSSkxyRl6+aiHe8GR3F+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709539808; c=relaxed/simple;
	bh=IXyENQhHzNOITXQ70Xx5riCOVihg+OXDk955vFsx2zw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ItB1uu9v4RsMQ1y+MDomihqSkJr+sCRN4t/Q3c+BLKlQBJSRI9pdeyiJeTTeai1Q3X6vu6VhHcxU4nc2+2SS46JkQDY3qgkVvLBcIw9vdk3n5/ZnPcjkqF188ACbYX5s4d6g8+3NZ9q1A4nTCDOOG9dU8H3XF7KUg6L2fcj+X3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CG2M8ric; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CG2M8ric"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-412e2dfa58eso3539065e9.0
        for <oe-kbuild@lists.linux.dev>; Mon, 04 Mar 2024 00:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709539804; x=1710144604; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rquuXUIECBJHT4g1j4aO+pkotZYsym6eWVJpGeY686A=;
        b=CG2M8ric8bR6Txff8lLIWzrtl4LvpArxzKQtMLlOkty553pUECqoIVCSgpooz2Evr/
         4Tq9O8XYQRs2ZqlRbvwxIqmmxeo+ajolPWsK4XEGETocyNnlaP3WD2qfwESksMmMHLmi
         nckFv7qfBf0vye8YxJlaa/pBs68iuGPzLXx/qr+9389GuihAqFRzzbzaN6ZOn8jM1aUV
         0D/o4MownwRBRhmGSq52TcbyKwaiw94EdU71PPSpEKOJStxcX3bK5ghaJTgPnEFdbs4p
         LHvXBWEL2ROoOlNrhcGOp6ajKBqJ3mW7q4te33c/DBD4XJsArKAZMLvod5ELVD2RMUrp
         xEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709539804; x=1710144604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rquuXUIECBJHT4g1j4aO+pkotZYsym6eWVJpGeY686A=;
        b=fk33y9pPKu300/wOb4DOsP+EvgzJ5DLVi0aksLwO1klhE//8tWR9uwQyIp+16idtBu
         usW21k4GwGYTOxJaJLcy0Io4MbnE0B6fRsi7ZtnT/HK2AHWEt6ConETQA4w9hG45PumH
         B8fUjKqKfeNhb16gpKxRk58PzUKC0VTa7URPsIXdgAA3QibOsKpCyQ4ogpPPKvUJWs5o
         +WZg2mjYEUUmyxCE6IXSqYvqc7RRFo+UdCspvEQD9CP3g61asizITYF7pxqTL3VQsk4k
         Psq7d0JhGoH5avixnLvOHGu5wKcN8ajdhC/O4v46QV1MMOLnBN2Rc89upjjXZR/QfsjR
         Wxvw==
X-Gm-Message-State: AOJu0YyXDBFGsCjd45W+fqderJJVBGimaEBJXtx9X4XtcUw70Hq0U+C9
	76j34buZXtui/iFfqUhFOMLgAlLyWYasgm/5mJysvJCagCx1j59mCXCJGIVVVYyziKYk5KyF7v/
	K
X-Google-Smtp-Source: AGHT+IGG5Z1sBDFDT5+ePdqIOmX/rNG/1x2uCO6IBj4hhibwJ54SqX/qHiLvVh8MUJ9lKc4hsBEKyQ==
X-Received: by 2002:a05:600c:1c20:b0:412:dda8:fbc2 with SMTP id j32-20020a05600c1c2000b00412dda8fbc2mr2547862wms.16.1709539804433;
        Mon, 04 Mar 2024 00:10:04 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id n37-20020a05600c3ba500b00412e58be350sm1189290wms.1.2024.03.04.00.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 00:10:04 -0800 (PST)
Date: Mon, 4 Mar 2024 11:10:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-block:drbd-blk-limits 7/16] drivers/md/raid10.c:4093
 raid10_run() warn: missing error code 'ret'
Message-ID: <fed91704-5f89-43ce-86ba-d9f9657fa437@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/block.git drbd-blk-limits
head:   952f67c787298e616a8aa5acc3f881d267e6c7b5
commit: 313650e376b1a47160c38cf100308664af4fb7fa [7/16] md/raid10: use the atomic queue limit update APIs
config: x86_64-randconfig-161-20240301 (https://download.01.org/0day-ci/archive/20240304/202403040910.goLgb8oF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403040910.goLgb8oF-lkp@intel.com/

New smatch warnings:
drivers/md/raid10.c:4093 raid10_run() warn: missing error code 'ret'

vim +/ret +4093 drivers/md/raid10.c

849674e4fb175e Shaohua Li         2016-01-20  4011  static int raid10_run(struct mddev *mddev)
dab8b29248b3f1 Trela, Maciej      2010-03-08  4012  {
313650e376b1a4 Christoph Hellwig  2024-02-23  4013  	struct queue_limits lim;
e879a8793f915a NeilBrown          2011-10-11  4014  	struct r10conf *conf;
16ef510139315a Christoph Hellwig  2020-09-24  4015  	int i, disk_idx;
dc280d987f039e Jonathan Brassow   2012-07-31  4016  	struct raid10_info *disk;
3cb03002000f13 NeilBrown          2011-10-11  4017  	struct md_rdev *rdev;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4018  	sector_t size;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4019  	sector_t min_offset_diff = 0;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4020  	int first = 1;
313650e376b1a4 Christoph Hellwig  2024-02-23  4021  	int ret = -EIO;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4022  
dab8b29248b3f1 Trela, Maciej      2010-03-08  4023  	if (mddev->private == NULL) {
dab8b29248b3f1 Trela, Maciej      2010-03-08  4024  		conf = setup_conf(mddev);
dab8b29248b3f1 Trela, Maciej      2010-03-08  4025  		if (IS_ERR(conf))
dab8b29248b3f1 Trela, Maciej      2010-03-08  4026  			return PTR_ERR(conf);
dab8b29248b3f1 Trela, Maciej      2010-03-08  4027  		mddev->private = conf;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4028  	}
dab8b29248b3f1 Trela, Maciej      2010-03-08  4029  	conf = mddev->private;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4030  	if (!conf)
dab8b29248b3f1 Trela, Maciej      2010-03-08  4031  		goto out;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4032  
44693154398272 Yu Kuai            2023-05-23  4033  	rcu_assign_pointer(mddev->thread, conf->thread);
44693154398272 Yu Kuai            2023-05-23  4034  	rcu_assign_pointer(conf->thread, NULL);
f0ddb83da3cbbf Yu Kuai            2023-03-10  4035  
8db87912c9a877 Guoqing Jiang      2017-10-24  4036  	if (mddev_is_clustered(conf->mddev)) {
8db87912c9a877 Guoqing Jiang      2017-10-24  4037  		int fc, fo;
8db87912c9a877 Guoqing Jiang      2017-10-24  4038  
8db87912c9a877 Guoqing Jiang      2017-10-24  4039  		fc = (mddev->layout >> 8) & 255;
8db87912c9a877 Guoqing Jiang      2017-10-24  4040  		fo = mddev->layout & (1<<16);
8db87912c9a877 Guoqing Jiang      2017-10-24  4041  		if (fc > 1 || fo > 0) {
8db87912c9a877 Guoqing Jiang      2017-10-24  4042  			pr_err("only near layout is supported by clustered"
8db87912c9a877 Guoqing Jiang      2017-10-24  4043  				" raid10\n");
43a521238aca0e Lidong Zhong       2018-01-23  4044  			goto out_free_conf;
8db87912c9a877 Guoqing Jiang      2017-10-24  4045  		}
8db87912c9a877 Guoqing Jiang      2017-10-24  4046  	}
8db87912c9a877 Guoqing Jiang      2017-10-24  4047  
dafb20fa34320a NeilBrown          2012-03-19  4048  	rdev_for_each(rdev, mddev) {
3ea7daa5d7fde4 NeilBrown          2012-05-22  4049  		long long diff;
34b343cff4354a NeilBrown          2011-07-28  4050  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4051  		disk_idx = rdev->raid_disk;
f8c9e74ff0832f NeilBrown          2012-05-21  4052  		if (disk_idx < 0)
f8c9e74ff0832f NeilBrown          2012-05-21  4053  			continue;
f8c9e74ff0832f NeilBrown          2012-05-21  4054  		if (disk_idx >= conf->geo.raid_disks &&
f8c9e74ff0832f NeilBrown          2012-05-21  4055  		    disk_idx >= conf->prev.raid_disks)
^1da177e4c3f41 Linus Torvalds     2005-04-16  4056  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4057  		disk = conf->mirrors + disk_idx;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4058  
56a2559bb654ae NeilBrown          2011-12-23  4059  		if (test_bit(Replacement, &rdev->flags)) {
56a2559bb654ae NeilBrown          2011-12-23  4060  			if (disk->replacement)
56a2559bb654ae NeilBrown          2011-12-23  4061  				goto out_free_conf;
56a2559bb654ae NeilBrown          2011-12-23  4062  			disk->replacement = rdev;
56a2559bb654ae NeilBrown          2011-12-23  4063  		} else {
56a2559bb654ae NeilBrown          2011-12-23  4064  			if (disk->rdev)
56a2559bb654ae NeilBrown          2011-12-23  4065  				goto out_free_conf;
56a2559bb654ae NeilBrown          2011-12-23  4066  			disk->rdev = rdev;
56a2559bb654ae NeilBrown          2011-12-23  4067  		}
3ea7daa5d7fde4 NeilBrown          2012-05-22  4068  		diff = (rdev->new_data_offset - rdev->data_offset);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4069  		if (!mddev->reshape_backwards)
3ea7daa5d7fde4 NeilBrown          2012-05-22  4070  			diff = -diff;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4071  		if (diff < 0)
3ea7daa5d7fde4 NeilBrown          2012-05-22  4072  			diff = 0;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4073  		if (first || diff < min_offset_diff)
3ea7daa5d7fde4 NeilBrown          2012-05-22  4074  			min_offset_diff = diff;
56a2559bb654ae NeilBrown          2011-12-23  4075  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4076  		disk->head_position = 0;
6f287ca6046edd Guoqing Jiang      2017-04-06  4077  		first = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4078  	}
3ea7daa5d7fde4 NeilBrown          2012-05-22  4079  
313650e376b1a4 Christoph Hellwig  2024-02-23  4080  	blk_set_stacking_limits(&lim);
313650e376b1a4 Christoph Hellwig  2024-02-23  4081  	lim.max_write_zeroes_sectors = 0;
313650e376b1a4 Christoph Hellwig  2024-02-23  4082  	lim.io_min = mddev->chunk_sectors << 9;
313650e376b1a4 Christoph Hellwig  2024-02-23  4083  	lim.io_opt = lim.io_min * raid10_nr_stripes(conf);
313650e376b1a4 Christoph Hellwig  2024-02-23  4084  	mddev_stack_rdev_limits(mddev, &lim);
313650e376b1a4 Christoph Hellwig  2024-02-23  4085  	ret = queue_limits_set(mddev->queue, &lim);
313650e376b1a4 Christoph Hellwig  2024-02-23  4086  	if (ret)
313650e376b1a4 Christoph Hellwig  2024-02-23  4087  		goto out_free_conf;
313650e376b1a4 Christoph Hellwig  2024-02-23  4088  
6d508242b231cb NeilBrown          2005-09-09  4089  	/* need to check that every block has at least one working mirror */
700c72138938cf NeilBrown          2011-07-27  4090  	if (!enough(conf, -1)) {
08464e0926402a NeilBrown          2016-11-02  4091  		pr_err("md/raid10:%s: not enough operational mirrors.\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  4092  		       mdname(mddev));
^1da177e4c3f41 Linus Torvalds     2005-04-16 @4093  		goto out_free_conf;

Originally this error path returned -EIO.

^1da177e4c3f41 Linus Torvalds     2005-04-16  4094  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  4095  
3ea7daa5d7fde4 NeilBrown          2012-05-22  4096  	if (conf->reshape_progress != MaxSector) {
3ea7daa5d7fde4 NeilBrown          2012-05-22  4097  		/* must ensure that shape change is supported */
3ea7daa5d7fde4 NeilBrown          2012-05-22  4098  		if (conf->geo.far_copies != 1 &&
3ea7daa5d7fde4 NeilBrown          2012-05-22  4099  		    conf->geo.far_offset == 0)
3ea7daa5d7fde4 NeilBrown          2012-05-22  4100  			goto out_free_conf;

Same

3ea7daa5d7fde4 NeilBrown          2012-05-22  4101  		if (conf->prev.far_copies != 1 &&
78eaa0d4cbcdb3 NeilBrown          2013-07-02  4102  		    conf->prev.far_offset == 0)
3ea7daa5d7fde4 NeilBrown          2012-05-22  4103  			goto out_free_conf;

Same

3ea7daa5d7fde4 NeilBrown          2012-05-22  4104  	}
3ea7daa5d7fde4 NeilBrown          2012-05-22  4105  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4106  	mddev->degraded = 0;
f8c9e74ff0832f NeilBrown          2012-05-21  4107  	for (i = 0;
f8c9e74ff0832f NeilBrown          2012-05-21  4108  	     i < conf->geo.raid_disks
f8c9e74ff0832f NeilBrown          2012-05-21  4109  		     || i < conf->prev.raid_disks;
f8c9e74ff0832f NeilBrown          2012-05-21  4110  	     i++) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  4111  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4112  		disk = conf->mirrors + i;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4113  
56a2559bb654ae NeilBrown          2011-12-23  4114  		if (!disk->rdev && disk->replacement) {
56a2559bb654ae NeilBrown          2011-12-23  4115  			/* The replacement is all we have - use it */
56a2559bb654ae NeilBrown          2011-12-23  4116  			disk->rdev = disk->replacement;
56a2559bb654ae NeilBrown          2011-12-23  4117  			disk->replacement = NULL;
56a2559bb654ae NeilBrown          2011-12-23  4118  			clear_bit(Replacement, &disk->rdev->flags);
56a2559bb654ae NeilBrown          2011-12-23  4119  		}
56a2559bb654ae NeilBrown          2011-12-23  4120  
5fd6c1dce06ec2 NeilBrown          2006-06-26  4121  		if (!disk->rdev ||
2e333e89860431 NeilBrown          2006-10-21  4122  		    !test_bit(In_sync, &disk->rdev->flags)) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  4123  			disk->head_position = 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4124  			mddev->degraded++;
0b59bb6422e43a NeilBrown          2014-01-14  4125  			if (disk->rdev &&
0b59bb6422e43a NeilBrown          2014-01-14  4126  			    disk->rdev->saved_raid_disk < 0)
8c2e870a625bd3 Neil Brown         2008-06-28  4127  				conf->fullsync = 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4128  		}
bda3153998f3eb BingJing Chang     2018-06-28  4129  
bda3153998f3eb BingJing Chang     2018-06-28  4130  		if (disk->replacement &&
bda3153998f3eb BingJing Chang     2018-06-28  4131  		    !test_bit(In_sync, &disk->replacement->flags) &&
bda3153998f3eb BingJing Chang     2018-06-28  4132  		    disk->replacement->saved_raid_disk < 0) {
bda3153998f3eb BingJing Chang     2018-06-28  4133  			conf->fullsync = 1;
bda3153998f3eb BingJing Chang     2018-06-28  4134  		}
bda3153998f3eb BingJing Chang     2018-06-28  4135  
d890fa2b0586b6 NeilBrown          2011-10-26  4136  		disk->recovery_disabled = mddev->recovery_disabled - 1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4137  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  4138  
8c6ac868b107ed Andre Noll         2009-06-18  4139  	if (mddev->recovery_cp != MaxSector)
08464e0926402a NeilBrown          2016-11-02  4140  		pr_notice("md/raid10:%s: not clean -- starting background reconstruction\n",
8c6ac868b107ed Andre Noll         2009-06-18  4141  			  mdname(mddev));
08464e0926402a NeilBrown          2016-11-02  4142  	pr_info("md/raid10:%s: active with %d out of %d devices\n",
5cf00fcd3c98d2 NeilBrown          2012-05-21  4143  		mdname(mddev), conf->geo.raid_disks - mddev->degraded,
5cf00fcd3c98d2 NeilBrown          2012-05-21  4144  		conf->geo.raid_disks);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4145  	/*
^1da177e4c3f41 Linus Torvalds     2005-04-16  4146  	 * Ok, everything is just fine now
^1da177e4c3f41 Linus Torvalds     2005-04-16  4147  	 */
dab8b29248b3f1 Trela, Maciej      2010-03-08  4148  	mddev->dev_sectors = conf->dev_sectors;
dab8b29248b3f1 Trela, Maciej      2010-03-08  4149  	size = raid10_size(mddev, 0, 0);
dab8b29248b3f1 Trela, Maciej      2010-03-08  4150  	md_set_array_sectors(mddev, size);
dab8b29248b3f1 Trela, Maciej      2010-03-08  4151  	mddev->resync_max_sectors = size;
46533ff7fefb7e NeilBrown          2016-11-18  4152  	set_bit(MD_FAILFAST_SUPPORTED, &mddev->flags);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4153  
a91a2785b20086 Martin K. Petersen 2011-03-17  4154  	if (md_integrity_register(mddev))
a91a2785b20086 Martin K. Petersen 2011-03-17  4155  		goto out_free_conf;

Same

a91a2785b20086 Martin K. Petersen 2011-03-17  4156  
3ea7daa5d7fde4 NeilBrown          2012-05-22  4157  	if (conf->reshape_progress != MaxSector) {
3ea7daa5d7fde4 NeilBrown          2012-05-22  4158  		unsigned long before_length, after_length;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4159  
3ea7daa5d7fde4 NeilBrown          2012-05-22  4160  		before_length = ((1 << conf->prev.chunk_shift) *
3ea7daa5d7fde4 NeilBrown          2012-05-22  4161  				 conf->prev.far_copies);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4162  		after_length = ((1 << conf->geo.chunk_shift) *
3ea7daa5d7fde4 NeilBrown          2012-05-22  4163  				conf->geo.far_copies);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4164  
3ea7daa5d7fde4 NeilBrown          2012-05-22  4165  		if (max(before_length, after_length) > min_offset_diff) {
3ea7daa5d7fde4 NeilBrown          2012-05-22  4166  			/* This cannot work */
08464e0926402a NeilBrown          2016-11-02  4167  			pr_warn("md/raid10: offset difference not enough to continue reshape\n");
3ea7daa5d7fde4 NeilBrown          2012-05-22  4168  			goto out_free_conf;

Same

3ea7daa5d7fde4 NeilBrown          2012-05-22  4169  		}
3ea7daa5d7fde4 NeilBrown          2012-05-22  4170  		conf->offset_diff = min_offset_diff;
3ea7daa5d7fde4 NeilBrown          2012-05-22  4171  
3ea7daa5d7fde4 NeilBrown          2012-05-22  4172  		clear_bit(MD_RECOVERY_SYNC, &mddev->recovery);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4173  		clear_bit(MD_RECOVERY_CHECK, &mddev->recovery);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4174  		set_bit(MD_RECOVERY_RESHAPE, &mddev->recovery);
3ea7daa5d7fde4 NeilBrown          2012-05-22  4175  		set_bit(MD_RECOVERY_RUNNING, &mddev->recovery);
44693154398272 Yu Kuai            2023-05-23  4176  		rcu_assign_pointer(mddev->sync_thread,
44693154398272 Yu Kuai            2023-05-23  4177  			md_register_thread(md_do_sync, mddev, "reshape"));
e406f12dde1a83 Aditya Pakki       2019-03-04  4178  		if (!mddev->sync_thread)
e406f12dde1a83 Aditya Pakki       2019-03-04  4179  			goto out_free_conf;

Same

3ea7daa5d7fde4 NeilBrown          2012-05-22  4180  	}
3ea7daa5d7fde4 NeilBrown          2012-05-22  4181  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4182  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4183  
^1da177e4c3f41 Linus Torvalds     2005-04-16  4184  out_free_conf:
7eb8ff02c1df27 Li Lingfeng        2023-08-03  4185  	md_unregister_thread(mddev, &mddev->thread);
c9ac2acde53f53 Yu Kuai            2023-03-10  4186  	raid10_free_conf(conf);
^1da177e4c3f41 Linus Torvalds     2005-04-16  4187  	mddev->private = NULL;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4188  out:
313650e376b1a4 Christoph Hellwig  2024-02-23  4189  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  4190  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

