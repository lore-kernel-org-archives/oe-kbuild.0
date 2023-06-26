Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FAB883B
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 12:05:14 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-313e68e99c7so2728234f8f.1
        for <oe-kbuild@lists.linux.dev>; Mon, 26 Jun 2023 05:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687781112; x=1690373112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XREjUniwO0JaqZmKbXGd3kgBg0KZt/FvmIqoaYNsVh8=;
        b=SklCc6YUrjpFWFaERsq+sZlt9bVVLaK4bVUy0ZBkPKc8SD1sxoi8hXb910Br4QznAz
         IcOkE1lB0A6rJfMWTex/aW7uQK0JbiVem70kv5jLxdyL4pGThD5exWSA0VOzY1QqiNvz
         tCYyjywb3465N8esZhTZhyTP7OHK9GdBnErqGpDfkVBnFIPQ8lDNTVYx+Q/jrpKo/Is9
         3aLDXAGa7rSpgp0QO4BWsp80dHFqkc46UU7WN4HzhRzQogyCE0nnCyzWWUkMeaDofYli
         K8oCZl2rLI5d1z9amoXE8bWHssDZbcmA+VSJuoWIoeqxjg2HKhOKs9U8MLNbKa5Ea0h0
         fQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687781112; x=1690373112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XREjUniwO0JaqZmKbXGd3kgBg0KZt/FvmIqoaYNsVh8=;
        b=jMrRk+1Wmk75u6G15ARxEab6g7WWIJ5HUZ7xtiWNipPrzhf4vBSsPxX8pjYH3Kjb4U
         dvMUq5RtfdSdaGcbeihJPWDVd1isVzM/HhX8N+MN5g3ta7PI/PQz2SQEA3ooLkUFKF4M
         8R4yzeatx/4z6fyYH4vviL5wtNJEv/xIeJ5FH7AApZeVzzWmt5wwItYTUBEPhPUA8hzZ
         QAJbZc+iW9QNl/vnwqzvq35irp+RJSFkkUCmMWokCwcvgYX9pYhHjqM9QtI7mVIa6DC1
         18gNP4F7Ge8amAFZDbCDoyKxTgHsOvKDOtd39hi0gbJiN6IRtqYd5p5bx38UBso6WjsN
         yA1A==
X-Gm-Message-State: AC+VfDzI6gzxc8zp4Gq+D1TnK3Zi3Pearz9NuzlUjQh3PrQoKfmL8JBy
	A7oW7i6Z+kfk3pAkJ9w/Rhmltush1u3oXL0MC9k=
X-Google-Smtp-Source: ACHHUZ7iuJ3F72MV2tHg8JzNQF0+zrbqCG9R7Oppvcnv91J7OlBBqk+XBjA6WQMjGgMMI58MP1+4ig==
X-Received: by 2002:a5d:6145:0:b0:30f:c4ca:e9d6 with SMTP id y5-20020a5d6145000000b0030fc4cae9d6mr23385032wrt.54.1687781111848;
        Mon, 26 Jun 2023 05:05:11 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q9-20020a056000136900b0030f9c3219aasm7192227wrz.47.2023.06.26.05.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 05:05:10 -0700 (PDT)
Date: Mon, 26 Jun 2023 15:05:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jan Kara <jack@suse.cz>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jens Axboe <axboe@kernel.dk>, Kent Overstreet <kmo@daterainc.com>
Subject: [axboe-block:for-6.5/block-late 216/216]
 drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory
 'holder'
Message-ID: <0108ee74-6186-4707-ab31-8e4543d98db5@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.5/block-late
head:   2c5555983bd27d24162534b682b10654639a5576
commit: 2c5555983bd27d24162534b682b10654639a5576 [216/216] bcache: Fix bcache device claiming
config: i386-randconfig-m031-20230622 (https://download.01.org/0day-ci/archive/20230624/202306241746.1sA0eBvt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306241746.1sA0eBvt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306241746.1sA0eBvt-lkp@intel.com/

smatch warnings:
drivers/md/bcache/super.c:2644 register_bcache() warn: passing freed memory 'holder'

vim +/holder +2644 drivers/md/bcache/super.c

9e23ccf8f0a22e Coly Li           2020-05-27  2608  		args->path	= path;
9e23ccf8f0a22e Coly Li           2020-05-27  2609  		args->sb	= sb;
9e23ccf8f0a22e Coly Li           2020-05-27  2610  		args->sb_disk	= sb_disk;
9e23ccf8f0a22e Coly Li           2020-05-27  2611  		args->bdev	= bdev;
abcc0cbd49283f Jan Kara          2023-06-22  2612  		args->holder	= holder;
d7fae7b4fa1527 Kai Krakow        2021-02-10  2613  		register_device_async(args);
9e23ccf8f0a22e Coly Li           2020-05-27  2614  		/* No wait and returns to user space */
9e23ccf8f0a22e Coly Li           2020-05-27  2615  		goto async_done;
9e23ccf8f0a22e Coly Li           2020-05-27  2616  	}
9e23ccf8f0a22e Coly Li           2020-05-27  2617  
2903381fce7100 Kent Overstreet   2013-04-11  2618  	if (SB_IS_BDEV(sb)) {
4fa03402cda2fa Kent Overstreet   2014-03-17  2619  		mutex_lock(&bch_register_lock);
abcc0cbd49283f Jan Kara          2023-06-22  2620  		ret = register_bdev(sb, sb_disk, bdev, holder);
4fa03402cda2fa Kent Overstreet   2014-03-17  2621  		mutex_unlock(&bch_register_lock);
bb6d355c2aff42 Coly Li           2019-04-25  2622  		/* blkdev_put() will be called in cached_dev_free() */
fc8f19cc5dce18 Christoph Hellwig 2020-01-24  2623  		if (ret < 0)
fc8f19cc5dce18 Christoph Hellwig 2020-01-24  2624  			goto out_free_sb;
cafe563591446c Kent Overstreet   2013-03-23  2625  	} else {
bb6d355c2aff42 Coly Li           2019-04-25  2626  		/* blkdev_put() will be called in bch_cache_release() */
abcc0cbd49283f Jan Kara          2023-06-22  2627  		ret = register_cache(sb, sb_disk, bdev, holder);
d55f7cb2e5c053 Chao Yu           2021-10-20  2628  		if (ret)
fc8f19cc5dce18 Christoph Hellwig 2020-01-24  2629  			goto out_free_sb;
50246693f81fe8 Christoph Hellwig 2020-01-24  2630  	}
50246693f81fe8 Christoph Hellwig 2020-01-24  2631  
f59fce847fc848 Kent Overstreet   2013-05-15  2632  	kfree(sb);
f59fce847fc848 Kent Overstreet   2013-05-15  2633  	kfree(path);
f59fce847fc848 Kent Overstreet   2013-05-15  2634  	module_put(THIS_MODULE);
9e23ccf8f0a22e Coly Li           2020-05-27  2635  async_done:
50246693f81fe8 Christoph Hellwig 2020-01-24  2636  	return size;
f59fce847fc848 Kent Overstreet   2013-05-15  2637  
abcc0cbd49283f Jan Kara          2023-06-22  2638  out_free_holder:
abcc0cbd49283f Jan Kara          2023-06-22  2639  	kfree(holder);
                                                              ^^^^^^
freed

50246693f81fe8 Christoph Hellwig 2020-01-24  2640  out_put_sb_page:
cfa0c56db9c087 Christoph Hellwig 2020-01-24  2641  	put_page(virt_to_page(sb_disk));
50246693f81fe8 Christoph Hellwig 2020-01-24  2642  out_blkdev_put:
2c5555983bd27d Jan Kara          2023-06-22  2643  	if (bdev)
2c5555983bd27d Jan Kara          2023-06-22 @2644  		blkdev_put(bdev, holder);
                                                                                 ^^^^^^
Use after free

50246693f81fe8 Christoph Hellwig 2020-01-24  2645  out_free_sb:
50246693f81fe8 Christoph Hellwig 2020-01-24  2646  	kfree(sb);
50246693f81fe8 Christoph Hellwig 2020-01-24  2647  out_free_path:
50246693f81fe8 Christoph Hellwig 2020-01-24  2648  	kfree(path);
ae3cd299919af6 Coly Li           2020-01-24  2649  	path = NULL;
50246693f81fe8 Christoph Hellwig 2020-01-24  2650  out_module_put:
50246693f81fe8 Christoph Hellwig 2020-01-24  2651  	module_put(THIS_MODULE);
50246693f81fe8 Christoph Hellwig 2020-01-24  2652  out:
2c5555983bd27d Jan Kara          2023-06-22  2653  	if (!quiet)
46f5aa8806e34f Joe Perches       2020-05-27  2654  		pr_info("error %s: %s\n", path?path:"", err);
50246693f81fe8 Christoph Hellwig 2020-01-24  2655  	return ret;
cafe563591446c Kent Overstreet   2013-03-23  2656  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

