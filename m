Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63041BC4E
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 19:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737659845; cv=none; b=YcdgFVoeW5wj4ZAGcKsdr8exY+MIwwuD8JnkrzyMJY1iH/9wziKiu9Is58X4MKO/3lXwj9Bl7f4Vo1f3REZIqGE/41rlGZtgSTFa9YF4xegdE47TrqRwqyYeOAJjSn72+2sgESXOCvvsk7etcNbb5MJ7/y9g70KYbmLKuusgrsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737659845; c=relaxed/simple;
	bh=jK8RZa8jArH0kynl02V5KdzQ7TQLhvCukTbJf11HQzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cshuCrGYPOjWF3zS71Ugml5KiHMorm+NrzhLsWsqK/9KpEuCR/pWIqkM+XgdFqzJKGVO5HmUEUf2kjBwAgPU7vaATZhaEhk0ajgrVIbvX4x1MBCxflZS+otUUKt8+ulxWzD4PoiroxvMQ1JH89i4XckrvEXUkDUiGHGns3eosgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kKOfthBm; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kKOfthBm"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361c705434so9593075e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 11:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737659840; x=1738264640; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LLiVT8iaQ+1dvpTW/jf9oGY4M9BQJCVnxgPnVUaMXJE=;
        b=kKOfthBm/Fa30uXlfGonDaqX4uPwZeyChN/kv18KpD/FyXmBd+/FEcJQLVNJTOBn5d
         wMjnUACdBZvfxVbad9Sj3fYR8hFpLyYFQKYs1O5VXJINQeXHY9Lj/q61nl1RdOD8ch/h
         ZtlVLjtaHA+bBDzE4cgx8r/eSP+kWPS6CinkzWODMXojGGqsuTUcOd+XhyGwwi7rYRrO
         SjZZV7oDWtrTQ8rorDL4YGonrgTYR0zVAiA0OipV8yTYBD/UsnFWtVPLuiGQrD3K2xum
         2pVfo7t/CFwDhwznDVweQAXqr3tnlW8gzMpZyKWHnrP+5CAnMZ7UUBkgxqc00rTxnNs7
         Ug2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737659840; x=1738264640;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LLiVT8iaQ+1dvpTW/jf9oGY4M9BQJCVnxgPnVUaMXJE=;
        b=orf3cFfmeW41+aBXhoU0G1KkVpUFqLVDIwm/bX3y3ohOFLNiUNa2BScKU2ARf5fIVG
         FhaDCTJp6Aq/WTsqYcHTBlAVoijTKx+npJHHGo8R4JBJqrISNbW805EkE3HLURO3AbjE
         BjzMa0JJsRMBwYuKvwn+im6xsnZdyTi8rL/A0PP/YQkfuU5Qua+KVFtaRS/QsCQNwO/R
         1y/mCRRyvOERqrRThPC82pXL8VYhigBnxz02UlkbzaS9VDtCoPoFHGGQnMLfRwxqT2Kl
         YBmWIDdbYoAlKQyrcQ1avkEBcc8+najjdcXRtX/hyPiS8mTbldZ6Pav6MRmqtz8avDp7
         9fYg==
X-Gm-Message-State: AOJu0YxOK3z2NERkUC+d3twjLt88qL+4ONCwa0Y4KUT2hADvWUdLUXPc
	qEfVied/oSO9qNYvT+hWQb1m5YaOuf1ygGY6moyvahnBJB6kX5fbaU3kaJZFKLPwQR7xA4ZMqo3
	i
X-Gm-Gg: ASbGncujbo8uTJKoXi5ZwEBmqF2QFuEjy2bYjrITdYQcYnc2pg2NciJnjjQ2j7Ysl1o
	j3TkEYZw4m6ZyZ65VPuPY0NmbE/yZLHC7LTQy/lC2Bi1k73ES+mezQocbu8ZH2pZBLlxVaskc3L
	bSjJUHjeYeTNS9gyeoRSgzA2PRZ0/evUcbCqHehwJtdz/vlqvhP//R4RutBmIRZFx9a7CaxFrzp
	DwSSkf11iPWPTYlbaWw3PKFksqExN5vX0fRR5vYk2rgoIEJEpUsS+AZF7y/6engL4cdY46T4vH0
	BhD4EElRPA==
X-Google-Smtp-Source: AGHT+IGnGsTI42dEXp/xjtJLzEoqANU1bdRnXr7hdGvzjvF+eDhqCKVxwH22Th9NOUqCABy30+KOWQ==
X-Received: by 2002:a05:600c:3d05:b0:434:f767:68ea with SMTP id 5b1f17b1804b1-438b0dc9532mr114958825e9.5.1737659840347;
        Thu, 23 Jan 2025 11:17:20 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b1718741sm38899835e9.0.2025.01.23.11.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 11:17:19 -0800 (PST)
Date: Thu, 23 Jan 2025 22:17:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jarkko Sakkinen <jarkko@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 6/6]
 drivers/media/v4l2-core/v4l2-loopback.c:2531 v4l2_loopback_add() warn:
 variable dereferenced before check 'conf' (see line 2507)
Message-ID: <48339a95-b34c-4cea-aa8f-26ca28068627@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   ccb1b6e1247887be17bf22b3809c50848e87a4db
commit: ccb1b6e1247887be17bf22b3809c50848e87a4db [6/6] V4L2LOOPBACK_CTL_ADD: Reburnish the API
config: sparc64-randconfig-r071-20250123 (https://download.01.org/0day-ci/archive/20250124/202501240159.4f3XILcu-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202501240159.4f3XILcu-lkp@intel.com/

New smatch warnings:
drivers/media/v4l2-core/v4l2-loopback.c:2531 v4l2_loopback_add() warn: variable dereferenced before check 'conf' (see line 2507)

vim +/conf +2531 drivers/media/v4l2-core/v4l2-loopback.c

3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2505  static int v4l2_loopback_add(struct v4l2_loopback_config *conf, int *ret_nr)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2506  {
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19 @2507  	bool all_capabilities = !!(conf->flags & V4L2_LOOPBACK_ALL_CAPABILITIES);
                                                                                   ^^^^^^^^^^^
Unchecked dereference

3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2508  	struct v4l2_loopback_device *dev;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2509  	struct v4l2_ctrl_handler *hdl;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2510  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2511  	int err = -ENOMEM;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2512  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2513  	u32 _width = V4L2LOOPBACK_SIZE_DEFAULT_WIDTH;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2514  	u32 _height = V4L2LOOPBACK_SIZE_DEFAULT_HEIGHT;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2515  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2516  	u32 _min_width = DEFAULT_FROM_CONF(min_width,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2517  					   < V4L2LOOPBACK_SIZE_MIN_WIDTH,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2518  					   V4L2LOOPBACK_SIZE_MIN_WIDTH);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2519  	u32 _min_height = DEFAULT_FROM_CONF(min_height,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2520  					    < V4L2LOOPBACK_SIZE_MIN_HEIGHT,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2521  					    V4L2LOOPBACK_SIZE_MIN_HEIGHT);
7486df5b3a80346 Jarkko Sakkinen 2024-12-29  2522  	u32 _max_width = DEFAULT_FROM_CONF(max_width, < _min_width,
7486df5b3a80346 Jarkko Sakkinen 2024-12-29  2523  					   V4L2LOOPBACK_SIZE_DEFAULT_MAX_WIDTH);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2524  	u32 _max_height =
7486df5b3a80346 Jarkko Sakkinen 2024-12-29  2525  		DEFAULT_FROM_CONF(max_height, < _min_height, V4L2LOOPBACK_SIZE_DEFAULT_MAX_HEIGHT);
7486df5b3a80346 Jarkko Sakkinen 2024-12-29  2526  	int _max_buffers = DEFAULT_FROM_CONF(max_buffers, <= 0, V4L2LOOPBACK_DEFAULT_MAX_BUFFERS);
7486df5b3a80346 Jarkko Sakkinen 2024-12-29  2527  	int _max_openers = DEFAULT_FROM_CONF(max_openers, <= 0, V4L2LOOPBACK_DEFAULT_MAX_OPENERS);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2528  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2529  	int nr = -1;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2530  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22 @2531  	if (conf) {
                                                            ^^^^
The old code assumed conf could be NULL

ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2532  		if (conf->video_nr >= 0)
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2533  			nr = conf->video_nr;
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2534  		else if (conf->video_nr == -1)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2535  			nr = -1;
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2536  		else
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2537  			return -EINVAL;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2538  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2539  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2540  	if (idr_find(&v4l2loopback_index_idr, nr))
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2541  		return -EEXIST;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2542  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2543  	dprintk("creating v4l2loopback-device #%d\n", nr);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2544  	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2545  	if (!dev)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2546  		return -ENOMEM;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2547  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2548  	/* allocate id, if @id >= 0, we're requesting that specific id */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2549  	if (nr >= 0) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2550  		err = idr_alloc(&v4l2loopback_index_idr, dev, nr, nr + 1,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2551  				GFP_KERNEL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2552  		if (err == -ENOSPC)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2553  			err = -EEXIST;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2554  	} else {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2555  		err = idr_alloc(&v4l2loopback_index_idr, dev, 0, 0, GFP_KERNEL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2556  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2557  	if (err < 0)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2558  		goto out_free_dev;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2559  	nr = err;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2560  	err = -ENOMEM;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2561  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2562  	if (conf && conf->card_label[0]) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2563  		snprintf(dev->card_label, sizeof(dev->card_label), "%s",
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2564  			 conf->card_label);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2565  	} else {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2566  		snprintf(dev->card_label, sizeof(dev->card_label),
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2567  			 "Dummy video device (0x%04X)", nr);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2568  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2569  	snprintf(dev->v4l2_dev.name, sizeof(dev->v4l2_dev.name),
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2570  		 "v4l2loopback-%03d", nr);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2571  
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2572  	dev->video_nr = nr;
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2573  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2574  	err = v4l2_device_register(NULL, &dev->v4l2_dev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2575  	if (err)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2576  		goto out_free_idr;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2577  	MARK();
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2578  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2579  	dev->vdev = video_device_alloc();
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2580  	if (dev->vdev == NULL) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2581  		err = -ENOMEM;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2582  		goto out_unregister;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2583  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2584  
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2585  	video_set_drvdata(dev->vdev, dev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2586  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2587  	MARK();
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2588  	snprintf(dev->vdev->name, sizeof(dev->vdev->name), "%s",
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2589  		 dev->card_label);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2590  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2591  	init_vdev(dev->vdev, nr);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2592  	dev->vdev->v4l2_dev = &dev->v4l2_dev;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2593  	init_capture_param(&dev->capture_param);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2594  	err = set_timeperframe(dev, &dev->capture_param.timeperframe);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2595  	if (err)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2596  		goto out_unregister;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2597  	dev->keep_format = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2598  	dev->sustain_framerate = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2599  
ccb1b6e1247887b Jarkko Sakkinen 2025-01-19  2600  	dev->all_capabilities = all_capabilities;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2601  	dev->min_width = _min_width;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2602  	dev->min_height = _min_height;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2603  	dev->max_width = _max_width;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2604  	dev->max_height = _max_height;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2605  	dev->max_openers = _max_openers;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2606  	dev->buffers_number = dev->used_buffers = _max_buffers;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2607  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2608  	dev->write_position = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2609  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2610  	MARK();
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2611  	spin_lock_init(&dev->lock);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2612  	spin_lock_init(&dev->list_lock);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2613  	INIT_LIST_HEAD(&dev->outbufs_list);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2614  	if (list_empty(&dev->outbufs_list)) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2615  		int i;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2616  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2617  		for (i = 0; i < dev->used_buffers; ++i)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2618  			list_add_tail(&dev->buffers[i].list_head,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2619  				      &dev->outbufs_list);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2620  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2621  	memset(dev->bufpos2index, 0, sizeof(dev->bufpos2index));
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2622  	atomic_set(&dev->open_count, 0);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2623  	dev->ready_for_capture = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2624  	dev->ready_for_output = 1;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2625  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2626  	dev->buffer_size = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2627  	dev->image = NULL;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2628  	dev->imagesize = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2629  	timer_setup(&dev->sustain_timer, sustain_timer_clb, 0);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2630  	timer_setup(&dev->timeout_timer, timeout_timer_clb, 0);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2631  	dev->reread_count = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2632  	dev->timeout_jiffies = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2633  	dev->timeout_image = NULL;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2634  	dev->timeout_happened = 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2635  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2636  	hdl = &dev->ctrl_handler;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2637  	err = v4l2_ctrl_handler_init(hdl, 4);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2638  	if (err)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2639  		goto out_unregister;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2640  	v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_keepformat, NULL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2641  	v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_sustainframerate, NULL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2642  	v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_timeout, NULL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2643  	v4l2_ctrl_new_custom(hdl, &v4l2loopback_ctrl_timeoutimageio, NULL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2644  	if (hdl->error) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2645  		err = hdl->error;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2646  		goto out_free_handler;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2647  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2648  	dev->v4l2_dev.ctrl_handler = hdl;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2649  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2650  	err = v4l2_ctrl_handler_setup(hdl);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2651  	if (err)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2652  		goto out_free_handler;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2653  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2654  	/* FIXME set buffers to 0 */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2655  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2656  	/* Set initial format */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2657  	if (_width < _min_width)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2658  		_width = _min_width;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2659  	if (_width > _max_width)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2660  		_width = _max_width;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2661  	if (_height < _min_height)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2662  		_height = _min_height;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2663  	if (_height > _max_height)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2664  		_height = _max_height;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2665  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2666  	dev->pix_format.width = _width;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2667  	dev->pix_format.height = _height;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2668  	dev->pix_format.pixelformat = formats[0].fourcc;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2669  	dev->pix_format.colorspace =
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2670  		V4L2_COLORSPACE_DEFAULT; /* do we need to set this ? */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2671  	dev->pix_format.field = V4L2_FIELD_NONE;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2672  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2673  	dev->buffer_size = PAGE_ALIGN(dev->pix_format.sizeimage);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2674  	dprintk("buffer_size = %ld (=%d)\n", dev->buffer_size,
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2675  		dev->pix_format.sizeimage);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2676  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2677  	if (dev->buffer_size && ((err = allocate_buffers(dev)) < 0))
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2678  		goto out_free_handler;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2679  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2680  	init_waitqueue_head(&dev->read_event);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2681  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2682  	/* register the device -> it creates /dev/video* */
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2683  	if (video_register_device(dev->vdev, VFL_TYPE_VIDEO, nr) < 0) {
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2684  		printk(KERN_ERR
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2685  		       "v4l2loopback: failed video_register_device()\n");
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2686  		err = -EFAULT;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2687  		goto out_free_device;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2688  	}
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2689  	v4l2loopback_create_sysfs(dev->vdev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2690  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2691  	MARK();
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2692  	if (ret_nr)
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2693  		*ret_nr = dev->vdev->num;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2694  	return 0;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2695  
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2696  out_free_device:
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2697  	video_device_release(dev->vdev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2698  out_free_handler:
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2699  	v4l2_ctrl_handler_free(&dev->ctrl_handler);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2700  out_unregister:
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2701  	video_set_drvdata(dev->vdev, NULL);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2702  	v4l2_device_unregister(&dev->v4l2_dev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2703  out_free_idr:
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2704  	idr_remove(&v4l2loopback_index_idr, nr);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2705  out_free_dev:
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2706  	kfree(dev);
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2707  	return err;
3c275abeb8f6be2 Jarkko Sakkinen 2024-11-22  2708  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

