Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC89381B1C
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 09:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779529581; cv=none; b=aMRmqMDaamKz1HntBBwG3uv0zU6Cc1MXtgRMngaMs64PUG1bszY/Q2UtEHLkuYRpBZjtM2G1Fr0eEjTvPAsNbltUHdTgEBV4d+gNDaxA+yvzDX8OaE/3zEAFe19p8Y8RscVwLTKbjzXbs1XOf5YtuMwkEEwBDK75TFJnCej1P7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779529581; c=relaxed/simple;
	bh=wwO+70oARxIBD3Yf9BPj64EA/MBjoLa0f0IbNevSicI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y4Jh+WLIrldZYUEyQ/vu9wBh0oXiBG+DksiFuzGNkzve2c60uaqeU2mVvV7R3Pzbd98JtLORsZaxuKkIXRxTKkd7nZgw1sb5Kfew5ZPokVnOq+7szQbu6QuCZOgI1iCab8Fdz8x44Qu4Q5OZ6A89QnCeuseMNY7I7gLna9XAC0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNHZ1TIC; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNHZ1TIC"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4903f7a90d1so17196645e9.2
        for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 02:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779529579; x=1780134379; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8R1bGg60AcZuhmnnnlY+wP6P4uJUzYg3NH37rDP+L0Y=;
        b=tNHZ1TICO21ZTB2THLG1iZl/HagEDuMuZXXrIqpFhid3Kga1zYQOAfPAEjvOE5IZpw
         cXQ5QU2z3xr5FnQF84KFXSadGfB4pbXfJOYJE4g2C1th2ncQF45xVh6A5H47U9DSOB7K
         vBkQh3rvr1pZTdywIEhtBVkIcQhctRgHoF1stzuQPsMwP+YpTs+uzFSV0MjsIdCGICbp
         hNhQe7TNblSrSCYFVkr1tZu5bgii/SbdvHhO/uT9Toorrxaao9s+e/lAnhQsctNpZE7Y
         lVdYfRUIEc5Ew+wXEpb/iL2lrrLa6QkC5nqGwEexDvAy87K6nlpj/I9hE4mRVUxJnuGu
         XvXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779529579; x=1780134379;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8R1bGg60AcZuhmnnnlY+wP6P4uJUzYg3NH37rDP+L0Y=;
        b=gZ9Y56gjffLHj2RP1o3JWokPUiaDZewtd7vmNAhpNtsG6Q7l0PasVUej++rFFbRrgx
         j4XdMwkVU/213T+WUpe1PrXX2J5vaj/r0r9bTsb7v7O62N1BmXkGCTA68quxAkfxLzsA
         yTpGCZuuWXXd3f1ldEglGDCrTpoK7FLA2nEVuPmhXQKlHS3TjqH7lkuDyp4LVVh1hTq0
         jdWpO1QVm3nOQITU34INqR470RINCp1uSruhlkHbPKiWNxaYcJ2xPwp63zYFizbB9Otb
         gvevY/XOmkPI2nYLEbnULv36GzvK4Lk62/CogatcvTqosKFukfQ+CI319e49twrl+FBC
         Yezg==
X-Gm-Message-State: AOJu0YwI4f5tx/jU3h4jFE7WA1crmf4XfLb0RE2YS6sSElRM1NBGAJxf
	vLdLXbmBt4VzH9f6hCSMmKdaGTbpQs0LBPL32tK7vGbNYBB6bTumjariALLVOA==
X-Gm-Gg: Acq92OFooQC+hruqRX8j5gDKJaRfv3MTD8MxCH3sHM1e6QpIBmCmZM2cvw/oCDyj+qL
	ztW7YP1eguAsiyc7nKgTVP0aacVfPkHh6UY/0e+LWN3pCXqMWPiXhatFIj76Gl71NpwFNgmcoeq
	wV33HwG5y/ewCLxOqz/N5iBVtyew8ASVS4KOynDuVUHhnCiOrlCw/RnZvjkbyOCzoCS267a3f+h
	0PwWXdTsmlhoyuUEGWHgJJctC9DPNiHmB1a1Vg8yNHgflKlLqYsDv+RGVjSg8r8mNoSIS7YEhEE
	0VOn0aHEfavCFBS1f6SWavhVYolgQ5XAwX2VQfIYXGgjDJwb/WQCgwIDXR8dnEsUVibE2B48dNe
	xWg000TgLNiZqqzErOyQK4Xs3yWLh6i6yCPBG2RIu72U8yFegch8bz1IJIYXHQFdkTnRMtELAPo
	OBuQGE4coiiX62c39DWIa6ToQ=
X-Received: by 2002:a05:600c:a402:b0:490:3d62:eb0 with SMTP id 5b1f17b1804b1-490426d7019mr89859065e9.24.1779529578540;
        Sat, 23 May 2026 02:46:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49042af026esm34348665e9.30.2026.05.23.02.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 02:46:17 -0700 (PDT)
Date: Sat, 23 May 2026 12:46:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Saravana Kannan <saravanak@google.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	devel@driverdev.osuosl.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Herve Codina <herve.codina@bootlin.com>
Subject: [driver-core:driver-core-testing 12/18] drivers/base/core.c:286
 fw_devlink_refresh_fwnode() error: we previously assumed 'dev' could be null
 (see line 270)
Message-ID: <202605230211.567ddMEp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260523094614.hO4SIPey4V3Bc6v5TEXz4Il_v2An_kE40ss7Z_fcCd8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git driver-core-testing
head:   024480bf8d75bd16894c5b0eb6082b6e6dae4970
commit: 81e7c6befa36cecdcbf7244393bd67e8f8c59bf5 [12/18] of: dynamic: Fix overlayed devices not probing because of fw_devlink
config: arm-randconfig-r071-20260523 (https://download.01.org/0day-ci/archive/20260523/202605230211.567ddMEp-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605230211.567ddMEp-lkp@intel.com/

New smatch warnings:
drivers/base/core.c:286 fw_devlink_refresh_fwnode() error: we previously assumed 'dev' could be null (see line 270)

vim +/dev +286 drivers/base/core.c

81e7c6befa36ce Saravana Kannan 2026-05-11  256  void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
81e7c6befa36ce Saravana Kannan 2026-05-11  257  {
81e7c6befa36ce Saravana Kannan 2026-05-11  258  	struct device *dev;
81e7c6befa36ce Saravana Kannan 2026-05-11  259  
81e7c6befa36ce Saravana Kannan 2026-05-11  260  	/*
81e7c6befa36ce Saravana Kannan 2026-05-11  261  	 * Find the closest ancestor fwnode that has been converted to a device
81e7c6befa36ce Saravana Kannan 2026-05-11  262  	 * that can bind to a driver (bus device).
81e7c6befa36ce Saravana Kannan 2026-05-11  263  	 */
81e7c6befa36ce Saravana Kannan 2026-05-11  264  	fwnode_handle_get(fwnode);
81e7c6befa36ce Saravana Kannan 2026-05-11  265  	do {
81e7c6befa36ce Saravana Kannan 2026-05-11  266  		if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
81e7c6befa36ce Saravana Kannan 2026-05-11  267  			continue;
81e7c6befa36ce Saravana Kannan 2026-05-11  268  
81e7c6befa36ce Saravana Kannan 2026-05-11  269  		dev = get_dev_from_fwnode(fwnode);
81e7c6befa36ce Saravana Kannan 2026-05-11 @270  		if (!dev)
81e7c6befa36ce Saravana Kannan 2026-05-11  271  			continue;

Smatch doesn't like how this code tests for NULL and but then later
we dereference "dev" without testing.

get_dev_from_fwnode() can only return NULL if "fwnode" is NULL which
it can't be.  We can just remove this test.

81e7c6befa36ce Saravana Kannan 2026-05-11  272  
81e7c6befa36ce Saravana Kannan 2026-05-11  273  		if (dev->bus)
81e7c6befa36ce Saravana Kannan 2026-05-11  274  			break;
81e7c6befa36ce Saravana Kannan 2026-05-11  275  
81e7c6befa36ce Saravana Kannan 2026-05-11  276  		put_device(dev);
81e7c6befa36ce Saravana Kannan 2026-05-11  277  	} while ((fwnode = fwnode_get_next_parent(fwnode)));
81e7c6befa36ce Saravana Kannan 2026-05-11  278  
81e7c6befa36ce Saravana Kannan 2026-05-11  279  	/*
81e7c6befa36ce Saravana Kannan 2026-05-11  280  	 * If none of the ancestor fwnodes have (yet) been converted to a device
81e7c6befa36ce Saravana Kannan 2026-05-11  281  	 * that can bind to a driver, there's nothing to fix up.
81e7c6befa36ce Saravana Kannan 2026-05-11  282  	 */
81e7c6befa36ce Saravana Kannan 2026-05-11  283  	if (!fwnode)
81e7c6befa36ce Saravana Kannan 2026-05-11  284  		return;
81e7c6befa36ce Saravana Kannan 2026-05-11  285  
81e7c6befa36ce Saravana Kannan 2026-05-11 @286  	WARN(device_is_bound(dev) && dev->links.status != DL_DEV_DRIVER_BOUND,
                                                                                     ^^^^^^^^^^^^^^^^^

81e7c6befa36ce Saravana Kannan 2026-05-11  287  	     "Don't multithread overlaying and probing the same device!\n");
81e7c6befa36ce Saravana Kannan 2026-05-11  288  
81e7c6befa36ce Saravana Kannan 2026-05-11  289  	/*
81e7c6befa36ce Saravana Kannan 2026-05-11  290  	 * If the device has already bound to a driver, then we need to redo

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

