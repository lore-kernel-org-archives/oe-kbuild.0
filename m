Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675543;
	b=Chnw+6uZfCnM1rKRbkbY86IBC4FPwwFaCcKHAZepvu/ZiV8xZHHeQowD8bfchN4oHpre
	 ye+Dp2sP0SmmuwqGEV8Glumdt4n6yXJfP4v3GPR5nqpgb165WzDG2aX5KV7IVy5Cezbfo
	 vxiKWpivxXimIaofRb/04kMwG1NQ0e27gwbBvBXXc0An96+eQFKa6Zz4pygWHkzKKcflx
	 JdHUcU5VUXj+8f7ZUkjvD6wSabrfNbWgVs0ffz/7aAwbZx9VYNGwnZ46f/MbhB5/RlboV
	 qn2+f1o2NZERvigxx+MBTMTMf1RjnRpayYhJugN4r0ZWoCh9/HUqM7bhB13Z+y+038g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675543;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sKrEM2rxH3uREb6BdhhE4B2e/CNMC0YsEirTfR8M00s=;
	b=ydi+/phTWA316y/EvWc92LtHWqoJwM9hrv2JjqK1oGZ96QEIk2G2B879PCA9cpakOZTt
	 UaDf+b2pf4kit7y+RedM+brhv9wIoFC6A/a3tbQncqC1GRYW+0RPlYeWBGKfwOpj5C+Pz
	 TDtueah3Y1iYzAl43aXiqAarO7hhfN/cmL3GMtxKBoua5RTkI8HX53K/3mQt5xmjvfZCw
	 QRhrqALXNczGAdyvbbZG59ofU7BDbQKQCWeQVl2OBvJg6LyJAbuFHoA58oJTWRMa0I2Jj
	 V+s7geFdqGX3u/67T83PlXFiJ8EQz2wvVNwLFsS18ogYveq9tE6Q+WHEak3p8Ie/NCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FgCxfTXM;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6687606A327
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 16:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6687606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FgCxfTXM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794675542; x=1826211542;
  h=date:from:to:cc:subject:message-id;
  bh=uwz1qa/MW8jgIoqCRUBQCAGrYdh57vvzKu2vbm+mCgo=;
  b=FgCxfTXMSH5lOrp6GpHzsHSMcD3pEqHeTd74vx7UBZDAggXR067WivCW
   +lU5ZZm2kOGXEqyH6Y93tT8sEZ/cTFmHXfPFdbwqn+ijD3Jv8ogEzwjPG
   cbI/hTo1QMn4F+MBlxoQgLwIOP+bN/U9j8s5H4xqFTqR6lWt+VESyD06X
   S75mhsJqbyiacqwrMnLHCIhIQwABHxidv9kMjKMiLdretTB/uafpVNTWt
   Gzj1eK34t/kMsfbuCrnhb0toiNojvqLMv7J4D4kvf4pgJIXnuZYblRUa5
   xT2FdifnVEOB+/VT8/4LVTEwqWJxX1I5qcKfrWDuxzmeaSUHJYtstDjSi
   w==;
X-CSE-ConnectionGUID: 01Eu6IUPQge36vfOpLtCtA==
X-CSE-MsgGUID: j/x+60uWRq6AhhqDG2g5Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3496168"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3496168"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 08:59:01 -0800
X-CSE-ConnectionGUID: JaeuDJh3QI61cedWtGYYsQ==
X-CSE-MsgGUID: LmO+/h4HRZiPICUrewmZ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9186260"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 14 Nov 2026 08:59:01 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSH5e-000000001pN-1JlK;
	Sat, 14 Nov 2026 16:58:58 +0000
Date: Sat, 14 Nov 2026 17:58:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android16-6.12 1/1]
 drivers/usb/gadget/function/f_hid.c:1276 hidg_bind() warn: missing error code
 'status'
Message-ID: <202611141744.L7RBYVUc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   793c58ba801e0ec6ed0c3b71d1a1f091a42d299c
commit: c6c0d13db5d0f8d465eabc14bd23d2b6a7247a43 [1/1] usb: gadget: f_hid: don't call cdev_init while cdev in use
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261114/202611141744.L7RBYVUc-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611141744.L7RBYVUc-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/f_hid.c:1276 hidg_bind() warn: missing error code 'status'

vim +/status +1276 drivers/usb/gadget/function/f_hid.c

71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1161  
cb382536052fcc drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1162  static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1163  {
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1164  	struct usb_ep		*ep;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1165  	struct f_hidg		*hidg = func_to_hidg(f);
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1166  	struct usb_string	*us;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1167  	int			status;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1168  
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1169  	hidg->get_req = usb_ep_alloc_request(c->cdev->gadget->ep0, GFP_ATOMIC);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1170  	if (!hidg->get_req)
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1171  		return -ENOMEM;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1172  
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1173  	hidg->get_req->zero = 0;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1174  	hidg->get_req->complete = hidg_get_report_complete;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1175  	hidg->get_req->context = hidg;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1176  	hidg->get_report_returned = true;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1177  
cb382536052fcc drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1178  	/* maybe allocate device-global string IDs, and patch descriptors */
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1179  	us = usb_gstrings_attach(c->cdev, ct_func_strings,
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1180  				 ARRAY_SIZE(ct_func_string_defs));
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1181  	if (IS_ERR(us))
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1182  		return PTR_ERR(us);
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1183  	hidg_interface_desc.iInterface = us[CT_FUNC_HID_IDX].id;
cb382536052fcc drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz     2014-11-06  1184  
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1185  	/* allocate instance-specific interface IDs, and patch descriptors */
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1186  	status = usb_interface_id(c, f);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1187  	if (status < 0)
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1188  		goto fail;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1189  	hidg_interface_desc.bInterfaceNumber = status;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1190  
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1191  	/* allocate instance-specific endpoints */
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1192  	status = -ENODEV;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1193  	ep = usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_in_ep_desc);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1194  	if (!ep)
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1195  		goto fail;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1196  	hidg->in_ep = ep;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1197  
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1198  	hidg->out_ep = NULL;
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1199  	if (hidg->use_out_ep) {
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1200  		ep = usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_out_ep_desc);
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1201  		if (!ep)
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1202  			goto fail;
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1203  		hidg->out_ep = ep;
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1204  	}
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1205  
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1206  	/* used only if use_out_ep == 1 */
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1207  	hidg->set_report_buf = NULL;
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1208  
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1209  	/* set descriptor dynamic values */
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1210  	hidg_interface_desc.bInterfaceSubClass = hidg->bInterfaceSubClass;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1211  	hidg_interface_desc.bInterfaceProtocol = hidg->bInterfaceProtocol;
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1212  	hidg_interface_desc.bNumEndpoints = hidg->use_out_ep ? 2 : 1;
b3c4ec71ec413c drivers/usb/gadget/function/f_hid.c Abdulhadi Mohamed         2017-07-19  1213  	hidg->protocol = HID_REPORT_PROTOCOL;
afcff6dc690e24 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-07-21  1214  	hidg->idle = 1;
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1215  	hidg_ss_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1216  	hidg_ss_in_comp_desc.wBytesPerInterval =
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1217  				cpu_to_le16(hidg->report_length);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1218  	hidg_hs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1219  	hidg_fs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1220  	hidg_ss_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1221  	hidg_ss_out_comp_desc.wBytesPerInterval =
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1222  				cpu_to_le16(hidg->report_length);
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1223  	hidg_hs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1224  	hidg_fs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
f286d487e9283a drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1225  	/*
f286d487e9283a drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1226  	 * We can use hidg_desc struct here but we should not relay
f286d487e9283a drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1227  	 * that its content won't change after returning from this function.
f286d487e9283a drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2015-03-27  1228  	 */
74388368927e9c drivers/usb/gadget/function/f_hid.c Terry Junge               2025-03-12  1229  	hidg_desc.rpt_desc.bDescriptorType = HID_DT_REPORT;
74388368927e9c drivers/usb/gadget/function/f_hid.c Terry Junge               2025-03-12  1230  	hidg_desc.rpt_desc.wDescriptorLength =
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1231  		cpu_to_le16(hidg->report_desc_length);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1232  
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1233  	hidg_hs_in_ep_desc.bEndpointAddress =
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1234  		hidg_fs_in_ep_desc.bEndpointAddress;
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1235  	hidg_hs_out_ep_desc.bEndpointAddress =
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack               2012-06-13  1236  		hidg_fs_out_ep_desc.bEndpointAddress;
10287baec761d3 drivers/usb/gadget/f_hid.c          Sebastian Andrzej Siewior 2012-10-22  1237  
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1238  	hidg_ss_in_ep_desc.bEndpointAddress =
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1239  		hidg_fs_in_ep_desc.bEndpointAddress;
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1240  	hidg_ss_out_ep_desc.bEndpointAddress =
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1241  		hidg_fs_out_ep_desc.bEndpointAddress;
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic           2016-11-03  1242  
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1243  	if (hidg->use_out_ep)
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1244  		status = usb_assign_descriptors(f,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1245  			hidg_fs_descriptors_intout,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1246  			hidg_hs_descriptors_intout,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1247  			hidg_ss_descriptors_intout,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1248  			hidg_ss_descriptors_intout);
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1249  	else
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1250  		status = usb_assign_descriptors(f,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1251  			hidg_fs_descriptors_ssreport,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1252  			hidg_hs_descriptors_ssreport,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1253  			hidg_ss_descriptors_ssreport,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1254  			hidg_ss_descriptors_ssreport);
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev              2021-08-21  1255  
10287baec761d3 drivers/usb/gadget/f_hid.c          Sebastian Andrzej Siewior 2012-10-22  1256  	if (status)
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1257  		goto fail;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1258  
749494b6bdbbaf drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2017-01-24  1259  	hidg->write_pending = 1;
749494b6bdbbaf drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak         2017-01-24  1260  	hidg->req = NULL;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1261  
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1262  	INIT_WORK(&hidg->work, get_report_workqueue_handler);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1263  	hidg->workqueue = alloc_workqueue("report_work",
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1264  					  WQ_FREEZABLE |
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1265  					  WQ_MEM_RECLAIM,
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1266  					  1);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1267  
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1268  	if (!hidg->workqueue) {
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1269  		status = -ENOMEM;
0ab3ae768c4847 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1270  		goto fail_free_descs;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1271  	}
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1272  
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1273  	/* create char device */
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1274  	hidg->cdev = cdev_alloc();
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1275  	if (!hidg->cdev)
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27 @1276  		goto fail_free_all;
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1277  	hidg->cdev->ops = &f_hidg_fops;
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1278  
c6c0d13db5d0f8 drivers/usb/gadget/function/f_hid.c Michael Zimmermann        2026-03-27  1279  	status = cdev_device_add(hidg->cdev, &hidg->dev);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1280  	if (status)
0ab3ae768c4847 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1281  		goto fail_free_all;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1282  
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1283  	return 0;
0ab3ae768c4847 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1284  fail_free_all:
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1285  	destroy_workqueue(hidg->workqueue);
0ab3ae768c4847 drivers/usb/gadget/function/f_hid.c Yuhao Jiang               2025-06-23  1286  fail_free_descs:
d12a8727171c77 drivers/usb/gadget/function/f_hid.c Pavitrakumar Managutte    2014-10-22  1287  	usb_free_all_descriptors(f);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1288  fail:
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1289  	ERROR(f->config->cdev, "hidg_bind FAILED\n");
14794d7133d0f1 drivers/usb/gadget/function/f_hid.c Felipe F. Tonello         2016-08-23  1290  	if (hidg->req != NULL)
14794d7133d0f1 drivers/usb/gadget/function/f_hid.c Felipe F. Tonello         2016-08-23  1291  		free_ep_req(hidg->in_ep, hidg->req);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1292  
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1293  	usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_req);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1294  	hidg->get_req = NULL;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff               2024-08-17  1295  
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1296  	return status;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1297  }
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau           2010-04-08  1298  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
