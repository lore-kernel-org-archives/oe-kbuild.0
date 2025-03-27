Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEE6186A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Mar 2025 10:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743073030; cv=none; b=AIhjQRtntLdSt74/FMu2Z5vak7FWlg1Tb+stKWlhqJrx9whNpWceeI3rsLD6MwpbtUD8dL6S7JGmSI1US+D5IxftWalXSSiQ9OuOjLPRTw47gJNSXVU/k5pu6DkPyWNOBOMTlAqdj2cJihv8g2vTZfbnIHRuRQ6Yrn112RnqVok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743073030; c=relaxed/simple;
	bh=U6Wl8RTXa4sRMnFTnEP2ZExcbfFf2HH1ITBwhU1PHUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lBLeWdCMDzRdck+orLfPiqrSnLLo9D/WYmInekG4NMVvojC9v1eTc4yJjbZ5KfKGxml5O5a2xU7RpkrbG2RsHlRmXzY3PzCQJgg563IvZvUOFiPjS4uHb4ojl4pp1U6NyVh29qXLh4BkJK6B2DlCCCAbVgrRr6z4aVplC4CqWC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6juW/ox; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6juW/ox"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743073029; x=1774609029;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U6Wl8RTXa4sRMnFTnEP2ZExcbfFf2HH1ITBwhU1PHUU=;
  b=D6juW/oxbig+99kEwpoE8a7zg/UybPj38d3+BVzwcaBHAzX4aOVwBtPU
   jWAn805flV6LaOxUo2hA6OG97IDn1GdcD7giTTdX+Wq3qVv3Ix6kqnQZ8
   Aja0FkD9widYf0Y/+FSs6jToSYcaDCItHyo1+DxY7UHTPoWX2MATad65e
   V53kkjpvILgHCVli96xjD90qzusA1dTkSEXGzB7xV5xp9MsauI08trB3x
   toj6KEXQ8GApiDORGKh9ly578u1LZCIXl9xVd7onB1vK3bSGSHypSLCea
   dPnhLPKrdFbAf8ek+LvvNW4gVH56xb8+E68h8AiBATMErXEnLS0BUR4ud
   g==;
X-CSE-ConnectionGUID: 1UVkp4UNRfe4qknpx0oIGg==
X-CSE-MsgGUID: fRPdv94pS5iXsnBz0arV+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44287100"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="44287100"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 03:57:08 -0700
X-CSE-ConnectionGUID: o5KqLEviT7OnYhRnHawbLQ==
X-CSE-MsgGUID: gnJDpgXTQuaizu9HePCQPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; 
   d="scan'208";a="125620954"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 27 Mar 2025 03:57:07 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txkv2-0006bV-1r;
	Thu, 27 Mar 2025 10:57:04 +0000
Date: Thu, 27 Mar 2025 18:56:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-6.6 2060/2060] drivers/hid/hid-thrustmaster.c:178
 thrustmaster_interrupts() warn: possible memory leak of 'send_buf'
Message-ID: <202503271832.WycjTkRa-lkp@intel.com>
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
TO: kernel@openeuler.org

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b28aab59b06935f0d1c9bce8f013f25b4094764d
commit: 477cfc70d964fafd811f91a889f14c356f937b8e [2060/2060] HID: hid-thrustmaster: Fix warning in thrustmaster_probe by adding endpoint check
:::::: branch date: 9 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20250326 (https://download.01.org/0day-ci/archive/20250327/202503271832.WycjTkRa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503271832.WycjTkRa-lkp@intel.com/

smatch warnings:
drivers/hid/hid-thrustmaster.c:178 thrustmaster_interrupts() warn: possible memory leak of 'send_buf'

vim +/send_buf +178 drivers/hid/hid-thrustmaster.c

c49c33637802a2 Dario Pagani     2021-01-31  144  
e9bb37ff35bb6f Lee Jones        2021-03-26  145  /*
c49c33637802a2 Dario Pagani     2021-01-31  146   * On some setups initializing the T300RS crashes the kernel,
c49c33637802a2 Dario Pagani     2021-01-31  147   * these interrupts fix that particular issue. So far they haven't caused any
c49c33637802a2 Dario Pagani     2021-01-31  148   * adverse effects in other wheels.
c49c33637802a2 Dario Pagani     2021-01-31  149   */
c49c33637802a2 Dario Pagani     2021-01-31  150  static void thrustmaster_interrupts(struct hid_device *hdev)
c49c33637802a2 Dario Pagani     2021-01-31  151  {
c49c33637802a2 Dario Pagani     2021-01-31  152  	int ret, trans, i, b_ep;
c49c33637802a2 Dario Pagani     2021-01-31  153  	u8 *send_buf = kmalloc(256, GFP_KERNEL);
c49c33637802a2 Dario Pagani     2021-01-31  154  	struct usb_host_endpoint *ep;
c49c33637802a2 Dario Pagani     2021-01-31  155  	struct device *dev = &hdev->dev;
c49c33637802a2 Dario Pagani     2021-01-31  156  	struct usb_interface *usbif = to_usb_interface(dev->parent);
c49c33637802a2 Dario Pagani     2021-01-31  157  	struct usb_device *usbdev = interface_to_usbdev(usbif);
c49c33637802a2 Dario Pagani     2021-01-31  158  
c49c33637802a2 Dario Pagani     2021-01-31  159  	if (!send_buf) {
c49c33637802a2 Dario Pagani     2021-01-31  160  		hid_err(hdev, "failed allocating send buffer\n");
c49c33637802a2 Dario Pagani     2021-01-31  161  		return;
c49c33637802a2 Dario Pagani     2021-01-31  162  	}
c49c33637802a2 Dario Pagani     2021-01-31  163  
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  164  	if (usbif->cur_altsetting->desc.bNumEndpoints < 2) {
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  165  		kfree(send_buf);
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  166  		hid_err(hdev, "Wrong number of endpoints?\n");
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  167  		return;
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  168  	}
fc3ef2e3297b3c Pavel Skripkin   2022-02-20  169  
c49c33637802a2 Dario Pagani     2021-01-31  170  	ep = &usbif->cur_altsetting->endpoint[1];
c49c33637802a2 Dario Pagani     2021-01-31  171  	b_ep = ep->desc.bEndpointAddress;
c49c33637802a2 Dario Pagani     2021-01-31  172  
477cfc70d964fa Karol Przybylski 2024-12-05  173  	/* Are the expected endpoints present? */
477cfc70d964fa Karol Przybylski 2024-12-05  174  	u8 ep_addr[1] = {b_ep};
477cfc70d964fa Karol Przybylski 2024-12-05  175  
477cfc70d964fa Karol Przybylski 2024-12-05  176  	if (!usb_check_int_endpoints(usbif, ep_addr)) {
477cfc70d964fa Karol Przybylski 2024-12-05  177  		hid_err(hdev, "Unexpected non-int endpoint\n");
477cfc70d964fa Karol Przybylski 2024-12-05 @178  		return;
477cfc70d964fa Karol Przybylski 2024-12-05  179  	}
477cfc70d964fa Karol Przybylski 2024-12-05  180  
c49c33637802a2 Dario Pagani     2021-01-31  181  	for (i = 0; i < ARRAY_SIZE(setup_arr); ++i) {
c49c33637802a2 Dario Pagani     2021-01-31  182  		memcpy(send_buf, setup_arr[i], setup_arr_sizes[i]);
c49c33637802a2 Dario Pagani     2021-01-31  183  
c49c33637802a2 Dario Pagani     2021-01-31  184  		ret = usb_interrupt_msg(usbdev,
c49c33637802a2 Dario Pagani     2021-01-31  185  			usb_sndintpipe(usbdev, b_ep),
c49c33637802a2 Dario Pagani     2021-01-31  186  			send_buf,
c49c33637802a2 Dario Pagani     2021-01-31  187  			setup_arr_sizes[i],
c49c33637802a2 Dario Pagani     2021-01-31  188  			&trans,
c49c33637802a2 Dario Pagani     2021-01-31  189  			USB_CTRL_SET_TIMEOUT);
c49c33637802a2 Dario Pagani     2021-01-31  190  
c49c33637802a2 Dario Pagani     2021-01-31  191  		if (ret) {
c49c33637802a2 Dario Pagani     2021-01-31  192  			hid_err(hdev, "setup data couldn't be sent\n");
c3800eed22d21c Evgeny Novikov   2021-07-30  193  			kfree(send_buf);
c49c33637802a2 Dario Pagani     2021-01-31  194  			return;
c49c33637802a2 Dario Pagani     2021-01-31  195  		}
c49c33637802a2 Dario Pagani     2021-01-31  196  	}
c49c33637802a2 Dario Pagani     2021-01-31  197  
c49c33637802a2 Dario Pagani     2021-01-31  198  	kfree(send_buf);
c49c33637802a2 Dario Pagani     2021-01-31  199  }
c49c33637802a2 Dario Pagani     2021-01-31  200  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
