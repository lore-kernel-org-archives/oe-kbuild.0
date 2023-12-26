Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148ACA29
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Dec 2023 02:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjLFuOMt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703556352; x=1735092352;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=89lWJV8K6iKgEjG1aX3ihslU5+MG15WeLNocexAey0I=;
  b=WjLFuOMtd941MuBoD8iEcEC6+Zl119nzNEN1pwevNUy7zXKHjCsCph4q
   TUjFBVeiU7u3Ih0sP5nNgRXe5kGxqQGdlBpdRUMnhk9fyPHCYCYIW+AjZ
   5KkxwMIXahdT06076xNZ28PM+kSg2hpF8/zVnc9AmavEqDLDkPXi7J0+5
   c+ehjvGq8uwxugWEARL9AuhymQYiN7yvZnCVGZVDNgLGb9dSsRX4pZQJT
   lp/Kux3GyIUMhXzx076IQBlb9xLcUcYm1wVT9N8j6ARnjp2/Alj9HIYzw
   jtRg4Fyh+gWNKiq/8Z9X7FbgwLoD3HgjqAwniTMngjAP1ktkqh6qeqfcE
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="482491109"
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="482491109"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2023 18:05:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,304,1695711600"; 
   d="scan'208";a="26172474"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 25 Dec 2023 18:05:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rHwpG-000DsR-35;
	Tue, 26 Dec 2023 02:05:46 +0000
Date: Tue, 26 Dec 2023 10:05:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] usbhid: fix array-index-out-of-bounds in usbhid_parse
 UBSAN warning
Message-ID: <202312260900.gRDPofL9-lkp@intel.com>
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
In-Reply-To: <0000000000009ae37b060d32c643@google.com>
References: <0000000000009ae37b060d32c643@google.com>
TO: syzbot <syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>
TO: linux-kernel@vger.kernel.org
TO: syzkaller-bugs@googlegroups.com

Hi syzbot,

kernel test robot noticed the following build warnings:

[auto build test WARNING on hid/for-next]
[also build test WARNING on linus/master v6.7-rc7 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/syzbot/usbhid-fix-array-index-out-of-bounds-in-usbhid_parse-UBSAN-warning/20231225-153341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/0000000000009ae37b060d32c643%40google.com
patch subject: [PATCH] usbhid: fix array-index-out-of-bounds in usbhid_parse UBSAN warning
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20231225 (https://download.01.org/0day-ci/archive/20231226/202312260900.gRDPofL9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312260900.gRDPofL9-lkp@intel.com/

smatch warnings:
drivers/hid/usbhid/hid-core.c:1026 usbhid_parse() warn: curly braces intended?
drivers/hid/usbhid/hid-core.c:1029 usbhid_parse() warn: inconsistent indenting

vim +1026 drivers/hid/usbhid/hid-core.c

^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16   978  
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16   979  static int usbhid_parse(struct hid_device *hid)
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16   980  {
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16   981  	struct usb_interface *intf = to_usb_interface(hid->dev.parent);
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16   982  	struct usb_host_interface *interface = intf->cur_altsetting;
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16   983  	struct usb_device *dev = interface_to_usbdev (intf);
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16   984  	struct hid_descriptor *hdesc;
2eb5dc30eb87aa drivers/hid/usbhid/hid-core.c Paul Walmsley      2007-04-19   985  	u32 quirks = 0;
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16   986  	unsigned int rsize = 0;
c5b7c7c395a34f drivers/usb/input/hid-core.c  Dmitry Torokhov    2005-09-15   987  	char *rdesc;
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16   988  	int ret, n;
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28   989  	int num_descriptors;
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28   990  	size_t offset = offsetof(struct hid_descriptor, desc);
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16   991  
d5d3e202753cc0 drivers/hid/usbhid/hid-core.c Benjamin Tissoires 2017-11-20   992  	quirks = hid_lookup_quirk(hid);
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16   993  
6f4303fb2ec680 drivers/hid/usbhid/hid-core.c Jiri Kosina        2009-01-29   994  	if (quirks & HID_QUIRK_IGNORE)
6f4303fb2ec680 drivers/hid/usbhid/hid-core.c Jiri Kosina        2009-01-29   995  		return -ENODEV;
6f4303fb2ec680 drivers/hid/usbhid/hid-core.c Jiri Kosina        2009-01-29   996  
0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-15   997  	/* Many keyboards and mice don't like to be polled for reports,
0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-15   998  	 * so we will always set the HID_QUIRK_NOGET flag for them. */
0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-15   999  	if (interface->desc.bInterfaceSubClass == USB_INTERFACE_SUBCLASS_BOOT) {
0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-15  1000  		if (interface->desc.bInterfaceProtocol == USB_INTERFACE_PROTOCOL_KEYBOARD ||
0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-15  1001  			interface->desc.bInterfaceProtocol == USB_INTERFACE_PROTOCOL_MOUSE)
0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-15  1002  				quirks |= HID_QUIRK_NOGET;
0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-15  1003  	}
0f28b55db54300 drivers/usb/input/hid-core.c  Alan Stern         2006-05-15  1004  
c5b7c7c395a34f drivers/usb/input/hid-core.c  Dmitry Torokhov    2005-09-15  1005  	if (usb_get_extra_descriptor(interface, HID_DT_HID, &hdesc) &&
c5b7c7c395a34f drivers/usb/input/hid-core.c  Dmitry Torokhov    2005-09-15  1006  	    (!interface->desc.bNumEndpoints ||
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1007  	     usb_get_extra_descriptor(&interface->endpoint[0], HID_DT_HID, &hdesc))) {
58037eb961f859 drivers/hid/usbhid/hid-core.c Jiri Kosina        2007-05-30  1008  		dbg_hid("class descriptor not present\n");
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1009  		return -ENODEV;
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1010  	}
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1011  
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28  1012  	if (hdesc->bLength < sizeof(struct hid_descriptor)) {
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28  1013  		dbg_hid("hid descriptor is too short\n");
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28  1014  		return -EINVAL;
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28  1015  	}
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28  1016  
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1017  	hid->version = le16_to_cpu(hdesc->bcdHID);
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1018  	hid->country = hdesc->bCountryCode;
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1019  
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28  1020  	num_descriptors = min_t(int, hdesc->bNumDescriptors,
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28  1021  	       (hdesc->bLength - offset) / sizeof(struct hid_class_descriptor));
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28  1022  
f043bfc98c193c drivers/hid/usbhid/hid-core.c Jaejoong Kim       2017-09-28  1023  	for (n = 0; n < num_descriptors; n++)
d3e0d5b253c73b drivers/hid/usbhid/hid-core.c syzbot             2023-12-23  1024  		if (n >= ARRAY_SIZE(hdesc->desc))
d3e0d5b253c73b drivers/hid/usbhid/hid-core.c syzbot             2023-12-23  1025  			break;
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16 @1026  		if (hdesc->desc[n].bDescriptorType == HID_DT_REPORT)
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1027  			rsize = le16_to_cpu(hdesc->desc[n].wDescriptorLength);
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1028  
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16 @1029  	if (!rsize || rsize > HID_MAX_DESCRIPTOR_SIZE) {
58037eb961f859 drivers/hid/usbhid/hid-core.c Jiri Kosina        2007-05-30  1030  		dbg_hid("weird size of report descriptor (%u)\n", rsize);
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1031  		return -EINVAL;
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1032  	}
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1033  
52150c78270db5 drivers/hid/usbhid/hid-core.c Joe Perches        2017-03-01  1034  	rdesc = kmalloc(rsize, GFP_KERNEL);
52150c78270db5 drivers/hid/usbhid/hid-core.c Joe Perches        2017-03-01  1035  	if (!rdesc)
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1036  		return -ENOMEM;
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1037  
854561b019285a drivers/usb/input/hid-core.c  Vojtech Pavlik     2005-05-29  1038  	hid_set_idle(dev, interface->desc.bInterfaceNumber, 0, 0);
854561b019285a drivers/usb/input/hid-core.c  Vojtech Pavlik     2005-05-29  1039  
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1040  	ret = hid_get_class_descriptor(dev, interface->desc.bInterfaceNumber,
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1041  			HID_DT_REPORT, rdesc, rsize);
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1042  	if (ret < 0) {
58037eb961f859 drivers/hid/usbhid/hid-core.c Jiri Kosina        2007-05-30  1043  		dbg_hid("reading report descriptor failed\n");
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1044  		kfree(rdesc);
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1045  		goto err;
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1046  	}
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1047  
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1048  	ret = hid_parse_report(hid, rdesc, rsize);
85cdaf524b7dda drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1049  	kfree(rdesc);
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1050  	if (ret) {
58037eb961f859 drivers/hid/usbhid/hid-core.c Jiri Kosina        2007-05-30  1051  		dbg_hid("parsing report descriptor failed\n");
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1052  		goto err;
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1053  	}
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1054  
f5208997087e6e drivers/hid/usbhid/hid-core.c Zoltan Karcagi     2009-05-06  1055  	hid->quirks |= quirks;
^1da177e4c3f41 drivers/usb/input/hid-core.c  Linus Torvalds     2005-04-16  1056  
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1057  	return 0;
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1058  err:
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1059  	return ret;
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1060  }
c500c9714011ed drivers/hid/usbhid/hid-core.c Jiri Slaby         2008-05-16  1061  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
