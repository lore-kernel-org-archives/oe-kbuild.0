Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B74B22A1C9
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Feb 2025 00:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740099011; cv=none; b=dIbZEnvpUx6Tlgh5OdAQXeu1lo94oF6QqvJR3AXcclnPqE25kuU3cUTbaQXqw6DM4jyKa7zaK6vlI9DVzE5tAMCRkqR2uL+4+85RxtS8v9PTt3+AfuNI7N00mgdt/e1sB3ZTh+wptHnjXnFLKnUDnkmISg79KVtUgEn+0uKpZRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740099011; c=relaxed/simple;
	bh=OktNc5RKUdo5Du3isKdyqMp4A6w5DUGn0n01Rxpoqf0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DoGdzL3KdTJ6DNkD9J+aIIfcWoykreiq8U1yX2YLr6To0u/3TiFvrxeiAbdDU6qfK3RpSz/iUXES5b1uHxnOGYNAcVkdmeUxVBoXDhi5Vds8MNqG41OocZlPNKZIl21ph6tx39/zUXE8DTdD6TjRhzujh0hKgWPhe/CRQkD72xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6fBm8gI; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6fBm8gI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740099008; x=1771635008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OktNc5RKUdo5Du3isKdyqMp4A6w5DUGn0n01Rxpoqf0=;
  b=Z6fBm8gIUwYMr6jsugOlbXNuIk3zOSKPI3mSOyy9yP9PlD4RvRtJ2Fwm
   +qEkAll6nmhpzirT2PjsKZb+eOBt/msM++qVZ1JcBjjoP0WcyzVe31XUW
   tCKHrzDTkVIPSMKFE/3om5RiE67FLhTd/5d3hUJkPvUjtQQAA0C7BxkrT
   sQPBc1fFHxD0qqZcXu1/JctbQrjPcASMPNG2Z0MsSVSWSu/LFrYYtlMRp
   Lwirt/urTWmOsGCoCXud1ifLytbdrywrhWRv9MFxV6EPmtdnk17Yrujgq
   5WtlndCaXXv0WkQ6CKQadgM5NigHy3p2yw8HPlhDlKSXLCuTjexuwGs6S
   w==;
X-CSE-ConnectionGUID: 1xei0DK2QiqwZyOK5kRrMg==
X-CSE-MsgGUID: WANz6AMSTK6gCjusQYcjsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41114280"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41114280"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 16:50:08 -0800
X-CSE-ConnectionGUID: HRNJw95uRmOCLnF9CZsgKg==
X-CSE-MsgGUID: ysSW+fjxRHyjple70xNOLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,303,1732608000"; 
   d="scan'208";a="114933518"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 20 Feb 2025 16:50:07 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlHEu-0004vX-1G;
	Fri, 21 Feb 2025 00:50:01 +0000
Date: Fri, 21 Feb 2025 08:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [usb:usb-linus 3/7] drivers/usb/gadget/composite.c:1054 set_config()
 error: we previously assumed 'c' could be null (see line 983)
Message-ID: <202502210827.TTfQAoPT-lkp@intel.com>
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
CC: linux-usb@vger.kernel.org
TO: Prashanth K <prashanth.k@oss.qualcomm.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-linus
head:   c783e1258f29c5caac9eea0aea6b172870f1baf8
commit: 40e89ff5750fca2c1d6da93f98a2038716bba86c [3/7] usb: gadget: Set self-powered based on MaxPower and bmAttributes
:::::: branch date: 12 hours ago
:::::: commit date: 34 hours ago
config: x86_64-randconfig-161-20250220 (https://download.01.org/0day-ci/archive/20250221/202502210827.TTfQAoPT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502210827.TTfQAoPT-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/composite.c:1054 set_config() error: we previously assumed 'c' could be null (see line 983)
drivers/usb/gadget/composite.c:2619 composite_suspend() error: we previously assumed 'cdev->config' could be null (see line 2608)

vim +/c +1054 drivers/usb/gadget/composite.c

40982be52d8f64 David Brownell    2008-06-19   946  
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
40982be52d8f64 David Brownell    2008-06-19   982  
40982be52d8f64 David Brownell    2008-06-19  @983  	if (!c)
40982be52d8f64 David Brownell    2008-06-19   984  		goto done;
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
40e89ff5750fca Prashanth K       2025-02-17 @1054  	    !(c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  1055  		usb_gadget_clear_selfpowered(gadget);
40e89ff5750fca Prashanth K       2025-02-17  1056  	else
40e89ff5750fca Prashanth K       2025-02-17  1057  		usb_gadget_set_selfpowered(gadget);
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  1058  
40982be52d8f64 David Brownell    2008-06-19  1059  	usb_gadget_vbus_draw(gadget, power);
1b9ba000177ee4 Roger Quadros     2011-05-09  1060  	if (result >= 0 && cdev->delayed_status)
1b9ba000177ee4 Roger Quadros     2011-05-09  1061  		result = USB_GADGET_DELAYED_STATUS;
40982be52d8f64 David Brownell    2008-06-19  1062  	return result;
40982be52d8f64 David Brownell    2008-06-19  1063  }
40982be52d8f64 David Brownell    2008-06-19  1064  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
