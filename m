Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5B9125A4
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Jan 2024 05:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LYgutrX0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704605708; x=1736141708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yQFNF05/QhxXkmqriRwXsm1b3ZgU5431zk77iUeiHps=;
  b=LYgutrX09lP5W7aCY0rYnRbCv1pl7GufArET0b5fITUNbuOAYz6rqk5y
   z4nI94WNROu3WZozXDEMsAETHdCLoPrVq+5kRf1a1so+lI95lRnunX+6z
   ybLMt0hnJExjMYKK2n+yompWBg4DZ2CV5e7lo6/xBiLMRsOZV6USOJWUO
   vf5at7V49PivJ0OG3N5PMkaKPA/ti0vC6T56w0WtDflFhaJCFwl9PfEkd
   N/m/buGmln4CmVC62yAjD1GQDGjJQ3wm9akCsSap93e009yd+0+GfVGR+
   xAIRJufeaMrgCgXO3kHcTL65nBqbZMuluwXL8Zhzsgkx7w933sQfvy/H1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="394874923"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="394874923"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 21:35:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="1028110600"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="1028110600"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 06 Jan 2024 21:35:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMLoJ-0003Qe-19;
	Sun, 07 Jan 2024 05:34:59 +0000
Date: Sun, 7 Jan 2024 13:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 5/5] crash: clean up CRASH_DUMP
Message-ID: <202401071326.52yn9Ftd-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: ld.lld: error: undefined symbol: crashk_res"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240105103305.557273-6-bhe@redhat.com>
References: <20240105103305.557273-6-bhe@redhat.com>
TO: Baoquan He <bhe@redhat.com>
TO: linux-kernel@vger.kernel.org
CC: akpm@linux-foundation.org
CC: kexec@lists.infradead.org
CC: hbathini@linux.ibm.com
CC: arnd@arndb.de
CC: ignat@cloudflare.com
CC: eric_devolder@yahoo.com
CC: viro@zeniv.linux.org.uk
CC: ebiederm@xmission.com
CC: x86@kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-riscv@lists.infradead.org
CC: linux-fsdevel@vger.kernel.org
CC: Baoquan He <bhe@redhat.com>
CC: kernel test robot <lkp@intel.com>

Hi Baoquan,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.7-rc8]
[cannot apply to powerpc/next powerpc/fixes tip/x86/core arm64/for-next/core next-20240105]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baoquan-He/kexec_core-move-kdump-related-codes-from-crash_core-c-to-kexec_core-c/20240105-223735
base:   linus/master
patch link:    https://lore.kernel.org/r/20240105103305.557273-6-bhe%40redhat.com
patch subject: [PATCH 5/5] crash: clean up CRASH_DUMP
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-122-20240106 (https://download.01.org/0day-ci/archive/20240107/202401071326.52yn9Ftd-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240107/202401071326.52yn9Ftd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401071326.52yn9Ftd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: crashk_res
   >>> referenced by initramfs.c:638 (init/initramfs.c:638)
   >>>               init/initramfs.o:(kexec_free_initrd) in archive vmlinux.a
   >>> referenced by initramfs.c:638 (init/initramfs.c:638)
   >>>               init/initramfs.o:(kexec_free_initrd) in archive vmlinux.a
   >>> referenced by initramfs.c:0 (init/initramfs.c:0)
   >>>               init/initramfs.o:(kexec_free_initrd) in archive vmlinux.a
   >>> referenced 77 more times
--
>> ld.lld: error: undefined symbol: parse_crashkernel
   >>> referenced by setup.c:479 (arch/x86/kernel/setup.c:479)
   >>>               arch/x86/kernel/setup.o:(arch_reserve_crashkernel) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: crashk_low_res
   >>> referenced by machine_kexec_64.c:539 (arch/x86/kernel/machine_kexec_64.c:539)
   >>>               arch/x86/kernel/machine_kexec_64.o:(kexec_mark_crashkres) in archive vmlinux.a
   >>> referenced by machine_kexec_64.c:539 (arch/x86/kernel/machine_kexec_64.c:539)
   >>>               arch/x86/kernel/machine_kexec_64.o:(kexec_mark_crashkres) in archive vmlinux.a
   >>> referenced by machine_kexec_64.c:539 (arch/x86/kernel/machine_kexec_64.c:539)
   >>>               arch/x86/kernel/machine_kexec_64.o:(kexec_mark_crashkres) in archive vmlinux.a
   >>> referenced 36 more times
--
>> ld.lld: error: undefined symbol: crash_update_vmcoreinfo_safecopy
   >>> referenced by kexec_core.c:522 (kernel/kexec_core.c:522)
   >>>               kernel/kexec_core.o:(kimage_crash_copy_vmcoreinfo) in archive vmlinux.a
   >>> referenced by kexec_core.c:610 (kernel/kexec_core.c:610)
   >>>               kernel/kexec_core.o:(kimage_free) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: crash_save_vmcoreinfo
   >>> referenced by kexec_core.c:1053 (kernel/kexec_core.c:1053)
   >>>               kernel/kexec_core.o:(__crash_kexec) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: paddr_vmcoreinfo_note
   >>> referenced by kexec_core.c:1148 (kernel/kexec_core.c:1148)
   >>>               kernel/kexec_core.o:(crash_prepare_elf64_headers) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: append_elf_note
   >>> referenced by kexec_core.c:1390 (kernel/kexec_core.c:1390)
   >>>               kernel/kexec_core.o:(crash_save_cpu) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: final_note
   >>> referenced by kexec_core.c:1392 (kernel/kexec_core.c:1392)
   >>>               kernel/kexec_core.o:(crash_save_cpu) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
