Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03041D61AA
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 05:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745990618; cv=none; b=TXf8xBdH8/WYphwTBSEpjsknTxArXEZ39rOdem8tCb/c0DD7R+J78M11IK3wuQ80jvK8f8/VNyc2tyg6czM3q3C8vDjbFiYSI9lIeHWYDopcBBFXNArNHVZfWvkeC5Pg/Bn/XnKVqNLwF0W5ez3LG6nPi2Uat+4MCJPdFegZvdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745990618; c=relaxed/simple;
	bh=lc99vKtC1kH8/GPxS0jIXmvpv1SXkA5lb9/8qNKPrGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FGvQxVhkr5UiO28JmEHdiTjROE1BQ2xk+DaoBT97USUlE+IN5qBoWJvI1DwPAXH+sOq+GBDbj0IJWc9k+UimTzAxC+v6vH0Loz//ZrSRV8zVJPBFkgk1Kx1tO/jZYFO+3RDUmjPd2vkmGoosC3RFzUhW7obDN3PieolWAmyySac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UtwCnO/X; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UtwCnO/X"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso7597235f8f.0
        for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 22:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745990614; x=1746595414; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1f5VMcwggTnd1zvTIZlQH75D+VOSxnAn/sp0SKAfqAY=;
        b=UtwCnO/XCBkqnr27vACCKqif/BVKtyeCW25bhgd9XhFNeLPk50v24rlgsF0grbANzY
         KoyFtEOReqsQHJyAX+iJvNwJSa3H4gvjWEzKGCrZcNdc9U035qz6Ix8o4+3amlyPLkgH
         8HFR219Pi02HDKUsEpKC4GataI49CRI70rq6lOHR7T2SU2KJIMfLdgcZb1XRZVajvXNo
         bSKbGYlfk68jcLnECrXRYxOC3dFov3vmmalwXTPcb1j9h7+SVz0svG77j7OQoNOQk5G1
         SOWwLTwuCa1gfQT8Dfh/9fxMODhWH2h+cl4nNI/dSYvjBx1G48srDlIUuWfl0gg7gydj
         8S6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745990614; x=1746595414;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1f5VMcwggTnd1zvTIZlQH75D+VOSxnAn/sp0SKAfqAY=;
        b=c4gZtHRcuwuU1ufT/32Ftp3RBwi4IWrfFdOGxtWhGD6bT1yEtAE40MQyAKFsQdGxF6
         sxFnvcAo/zYWG7VbAkfjeGbKy761wH8P91AHu0eCn/tK+ur/B3fRRxWjx+fzV2qOllrk
         PAgYOEQINHzSCh2uZq85qOMjsgQkgsMRyd1nmoVSBq/43CoRziaY3vt/5myCo//K31AQ
         Y9gWm3L4AGuqQL1oQs+bvVZfbr50lmqCt7RSxlrpssJGttBPybyOQ2QF6MwuSGxcy+xA
         MKJQ2VyO8otw33AAVMNMMC/hQEhlp4qf7zdWqicbliW+Rrgzk5XPsCD/an286/6vI7yz
         TpBg==
X-Gm-Message-State: AOJu0YzHIDvXSjbkteXO71V4EXPCDM5VKjyxnQ6nM0Hd4/xR879Xsbm/
	luAHcYSGxJmXWOExbdA+4CkIDeIGh7PhkXgwzx5+/PNuKaUjsJFLtU7UvoLTVjyKRMbVM9fRSem
	t
X-Gm-Gg: ASbGncs81Wz2CfGrDdbShS7ooKv0UtLjXZlsst+DDY8Z03ypbQR72lpcYXMhG9DQOsr
	Kq7wROZlX4+Jr10WPr1OqOxBoO5L82wb6dUFa5+hXfixM1I9le//2Mp9utld8ZQVCBNVN0tssde
	C3g8DaTpxNP1XQQF+zLhHbnOAKyRfOsZxvNXVp0BMM9R0hvHu0QXfdN/tckrEA4172nAU8QIQXz
	KM5EC//3AydQGNcp4k6WuQkwjESb5u8BBLFx3N0I1FQrEHle0RPO1MBWOE3bKqhHAG2YK0HbNiv
	1wpGGvBullZ/MWqC79huvihMdXxnHQWmGx7lp1/im61tnw==
X-Google-Smtp-Source: AGHT+IEjM/eKOvjQmQ+sUpr0mVhLXh8f2I+nNcn1s5eK2oUoV2uTyPbD5DYGeCPpnMsg8PPARsWo+g==
X-Received: by 2002:a05:6000:2401:b0:39c:cc7:3db6 with SMTP id ffacd0b85a97d-3a08f764e47mr1264255f8f.19.1745990614336;
        Tue, 29 Apr 2025 22:23:34 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a073e46454sm15957248f8f.78.2025.04.29.22.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 22:23:33 -0700 (PDT)
Date: Wed, 30 Apr 2025 08:23:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 1/1]
 drivers/usb/gadget/composite.c:919 set_config() warn: iterator used outside
 loop: 'c'
Message-ID: <202504300435.D2g8DmRD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20250430052330.Kmj5-_R_qks8PbjDKenDcW29XJdQaYIRN7Kxt2T56KY@z>

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   1aec9e76fe4a65b0a26fa1b30bdb3400d9728b2d
commit: 7367e87b6e9eb4de86a6ce799a8fe0178a4384de [1/1] usb: gadget: Set self-powered based on MaxPower and bmAttributes
config: i386-randconfig-141-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300435.D2g8DmRD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202504300435.D2g8DmRD-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/composite.c:919 set_config() warn: iterator used outside loop: 'c'

vim +/c +919 drivers/usb/gadget/composite.c

40982be52d8f64c David Brownell    2008-06-19  818  static int set_config(struct usb_composite_dev *cdev,
40982be52d8f64c David Brownell    2008-06-19  819  		const struct usb_ctrlrequest *ctrl, unsigned number)
40982be52d8f64c David Brownell    2008-06-19  820  {
40982be52d8f64c David Brownell    2008-06-19  821  	struct usb_gadget	*gadget = cdev->gadget;
40982be52d8f64c David Brownell    2008-06-19  822  	struct usb_configuration *c = NULL;
40982be52d8f64c David Brownell    2008-06-19  823  	int			result = -EINVAL;
40982be52d8f64c David Brownell    2008-06-19  824  	unsigned		power = gadget_is_otg(gadget) ? 8 : 100;
40982be52d8f64c David Brownell    2008-06-19  825  	int			tmp;
40982be52d8f64c David Brownell    2008-06-19  826  
40982be52d8f64c David Brownell    2008-06-19  827  	if (number) {
40982be52d8f64c David Brownell    2008-06-19  828  		list_for_each_entry(c, &cdev->configs, list) {
40982be52d8f64c David Brownell    2008-06-19  829  			if (c->bConfigurationValue == number) {
bdb64d727216b49 Tatyana Brokhman  2011-06-29  830  				/*
bdb64d727216b49 Tatyana Brokhman  2011-06-29  831  				 * We disable the FDs of the previous
bdb64d727216b49 Tatyana Brokhman  2011-06-29  832  				 * configuration only if the new configuration
bdb64d727216b49 Tatyana Brokhman  2011-06-29  833  				 * is a valid one
bdb64d727216b49 Tatyana Brokhman  2011-06-29  834  				 */
bdb64d727216b49 Tatyana Brokhman  2011-06-29  835  				if (cdev->config)
bdb64d727216b49 Tatyana Brokhman  2011-06-29  836  					reset_config(cdev);
40982be52d8f64c David Brownell    2008-06-19  837  				result = 0;
40982be52d8f64c David Brownell    2008-06-19  838  				break;
40982be52d8f64c David Brownell    2008-06-19  839  			}
40982be52d8f64c David Brownell    2008-06-19  840  		}
40982be52d8f64c David Brownell    2008-06-19  841  		if (result < 0)
40982be52d8f64c David Brownell    2008-06-19  842  			goto done;

c is not a valid usb_configuration pointer at this goto.

bdb64d727216b49 Tatyana Brokhman  2011-06-29  843  	} else { /* Zero configuration value - need to reset the config */
bdb64d727216b49 Tatyana Brokhman  2011-06-29  844  		if (cdev->config)
bdb64d727216b49 Tatyana Brokhman  2011-06-29  845  			reset_config(cdev);
40982be52d8f64c David Brownell    2008-06-19  846  		result = 0;
bdb64d727216b49 Tatyana Brokhman  2011-06-29  847  	}
40982be52d8f64c David Brownell    2008-06-19  848  
e538dfdae85244f Michal Nazarewicz 2011-08-30  849  	INFO(cdev, "%s config #%d: %s\n",
e538dfdae85244f Michal Nazarewicz 2011-08-30  850  	     usb_speed_string(gadget->speed),
e538dfdae85244f Michal Nazarewicz 2011-08-30  851  	     number, c ? c->label : "unconfigured");
40982be52d8f64c David Brownell    2008-06-19  852  
40982be52d8f64c David Brownell    2008-06-19  853  	if (!c)
40982be52d8f64c David Brownell    2008-06-19  854  		goto done;
40982be52d8f64c David Brownell    2008-06-19  855  
6027f3173e797bf Peter Chen        2014-04-29  856  	usb_gadget_set_state(gadget, USB_STATE_CONFIGURED);
40982be52d8f64c David Brownell    2008-06-19  857  	cdev->config = c;
40982be52d8f64c David Brownell    2008-06-19  858  
40982be52d8f64c David Brownell    2008-06-19  859  	/* Initialize all interfaces by setting them to altsetting zero. */
40982be52d8f64c David Brownell    2008-06-19  860  	for (tmp = 0; tmp < MAX_CONFIG_INTERFACES; tmp++) {
40982be52d8f64c David Brownell    2008-06-19  861  		struct usb_function	*f = c->interface[tmp];
5242658d1b97771 Laurent Pinchart  2009-10-21  862  		struct usb_descriptor_header **descriptors;
40982be52d8f64c David Brownell    2008-06-19  863  
40982be52d8f64c David Brownell    2008-06-19  864  		if (!f)
40982be52d8f64c David Brownell    2008-06-19  865  			break;
40982be52d8f64c David Brownell    2008-06-19  866  
5242658d1b97771 Laurent Pinchart  2009-10-21  867  		/*
5242658d1b97771 Laurent Pinchart  2009-10-21  868  		 * Record which endpoints are used by the function. This is used
5242658d1b97771 Laurent Pinchart  2009-10-21  869  		 * to dispatch control requests targeted at that endpoint to the
5242658d1b97771 Laurent Pinchart  2009-10-21  870  		 * function's setup callback instead of the current
5242658d1b97771 Laurent Pinchart  2009-10-21  871  		 * configuration's setup callback.
5242658d1b97771 Laurent Pinchart  2009-10-21  872  		 */
f3bdbe36682631d John Youn         2016-02-05  873  		descriptors = function_descriptors(f, gadget->speed);
5242658d1b97771 Laurent Pinchart  2009-10-21  874  
5242658d1b97771 Laurent Pinchart  2009-10-21  875  		for (; *descriptors; ++descriptors) {
5242658d1b97771 Laurent Pinchart  2009-10-21  876  			struct usb_endpoint_descriptor *ep;
5242658d1b97771 Laurent Pinchart  2009-10-21  877  			int addr;
5242658d1b97771 Laurent Pinchart  2009-10-21  878  
5242658d1b97771 Laurent Pinchart  2009-10-21  879  			if ((*descriptors)->bDescriptorType != USB_DT_ENDPOINT)
5242658d1b97771 Laurent Pinchart  2009-10-21  880  				continue;
5242658d1b97771 Laurent Pinchart  2009-10-21  881  
5242658d1b97771 Laurent Pinchart  2009-10-21  882  			ep = (struct usb_endpoint_descriptor *)*descriptors;
5242658d1b97771 Laurent Pinchart  2009-10-21  883  			addr = ((ep->bEndpointAddress & 0x80) >> 3)
5242658d1b97771 Laurent Pinchart  2009-10-21  884  			     |  (ep->bEndpointAddress & 0x0f);
5242658d1b97771 Laurent Pinchart  2009-10-21  885  			set_bit(addr, f->endpoints);
5242658d1b97771 Laurent Pinchart  2009-10-21  886  		}
5242658d1b97771 Laurent Pinchart  2009-10-21  887  
40982be52d8f64c David Brownell    2008-06-19  888  		result = f->set_alt(f, tmp, 0);
40982be52d8f64c David Brownell    2008-06-19  889  		if (result < 0) {
40982be52d8f64c David Brownell    2008-06-19  890  			DBG(cdev, "interface %d (%s/%p) alt 0 --> %d\n",
40982be52d8f64c David Brownell    2008-06-19  891  					tmp, f->name, f, result);
40982be52d8f64c David Brownell    2008-06-19  892  
40982be52d8f64c David Brownell    2008-06-19  893  			reset_config(cdev);
40982be52d8f64c David Brownell    2008-06-19  894  			goto done;
40982be52d8f64c David Brownell    2008-06-19  895  		}
1b9ba000177ee47 Roger Quadros     2011-05-09  896  
1b9ba000177ee47 Roger Quadros     2011-05-09  897  		if (result == USB_GADGET_DELAYED_STATUS) {
1b9ba000177ee47 Roger Quadros     2011-05-09  898  			DBG(cdev,
1b9ba000177ee47 Roger Quadros     2011-05-09  899  			 "%s: interface %d (%s) requested delayed status\n",
1b9ba000177ee47 Roger Quadros     2011-05-09  900  					__func__, tmp, f->name);
1b9ba000177ee47 Roger Quadros     2011-05-09  901  			cdev->delayed_status++;
1b9ba000177ee47 Roger Quadros     2011-05-09  902  			DBG(cdev, "delayed_status count %d\n",
1b9ba000177ee47 Roger Quadros     2011-05-09  903  					cdev->delayed_status);
1b9ba000177ee47 Roger Quadros     2011-05-09  904  		}
40982be52d8f64c David Brownell    2008-06-19  905  	}
40982be52d8f64c David Brownell    2008-06-19  906  
40982be52d8f64c David Brownell    2008-06-19  907  	/* when we return, be sure our power usage is valid */
995567ded019877 Jack Pham         2021-07-20  908  	if (c->MaxPower || (c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
995567ded019877 Jack Pham         2021-07-20  909  		power = c->MaxPower;
995567ded019877 Jack Pham         2021-07-20  910  	else
995567ded019877 Jack Pham         2021-07-20  911  		power = CONFIG_USB_GADGET_VBUS_DRAW;
995567ded019877 Jack Pham         2021-07-20  912  
aae7167626ce37a Jack Pham         2020-01-30  913  	if (gadget->speed < USB_SPEED_SUPER)
aae7167626ce37a Jack Pham         2020-01-30  914  		power = min(power, 500U);
aae7167626ce37a Jack Pham         2020-01-30  915  	else
aae7167626ce37a Jack Pham         2020-01-30  916  		power = min(power, 900U);
40982be52d8f64c David Brownell    2008-06-19  917  done:
7367e87b6e9eb4d Prashanth K       2025-02-17  918  	if (power > USB_SELF_POWER_VBUS_MAX_DRAW ||
7367e87b6e9eb4d Prashanth K       2025-02-17 @919  	    !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
                                                              ^^^^^^^^^^^^^^^
This is an invalid read.

78a92756fc2cab0 Thinh Nguyen      2020-02-03  920  		usb_gadget_clear_selfpowered(gadget);
7367e87b6e9eb4d Prashanth K       2025-02-17  921  	else
7367e87b6e9eb4d Prashanth K       2025-02-17  922  		usb_gadget_set_selfpowered(gadget);
78a92756fc2cab0 Thinh Nguyen      2020-02-03  923  
40982be52d8f64c David Brownell    2008-06-19  924  	usb_gadget_vbus_draw(gadget, power);
1b9ba000177ee47 Roger Quadros     2011-05-09  925  	if (result >= 0 && cdev->delayed_status)
1b9ba000177ee47 Roger Quadros     2011-05-09  926  		result = USB_GADGET_DELAYED_STATUS;
40982be52d8f64c David Brownell    2008-06-19  927  	return result;
40982be52d8f64c David Brownell    2008-06-19  928  }
40982be52d8f64c David Brownell    2008-06-19  929  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

