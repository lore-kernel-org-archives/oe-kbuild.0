Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFBB1A701
	for <oe-kbuild@lists.linux.dev>; Wed,  3 Jan 2024 14:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WjLFuOMt"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-555144cd330so8166460a12.2
        for <oe-kbuild@lists.linux.dev>; Wed, 03 Jan 2024 06:13:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704291224; x=1704896024;
        h=dkim-signature:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cxeYb0u298UaaTT4nZSo8MoXVav2f8X856JuBDBSk18=;
        b=FiekxX3pDe8ajzwW3es3NGwj2AxPwwScOpPhyZhCw2y9Fl9+IRA7AST4P9OeHBtqBu
         7dNmkHoooUKUWdUvc+aaqMsBF3jS53OWe7PYXam4pYls6pHk/6gvN+WNaGhCBqFwbFOQ
         BRqfUw5Rl1ww91SUUt/zoYmHA+47MCXYbJ3TKQj4J4/6jEiiUTWGylb8fOAI0WS/dX9C
         v/ssn1BS5QxM66OreKidw8kX3L+0klk4PfayeRKvkm0qBXYM3gQQscVZuv0J0q/0I5mF
         /TMeyid6pyOr95cRA3U5O7En2VC/jq3GnM1LMk09fWz3bDNwQiCcuKY/owz5I7pvxDjd
         mO/A==
X-Gm-Message-State: AOJu0Yw/jZo5GkCF+A6lhm2UHUxxhm2fWnnWQAgl1K6nzJMJcyTz3dgr
	8oBKnnZceDkIPvn+k2/cfbhsks+yj72C4tHxYay/ILfKKnM=
X-Google-Smtp-Source: AGHT+IEHp9pEd14tNEVGesrI+bg4j+iSubkEhpxrhA6nzNRN64C5E/3lbJPzG57RX5zfG4JvDts53A==
X-Received: by 2002:a17:906:34d7:b0:a28:c9f:858d with SMTP id h23-20020a17090634d700b00a280c9f858dmr2224831ejb.136.1704291223980;
        Wed, 03 Jan 2024 06:13:43 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id t15-20020a170906178f00b00a28acfac149sm281453eje.53.2024.01.03.06.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 06:13:43 -0800 (PST)
Date: Wed, 3 Jan 2024 17:13:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] usbhid: fix array-index-out-of-bounds in usbhid_parse
 UBSAN warning
Message-ID: <aa07e3b8-6177-4702-aac8-e5833c06f01b@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received: from imap.gmail.com (142.251.168.109:993) by suswa with IMAP4-SSL
 getmail6 msgid:674269650/293152; 02 Jan 2024 07:03:44 -0000
Received: by 2002:a59:a487:0:b0:43e:252:38f8 with SMTP id s7csp2616495vqo;
 Mon, 25 Dec 2023 18:05:52 -0800 (PST)
X-Received: by 2002:a05:6214:dc1:b0:67f:2b7a:69ad with SMTP id
 1-20020a0562140dc100b0067f2b7a69admr8594873qvt.64.1703556352459;        Mon,
 25 Dec 2023 18:05:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703556352; cv=none;        d=google.com;
 s=arc-20160816;
 b=ndI/8urE5woOC8Azp8S4do0HJKkSf25TgmBs/c8dPuYzav1+VSLw3KwSyiM3JicMbw
 Fk4RpAvtGLDn2j0jzK8sGQiILsGuux3dBbcCxGd7jIaAtPKko4byqkYtk3N15ceT0ql4
 jNY1iNrQYL1WdTY0HFgbLj4Zi3EqQzdj6AdWIKQ3Ph+hcsxY0nhy/6Y6jx0jD5drQ1YY
 uTQWz3IhHu1TTcYT5fG583nwMbwSJ2n8EYz2OLGmLJVWAIWE3iorlclChtZKICgRmv6b
 t7clWb9UTc1gGJ3hRD1Z7Y/qRUeeOZZCsApv6spk5+FjtoXFcKij1rH/vr3aPbOVNjg0 Y5Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :dkim-signature; bh=6BO25nkY4BnF0LbZFosOVJMhIyhL90rAe3pz/LkX4Ew=;
 fh=STwU/6nAwSVI2oUzRWkoH/BhmoKW+LI2Ifd8kl7IM00=;
 b=WzgkDDX1AY7c27ZxD2wMdeGmvQzHZwvjZQGv1bQ8BjVM7XYpvj4b7AcaeryH7MG5+e
 fn5j+AhikSGksVVApvKwgY+mCHyt0mnfE7zGcUEzYDzSV0xt+nIqhX6K476oaraPpRNC
 3rV3WHFH8W4Vl2tD0ybxxycIBjYuvVg8G1R1HdI7RKnPDHu52ijJ9aYtxNzGVDc4iktd
 6LvG7kcK8bBpZLUFVdRiQF1PhMmLk16cJ85HMMFw+5tnkshP6ADetRL42KYnmwJLB/z7
 VJOwsLo+M+BxRxbFRIsapdml8CTkvgbsMtl2okXa8svwc8vkMA8vE8LVwinWCwgePGGL N8ww==
ARC-Authentication-Results: i=1; mx.google.com;       dkim=pass
 header.i=@intel.com header.s=Intel header.b=WjLFuOMt;       spf=pass
 (google.com: domain of lkp@intel.com designates 192.55.52.43 as permitted
 sender) smtp.mailfrom=lkp@intel.com;       dmarc=pass (p=NONE sp=NONE
 dis=NONE) header.from=intel.com
Received: from mgamail.intel.com (mgamail.intel.com. [192.55.52.43]) by
 mx.google.com with ESMTPS id
 d11-20020a0cf6cb000000b0067fd61f5a92si4594528qvo.265.2023.12.25.18.05.52 for
 <dan.carpenter@linaro.org>        (version=TLS1_2
 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);        Mon, 25 Dec 2023
 18:05:52 -0800 (PST)
Received-SPF: pass (google.com: domain of lkp@intel.com designates
 192.55.52.43 as permitted sender) client-ip=192.55.52.43;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;  d=intel.com;
 i=@intel.com; q=dns/txt; s=Intel;  t=1703556352; x=1735092352;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=89lWJV8K6iKgEjG1aX3ihslU5+MG15WeLNocexAey0I=;
 b=WjLFuOMtd941MuBoD8iEcEC6+Zl119nzNEN1pwevNUy7zXKHjCsCph4q
 TUjFBVeiU7u3Ih0sP5nNgRXe5kGxqQGdlBpdRUMnhk9fyPHCYCYIW+AjZ
 5KkxwMIXahdT06076xNZ28PM+kSg2hpF8/zVnc9AmavEqDLDkPXi7J0+5
 c+ehjvGq8uwxugWEARL9AuhymQYiN7yvZnCVGZVDNgLGb9dSsRX4pZQJT
 lp/Kux3GyIUMhXzx076IQBlb9xLcUcYm1wVT9N8j6ARnjp2/Alj9HIYzw
 jtRg4Fyh+gWNKiq/8Z9X7FbgwLoD3HgjqAwniTMngjAP1ktkqh6qeqfcE   A==;
Received: from orviesa001.jf.intel.com ([10.64.159.141])  by
 fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec
 2023 18:05:50 -0800
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe)
 ([10.239.97.151])  by orviesa001.jf.intel.com with ESMTP; 25 Dec 2023
 18:05:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96) (envelope-from
 <lkp@intel.com>) id 1rHwpG-000DsR-35; Tue, 26 Dec 2023 02:05:46 +0000

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <0000000000009ae37b060d32c643@google.com>
References: <0000000000009ae37b060d32c643@google.com>
TO: syzbot <syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>
TO: linux-kernel@vger.kernel.org
TO: syzkaller-bugs@googlegroups.com

Hi syzbot,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/syzbot/usbhid-fix-array-index-out-of-bounds-in-usbhid_parse-UBSAN-warning/20231225-153341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
patch link:    https://lore.kernel.org/r/0000000000009ae37b060d32c643%40google.com
patch subject: [PATCH] usbhid: fix array-index-out-of-bounds in usbhid_parse UBSAN warning
config: x86_64-randconfig-161-20231225 (https://download.01.org/0day-ci/archive/20231226/202312260900.gRDPofL9-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
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

Date: Tue, 26 Dec 2023 16:34:58 +0530
From: phanirajkiran <phanirajkiran.a@gmail.com>
To: 
Cc: phanirajkiran.a@gmail.com, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Prathu Baronia <prathubaronia2011@gmail.com>,
 Rob Herring <robh@kernel.org>, Uwe Kleine-König
 <u.kleine-koenig@pengutronix.de>, Yangtao Li <frank.li@vivo.com>, Khadija
 Kamran <kamrankhadijadj@gmail.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: fixes alignment should match open
 parenthesis
Message-Id: <20231226110459.6816-1-phanirajkiran.a@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8

This patch fixes the checks reported by checkpatch.pl
for alignment should match open parenthesis

Signed-off-by: phanirajkiran <phanirajkiran.a@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 727b956aa231..ab758a527261 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -381,8 +381,8 @@ static ssize_t axis_fifo_read(struct file *f, char __user *buf,
 		 */
 		mutex_lock(&fifo->read_lock);
 		ret = wait_event_interruptible_timeout(fifo->read_queue,
-			ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
-			read_timeout);
+						       ioread32(fifo->base_addr + XLLF_RDFO_OFFSET),
+						       read_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
@@ -522,9 +522,9 @@ static ssize_t axis_fifo_write(struct file *f, const char __user *buf,
 		 */
 		mutex_lock(&fifo->write_lock);
 		ret = wait_event_interruptible_timeout(fifo->write_queue,
-			ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
-				 >= words_to_write,
-			write_timeout);
+						       ioread32(fifo->base_addr + XLLF_TDFV_OFFSET)
+								>= words_to_write,
+						       write_timeout);
 
 		if (ret <= 0) {
 			if (ret == 0) {
-- 
2.17.1

