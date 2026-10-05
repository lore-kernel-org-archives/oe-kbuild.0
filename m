Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C891947DD76
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Oct 2026 14:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791211835; cv=none; b=sYJ+a3jEbcEiBEuEIiSudTrmq9T4nvYxUATuohLXh/JMgJHtUp/LLRazOHEeDknD3vDVhtSrGaYMjBtxE77igGtRq7p3+8EmOXdwWphFA+gdi/IpNrM6ewpf9UJwCyhwtoi636aqzPg1RWA9Bc8LpyMGGkY4SfnqnABLD00DqhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791211835; c=relaxed/simple;
	bh=r/UjVENuBFK6SXe9g0zozLXXkmg3bs1NLnSArYnspMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=QaQJp7J5vGQY7sMurVYzNkl/sDPpv8FELuDgrcp5EgWvG6970no6nXQGS+ldW8+oLOP4YC7d1jL14sxh5/GeszvmmZObXRc4BMM+UMKCcZYQSGbkBuaxiSCrPkwhDMWg9iLkpB3sVZqWnyZSicJRBZgJSFoBvNUBH2+UhX607lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LjOztEH0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjOztEH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791211832; x=1822747832;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=r/UjVENuBFK6SXe9g0zozLXXkmg3bs1NLnSArYnspMY=;
  b=LjOztEH0nmFtSIMluDrk8DqTbg0Djs/6s95g6YTgPLE4Er88dK0zJlM2
   Kfqw4Fat5dA24US8aquFnKM+xAVBdXBeVMsj9Sa31Kyi75iXPrpjBb0BP
   Jpk+LZc9kLvhVwQNv8X9sVVExri1YKLSG3nqdox9nvjlvgkYfbMcUFWHl
   8j9LygdauxrUL8Brsb1+fDy14NIw/3mnxiX9jYf+pFdGiGQGTv2D/ksAH
   lGpAl5+OGatkAZnt3h0TLwVtAsuMVdL1qEUj5zOcxZfaSYnAszjU3HPHi
   WroMVetZ4DkIEe/Gxn+ooX8z4/g643C/yusU8JHtHMGJ4LOdIvNFbHtSn
   g==;
X-CSE-ConnectionGUID: e76URCt8Ss+UbJiEONsKDw==
X-CSE-MsgGUID: 3mBjCF8dSi62llrrz9HFAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="94373895"
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="94373895"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 07:50:29 -0700
X-CSE-ConnectionGUID: UcM3EVCHTFGS24SFgirPUg==
X-CSE-MsgGUID: uOF9BkARTT2jPIGYJ3fmtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,142,1787036400"; 
   d="scan'208";a="284921867"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 05 Oct 2026 07:50:28 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDk1J-000000000Bv-3auR;
	Mon, 05 Oct 2026 14:50:25 +0000
Date: Mon, 05 Oct 2026 16:50:22 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/toshiba_acpi.c:3573
 toshiba_acpi_probe() warn: '&dev->miscdev' from misc_register() not released
 on lines: 3573.
Message-ID: <202610051641.0nM1If4b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rafael J. Wysocki" <rjw@rjwysocki.net>
CC: "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
commit: 246d6cefe525f3fc760017e717bd77a3e751a260 platform/x86: toshiba_acpi=
: Convert ACPI driver to a platform one
date:   6 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 6 months ago
config: i386-randconfig-r2202-20261005 (https://download.01.org/0day-ci/arc=
hive/20261005/202610051641.0nM1If4b-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933=
e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 246d6cefe525 ("platform/x86: toshiba_acpi: Convert ACPI driver to =
a platform one")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610051641.0nM1If4b-lkp@intel.com/

New smatch warnings:
drivers/platform/x86/toshiba_acpi.c:3573 toshiba_acpi_probe() warn: '&dev->=
miscdev' from misc_register() not released on lines: 3573.

Old smatch warnings:
drivers/platform/x86/toshiba_acpi.c:2707 toshiba_acpi_setup_wwan_rfkill() w=
arn: 'dev->wwan_rfk' is an error pointer or valid

vim +3573 drivers/platform/x86/toshiba_acpi.c

c727ba4cd95a12 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-0=
9-02  3532 =20
6873f46a630c48 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-1=
1-23  3533  	toshiba_wwan_available(dev);
2fdde83443aa84 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-1=
1-23  3534  	if (dev->wwan_supported)
2fdde83443aa84 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-1=
1-23  3535  		toshiba_acpi_setup_wwan_rfkill(dev);
6873f46a630c48 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-1=
1-23  3536 =20
763ff32f19442b drivers/platform/x86/toshiba_acpi.c Azael Avalos      2016-0=
1-25  3537  	toshiba_cooling_method_available(dev);
763ff32f19442b drivers/platform/x86/toshiba_acpi.c Azael Avalos      2016-0=
1-25  3538 =20
89655fbb396aff drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-0=
9-02  3539  	toshiba_battery_charge_mode_available(dev);
89655fbb396aff drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-0=
9-02  3540 =20
0409cbced3c9ab drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-0=
7-31  3541  	print_supported_features(dev);
0409cbced3c9ab drivers/platform/x86/toshiba_acpi.c Azael Avalos      2015-0=
7-31  3542 =20
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-0=
3-25  3543  	ret =3D sysfs_create_group(&dev->acpi_dev->dev.kobj,
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-0=
3-25  3544  				 &toshiba_attr_group);
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-0=
3-25  3545  	if (ret) {
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-0=
3-25  3546  		dev->sysfs_created =3D 0;
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-0=
3-25  3547  		goto error;
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-0=
3-25  3548  	}
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-0=
3-25  3549  	dev->sysfs_created =3D !ret;
360f0f39d0c584 drivers/platform/x86/toshiba_acpi.c Azael Avalos      2014-0=
3-25  3550 =20
b0bcf48c74cc7f drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-0=
3-24  3551  	ret =3D acpi_dev_install_notify_handler(acpi_dev, ACPI_DEVICE_=
NOTIFY,
b0bcf48c74cc7f drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-0=
3-24  3552  					      toshiba_acpi_notify, dev);
b0bcf48c74cc7f drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-0=
3-24  3553  	if (ret)
b0bcf48c74cc7f drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-0=
3-24  3554  		goto error;
b0bcf48c74cc7f drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-0=
3-24  3555 =20
b0bcf48c74cc7f drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-0=
3-24  3556  	dev->notify_handler_installed =3D 1;
b0bcf48c74cc7f drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-0=
3-24  3557 =20
36d03f93558c66 drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-0=
9-20  3558  	create_toshiba_proc_entries(dev);
36d03f93558c66 drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-0=
9-20  3559 =20
29cd293f9f8cd7 drivers/platform/x86/toshiba_acpi.c Seth Forshee      2012-0=
1-18  3560  	toshiba_acpi =3D dev;
29cd293f9f8cd7 drivers/platform/x86/toshiba_acpi.c Seth Forshee      2012-0=
1-18  3561 =20
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-0=
9-02  3562  	/*
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-0=
9-02  3563  	 * As the battery hook relies on the static variable toshiba_a=
cpi being
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-0=
9-02  3564  	 * set, this must be done after toshiba_acpi is assigned.
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-0=
9-02  3565  	 */
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-0=
9-02  3566  	if (dev->battery_charge_mode_supported)
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-0=
9-02  3567  		battery_hook_register(&battery_hook);
8ef5db9eb084f6 drivers/platform/x86/toshiba_acpi.c Arvid Norlander   2022-0=
9-02  3568 =20
c41a40c58b623f drivers/acpi/toshiba_acpi.c         philipl@overt.org 2008-0=
8-30  3569  	return 0;
135740de77641b drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-0=
9-20  3570 =20
135740de77641b drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-0=
9-20  3571  error:
246d6cefe525f3 drivers/platform/x86/toshiba_acpi.c Rafael J. Wysocki 2026-0=
3-24  3572  	toshiba_acpi_remove(pdev);
135740de77641b drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-0=
9-20 @3573  	return ret;
135740de77641b drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-0=
9-20  3574  }
135740de77641b drivers/platform/x86/toshiba_acpi.c Seth Forshee      2011-0=
9-20  3575 =20

:::::: The code at line 3573 was first introduced by commit
:::::: 135740de77641b4180c8a1f19abcfcd5e4351b15 toshiba_acpi: Convert to us=
e acpi_driver

:::::: TO: Seth Forshee <seth.forshee@canonical.com>
:::::: CC: Matthew Garrett <mjg@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
