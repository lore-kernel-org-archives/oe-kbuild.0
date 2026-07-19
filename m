Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434F419DF4F
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Jul 2026 02:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784427929; cv=none; b=N+Mw9abxG8q2vMQUW7l/8EZqULr6IvfbBZFp4UwvLVbPBXVUSSxVGQdnxYI3Yplv8+hEHpkTJI51o4eS+mBf1h6mf+1oLyDwB94mel2tZ3glEzUz+L38g3eNsO18OIm8rAzoV/ADAN+3R30JHzqfju+iWlQGpBRAcbCzmjFnVxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784427929; c=relaxed/simple;
	bh=EO4kP6ShxLouy4WXBGWtX1VLy/pbQfrm4D0PK9M48bw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LQzvsRHbqnr+fnYw9HQK8fe2YDke6QSjK+M50cCQb8Q8Tzh/R+Rl0ZcMuRf+cXwaWprIjilfulAVgkmtkdTbXcOfsFzL3BlXb3Zabz6FftB5uasK29N7zNx1MUZJcMEXMw4etjoBX6/zsELCRrxmZuDr373BZHP9NeQNKAzZgPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P9E8MXuk; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P9E8MXuk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784427927; x=1815963927;
  h=date:from:to:cc:subject:message-id;
  bh=EO4kP6ShxLouy4WXBGWtX1VLy/pbQfrm4D0PK9M48bw=;
  b=P9E8MXukyOt5Xxl9IB0pl+02NscZcBEFniCOu7IHPJf+e6X7+pwM4P3z
   ntflJk3SBME19LlLtthlwV+7oNAiSpKv8dhcf5Gw5v7DOoAlXXnWd9mEd
   pZkTfAgvbDWhwEqSmY1LbR1kxLiBcg/yVB1IRk6Yg+sUR2tOBaEdSO/mx
   fGDPBFC6n/bmkPCqKnKZOb2D1HVZnuDNJlPaZVpYctC4PL58YKwf11aKm
   uEEpl3POA+V8i/4x1xlzyKF2wNKSrLoKt4L0EJXd5C2z2tNRQCIfgaVEG
   2uD2SwjdKfFeXLRsnoWNz6pemVAxd4i7wKAojN+PyM/P9Lmdarr/4xJ6L
   w==;
X-CSE-ConnectionGUID: Q8vY7MmTTJy09keESAolBw==
X-CSE-MsgGUID: p6mB4+8LQ2mpbhr5HskkMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="96185759"
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="96185759"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 19:25:26 -0700
X-CSE-ConnectionGUID: q4JlnrGLQ9SsHSJ192NzhA==
X-CSE-MsgGUID: lnpEc3YrTze1XuYx1NCsIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="257766902"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 18 Jul 2026 19:25:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlHDW-00000000VGw-1gaK;
	Sun, 19 Jul 2026 02:25:22 +0000
Date: Sun, 19 Jul 2026 10:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/usb/gadget/function/f_hid.c:1276 hidg_bind() warn: missing error code
 'status'
Message-ID: <202607191041.mUlJ0LSw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   2bfc8fe4015fcf2e39fc5989b95d20d6b5f7b566
commit: c6c0d13db5d0f8d465eabc14bd23d2b6a7247a43 [1/1] usb: gadget: f_hid: don't call cdev_init while cdev in use
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260719/202607191041.mUlJ0LSw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607191041.mUlJ0LSw-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/f_hid.c:1276 hidg_bind() warn: missing error code 'status'

vim +/status +1276 drivers/usb/gadget/function/f_hid.c

71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1161  
cb382536052fcc7 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1162  static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1163  {
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1164  	struct usb_ep		*ep;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1165  	struct f_hidg		*hidg = func_to_hidg(f);
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1166  	struct usb_string	*us;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1167  	int			status;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1168  
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1169  	hidg->get_req = usb_ep_alloc_request(c->cdev->gadget->ep0, GFP_ATOMIC);
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1170  	if (!hidg->get_req)
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1171  		return -ENOMEM;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1172  
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1173  	hidg->get_req->zero = 0;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1174  	hidg->get_req->complete = hidg_get_report_complete;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1175  	hidg->get_req->context = hidg;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1176  	hidg->get_report_returned = true;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1177  
cb382536052fcc7 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1178  	/* maybe allocate device-global string IDs, and patch descriptors */
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1179  	us = usb_gstrings_attach(c->cdev, ct_func_strings,
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1180  				 ARRAY_SIZE(ct_func_string_defs));
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1181  	if (IS_ERR(us))
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1182  		return PTR_ERR(us);
5ca8d3ec9970f47 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1183  	hidg_interface_desc.iInterface = us[CT_FUNC_HID_IDX].id;
cb382536052fcc7 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1184  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1185  	/* allocate instance-specific interface IDs, and patch descriptors */
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1186  	status = usb_interface_id(c, f);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1187  	if (status < 0)
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1188  		goto fail;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1189  	hidg_interface_desc.bInterfaceNumber = status;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1190  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1191  	/* allocate instance-specific endpoints */
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1192  	status = -ENODEV;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1193  	ep = usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_in_ep_desc);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1194  	if (!ep)
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1195  		goto fail;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1196  	hidg->in_ep = ep;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1197  
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1198  	hidg->out_ep = NULL;
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1199  	if (hidg->use_out_ep) {
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1200  		ep = usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_out_ep_desc);
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1201  		if (!ep)
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1202  			goto fail;
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1203  		hidg->out_ep = ep;
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1204  	}
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1205  
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1206  	/* used only if use_out_ep == 1 */
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1207  	hidg->set_report_buf = NULL;
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1208  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1209  	/* set descriptor dynamic values */
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1210  	hidg_interface_desc.bInterfaceSubClass = hidg->bInterfaceSubClass;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1211  	hidg_interface_desc.bInterfaceProtocol = hidg->bInterfaceProtocol;
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1212  	hidg_interface_desc.bNumEndpoints = hidg->use_out_ep ? 2 : 1;
b3c4ec71ec413c2 drivers/usb/gadget/function/f_hid.c Abdulhadi Mohamed         2017-07-19  1213  	hidg->protocol = HID_REPORT_PROTOCOL;
afcff6dc690e24d drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-07-21  1214  	hidg->idle = 1;
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1215  	hidg_ss_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1216  	hidg_ss_in_comp_desc.wBytesPerInterval =
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1217  				cpu_to_le16(hidg->report_length);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1218  	hidg_hs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1219  	hidg_fs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1220  	hidg_ss_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1221  	hidg_ss_out_comp_desc.wBytesPerInterval =
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1222  				cpu_to_le16(hidg->report_length);
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1223  	hidg_hs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1224  	hidg_fs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
f286d487e9283a4 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1225  	/*
f286d487e9283a4 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1226  	 * We can use hidg_desc struct here but we should not relay
f286d487e9283a4 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1227  	 * that its content won't change after returning from this function.
f286d487e9283a4 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1228  	 */
74388368927e9c5 drivers/usb/gadget/function/f_hid.c Terry Junge               2025-03-12  1229  	hidg_desc.rpt_desc.bDescriptorType = HID_DT_REPORT;
74388368927e9c5 drivers/usb/gadget/function/f_hid.c Terry Junge               2025-03-12  1230  	hidg_desc.rpt_desc.wDescriptorLength =
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1231  		cpu_to_le16(hidg->report_desc_length);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1232  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1233  	hidg_hs_in_ep_desc.bEndpointAddress =
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1234  		hidg_fs_in_ep_desc.bEndpointAddress;
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1235  	hidg_hs_out_ep_desc.bEndpointAddress =
99c515005857ff7 drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1236  		hidg_fs_out_ep_desc.bEndpointAddress;
10287baec761d33 drivers/usb/gadget/f_hid.c          Sebastian Andrzej Siewior 2012-10-22  1237  
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1238  	hidg_ss_in_ep_desc.bEndpointAddress =
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1239  		hidg_fs_in_ep_desc.bEndpointAddress;
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1240  	hidg_ss_out_ep_desc.bEndpointAddress =
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1241  		hidg_fs_out_ep_desc.bEndpointAddress;
dbf499cf720a009 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1242  
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1243  	if (hidg->use_out_ep)
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1244  		status = usb_assign_descriptors(f,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1245  			hidg_fs_descriptors_intout,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1246  			hidg_hs_descriptors_intout,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1247  			hidg_ss_descriptors_intout,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1248  			hidg_ss_descriptors_intout);
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1249  	else
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1250  		status = usb_assign_descriptors(f,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1251  			hidg_fs_descriptors_ssreport,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1252  			hidg_hs_descriptors_ssreport,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1253  			hidg_ss_descriptors_ssreport,
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1254  			hidg_ss_descriptors_ssreport);
d7428bc26fc7679 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1255  
10287baec761d33 drivers/usb/gadget/f_hid.c          Sebastian Andrzej Siewior 2012-10-22  1256  	if (status)
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1257  		goto fail;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1258  
749494b6bdbbaf0 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2017-01-24  1259  	hidg->write_pending = 1;
749494b6bdbbaf0 drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2017-01-24  1260  	hidg->req = NULL;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1261  
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1262  	INIT_WORK(&hidg->work, get_report_workqueue_handler);
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1263  	hidg->workqueue = alloc_workqueue("report_work",
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1264  					  WQ_FREEZABLE |
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1265  					  WQ_MEM_RECLAIM,
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1266  					  1);
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1267  
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1268  	if (!hidg->workqueue) {
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1269  		status = -ENOMEM;
0ab3ae768c48472 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1270  		goto fail_free_descs;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1271  	}
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1272  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1273  	/* create char device */
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1274  	hidg->cdev = cdev_alloc();
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1275  	if (!hidg->cdev)
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27 @1276  		goto fail_free_all;
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1277  	hidg->cdev->ops = &f_hidg_fops;
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1278  
c6c0d13db5d0f8d drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1279  	status = cdev_device_add(hidg->cdev, &hidg->dev);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1280  	if (status)
0ab3ae768c48472 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1281  		goto fail_free_all;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1282  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1283  	return 0;
0ab3ae768c48472 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1284  fail_free_all:
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1285  	destroy_workqueue(hidg->workqueue);
0ab3ae768c48472 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1286  fail_free_descs:
d12a8727171c770 drivers/usb/gadget/function/f_hid.c Pavitrakumar Managutte    2014-10-22  1287  	usb_free_all_descriptors(f);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1288  fail:
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1289  	ERROR(f->config->cdev, "hidg_bind FAILED\n");
14794d7133d0f16 drivers/usb/gadget/function/f_hid.c Felipe F. Tonello         2016-08-23  1290  	if (hidg->req != NULL)
14794d7133d0f16 drivers/usb/gadget/function/f_hid.c Felipe F. Tonello         2016-08-23  1291  		free_ep_req(hidg->in_ep, hidg->req);
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1292  
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1293  	usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req);
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1294  	hidg->get_req = NULL;
a139c98f760efa1 drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1295  
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1296  	return status;
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1297  }
71adf1189469578 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1298  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
