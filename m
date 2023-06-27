Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F0415AF5;
	Tue, 27 Jun 2023 08:24:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D9C292185A;
	Tue, 27 Jun 2023 08:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1687854254; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f5MOajeWUh1yfSvYZXUKS2tIrxeOmCvgib/m8ZJw8qc=;
	b=hi3GaVtGMFTQWow4V1aXHTrFut5Xns7X+bQ6g9mHF23cmJR5ZopWJarysZR1NPUhxX30fG
	2gyucNyu4gJTj+/1sautdMLs2kQw2uyWwr+w5KCHenltyn2tozSxDF5Ew4StLM+39iFhbI
	8ndBmzhJjTu/oTvbdnhf+17yMPBHmsU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1687854254;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f5MOajeWUh1yfSvYZXUKS2tIrxeOmCvgib/m8ZJw8qc=;
	b=hHY+xDG+29r8t0o+GthAeoyGw0svM7clYOEZz4/ruRmeO28TYHadzXN5m0O8LKlPLxRmfP
	myE6lnMzmkbdjmDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB16C13276;
	Tue, 27 Jun 2023 08:24:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id AqSKMa6cmmRcOgAAMHmgww
	(envelope-from <jack@suse.cz>); Tue, 27 Jun 2023 08:24:14 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 49EA8A0762; Tue, 27 Jun 2023 10:24:14 +0200 (CEST)
Date: Tue, 27 Jun 2023 10:24:14 +0200
From: Jan Kara <jack@suse.cz>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jan Kara <jack@suse.cz>, oe-kbuild@lists.linux.dev, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>,
	Kent Overstreet <kmo@daterainc.com>
Subject: Re: [axboe-block:for-6.5/block-late 216/216]
 drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory
 'holder'
Message-ID: <20230627082414.wi6ufb5vzlqxjoc5@quack3>
References: <0108ee74-6186-4707-ab31-8e4543d98db5@kadam.mountain>
 <20230626160115.5ctxooc6dtdhrn7h@quack3>
 <b815edc6-bed4-4ed3-9961-e76dd2f89457@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b815edc6-bed4-4ed3-9961-e76dd2f89457@kadam.mountain>

On Tue 27-06-23 08:56:34, Dan Carpenter wrote:
> On Mon, Jun 26, 2023 at 06:01:15PM +0200, Jan Kara wrote:
> > On Mon 26-06-23 15:05:07, Dan Carpenter wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.5/block-late
> > > head:   2c5555983bd27d24162534b682b10654639a5576
> > > commit: 2c5555983bd27d24162534b682b10654639a5576 [216/216] bcache: Fix bcache device claiming
> > > config: i386-randconfig-m031-20230622 (https://download.01.org/0day-ci/archive/20230624/202306241746.1sA0eBvt-lkp@intel.com/config)
> > > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > > reproduce: (https://download.01.org/0day-ci/archive/20230624/202306241746.1sA0eBvt-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > | Closes: https://lore.kernel.org/r/202306241746.1sA0eBvt-lkp@intel.com/
> > > 
> > > smatch warnings:
> > > drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory 'holder'
> > 
> > I had a look into the code and frankly I don't see how this could happen.
> > We can reach line 2644 only on explicit goto out_free_holder; which happens
> > in two places and in both of them I don't see how holder could be already
> > freed. Dan, can you share a bit more how the checker arrived at this
> > conclusion?
> 
> I think you're misreading the warning...  The free happens later.

Aha, I thought the warning is complaining about 'holder' being already
freed when passed to kfree(). Apparently it is something else.

> It's like this:
> 
> drivers/md/bcache/super.c
>   2572          blkdev_put(bdev, NULL);
>   2573          bdev = bdev2;
>                 ^^^^^^^^^^^^
> bdev is set here.
> 
>   2574          if (IS_ERR(bdev)) {
>   2575                  ret = PTR_ERR(bdev);
>   2576                  bdev = NULL;
>   2577                  if (ret == -EBUSY) {
>   2578                          dev_t dev;
>   2579  
>   2580                          mutex_lock(&bch_register_lock);
>   2581                          if (lookup_bdev(strim(path), &dev) == 0 &&
>   2582                              bch_is_open(dev))
>   2583                                  err = "device already registered";
>   2584                          else
>   2585                                  err = "device busy";
>   2586                          mutex_unlock(&bch_register_lock);
>   2587                          if (attr == &ksysfs_register_quiet) {
>   2588                                  quiet = true;
>   2589                                  ret = size;
>   2590                          }
>   2591                  }
>   2592                  goto out_free_holder;
> 
> bdev is NULL on this path so it's fine.
> 
>   2593          }
>   2594  
>   2595          err = "failed to register device";
>   2596  
>   2597          if (async_registration) {
>   2598                  /* register in asynchronous way */
>   2599                  struct async_reg_args *args =
>   2600                          kzalloc(sizeof(struct async_reg_args), GFP_KERNEL);
>   2601  
>   2602                  if (!args) {
>   2603                          ret = -ENOMEM;
>   2604                          err = "cannot allocate memory";
>   2605                          goto out_free_holder;
>                                 ^^^^^^^^^^^^^^^^^^^^
> Here is the issue.  Adding a "bdev = NULL;" before the goto would
> silence the Smatch warning.  (That might not be the right thing to do).
> 
>   2606                  }
>   2607  
>   2608                  args->path      = path;
>   2609                  args->sb        = sb;
>   2610                  args->sb_disk   = sb_disk;
>   2611                  args->bdev      = bdev;
>   2612                  args->holder    = holder;
>   2613                  register_device_async(args);
>   2614                  /* No wait and returns to user space */
>   2615                  goto async_done;
>   2616          }
>   2617  
>   2618          if (SB_IS_BDEV(sb)) {
>   2619                  mutex_lock(&bch_register_lock);
>   2620                  ret = register_bdev(sb, sb_disk, bdev, holder);
>   2621                  mutex_unlock(&bch_register_lock);
>   2622                  /* blkdev_put() will be called in cached_dev_free() */
>   2623                  if (ret < 0)
>   2624                          goto out_free_sb;
>   2625          } else {
>   2626                  /* blkdev_put() will be called in bch_cache_release() */
>   2627                  ret = register_cache(sb, sb_disk, bdev, holder);
>   2628                  if (ret)
>   2629                          goto out_free_sb;
>   2630          }
>   2631  
>   2632          kfree(sb);
>   2633          kfree(path);
>   2634          module_put(THIS_MODULE);
>   2635  async_done:
>   2636          return size;
>   2637  
>   2638  out_free_holder:
>   2639          kfree(holder);
>                 ^^^^^^^^^^^^^
> freed
> 
>   2640  out_put_sb_page:
>   2641          put_page(virt_to_page(sb_disk));
>   2642  out_blkdev_put:
>   2643          if (bdev)
>   2644                  blkdev_put(bdev, holder);
>                                          ^^^^^^
> bdev is non-NULL and holder is freed.

Ah, I see what smatch is actually disliking here now. So the code is
actually correct as is - 'holder' is just a cookie value for blkdev_put()
and never dereferenced. Also I have a series in the works that changes how
block device opening is working which also gets rid of this oddity of
passing freed pointer to blkdev_put() so I think we can leave it there for
now.

								Honza

-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
