Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA3C1844
	for <oe-kbuild@lists.linux.dev>; Sun,  2 Apr 2023 05:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680412011; x=1711948011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AO2etIRRZ423XtcPdyAmC3SHOZQx7jp4420WMR7wBns=;
  b=mT9uvUBVvlmUhm2bS23oUJgO0Gmpzr2+OTrm79mM6ezZqQ5bKaczSUls
   6U6HwswPTRh3gIRGigKYgrxqODpRufXlf9M9ikVEPv/ZPUDrIHTlB0wpc
   TUy684QcD1G7QEOcrrv9yGkiVLURj2doMksKzLdhrpfPiuHVgH1751GAH
   4ZAgnevHA7+rXfn5RTIcpsBFX7IWby7A0OPE+R7Z804aTHDnfZ2GHy3QK
   scC0o4iCI1Jtw3hXRP7y/MghWaXDMFtHFpN9/pL5BGh/o7wvQnYqTsn3S
   ig4WD+XnzzGCN+h+TQ1ubeHaiZ7SzIkuUsmren4qVlOKNyumhcnIpfD4p
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="341724118"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="341724118"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2023 22:06:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10667"; a="796611460"
X-IronPort-AV: E=Sophos;i="5.98,312,1673942400"; 
   d="scan'208";a="796611460"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2023 22:06:49 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pipvU-000NF3-2C;
	Sun, 02 Apr 2023 05:06:48 +0000
Date: Sun, 2 Apr 2023 13:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/arm64/kernel/compat_alignment.c:333 do_compat_alignment_fixup()
 error: uninitialized symbol 'tinst2'.
Message-ID: <202304021214.gekJ8yRc-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   00c7b5f4ddc5b346df62b757ec73f9357bb452af
commit: 3fc24ef32d3b9368f4c103dcd21d6a3f959b4870 arm64: compat: Implement misalignment fixups for multiword loads
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230402/202304021214.gekJ8yRc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304021214.gekJ8yRc-lkp@intel.com/

smatch warnings:
arch/arm64/kernel/compat_alignment.c:333 do_compat_alignment_fixup() error: uninitialized symbol 'tinst2'.

vim +/tinst2 +333 arch/arm64/kernel/compat_alignment.c

3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  309  
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  310  int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  311  {
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  312  	union offset_union offset;
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  313  	unsigned long instrptr;
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  314  	int (*handler)(unsigned long addr, u32 instr, struct pt_regs *regs);
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  315  	unsigned int type;
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  316  	u32 instr = 0;
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  317  	u16 tinstr = 0;
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  318  	int isize = 4;
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  319  	int thumb2_32b = 0;
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  320  	int fault;
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  321  
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  322  	instrptr = instruction_pointer(regs);
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  323  
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  324  	if (compat_thumb_mode(regs)) {
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  325  		__le16 __user *ptr = (__le16 __user *)(instrptr & ~1);
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  326  
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  327  		fault = alignment_get_thumb(regs, ptr, &tinstr);
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  328  		if (!fault) {
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  329  			if (IS_T32(tinstr)) {
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  330  				/* Thumb-2 32-bit */
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  331  				u16 tinst2;
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01  332  				fault = alignment_get_thumb(regs, ptr + 1, &tinst2);
3fc24ef32d3b93 Ard Biesheuvel 2022-07-01 @333  				instr = ((u32)tinstr << 16) | tinst2;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
