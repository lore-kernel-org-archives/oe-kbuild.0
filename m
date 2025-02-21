Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF6C1FC11A
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Feb 2025 05:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740114848; cv=none; b=okUd8L5TU3lG9CAmvurIMfgKxXFcMs1xx9ona/HcbDgrHFS/lyHV+HU3PGqmvR426hmvmvpYaEzyiILpArHMgygAHxCPVeUZLIk5tRC6c43sOMO/8OqmCcYSHpMBw0dqYvg9MxWmbqzdv9/alJKlZoS8Jrm53CAh99Ec8AIpleg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740114848; c=relaxed/simple;
	bh=VKN1uz8nWnyQiYwlc3+waS3jwPmVFtL1n8l+YC1pF+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W0OpR16FsEpUWtNYh9AJIrjb06Y9m+CQv8VfozQlGM/sCyqdheKtVclecLEgF7OXP8Ly6CKFca5Cceekh/rOkuHP8MORfh93rE15XwdvwmDy+JApxIB9S0/LaTba5br35MLAs55E0mqb3H6uxwEmOlMALWc0Y3WKDKZYCt5xbXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TumrdeTA; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TumrdeTA"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ded6c31344so2391930a12.1
        for <oe-kbuild@lists.linux.dev>; Thu, 20 Feb 2025 21:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740114844; x=1740719644; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IpD49+eIN0W0a3HXfcSH2ChP5R5FHZDt3v8nHNJEKjI=;
        b=TumrdeTAO2slD08bBsHUENYhwpl91V/kS0fLjMHJ35pRulopll4eNiG7zKkiEk2J67
         gcHKFd5owvnhWNevF/FulGViZ9/zyehf9gmvxtwbP/m2d0HpXLO2QVv3HSYaZyFhmHMS
         KV8EKOcXAVq45OZYChZxZPJq69uC7Fo8ciwsrhTcwRsMlTBCr3qBXV8y1DU21tkcj7bq
         V3KzX724mZvnhIGYrXueKQjRUWlUIXyPCm399JBSck5GAUMONg530VQ6PiVBHP05r6LB
         AW1dzwER/omelldglOz1EDsxux9AxnyW+53leEwSUCs246Xeblpgu323d2kl02CeDncd
         2qGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740114844; x=1740719644;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IpD49+eIN0W0a3HXfcSH2ChP5R5FHZDt3v8nHNJEKjI=;
        b=qMFZkMDHNLjIwhI4A0TkCrWCwbloj7K64Q6zfT32UMIU70ZZTZzmbiGQTgbBDl5jyc
         uebblVA5FVWxb7D3s1aYIiXtuEwBOKclyS2bQi7paPtdrRa1yPc9RaTSSvVCl83dFu6q
         8HKYjIJkoQ+zm4Uk5W0oxeOMduux2OAU5MDdB+1xZpogbDP9yzvvlVdBvyml3gxO3Axb
         5tARAvBgmdtbVVDWGvRPuGAKX7hqsPkXw4rAOiK7aYNimzp8PRU0o2rAscLHsKQHkp+l
         sso1vKtncviHhkA0y0sluHwXkW0wmdlTv9vKLxNE2V7Enhc1BuNDtpHhDtLSrAjFFE/p
         5J4w==
X-Gm-Message-State: AOJu0YwnyHd+qyij4Cnh68QshGLdK2Gub2qx+6hwQwB3sbAce5gsGNF5
	FZURuQIYnTCbjuf/tkebp30O905q8YLlDqbXZaHQnyCX8NkhkMQaMTVMKMEaroongM8+8FF1xxn
	m
X-Gm-Gg: ASbGncvOBJRWoAWPJRgDnFUDkfjeMGP6L0JucTqRmFnH84QwQbIGTstkFDs2a7Yxdu3
	emMCgv+7ehEbWWMyUNkNrjiZ7VCOhaX3CuJ9pIzbUD0Ij2T6HPeiuqjVELWnzpc/6x2ZyGzgD3W
	pKF0ONfQlAPG3DirOH8AiqRh6iH6YMEXizh6F/6p3aGmU2NURfxFESkohJUsY2LUZ0uzW0MX3Ai
	jSNsvfphDr/UIleP+SmA50rZxjkm0g4TeShQS6z4HGgjFNhS/m/WqAvY0Ee+0Zj/6Bze28waKtY
	AaX8+THWYf71CHpORctKq5IKi143FxA=
X-Google-Smtp-Source: AGHT+IGPLlYChIWPwIlYXT80GvkLG1CW8OrtNhLIbDm7+AAbpoACRJ2OP+BG7pmsU5bvjztGPE8kAQ==
X-Received: by 2002:a05:6402:3815:b0:5de:b438:1fdb with SMTP id 4fb4d7f45d1cf-5e0b7266b9amr3199002a12.30.1740114844234;
        Thu, 20 Feb 2025 21:14:04 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-aba5323226asm1579463066b.8.2025.02.20.21.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 21:14:03 -0800 (PST)
Date: Fri, 21 Feb 2025 08:13:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, linux-usb@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [usb:usb-linus 3/7] drivers/usb/gadget/composite.c:1054 set_config()
 error: we previously assumed 'c' could be null (see line 983)
Message-ID: <681fa3c4-71b9-4fec-b350-13612ef50c96@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
head:   c783e1258f29c5caac9eea0aea6b172870f1baf8
commit: 40e89ff5750fca2c1d6da93f98a2038716bba86c [3/7] usb: gadget: Set self-powered based on MaxPower and bmAttributes
config: x86_64-randconfig-161-20250220 (https://download.01.org/0day-ci/archive/20250221/202502210827.TTfQAoPT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502210827.TTfQAoPT-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/composite.c:1054 set_config() error: we previously assumed 'c' could be null (see line 983)
drivers/usb/gadget/composite.c:2619 composite_suspend() error: we previously assumed 'cdev->config' could be null (see line 2608)

vim +/c +1054 drivers/usb/gadget/composite.c

40982be52d8f64 David Brownell    2008-06-19   947  static int set_config(struct usb_composite_dev *cdev,
40982be52d8f64 David Brownell    2008-06-19   948  		const struct usb_ctrlrequest *ctrl, unsigned number)
40982be52d8f64 David Brownell    2008-06-19   949  {
40982be52d8f64 David Brownell    2008-06-19   950  	struct usb_gadget	*gadget = cdev->gadget;
d6f4663664cbd5 Jakob Koschel     2022-03-08   951  	struct usb_configuration *c = NULL, *iter;
40982be52d8f64 David Brownell    2008-06-19   952  	int			result = -EINVAL;
40982be52d8f64 David Brownell    2008-06-19   953  	unsigned		power = gadget_is_otg(gadget) ? 8 : 100;
40982be52d8f64 David Brownell    2008-06-19   954  	int			tmp;
40982be52d8f64 David Brownell    2008-06-19   955  
40982be52d8f64 David Brownell    2008-06-19   956  	if (number) {
d6f4663664cbd5 Jakob Koschel     2022-03-08   957  		list_for_each_entry(iter, &cdev->configs, list) {
d6f4663664cbd5 Jakob Koschel     2022-03-08   958  			if (iter->bConfigurationValue != number)
d6f4663664cbd5 Jakob Koschel     2022-03-08   959  				continue;
bdb64d727216b4 Tatyana Brokhman  2011-06-29   960  			/*
bdb64d727216b4 Tatyana Brokhman  2011-06-29   961  			 * We disable the FDs of the previous
bdb64d727216b4 Tatyana Brokhman  2011-06-29   962  			 * configuration only if the new configuration
bdb64d727216b4 Tatyana Brokhman  2011-06-29   963  			 * is a valid one
bdb64d727216b4 Tatyana Brokhman  2011-06-29   964  			 */
bdb64d727216b4 Tatyana Brokhman  2011-06-29   965  			if (cdev->config)
bdb64d727216b4 Tatyana Brokhman  2011-06-29   966  				reset_config(cdev);
d6f4663664cbd5 Jakob Koschel     2022-03-08   967  			c = iter;
40982be52d8f64 David Brownell    2008-06-19   968  			result = 0;
40982be52d8f64 David Brownell    2008-06-19   969  			break;
40982be52d8f64 David Brownell    2008-06-19   970  		}
40982be52d8f64 David Brownell    2008-06-19   971  		if (result < 0)
40982be52d8f64 David Brownell    2008-06-19   972  			goto done;
bdb64d727216b4 Tatyana Brokhman  2011-06-29   973  	} else { /* Zero configuration value - need to reset the config */
bdb64d727216b4 Tatyana Brokhman  2011-06-29   974  		if (cdev->config)
bdb64d727216b4 Tatyana Brokhman  2011-06-29   975  			reset_config(cdev);
40982be52d8f64 David Brownell    2008-06-19   976  		result = 0;
bdb64d727216b4 Tatyana Brokhman  2011-06-29   977  	}
40982be52d8f64 David Brownell    2008-06-19   978  
1cbfb8c4f62d66 Joel Stanley      2019-09-30   979  	DBG(cdev, "%s config #%d: %s\n",
e538dfdae85244 Michal Nazarewicz 2011-08-30   980  	    usb_speed_string(gadget->speed),
e538dfdae85244 Michal Nazarewicz 2011-08-30   981  	    number, c ? c->label : "unconfigured");
                                                                    ^
NULL check

40982be52d8f64 David Brownell    2008-06-19   982  
40982be52d8f64 David Brownell    2008-06-19  @983  	if (!c)
40982be52d8f64 David Brownell    2008-06-19   984  		goto done;

c is NULL, power is either 8 or 100.

40982be52d8f64 David Brownell    2008-06-19   985  
6027f3173e797b Peter Chen        2014-04-29   986  	usb_gadget_set_state(gadget, USB_STATE_CONFIGURED);
40982be52d8f64 David Brownell    2008-06-19   987  	cdev->config = c;
40982be52d8f64 David Brownell    2008-06-19   988  
40982be52d8f64 David Brownell    2008-06-19   989  	/* Initialize all interfaces by setting them to altsetting zero. */
40982be52d8f64 David Brownell    2008-06-19   990  	for (tmp = 0; tmp < MAX_CONFIG_INTERFACES; tmp++) {
40982be52d8f64 David Brownell    2008-06-19   991  		struct usb_function	*f = c->interface[tmp];
5242658d1b9777 Laurent Pinchart  2009-10-21   992  		struct usb_descriptor_header **descriptors;
40982be52d8f64 David Brownell    2008-06-19   993  
40982be52d8f64 David Brownell    2008-06-19   994  		if (!f)
40982be52d8f64 David Brownell    2008-06-19   995  			break;
40982be52d8f64 David Brownell    2008-06-19   996  
5242658d1b9777 Laurent Pinchart  2009-10-21   997  		/*
5242658d1b9777 Laurent Pinchart  2009-10-21   998  		 * Record which endpoints are used by the function. This is used
5242658d1b9777 Laurent Pinchart  2009-10-21   999  		 * to dispatch control requests targeted at that endpoint to the
5242658d1b9777 Laurent Pinchart  2009-10-21  1000  		 * function's setup callback instead of the current
5242658d1b9777 Laurent Pinchart  2009-10-21  1001  		 * configuration's setup callback.
5242658d1b9777 Laurent Pinchart  2009-10-21  1002  		 */
f3bdbe36682631 John Youn         2016-02-05  1003  		descriptors = function_descriptors(f, gadget->speed);
5242658d1b9777 Laurent Pinchart  2009-10-21  1004  
5242658d1b9777 Laurent Pinchart  2009-10-21  1005  		for (; *descriptors; ++descriptors) {
5242658d1b9777 Laurent Pinchart  2009-10-21  1006  			struct usb_endpoint_descriptor *ep;
5242658d1b9777 Laurent Pinchart  2009-10-21  1007  			int addr;
5242658d1b9777 Laurent Pinchart  2009-10-21  1008  
5242658d1b9777 Laurent Pinchart  2009-10-21  1009  			if ((*descriptors)->bDescriptorType != USB_DT_ENDPOINT)
5242658d1b9777 Laurent Pinchart  2009-10-21  1010  				continue;
5242658d1b9777 Laurent Pinchart  2009-10-21  1011  
5242658d1b9777 Laurent Pinchart  2009-10-21  1012  			ep = (struct usb_endpoint_descriptor *)*descriptors;
5242658d1b9777 Laurent Pinchart  2009-10-21  1013  			addr = ((ep->bEndpointAddress & 0x80) >> 3)
5242658d1b9777 Laurent Pinchart  2009-10-21  1014  			     |  (ep->bEndpointAddress & 0x0f);
5242658d1b9777 Laurent Pinchart  2009-10-21  1015  			set_bit(addr, f->endpoints);
5242658d1b9777 Laurent Pinchart  2009-10-21  1016  		}
5242658d1b9777 Laurent Pinchart  2009-10-21  1017  
40982be52d8f64 David Brownell    2008-06-19  1018  		result = f->set_alt(f, tmp, 0);
40982be52d8f64 David Brownell    2008-06-19  1019  		if (result < 0) {
40982be52d8f64 David Brownell    2008-06-19  1020  			DBG(cdev, "interface %d (%s/%p) alt 0 --> %d\n",
40982be52d8f64 David Brownell    2008-06-19  1021  					tmp, f->name, f, result);
40982be52d8f64 David Brownell    2008-06-19  1022  
40982be52d8f64 David Brownell    2008-06-19  1023  			reset_config(cdev);
40982be52d8f64 David Brownell    2008-06-19  1024  			goto done;
40982be52d8f64 David Brownell    2008-06-19  1025  		}
1b9ba000177ee4 Roger Quadros     2011-05-09  1026  
1b9ba000177ee4 Roger Quadros     2011-05-09  1027  		if (result == USB_GADGET_DELAYED_STATUS) {
1b9ba000177ee4 Roger Quadros     2011-05-09  1028  			DBG(cdev,
1b9ba000177ee4 Roger Quadros     2011-05-09  1029  			 "%s: interface %d (%s) requested delayed status\n",
1b9ba000177ee4 Roger Quadros     2011-05-09  1030  					__func__, tmp, f->name);
1b9ba000177ee4 Roger Quadros     2011-05-09  1031  			cdev->delayed_status++;
1b9ba000177ee4 Roger Quadros     2011-05-09  1032  			DBG(cdev, "delayed_status count %d\n",
1b9ba000177ee4 Roger Quadros     2011-05-09  1033  					cdev->delayed_status);
1b9ba000177ee4 Roger Quadros     2011-05-09  1034  		}
40982be52d8f64 David Brownell    2008-06-19  1035  	}
40982be52d8f64 David Brownell    2008-06-19  1036  
40982be52d8f64 David Brownell    2008-06-19  1037  	/* when we return, be sure our power usage is valid */
bcacbf06c89137 Jack Pham         2021-07-20  1038  	if (c->MaxPower || (c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
bcacbf06c89137 Jack Pham         2021-07-20  1039  		power = c->MaxPower;
bcacbf06c89137 Jack Pham         2021-07-20  1040  	else
bcacbf06c89137 Jack Pham         2021-07-20  1041  		power = CONFIG_USB_GADGET_VBUS_DRAW;
bcacbf06c89137 Jack Pham         2021-07-20  1042  
a2035411fa1d12 Jack Pham         2020-01-30  1043  	if (gadget->speed < USB_SPEED_SUPER)
a2035411fa1d12 Jack Pham         2020-01-30  1044  		power = min(power, 500U);
a2035411fa1d12 Jack Pham         2020-01-30  1045  	else
a2035411fa1d12 Jack Pham         2020-01-30  1046  		power = min(power, 900U);
b93c2a68f3d9dc Elson Roy Serrao  2023-03-24  1047  
b93c2a68f3d9dc Elson Roy Serrao  2023-03-24  1048  	if (USB_CONFIG_ATT_WAKEUP & c->bmAttributes)
b93c2a68f3d9dc Elson Roy Serrao  2023-03-24  1049  		usb_gadget_set_remote_wakeup(gadget, 1);
b93c2a68f3d9dc Elson Roy Serrao  2023-03-24  1050  	else
b93c2a68f3d9dc Elson Roy Serrao  2023-03-24  1051  		usb_gadget_set_remote_wakeup(gadget, 0);
40982be52d8f64 David Brownell    2008-06-19  1052  done:
40e89ff5750fca Prashanth K       2025-02-17  1053  	if (power > USB_SELF_POWER_VBUS_MAX_DRAW ||

power is <= 100 so that means

40e89ff5750fca Prashanth K       2025-02-17 @1054  	    !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
                                                              ^^^^^^^^^^^^^^^
we dereference c without checking

5e5caf4fa8d303 Thinh Nguyen      2020-02-03  1055  		usb_gadget_clear_selfpowered(gadget);
40e89ff5750fca Prashanth K       2025-02-17  1056  	else
40e89ff5750fca Prashanth K       2025-02-17  1057  		usb_gadget_set_selfpowered(gadget);
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  1058  
40982be52d8f64 David Brownell    2008-06-19  1059  	usb_gadget_vbus_draw(gadget, power);
1b9ba000177ee4 Roger Quadros     2011-05-09  1060  	if (result >= 0 && cdev->delayed_status)
1b9ba000177ee4 Roger Quadros     2011-05-09  1061  		result = USB_GADGET_DELAYED_STATUS;
40982be52d8f64 David Brownell    2008-06-19  1062  	return result;
40982be52d8f64 David Brownell    2008-06-19  1063  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

