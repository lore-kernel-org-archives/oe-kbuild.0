Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80FD3F1AC9
	for <oe-kbuild@lists.linux.dev>; Tue,  9 Jun 2026 23:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781046556; cv=none; b=cgcPzsG1B15SxYvLCUOI5V1P4nCfjalzni4zRbZsPYbuxoDhJgHgPTAYip/d6zKju6UwkqybzfHlgTfhKrPjC9/IhGcawge3CT/WCWYw9uhhpK+sfvg/kpP+plUMWJVBItUOvWQEafvqcS0bPnnvxN3TGtBHMqIpwRY8IR28S/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781046556; c=relaxed/simple;
	bh=z71EvL8qDn9ZcoCuU1At7KAimmi1TscGnn4zdQMaRlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=gXWWAhcDrvDAIrWi65FAmS6YEn/nAAreA+xyjvsY9GCK0xXBx3RUARUlE1JB4mlfGb6r4adotGzBwdrK9mAmEH6FX63wZV9h7mzkoaCVrjzWt2TsAzc22QW6652YMgpZ2TR60htsrjN8/CYZpYDcFb6vpToKDhmLsjA+zfolCcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MlixGWg5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MlixGWg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781046553; x=1812582553;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z71EvL8qDn9ZcoCuU1At7KAimmi1TscGnn4zdQMaRlc=;
  b=MlixGWg5nfUGivwIpW2IxZAGh5LQkYgJJVKvN6rZLbeOzk0N/u0cOXCb
   t6xBSeT7PDO1Dd3J25EXszvkuRdAnQCTUcjJixGRQ2+SV5oLXOXDsBrBQ
   HssM5dU6z841uj4iE6gq4R6NO4xwFhcwnJApL97rXhJre+DVvfnctpkd7
   X3IRur/V3/x9cWNJqCJWKtCmszLEVmnKEYgOxlHMsJLu9myIQKHPBeFyh
   MDG1wdS9051qByUTcdijneVMK8tC0D7AaMoH2/3MjAQIF/WjNa9gpd7he
   hzx0hJnAu0/0M+HyxJ3jB4H1We/LiIa25SxKMKgwh5njGxfbu9a2GsqBI
   g==;
X-CSE-ConnectionGUID: u5oglHO9TUeELdx///v2YA==
X-CSE-MsgGUID: sHv9byO2Td2J0U0L5+quyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="104491825"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="104491825"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 16:09:13 -0700
X-CSE-ConnectionGUID: DJ6KhSwXSpeyvUPXaV33gg==
X-CSE-MsgGUID: yfwiWG1mTYSLAetKAzhwEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="245150779"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Jun 2026 16:09:12 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX5ZF-00000000Kec-45iF;
	Tue, 09 Jun 2026 23:09:09 +0000
Date: Wed, 10 Jun 2026 07:08:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/vfio/pci/virtio/legacy_io.c:401:2: error: call to
 '__compiletime_assert_637' declared with 'error' attribute: BUILD_BUG_ON
 failed: !is_power_of_2(virtvdev->bar0_virtual_buf_size)
Message-ID: <202606100722.gkvfPSFZ-lkp@intel.com>
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
:::::: Manual check reason: "__compiletime_assert_NNN"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Johannes Berg <johannes@sipsolutions.net>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2d3090a8aeb596a26935db0955d46c9a5db5c6ce
commit: 031cdd3bc3f369553933c1b0f4cb18000162c8ff kunit: Enable PCI on UML w=
ithout triggering WARN()
date:   9 months ago
:::::: branch date: 32 hours ago
:::::: commit date: 9 months ago
config: um-randconfig-001-20260610 (https://download.01.org/0day-ci/archive=
/20260610/202606100722.gkvfPSFZ-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 791=
7772d7d61384696c61102c08c2ea158e610fa)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260610/202606100722.gkvfPSFZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606100722.gkvfPSFZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/pci/virtio/legacy_io.c:9:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:5:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1175:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1175 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
>> drivers/vfio/pci/virtio/legacy_io.c:401:2: error: call to '__compiletime=
_assert_637' declared with 'error' attribute: BUILD_BUG_ON failed: !is_powe=
r_of_2(virtvdev->bar0_virtual_buf_size)
     401 |         BUILD_BUG_ON(!is_power_of_2(virtvdev->bar0_virtual_buf_s=
ize));
         |         ^
   include/linux/build_bug.h:50:2: note: expanded from macro 'BUILD_BUG_ON'
      50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #con=
dition)
         |         ^
   include/linux/build_bug.h:39:37: note: expanded from macro 'BUILD_BUG_ON=
_MSG'
      39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^
   include/linux/compiler_types.h:572:2: note: expanded from macro 'compile=
time_assert'
     572 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^
   include/linux/compiler_types.h:560:2: note: expanded from macro '_compil=
etime_assert'
     560 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^
   include/linux/compiler_types.h:553:4: note: expanded from macro '__compi=
letime_assert'
     553 |                         prefix ## suffix();                     =
        \
         |                         ^
   <scratch space>:151:1: note: expanded from here
     151 | __compiletime_assert_637
         | ^
   1 warning and 1 error generated.


vim +401 drivers/vfio/pci/virtio/legacy_io.c

40bcdb12c68dbb Yishai Hadas 2024-11-13  389 =20
40bcdb12c68dbb Yishai Hadas 2024-11-13  390  int virtiovf_init_legacy_io(st=
ruct virtiovf_pci_core_device *virtvdev)
40bcdb12c68dbb Yishai Hadas 2024-11-13  391  {
40bcdb12c68dbb Yishai Hadas 2024-11-13  392  	struct pci_dev *pdev =3D virt=
vdev->core_device.pdev;
40bcdb12c68dbb Yishai Hadas 2024-11-13  393  	int ret;
40bcdb12c68dbb Yishai Hadas 2024-11-13  394 =20
40bcdb12c68dbb Yishai Hadas 2024-11-13  395  	ret =3D virtiovf_read_notify_=
info(virtvdev);
40bcdb12c68dbb Yishai Hadas 2024-11-13  396  	if (ret)
40bcdb12c68dbb Yishai Hadas 2024-11-13  397  		return ret;
40bcdb12c68dbb Yishai Hadas 2024-11-13  398 =20
40bcdb12c68dbb Yishai Hadas 2024-11-13  399  	virtvdev->bar0_virtual_buf_si=
ze =3D VIRTIO_PCI_CONFIG_OFF(true) +
40bcdb12c68dbb Yishai Hadas 2024-11-13  400  				virtiovf_get_device_config=
_size(pdev->device);
40bcdb12c68dbb Yishai Hadas 2024-11-13 @401  	BUILD_BUG_ON(!is_power_of_2(v=
irtvdev->bar0_virtual_buf_size));
40bcdb12c68dbb Yishai Hadas 2024-11-13  402  	virtvdev->bar0_virtual_buf =
=3D kzalloc(virtvdev->bar0_virtual_buf_size,
40bcdb12c68dbb Yishai Hadas 2024-11-13  403  					     GFP_KERNEL);
40bcdb12c68dbb Yishai Hadas 2024-11-13  404  	if (!virtvdev->bar0_virtual_b=
uf)
40bcdb12c68dbb Yishai Hadas 2024-11-13  405  		return -ENOMEM;
40bcdb12c68dbb Yishai Hadas 2024-11-13  406  	mutex_init(&virtvdev->bar_mut=
ex);
40bcdb12c68dbb Yishai Hadas 2024-11-13  407  	return 0;
40bcdb12c68dbb Yishai Hadas 2024-11-13  408  }
40bcdb12c68dbb Yishai Hadas 2024-11-13  409 =20

:::::: The code at line 401 was first introduced by commit
:::::: 40bcdb12c68dbb6f457deb0adab5008ef61c13d7 vfio/virtio: Enable live mi=
gration once VIRTIO_PCI was configured

:::::: TO: Yishai Hadas <yishaih@nvidia.com>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
