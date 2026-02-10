Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5422E1662E7
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 01:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770688226; cv=none; b=tuHhrleGVuU+XW0ZD1z+NAeVKtxyIQRL4MdLKE4bzcN83PLbTMZG3lNZP6vw3QZTsulgFZ7Ry9gWiUgQvvkBmH27mF5mwLC8Ju4iDjT/OKYYuADyY40TuPbGgdZqKA6Py0esli+DXkfgQAt6dPgU3x7xkbMHuYjOYlK/s5Qu3pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770688226; c=relaxed/simple;
	bh=impw7OIa8koLNYTRiLOx9iAAYedHTAq2IpYxKn9oG0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n3FzD5ZdAf2UjAaBda5d+CBzP7V2WApxbXfoac64/r6V1TCqicubmDh/iY8Q55UwBEDyT0G8eP6kjSJ0xfM8CncVZb7KTM3H1pXswZBmEZkr24XG/k+Me1CU3XuwfBVa2EiUYYuI9b09momgiKCATQ2Yr3j7Vj2kmky28MEzlA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2ncMtlA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2ncMtlA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770688223; x=1802224223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=impw7OIa8koLNYTRiLOx9iAAYedHTAq2IpYxKn9oG0c=;
  b=J2ncMtlA1dcJoHJYx/cy+xRN4xRbfFQfQcBJVCt1Ync7LSYRAv9lerAS
   XmvHLnMFwm7jKa6ME3nMcQw6jYTM/lew1WfiwriKpsIKxnm2nVnkpd6RI
   /8jK8IaOQpSV2lXfNQ5POYuaFcDzvuq68K6gB2u9hYtT0bqKzd28bKLV8
   nz0t6ppPYn00cs+AvWVAYAJjn5etqcE6iupc0IIOsSFRiW0omaME75JyQ
   s48ebxRwFsO4bCyapSIVuplQbnRBd4mUlegjQ0mE7uAULEnrHGK5CAphB
   kExjzHBOLBfjmeOKdMe2qPpdSbDbsnVR6d2oeYz+LJd0Ab5NcIyN6NNtu
   A==;
X-CSE-ConnectionGUID: 6s2DfTZ6TE6w6k4fWm41bA==
X-CSE-MsgGUID: VgrlFChzT36IJSREmt5GFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="75434588"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="75434588"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 17:50:12 -0800
X-CSE-ConnectionGUID: 8YV+gIRsQUeiRQDOD7FtFQ==
X-CSE-MsgGUID: aQ8eE0D8TxOa0+MuWSeu6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211783399"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 09 Feb 2026 17:50:10 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpctD-00000000oVI-3DnN;
	Tue, 10 Feb 2026 01:50:07 +0000
Date: Tue, 10 Feb 2026 09:49:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
Message-ID: <202602100901.prDQ1kLj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260209095931.2813152-2-ruanjinjie@huawei.com>
References: <20260209095931.2813152-2-ruanjinjie@huawei.com>
TO: Jinjie Ruan <ruanjinjie@huawei.com>
TO: corbet@lwn.net
TO: catalin.marinas@arm.com
TO: will@kernel.org
TO: chenhuacai@kernel.org
TO: kernel@xen0n.name
TO: maddy@linux.ibm.com
TO: mpe@ellerman.id.au
TO: npiggin@gmail.com
TO: chleroy@kernel.org
TO: pjw@kernel.org
TO: palmer@dabbelt.com
TO: aou@eecs.berkeley.edu
TO: alex@ghiti.fr
TO: tglx@kernel.org
TO: mingo@redhat.com
TO: bp@alien8.de
TO: dave.hansen@linux.intel.com
TO: hpa@zytor.com
TO: akpm@linux-foundation.org
TO: bhe@redhat.com
TO: vgoyal@redhat.com
TO: dyoung@redhat.com
TO: rdunlap@infradead.org
TO: pmladek@suse.com
TO: feng.tang@linux.alibaba.com
TO: pawan.kumar.gupta@linux.intel.com
TO: kees@kernel.org
TO: elver@google.com
TO: arnd@arndb.de
TO: lirongqing@baidu.com

Hi Jinjie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on powerpc/next]
[also build test WARNING on powerpc/fixes arm64/for-next/core tip/x86/core linus/master v6.19 next-20260209]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jinjie-Ruan/crash-Exclude-crash-kernel-memory-in-crash-core/20260209-180157
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
patch link:    https://lore.kernel.org/r/20260209095931.2813152-2-ruanjinjie%40huawei.com
patch subject: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-randconfig-r072-20260209 (https://download.01.org/0day-ci/archive/20260210/202602100901.prDQ1kLj-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602100901.prDQ1kLj-lkp@intel.com/

smatch warnings:
kernel/crash_core.c:228 crash_prepare_elf64_headers() error: we previously assumed 'mem' could be null (see line 220)

vim +/mem +228 kernel/crash_core.c

aefb9e75df8949 Jinjie Ruan   2026-02-09  201  
aefb9e75df8949 Jinjie Ruan   2026-02-09  202  int crash_prepare_elf64_headers(int need_kernel_map, void **addr,
aefb9e75df8949 Jinjie Ruan   2026-02-09  203  				unsigned long *sz, unsigned long *nr_mem_ranges,
aefb9e75df8949 Jinjie Ruan   2026-02-09  204  				struct kimage *image, struct memory_notify *mn)
6f991cc363a326 Eric DeVolder 2023-08-14  205  {
6f991cc363a326 Eric DeVolder 2023-08-14  206  	unsigned long nr_cpus = num_possible_cpus(), nr_phdr, elf_sz;
6f991cc363a326 Eric DeVolder 2023-08-14  207  	unsigned long long notes_addr;
aefb9e75df8949 Jinjie Ruan   2026-02-09  208  	struct crash_mem *mem = NULL;
6f991cc363a326 Eric DeVolder 2023-08-14  209  	unsigned long mstart, mend;
aefb9e75df8949 Jinjie Ruan   2026-02-09  210  	unsigned int cpu, i;
aefb9e75df8949 Jinjie Ruan   2026-02-09  211  	unsigned char *buf;
aefb9e75df8949 Jinjie Ruan   2026-02-09  212  	Elf64_Ehdr *ehdr;
aefb9e75df8949 Jinjie Ruan   2026-02-09  213  	Elf64_Phdr *phdr;
aefb9e75df8949 Jinjie Ruan   2026-02-09  214  	int ret = 0;
aefb9e75df8949 Jinjie Ruan   2026-02-09  215  
aefb9e75df8949 Jinjie Ruan   2026-02-09  216  	ret = arch_get_crash_memory_ranges(&mem, nr_mem_ranges, image, mn);
aefb9e75df8949 Jinjie Ruan   2026-02-09  217  	if (ret)
aefb9e75df8949 Jinjie Ruan   2026-02-09  218  		return ret;
aefb9e75df8949 Jinjie Ruan   2026-02-09  219  
aefb9e75df8949 Jinjie Ruan   2026-02-09 @220  	if (mem) {
aefb9e75df8949 Jinjie Ruan   2026-02-09  221  		ret = crash_exclude_mem_ranges(mem, nr_mem_ranges);
aefb9e75df8949 Jinjie Ruan   2026-02-09  222  		if (ret)
aefb9e75df8949 Jinjie Ruan   2026-02-09  223  			goto out;
aefb9e75df8949 Jinjie Ruan   2026-02-09  224  	}
6f991cc363a326 Eric DeVolder 2023-08-14  225  
6f991cc363a326 Eric DeVolder 2023-08-14  226  	/* extra phdr for vmcoreinfo ELF note */
6f991cc363a326 Eric DeVolder 2023-08-14  227  	nr_phdr = nr_cpus + 1;
6f991cc363a326 Eric DeVolder 2023-08-14 @228  	nr_phdr += mem->nr_ranges;
6f991cc363a326 Eric DeVolder 2023-08-14  229  
6f991cc363a326 Eric DeVolder 2023-08-14  230  	/*
6f991cc363a326 Eric DeVolder 2023-08-14  231  	 * kexec-tools creates an extra PT_LOAD phdr for kernel text mapping
6f991cc363a326 Eric DeVolder 2023-08-14  232  	 * area (for example, ffffffff80000000 - ffffffffa0000000 on x86_64).
6f991cc363a326 Eric DeVolder 2023-08-14  233  	 * I think this is required by tools like gdb. So same physical
6f991cc363a326 Eric DeVolder 2023-08-14  234  	 * memory will be mapped in two ELF headers. One will contain kernel
6f991cc363a326 Eric DeVolder 2023-08-14  235  	 * text virtual addresses and other will have __va(physical) addresses.
6f991cc363a326 Eric DeVolder 2023-08-14  236  	 */
6f991cc363a326 Eric DeVolder 2023-08-14  237  
6f991cc363a326 Eric DeVolder 2023-08-14  238  	nr_phdr++;
6f991cc363a326 Eric DeVolder 2023-08-14  239  	elf_sz = sizeof(Elf64_Ehdr) + nr_phdr * sizeof(Elf64_Phdr);
6f991cc363a326 Eric DeVolder 2023-08-14  240  	elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
6f991cc363a326 Eric DeVolder 2023-08-14  241  
6f991cc363a326 Eric DeVolder 2023-08-14  242  	buf = vzalloc(elf_sz);
aefb9e75df8949 Jinjie Ruan   2026-02-09  243  	if (!buf) {
aefb9e75df8949 Jinjie Ruan   2026-02-09  244  		ret = -ENOMEM;
aefb9e75df8949 Jinjie Ruan   2026-02-09  245  		goto out;
aefb9e75df8949 Jinjie Ruan   2026-02-09  246  	}
6f991cc363a326 Eric DeVolder 2023-08-14  247  
6f991cc363a326 Eric DeVolder 2023-08-14  248  	ehdr = (Elf64_Ehdr *)buf;
6f991cc363a326 Eric DeVolder 2023-08-14  249  	phdr = (Elf64_Phdr *)(ehdr + 1);
6f991cc363a326 Eric DeVolder 2023-08-14  250  	memcpy(ehdr->e_ident, ELFMAG, SELFMAG);
6f991cc363a326 Eric DeVolder 2023-08-14  251  	ehdr->e_ident[EI_CLASS] = ELFCLASS64;
6f991cc363a326 Eric DeVolder 2023-08-14  252  	ehdr->e_ident[EI_DATA] = ELFDATA2LSB;
6f991cc363a326 Eric DeVolder 2023-08-14  253  	ehdr->e_ident[EI_VERSION] = EV_CURRENT;
6f991cc363a326 Eric DeVolder 2023-08-14  254  	ehdr->e_ident[EI_OSABI] = ELF_OSABI;
6f991cc363a326 Eric DeVolder 2023-08-14  255  	memset(ehdr->e_ident + EI_PAD, 0, EI_NIDENT - EI_PAD);
6f991cc363a326 Eric DeVolder 2023-08-14  256  	ehdr->e_type = ET_CORE;
6f991cc363a326 Eric DeVolder 2023-08-14  257  	ehdr->e_machine = ELF_ARCH;
6f991cc363a326 Eric DeVolder 2023-08-14  258  	ehdr->e_version = EV_CURRENT;
6f991cc363a326 Eric DeVolder 2023-08-14  259  	ehdr->e_phoff = sizeof(Elf64_Ehdr);
6f991cc363a326 Eric DeVolder 2023-08-14  260  	ehdr->e_ehsize = sizeof(Elf64_Ehdr);
6f991cc363a326 Eric DeVolder 2023-08-14  261  	ehdr->e_phentsize = sizeof(Elf64_Phdr);
6f991cc363a326 Eric DeVolder 2023-08-14  262  
a396d0f81b1c81 Eric DeVolder 2023-08-14  263  	/* Prepare one phdr of type PT_NOTE for each possible CPU */
a396d0f81b1c81 Eric DeVolder 2023-08-14  264  	for_each_possible_cpu(cpu) {
6f991cc363a326 Eric DeVolder 2023-08-14  265  		phdr->p_type = PT_NOTE;
6f991cc363a326 Eric DeVolder 2023-08-14  266  		notes_addr = per_cpu_ptr_to_phys(per_cpu_ptr(crash_notes, cpu));
6f991cc363a326 Eric DeVolder 2023-08-14  267  		phdr->p_offset = phdr->p_paddr = notes_addr;
6f991cc363a326 Eric DeVolder 2023-08-14  268  		phdr->p_filesz = phdr->p_memsz = sizeof(note_buf_t);
6f991cc363a326 Eric DeVolder 2023-08-14  269  		(ehdr->e_phnum)++;
6f991cc363a326 Eric DeVolder 2023-08-14  270  		phdr++;
6f991cc363a326 Eric DeVolder 2023-08-14  271  	}
6f991cc363a326 Eric DeVolder 2023-08-14  272  
6f991cc363a326 Eric DeVolder 2023-08-14  273  	/* Prepare one PT_NOTE header for vmcoreinfo */
6f991cc363a326 Eric DeVolder 2023-08-14  274  	phdr->p_type = PT_NOTE;
6f991cc363a326 Eric DeVolder 2023-08-14  275  	phdr->p_offset = phdr->p_paddr = paddr_vmcoreinfo_note();
6f991cc363a326 Eric DeVolder 2023-08-14  276  	phdr->p_filesz = phdr->p_memsz = VMCOREINFO_NOTE_SIZE;
6f991cc363a326 Eric DeVolder 2023-08-14  277  	(ehdr->e_phnum)++;
6f991cc363a326 Eric DeVolder 2023-08-14  278  	phdr++;
6f991cc363a326 Eric DeVolder 2023-08-14  279  
6f991cc363a326 Eric DeVolder 2023-08-14  280  	/* Prepare PT_LOAD type program header for kernel text region */
6f991cc363a326 Eric DeVolder 2023-08-14  281  	if (need_kernel_map) {
6f991cc363a326 Eric DeVolder 2023-08-14  282  		phdr->p_type = PT_LOAD;
6f991cc363a326 Eric DeVolder 2023-08-14  283  		phdr->p_flags = PF_R|PF_W|PF_X;
6f991cc363a326 Eric DeVolder 2023-08-14  284  		phdr->p_vaddr = (unsigned long) _text;
6f991cc363a326 Eric DeVolder 2023-08-14  285  		phdr->p_filesz = phdr->p_memsz = _end - _text;
6f991cc363a326 Eric DeVolder 2023-08-14  286  		phdr->p_offset = phdr->p_paddr = __pa_symbol(_text);
6f991cc363a326 Eric DeVolder 2023-08-14  287  		ehdr->e_phnum++;
6f991cc363a326 Eric DeVolder 2023-08-14  288  		phdr++;
6f991cc363a326 Eric DeVolder 2023-08-14  289  	}
6f991cc363a326 Eric DeVolder 2023-08-14  290  
6f991cc363a326 Eric DeVolder 2023-08-14  291  	/* Go through all the ranges in mem->ranges[] and prepare phdr */
6f991cc363a326 Eric DeVolder 2023-08-14  292  	for (i = 0; i < mem->nr_ranges; i++) {
6f991cc363a326 Eric DeVolder 2023-08-14  293  		mstart = mem->ranges[i].start;
6f991cc363a326 Eric DeVolder 2023-08-14  294  		mend = mem->ranges[i].end;
6f991cc363a326 Eric DeVolder 2023-08-14  295  
6f991cc363a326 Eric DeVolder 2023-08-14  296  		phdr->p_type = PT_LOAD;
6f991cc363a326 Eric DeVolder 2023-08-14  297  		phdr->p_flags = PF_R|PF_W|PF_X;
6f991cc363a326 Eric DeVolder 2023-08-14  298  		phdr->p_offset  = mstart;
6f991cc363a326 Eric DeVolder 2023-08-14  299  
6f991cc363a326 Eric DeVolder 2023-08-14  300  		phdr->p_paddr = mstart;
6f991cc363a326 Eric DeVolder 2023-08-14  301  		phdr->p_vaddr = (unsigned long) __va(mstart);
6f991cc363a326 Eric DeVolder 2023-08-14  302  		phdr->p_filesz = phdr->p_memsz = mend - mstart + 1;
6f991cc363a326 Eric DeVolder 2023-08-14  303  		phdr->p_align = 0;
6f991cc363a326 Eric DeVolder 2023-08-14  304  		ehdr->e_phnum++;
a85ee18c7900f0 Baoquan He    2023-12-13  305  #ifdef CONFIG_KEXEC_FILE
a85ee18c7900f0 Baoquan He    2023-12-13  306  		kexec_dprintk("Crash PT_LOAD ELF header. phdr=%p vaddr=0x%llx, paddr=0x%llx, sz=0x%llx e_phnum=%d p_offset=0x%llx\n",
6f991cc363a326 Eric DeVolder 2023-08-14  307  			      phdr, phdr->p_vaddr, phdr->p_paddr, phdr->p_filesz,
6f991cc363a326 Eric DeVolder 2023-08-14  308  			      ehdr->e_phnum, phdr->p_offset);
a85ee18c7900f0 Baoquan He    2023-12-13  309  #endif
6f991cc363a326 Eric DeVolder 2023-08-14  310  		phdr++;
6f991cc363a326 Eric DeVolder 2023-08-14  311  	}
6f991cc363a326 Eric DeVolder 2023-08-14  312  
6f991cc363a326 Eric DeVolder 2023-08-14  313  	*addr = buf;
6f991cc363a326 Eric DeVolder 2023-08-14  314  	*sz = elf_sz;
aefb9e75df8949 Jinjie Ruan   2026-02-09  315  
aefb9e75df8949 Jinjie Ruan   2026-02-09  316  out:
aefb9e75df8949 Jinjie Ruan   2026-02-09  317  	kvfree(mem);
aefb9e75df8949 Jinjie Ruan   2026-02-09  318  	return ret;
6f991cc363a326 Eric DeVolder 2023-08-14  319  }
6f991cc363a326 Eric DeVolder 2023-08-14  320  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
