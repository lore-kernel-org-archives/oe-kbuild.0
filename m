Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBD51B87C0
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 00:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754830; cv=none; b=obh4Ol53IcLZCMDljtSgaRnFLF3K+6rNNJHnZ/PQ7asZL3sIKIuunfc9lMWAWzOKfNHKdpw4//ximn10z8xKRuYu8KgSDWonQcpsUzegAZ4LpX6kKF1AgRyuq/kKWpVe/S2PxlNbSc2g6okFqWY1PYW5WLGHaN0HnZMXT2eOHbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754830; c=relaxed/simple;
	bh=a59rwgsVSO1dXgXPfo0RTJ/TPWD6sFWFuufHu/hUhsU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Qntdv5jJgrfw6LNBYsVOUcmJXGIk1JLbtcGrjQRnU2EXK4aQ7Eddj7lFlZ0MXMTXdxURccmgG9+zhAsnmvHEzej0TlT7HlM7BKPxzCbOjbbBFyurxW28lKETIRHBlcHJqRrtXNvZJBqJPv6H1R4+gdh3vrIaeNTPCqfbmvZTHOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q5zXpA3x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q5zXpA3x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786754829; x=1818290829;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a59rwgsVSO1dXgXPfo0RTJ/TPWD6sFWFuufHu/hUhsU=;
  b=Q5zXpA3xHRmhuCkrNgyAMT30En7ZCzTH0SQAX1wGeLygDzVEyIAmPMIQ
   NF+dCcSvbrzDr34GMPM9VopvOha4/wM9gBcj2SxMG9k1z56Bj4y6isq9s
   6cdJfKzo064kmZmiluzmE2VOst9s/33ZcZWJdBXqEhzqotFkM21AvGiP4
   68i3zY1pXVVO4/rKfFEmcSpvJ2a5fY3o3uyiz6wVQ73UdTD02BkXXMtEk
   xlG5T1X5TJht1j0JTUYWtmyxqP5n7us1jv8sv14QV9kVS2db9/T//R1Ms
   l/7ppLa7/2mWU5hrwUaAQPNah4iIjpZoRJf7BI031JudzTs3xEmQA0Xh0
   Q==;
X-CSE-ConnectionGUID: CmFCAO/6TeOpHYHgBoKW3w==
X-CSE-MsgGUID: lIJfqO8iR0yb0EPofLCFjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97679146"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="97679146"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 17:47:06 -0700
X-CSE-ConnectionGUID: aMgSptFgTa2cFRvfmZWlKA==
X-CSE-MsgGUID: kGiye9YLTda0H8UuKVgaQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="264402640"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2026 17:47:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv2YA-00000000ag1-3Mhd;
	Sat, 15 Aug 2026 00:47:02 +0000
Date: Sat, 15 Aug 2026 08:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/lenovo/thinkpad_acpi.c:1206
 tpacpi_new_rfkill() warn: 'atp_rfk->rfkill' is an error pointer or valid
Message-ID: <202608150830.7n4x8F3u-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Mark Pearson <mpearson-lenovo@squebb.ca>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>
CC: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Hi Mark,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: 651b57dd40871d4d0d61fb291e7f26e2b8bd69b1 platform/x86: Move Lenovo =
files into lenovo subdir
date:   1 year, 2 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 1 year, 2 months ago
config: i386-randconfig-141-20260815 (https://download.01.org/0day-ci/archi=
ve/20260815/202608150830.7n4x8F3u-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 651b57dd4087 ("platform/x86: Move Lenovo files into lenovo subdir")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608150830.7n4x8F3u-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/lenovo/thinkpad_acpi.c:1206 tpacpi_new_rfkill() warn: =
'atp_rfk->rfkill' is an error pointer or valid

Old smatch warnings:
drivers/platform/x86/lenovo/thinkpad_acpi.c:2662 hotkey_inputdev_close() wa=
rn: bitwise AND condition is false here
drivers/platform/x86/lenovo/thinkpad_acpi.c:3669 hotkey_notify_hotkey() war=
n: bitwise AND condition is false here

vim +1206 drivers/platform/x86/lenovo/thinkpad_acpi.c

19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1184 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1185  static int __init tpacpi_new_rfkill(const enum tpacp=
i_rfk_id id,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1186  			const struct tpacpi_rfk_ops *tp_rfkops,
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1187  			const enum rfkill_type rfktype,
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1188  			const char *name,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1189  			const bool set_default)
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1190  {
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1191  	struct tpacpi_rfk *atp_rfk;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1192  	int res;
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1193  	bool sw_state =3D false;
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-12-15  1194  	bool hw_state;
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1195  	int sw_status;
90d9d3c79c44bc drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-01-11  1196 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1197  	BUG_ON(id >=3D TPACPI_RFK_SW_MAX || tpacpi_rfkill_s=
witches[id]);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1198 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1199  	atp_rfk =3D kzalloc(sizeof(struct tpacpi_rfk), GFP_=
KERNEL);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1200  	if (atp_rfk)
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1201  		atp_rfk->rfkill =3D rfkill_alloc(name,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1202  						&tpacpi_pdev->dev,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1203  						rfktype,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1204  						&tpacpi_rfk_rfkill_ops,
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1205  						atp_rfk);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02 @1206  	if (!atp_rfk || !atp_rfk->rfkill) {
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches            =
     2011-04-04  1207  		pr_err("failed to allocate memory for rfkill class=
\n");
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1208  		kfree(atp_rfk);
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1209  		return -ENOMEM;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1210  	}
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1211 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1212  	atp_rfk->id =3D id;
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1213  	atp_rfk->ops =3D tp_rfkops;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1214 =20
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1215  	sw_status =3D (tp_rfkops->get_status)();
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1216  	if (sw_status < 0) {
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches            =
     2011-04-04  1217  		pr_err("failed to read initial state for %s, error=
 %d\n",
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1218  		       name, sw_status);
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1219  	} else {
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1220  		sw_state =3D (sw_status =3D=3D TPACPI_RFK_RADIO_OF=
F);
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1221  		if (set_default) {
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1222  			/* try to keep the initial state, since we ask the
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1223  			 * firmware to preserve it across S5 in NVRAM */
06d5caf47ef4fb drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-16  1224  			rfkill_init_sw_state(atp_rfk->rfkill, sw_state);
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1225  		}
b3fa1329eaf2a7 drivers/platform/x86/thinkpad_acpi.c Alan Jenkins           =
     2009-06-08  1226  	}
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-12-15  1227  	hw_state =3D tpacpi_rfk_check_hwblock_state();
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-12-15  1228  	rfkill_set_hw_state(atp_rfk->rfkill, hw_state);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1229 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1230  	res =3D rfkill_register(atp_rfk->rfkill);
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1231  	if (res < 0) {
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches            =
     2011-04-04  1232  		pr_err("failed to register %s rfkill switch: %d\n"=
, name, res);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1233  		rfkill_destroy(atp_rfk->rfkill);
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1234  		kfree(atp_rfk);
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1235  		return res;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1236  	}
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1237 =20
19d337dff95cbf drivers/platform/x86/thinkpad_acpi.c Johannes Berg          =
     2009-06-02  1238  	tpacpi_rfkill_switches[id] =3D atp_rfk;
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-12-15  1239 =20
0978e012cfbaca drivers/platform/x86/thinkpad_acpi.c Joe Perches            =
     2011-04-04  1240  	pr_info("rfkill switch %s: radio is %sblocked\n",
5451a923bbdcff drivers/platform/x86/thinkpad_acpi.c Henrique de Moraes Hols=
chuh 2009-12-15  1241  		name, (sw_state || hw_state) ? "" : "un");
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1242  	return 0;
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1243  }
0e74dc2646db04 drivers/misc/thinkpad_acpi.c         Henrique de Moraes Hols=
chuh 2008-07-21  1244 =20

:::::: The code at line 1206 was first introduced by commit
:::::: 19d337dff95cbf76edd3ad95c0cee2732c3e1ec5 rfkill: rewrite

:::::: TO: Johannes Berg <johannes@sipsolutions.net>
:::::: CC: John W. Linville <linville@tuxdriver.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
