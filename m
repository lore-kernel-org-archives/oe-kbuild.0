Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9388937C110
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205667; cv=none; b=SeEJNdSP8cTOYhEyjRaHQHkg2hGA5XUD0+zDad+mw3AjvbAlKJVJXratFH9VqUsd+SV5053J75pu9h9fKjxjnJgBK+I3wchRbZugOPeSigBZ8f67SyClhupEw0qLeLOXTxQwuDoFnKydu42n0LKkhLeo3+YDDnCXTRBxoKRWNpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205667; c=relaxed/simple;
	bh=2MBwrI2Lvp247f8pxUvJjnSBE6+w8t1n2mwvlWmhiSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=rMFPfhQ791FAX2nhrMHOd00q7B59m4qHiuhohHYNzpizFLOTBdiqgJ96uqHi+F0RIcKNQ+asQXCci86O16r87tLc77Ksauizh1OZjRbJmlCPKe68lNzFytj13Zjhw3+nHWdM+expVznRLY3Jcaj8vzn1n3QA4VzH1X0TY+tH10o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WafovE7Q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WafovE7Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205666; x=1806741666;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2MBwrI2Lvp247f8pxUvJjnSBE6+w8t1n2mwvlWmhiSY=;
  b=WafovE7Q6kP4fS3szlMdhycTD5RXelMojTrVL9e+8t3MPh0SA+Fj8uNp
   YtO2MozMqhj6sbhDdqKY1iUZegMRdfJ83oYLWk89+FndU+O/bxij/Y6a5
   MSs+TnCx6/I/BsI1E7SmrtIj92aAqMjuF4h9qKp7jvH/AtkPIILK/PjVv
   EMm394C/tG6anfoenUIg87sSEMrP9UWCUr5AJL4+gNQE8qsDxjYLtbUaa
   H1gpEfMt2ThiY3aUQv9PLBrq4u9oMUNOKzYMApvdS+fJHrpSthG6XqpGg
   Ylf3c5pl+BLK+3gcVGUlaIZhyJ42RPPmb5IxXjKHQSIpv+7doUSzVI1qM
   g==;
X-CSE-ConnectionGUID: 60Toz529S9uGHQuEtpbvmg==
X-CSE-MsgGUID: NxhzP9CFTIGnHkSD+eal2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="76156641"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="76156641"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:41:00 -0700
X-CSE-ConnectionGUID: 4lI9Rv9WRxi/xiEJxWMvtw==
X-CSE-MsgGUID: f1haIki1R9246Qqf4xP5hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="224370768"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Apr 2026 01:40:56 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a5G-0000000012a-25sI;
	Fri, 03 Apr 2026 08:40:54 +0000
Date: Fri, 03 Apr 2026 16:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [usb:usb-testing 61/66]
 drivers/usb/gadget/function/f_hid.c:1291 hidg_bind() warn: missing error code
 'status'
Message-ID: <202604022131.fEHaGZ7Q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-usb@vger.kernel.org
TO: Michael Zimmermann <sigmaepsilon92@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-=
testing
head:   74a2287209a858470d15e2996ead2337bd293ff4
commit: 81ebd43cc0d6d106ce7b6ccbf7b5e40ca7f5503d [61/66] usb: gadget: f_hid=
: don't call cdev_init while cdev in use
:::::: branch date: 5 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20260402 (https://download.01.org/0day-ci/archi=
ve/20260402/202604022131.fEHaGZ7Q-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604022131.fEHaGZ7Q-lkp@intel.com/

smatch warnings:
drivers/usb/gadget/function/f_hid.c:1291 hidg_bind() warn: missing error co=
de 'status'

vim +/status +1291 drivers/usb/gadget/function/f_hid.c

71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1146 =20
cb382536052fcc drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz   =
  2014-11-06  1147  static int hidg_bind(struct usb_configuration *c, struc=
t usb_function *f)
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1148  {
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1149  	struct usb_ep		*ep;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1150  	struct f_hidg		*hidg =3D func_to_hidg(f);
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz   =
  2014-11-06  1151  	struct usb_string	*us;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1152  	int			status;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1153 =20
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1154  	hidg->get_req =3D usb_ep_alloc_request(c->cdev->gadget=
->ep0, GFP_ATOMIC);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1155  	if (!hidg->get_req)
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1156  		return -ENOMEM;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1157 =20
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1158  	hidg->get_req->zero =3D 0;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1159  	hidg->get_req->complete =3D hidg_get_report_complete;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1160  	hidg->get_req->context =3D hidg;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1161  	hidg->get_report_returned =3D true;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1162 =20
cb382536052fcc drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz   =
  2014-11-06  1163  	/* maybe allocate device-global string IDs, and patch =
descriptors */
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz   =
  2014-11-06  1164  	us =3D usb_gstrings_attach(c->cdev, ct_func_strings,
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz   =
  2014-11-06  1165  				 ARRAY_SIZE(ct_func_string_defs));
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz   =
  2014-11-06  1166  	if (IS_ERR(us))
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz   =
  2014-11-06  1167  		return PTR_ERR(us);
5ca8d3ec9970f4 drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz   =
  2014-11-06  1168  	hidg_interface_desc.iInterface =3D us[CT_FUNC_HID_IDX]=
.id;
cb382536052fcc drivers/usb/gadget/function/f_hid.c Andrzej Pietrasiewicz   =
  2014-11-06  1169 =20
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1170  	/* allocate instance-specific interface IDs, and patch=
 descriptors */
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1171  	status =3D usb_interface_id(c, f);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1172  	if (status < 0)
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1173  		goto fail;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1174  	hidg_interface_desc.bInterfaceNumber =3D status;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1175 =20
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1176  	/* allocate instance-specific endpoints */
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1177  	status =3D -ENODEV;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1178  	ep =3D usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_in_=
ep_desc);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1179  	if (!ep)
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1180  		goto fail;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1181  	hidg->in_ep =3D ep;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1182 =20
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1183  	hidg->out_ep =3D NULL;
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1184  	if (hidg->use_out_ep) {
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack             =
  2012-06-13  1185  		ep =3D usb_ep_autoconfig(c->cdev->gadget, &hidg_fs_ou=
t_ep_desc);
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack             =
  2012-06-13  1186  		if (!ep)
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack             =
  2012-06-13  1187  			goto fail;
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack             =
  2012-06-13  1188  		hidg->out_ep =3D ep;
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1189  	}
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1190 =20
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1191  	/* used only if use_out_ep =3D=3D 1 */
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1192  	hidg->set_report_buf =3D NULL;
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack             =
  2012-06-13  1193 =20
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1194  	/* set descriptor dynamic values */
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1195  	hidg_interface_desc.bInterfaceSubClass =3D hidg->bInte=
rfaceSubClass;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1196  	hidg_interface_desc.bInterfaceProtocol =3D hidg->bInte=
rfaceProtocol;
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1197  	hidg_interface_desc.bNumEndpoints =3D hidg->use_out_ep=
 ? 2 : 1;
b3c4ec71ec413c drivers/usb/gadget/function/f_hid.c Abdulhadi Mohamed       =
  2017-07-19  1198  	hidg->protocol =3D HID_REPORT_PROTOCOL;
afcff6dc690e24 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-07-21  1199  	hidg->idle =3D 1;
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1200  	hidg_ss_in_ep_desc.wMaxPacketSize =3D cpu_to_le16(hidg=
->report_length);
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1201  	hidg_ss_in_comp_desc.wBytesPerInterval =3D
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1202  				cpu_to_le16(hidg->report_length);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1203  	hidg_hs_in_ep_desc.wMaxPacketSize =3D cpu_to_le16(hidg=
->report_length);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1204  	hidg_fs_in_ep_desc.wMaxPacketSize =3D cpu_to_le16(hidg=
->report_length);
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1205  	hidg_ss_out_ep_desc.wMaxPacketSize =3D cpu_to_le16(hid=
g->report_length);
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1206 =20
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1207  	/* IN endpoints: FS default=3D10ms, HS default=3D4=C2=
=B5-frame; user override if set */
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1208  	if (!hidg->interval_user_set) {
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1209  		hidg_fs_in_ep_desc.bInterval =3D 10;
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1210  		hidg_hs_in_ep_desc.bInterval =3D 4;
7f58b4148ef5d8 drivers/usb/gadget/function/f_hid.c John Keeping            =
  2026-02-27  1211  		hidg_ss_in_ep_desc.bInterval =3D 4;
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1212  	} else {
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1213  		hidg_fs_in_ep_desc.bInterval =3D hidg->interval;
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1214  		hidg_hs_in_ep_desc.bInterval =3D hidg->interval;
7f58b4148ef5d8 drivers/usb/gadget/function/f_hid.c John Keeping            =
  2026-02-27  1215  		hidg_ss_in_ep_desc.bInterval =3D hidg->interval;
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1216  	}
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1217 =20
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1218  	hidg_ss_out_comp_desc.wBytesPerInterval =3D
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1219  				cpu_to_le16(hidg->report_length);
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack             =
  2012-06-13  1220  	hidg_hs_out_ep_desc.wMaxPacketSize =3D cpu_to_le16(hid=
g->report_length);
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack             =
  2012-06-13  1221  	hidg_fs_out_ep_desc.wMaxPacketSize =3D cpu_to_le16(hid=
g->report_length);
f286d487e9283a drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak       =
  2015-03-27  1222  	/*
f286d487e9283a drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak       =
  2015-03-27  1223  	 * We can use hidg_desc struct here but we should not =
relay
f286d487e9283a drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak       =
  2015-03-27  1224  	 * that its content won't change after returning from =
this function.
f286d487e9283a drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak       =
  2015-03-27  1225  	 */
fe7f7ac8e0c708 drivers/usb/gadget/function/f_hid.c Terry Junge             =
  2025-03-12  1226  	hidg_desc.rpt_desc.bDescriptorType =3D HID_DT_REPORT;
fe7f7ac8e0c708 drivers/usb/gadget/function/f_hid.c Terry Junge             =
  2025-03-12  1227  	hidg_desc.rpt_desc.wDescriptorLength =3D
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1228  		cpu_to_le16(hidg->report_desc_length);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1229 =20
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1230  	hidg_hs_in_ep_desc.bEndpointAddress =3D
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1231  		hidg_fs_in_ep_desc.bEndpointAddress;
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack             =
  2012-06-13  1232  	hidg_hs_out_ep_desc.bEndpointAddress =3D
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack             =
  2012-06-13  1233  		hidg_fs_out_ep_desc.bEndpointAddress;
10287baec761d3 drivers/usb/gadget/f_hid.c          Sebastian Andrzej Siewio=
r 2012-10-22  1234 =20
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1235  	hidg_ss_in_ep_desc.bEndpointAddress =3D
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1236  		hidg_fs_in_ep_desc.bEndpointAddress;
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1237  	hidg_ss_out_ep_desc.bEndpointAddress =3D
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1238  		hidg_fs_out_ep_desc.bEndpointAddress;
dbf499cf720a00 drivers/usb/gadget/function/f_hid.c Janusz Dziedzic         =
  2016-11-03  1239 =20
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1240  	if (hidg->use_out_ep) {
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1241  		/* OUT endpoints: same defaults (FS=3D10, HS=3D4) unl=
ess user set */
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1242  		if (!hidg->interval_user_set) {
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1243  			hidg_fs_out_ep_desc.bInterval =3D 10;
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1244  			hidg_hs_out_ep_desc.bInterval =3D 4;
7f58b4148ef5d8 drivers/usb/gadget/function/f_hid.c John Keeping            =
  2026-02-27  1245  			hidg_ss_out_ep_desc.bInterval =3D 4;
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1246  		} else {
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1247  			hidg_fs_out_ep_desc.bInterval =3D hidg->interval;
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1248  			hidg_hs_out_ep_desc.bInterval =3D hidg->interval;
7f58b4148ef5d8 drivers/usb/gadget/function/f_hid.c John Keeping            =
  2026-02-27  1249  			hidg_ss_out_ep_desc.bInterval =3D hidg->interval;
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1250  		}
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1251  		status =3D usb_assign_descriptors(f,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1252  			    hidg_fs_descriptors_intout,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1253  			    hidg_hs_descriptors_intout,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1254  			    hidg_ss_descriptors_intout,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1255  			    hidg_ss_descriptors_intout);
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1256  	} else {
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1257  		status =3D usb_assign_descriptors(f,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1258  			hidg_fs_descriptors_ssreport,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1259  			hidg_hs_descriptors_ssreport,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1260  			hidg_ss_descriptors_ssreport,
d7428bc26fc767 drivers/usb/gadget/function/f_hid.c Maxim Devaev            =
  2021-08-21  1261  			hidg_ss_descriptors_ssreport);
ea34925f5b2ee4 drivers/usb/gadget/function/f_hid.c Ben Hoff                =
  2025-04-29  1262  	}
10287baec761d3 drivers/usb/gadget/f_hid.c          Sebastian Andrzej Siewio=
r 2012-10-22  1263  	if (status)
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1264  		goto fail;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1265 =20
33e4c1a9987a1f drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak       =
  2017-01-19  1266  	spin_lock_init(&hidg->write_spinlock);
749494b6bdbbaf drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak       =
  2017-01-24  1267  	hidg->write_pending =3D 1;
749494b6bdbbaf drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak       =
  2017-01-24  1268  	hidg->req =3D NULL;
33e4c1a9987a1f drivers/usb/gadget/function/f_hid.c Krzysztof Opasiak       =
  2017-01-19  1269  	spin_lock_init(&hidg->read_spinlock);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1270  	spin_lock_init(&hidg->get_report_spinlock);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1271  	init_waitqueue_head(&hidg->write_queue);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1272  	init_waitqueue_head(&hidg->read_queue);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1273  	init_waitqueue_head(&hidg->get_queue);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1274  	init_waitqueue_head(&hidg->get_id_queue);
99c515005857ff drivers/usb/gadget/f_hid.c          Daniel Mack             =
  2012-06-13  1275  	INIT_LIST_HEAD(&hidg->completed_out_req);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1276  	INIT_LIST_HEAD(&hidg->report_list);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1277 =20
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1278  	INIT_WORK(&hidg->work, get_report_workqueue_handler);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1279  	hidg->workqueue =3D alloc_workqueue("report_work",
e91bbe082878c9 drivers/usb/gadget/function/f_hid.c Marco Crivellari        =
  2025-11-07  1280  					  WQ_FREEZABLE | WQ_MEM_RECLAIM | WQ_PERCPU,
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1281  					  1);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1282 =20
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1283  	if (!hidg->workqueue) {
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1284  		status =3D -ENOMEM;
62783c30d78aec drivers/usb/gadget/function/f_hid.c Yuhao Jiang             =
  2025-06-23  1285  		goto fail_free_descs;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1286  	}
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1287 =20
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1288  	/* create char device */
81ebd43cc0d6d1 drivers/usb/gadget/function/f_hid.c Michael Zimmermann      =
  2026-03-27  1289  	hidg->cdev =3D cdev_alloc();
81ebd43cc0d6d1 drivers/usb/gadget/function/f_hid.c Michael Zimmermann      =
  2026-03-27  1290  	if (!hidg->cdev)
81ebd43cc0d6d1 drivers/usb/gadget/function/f_hid.c Michael Zimmermann      =
  2026-03-27 @1291  		goto fail_free_all;
81ebd43cc0d6d1 drivers/usb/gadget/function/f_hid.c Michael Zimmermann      =
  2026-03-27  1292  	hidg->cdev->ops =3D &f_hidg_fops;
81ebd43cc0d6d1 drivers/usb/gadget/function/f_hid.c Michael Zimmermann      =
  2026-03-27  1293 =20
81ebd43cc0d6d1 drivers/usb/gadget/function/f_hid.c Michael Zimmermann      =
  2026-03-27  1294  	status =3D cdev_device_add(hidg->cdev, &hidg->dev);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1295  	if (status)
62783c30d78aec drivers/usb/gadget/function/f_hid.c Yuhao Jiang             =
  2025-06-23  1296  		goto fail_free_all;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1297 =20
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1298  	return 0;
62783c30d78aec drivers/usb/gadget/function/f_hid.c Yuhao Jiang             =
  2025-06-23  1299  fail_free_all:
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1300  	destroy_workqueue(hidg->workqueue);
62783c30d78aec drivers/usb/gadget/function/f_hid.c Yuhao Jiang             =
  2025-06-23  1301  fail_free_descs:
d12a8727171c77 drivers/usb/gadget/function/f_hid.c Pavitrakumar Managutte  =
  2014-10-22  1302  	usb_free_all_descriptors(f);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1303  fail:
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1304  	ERROR(f->config->cdev, "hidg_bind FAILED\n");
14794d7133d0f1 drivers/usb/gadget/function/f_hid.c Felipe F. Tonello       =
  2016-08-23  1305  	if (hidg->req !=3D NULL)
14794d7133d0f1 drivers/usb/gadget/function/f_hid.c Felipe F. Tonello       =
  2016-08-23  1306  		free_ep_req(hidg->in_ep, hidg->req);
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1307 =20
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1308  	usb_ep_free_request(c->cdev->gadget->ep0, hidg->get_re=
q);
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1309  	hidg->get_req =3D NULL;
a139c98f760efa drivers/usb/gadget/function/f_hid.c Chris Wulff             =
  2024-08-17  1310 =20
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1311  	return status;
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1312  }
71adf118946957 drivers/usb/gadget/f_hid.c          Fabien Chouteau         =
  2010-04-08  1313 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
