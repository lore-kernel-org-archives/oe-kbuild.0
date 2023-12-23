Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE6DCA53
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Dec 2023 11:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6ayZY3y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703330124; x=1734866124;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fYYwx7D/lfn4WP+8kVFHzl4EgXBiXxxyaAL1P3XAe9o=;
  b=X6ayZY3yMYyVI0GoYohe+E0m+4C14+0mPjLfwX6YRBmTbiab/5Dog0Kv
   M9S/Jidrfa2085eAS0qtLsQbOBgoTN051SOQcqoFnE952iMppGFUwFlae
   swL1/eOYZWhYzJMPB7feKSTKZLNgslXgZkP7Nvy47yHAKVfcKOupACR8x
   y5DDSWZHwHVJxNGpzwhgWGrXikJltWjY84d7VcEEPhFAPkQB2VGquZKve
   /Rsg3JY1htEQxWuwGw/U7nFhaX7qNfq5C/d56ndisVAWaGXHqzpG7oG+f
   G7jUHkCa4xc3BSgORjiagBiW1whq/rJ6wVI5Rv1hCE9xX6ERU6ZyaNerI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="386627295"
X-IronPort-AV: E=Sophos;i="6.04,299,1695711600"; 
   d="scan'208";a="386627295"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2023 03:15:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="811609699"
X-IronPort-AV: E=Sophos;i="6.04,299,1695711600"; 
   d="scan'208";a="811609699"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 23 Dec 2023 03:15:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGzyF-000As5-2X;
	Sat, 23 Dec 2023 11:15:20 +0000
Date: Sat, 23 Dec 2023 19:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/comedi/drivers/das1800.c:354:24: sparse: sparse: cast to
 restricted __le16
Message-ID: <202312231955.VmI3OhWr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ian Abbott <abbotti@mev.co.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5254c0cbc92d2a08e75443bdb914f1c4839cdf5a
commit: 98a15816636044f25be4644db2a3e09fad68aaf7 Revert "comedi: add HAS_IOPORT dependencies"
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: m68k-randconfig-r132-20231223 (https://download.01.org/0day-ci/archive/20231223/202312231955.VmI3OhWr-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231223/202312231955.VmI3OhWr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312231955.VmI3OhWr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/comedi/drivers/das1800.c:354:24: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/das1800.c:354:24: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/das1800.c:354:24: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/das1800.c:354:24: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das1800.c:972:24: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das1800.c:972:24: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das1800.c:972:24: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das1800.c:972:24: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das1800.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   drivers/comedi/drivers/das1800.c: note: in included file (through arch/m68k/include/asm/io_mm.h, arch/m68k/include/asm/io.h, include/linux/io.h, ...):
   arch/m68k/include/asm/raw_io.h:457:26: sparse: sparse: cast to restricted __le16
   arch/m68k/include/asm/raw_io.h:457:26: sparse: sparse: cast to restricted __le16
   arch/m68k/include/asm/raw_io.h:457:26: sparse: sparse: cast to restricted __le16
   arch/m68k/include/asm/raw_io.h:457:26: sparse: sparse: cast to restricted __le16
--
>> drivers/comedi/drivers/das6402.c:166:15: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/das6402.c:166:15: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/das6402.c:166:15: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/das6402.c:166:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das6402.c:485:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das6402.c:485:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das6402.c:485:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das6402.c:485:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das6402.c:543:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das6402.c:543:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das6402.c:543:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das6402.c:543:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das6402.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/comedi/drivers/aio_aio12_8.c:142:23: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/aio_aio12_8.c:142:23: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/aio_aio12_8.c:142:23: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/aio_aio12_8.c:142:23: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/aio_aio12_8.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/comedi/drivers/ni_at_ao.c:159:19: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/ni_at_ao.c:159:19: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/ni_at_ao.c:159:19: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/ni_at_ao.c:159:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_at_ao.c:282:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_at_ao.c:282:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_at_ao.c:282:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_at_ao.c:282:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_at_ao.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/comedi/drivers/s526.c:189:15: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/s526.c:189:15: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/s526.c:189:15: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/s526.c:189:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:190:17: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:190:17: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:190:17: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:190:17: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:388:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:388:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:388:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:388:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:423:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:423:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:423:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:423:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:465:23: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:465:23: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:465:23: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:465:23: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:509:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:509:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:509:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c:509:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/s526.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/comedi/drivers/das16m1.c:343:23: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/das16m1.c:343:23: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/das16m1.c:343:23: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/das16m1.c:343:23: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/das16m1.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   drivers/comedi/drivers/das16m1.c: note: in included file (through arch/m68k/include/asm/io_mm.h, arch/m68k/include/asm/io.h, include/linux/io.h, ...):
   arch/m68k/include/asm/raw_io.h:457:26: sparse: sparse: cast to restricted __le16
   arch/m68k/include/asm/raw_io.h:457:26: sparse: sparse: cast to restricted __le16
   arch/m68k/include/asm/raw_io.h:457:26: sparse: sparse: cast to restricted __le16
   arch/m68k/include/asm/raw_io.h:457:26: sparse: sparse: cast to restricted __le16
--
>> drivers/comedi/drivers/dt282x.c:506:17: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/dt282x.c:506:17: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/dt282x.c:506:17: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/dt282x.c:506:17: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:507:17: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:507:17: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:507:17: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:507:17: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:508:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:508:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:508:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:508:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:563:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:563:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:563:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:563:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:617:23: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:617:23: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:617:23: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:617:23: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:939:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:939:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:939:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:939:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1043:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1043:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1043:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1043:9: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1049:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1049:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1049:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1049:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1050:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1050:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1050:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1050:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1051:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1051:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1051:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1051:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1052:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1052:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1052:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1052:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1053:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1053:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1053:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c:1053:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/dt282x.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/comedi/drivers/multiq3.c:87:18: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/multiq3.c:87:18: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/multiq3.c:87:18: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/multiq3.c:87:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/multiq3.c:155:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/multiq3.c:155:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/multiq3.c:155:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/multiq3.c:155:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/multiq3.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
>> drivers/comedi/drivers/ni_atmio16d.c:226:15: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/ni_atmio16d.c:226:15: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/ni_atmio16d.c:226:15: sparse: sparse: cast to restricted __le16
>> drivers/comedi/drivers/ni_atmio16d.c:226:15: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:447:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:447:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:447:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:447:18: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:488:27: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:488:27: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:488:27: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:488:27: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:535:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:535:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:535:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c:535:19: sparse: sparse: cast to restricted __le16
   drivers/comedi/drivers/ni_atmio16d.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +354 drivers/comedi/drivers/das1800.c

a69cc3a9fae82f drivers/staging/comedi/drivers/das1800.c Frank Mori Hess   2009-02-19  346  
73e183c347242c drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2012-05-23  347  static void das1800_handle_fifo_not_empty(struct comedi_device *dev,
73e183c347242c drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2012-05-23  348  					  struct comedi_subdevice *s)
73e183c347242c drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2012-05-23  349  {
605d76f6eb007a drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2014-11-05  350  	struct comedi_cmd *cmd = &s->async->cmd;
65a62aaec2e888 drivers/staging/comedi/drivers/das1800.c Ian Abbott        2013-10-16  351  	unsigned short dpnt;
a69cc3a9fae82f drivers/staging/comedi/drivers/das1800.c Frank Mori Hess   2009-02-19  352  
73e183c347242c drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2012-05-23  353  	while (inb(dev->iobase + DAS1800_STATUS) & FNE) {
73e183c347242c drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2012-05-23 @354  		dpnt = inw(dev->iobase + DAS1800_FIFO);
880f582068ab8d drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2014-10-22  355  		comedi_buf_write_samples(s, &dpnt, 1);
605d76f6eb007a drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2014-11-05  356  
605d76f6eb007a drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2014-11-05  357  		if (cmd->stop_src == TRIG_COUNT &&
605d76f6eb007a drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2014-11-05  358  		    s->async->scans_done >= cmd->stop_arg)
605d76f6eb007a drivers/staging/comedi/drivers/das1800.c H Hartley Sweeten 2014-11-05  359  			break;
a69cc3a9fae82f drivers/staging/comedi/drivers/das1800.c Frank Mori Hess   2009-02-19  360  	}
a69cc3a9fae82f drivers/staging/comedi/drivers/das1800.c Frank Mori Hess   2009-02-19  361  }
a69cc3a9fae82f drivers/staging/comedi/drivers/das1800.c Frank Mori Hess   2009-02-19  362  

:::::: The code at line 354 was first introduced by commit
:::::: 73e183c347242c90524f8913f1af5fc481ad5370 staging: comedi: das1800: complete the refactor to remove all forward declarations

:::::: TO: H Hartley Sweeten <hartleys@visionengravers.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
