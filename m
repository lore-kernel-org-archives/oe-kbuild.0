Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA2F1396
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jun 2023 05:56:42 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3112f256941so3731969f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 22:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687845400; x=1690437400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SkQIuWxAD95KvrXtRvp82QPsfa9BRLt6s9+5yKGbh58=;
        b=BZosZAxpsVIA0J6K62Gybgpj2PPvKqe/2XN8oioWUc350oNNDSVucSdC1ny3bm8+j5
         P2GFLlC5l+MwmSsa1gh0j/8sB5BGCdoGR8WIL3eeQdW8+M8soY6hcj0Gi5xaM4yyINYj
         9DEyGJWtIWfzRrGYYOSI44huozvJuHL07+8aEkPbjzf9GJFvLjUvtovQO0GkIVQfueiV
         GIxDh0qZ4Lbifa8lcaBLV/7MFkixuds4oB2U+JcNCQMPnaJhCo/GB+0dWXHAkHvwZEi1
         QSvOWRAsTbAHVWQUjWENNcYH0klNezzHFGsf80Odi5jP5zUmqSKpMQChpxYJ8dVL6G2A
         nOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687845400; x=1690437400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkQIuWxAD95KvrXtRvp82QPsfa9BRLt6s9+5yKGbh58=;
        b=b826BusNxcWI/5l29dPeD0ihY21eAL0EqdBZjZPGwWswEIfLZDXKlCESGz5qQNop4A
         bWyuG6wSYxUlUvZIq7yKEQaITXu9qpAXeckjdeNFu34e2VqO/w9utI12Fe26smw0iq++
         Q76bbIeY3U1OPRYEVXqgYig55UW2fldjW1r4p09oOd3FWW3yGN54RDUds9jvAiK5RkxU
         vM9RfFbVGKxHySChavrXujvAUQovmQqYoG61hCC6GmuWK+eFncBcXgLiE9V2RtSxQbOu
         V1C9MhcVfj7BjK2wHK8Pl+FR6GznOy6vE019QmUeMOimNNSWER0aJ9C4lw18sp38TwUy
         +0PQ==
X-Gm-Message-State: AC+VfDwtulgEPQYZRjmLjweEZgQX6MxjTtqavOEVm303OZFnWSdEG0kc
	T1nMsTXjGEygjs6/3/eGmmCEgQ==
X-Google-Smtp-Source: ACHHUZ5JVyPaCV7z8RFHg7f1NpcQf44NfLYsMgORIOyVBGfZYk7iehoKaQzODkEsz1F2A3YATpCdgQ==
X-Received: by 2002:adf:fec2:0:b0:313:fa66:9c08 with SMTP id q2-20020adffec2000000b00313fa669c08mr1256240wrs.71.1687845400496;
        Mon, 26 Jun 2023 22:56:40 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id l17-20020a5d5611000000b0030c6751a49dsm9157976wrv.115.2023.06.26.22.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 22:56:37 -0700 (PDT)
Date: Tue, 27 Jun 2023 08:56:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, Kent Overstreet <kmo@daterainc.com>
Subject: Re: [axboe-block:for-6.5/block-late 216/216]
 drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory
 'holder'
Message-ID: <b815edc6-bed4-4ed3-9961-e76dd2f89457@kadam.mountain>
References: <0108ee74-6186-4707-ab31-8e4543d98db5@kadam.mountain>
 <20230626160115.5ctxooc6dtdhrn7h@quack3>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626160115.5ctxooc6dtdhrn7h@quack3>

On Mon, Jun 26, 2023 at 06:01:15PM +0200, Jan Kara wrote:
> On Mon 26-06-23 15:05:07, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.5/block-late
> > head:   2c5555983bd27d24162534b682b10654639a5576
> > commit: 2c5555983bd27d24162534b682b10654639a5576 [216/216] bcache: Fix bcache device claiming
> > config: i386-randconfig-m031-20230622 (https://download.01.org/0day-ci/archive/20230624/202306241746.1sA0eBvt-lkp@intel.com/config)
> > compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
> > reproduce: (https://download.01.org/0day-ci/archive/20230624/202306241746.1sA0eBvt-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202306241746.1sA0eBvt-lkp@intel.com/
> > 
> > smatch warnings:
> > drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory 'holder'
> 
> I had a look into the code and frankly I don't see how this could happen.
> We can reach line 2644 only on explicit goto out_free_holder; which happens
> in two places and in both of them I don't see how holder could be already
> freed. Dan, can you share a bit more how the checker arrived at this
> conclusion?

I think you're misreading the warning...  The free happens later.  It's
like this:

drivers/md/bcache/super.c
  2572          blkdev_put(bdev, NULL);
  2573          bdev = bdev2;
                ^^^^^^^^^^^^
bdev is set here.

  2574          if (IS_ERR(bdev)) {
  2575                  ret = PTR_ERR(bdev);
  2576                  bdev = NULL;
  2577                  if (ret == -EBUSY) {
  2578                          dev_t dev;
  2579  
  2580                          mutex_lock(&bch_register_lock);
  2581                          if (lookup_bdev(strim(path), &dev) == 0 &&
  2582                              bch_is_open(dev))
  2583                                  err = "device already registered";
  2584                          else
  2585                                  err = "device busy";
  2586                          mutex_unlock(&bch_register_lock);
  2587                          if (attr == &ksysfs_register_quiet) {
  2588                                  quiet = true;
  2589                                  ret = size;
  2590                          }
  2591                  }
  2592                  goto out_free_holder;

bdev is NULL on this path so it's fine.

  2593          }
  2594  
  2595          err = "failed to register device";
  2596  
  2597          if (async_registration) {
  2598                  /* register in asynchronous way */
  2599                  struct async_reg_args *args =
  2600                          kzalloc(sizeof(struct async_reg_args), GFP_KERNEL);
  2601  
  2602                  if (!args) {
  2603                          ret = -ENOMEM;
  2604                          err = "cannot allocate memory";
  2605                          goto out_free_holder;
                                ^^^^^^^^^^^^^^^^^^^^
Here is the issue.  Adding a "bdev = NULL;" before the goto would
silence the Smatch warning.  (That might not be the right thing to do).

  2606                  }
  2607  
  2608                  args->path      = path;
  2609                  args->sb        = sb;
  2610                  args->sb_disk   = sb_disk;
  2611                  args->bdev      = bdev;
  2612                  args->holder    = holder;
  2613                  register_device_async(args);
  2614                  /* No wait and returns to user space */
  2615                  goto async_done;
  2616          }
  2617  
  2618          if (SB_IS_BDEV(sb)) {
  2619                  mutex_lock(&bch_register_lock);
  2620                  ret = register_bdev(sb, sb_disk, bdev, holder);
  2621                  mutex_unlock(&bch_register_lock);
  2622                  /* blkdev_put() will be called in cached_dev_free() */
  2623                  if (ret < 0)
  2624                          goto out_free_sb;
  2625          } else {
  2626                  /* blkdev_put() will be called in bch_cache_release() */
  2627                  ret = register_cache(sb, sb_disk, bdev, holder);
  2628                  if (ret)
  2629                          goto out_free_sb;
  2630          }
  2631  
  2632          kfree(sb);
  2633          kfree(path);
  2634          module_put(THIS_MODULE);
  2635  async_done:
  2636          return size;
  2637  
  2638  out_free_holder:
  2639          kfree(holder);
                ^^^^^^^^^^^^^
freed

  2640  out_put_sb_page:
  2641          put_page(virt_to_page(sb_disk));
  2642  out_blkdev_put:
  2643          if (bdev)
  2644                  blkdev_put(bdev, holder);
                                         ^^^^^^
bdev is non-NULL and holder is freed.

  2645  out_free_sb:
  2646          kfree(sb);
  2647  out_free_path:
  2648          kfree(path);
  2649          path = NULL;
  2650  out_module_put:
  2651          module_put(THIS_MODULE);
  2652  out:
  2653          if (!quiet)
  2654                  pr_info("error %s: %s\n", path?path:"", err);
  2655          return ret;
  2656  }

regards,
dan carpenter
