Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43810525E
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Sep 2023 11:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695727894; x=1727263894;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Z5TBuFazWK+cjzobopbBmr9qi960UBPAZwXx5oEsIT8=;
  b=eTpf7I+J2IoipBU9HUevW4crxcu4OHo/CkDJnR2guq34nxPfkCkE3JwI
   EmZ6zsaOsq+Q+xEK/vjkifR+zgLMrvJads+6jt1PhDJOyBciyKjtdAh2Z
   DxNF0pgt/Lm9Y1gdaO4om6bjWLCISJ3BXYM91m+QzXuhyS5J1jeF6jiXD
   wmPrQmwzt7qVmY9C2HcLVWuFfl73GpjyVZsCVt0Dt7BNrxyNEzhepvg7l
   uQNmuBQTokC29n/DjYfqRDQ3GVKovYEPh4nhNNZdDivcuhbRrEMbwkBE7
   Vwz0PmVNw5jRI04E11fCnFo0mA1cFiTAap/uJRZHgTsHStrAMJLL92u+G
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="366602508"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="366602508"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2023 04:31:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="995801012"
X-IronPort-AV: E=Sophos;i="6.03,177,1694761200"; 
   d="scan'208";a="995801012"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2023 04:31:31 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ql6Hp-0002lD-1p;
	Tue, 26 Sep 2023 11:31:29 +0000
Date: Tue, 26 Sep 2023 19:31:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] binfmt_elf: Support segments with 0 filesz and
 misaligned starts
Message-ID: <202309261925.QvgPAYL7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <87jzsemmsd.fsf_-_@email.froward.int.ebiederm.org>
References: <87jzsemmsd.fsf_-_@email.froward.int.ebiederm.org>
TO: "Eric W. Biederman" <ebiederm@xmission.com>
TO: Sebastian Ott <sebott@redhat.com>
CC: "Thomas Weiﬂschuh" <linux@weissschuh.net>
CC: Alexander Viro <viro@zeniv.linux.org.uk>
CC: Christian Brauner <brauner@kernel.org>
CC: Kees Cook <keescook@chromium.org>
CC: Mark Brown <broonie@kernel.org>
CC: Willy Tarreau <w@1wt.eu>
CC: linux-fsdevel@vger.kernel.org
CC: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: stable@vger.kernel.org

Hi Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kees/for-next/execve]
[also build test WARNING on linus/master v6.6-rc3 next-20230926]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eric-W-Biederman/binfmt_elf-Support-segments-with-0-filesz-and-misaligned-starts/20230925-210022
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
patch link:    https://lore.kernel.org/r/87jzsemmsd.fsf_-_%40email.froward.int.ebiederm.org
patch subject: [PATCH] binfmt_elf: Support segments with 0 filesz and misaligned starts
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: i386-randconfig-141-20230926 (https://download.01.org/0day-ci/archive/20230926/202309261925.QvgPAYL7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230926/202309261925.QvgPAYL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309261925.QvgPAYL7-lkp@intel.com/

smatch warnings:
fs/binfmt_elf.c:431 elf_load() error: uninitialized symbol 'map_addr'.

vim +/map_addr +431 fs/binfmt_elf.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  389  
a6409120b31666 Eric W. Biederman 2023-09-25  390  static unsigned long elf_load(struct file *filep, unsigned long addr,
a6409120b31666 Eric W. Biederman 2023-09-25  391  		const struct elf_phdr *eppnt, int prot, int type,
a6409120b31666 Eric W. Biederman 2023-09-25  392  		unsigned long total_size)
a6409120b31666 Eric W. Biederman 2023-09-25  393  {
a6409120b31666 Eric W. Biederman 2023-09-25  394  	unsigned long zero_start, zero_end;
a6409120b31666 Eric W. Biederman 2023-09-25  395  	unsigned long map_addr;
a6409120b31666 Eric W. Biederman 2023-09-25  396  
a6409120b31666 Eric W. Biederman 2023-09-25  397  	if (eppnt->p_filesz) {
a6409120b31666 Eric W. Biederman 2023-09-25  398  		map_addr = elf_map(filep, addr, eppnt, prot, type, total_size);
a6409120b31666 Eric W. Biederman 2023-09-25  399  		if (BAD_ADDR(map_addr))
a6409120b31666 Eric W. Biederman 2023-09-25  400  			return map_addr;
a6409120b31666 Eric W. Biederman 2023-09-25  401  		if (eppnt->p_memsz > eppnt->p_filesz) {
a6409120b31666 Eric W. Biederman 2023-09-25  402  			zero_start = map_addr + ELF_PAGEOFFSET(eppnt->p_vaddr) +
a6409120b31666 Eric W. Biederman 2023-09-25  403  				eppnt->p_filesz;
a6409120b31666 Eric W. Biederman 2023-09-25  404  			zero_end = map_addr + ELF_PAGEOFFSET(eppnt->p_vaddr) +
a6409120b31666 Eric W. Biederman 2023-09-25  405  				eppnt->p_memsz;
a6409120b31666 Eric W. Biederman 2023-09-25  406  
a6409120b31666 Eric W. Biederman 2023-09-25  407  			/* Zero the end of the last mapped page */
a6409120b31666 Eric W. Biederman 2023-09-25  408  			padzero(zero_start);
a6409120b31666 Eric W. Biederman 2023-09-25  409  		}
a6409120b31666 Eric W. Biederman 2023-09-25  410  	} else {
a6409120b31666 Eric W. Biederman 2023-09-25  411  		zero_start = ELF_PAGESTART(addr);
a6409120b31666 Eric W. Biederman 2023-09-25  412  		zero_end = zero_start + ELF_PAGEOFFSET(eppnt->p_vaddr) +
a6409120b31666 Eric W. Biederman 2023-09-25  413  			eppnt->p_memsz;
a6409120b31666 Eric W. Biederman 2023-09-25  414  	}
a6409120b31666 Eric W. Biederman 2023-09-25  415  	if (eppnt->p_memsz > eppnt->p_filesz) {
a6409120b31666 Eric W. Biederman 2023-09-25  416  		/*
a6409120b31666 Eric W. Biederman 2023-09-25  417  		 * Map the last of the segment.
a6409120b31666 Eric W. Biederman 2023-09-25  418  		 * If the header is requesting these pages to be
a6409120b31666 Eric W. Biederman 2023-09-25  419  		 * executable, honour that (ppc32 needs this).
a6409120b31666 Eric W. Biederman 2023-09-25  420  		 */
a6409120b31666 Eric W. Biederman 2023-09-25  421  		int error;
a6409120b31666 Eric W. Biederman 2023-09-25  422  
a6409120b31666 Eric W. Biederman 2023-09-25  423  		zero_start = ELF_PAGEALIGN(zero_start);
a6409120b31666 Eric W. Biederman 2023-09-25  424  		zero_end = ELF_PAGEALIGN(zero_end);
a6409120b31666 Eric W. Biederman 2023-09-25  425  
a6409120b31666 Eric W. Biederman 2023-09-25  426  		error = vm_brk_flags(zero_start, zero_end - zero_start,
a6409120b31666 Eric W. Biederman 2023-09-25  427  				     prot & PROT_EXEC ? VM_EXEC : 0);
a6409120b31666 Eric W. Biederman 2023-09-25  428  		if (error)
a6409120b31666 Eric W. Biederman 2023-09-25  429  			map_addr = error;
a6409120b31666 Eric W. Biederman 2023-09-25  430  	}
a6409120b31666 Eric W. Biederman 2023-09-25 @431  	return map_addr;
a6409120b31666 Eric W. Biederman 2023-09-25  432  }
a6409120b31666 Eric W. Biederman 2023-09-25  433  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
