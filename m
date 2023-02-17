Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48758746A
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Feb 2023 14:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676645307; x=1708181307;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vHbwxyHEMwEd0vvw2HMOIQD9oco2AqudCL6GCxMDuBw=;
  b=LZduT5t0zXG/0waCE9ySZz/ItD6xqNRXAH8zOzAqkv/8OTniuKtxlLMf
   01LO2bs/EmGiU49r9ASsAmEiEokSVtryTm1KatyI5mfrIgrXPOmyhVoUn
   dbkuTIrUWXjHtIPC2JqMhC6GrGXu3ISn4IEzsvHPv1Q37AN0eAKHvbm8A
   F053zxidH4yoE9Sj0CbCSvfMngnHj9AgWXD+3/04tBE0Hw5rugoCjqo7F
   fa9wAiWtwKASDJW0dwr4+IfMtMGigHCAC2jGUmRE93uaiD6oKBPJm0dua
   K13tp50KoXLhizK2ptk3WfOVMDuU/GCgG+qVqKQgMvzhYyYb1SmuRZ2R2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="332001386"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="332001386"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 06:48:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="702988633"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="702988633"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Feb 2023 06:48:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT224-000BY5-0v;
	Fri, 17 Feb 2023 14:48:16 +0000
Date: Fri, 17 Feb 2023 22:47:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 1/5] usb: gadget: Properly configure the device for
 remote wakeup
Message-ID: <202302172243.hKUsQl2q-lkp@intel.com>
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
In-Reply-To: <1676586588-25989-2-git-send-email-quic_eserrao@quicinc.com>
References: <1676586588-25989-2-git-send-email-quic_eserrao@quicinc.com>
TO: Elson Roy Serrao <quic_eserrao@quicinc.com>
TO: gregkh@linuxfoundation.org
TO: Thinh.Nguyen@synopsys.com
TO: balbi@kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: quic_wcheng@quicinc.com
CC: quic_jackp@quicinc.com
CC: Elson Roy Serrao <quic_eserrao@quicinc.com>

Hi Elson,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.2-rc8 next-20230217]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elson-Roy-Serrao/usb-gadget-Properly-configure-the-device-for-remote-wakeup/20230217-063114
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/1676586588-25989-2-git-send-email-quic_eserrao%40quicinc.com
patch subject: [PATCH v5 1/5] usb: gadget: Properly configure the device for remote wakeup
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230217/202302172243.hKUsQl2q-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302172243.hKUsQl2q-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/composite.c:1016 set_config() error: we previously assumed 'c' could be null (see line 946)

vim +/c +1016 drivers/usb/gadget/composite.c

40982be52d8f64 David Brownell    2008-06-19   909  
40982be52d8f64 David Brownell    2008-06-19   910  static int set_config(struct usb_composite_dev *cdev,
40982be52d8f64 David Brownell    2008-06-19   911  		const struct usb_ctrlrequest *ctrl, unsigned number)
40982be52d8f64 David Brownell    2008-06-19   912  {
40982be52d8f64 David Brownell    2008-06-19   913  	struct usb_gadget	*gadget = cdev->gadget;
d6f4663664cbd5 Jakob Koschel     2022-03-08   914  	struct usb_configuration *c = NULL, *iter;
40982be52d8f64 David Brownell    2008-06-19   915  	int			result = -EINVAL;
40982be52d8f64 David Brownell    2008-06-19   916  	unsigned		power = gadget_is_otg(gadget) ? 8 : 100;
40982be52d8f64 David Brownell    2008-06-19   917  	int			tmp;
40982be52d8f64 David Brownell    2008-06-19   918  
40982be52d8f64 David Brownell    2008-06-19   919  	if (number) {
d6f4663664cbd5 Jakob Koschel     2022-03-08   920  		list_for_each_entry(iter, &cdev->configs, list) {
d6f4663664cbd5 Jakob Koschel     2022-03-08   921  			if (iter->bConfigurationValue != number)
d6f4663664cbd5 Jakob Koschel     2022-03-08   922  				continue;
bdb64d727216b4 Tatyana Brokhman  2011-06-29   923  			/*
bdb64d727216b4 Tatyana Brokhman  2011-06-29   924  			 * We disable the FDs of the previous
bdb64d727216b4 Tatyana Brokhman  2011-06-29   925  			 * configuration only if the new configuration
bdb64d727216b4 Tatyana Brokhman  2011-06-29   926  			 * is a valid one
bdb64d727216b4 Tatyana Brokhman  2011-06-29   927  			 */
bdb64d727216b4 Tatyana Brokhman  2011-06-29   928  			if (cdev->config)
bdb64d727216b4 Tatyana Brokhman  2011-06-29   929  				reset_config(cdev);
d6f4663664cbd5 Jakob Koschel     2022-03-08   930  			c = iter;
40982be52d8f64 David Brownell    2008-06-19   931  			result = 0;
40982be52d8f64 David Brownell    2008-06-19   932  			break;
40982be52d8f64 David Brownell    2008-06-19   933  		}
40982be52d8f64 David Brownell    2008-06-19   934  		if (result < 0)
40982be52d8f64 David Brownell    2008-06-19   935  			goto done;
bdb64d727216b4 Tatyana Brokhman  2011-06-29   936  	} else { /* Zero configuration value - need to reset the config */
bdb64d727216b4 Tatyana Brokhman  2011-06-29   937  		if (cdev->config)
bdb64d727216b4 Tatyana Brokhman  2011-06-29   938  			reset_config(cdev);
40982be52d8f64 David Brownell    2008-06-19   939  		result = 0;
bdb64d727216b4 Tatyana Brokhman  2011-06-29   940  	}
40982be52d8f64 David Brownell    2008-06-19   941  
1cbfb8c4f62d66 Joel Stanley      2019-09-30   942  	DBG(cdev, "%s config #%d: %s\n",
e538dfdae85244 Michal Nazarewicz 2011-08-30   943  	    usb_speed_string(gadget->speed),
e538dfdae85244 Michal Nazarewicz 2011-08-30   944  	    number, c ? c->label : "unconfigured");
40982be52d8f64 David Brownell    2008-06-19   945  
40982be52d8f64 David Brownell    2008-06-19  @946  	if (!c)
40982be52d8f64 David Brownell    2008-06-19   947  		goto done;
40982be52d8f64 David Brownell    2008-06-19   948  
6027f3173e797b Peter Chen        2014-04-29   949  	usb_gadget_set_state(gadget, USB_STATE_CONFIGURED);
40982be52d8f64 David Brownell    2008-06-19   950  	cdev->config = c;
40982be52d8f64 David Brownell    2008-06-19   951  
40982be52d8f64 David Brownell    2008-06-19   952  	/* Initialize all interfaces by setting them to altsetting zero. */
40982be52d8f64 David Brownell    2008-06-19   953  	for (tmp = 0; tmp < MAX_CONFIG_INTERFACES; tmp++) {
40982be52d8f64 David Brownell    2008-06-19   954  		struct usb_function	*f = c->interface[tmp];
5242658d1b9777 Laurent Pinchart  2009-10-21   955  		struct usb_descriptor_header **descriptors;
40982be52d8f64 David Brownell    2008-06-19   956  
40982be52d8f64 David Brownell    2008-06-19   957  		if (!f)
40982be52d8f64 David Brownell    2008-06-19   958  			break;
40982be52d8f64 David Brownell    2008-06-19   959  
5242658d1b9777 Laurent Pinchart  2009-10-21   960  		/*
5242658d1b9777 Laurent Pinchart  2009-10-21   961  		 * Record which endpoints are used by the function. This is used
5242658d1b9777 Laurent Pinchart  2009-10-21   962  		 * to dispatch control requests targeted at that endpoint to the
5242658d1b9777 Laurent Pinchart  2009-10-21   963  		 * function's setup callback instead of the current
5242658d1b9777 Laurent Pinchart  2009-10-21   964  		 * configuration's setup callback.
5242658d1b9777 Laurent Pinchart  2009-10-21   965  		 */
f3bdbe36682631 John Youn         2016-02-05   966  		descriptors = function_descriptors(f, gadget->speed);
5242658d1b9777 Laurent Pinchart  2009-10-21   967  
5242658d1b9777 Laurent Pinchart  2009-10-21   968  		for (; *descriptors; ++descriptors) {
5242658d1b9777 Laurent Pinchart  2009-10-21   969  			struct usb_endpoint_descriptor *ep;
5242658d1b9777 Laurent Pinchart  2009-10-21   970  			int addr;
5242658d1b9777 Laurent Pinchart  2009-10-21   971  
5242658d1b9777 Laurent Pinchart  2009-10-21   972  			if ((*descriptors)->bDescriptorType != USB_DT_ENDPOINT)
5242658d1b9777 Laurent Pinchart  2009-10-21   973  				continue;
5242658d1b9777 Laurent Pinchart  2009-10-21   974  
5242658d1b9777 Laurent Pinchart  2009-10-21   975  			ep = (struct usb_endpoint_descriptor *)*descriptors;
5242658d1b9777 Laurent Pinchart  2009-10-21   976  			addr = ((ep->bEndpointAddress & 0x80) >> 3)
5242658d1b9777 Laurent Pinchart  2009-10-21   977  			     |  (ep->bEndpointAddress & 0x0f);
5242658d1b9777 Laurent Pinchart  2009-10-21   978  			set_bit(addr, f->endpoints);
5242658d1b9777 Laurent Pinchart  2009-10-21   979  		}
5242658d1b9777 Laurent Pinchart  2009-10-21   980  
40982be52d8f64 David Brownell    2008-06-19   981  		result = f->set_alt(f, tmp, 0);
40982be52d8f64 David Brownell    2008-06-19   982  		if (result < 0) {
40982be52d8f64 David Brownell    2008-06-19   983  			DBG(cdev, "interface %d (%s/%p) alt 0 --> %d\n",
40982be52d8f64 David Brownell    2008-06-19   984  					tmp, f->name, f, result);
40982be52d8f64 David Brownell    2008-06-19   985  
40982be52d8f64 David Brownell    2008-06-19   986  			reset_config(cdev);
40982be52d8f64 David Brownell    2008-06-19   987  			goto done;
40982be52d8f64 David Brownell    2008-06-19   988  		}
1b9ba000177ee4 Roger Quadros     2011-05-09   989  
1b9ba000177ee4 Roger Quadros     2011-05-09   990  		if (result == USB_GADGET_DELAYED_STATUS) {
1b9ba000177ee4 Roger Quadros     2011-05-09   991  			DBG(cdev,
1b9ba000177ee4 Roger Quadros     2011-05-09   992  			 "%s: interface %d (%s) requested delayed status\n",
1b9ba000177ee4 Roger Quadros     2011-05-09   993  					__func__, tmp, f->name);
1b9ba000177ee4 Roger Quadros     2011-05-09   994  			cdev->delayed_status++;
1b9ba000177ee4 Roger Quadros     2011-05-09   995  			DBG(cdev, "delayed_status count %d\n",
1b9ba000177ee4 Roger Quadros     2011-05-09   996  					cdev->delayed_status);
1b9ba000177ee4 Roger Quadros     2011-05-09   997  		}
40982be52d8f64 David Brownell    2008-06-19   998  	}
40982be52d8f64 David Brownell    2008-06-19   999  
40982be52d8f64 David Brownell    2008-06-19  1000  	/* when we return, be sure our power usage is valid */
bcacbf06c89137 Jack Pham         2021-07-20  1001  	if (c->MaxPower || (c->bmAttributes & USB_CONFIG_ATT_SELFPOWER))
bcacbf06c89137 Jack Pham         2021-07-20  1002  		power = c->MaxPower;
bcacbf06c89137 Jack Pham         2021-07-20  1003  	else
bcacbf06c89137 Jack Pham         2021-07-20  1004  		power = CONFIG_USB_GADGET_VBUS_DRAW;
bcacbf06c89137 Jack Pham         2021-07-20  1005  
a2035411fa1d12 Jack Pham         2020-01-30  1006  	if (gadget->speed < USB_SPEED_SUPER)
a2035411fa1d12 Jack Pham         2020-01-30  1007  		power = min(power, 500U);
a2035411fa1d12 Jack Pham         2020-01-30  1008  	else
a2035411fa1d12 Jack Pham         2020-01-30  1009  		power = min(power, 900U);
40982be52d8f64 David Brownell    2008-06-19  1010  done:
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  1011  	if (power <= USB_SELF_POWER_VBUS_MAX_DRAW)
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  1012  		usb_gadget_set_selfpowered(gadget);
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  1013  	else
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  1014  		usb_gadget_clear_selfpowered(gadget);
5e5caf4fa8d303 Thinh Nguyen      2020-02-03  1015  
24ee47b2693b2d Elson Roy Serrao  2023-02-16 @1016  	if (USB_CONFIG_ATT_WAKEUP & c->bmAttributes)
24ee47b2693b2d Elson Roy Serrao  2023-02-16  1017  		usb_gadget_set_remote_wakeup(gadget, 1);
24ee47b2693b2d Elson Roy Serrao  2023-02-16  1018  	else
24ee47b2693b2d Elson Roy Serrao  2023-02-16  1019  		usb_gadget_set_remote_wakeup(gadget, 0);
24ee47b2693b2d Elson Roy Serrao  2023-02-16  1020  
40982be52d8f64 David Brownell    2008-06-19  1021  	usb_gadget_vbus_draw(gadget, power);
1b9ba000177ee4 Roger Quadros     2011-05-09  1022  	if (result >= 0 && cdev->delayed_status)
1b9ba000177ee4 Roger Quadros     2011-05-09  1023  		result = USB_GADGET_DELAYED_STATUS;
40982be52d8f64 David Brownell    2008-06-19  1024  	return result;
40982be52d8f64 David Brownell    2008-06-19  1025  }
40982be52d8f64 David Brownell    2008-06-19  1026  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
