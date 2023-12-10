Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754C863A
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Dec 2023 12:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5EwetJb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702212008; x=1733748008;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7A255d+haUu+TPptJ+tHZNcu/ncZuX0jYHJ0M1jdrLM=;
  b=I5EwetJbVji7lIV4MkqBEtx0Qd2aNQnNCirhsRIEKkUjU2W/1EhG97Ob
   BJjHr5UKJiSeXgagDooPgMd9RHY18m6aqDBhEEigPKMZLYRqPmeaeRAJQ
   KTnvcG1cGx4IdHKLcm3FZDL5swIWoQ6WpKiCTkSbtA/uBRj9vrNV0cSWp
   wnAUdeVPmG06XP2tLWpgvEvCYQyVSpokfURpxTRU49qdD0ZZi0hs18d5p
   ZyfAa/9hsbO810Dy7QMeJIBaXDXfRuxIqfVxUBD1HOKVYMzw5X0KsKdQy
   qoA9UCcdQx5PUoLKXvXt2Ld2zj5LhuWx2stg8yGggCrDFo2YWJO4JNfvE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="16101937"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="16101937"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 04:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10919"; a="863428335"
X-IronPort-AV: E=Sophos;i="6.04,265,1695711600"; 
   d="scan'208";a="863428335"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 10 Dec 2023 04:40:05 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCJ6J-000GpW-0q;
	Sun, 10 Dec 2023 12:40:03 +0000
Date: Sun, 10 Dec 2023 20:39:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: hcd.c:(.text+0x355a): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312102024.BAUcqiJU-lkp@intel.com>
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
TO: Anthony Iliopoulos <ailiop@suse.com>
CC: Chandan Babu R <chandanbabu@kernel.org>
CC: Dave Chinner <dchinner@redhat.com>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c527f5606aa545233a4d2c6d5c636ed82b8633ef
commit: a2e4388adfa44684c7c428a5a5980efe0d75e13e xfs: fix again select in kconfig XFS_ONLINE_SCRUB_STATS
date:   4 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 weeks ago
config: csky-randconfig-r011-20230302 (https://download.01.org/0day-ci/archive/20231210/202312102024.BAUcqiJU-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231210/202312102024.BAUcqiJU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312102024.BAUcqiJU-lkp@intel.com/

All errors (new ones prefixed by >>):

   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/rapidio/switches/idt_gen3.o: defined in discarded section `.exit.text' of drivers/rapidio/switches/idt_gen3.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/s3fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/s3fb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/s3fb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/s3fb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/arkfb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/arkfb.o
   `.exit.text' referenced in section `__jump_table' of drivers/video/fbdev/arkfb.o: defined in discarded section `.exit.text' of drivers/video/fbdev/arkfb.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   `.exit.text' referenced in section `__jump_table' of drivers/misc/phantom.o: defined in discarded section `.exit.text' of drivers/misc/phantom.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   `.exit.text' referenced in section `__jump_table' of drivers/target/target_core_configfs.o: defined in discarded section `.exit.text' of drivers/target/target_core_configfs.o
   drivers/usb/dwc2/hcd.o: in function `dwc2_hcd_dump_state':
>> hcd.c:(.text+0x355a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   hcd.c:(.text+0x356c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   hcd.c:(.text+0x357e): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   hcd.c:(.text+0x3594): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   hcd.c:(.text+0x35b8): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   hcd.c:(.text+0x35e0): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   hcd.c:(.text+0x35f8): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   hcd.c:(.text+0x3610): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   hcd.c:(.text+0x3628): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   hcd.c:(.text+0x3640): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   hcd.c:(.text+0x3658): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
