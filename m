Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF05556B8F
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Sep 2026 13:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873829; cv=none; b=dwxYqZsULn9r+FMLHj9ccSTuvNaqJ3TWdungwK+6i2TNfBwWFaODMNut0lOySwglG1SpWA1QD1DWxhO3S8BtwLtntjufE2Ljz9YKZTbGHIvr0HWcDrVFlMcLVejHrM/nZkaiOgn3sKDRjNfCz247fNrdiM7yaxQPwxkvp9O74yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873829; c=relaxed/simple;
	bh=9Q1gVaY9wf8BNGJXLtQC4alJnXm6k4QiK17QZ2fbYTQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eGALugoTbRluqa3Fc0wIeS8jUCxDmDnXj/l9TGNHkjhyC5vyoBTT/S1PAaOAY/D/twBWHmBbQwJIlqxksVA2t5jiQUPCuZH2uA6/I6DHYLMz6XLeyCjKX1CK42cTWPfy7mAEK+qrspo1XOGqcuTBLmxtW40Qil3FLQgP0gJSYz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2ronhL7; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2ronhL7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788873821; x=1820409821;
  h=date:from:to:cc:subject:message-id;
  bh=9Q1gVaY9wf8BNGJXLtQC4alJnXm6k4QiK17QZ2fbYTQ=;
  b=G2ronhL7tcJ49edS+vJZXyLge2iP5pjHRr5L2RQZHfOCzokBb+fAtDlG
   DxngFTlyEAWO6Yp9MF2B9OAZlhIi9Q8xEHw0Oc2zoXhsmthrf4fxRJmE7
   qGpl1VnduAGuBIRa84dSB2MP27zzrKNsf8U4urEZ9QAf1W1GVM0mz7I5t
   VARKat+PTj43kVQvYWnOoPKFVvHc+xxxgXX0W0peJL4/cYNMSnhq8+sKz
   WBBiHZreyObSbUSFlv+K/fkCOoGq43TqGjd4umpUc/WImheMToe9YKnB1
   exrpPfMHmzz78oCY/AEXS36zunySzQqc6TNplrWJmorTRA4pJiGdeGdZ2
   A==;
X-CSE-ConnectionGUID: NZSgyYOtR82wsHEO5aiuEA==
X-CSE-MsgGUID: GEjX4/O3Stq39WGawI8Wsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93138735"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93138735"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 06:23:38 -0700
X-CSE-ConnectionGUID: 4uDOlROaQz6Tf69oYH0N8g==
X-CSE-MsgGUID: DDw8oROFScCGls/2EOmKaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="309257838"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 08 Sep 2026 06:23:37 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x3vnT-000000000i2-1kDi;
	Tue, 08 Sep 2026 13:23:35 +0000
Date: Tue, 08 Sep 2026 15:23:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android17-6.18-kminext 2/2] /usr/bin/ld:
 tools/testing/selftests/vfio/lib/vfio_pci_driver.o:undefined reference to
 `dsa_ops'
Message-ID: <202609081524.wAHII2nm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi David,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-kminext
head:   c0a35f3366299626497a612a9fdb7e01c77eb7f3
commit: 35b05bd96204bc40a2ca8620bad1a5d139c20060 [2/2] vfio: selftests: Add driver for Intel DSA
:::::: branch date: 5 days ago
:::::: commit date: 1 year ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260908/202609081524.wAHII2nm-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609081524.wAHII2nm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35b05bd96204 ("vfio: selftests: Add driver for Intel DSA")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609081524.wAHII2nm-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /usr/bin/ld: tools/testing/selftests/vfio/lib/vfio_pci_driver.o:(.data.rel+0x0): undefined reference to `dsa_ops'
   /usr/bin/ld: tools/testing/selftests/vfio/lib/vfio_pci_driver.o:(.data.rel+0x8): undefined reference to `ioat_ops'
   collect2: error: ld returned 1 exit status

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
