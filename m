Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65F426988C
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 20:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745959792; cv=none; b=jl+CqEuHsx5NjUbC7efhPQvM2EJbwe8Bc5ygEn50U/0Pp3dVhTvskfvolwK1RPjpu2U7Vta2We23FciuhpQPZjUWnuzxLSjP0OtS3nnEWup+TuuHEnhLyQbCP9rTR9x/XyrnYx9lXW9FJkVsDkG7yrFyYb2srnvodX6lbpRodvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745959792; c=relaxed/simple;
	bh=zywUn2ApcXWcgFBGQ+5x/evkXqh5TsHnCyK+twwaJfw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DaLetNl5ninL6/WazcPFfyjg3CWxpExttbydmI5vW+2rpVV+Pgz+OVkbcRNabtU4EgFsZgvsOp7ehTYAlHiNfz1qAdyb8dXtbNtA38UYJvuS5dzgi6MPD3U7eV+UrTpe1b6QsgDB8DWYMJrwU7S5o1gewjeonJOXeZ8zwBtOMJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhxQDLGB; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhxQDLGB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745959791; x=1777495791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zywUn2ApcXWcgFBGQ+5x/evkXqh5TsHnCyK+twwaJfw=;
  b=nhxQDLGB7iZdthRbsCLIVlGYdT6YKiTONLi3H5xT57mHKh4av9IYRWJ4
   2h1Hm57znFpUMpNvRCd5eA3LLGjXlRVuqE2SSsDRg25MlxjE40X9GUtXn
   F7JA+x4mW2+VMkOIbOvW41ekAzBP9gdEbv1qn+LrRAJxBb2xwjJu6isz4
   qk43uGtSFxIKMheAJDcCjstSNC8FjOQ/HMISI4mQxG2r5TeNQHdysqL/9
   cj33k1l5aKkrHlAIv8nx74Xgk98Tn0cKmBsOE8O2h19XAH6M0LlbBVFUz
   yM2VqPsf2y68jcF1kmoRmF2vKa++5HcEPWQjaivCLmRwOrw/V+LN/g6+m
   Q==;
X-CSE-ConnectionGUID: KMAPIdYUSo6lAJH+aP8V2Q==
X-CSE-MsgGUID: w5VJ5jTTQm2ecictlbr0CA==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58966502"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="58966502"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:49:45 -0700
X-CSE-ConnectionGUID: bbyd+4CjRMKutl4j/hqobQ==
X-CSE-MsgGUID: pDH3qbKISuCarN7XGVaiog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="134434108"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Apr 2025 13:49:43 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9rtd-0002vn-1E;
	Tue, 29 Apr 2025 20:49:41 +0000
Date: Wed, 30 Apr 2025 04:48:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
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

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   1aec9e76fe4a65b0a26fa1b30bdb3400d9728b2d
commit: 7367e87b6e9eb4de86a6ce799a8fe0178a4384de [1/1] usb: gadget: Set self-powered based on MaxPower and bmAttributes
:::::: branch date: 4 days ago
:::::: commit date: 7 weeks ago
config: i386-randconfig-141-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300435.D2g8DmRD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504300435.D2g8DmRD-lkp@intel.com/

New smatch warnings:
drivers/usb/gadget/composite.c:919 set_config() warn: iterator used outside loop: 'c'

Old smatch warnings:
drivers/usb/gadget/composite.c:919 set_config() error: we previously assumed 'c' could be null (see line 853)
drivers/usb/gadget/composite.c:2369 composite_suspend() error: we previously assumed 'cdev->config' could be null (see line 2358)

vim +/c +919 drivers/usb/gadget/composite.c

40982be52d8f64c David Brownell    2008-06-19  817  
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
