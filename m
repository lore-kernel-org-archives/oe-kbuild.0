Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A9A13ADE
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 09:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlJJ2qqG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702978572; x=1734514572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uXMT34pbHNgFASg/rK7eqNRFUoR7E+Itvr/Pqd1bQe0=;
  b=OlJJ2qqGYXXuClYI2hWlvEManTD9KSBcBsimM2V5geAaAB4+Ue+ceOH1
   01IrYqUwF+aDGIsIpV/IbWCwSxcpsAzz0RyHNt7B4hpuhhN4qj9hmy1+d
   eE7yLulxf5B1QenfrOUJgINHJXYCJkHbE4nByghbhrQZ9QfrsVn1RT0Cr
   d0yMA/ekp6y7w+dBU2RfYJlCuCdYV2C8yoC/M+zpvzpxbDPF93L2jf0Xj
   UnCfRIjwRc1BmugRylv4yQPMQtsgMtMqIG0MZrwA8yBqHfKO+LmY2GJa0
   7E+1glXfitzXolmK6/os65KCsfAeO0USiZoKpdZwpZpH3cIX+ALymR57c
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="394510722"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="394510722"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 01:36:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="846279898"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="846279898"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 19 Dec 2023 01:36:10 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFWWG-00058L-2C;
	Tue, 19 Dec 2023 09:36:08 +0000
Date: Tue, 19 Dec 2023 17:35:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: tcp_output.c:(.text+0x21e4): relocation truncated to fit:
 R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
Message-ID: <202312191720.1uemhtGw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "csky general problem: relocation truncated to fit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Dmitry Safonov <dima@arista.com>
CC: Francesco Ruggeri <fruggeri@arista.com>
CC: Salam Noureddine <noureddine@arista.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2cf4f94d8e8646803f8fb0facf134b0cd7fb691a
commit: 1e03d32bea8e782b7d31769c25a5fae8a5044488 net/tcp: Add TCP-AO sign to outgoing packets
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: csky-randconfig-r131-20231123 (https://download.01.org/0day-ci/archive/20231219/202312191720.1uemhtGw-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191720.1uemhtGw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312191720.1uemhtGw-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ipv4/tcp_output.o: in function `tcp_syn_options.isra.0':
>> tcp_output.c:(.text+0x21e4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   tcp_output.c:(.text+0x21f4): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   tcp_output.c:(.text+0x21fc): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   tcp_output.c:(.text+0x2204): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   tcp_output.c:(.text+0x2226): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   tcp_output.c:(.text+0x223a): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   tcp_output.c:(.text+0x225c): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   tcp_output.c:(.text+0x2294): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   net/ipv4/tcp_output.o: in function `tcp_connect_init':
   tcp_output.c:(.text+0x22ea): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   tcp_output.c:(.text+0x2328): relocation truncated to fit: R_CKCORE_PCREL_IMM16BY4 against `__jump_table'
   tcp_output.c:(.text+0x2338): additional relocation overflows omitted from the output

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
