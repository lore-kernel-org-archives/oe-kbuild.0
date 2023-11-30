Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB9E4CB2D
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 05:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdMpu5D3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701322006; x=1732858006;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qxvWVFmr7GQOuvWWMHNxBGjKfoqOlXN7orEBfdUf1EM=;
  b=BdMpu5D3yazjWBBe7rj3ckWsf5m5owxeIaWdBFE5FQRHncZGel+GL6yn
   jghlLmAtozqZKU3fRt9cD+Dlg0xU5rqN3nay075JUPdvvc20XexGH2Blq
   J/aoIxCp/r4IiTHidEnwV9eBtl5GroDwMYH4H1iG1qLQbsUTw58yYcNTU
   rWRyfnGl28DWU3OlJHUKYJIoqciya7QexwOXzxN7eQLWL12lUUPI3Az2o
   7gIErbc07GB2ttr8oo18ePTvoePLnYRttK7TDs/uE4GXA5VeLLyrHO6Gj
   mXOvBu5VjwlpsQiVqogY6NQy32eK9S7Uw8/ZeUBKNCzPkWFZu8zMCNopc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="257395"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="257395"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 21:26:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="10634132"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 29 Nov 2023 21:26:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8ZZE-0001PV-1g;
	Thu, 30 Nov 2023 05:26:36 +0000
Date: Thu, 30 Nov 2023 13:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/thunderbolt/tb_regs.h:190:32: sparse: sparse: typeof applied
 to bitfield type
Message-ID: <202311301352.oZMsHF1B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/thunderbolt/tb_regs.h:190:32: sparse: sparse: typeof applied to bitfield type"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Gil Fine <gil.fine@intel.com>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 6e21007d0f7e6723bb67e79aa3d0081419c403e8 thunderbolt: Identify USB4 v2 routers
date:   6 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 6 months ago
config: loongarch-randconfig-r034-20230511 (https://download.01.org/0day-ci/archive/20231130/202311301352.oZMsHF1B-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311301352.oZMsHF1B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311301352.oZMsHF1B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/thunderbolt/tb.c: note: in included file (through drivers/thunderbolt/tb.h):
>> drivers/thunderbolt/tb_regs.h:190:32: sparse: sparse: typeof applied to bitfield type
--
   drivers/thunderbolt/path.c: note: in included file (through drivers/thunderbolt/tb.h):
>> drivers/thunderbolt/tb_regs.h:190:32: sparse: sparse: typeof applied to bitfield type
--
   drivers/thunderbolt/tunnel.c: note: in included file (through drivers/thunderbolt/tb.h, drivers/thunderbolt/tunnel.h):
>> drivers/thunderbolt/tb_regs.h:190:32: sparse: sparse: typeof applied to bitfield type
--
   drivers/thunderbolt/eeprom.c: note: in included file (through drivers/thunderbolt/tb.h):
>> drivers/thunderbolt/tb_regs.h:190:32: sparse: sparse: typeof applied to bitfield type
--
   drivers/thunderbolt/tmu.c: note: in included file (through drivers/thunderbolt/tb.h):
>> drivers/thunderbolt/tb_regs.h:190:32: sparse: sparse: typeof applied to bitfield type
--
   drivers/thunderbolt/usb4.c: note: in included file (through drivers/thunderbolt/tb.h):
>> drivers/thunderbolt/tb_regs.h:190:32: sparse: sparse: typeof applied to bitfield type
--
   drivers/thunderbolt/clx.c: note: in included file (through drivers/thunderbolt/tb.h):
>> drivers/thunderbolt/tb_regs.h:190:32: sparse: sparse: typeof applied to bitfield type
--
   drivers/thunderbolt/debugfs.c: note: in included file (through drivers/thunderbolt/tb.h):
>> drivers/thunderbolt/tb_regs.h:190:32: sparse: sparse: typeof applied to bitfield type

vim +190 drivers/thunderbolt/tb_regs.h

7adf60972c692b Andreas Noever  2014-06-03  164  
7adf60972c692b Andreas Noever  2014-06-03  165  /* Present on port 0 in TB_CFG_SWITCH at address zero. */
7adf60972c692b Andreas Noever  2014-06-03  166  struct tb_regs_switch_header {
7adf60972c692b Andreas Noever  2014-06-03  167  	/* DWORD 0 */
7adf60972c692b Andreas Noever  2014-06-03  168  	u16 vendor_id;
7adf60972c692b Andreas Noever  2014-06-03  169  	u16 device_id;
7adf60972c692b Andreas Noever  2014-06-03  170  	/* DWORD 1 */
7adf60972c692b Andreas Noever  2014-06-03  171  	u32 first_cap_offset:8;
7adf60972c692b Andreas Noever  2014-06-03  172  	u32 upstream_port_number:6;
7adf60972c692b Andreas Noever  2014-06-03  173  	u32 max_port_number:6;
7adf60972c692b Andreas Noever  2014-06-03  174  	u32 depth:3;
7adf60972c692b Andreas Noever  2014-06-03  175  	u32 __unknown1:1;
7adf60972c692b Andreas Noever  2014-06-03  176  	u32 revision:8;
7adf60972c692b Andreas Noever  2014-06-03  177  	/* DWORD 2 */
7adf60972c692b Andreas Noever  2014-06-03  178  	u32 route_lo;
7adf60972c692b Andreas Noever  2014-06-03  179  	/* DWORD 3 */
7adf60972c692b Andreas Noever  2014-06-03  180  	u32 route_hi:31;
7adf60972c692b Andreas Noever  2014-06-03  181  	bool enabled:1;
7adf60972c692b Andreas Noever  2014-06-03  182  	/* DWORD 4 */
7adf60972c692b Andreas Noever  2014-06-03  183  	u32 plug_events_delay:8; /*
7adf60972c692b Andreas Noever  2014-06-03  184  				  * RW, pause between plug events in
7adf60972c692b Andreas Noever  2014-06-03  185  				  * milliseconds. Writing 0x00 is interpreted
7adf60972c692b Andreas Noever  2014-06-03  186  				  * as 255ms.
7adf60972c692b Andreas Noever  2014-06-03  187  				  */
b04079837b2094 Mika Westerberg 2019-12-17  188  	u32 cmuv:8;
b04079837b2094 Mika Westerberg 2019-12-17  189  	u32 __unknown4:8;
7adf60972c692b Andreas Noever  2014-06-03 @190  	u32 thunderbolt_version:8;
7adf60972c692b Andreas Noever  2014-06-03  191  } __packed;
7adf60972c692b Andreas Noever  2014-06-03  192  

:::::: The code at line 190 was first introduced by commit
:::::: 7adf60972c692b0b3d0958cd7322e22a67187111 thunderbolt: Add tb_regs.h

:::::: TO: Andreas Noever <andreas.noever@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
