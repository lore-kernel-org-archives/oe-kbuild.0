Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D41C284B3B
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 19:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768850114; cv=none; b=AX7vfuGNXXg1XuPT/NqQjVFSCx26CjGdF4JuotX6S4i1rwaKnA92aFol43oAu4e2CYQRJSZBv0hOtpozLqENOgSi1KtcqzyPD+8Oqj3+YZWulYdlO7ije5KNZs7Rwrc7KJk7uK7dQoyGs9iLHiMXdOUyV1YUYvuuchP4QzrIm2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768850114; c=relaxed/simple;
	bh=ebL/9y1zg8bysbyDjsTrKaWGzV9hO6oBmxAjMfbrOeo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mKe90bld3n8co3HgU0mIHe7xzUbj8orA0psOO93DXufBf9gqAQF5xuFPwNjwlMSV3J6jPtK3tG5WN2V1LlP7ZPMrpZsLSLzj2hGxbPhgM3rOMTP2pWVzSSe1pdq3Bd+MON5Q2iC9JjbYmTCVnCjkHRS12P2FNSnkwWM+3y/+y4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nt5QMqEM; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nt5QMqEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768850112; x=1800386112;
  h=date:from:to:cc:subject:message-id;
  bh=ebL/9y1zg8bysbyDjsTrKaWGzV9hO6oBmxAjMfbrOeo=;
  b=Nt5QMqEMHYPvQExU0FpYbdvEFygZBKLDL/+OYJ0jOhr6vpL9/fTdRDpa
   el7e9/2bVgQN89TPjduZktaPy3VxZAdqID9aSxv97rhQlISiZsphMv9jy
   WjCw03wcwWDT+XA2MLJ5AUK2Y04BAiEf0qGqSwKRX7djH0IyPyKLYRarR
   n5Rov5mAoMxVI5YVggxIPCKnRX71yFZleLRlKgcqd4tTiApaSN2g4gaNh
   ZiVbj+rj+IwLXN7dD+Lf78JPUUv5XcRx6BlBnPNrtE/nevTRcvuESkkar
   xy6uZaJ6Yj9mjmRBCrvUhiyTHsN+Z/YzKLqtfjRndtziQxa5IwUKqBnaC
   w==;
X-CSE-ConnectionGUID: w1qHBNCyRgCrajnA9ZUfYQ==
X-CSE-MsgGUID: wIDMsZlOT/KTCQ01JShCVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="70036917"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="70036917"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 11:15:10 -0800
X-CSE-ConnectionGUID: VCo4Vp95QOqsh7ih7OCtkA==
X-CSE-MsgGUID: wG/fN7k8Q4yf9KqdyWGThQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="237202421"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Jan 2026 11:15:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhuiQ-00000000OCt-35hn;
	Mon, 19 Jan 2026 19:15:06 +0000
Date: Tue, 20 Jan 2026 03:14:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android12-kiwi-5.10 196/196]
 drivers/usb/gadget/composite.c:919 set_config() warn: iterator used outside
 loop: 'c'
Message-ID: <202601200312.6pgHQsnw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   625d1a188a3d8cbd1f0897f44e0984dae1711754
commit: 1624cd20387974d94299c111e7316f766c331400 [196/196] usb: gadget: Set self-powered based on MaxPower and bmAttributes
:::::: branch date: 6 days ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20260114 (https://download.01.org/0day-ci/archive/20260120/202601200312.6pgHQsnw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200312.6pgHQsnw-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/composite.c:919 set_config() warn: iterator used outside loop: 'c'

Old smatch warnings:
drivers/usb/gadget/composite.c:919 set_config() error: we previously assumed 'c' could be null (see line 853)
drivers/usb/gadget/composite.c:2369 composite_suspend() error: we previously assumed 'cdev->config' could be null (see line 2358)

vim +/c +919 drivers/usb/gadget/composite.c

40982be52d8f64 David Brownell    2008-06-19  817  
40982be52d8f64 David Brownell    2008-06-19  818  static int set_config(struct usb_composite_dev *cdev,
40982be52d8f64 David Brownell    2008-06-19  819  		const struct usb_ctrlrequest *ctrl, unsigned number)
40982be52d8f64 David Brownell    2008-06-19  820  {
40982be52d8f64 David Brownell    2008-06-19  821  	struct usb_gadget	*gadget = cdev->gadget;
40982be52d8f64 David Brownell    2008-06-19  822  	struct usb_configuration *c = NULL;
40982be52d8f64 David Brownell    2008-06-19  823  	int			result = -EINVAL;
40982be52d8f64 David Brownell    2008-06-19  824  	unsigned		power = gadget_is_otg(gadget) ? 8 : 100;
40982be52d8f64 David Brownell    2008-06-19  825  	int			tmp;
40982be52d8f64 David Brownell    2008-06-19  826  
40982be52d8f64 David Brownell    2008-06-19  827  	if (number) {
40982be52d8f64 David Brownell    2008-06-19  828  		list_for_each_entry(c, &cdev->configs, list) {
40982be52d8f64 David Brownell    2008-06-19  829  			if (c->bConfigurationValue == number) {
bdb64d727216b4 Tatyana Brokhman  2011-06-29  830  				/*
bdb64d727216b4 Tatyana Brokhman  2011-06-29  831  				 * We disable the FDs of the previous
bdb64d727216b4 Tatyana Brokhman  2011-06-29  832  				 * configuration only if the new configuration
bdb64d727216b4 Tatyana Brokhman  2011-06-29  833  				 * is a valid one
bdb64d727216b4 Tatyana Brokhman  2011-06-29  834  				 */
bdb64d727216b4 Tatyana Brokhman  2011-06-29  835  				if (cdev->config)
bdb64d727216b4 Tatyana Brokhman  2011-06-29  836  					reset_config(cdev);
40982be52d8f64 David Brownell    2008-06-19  837  				result = 0;
40982be52d8f64 David Brownell    2008-06-19  838  				break;
40982be52d8f64 David Brownell    2008-06-19  839  			}
40982be52d8f64 David Brownell    2008-06-19  840  		}
40982be52d8f64 David Brownell    2008-06-19  841  		if (result < 0)
40982be52d8f64 David Brownell    2008-06-19  842  			goto done;
bdb64d727216b4 Tatyana Brokhman  2011-06-29  843  	} else { /* Zero configuration value - need to reset the config */
bdb64d727216b4 Tatyana Brokhman  2011-06-29  844  		if (cdev->config)
bdb64d727216b4 Tatyana Brokhman  2011-06-29  845  			reset_config(cdev);
40982be52d8f64 David Brownell    2008-06-19  846  		result = 0;
bdb64d727216b4 Tatyana Brokhman  2011-06-29  847  	}
40982be52d8f64 David Brownell    2008-06-19  848  
1cbfb8c4f62d66 Joel Stanley      2019-09-30  849  	DBG(cdev, "%s config #%d: %s\n",
e538dfdae85244 Michal Nazarewicz 2011-08-30  850  	    usb_speed_string(gadget->speed),
e538dfdae85244 Michal Nazarewicz 2011-08-30  851  	    number, c ? c->label : "unconfigured");
40982be52d8f64 David Brownell    2008-06-19  852  
40982be52d8f64 David Brownell    2008-06-19  853  	if (!c)
40982be52d8f64 David Brownell    2008-06-19  854  		goto done;
40982be52d8f64 David Brownell    2008-06-19  855  
6027f3173e797b Peter Chen        2014-04-29  856  	usb_gadget_set_state(gadget, USB_STATE_CONFIGURED);
40982be52d8f64 David Brownell    2008-06-19  857  	cdev->config = c;
40982be52d8f64 David Brownell    2008-06-19  858  
40982be52d8f64 David Brownell    2008-06-19  859  	/* Initialize all interfaces by setting them to altsetting zero. */
40982be52d8f64 David Brownell    2008-06-19  860  	for (tmp = 0; tmp < MAX_CONFIG_INTERFACES; tmp++) {
40982be52d8f64 David Brownell    2008-06-19  861  		struct usb_function	*f = c->interface[tmp];
5242658d1b9777 Laurent Pinchart  2009-10-21  862  		struct usb_descriptor_header **descriptors;
40982be52d8f64 David Brownell    2008-06-19  863  
40982be52d8f64 David Brownell    2008-06-19  864  		if (!f)
40982be52d8f64 David Brownell    2008-06-19  865  			break;
40982be52d8f64 David Brownell    2008-06-19  866  
5242658d1b9777 Laurent Pinchart  2009-10-21  867  		/*
5242658d1b9777 Laurent Pinchart  2009-10-21  868  		 * Record which endpoints are used by the function. This is used
5242658d1b9777 Laurent Pinchart  2009-10-21  869  		 * to dispatch control requests targeted at that endpoint to the
5242658d1b9777 Laurent Pinchart  2009-10-21  870  		 * function's setup callback instead of the current
5242658d1b9777 Laurent Pinchart  2009-10-21  871  		 * configuration's setup callback.
5242658d1b9777 Laurent Pinchart  2009-10-21  872  		 */
f3bdbe36682631 John Youn         2016-02-05  873  		descriptors = function_descriptors(f, gadget->speed);
5242658d1b9777 Laurent Pinchart  2009-10-21  874  
5242658d1b9777 Laurent Pinchart  2009-10-21  875  		for (; *descriptors; ++descriptors) {
5242658d1b9777 Laurent Pinchart  2009-10-21  876  			struct usb_endpoint_descriptor *ep;
5242658d1b9777 Laurent Pinchart  2009-10-21  877  			int addr;
5242658d1b9777 Laurent Pinchart  2009-10-21  878  
5242658d1b9777 Laurent Pinchart  2009-10-21  879  			if ((*descriptors)->bDescriptorType != USB_DT_ENDPOINT)
5242658d1b9777 Laurent Pinchart  2009-10-21  880  				continue;
5242658d1b9777 Laurent Pinchart  2009-10-21  881  
5242658d1b9777 Laurent Pinchart  2009-10-21  882  			ep = (struct usb_endpoint_descriptor *)*descriptors;
5242658d1b9777 Laurent Pinchart  2009-10-21  883  			addr = ((ep->bEndpointAddress & 0x80) >> 3)
5242658d1b9777 Laurent Pinchart  2009-10-21  884  			     |  (ep->bEndpointAddress & 0x0f);
5242658d1b9777 Laurent Pinchart  2009-10-21  885  			set_bit(addr, f->endpoints);
5242658d1b9777 Laurent Pinchart  2009-10-21  886  		}
5242658d1b9777 Laurent Pinchart  2009-10-21  887  
40982be52d8f64 David Brownell    2008-06-19  888  		result = f->set_alt(f, tmp, 0);
40982be52d8f64 David Brownell    2008-06-19  889  		if (result < 0) {
40982be52d8f64 David Brownell    2008-06-19  890  			DBG(cdev, "interface %d (%s/%p) alt 0 --> %d\n",
40982be52d8f64 David Brownell    2008-06-19  891  					tmp, f->name, f, result);
40982be52d8f64 David Brownell    2008-06-19  892  
40982be52d8f64 David Brownell    2008-06-19  893  			reset_config(cdev);
40982be52d8f64 David Brownell    2008-06-19  894  			goto done;
40982be52d8f64 David Brownell    2008-06-19  895  		}
1b9ba000177ee4 Roger Quadros     2011-05-09  896  
1b9ba000177ee4 Roger Quadros     2011-05-09  897  		if (result == USB_GADGET_DELAYED_STATUS) {
1b9ba000177ee4 Roger Quadros     2011-05-09  898  			DBG(cdev,
1b9ba000177ee4 Roger Quadros     2011-05-09  899  			 "%s: interface %d (%s) requested delayed status\n",
1b9ba000177ee4 Roger Quadros     2011-05-09  900  					__func__, tmp, f->name);
1b9ba000177ee4 Roger Quadros     2011-05-09  901  			cdev->delayed_status++;
1b9ba000177ee4 Roger Quadros     2011-05-09  902  			DBG(cdev, "delayed_status count %d\n",
1b9ba000177ee4 Roger Quadros     2011-05-09  903  					cdev->delayed_status);
1b9ba000177ee4 Roger Quadros     2011-05-09  904  		}
40982be52d8f64 David Brownell    2008-06-19  905  	}
40982be52d8f64 David Brownell    2008-06-19  906  
40982be52d8f64 David Brownell    2008-06-19  907  	/* when we return, be sure our power usage is valid */
03f4492dbff3d7 Jack Pham         2021-07-20  908  	if (c->MaxPower || (c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
03f4492dbff3d7 Jack Pham         2021-07-20  909  		power = c->MaxPower;
03f4492dbff3d7 Jack Pham         2021-07-20  910  	else
03f4492dbff3d7 Jack Pham         2021-07-20  911  		power = CONFIG_USB_GADGET_VBUS_DRAW;
03f4492dbff3d7 Jack Pham         2021-07-20  912  
a2035411fa1d12 Jack Pham         2020-01-30  913  	if (gadget->speed < USB_SPEED_SUPER)
a2035411fa1d12 Jack Pham         2020-01-30  914  		power = min(power, 500U);
a2035411fa1d12 Jack Pham         2020-01-30  915  	else
a2035411fa1d12 Jack Pham         2020-01-30  916  		power = min(power, 900U);
40982be52d8f64 David Brownell    2008-06-19  917  done:
1624cd20387974 Prashanth K       2025-02-17  918  	if (power > USB_SELF_POWER_VBUS_MAX_DRAW ||
1624cd20387974 Prashanth K       2025-02-17 @919  	    !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  920  		usb_gadget_clear_selfpowered(gadget);
1624cd20387974 Prashanth K       2025-02-17  921  	else
1624cd20387974 Prashanth K       2025-02-17  922  		usb_gadget_set_selfpowered(gadget);
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  923  
40982be52d8f64 David Brownell    2008-06-19  924  	usb_gadget_vbus_draw(gadget, power);
1b9ba000177ee4 Roger Quadros     2011-05-09  925  	if (result >= 0 && cdev->delayed_status)
1b9ba000177ee4 Roger Quadros     2011-05-09  926  		result = USB_GADGET_DELAYED_STATUS;
40982be52d8f64 David Brownell    2008-06-19  927  	return result;
40982be52d8f64 David Brownell    2008-06-19  928  }
40982be52d8f64 David Brownell    2008-06-19  929  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
