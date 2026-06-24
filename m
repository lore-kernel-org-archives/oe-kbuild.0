Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670BF3612EF
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Jun 2026 04:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782274739; cv=none; b=C8kE3X8eOGPw0NRYnaVGCuYoytCpDjw5ooGLpQytlQO7AVmuhSFTofZs8TcJ9nNggZLcuugjGrKwBnaK4BLX4EcAslnmJqlFMETeLxE4f80KabHhMsGf4Sc7ZIMEFDYcpuHTsOcN6ShCqq8iBe7tlZMqD+pqqxHI6YhUM5LHcxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782274739; c=relaxed/simple;
	bh=UaIee/9Qi2GbcGEcnG25b3zTjJygSK0EltUoQH+Xc2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DAaYZh0fwoRkS9aTQBi/UE8dgj25aEggKQ+WoIbylB/KUMfSLBwctFh+mw0EyBayIccx1ItAYUwQ6BoDzy9Kh0OBPyGQup2L0968wyjoZUWzqjfAtyjxZbK8VJUzTR9xudEL2zJACy28+pAJv/BKR5LgfpXYUZd6bJ1S4HQBFYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b7P1GUBu; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b7P1GUBu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782274738; x=1813810738;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UaIee/9Qi2GbcGEcnG25b3zTjJygSK0EltUoQH+Xc2g=;
  b=b7P1GUBugHFc54zhxmos0PAC1gouhL4jLSLQNMHKr6lLmArqqKIMe+mb
   U96dtp8kUGp0POQW6QIpfUfBauJaAMvehdfWYNZNEC1bvLo7FUG+dDQk7
   58iLI0WxZsqLFjgrSL3m4QT9sUtU+QGlJ/NleaOfFz7/4DOxihLlE6PzA
   kzAlk4BGb0Y0bAtTRlcMTiMuoi9Rwg96KO4NRSf0n+38BPVjfgmCv5UJw
   /qsVmQHog4KMC+JJgrZANIxRNkIqGIDpTQRIT4tnTEqxn/MPC7kOR/Gjr
   KwXNVeR9ZM5XNemLeH+9uOHvXpzKA6O18v80hmfA8M9fRRbVZ6cvnZ2tI
   g==;
X-CSE-ConnectionGUID: sbZ6Ktb7S5e3dwpClQlGkw==
X-CSE-MsgGUID: NqAOc7H4QbetlKxMz80Dlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="100577818"
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="100577818"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 21:18:57 -0700
X-CSE-ConnectionGUID: fi1NThS2SliygIYTB4tyRQ==
X-CSE-MsgGUID: 7FhOjgW7RSqKfKZ+ZMk1Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,221,1774335600"; 
   d="scan'208";a="279869827"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Jun 2026 21:18:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wcF4f-0000000036r-3Xh3;
	Wed, 24 Jun 2026 04:18:53 +0000
Date: Wed, 24 Jun 2026 12:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/platform/x86/toshiba_acpi.c:3573
 toshiba_acpi_probe() warn: '&dev->miscdev' from misc_register() not released
 on lines: 3573.
Message-ID: <202606241215.qZRNUUem-lkp@intel.com>
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
head:   840ef6c78e6a2f694b578ecb9063241c992aaa9e
commit: 246d6cefe525f3fc760017e717bd77a3e751a260 platform/x86: toshiba_acpi=
: Convert ACPI driver to a platform one
date:   3 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-r073-20260624 (https://download.01.org/0day-ci/arch=
ive/20260624/202606241215.qZRNUUem-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 246d6cefe525 ("platform/x86: toshiba_acpi: Convert ACPI driver to =
a platform one")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606241215.qZRNUUem-lkp@intel.com/

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
