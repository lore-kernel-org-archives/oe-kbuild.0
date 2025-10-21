Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CB333A027
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 14:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055803; cv=none; b=nSQ/pKHaJ3X9JgdGJshu/OjCP57/Btq3KLu43LB6ySFQ3ovb9ximN1EjRqlni9Tt75hWiXktMCSTms656KhEbMRU3Oa/KMjXNAwApzuxjkFmwMpMWKoNa27Kfc8wFIcZrsuYbS+BvGa1mNny3r70Bt/XrfJqAtCZYO/2pas+trE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055803; c=relaxed/simple;
	bh=bdq6dXjmmcEiMVrV7iPdouORdXREzjktO2LJmLWyc2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDwLEd+jdUpNtFaO5Yd/T/18Pln6mAWiYElQnCkK6twhBANPmUFlzFSOEv1A0vob5FJ7DY7n3D5kn/KvqtpW4/+AR0Gi+XWSO7zRyQIu+muSN/Fu2Qqh2nDjnrBHbWAWX98gqptYVERB+PYn1AgNpbZyTKX/Yh+/SwmaYZwxbUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SXWBPD4O; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SXWBPD4O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761055801; x=1792591801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bdq6dXjmmcEiMVrV7iPdouORdXREzjktO2LJmLWyc2U=;
  b=SXWBPD4Oucv6ikCxaZ41FWROixmOQFFFEfmdVA+u2UXE/W0MBIkY/mc9
   udmYl80PYHxpZF62jFhGKsPteyCX0EPeKgQdpvZ1icJQsM3IifeQt2Rtq
   JG52xcdReCw4nKN2ldACPiAE5YU8DrWzhvebNddb1hN5nnP9Ttjw7aDiO
   CW37dKhLj374QQH/0ColWRLpjaDIIx8GT+kbhA5LeXaXGfQ78OFFLG/Gf
   g31Ihh6cegxHrHgbAAviNIcx1B1KT+KRRh51grLBI4xuopUj2ZZPFZe6X
   KA97fcMPN0/c9yj6XOR7PXgDqaR0KOPg+wIfB1XGqkyp+ztjzvCqPwzmQ
   g==;
X-CSE-ConnectionGUID: zfP7osMFQXGg6j7XC+ls3A==
X-CSE-MsgGUID: X13gtclBSIiGAt+Mququ5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63221765"
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="63221765"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2025 07:10:00 -0700
X-CSE-ConnectionGUID: +KUYTr3xT+SN55Zz37BOiw==
X-CSE-MsgGUID: c0DwhzRcQWapro4MlOZR6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,245,1754982000"; 
   d="scan'208";a="214231148"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Oct 2025 07:09:58 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vBD3k-000AtO-02;
	Tue, 21 Oct 2025 14:09:56 +0000
Date: Tue, 21 Oct 2025 22:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/ata/libata-scsi.c:423:27: sparse: signed value source
Message-ID: <202510220022.loXSV3je-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/ata/libata-scsi.c:423:27: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
config: um-randconfig-r123-20251021 (https://download.01.org/0day-ci/archive/20251022/202510220022.loXSV3je-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251022/202510220022.loXSV3je-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510220022.loXSV3je-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/ata/libata-scsi.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/ata/libata-scsi.c:423:27: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/ata/libata-scsi.c:433:30: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/ata/libata-scsi.c:437:30: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/ata/libata-scsi.c:441:30: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/ata/libata-scsi.c:548:32: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/ata/libata-scsi.c:671:24: sparse: signed value source
--
   drivers/char/ipmi/ipmi_devintf.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/char/ipmi/ipmi_devintf.c:149:35: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/char/ipmi/ipmi_devintf.c:166:13: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/char/ipmi/ipmi_devintf.c:234:26: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/char/ipmi/ipmi_devintf.c:256:34: sparse: signed value source
--
   drivers/hwmon/w83793.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/hwmon/w83793.c:1370:37: sparse: signed value source
--
   drivers/block/mtip32xx/mtip32xx.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/block/mtip32xx/mtip32xx.c:1901:40: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/block/mtip32xx/mtip32xx.c:1907:40: sparse: signed value source
--
   drivers/misc/tps6594-pfsm.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/misc/tps6594-pfsm.c:71:21: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/misc/tps6594-pfsm.c:97:21: sparse: signed value source
--
   drivers/nvdimm/bus.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/nvdimm/bus.c:1117:65: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/nvdimm/bus.c:1154:54: sparse: signed value source
--
   include/linux/rio.h:204:34: sparse: sparse: array of flexible structures
   drivers/rapidio/rio_cm.c:385:17: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:385:17: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:385:17: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:385:17: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:404:23: sparse: sparse: cast to restricted __be32
   drivers/rapidio/rio_cm.c:404:23: sparse: sparse: cast to restricted __be32
   drivers/rapidio/rio_cm.c:404:23: sparse: sparse: cast to restricted __be32
   drivers/rapidio/rio_cm.c:404:23: sparse: sparse: cast to restricted __be32
   drivers/rapidio/rio_cm.c:404:23: sparse: sparse: cast to restricted __be32
   drivers/rapidio/rio_cm.c:404:23: sparse: sparse: cast to restricted __be32
   drivers/rapidio/rio_cm.c:405:21: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:405:21: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:405:21: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:405:21: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:431:17: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:431:17: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:431:17: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:431:17: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:442:27: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:442:27: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:442:27: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:442:27: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:463:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:463:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:463:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:463:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:466:32: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:466:32: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:466:32: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:466:32: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:497:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:497:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:497:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:497:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:497:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:497:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:497:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:497:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:535:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:535:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:535:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:535:9: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:537:32: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:537:32: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:537:32: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:537:32: sparse: sparse: cast to restricted __be16
   drivers/rapidio/rio_cm.c:809:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] src_id @@     got restricted __be32 [usertype] @@
   drivers/rapidio/rio_cm.c:809:26: sparse:     expected unsigned int [usertype] src_id
   drivers/rapidio/rio_cm.c:809:26: sparse:     got restricted __be32 [usertype]
   drivers/rapidio/rio_cm.c:810:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dst_id @@     got restricted __be32 [usertype] @@
   drivers/rapidio/rio_cm.c:810:26: sparse:     expected unsigned int [usertype] dst_id
   drivers/rapidio/rio_cm.c:810:26: sparse:     got restricted __be32 [usertype]
   drivers/rapidio/rio_cm.c:815:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dst_ch @@     got restricted __be16 [usertype] @@
   drivers/rapidio/rio_cm.c:815:21: sparse:     expected unsigned short [usertype] dst_ch
   drivers/rapidio/rio_cm.c:815:21: sparse:     got restricted __be16 [usertype]
   drivers/rapidio/rio_cm.c:816:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] src_ch @@     got restricted __be16 [usertype] @@
   drivers/rapidio/rio_cm.c:816:21: sparse:     expected unsigned short [usertype] src_ch
   drivers/rapidio/rio_cm.c:816:21: sparse:     got restricted __be16 [usertype]
   drivers/rapidio/rio_cm.c:817:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] msg_len @@     got restricted __be16 [usertype] @@
   drivers/rapidio/rio_cm.c:817:22: sparse:     expected unsigned short [usertype] msg_len
   drivers/rapidio/rio_cm.c:817:22: sparse:     got restricted __be16 [usertype]
   drivers/rapidio/rio_cm.c:977:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] src_id @@     got restricted __be32 [usertype] @@
   drivers/rapidio/rio_cm.c:977:26: sparse:     expected unsigned int [usertype] src_id
   drivers/rapidio/rio_cm.c:977:26: sparse:     got restricted __be32 [usertype]
   drivers/rapidio/rio_cm.c:978:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dst_id @@     got restricted __be32 [usertype] @@
   drivers/rapidio/rio_cm.c:978:26: sparse:     expected unsigned int [usertype] dst_id
   drivers/rapidio/rio_cm.c:978:26: sparse:     got restricted __be32 [usertype]
   drivers/rapidio/rio_cm.c:983:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dst_ch @@     got restricted __be16 [usertype] @@
   drivers/rapidio/rio_cm.c:983:21: sparse:     expected unsigned short [usertype] dst_ch
   drivers/rapidio/rio_cm.c:983:21: sparse:     got restricted __be16 [usertype]
   drivers/rapidio/rio_cm.c:984:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] src_ch @@     got restricted __be16 [usertype] @@
   drivers/rapidio/rio_cm.c:984:21: sparse:     expected unsigned short [usertype] src_ch
   drivers/rapidio/rio_cm.c:984:21: sparse:     got restricted __be16 [usertype]
   drivers/rapidio/rio_cm.c:1032:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] src_id @@     got restricted __be32 [usertype] @@
   drivers/rapidio/rio_cm.c:1032:26: sparse:     expected unsigned int [usertype] src_id
   drivers/rapidio/rio_cm.c:1032:26: sparse:     got restricted __be32 [usertype]
   drivers/rapidio/rio_cm.c:1033:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dst_id @@     got restricted __be32 [usertype] @@
   drivers/rapidio/rio_cm.c:1033:26: sparse:     expected unsigned int [usertype] dst_id
   drivers/rapidio/rio_cm.c:1033:26: sparse:     got restricted __be32 [usertype]
   drivers/rapidio/rio_cm.c:1034:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dst_ch @@     got restricted __be16 [usertype] @@
   drivers/rapidio/rio_cm.c:1034:21: sparse:     expected unsigned short [usertype] dst_ch
   drivers/rapidio/rio_cm.c:1034:21: sparse:     got restricted __be16 [usertype]
   drivers/rapidio/rio_cm.c:1035:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] src_ch @@     got restricted __be16 [usertype] @@
   drivers/rapidio/rio_cm.c:1035:21: sparse:     expected unsigned short [usertype] src_ch
   drivers/rapidio/rio_cm.c:1035:21: sparse:     got restricted __be16 [usertype]
   drivers/rapidio/rio_cm.c:1406:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] src_id @@     got restricted __be32 [usertype] @@
   drivers/rapidio/rio_cm.c:1406:26: sparse:     expected unsigned int [usertype] src_id
   drivers/rapidio/rio_cm.c:1406:26: sparse:     got restricted __be32 [usertype]
   drivers/rapidio/rio_cm.c:1407:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] dst_id @@     got restricted __be32 [usertype] @@
   drivers/rapidio/rio_cm.c:1407:26: sparse:     expected unsigned int [usertype] dst_id
   drivers/rapidio/rio_cm.c:1407:26: sparse:     got restricted __be32 [usertype]
   drivers/rapidio/rio_cm.c:1412:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] dst_ch @@     got restricted __be16 [usertype] @@
   drivers/rapidio/rio_cm.c:1412:21: sparse:     expected unsigned short [usertype] dst_ch
   drivers/rapidio/rio_cm.c:1412:21: sparse:     got restricted __be16 [usertype]
   drivers/rapidio/rio_cm.c:1413:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] src_ch @@     got restricted __be16 [usertype] @@
   drivers/rapidio/rio_cm.c:1413:21: sparse:     expected unsigned short [usertype] src_ch
   drivers/rapidio/rio_cm.c:1413:21: sparse:     got restricted __be16 [usertype]
   drivers/rapidio/rio_cm.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/rapidio/rio_cm.c:1533:25: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/rapidio/rio_cm.c:1660:25: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/rapidio/rio_cm.c:1660:25: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/rapidio/rio_cm.c:1686:25: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/rapidio/rio_cm.c:1734:25: sparse: signed value source
--
   drivers/infiniband/core/uverbs_main.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/infiniband/core/uverbs_main.c:602:51: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_main.c:642:31: sparse: signed value source
--
   drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected int ( *handler )( ... ) @@     got int ( [noderef] * )( ... ) @@
   drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse:     expected int ( *handler )( ... )
   drivers/infiniband/core/uverbs_ioctl.c:440:17: sparse:     got int ( [noderef] * )( ... )
   drivers/infiniband/core/uverbs_ioctl.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/infiniband/core/uverbs_ioctl.c:160:13: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_ioctl.c:341:29: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_ioctl.c:449:45: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_ioctl.c:831:71: sparse: signed value source
--
   drivers/infiniband/core/uverbs_cmd.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/infiniband/core/uverbs_cmd.c:68:26: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_cmd.c:77:56: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_cmd.c:95:33: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_cmd.c:139:33: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_cmd.c:150:13: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_cmd.c:1213:22: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_cmd.c:2065:59: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_cmd.c:2173:64: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_cmd.c:2248:56: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_cmd.c:2287:64: sparse: signed value source
   drivers/infiniband/core/uverbs_cmd.c:3753:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3753:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3753:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3753:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3767:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3767:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3776:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3821:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3821:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3821:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3821:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3821:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3821:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3821:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3821:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3851:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3851:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3851:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3851:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3867:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3867:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3867:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3867:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3867:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3867:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3886:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3886:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3886:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3886:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3900:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3900:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3900:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3900:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3914:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3979:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3979:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3979:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3979:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3997:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3997:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3997:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3997:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:3997:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:3997:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:4022:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:4022:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:4022:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:4022:9: sparse:   also defined here
   drivers/infiniband/core/uverbs_cmd.c:4022:9: sparse: sparse: Initializer entry defined twice
   drivers/infiniband/core/uverbs_cmd.c:4022:9: sparse:   also defined here
--
   drivers/infiniband/core/uverbs_std_types_device.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/infiniband/core/uverbs_std_types_device.c:310:38: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/core/uverbs_std_types_device.c:300:55: sparse: signed value source
--
   drivers/mmc/core/block.c:2633:26: sparse: sparse: invalid assignment: |=
   drivers/mmc/core/block.c:2633:26: sparse:    left side has type unsigned int
   drivers/mmc/core/block.c:2633:26: sparse:    right side has type restricted blk_features_t
   drivers/mmc/core/block.c:2635:26: sparse: sparse: invalid assignment: |=
   drivers/mmc/core/block.c:2635:26: sparse:    left side has type unsigned int
   drivers/mmc/core/block.c:2635:26: sparse:    right side has type restricted blk_features_t
   drivers/mmc/core/block.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/mmc/core/block.c:505:28: sparse: signed value source
--
   drivers/media/pci/saa7164/saa7164-encoder.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/media/pci/saa7164/saa7164-encoder.c:890:16: sparse: signed value source
--
   drivers/media/pci/saa7164/saa7164-vbi.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/media/pci/saa7164/saa7164-vbi.c:594:16: sparse: signed value source
--
   drivers/media/radio/si470x/radio-si470x-common.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/media/radio/si470x/radio-si470x-common.c:508:16: sparse: signed value source
--
   drivers/staging/most/video/video.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/staging/most/video/video.c:198:16: sparse: signed value source
--
   drivers/rapidio/devices/rio_mport_cdev.c: note: in included file:
   include/linux/rio.h:204:34: sparse: sparse: array of flexible structures
   drivers/rapidio/devices/rio_mport_cdev.c:2131:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *arg @@     got void [noderef] __user * @@
   drivers/rapidio/devices/rio_mport_cdev.c:2131:56: sparse:     expected void *arg
   drivers/rapidio/devices/rio_mport_cdev.c:2131:56: sparse:     got void [noderef] __user *
   drivers/rapidio/devices/rio_mport_cdev.c: note: in included file (through include/linux/uaccess.h):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/rapidio/devices/rio_mport_cdev.c:2334:16: sparse: signed value source
--
   drivers/media/test-drivers/vivid/vivid-radio-rx.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/media/test-drivers/vivid/vivid-radio-rx.c:121:40: sparse: signed value source
--
   drivers/media/test-drivers/vivid/vivid-radio-tx.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/media/test-drivers/vivid/vivid-radio-tx.c:77:48: sparse: signed value source
--
   drivers/infiniband/sw/rxe/rxe_verbs.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/infiniband/sw/rxe/rxe_verbs.c:341:16: sparse: signed value source
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   drivers/infiniband/sw/rxe/rxe_verbs.c: note: in included file (through include/rdma/uverbs_types.h, include/rdma/uverbs_ioctl.h):
>> include/rdma/ib_verbs.h:3019:37: sparse: signed value source
--
   drivers/infiniband/sw/rxe/rxe_srq.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:45:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> drivers/infiniband/sw/rxe/rxe_srq.c:84:35: sparse: signed value source

vim +423 drivers/ata/libata-scsi.c

d8d9129ea28e21 Tejun Heo    2010-05-15  406  
5924b74c1cde5e Tejun Heo    2007-01-02  407  /**
5924b74c1cde5e Tejun Heo    2007-01-02  408   *	ata_get_identity - Handler for HDIO_GET_IDENTITY ioctl
5eb66fe05f08d5 Randy Dunlap 2009-01-20  409   *	@ap: target port
5924b74c1cde5e Tejun Heo    2007-01-02  410   *	@sdev: SCSI device to get identify data for
5924b74c1cde5e Tejun Heo    2007-01-02  411   *	@arg: User buffer area for identify data
5924b74c1cde5e Tejun Heo    2007-01-02  412   *
5924b74c1cde5e Tejun Heo    2007-01-02  413   *	LOCKING:
5924b74c1cde5e Tejun Heo    2007-01-02  414   *	Defined by the SCSI layer.  We don't really care.
5924b74c1cde5e Tejun Heo    2007-01-02  415   *
5924b74c1cde5e Tejun Heo    2007-01-02  416   *	RETURNS:
5924b74c1cde5e Tejun Heo    2007-01-02  417   *	Zero on success, negative errno on error.
5924b74c1cde5e Tejun Heo    2007-01-02  418   */
94be9a58d7e683 Jeff Garzik  2009-01-16  419  static int ata_get_identity(struct ata_port *ap, struct scsi_device *sdev,
94be9a58d7e683 Jeff Garzik  2009-01-16  420  			    void __user *arg)
5924b74c1cde5e Tejun Heo    2007-01-02  421  {
5924b74c1cde5e Tejun Heo    2007-01-02  422  	struct ata_device *dev = ata_scsi_find_dev(ap, sdev);
5924b74c1cde5e Tejun Heo    2007-01-02 @423  	u16 __user *dst = arg;
5924b74c1cde5e Tejun Heo    2007-01-02  424  	char buf[40];
5924b74c1cde5e Tejun Heo    2007-01-02  425  
5924b74c1cde5e Tejun Heo    2007-01-02  426  	if (!dev)
5924b74c1cde5e Tejun Heo    2007-01-02  427  		return -ENOMSG;
5924b74c1cde5e Tejun Heo    2007-01-02  428  
5924b74c1cde5e Tejun Heo    2007-01-02  429  	if (copy_to_user(dst, dev->id, ATA_ID_WORDS * sizeof(u16)))
5924b74c1cde5e Tejun Heo    2007-01-02  430  		return -EFAULT;
5924b74c1cde5e Tejun Heo    2007-01-02  431  
5924b74c1cde5e Tejun Heo    2007-01-02  432  	ata_id_string(dev->id, buf, ATA_ID_PROD, ATA_ID_PROD_LEN);
5924b74c1cde5e Tejun Heo    2007-01-02  433  	if (copy_to_user(dst + ATA_ID_PROD, buf, ATA_ID_PROD_LEN))
5924b74c1cde5e Tejun Heo    2007-01-02  434  		return -EFAULT;
5924b74c1cde5e Tejun Heo    2007-01-02  435  
5924b74c1cde5e Tejun Heo    2007-01-02  436  	ata_id_string(dev->id, buf, ATA_ID_FW_REV, ATA_ID_FW_REV_LEN);
5924b74c1cde5e Tejun Heo    2007-01-02  437  	if (copy_to_user(dst + ATA_ID_FW_REV, buf, ATA_ID_FW_REV_LEN))
5924b74c1cde5e Tejun Heo    2007-01-02  438  		return -EFAULT;
5924b74c1cde5e Tejun Heo    2007-01-02  439  
5924b74c1cde5e Tejun Heo    2007-01-02  440  	ata_id_string(dev->id, buf, ATA_ID_SERNO, ATA_ID_SERNO_LEN);
5924b74c1cde5e Tejun Heo    2007-01-02  441  	if (copy_to_user(dst + ATA_ID_SERNO, buf, ATA_ID_SERNO_LEN))
5924b74c1cde5e Tejun Heo    2007-01-02  442  		return -EFAULT;
5924b74c1cde5e Tejun Heo    2007-01-02  443  
5924b74c1cde5e Tejun Heo    2007-01-02  444  	return 0;
5924b74c1cde5e Tejun Heo    2007-01-02  445  }
5924b74c1cde5e Tejun Heo    2007-01-02  446  

:::::: The code at line 423 was first introduced by commit
:::::: 5924b74c1cde5ef0246cf0dfbe689b27ffbe815b libata: implement HDIO_GET_IDENTITY

:::::: TO: Tejun Heo <htejun@gmail.com>
:::::: CC: Jeff Garzik <jeff@garzik.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
