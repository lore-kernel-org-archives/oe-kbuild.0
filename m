Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7E3C8E9;
	Mon, 26 Jun 2023 16:01:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 97BC921855;
	Mon, 26 Jun 2023 16:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1687795276; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l2ryW+rViBd6L+rvMzNbesV3/gH4ubhGtrOLnJFR66I=;
	b=UELeJTOOxIhZvM4NqKAEHIWFV8mQYhwKdN6b8ckf0NSyLshFEFlOEuG+tgvB+Ku7dZOakt
	9hVhhHygbk6K/uf5Q8kN3ClzUHtc8hXepvEq4eUCAvZBcDI5a2nMYBI/ev7bgZrukhZz7y
	tdKCEr4ylpNJ3zvV/LQKWGVN0fEnpF4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1687795276;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=l2ryW+rViBd6L+rvMzNbesV3/gH4ubhGtrOLnJFR66I=;
	b=e2ZRSvbcCcBpzb53nCJeMrTi8BIopCl+J+e4RCkrb5aD1cZkZTgAYbjQYr4AW221JyOham
	A5aod6WlvMatnPAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8417313483;
	Mon, 26 Jun 2023 16:01:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id xH85IEy2mWTINAAAMHmgww
	(envelope-from <jack@suse.cz>); Mon, 26 Jun 2023 16:01:16 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id EB1EFA0754; Mon, 26 Jun 2023 18:01:15 +0200 (CEST)
Date: Mon, 26 Jun 2023 18:01:15 +0200
From: Jan Kara <jack@suse.cz>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Jan Kara <jack@suse.cz>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Kent Overstreet <kmo@daterainc.com>
Subject: Re: [axboe-block:for-6.5/block-late 216/216]
 drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory
 'holder'
Message-ID: <20230626160115.5ctxooc6dtdhrn7h@quack3>
References: <0108ee74-6186-4707-ab31-8e4543d98db5@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0108ee74-6186-4707-ab31-8e4543d98db5@kadam.mountain>

On Mon 26-06-23 15:05:07, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.5/block-late
> head:   2c5555983bd27d24162534b682b10654639a5576
> commit: 2c5555983bd27d24162534b682b10654639a5576 [216/216] bcache: Fix bcache device claiming
> config: i386-randconfig-m031-20230622 (https://download.01.org/0day-ci/archive/20230624/202306241746.1sA0eBvt-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20230624/202306241746.1sA0eBvt-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202306241746.1sA0eBvt-lkp@intel.com/
> 
> smatch warnings:
> drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory 'holder'

I had a look into the code and frankly I don't see how this could happen.
We can reach line 2644 only on explicit goto out_free_holder; which happens
in two places and in both of them I don't see how holder could be already
freed. Dan, can you share a bit more how the checker arrived at this
conclusion?

								Honza

> 
> vim +/holder +2644 drivers/md/bcache/super.c
> 
> 9e23ccf8f0a22e Coly Li           2020-05-27  2608  		args->path	= path;
> 9e23ccf8f0a22e Coly Li           2020-05-27  2609  		args->sb	= sb;
> 9e23ccf8f0a22e Coly Li           2020-05-27  2610  		args->sb_disk	= sb_disk;
> 9e23ccf8f0a22e Coly Li           2020-05-27  2611  		args->bdev	= bdev;
> abcc0cbd49283f Jan Kara          2023-06-22  2612  		args->holder	= holder;
> d7fae7b4fa1527 Kai Krakow        2021-02-10  2613  		register_device_async(args);
> 9e23ccf8f0a22e Coly Li           2020-05-27  2614  		/* No wait and returns to user space */
> 9e23ccf8f0a22e Coly Li           2020-05-27  2615  		goto async_done;
> 9e23ccf8f0a22e Coly Li           2020-05-27  2616  	}
> 9e23ccf8f0a22e Coly Li           2020-05-27  2617  
> 2903381fce7100 Kent Overstreet   2013-04-11  2618  	if (SB_IS_BDEV(sb)) {
> 4fa03402cda2fa Kent Overstreet   2014-03-17  2619  		mutex_lock(&bch_register_lock);
> abcc0cbd49283f Jan Kara          2023-06-22  2620  		ret = register_bdev(sb, sb_disk, bdev, holder);
> 4fa03402cda2fa Kent Overstreet   2014-03-17  2621  		mutex_unlock(&bch_register_lock);
> bb6d355c2aff42 Coly Li           2019-04-25  2622  		/* blkdev_put() will be called in cached_dev_free() */
> fc8f19cc5dce18 Christoph Hellwig 2020-01-24  2623  		if (ret < 0)
> fc8f19cc5dce18 Christoph Hellwig 2020-01-24  2624  			goto out_free_sb;
> cafe563591446c Kent Overstreet   2013-03-23  2625  	} else {
> bb6d355c2aff42 Coly Li           2019-04-25  2626  		/* blkdev_put() will be called in bch_cache_release() */
> abcc0cbd49283f Jan Kara          2023-06-22  2627  		ret = register_cache(sb, sb_disk, bdev, holder);
> d55f7cb2e5c053 Chao Yu           2021-10-20  2628  		if (ret)
> fc8f19cc5dce18 Christoph Hellwig 2020-01-24  2629  			goto out_free_sb;
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2630  	}
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2631  
> f59fce847fc848 Kent Overstreet   2013-05-15  2632  	kfree(sb);
> f59fce847fc848 Kent Overstreet   2013-05-15  2633  	kfree(path);
> f59fce847fc848 Kent Overstreet   2013-05-15  2634  	module_put(THIS_MODULE);
> 9e23ccf8f0a22e Coly Li           2020-05-27  2635  async_done:
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2636  	return size;
> f59fce847fc848 Kent Overstreet   2013-05-15  2637  
> abcc0cbd49283f Jan Kara          2023-06-22  2638  out_free_holder:
> abcc0cbd49283f Jan Kara          2023-06-22  2639  	kfree(holder);
>                                                               ^^^^^^
> freed
> 
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2640  out_put_sb_page:
> cfa0c56db9c087 Christoph Hellwig 2020-01-24  2641  	put_page(virt_to_page(sb_disk));
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2642  out_blkdev_put:
> 2c5555983bd27d Jan Kara          2023-06-22  2643  	if (bdev)
> 2c5555983bd27d Jan Kara          2023-06-22 @2644  		blkdev_put(bdev, holder);
>                                                                                  ^^^^^^
> Use after free
> 
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2645  out_free_sb:
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2646  	kfree(sb);
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2647  out_free_path:
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2648  	kfree(path);
> ae3cd299919af6 Coly Li           2020-01-24  2649  	path = NULL;
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2650  out_module_put:
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2651  	module_put(THIS_MODULE);
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2652  out:
> 2c5555983bd27d Jan Kara          2023-06-22  2653  	if (!quiet)
> 46f5aa8806e34f Joe Perches       2020-05-27  2654  		pr_info("error %s: %s\n", path?path:"", err);
> 50246693f81fe8 Christoph Hellwig 2020-01-24  2655  	return ret;
> cafe563591446c Kent Overstreet   2013-03-23  2656  }
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
