Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED27D30B
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Feb 2023 03:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676519236; x=1708055236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qe1fENTRuDAqypLdLZLV01l0ajAqo18Rz+DTe7A/f50=;
  b=XGQHtUWXCZkd+aoY9TCnJDZnGZXX0Bs/Zh4is+1aC03bI0PseFzA3hiz
   abmDSpP6bHb0NlUpqQLGEe5fVg+2OwM8lcPYrKkjot6beJF9Tq/HQaNs7
   rM6LYOftJ9iT8UBuWNcySJazOwK5he70sfEPncaIqN+fgEUFsCCxDh/GT
   GsPMuxMunf6hb+LHyo1u7l1D9w3CTC34xcnea8Tqd1SDNoUBhwWawBsEV
   LFEjSfJQpy7edqvgXgxETLlIPgQhwqF5Y2lO350XAgGAkstomeUHPGDzs
   LG+pvJHqKUc54yGEavQ51wlEwEJgsVJjB3CoWgzrkRLZCqfytSK93P7ju
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="331616285"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="331616285"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 19:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="733716272"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="733716272"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Feb 2023 19:47:14 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSVEo-0009z9-0j;
	Thu, 16 Feb 2023 03:47:14 +0000
Date: Thu, 16 Feb 2023 11:46:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jpoimboe:arch-cpu-idle-dead-noreturn 25/25] vmlinux.o: warning:
 objtool: x86_64_start_reservations+0x28: unreachable instruction
Message-ID: <202302161142.K3ziREaj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: vmlinux.o: warning: objtool: x86_64_start_reservations+0x28: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Josh Poimboeuf <jpoimboe@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git arch-cpu-idle-dead-noreturn
head:   78a61657ee5ece4553db7f8e89acbcfed22020b2
commit: 78a61657ee5ece4553db7f8e89acbcfed22020b2 [25/25] sched/idle: Mark arch_cpu_idle_dead() __noreturn
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/20230216/202302161142.K3ziREaj-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=78a61657ee5ece4553db7f8e89acbcfed22020b2
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe arch-cpu-idle-dead-noreturn
        git checkout 78a61657ee5ece4553db7f8e89acbcfed22020b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302161142.K3ziREaj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> vmlinux.o: warning: objtool: x86_64_start_reservations+0x28: unreachable instruction


objdump-func vmlinux.o x86_64_start_reservations:
0000 00000000000005d6 <x86_64_start_reservations>:
0000      5d6:	f3 0f 1e fa          	endbr64
0004      5da:	55                   	push   %rbp
0005      5db:	66 83 3d 00 00 00 00 00 	cmpw   $0x0,0x0(%rip)        # 5e3 <x86_64_start_reservations+0xd>	5de: R_X86_64_PC32	boot_params+0x201
000d      5e3:	48 89 e5             	mov    %rsp,%rbp
0010      5e6:	75 0c                	jne    5f4 <x86_64_start_reservations+0x1e>
0012      5e8:	48 03 3d 00 00 00 00 	add    0x0(%rip),%rdi        # 5ef <x86_64_start_reservations+0x19>	5eb: R_X86_64_PC32	page_offset_base-0x4
0019      5ef:	e8 67 fc ff ff       	call   25b <copy_bootdata>
001e      5f4:	e8 00 00 00 00       	call   5f9 <x86_64_start_reservations+0x23>	5f5: R_X86_64_PLT32	x86_early_init_platform_quirks-0x4
0023      5f9:	e8 00 00 00 00       	call   5fe <x86_64_start_reservations+0x28>	5fa: R_X86_64_PLT32	start_kernel-0x4
0028      5fe:	5d                   	pop    %rbp
0029      5ff:	c3                   	ret

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
