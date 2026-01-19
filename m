Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772CA36404B
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 13:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768827944; cv=none; b=IBV4F5LyLaiRrT8ua8j6n4yykoRO1OMwuCEutnQZdWHJthZ+ohOkgcqsP2BE1PJLZYEl0nu++k1lkyWfUEqALY6Wj3aBQH2HDi/GJuNxZK65k/qDt9c80VwieZAFa0LTGxAAWu9J01kAZxm2vdaDZN6QoGIp/37fYPSITgGwXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768827944; c=relaxed/simple;
	bh=QE7Wl6sDRTIqhvz0a8gWOU3vkuKdwERFb/ZvvtMk4hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mMkwMNkRohz7W0wjSX4az+HeWDcXugSq3UW9nk4gxpIo+RlOpx0e1jEmuUdhGCGPUXGtlwqjpiWqkRQCghsVrDp8H/RsJXILuG1VTUcKYDOZMGYmBafSgDc891u71s6Ky7MhMsDe29ZkzDgd7/c9vnsBZxwIpDZDXKF0UJ+MnvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mqvhvlve; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mqvhvlve"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768827943; x=1800363943;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=QE7Wl6sDRTIqhvz0a8gWOU3vkuKdwERFb/ZvvtMk4hc=;
  b=MqvhvlveAn5AyQfqRJSbtLBGIqyRwU+qNAx4/CjvlYpO5li49d2HdVb8
   taMdTQ6Y3BxfbzIjw6Dde8/CzxuhGgzxBhhgJTcrjBJ6vhTf6YHyRMNRp
   tV4Pf1tEfsWJilMbBIso/Hkc8qYTz41LJRa+rSBiKrug8vPCA63Z0Z8jm
   X2aogW4wC90Fd7VeUr8UMuVO5z3XTUQ2a1XdyJYa/kRFBAD/fTuz8GN+O
   /ZxKu2lt8B0FthChXzMEaTC270oerTc12TS6FT3hNviidNzK7+JqhydKJ
   68eDLZX0nTHkmnI2nWHA3deePQMTMWcilJVxFB1JWOJC1bzvLDqfe5YdQ
   w==;
X-CSE-ConnectionGUID: XKK67vdCQG2PG7OgrYY1oQ==
X-CSE-MsgGUID: u8rhe2BOQB+aT1MEpDEBPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80758773"
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="80758773"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 05:05:41 -0800
X-CSE-ConnectionGUID: Dme8sRvaTdC6dM9S0gIwFw==
X-CSE-MsgGUID: KAfhVOF9RUG2F01TGDWVsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,238,1763452800"; 
   d="scan'208";a="210349771"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jan 2026 05:05:40 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhowr-00000000Nof-3l4h;
	Mon, 19 Jan 2026 13:05:37 +0000
Date: Mon, 19 Jan 2026 21:05:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/usb/host/uhci-platform.c:214:1: sparse: sparse: bad
 integer constant expression
Message-ID: <202601192109.7DwapErL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check warning: drivers/u=
sb/host/uhci-platform.c:214:1: sparse: sparse: bad integer constant express=
ion"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Alan Stern <stern@rowland.harvard.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: 01ef7f1b8713a78ab1a9512cf8096d2474c70633 USB: OHCI/UHCI: Add soft d=
ependencies on ehci_platform
date:   5 days ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 days ago
config: arm-randconfig-r112-20260119 (https://download.01.org/0day-ci/archi=
ve/20260119/202601192109.7DwapErL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260119/202601192109.7DwapErL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601192109.7DwapErL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/usb/host/uhci-hcd.c:63:1: sparse: sparse: bad integer constant e=
xpression
   drivers/usb/host/uhci-hcd.c:63:1: sparse: sparse: static assertion faile=
d: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/usb/host/uhci-hcd.c:64:1: sparse: sparse: bad integer constant e=
xpression
   drivers/usb/host/uhci-hcd.c:64:1: sparse: sparse: static assertion faile=
d: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/usb/host/uhci-hcd.c:76:1: sparse: sparse: bad integer constant e=
xpression
   drivers/usb/host/uhci-hcd.c:76:1: sparse: sparse: static assertion faile=
d: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/usb/host/uhci-hcd.c:77:1: sparse: sparse: bad integer constant e=
xpression
   drivers/usb/host/uhci-hcd.c:77:1: sparse: sparse: static assertion faile=
d: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/usb/host/uhci-hcd.c: note: in included file:
>> drivers/usb/host/uhci-platform.c:214:1: sparse: sparse: bad integer cons=
tant expression
   drivers/usb/host/uhci-platform.c:214:1: sparse: sparse: static assertion=
 failed: "MODULE_INFO(softdep, ...) contains embedded NUL byte"
   drivers/usb/host/uhci-hcd.c:939:1: sparse: sparse: bad integer constant =
expression
   drivers/usb/host/uhci-hcd.c:939:1: sparse: sparse: static assertion fail=
ed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/usb/host/uhci-hcd.c:940:1: sparse: sparse: bad integer constant =
expression
   drivers/usb/host/uhci-hcd.c:940:1: sparse: sparse: static assertion fail=
ed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/usb/host/uhci-hcd.c:941:1: sparse: sparse: bad integer constant =
expression
   drivers/usb/host/uhci-hcd.c:941:1: sparse: sparse: static assertion fail=
ed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/usb/host/uhci-hcd.c:941:1: sparse: sparse: bad integer constant =
expression
   drivers/usb/host/uhci-hcd.c:941:1: sparse: sparse: static assertion fail=
ed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +214 drivers/usb/host/uhci-platform.c

100d45970327f7 Tony Prisk       2012-07-21  204 =20
100d45970327f7 Tony Prisk       2012-07-21  205  static struct platform_dri=
ver uhci_platform_driver =3D {
100d45970327f7 Tony Prisk       2012-07-21  206  	.probe		=3D uhci_hcd_plat=
form_probe,
9a0749d61a9a99 Uwe Kleine-K=C3=B6nig 2024-09-24  207  	.remove		=3D uhci_hc=
d_platform_remove,
100d45970327f7 Tony Prisk       2012-07-21  208  	.shutdown	=3D uhci_hcd_pl=
atform_shutdown,
100d45970327f7 Tony Prisk       2012-07-21  209  	.driver =3D {
100d45970327f7 Tony Prisk       2012-07-21  210  		.name =3D "platform-uhci=
",
5d689168c1224f Sachin Kamat     2013-05-21  211  		.of_match_table =3D plat=
form_uhci_ids,
100d45970327f7 Tony Prisk       2012-07-21  212  	},
100d45970327f7 Tony Prisk       2012-07-21  213  };
01ef7f1b8713a7 Huacai Chen      2026-01-12 @214  MODULE_SOFTDEP("pre: ehci_=
platform");

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
