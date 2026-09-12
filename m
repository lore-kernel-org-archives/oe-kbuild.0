Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FEBB478E25
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 13:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789218124; cv=none; b=fpUX/l7Ohurh90mY5Ut+kPy4hOo8LT7L+lJbQ4GPorwH8kJ1dErCObFl34rDcPULg1SMZ/ntilDEYUMqpx+Uc+wo5NS5ANs1/koMj0ma7h9mUla4bHyTdF5GXHGRecMzaIkUsFOGcj0v8kinwwytT7ntjj0Nj2RuQriMMIDTpu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789218124; c=relaxed/simple;
	bh=a7mVXB8W++qUw8mNoca9uq4dGm/32Tsa64hnizhk4QQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=isyxo22RKcq8LlaU0dLiXdWX1dSAppzQW8fwanHsqWKiOOwuZz0/gROK7O72lxWCRCgd2jPVQb2Ctzp8CbXB7OG39vJ2Q43AsW4UPWua4NCcVNIq4dxTgjEtayuMYRUzMM2Ewl7+sly/mzdcQOvJjxb/Y8YXGNS4McCIaMXSzO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7NQn/JJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7NQn/JJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789218123; x=1820754123;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=a7mVXB8W++qUw8mNoca9uq4dGm/32Tsa64hnizhk4QQ=;
  b=e7NQn/JJ0WSi27dO5J/EaKDiVH7WvsSnVPUOhkmdjRB5n1dRhzQNb5fN
   UHH0ScwtF+1yTA5+mWwLzrHX8hHImGuk7T5rF2+7EmFaWJyDmDSIKVS9B
   8P8I6aFNnmZlEYgu+6w/WUjWtG3vFiRoqmg0wMbnlBcI4b4bTlz9ExHJ5
   CZ+/lJT2+Uttja0XTtiH7Moa1dmGitFTxJhmjVs3cGkBX7wmiwrj4XTgD
   voCi82V9h4tTfqwXXlu3+3iCXZfe0fbceTlP/N1JMvpHMH6PJsUD/xA3h
   7YUDI4gr1thE/c8KtY9RsGbK5NjqIaI9tiHW/zG/FGj7inlyZ0jc02Koe
   g==;
X-CSE-ConnectionGUID: GRihNOSnSA+ZENJdZiYocg==
X-CSE-MsgGUID: oRouKMc/RXOTGexzkYqBUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="92165987"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="92165987"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 06:02:03 -0700
X-CSE-ConnectionGUID: oSgtbwI7QWKw6iuVJpAb2A==
X-CSE-MsgGUID: H59C3J1rT26Jf+YxzQutfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="274094528"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 12 Sep 2026 06:02:01 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5NMl-0000000016Z-0GQp;
	Sat, 12 Sep 2026 13:01:59 +0000
Date: Sat, 12 Sep 2026 15:01:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/toshiba_bluetooth.c:261
 toshiba_bt_rfkill_probe() warn: 'bt_dev->rfk' is an error pointer or valid
Message-ID: <202609121412.Fe6ylN72-lkp@intel.com>
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
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5225b8eec4c9bb21aecff6295fab6346a3c3738e
commit: 553b2ac59fbb434330287fde0cabc64bc6f11ceb platform/x86: toshiba_blue=
tooth: Convert ACPI driver to a platform one
date:   6 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-141-20260911 (https://download.01.org/0day-ci/archi=
ve/20260912/202609121412.Fe6ylN72-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 553b2ac59fbb ("platform/x86: toshiba_bluetooth: Convert ACPI drive=
r to a platform one")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609121412.Fe6ylN72-lkp@intel.com/

smatch warnings:
drivers/platform/x86/toshiba_bluetooth.c:261 toshiba_bt_rfkill_probe() warn=
: 'bt_dev->rfk' is an error pointer or valid

vim +261 drivers/platform/x86/toshiba_bluetooth.c

42b4e9ee3d1d3b Jes Sorensen      2009-12-16  230 =20
553b2ac59fbb43 Rafael J. Wysocki 2026-03-24  231  static int toshiba_bt_rfk=
ill_probe(struct platform_device *pdev)
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  232  {
553b2ac59fbb43 Rafael J. Wysocki 2026-03-24  233  	struct acpi_device *devi=
ce =3D ACPI_COMPANION(&pdev->dev);
84c0691e514539 Azael Avalos      2015-05-03  234  	struct toshiba_bluetooth=
_dev *bt_dev;
18b8696b66d790 Azael Avalos      2015-03-26  235  	int result;
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  236 =20
18b8696b66d790 Azael Avalos      2015-03-26  237  	result =3D toshiba_bluet=
ooth_present(device->handle);
18b8696b66d790 Azael Avalos      2015-03-26  238  	if (result)
18b8696b66d790 Azael Avalos      2015-03-26  239  		return result;
18b8696b66d790 Azael Avalos      2015-03-26  240 =20
18b8696b66d790 Azael Avalos      2015-03-26  241  	pr_info("Toshiba ACPI Bl=
uetooth device driver\n");
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  242 =20
bf4afc53b77aea Linus Torvalds    2026-02-21  243  	bt_dev =3D kzalloc_obj(*=
bt_dev);
84c0691e514539 Azael Avalos      2015-05-03  244  	if (!bt_dev)
84c0691e514539 Azael Avalos      2015-05-03  245  		return -ENOMEM;
84c0691e514539 Azael Avalos      2015-05-03  246  	bt_dev->acpi_dev =3D dev=
ice;
553b2ac59fbb43 Rafael J. Wysocki 2026-03-24  247 =20
553b2ac59fbb43 Rafael J. Wysocki 2026-03-24  248  	platform_set_drvdata(pde=
v, bt_dev);
84c0691e514539 Azael Avalos      2015-05-03  249 =20
84c0691e514539 Azael Avalos      2015-05-03  250  	result =3D toshiba_bluet=
ooth_sync_status(bt_dev);
84c0691e514539 Azael Avalos      2015-05-03  251  	if (result) {
84c0691e514539 Azael Avalos      2015-05-03  252  		kfree(bt_dev);
84c0691e514539 Azael Avalos      2015-05-03  253  		return result;
84c0691e514539 Azael Avalos      2015-05-03  254  	}
84c0691e514539 Azael Avalos      2015-05-03  255 =20
7ee8cd3319d5e5 Azael Avalos      2015-05-03  256  	bt_dev->rfk =3D rfkill_a=
lloc("Toshiba Bluetooth",
553b2ac59fbb43 Rafael J. Wysocki 2026-03-24  257  				   &pdev->dev,
7ee8cd3319d5e5 Azael Avalos      2015-05-03  258  				   RFKILL_TYPE_BLUETO=
OTH,
7ee8cd3319d5e5 Azael Avalos      2015-05-03  259  				   &rfk_ops,
7ee8cd3319d5e5 Azael Avalos      2015-05-03  260  				   bt_dev);
7ee8cd3319d5e5 Azael Avalos      2015-05-03 @261  	if (!bt_dev->rfk) {
7ee8cd3319d5e5 Azael Avalos      2015-05-03  262  		pr_err("Unable to alloc=
ate rfkill device\n");
4315abf3383010 Rafael J. Wysocki 2026-03-24  263  		result =3D -ENOMEM;
4315abf3383010 Rafael J. Wysocki 2026-03-24  264  		goto err_free_bt_dev;
7ee8cd3319d5e5 Azael Avalos      2015-05-03  265  	}
7ee8cd3319d5e5 Azael Avalos      2015-05-03  266 =20
7ee8cd3319d5e5 Azael Avalos      2015-05-03  267  	rfkill_set_hw_state(bt_d=
ev->rfk, !bt_dev->killswitch);
7ee8cd3319d5e5 Azael Avalos      2015-05-03  268 =20
7ee8cd3319d5e5 Azael Avalos      2015-05-03  269  	result =3D rfkill_regist=
er(bt_dev->rfk);
7ee8cd3319d5e5 Azael Avalos      2015-05-03  270  	if (result) {
7ee8cd3319d5e5 Azael Avalos      2015-05-03  271  		pr_err("Unable to regis=
ter rfkill device\n");
4315abf3383010 Rafael J. Wysocki 2026-03-24  272  		goto err_rfkill_destroy;
7ee8cd3319d5e5 Azael Avalos      2015-05-03  273  	}
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  274 =20
4315abf3383010 Rafael J. Wysocki 2026-03-24  275  	result =3D acpi_dev_inst=
all_notify_handler(device, ACPI_DEVICE_NOTIFY,
4315abf3383010 Rafael J. Wysocki 2026-03-24  276  						 toshiba_bt_rfkill_=
notify, bt_dev);
4315abf3383010 Rafael J. Wysocki 2026-03-24  277  	if (result) {
4315abf3383010 Rafael J. Wysocki 2026-03-24  278  		pr_err("Unable to regis=
ter ACPI notify handler\n");
4315abf3383010 Rafael J. Wysocki 2026-03-24  279  		goto err_rfkill_unregis=
ter;
4315abf3383010 Rafael J. Wysocki 2026-03-24  280  	}
4315abf3383010 Rafael J. Wysocki 2026-03-24  281 =20
4315abf3383010 Rafael J. Wysocki 2026-03-24  282  	return 0;
4315abf3383010 Rafael J. Wysocki 2026-03-24  283 =20
4315abf3383010 Rafael J. Wysocki 2026-03-24  284  err_rfkill_unregister:
4315abf3383010 Rafael J. Wysocki 2026-03-24  285  	rfkill_unregister(bt_dev=
->rfk);
4315abf3383010 Rafael J. Wysocki 2026-03-24  286  err_rfkill_destroy:
4315abf3383010 Rafael J. Wysocki 2026-03-24  287  	rfkill_destroy(bt_dev->r=
fk);
4315abf3383010 Rafael J. Wysocki 2026-03-24  288  err_free_bt_dev:
4315abf3383010 Rafael J. Wysocki 2026-03-24  289  	kfree(bt_dev);
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  290  	return result;
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  291  }
42b4e9ee3d1d3b Jes Sorensen      2009-12-16  292 =20

:::::: The code at line 261 was first introduced by commit
:::::: 7ee8cd3319d5e57b1b5e2b348f078af44e67a577 toshiba_bluetooth: Add RFKi=
ll handler functions

:::::: TO: Azael Avalos <coproscefalo@gmail.com>
:::::: CC: Darren Hart <dvhart@linux.intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
