Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04E91D5CDD
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Jan 2025 07:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736147384; cv=none; b=WrpQcH9c0nlmwQLt/scW4haKgNbS6goA2ic/4RKDZSvH0uaZaPpeRtvPuscd2TBQ0RZq8r6hbQiwVL8wXvtonzwwTwmPSWLrtWRy+M3aGeeshzOlFWviISZI4GI1/RQ9jHd+j0LRAp4Tm96AftXqAg5kD2VEbUlEKxPx5gKqzN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736147384; c=relaxed/simple;
	bh=ztlXVC7yO7hJz6FC0eG6OR5kDNx4yBqxg+5Cteup9nU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oUnCGUfeN/ayAk3Xdv3j/nz3Ju9o1/nJgtZw6dPKtNmlgLzHfx4bCT/J1i5SmWsWBlD8yyjOV3A0BfkgdVFi9KCW4uzyiacoMSox3Afki1gihsAWciTRe3q1JlEvLSuonh+5+5lMnNiU7JQslsMIXrh1REBDScA1UjDiNxPE9HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x43xfMR6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x43xfMR6"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4363dc916ceso87157725e9.0
        for <oe-kbuild@lists.linux.dev>; Sun, 05 Jan 2025 23:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736147380; x=1736752180; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2WnamjGhXvBMgL8bchnikXP7xxUqq1nXsMC1Inb9MrU=;
        b=x43xfMR6tbwS40OmzLJq8v/nvQPpeD8CePqPQfeXhwhUoiA6jnpekTc/aS0QnCkaGY
         2C5PGPvU/i2rEvmvEzaGGrzyCrH12iog4rqgJyiQmf9Z3Ey5ICYLmX9iQWnwPwH6/6YA
         2w66w4JN/vqqKM3NJbC4zDMyePNJXWfHyLhcg1ShbinZTpIs4pui/VpSpOCM0dyT5DXS
         pSXkfHpGtWSSwgC4ZfKC2YApu05HX/NW7Q4Gkifcx2qJiLEm+npHRsw6VFxdDKClkL4w
         HZd7n6N9gfa0G9k7cbSlP+iPIC94mTrxTs6HNkwwvVvKqO4RYuXJ3ikIZ1XAFg4/N/qG
         rRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736147380; x=1736752180;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2WnamjGhXvBMgL8bchnikXP7xxUqq1nXsMC1Inb9MrU=;
        b=o6Z3Po9Gavod8pvZ/kq5rQ/Y+j+YVSl0+RfR/Yeh0AeXztYx9u0d+5C4IwKazXaqYw
         SmLpMQc7rScB9cvVui2scsHJDA4KH6EmOamGSr8UNTC+w3HytAKV1uJ+m9k1UM6F0ane
         SRe4KtQmIAsCVOcPnnq3Sof2vsMY6P00WDSMMgbHXEOYgrG3R54UF7PPM0m7snbx6i7m
         8ZAhU3QqiQNAm7ZY37NgxQsbqQqxCf6Ck4LUd/pG8SEkWixfy5oabQ6XBULj6Of9wqdf
         Ka8GI9jH9NomRdg1bn+m4B6AMOpZTyaXiPvn0fgaFrEsO0d0fYIPwR1NCHuNn6MeocMy
         SnnQ==
X-Gm-Message-State: AOJu0YzALae0M0Uqj1BH9Xnxagiw3EkdvRnVHIl/JnFyZBbD6LQCqZ0z
	yXrV1yKJqeiKU/pA4pytzJTi4hrAh5JOC1E6WVMk6KOdivgboN9atai6ZgF9Iz5WBBafXxxJ/du
	e
X-Gm-Gg: ASbGncv1Lwyi7cbOVj0l4pnrtD7vp9gx2mmu8Ls3bRjCjNfRi9R9ux5LAf5V1Htxyh4
	DTEF0ixt+pGW7tUbl0hcVwkpcXjrmiq8jDvjtqOpLawNNEhjGUfERiuLi33iOcBeF3FN76C/0Ss
	lVRDw8QZeAtcoYsgRfuLyNGWrtrJ40gYi/Y9Jh7tdD0uzwf1Jf4IPcaah1Hk6lB31jaiMEXj14u
	8wWSF1BbdWnaY7INez/woTwWG8Nt5PyBRsCoZjUihN8hID79IG/UyWuTwPp9w==
X-Google-Smtp-Source: AGHT+IEGyL0miqJbyxWnjUMeL4aDYo1IwQVWlwe6GF4LurZRepayXVomG0o84ovgMFTmNmQj/TLf6g==
X-Received: by 2002:a05:6000:2a5:b0:386:3d27:b4f0 with SMTP id ffacd0b85a97d-38a1a221da1mr49526089f8f.14.1736147379663;
        Sun, 05 Jan 2025 23:09:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8472casm47923323f8f.45.2025.01.05.23.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 23:09:39 -0800 (PST)
Date: Mon, 6 Jan 2025 10:09:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1381
 agilent_82357a_attach() warn: inconsistent returns 'global
 &agilent_82357a_hotplug_lock'.
Message-ID: <affedc44-c822-47a5-8db4-7bfad72dc408@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8faabc041a001140564f718dabe37753e88b37fa
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
config: i386-randconfig-141-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210143.WJhYzXfD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412210143.WJhYzXfD-lkp@intel.com/

smatch warnings:
drivers/staging/gpib/agilent_82357a/agilent_82357a.c:1381 agilent_82357a_attach() warn: inconsistent returns 'global &agilent_82357a_hotplug_lock'.

vim +1381 drivers/staging/gpib/agilent_82357a/agilent_82357a.c

4c41fe886a56c5b Dave Penkler 2024-09-18  1306  static int agilent_82357a_attach(gpib_board_t *board, const gpib_board_config_t *config)
4c41fe886a56c5b Dave Penkler 2024-09-18  1307  {
4c41fe886a56c5b Dave Penkler 2024-09-18  1308  	int retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1309  	int i;
4c41fe886a56c5b Dave Penkler 2024-09-18  1310  	unsigned int product_id;
4c41fe886a56c5b Dave Penkler 2024-09-18  1311  	struct agilent_82357a_priv *a_priv;
4c41fe886a56c5b Dave Penkler 2024-09-18  1312  	struct usb_device *usb_dev;
4c41fe886a56c5b Dave Penkler 2024-09-18  1313  
4c41fe886a56c5b Dave Penkler 2024-09-18  1314  	if (mutex_lock_interruptible(&agilent_82357a_hotplug_lock))
4c41fe886a56c5b Dave Penkler 2024-09-18  1315  		return -ERESTARTSYS;
4c41fe886a56c5b Dave Penkler 2024-09-18  1316  
4c41fe886a56c5b Dave Penkler 2024-09-18  1317  	retval = agilent_82357a_allocate_private(board);
4c41fe886a56c5b Dave Penkler 2024-09-18  1318  	if (retval < 0) {
4c41fe886a56c5b Dave Penkler 2024-09-18  1319  		mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18  1320  		return retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1321  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1322  	a_priv = board->private_data;
4c41fe886a56c5b Dave Penkler 2024-09-18  1323  	for (i = 0; i < MAX_NUM_82357A_INTERFACES; ++i) {
4c41fe886a56c5b Dave Penkler 2024-09-18  1324  		if (agilent_82357a_driver_interfaces[i] &&
4c41fe886a56c5b Dave Penkler 2024-09-18  1325  		    !usb_get_intfdata(agilent_82357a_driver_interfaces[i]) &&
4c41fe886a56c5b Dave Penkler 2024-09-18  1326  		    agilent_82357a_device_match(agilent_82357a_driver_interfaces[i], config)) {
4c41fe886a56c5b Dave Penkler 2024-09-18  1327  			a_priv->bus_interface = agilent_82357a_driver_interfaces[i];
4c41fe886a56c5b Dave Penkler 2024-09-18  1328  			usb_set_intfdata(agilent_82357a_driver_interfaces[i], board);
4c41fe886a56c5b Dave Penkler 2024-09-18  1329  			usb_dev = interface_to_usbdev(a_priv->bus_interface);
4c41fe886a56c5b Dave Penkler 2024-09-18  1330  			dev_info(&usb_dev->dev,
4c41fe886a56c5b Dave Penkler 2024-09-18  1331  				 "bus %d dev num %d attached to gpib minor %d, agilent usb interface %i\n",
4c41fe886a56c5b Dave Penkler 2024-09-18  1332  				 usb_dev->bus->busnum, usb_dev->devnum, board->minor, i);
4c41fe886a56c5b Dave Penkler 2024-09-18  1333  			break;
4c41fe886a56c5b Dave Penkler 2024-09-18  1334  		}
4c41fe886a56c5b Dave Penkler 2024-09-18  1335  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1336  	if (i == MAX_NUM_82357A_INTERFACES) {
4c41fe886a56c5b Dave Penkler 2024-09-18  1337  		mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18  1338  		pr_err("No Agilent 82357 gpib adapters found, have you loaded its firmware?\n");
4c41fe886a56c5b Dave Penkler 2024-09-18  1339  		return -ENODEV;
4c41fe886a56c5b Dave Penkler 2024-09-18  1340  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1341  	product_id = le16_to_cpu(interface_to_usbdev(a_priv->bus_interface)->descriptor.idProduct);
4c41fe886a56c5b Dave Penkler 2024-09-18  1342  	switch (product_id) {
4c41fe886a56c5b Dave Penkler 2024-09-18  1343  	case USB_DEVICE_ID_AGILENT_82357A:
4c41fe886a56c5b Dave Penkler 2024-09-18  1344  		a_priv->bulk_out_endpoint = AGILENT_82357A_BULK_OUT_ENDPOINT;
4c41fe886a56c5b Dave Penkler 2024-09-18  1345  		a_priv->interrupt_in_endpoint = AGILENT_82357A_INTERRUPT_IN_ENDPOINT;
4c41fe886a56c5b Dave Penkler 2024-09-18  1346  		break;
4c41fe886a56c5b Dave Penkler 2024-09-18  1347  	case USB_DEVICE_ID_AGILENT_82357B:
4c41fe886a56c5b Dave Penkler 2024-09-18  1348  		a_priv->bulk_out_endpoint = AGILENT_82357B_BULK_OUT_ENDPOINT;
4c41fe886a56c5b Dave Penkler 2024-09-18  1349  		a_priv->interrupt_in_endpoint = AGILENT_82357B_INTERRUPT_IN_ENDPOINT;
4c41fe886a56c5b Dave Penkler 2024-09-18  1350  		break;
4c41fe886a56c5b Dave Penkler 2024-09-18  1351  	default:
4c41fe886a56c5b Dave Penkler 2024-09-18  1352  		pr_err("bug, unhandled product_id in switch?\n");

mutex_unlock(&agilent_82357a_hotplug_lock); before returning.

4c41fe886a56c5b Dave Penkler 2024-09-18  1353  		return -EIO;
4c41fe886a56c5b Dave Penkler 2024-09-18  1354  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1355  #ifdef RESET_USB_CONFIG
4c41fe886a56c5b Dave Penkler 2024-09-18  1356  	retval = agilent_82357a_reset_usb_configuration(board);
4c41fe886a56c5b Dave Penkler 2024-09-18  1357  	if (retval < 0)	{
4c41fe886a56c5b Dave Penkler 2024-09-18  1358  		mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18  1359  		return retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1360  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1361  #endif
4c41fe886a56c5b Dave Penkler 2024-09-18  1362  	retval = agilent_82357a_setup_urbs(board);
4c41fe886a56c5b Dave Penkler 2024-09-18  1363  	if (retval < 0)	{
4c41fe886a56c5b Dave Penkler 2024-09-18  1364  		mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18  1365  		return retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1366  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1367  
4c41fe886a56c5b Dave Penkler 2024-09-18  1368  	timer_setup(&a_priv->bulk_timer, agilent_82357a_timeout_handler, 0);
4c41fe886a56c5b Dave Penkler 2024-09-18  1369  
4c41fe886a56c5b Dave Penkler 2024-09-18  1370  	board->t1_nano_sec = 800;
4c41fe886a56c5b Dave Penkler 2024-09-18  1371  
4c41fe886a56c5b Dave Penkler 2024-09-18  1372  	retval = agilent_82357a_init(board);
4c41fe886a56c5b Dave Penkler 2024-09-18  1373  
4c41fe886a56c5b Dave Penkler 2024-09-18  1374  	if (retval < 0)	{
4c41fe886a56c5b Dave Penkler 2024-09-18  1375  		mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18  1376  		return retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1377  	}
4c41fe886a56c5b Dave Penkler 2024-09-18  1378  
4c41fe886a56c5b Dave Penkler 2024-09-18  1379  	pr_info("%s: attached\n", __func__);
4c41fe886a56c5b Dave Penkler 2024-09-18  1380  	mutex_unlock(&agilent_82357a_hotplug_lock);
4c41fe886a56c5b Dave Penkler 2024-09-18 @1381  	return retval;
4c41fe886a56c5b Dave Penkler 2024-09-18  1382  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

