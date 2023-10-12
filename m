Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5C2D50F
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Oct 2023 06:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RsL9C9Uw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40537481094so6898155e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 11 Oct 2023 23:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697092153; x=1697696953; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pr+eL5yHStnHwJHsdkqClpmictU1rs94uU9Rh1aZFds=;
        b=RsL9C9UwTGMlWNMkF6UGwnMW2Sh3cafqzqm/yDoy7UxXfF2SQrMjIdQWg7MCAsjh1q
         s1YjwamNjeC5r3puuve/n7sGKc4ZfDmExMbg4AULDxbivsbMYD0TI9V7vb9BNt+tpSIj
         EIC1I+/LkxKjE0+MKMek4t3MYbB5r7gHuURdXhQain038e7LFlKF1ilZTyid3Q69OVqm
         3eCt1Rm9irQuYjnA4JocvUeJYi9xVz/oODGtaPGekLyxk4/8SymrTnCzF6RFi95FEQBW
         tP9d8NHrgghu/vedNKo68+rVDAJQOe4nA7kCxURA+BVK3XORWgj5N+fSaDSZbtpdF6Od
         ScEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697092153; x=1697696953;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pr+eL5yHStnHwJHsdkqClpmictU1rs94uU9Rh1aZFds=;
        b=EcoX5JcugNlO6wxScLu8Y5mGskS6sOYoHwq86AwY64ieTHhQ9ykn8gZwRNjkEg+5cu
         EiOqPDSRoIIW3pAiatqbvSSbgTcO9Up0Kn/2D3yAB3MOK0UrY6irwNG3swRTDTl1FSVa
         Cy71lctuHajmcz4ws/9k11E3nB+RQ/GJXnUYVYWCJqApx+NzfrJwfAqef8cyF364QcJZ
         YQEp7RPIDK2OMPVSSiBs2phKx/st2fbXd2TjtgsyECYXzzKnWJyocgrHRe6tf97uW1bk
         NWpiauCdHLiX4aN3SdkhMaJr/hPgfGip8lrVE5grB6hP9WkKehwE4E09yzWnzpujlhcw
         l8Sg==
X-Gm-Message-State: AOJu0YxafiKMFWaTeh/LKMrMnkRxlAEw4qU05Bo3qbWJhczWoTh3xazF
	ODCRceUTpgYE2DIfCQo9A3e50iig2+9Y6v7Z4Zs=
X-Google-Smtp-Source: AGHT+IEW3vtovgjBzMgKP1/9reNbTWS2SlqGixW0S9v7WtiRXGAOnBKoEXw7qKVxt7dVpb8woDmfyQ==
X-Received: by 2002:a05:600c:ac1:b0:401:b652:b6cf with SMTP id c1-20020a05600c0ac100b00401b652b6cfmr19704163wmr.13.1697092153503;
        Wed, 11 Oct 2023 23:29:13 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id q5-20020a7bce85000000b0040596352951sm21036846wmj.5.2023.10.11.23.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:29:13 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:29:10 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	John Horan <knasher@gmail.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	Javier Carrasco <javier.carrasco.cruz@gmail.com>,
	syzbot+348331f63b034f89b622@syzkaller.appspotmail.com
Subject: Re: [PATCH] Input: bcm5974 - check endpoint type before starting
 traffic
Message-ID: <2a3ee43d-c0ad-4576-bb53-0e26b812a3b5@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231007-topic-bcm5974_bulk-v1-1-355be9f8ad80@gmail.com>

Hi Javier,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Javier-Carrasco/Input-bcm5974-check-endpoint-type-before-starting-traffic/20231009-031809
base:   b9ddbb0cde2adcedda26045cc58f31316a492215
patch link:    https://lore.kernel.org/r/20231007-topic-bcm5974_bulk-v1-1-355be9f8ad80%40gmail.com
patch subject: [PATCH] Input: bcm5974 - check endpoint type before starting traffic
config: x86_64-randconfig-161-20231011 (https://download.01.org/0day-ci/archive/20231012/202310121107.hYslwzCT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310121107.hYslwzCT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202310121107.hYslwzCT-lkp@intel.com/

smatch warnings:
drivers/input/mouse/bcm5974.c:978 bcm5974_probe() warn: missing error code 'error'

vim +/error +978 drivers/input/mouse/bcm5974.c

f89bd95c5c9467 Henrik Rydberg     2008-08-08   914  static int bcm5974_probe(struct usb_interface *iface,
f89bd95c5c9467 Henrik Rydberg     2008-08-08   915  			 const struct usb_device_id *id)
f89bd95c5c9467 Henrik Rydberg     2008-08-08   916  {
f89bd95c5c9467 Henrik Rydberg     2008-08-08   917  	struct usb_device *udev = interface_to_usbdev(iface);
f89bd95c5c9467 Henrik Rydberg     2008-08-08   918  	const struct bcm5974_config *cfg;
f89bd95c5c9467 Henrik Rydberg     2008-08-08   919  	struct bcm5974 *dev;
f89bd95c5c9467 Henrik Rydberg     2008-08-08   920  	struct input_dev *input_dev;
49b3150e7755c3 Javier Carrasco    2023-10-08   921  	int error;
f89bd95c5c9467 Henrik Rydberg     2008-08-08   922  
f89bd95c5c9467 Henrik Rydberg     2008-08-08   923  	/* find the product index */
f89bd95c5c9467 Henrik Rydberg     2008-08-08   924  	cfg = bcm5974_get_config(udev);
f89bd95c5c9467 Henrik Rydberg     2008-08-08   925  
49b3150e7755c3 Javier Carrasco    2023-10-08   926  	if (cfg->tp_type == TYPE1) {
49b3150e7755c3 Javier Carrasco    2023-10-08   927  		error = bcm5974_int_in_endpoint(iface->cur_altsetting, cfg->bt_ep);
49b3150e7755c3 Javier Carrasco    2023-10-08   928  		if (error) {
49b3150e7755c3 Javier Carrasco    2023-10-08   929  			dev_err(&iface->dev, "No int-in endpoint for the button\n");
49b3150e7755c3 Javier Carrasco    2023-10-08   930  			return error;
49b3150e7755c3 Javier Carrasco    2023-10-08   931  		}
49b3150e7755c3 Javier Carrasco    2023-10-08   932  	}
49b3150e7755c3 Javier Carrasco    2023-10-08   933  
49b3150e7755c3 Javier Carrasco    2023-10-08   934  	error = bcm5974_int_in_endpoint(iface->cur_altsetting, cfg->tp_ep);
49b3150e7755c3 Javier Carrasco    2023-10-08   935  	if (error) {
49b3150e7755c3 Javier Carrasco    2023-10-08   936  		dev_err(&iface->dev, "No int-in endpoint for the trackpad\n");
49b3150e7755c3 Javier Carrasco    2023-10-08   937  		return error;
49b3150e7755c3 Javier Carrasco    2023-10-08   938  	}
49b3150e7755c3 Javier Carrasco    2023-10-08   939  
f89bd95c5c9467 Henrik Rydberg     2008-08-08   940  	/* allocate memory for our device state and initialize it */
f89bd95c5c9467 Henrik Rydberg     2008-08-08   941  	dev = kzalloc(sizeof(struct bcm5974), GFP_KERNEL);
f89bd95c5c9467 Henrik Rydberg     2008-08-08   942  	input_dev = input_allocate_device();
f89bd95c5c9467 Henrik Rydberg     2008-08-08   943  	if (!dev || !input_dev) {
6c1d1b246199c7 Greg Kroah-Hartman 2012-04-25   944  		dev_err(&iface->dev, "out of memory\n");
49b3150e7755c3 Javier Carrasco    2023-10-08   945  		error = -ENOMEM;
f89bd95c5c9467 Henrik Rydberg     2008-08-08   946  		goto err_free_devs;
f89bd95c5c9467 Henrik Rydberg     2008-08-08   947  	}
f89bd95c5c9467 Henrik Rydberg     2008-08-08   948  
f89bd95c5c9467 Henrik Rydberg     2008-08-08   949  	dev->udev = udev;
88da765f4d5f59 Dmitry Torokhov    2008-08-08   950  	dev->intf = iface;
f89bd95c5c9467 Henrik Rydberg     2008-08-08   951  	dev->input = input_dev;
f89bd95c5c9467 Henrik Rydberg     2008-08-08   952  	dev->cfg = *cfg;
f89bd95c5c9467 Henrik Rydberg     2008-08-08   953  	mutex_init(&dev->pm_mutex);
f89bd95c5c9467 Henrik Rydberg     2008-08-08   954  
f89bd95c5c9467 Henrik Rydberg     2008-08-08   955  	/* setup urbs */
43f482b48d0322 Henrik Rydberg     2012-08-13   956  	if (cfg->tp_type == TYPE1) {
f89bd95c5c9467 Henrik Rydberg     2008-08-08   957  		dev->bt_urb = usb_alloc_urb(0, GFP_KERNEL);
f89bd95c5c9467 Henrik Rydberg     2008-08-08   958  		if (!dev->bt_urb)
f89bd95c5c9467 Henrik Rydberg     2008-08-08   959  			goto err_free_devs;
43f482b48d0322 Henrik Rydberg     2012-08-13   960  	}
f89bd95c5c9467 Henrik Rydberg     2008-08-08   961  
f89bd95c5c9467 Henrik Rydberg     2008-08-08   962  	dev->tp_urb = usb_alloc_urb(0, GFP_KERNEL);
f89bd95c5c9467 Henrik Rydberg     2008-08-08   963  	if (!dev->tp_urb)
f89bd95c5c9467 Henrik Rydberg     2008-08-08   964  		goto err_free_bt_urb;
f89bd95c5c9467 Henrik Rydberg     2008-08-08   965  
43f482b48d0322 Henrik Rydberg     2012-08-13   966  	if (dev->bt_urb) {
997ea58eb92f99 Daniel Mack        2010-04-12   967  		dev->bt_data = usb_alloc_coherent(dev->udev,
f89bd95c5c9467 Henrik Rydberg     2008-08-08   968  					  dev->cfg.bt_datalen, GFP_KERNEL,
f89bd95c5c9467 Henrik Rydberg     2008-08-08   969  					  &dev->bt_urb->transfer_dma);
f89bd95c5c9467 Henrik Rydberg     2008-08-08   970  		if (!dev->bt_data)
f89bd95c5c9467 Henrik Rydberg     2008-08-08   971  			goto err_free_urb;
43f482b48d0322 Henrik Rydberg     2012-08-13   972  	}
f89bd95c5c9467 Henrik Rydberg     2008-08-08   973  
997ea58eb92f99 Daniel Mack        2010-04-12   974  	dev->tp_data = usb_alloc_coherent(dev->udev,
f89bd95c5c9467 Henrik Rydberg     2008-08-08   975  					  dev->cfg.tp_datalen, GFP_KERNEL,
f89bd95c5c9467 Henrik Rydberg     2008-08-08   976  					  &dev->tp_urb->transfer_dma);
f89bd95c5c9467 Henrik Rydberg     2008-08-08   977  	if (!dev->tp_data)
f89bd95c5c9467 Henrik Rydberg     2008-08-08  @978  		goto err_free_bt_buffer;

error = -ENOMEM;

f89bd95c5c9467 Henrik Rydberg     2008-08-08   979  
c42e65664390be Mathias Nyman      2022-06-07   980  	if (dev->bt_urb) {
f89bd95c5c9467 Henrik Rydberg     2008-08-08   981  		usb_fill_int_urb(dev->bt_urb, udev,
f89bd95c5c9467 Henrik Rydberg     2008-08-08   982  				 usb_rcvintpipe(udev, cfg->bt_ep),
f89bd95c5c9467 Henrik Rydberg     2008-08-08   983  				 dev->bt_data, dev->cfg.bt_datalen,
f89bd95c5c9467 Henrik Rydberg     2008-08-08   984  				 bcm5974_irq_button, dev, 1);
f89bd95c5c9467 Henrik Rydberg     2008-08-08   985  
c42e65664390be Mathias Nyman      2022-06-07   986  		dev->bt_urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
c42e65664390be Mathias Nyman      2022-06-07   987  	}
c42e65664390be Mathias Nyman      2022-06-07   988  
f89bd95c5c9467 Henrik Rydberg     2008-08-08   989  	usb_fill_int_urb(dev->tp_urb, udev,
f89bd95c5c9467 Henrik Rydberg     2008-08-08   990  			 usb_rcvintpipe(udev, cfg->tp_ep),
f89bd95c5c9467 Henrik Rydberg     2008-08-08   991  			 dev->tp_data, dev->cfg.tp_datalen,
f89bd95c5c9467 Henrik Rydberg     2008-08-08   992  			 bcm5974_irq_trackpad, dev, 1);
f89bd95c5c9467 Henrik Rydberg     2008-08-08   993  
c42e65664390be Mathias Nyman      2022-06-07   994  	dev->tp_urb->transfer_flags |= URB_NO_TRANSFER_DMA_MAP;
c42e65664390be Mathias Nyman      2022-06-07   995  
f89bd95c5c9467 Henrik Rydberg     2008-08-08   996  	/* create bcm5974 device */
f89bd95c5c9467 Henrik Rydberg     2008-08-08   997  	usb_make_path(udev, dev->phys, sizeof(dev->phys));
f89bd95c5c9467 Henrik Rydberg     2008-08-08   998  	strlcat(dev->phys, "/input0", sizeof(dev->phys));
f89bd95c5c9467 Henrik Rydberg     2008-08-08   999  
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1000  	input_dev->name = "bcm5974";
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1001  	input_dev->phys = dev->phys;
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1002  	usb_to_input_id(dev->udev, &input_dev->id);
158e928741e58e Henrik Rydberg     2009-04-28  1003  	/* report driver capabilities via the version field */
158e928741e58e Henrik Rydberg     2009-04-28  1004  	input_dev->id.version = cfg->caps;
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1005  	input_dev->dev.parent = &iface->dev;
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1006  
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1007  	input_set_drvdata(input_dev, dev);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1008  
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1009  	input_dev->open = bcm5974_open;
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1010  	input_dev->close = bcm5974_close;
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1011  
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1012  	setup_events_to_report(input_dev, cfg);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1013  
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1014  	error = input_register_device(dev->input);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1015  	if (error)
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1016  		goto err_free_buffer;
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1017  
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1018  	/* save our data pointer in this interface device */
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1019  	usb_set_intfdata(iface, dev);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1020  
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1021  	return 0;
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1022  
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1023  err_free_buffer:
997ea58eb92f99 Daniel Mack        2010-04-12  1024  	usb_free_coherent(dev->udev, dev->cfg.tp_datalen,
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1025  		dev->tp_data, dev->tp_urb->transfer_dma);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1026  err_free_bt_buffer:
43f482b48d0322 Henrik Rydberg     2012-08-13  1027  	if (dev->bt_urb)
997ea58eb92f99 Daniel Mack        2010-04-12  1028  		usb_free_coherent(dev->udev, dev->cfg.bt_datalen,
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1029  				  dev->bt_data, dev->bt_urb->transfer_dma);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1030  err_free_urb:
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1031  	usb_free_urb(dev->tp_urb);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1032  err_free_bt_urb:
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1033  	usb_free_urb(dev->bt_urb);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1034  err_free_devs:
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1035  	usb_set_intfdata(iface, NULL);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1036  	input_free_device(input_dev);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1037  	kfree(dev);
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1038  	return error;
f89bd95c5c9467 Henrik Rydberg     2008-08-08  1039  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

