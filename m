Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8E12E613A
	for <oe-kbuild@lists.linux.dev>; Tue, 13 Jan 2026 05:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768280773; cv=none; b=PbB76NV4SG5XlhB7BNWf+9382O6a1LuqFkhJny7AJTVu67bJvZGy28RSWi2oNctBYy9Ciu/Y9uUmn/dxXG+Ell9fxu1yUxCvXGWt2+3VN22gwmzbiUlCNVYkv2B6Li7WqCoJiI+VNpo4wXde5Ms0fhUGPAfhlPHfNduP5uzC/qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768280773; c=relaxed/simple;
	bh=ZRs7nOjpbmPf2i/oYubJ7/RTrssGnlbR35UjhHIKHOM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=YwQWlVR1PHhAdgKReTA8bprJSVRErOyKliBcM70IwycBV74KxXMpsjcVuiPEjXaV2gbvrQ4ll/nNTSl/xEyrO7gt8amVi1nr5f34kciHKvLv/NCz/Qyt8TmAQIzgGvPimNSv28N6KquPe8iCe/7DmcRfLmmfW3CSPa804qQOpsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vjatGa/N; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vjatGa/N"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso55876075e9.3
        for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 21:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768280770; x=1768885570; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PXsXC2ZWqdZ05RwRyvB7Fu40TmpP1HJZeKqUVJy6PqE=;
        b=vjatGa/NefIm2C1bc1iH0it98a24ic45/vy9Bxti14GMN2aNIhbeSpR+pqFKUA1pBX
         qn53kNCpHwlBqHt6e9EwkCfDFtRbweqx3VhZVTy3/q1Twj+L5vLaTLO6NCu4orq1pKxD
         UEtXXtlHt/FUb46wjb4dghkmDHQ8nBRnLfmLwElsYgWyCLaPX5vK2UKdM2lp3e6nGvx1
         mrLqlA/1kVJL27sih2S3Fj0g9EGb04elnF4c21J1Kz05a7rGc3Tm6tAbE6wC3pnZ5TJi
         HP9jVOXnqM87NcBQdYoqQmF9j0u3ADk6FVnsWlXaZTSbG8fHBTKofpSEpN/frxNFXk89
         S+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768280770; x=1768885570;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXsXC2ZWqdZ05RwRyvB7Fu40TmpP1HJZeKqUVJy6PqE=;
        b=iq09D9qgTnZa6ZFSiMSUPOxp22ImSKggKF0A/4ywn6Ns0UA//JGRUbk9PP/fd+ANV0
         M65gw3zpM7FKbsumzAnaGVXXKO9XDVSsDjwoU+y/GeWmkBSObiUffeJWcLSFcgBNk6Q7
         7tngINtI39+GtcEPRWF0dRd7WDdyjzJxVFkd6kTC2+bKGP09DAe8qYLW5Ee2QjMLZsWx
         6vnbvhufXQfxf5kbKvfhNjYvE2EyubnM6mFiBwoka8TlXLH8alyTdUGERmKhrWZ5Sf1d
         WMohEhlHnHIVNyo/cnKRvvlNLiaA9QyHrn4sTGmSWh0Z+1sGE+MsrBETqgWFtfmVdsan
         uI/w==
X-Gm-Message-State: AOJu0YxytljldGDLjNKvNV1/gTxIBiTKTpqpd89nhR6PQnmZrJaw1ORL
	BB0iQPN+lsRHjJnsqBaUtNbOkJomIK6zhXxHfeUc4kan67RRyqeom94Ux2Ebo0C1i6+URXXpd/p
	WsyaG
X-Gm-Gg: AY/fxX7OEVePYAILxg0Xt/e8JE0YzpJxR+4rvRXLwliQEHETKQUrmSqoWaLogFIfDXQ
	iIxv1xQ7m95O/fgPmCdmM/6LOm7r7Rd4u/MWxiaj2wj4oToBOU/WXVuxTL1/H3W9NmUx7fr6djS
	aeZt6x13OCgSgnHhY6NVkPthsRID942RalPybHxaGOUPg9wHUsjF9tkPvp9JrDKkAGq04UPaTFQ
	F2GlCm4T3pyovUOSM9IAo6iVnFHfvMsovv+WE+Y8o/5FqqbSQj6R28NjeIhXN0M4e5TlRDyfjxA
	GVC2+LP0qcfG8uJJNHQwrQU/XMWGs4/3gYof72pkpfsuG0g2EoCnRSQjq+nfGNBMu/VnnD01DH2
	snFquhI451Bjx0AqG4IjLlReVTS880tSHY4p2V1z9rY1waJkSy7ZYSonUMF9n1m+l56uZTy/BoK
	P21/2QFacr1NQs++tG
X-Google-Smtp-Source: AGHT+IFNpkwV3j4miP//2DleZDjCdvG1hsMO5y0qYpkeSRibSBP4A7EuJNtf2C1Yrzp7b1z3gUPIfA==
X-Received: by 2002:a05:600c:4ed3:b0:47d:6140:3284 with SMTP id 5b1f17b1804b1-47d88fc1df4mr211374195e9.37.1768280769725;
        Mon, 12 Jan 2026 21:06:09 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ed9eb73d8sm6881695e9.3.2026.01.12.21.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 21:06:09 -0800 (PST)
Date: Tue, 13 Jan 2026 08:06:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Yu Kuai <yukuai@fnnas.com>,
	linux-raid@vger.kernel.org, linan122@huawei.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, yukuai@fnnas.com
Subject: Re: [PATCH v4 05/11] md/raid5: make sure max_sectors is not less
 than io_opt
Message-ID: <202601130531.LGfcZsa4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112042857.2334264-6-yukuai@fnnas.com>
Message-ID: <20260113050605.P9vIEAMjAr6G0amaNiMvUw6NlBZjSUcoDNGkTJq_kHw@z>

Hi Yu,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Kuai/md-merge-mddev-has_superblock-into-mddev_flags/20260112-123233
base:   linus/master
patch link:    https://lore.kernel.org/r/20260112042857.2334264-6-yukuai%40fnnas.com
patch subject: [PATCH v4 05/11] md/raid5: make sure max_sectors is not less than io_opt
config: i386-randconfig-141-20260113 (https://download.01.org/0day-ci/archive/20260113/202601130531.LGfcZsa4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601130531.LGfcZsa4-lkp@intel.com/

New smatch warnings:
drivers/md/raid5.c:8100 raid5_run() warn: missing error code 'ret'

vim +/ret +8100 drivers/md/raid5.c

cc6167b4f3b3ca NeilBrown            2016-11-02  8064  	pr_info("md/raid:%s: raid level %d active with %d out of %d devices, algorithm %d\n",
cc6167b4f3b3ca NeilBrown            2016-11-02  8065  		mdname(mddev), conf->level,
^1da177e4c3f41 Linus Torvalds       2005-04-16  8066  		mddev->raid_disks-mddev->degraded, mddev->raid_disks,
e183eaedd53807 NeilBrown            2009-03-31  8067  		mddev->new_layout);
^1da177e4c3f41 Linus Torvalds       2005-04-16  8068  
^1da177e4c3f41 Linus Torvalds       2005-04-16  8069  	print_raid5_conf(conf);
^1da177e4c3f41 Linus Torvalds       2005-04-16  8070  
fef9c61fdfabf9 NeilBrown            2009-03-31  8071  	if (conf->reshape_progress != MaxSector) {
fef9c61fdfabf9 NeilBrown            2009-03-31  8072  		conf->reshape_safe = conf->reshape_progress;
f67055780caac6 NeilBrown            2006-03-27  8073  		atomic_set(&conf->reshape_stripes, 0);
f67055780caac6 NeilBrown            2006-03-27  8074  		clear_bit(MD_RECOVERY_SYNC, &mddev->recovery);
f67055780caac6 NeilBrown            2006-03-27  8075  		clear_bit(MD_RECOVERY_CHECK, &mddev->recovery);
f67055780caac6 NeilBrown            2006-03-27  8076  		set_bit(MD_RECOVERY_RESHAPE, &mddev->recovery);
ad39c08186f8a0 Yu Kuai              2024-02-01  8077  		set_bit(MD_RECOVERY_NEEDED, &mddev->recovery);
f67055780caac6 NeilBrown            2006-03-27  8078  	}
f67055780caac6 NeilBrown            2006-03-27  8079  
^1da177e4c3f41 Linus Torvalds       2005-04-16  8080  	/* Ok, everything is just fine now */
a64c876fd35790 NeilBrown            2010-04-14  8081  	if (mddev->to_remove == &raid5_attrs_group)
a64c876fd35790 NeilBrown            2010-04-14  8082  		mddev->to_remove = NULL;
00bcb4ac7ee7e5 NeilBrown            2010-06-01  8083  	else if (mddev->kobj.sd &&
00bcb4ac7ee7e5 NeilBrown            2010-06-01  8084  	    sysfs_create_group(&mddev->kobj, &raid5_attrs_group))
cc6167b4f3b3ca NeilBrown            2016-11-02  8085  		pr_warn("raid5: failed to create sysfs attributes for %s\n",
5e55e2f5fc95b3 NeilBrown            2007-03-26  8086  			mdname(mddev));
4a5add49951e69 NeilBrown            2010-06-01  8087  	md_set_array_sectors(mddev, raid5_size(mddev, 0, 0));
7a5febe9ffeecd NeilBrown            2005-05-16  8088  
176df894d79741 Christoph Hellwig    2024-03-03  8089  	if (!mddev_is_dm(mddev)) {
f63f17350e5373 Christoph Hellwig    2024-03-03  8090  		ret = raid5_set_limits(mddev);
f63f17350e5373 Christoph Hellwig    2024-03-03  8091  		if (ret)
f63f17350e5373 Christoph Hellwig    2024-03-03  8092  			goto abort;
9f7c2220017771 NeilBrown            2010-07-26  8093  	}
23032a0eb97c8e Raz Ben-Jehuda(caro  2006-12-10  8094) 
585d578974395f Yu Kuai              2026-01-12  8095  	ret = raid5_create_ctx_pool(conf);
585d578974395f Yu Kuai              2026-01-12  8096  	if (ret)
01fce9e38c0e92 Yu Kuai              2026-01-12  8097  		goto abort;
01fce9e38c0e92 Yu Kuai              2026-01-12  8098  
845b9e229fe071 Artur Paszkiewicz    2017-04-04  8099  	if (log_init(conf, journal_dev, raid5_has_ppl(conf)))
5aabf7c49d9ebe Song Liu             2016-11-17 @8100  		goto abort;

Presumably we should propagate the error code from log_init()?

5c7e81c3de9eb3 Shaohua Li           2015-08-13  8101  
^1da177e4c3f41 Linus Torvalds       2005-04-16  8102  	return 0;
^1da177e4c3f41 Linus Torvalds       2005-04-16  8103  abort:
7eb8ff02c1df27 Li Lingfeng          2023-08-03  8104  	md_unregister_thread(mddev, &mddev->thread);
^1da177e4c3f41 Linus Torvalds       2005-04-16  8105  	print_raid5_conf(conf);
95fc17aac45300 Dan Williams         2009-07-31  8106  	free_conf(conf);
^1da177e4c3f41 Linus Torvalds       2005-04-16  8107  	mddev->private = NULL;
cc6167b4f3b3ca NeilBrown            2016-11-02  8108  	pr_warn("md/raid:%s: failed to run raid set.\n", mdname(mddev));
f63f17350e5373 Christoph Hellwig    2024-03-03  8109  	return ret;
^1da177e4c3f41 Linus Torvalds       2005-04-16  8110  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

