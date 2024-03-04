Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D23A16429
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Mar 2024 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709538674; cv=none; b=Cm1Dpg1Efz+Tyiwi6hfxFthbSiRSWQ8FSbvfEltv39/DESLpb3GyuFRIomcZ3DZpabQxwM7IAScX8MaGIzOiuLEykr0ZzTmQauXONcRuqJY8G9ltb/+ayCOpMCPPgSYNaW+31QgEs+uBCShlF0uk+j3s6SjwAGS4Jr/mXE4NXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709538674; c=relaxed/simple;
	bh=uw1q0O4ij0ebW2aI7lUSh8p82KXkHjRWzTDx+8F66/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bz1Lox7JIWLGVSqGb9Ypcb4wACdRdzTZd23FmYhJ2BJYIc6FLCBR5YMNWalBPuQPUhuKH3n7TpemZE47EssXdB8pfh20e/TGdGUjH6odliijaYuuC30h46iUS0Rax+GeDT4q+xUZvZ3LNxOYNU48kYZk9bxR1WUsf49t98ewER4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KVHtCC3j; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KVHtCC3j"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2d3b93e992aso7936911fa.1
        for <oe-kbuild@lists.linux.dev>; Sun, 03 Mar 2024 23:51:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709538670; x=1710143470; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFF31QEJQVefZlwhMt2v8a60jwFrpTVhlfxydXT0BdM=;
        b=KVHtCC3jj4LLdQhWZWXuc3o/3w9nIczTH4ya2/2T7TBmfJGT9KQzNvkxgl2y/QbgGT
         APk42wVGLxvIzj9bbcJ8WfrVFBT3Vqo4qsa3EnpdUAMUounAppsLelS8EytyzT5bf8L+
         ye2I2GnTqIpcsTg0+Ypatffc9BMn+fqzN0OwZvzDD6ZLubZ31ATGz0AomXNPcqZLSVyn
         aypZb/vtXzoQNHiFQopmHc1Ocz/8AbE7+1fSTkELR7EA6O0V3bqOoWUtfqXq6DL6dq5L
         xWfJOnN98Ltor71OiDns/92QZY7g9p5h8kEmxGWOoos46OryLkJXC8F4m2VWCe6TYBjM
         n+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709538670; x=1710143470;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFF31QEJQVefZlwhMt2v8a60jwFrpTVhlfxydXT0BdM=;
        b=jSUVQodrE/znFjf4ZSrVd1dlYbB6/8JhVWwxceC2RqpvQoJCXU01g68zvKf7AEKuH0
         BCXU6cvw0c9IgHxbgquCQHz3j66NvGGIA8Mvzbw6G2Dh/eR87JKFKiWUTvrqMUww1qh1
         hSCXB+5SqsZY7rcGqTx8PjBYLQeQKiTR8gwj7uJMQxcrUQBAzK/9GCSkCJd5sBGOp4oT
         /+QX4+jnAX2aiRTW9/emlgwfK83ONVHXPchkkXAseCBS6i7ZJLj8lrhJd2Q8mf20gjqr
         T0RP7QfSdCrFzsRwmRf1EkopVP2hE+9qAPcf89zc8VmBY9z3wRdYuH8i9euzO3yy949f
         r0QA==
X-Gm-Message-State: AOJu0Yz2b6+/2b3FMWL19t0iLPXuxacfTzFRWr8vifm2tW/HL3CQJqQY
	kF/428lJz7zC7T+4s9rvC7uiXklIsTwpisjiBIuIgJXrrKz86TsdGJlAt6lPM1pDaU2RIz/iwFb
	n
X-Google-Smtp-Source: AGHT+IG9gZsD3B4A2GfDF1yhHdfrrnmg8EyLhP/C3Kkv422s4/1f72vccwCP6hmnbvqRbO2sjfU+nA==
X-Received: by 2002:a2e:3207:0:b0:2d3:4b73:7b40 with SMTP id y7-20020a2e3207000000b002d34b737b40mr4835583ljy.17.1709538670591;
        Sun, 03 Mar 2024 23:51:10 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id p6-20020adf9d86000000b0033e0dd83be1sm11473868wre.91.2024.03.03.23.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 23:51:10 -0800 (PST)
Date: Mon, 4 Mar 2024 10:51:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Christoph Hellwig <hch@lst.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [hch-block:drbd-blk-limits 5/16] drivers/md/raid0.c:396 raid0_run()
 error: uninitialized symbol 'conf'.
Message-ID: <f1af61df-618b-44c9-937d-3e6f25445d9f@moroto.mountain>
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
commit: c3361ed114ad32d50e622fdf1e3f27d4a1dde8fb [5/16] md/raid0: use the atomic queue limit update APIs
config: x86_64-randconfig-161-20240301 (https://download.01.org/0day-ci/archive/20240303/202403032344.AfnsKzTf-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202403032344.AfnsKzTf-lkp@intel.com/

smatch warnings:
drivers/md/raid0.c:396 raid0_run() error: uninitialized symbol 'conf'.

vim +/conf +396 drivers/md/raid0.c

fd01b88c75a7180 NeilBrown         2011-10-11  382  static int raid0_run(struct mddev *mddev)
^1da177e4c3f415 Linus Torvalds    2005-04-16  383  {
c3361ed114ad32d Christoph Hellwig 2024-02-22  384  	struct queue_limits lim;
e373ab109172abc NeilBrown         2011-10-11  385  	struct r0conf *conf;
5568a6035d9fca2 Andre Noll        2009-06-16  386  	int ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  387  
9d8f0363623b3da Andre Noll        2009-06-18  388  	if (mddev->chunk_sectors == 0) {
766038846e87574 NeilBrown         2016-11-02  389  		pr_warn("md/raid0:%s: chunk size must be set.\n", mdname(mddev));
2604b703b6b3db8 NeilBrown         2006-01-06  390  		return -EINVAL;
2604b703b6b3db8 NeilBrown         2006-01-06  391  	}
0894cc3066aaa3e Andre Noll        2009-06-18  392  	if (md_check_no_bitmap(mddev))
0894cc3066aaa3e Andre Noll        2009-06-18  393  		return -EINVAL;
753f2856cda2a13 Heinz Mauelshagen 2015-02-13  394  
c3361ed114ad32d Christoph Hellwig 2024-02-22  395  	/* if conf is not null, we are here after takeover */
c3361ed114ad32d Christoph Hellwig 2024-02-22 @396  	if (!conf) {
                                                            ^^^^^
conf is uninitialized.

9af204cf720cedf Trela, Maciej     2010-03-08  397  		ret = create_strip_zones(mddev, &conf);
5568a6035d9fca2 Andre Noll        2009-06-16  398  		if (ret < 0)
c567c86b90d4715 Yu Kuai           2023-06-22  399  			return ret;
9af204cf720cedf Trela, Maciej     2010-03-08  400  		mddev->private = conf;
9af204cf720cedf Trela, Maciej     2010-03-08  401  	}
199dc6ed5179251 NeilBrown         2015-08-03  402  
c3361ed114ad32d Christoph Hellwig 2024-02-22  403  	blk_set_stacking_limits(&lim);
c3361ed114ad32d Christoph Hellwig 2024-02-22  404  	lim.max_hw_sectors = mddev->chunk_sectors;
c3361ed114ad32d Christoph Hellwig 2024-02-22  405  	lim.max_write_zeroes_sectors = mddev->chunk_sectors;
c3361ed114ad32d Christoph Hellwig 2024-02-22  406  	lim.io_min = mddev->chunk_sectors << 9;
c3361ed114ad32d Christoph Hellwig 2024-02-22  407  	lim.io_opt = lim.io_min * mddev->raid_disks;
c3361ed114ad32d Christoph Hellwig 2024-02-22  408  	mddev_stack_rdev_limits(mddev, &lim);
c3361ed114ad32d Christoph Hellwig 2024-02-22  409  	ret = queue_limits_set(mddev->queue, &lim);
c3361ed114ad32d Christoph Hellwig 2024-02-22  410  	if (ret)
c3361ed114ad32d Christoph Hellwig 2024-02-22  411  		goto out_free_conf;
^1da177e4c3f415 Linus Torvalds    2005-04-16  412  
^1da177e4c3f415 Linus Torvalds    2005-04-16  413  	/* calculate array device size */
1f403624bde3c67 Dan Williams      2009-03-31  414  	md_set_array_sectors(mddev, raid0_size(mddev, 0, 0));
^1da177e4c3f415 Linus Torvalds    2005-04-16  415  
766038846e87574 NeilBrown         2016-11-02  416  	pr_debug("md/raid0:%s: md_size is %llu sectors.\n",
b5a20961f3479dd NeilBrown         2010-05-03  417  		 mdname(mddev),
ccacc7d2cf03114 Andre Noll        2009-01-09  418  		 (unsigned long long)mddev->array_sectors);
753f2856cda2a13 Heinz Mauelshagen 2015-02-13  419  
46994191ae8fdf1 raz ben yehuda    2009-06-16  420  	dump_zones(mddev);
0366ef847581d69 majianpeng        2012-04-02  421  
0366ef847581d69 majianpeng        2012-04-02  422  	ret = md_integrity_register(mddev);
0c031fd37f69deb Xiao Ni           2021-12-10  423  	if (ret)
c3361ed114ad32d Christoph Hellwig 2024-02-22  424  		goto out_free_conf;
c3361ed114ad32d Christoph Hellwig 2024-02-22  425  	return 0;
c3361ed114ad32d Christoph Hellwig 2024-02-22  426  out_free_conf:
0c031fd37f69deb Xiao Ni           2021-12-10  427  	free_conf(mddev, conf);
0c031fd37f69deb Xiao Ni           2021-12-10  428  	return ret;
^1da177e4c3f415 Linus Torvalds    2005-04-16  429  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

