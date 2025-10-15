Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2CD26B764
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Oct 2025 16:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760545439; cv=none; b=izPOj/qmcwEbhllousr1L7ejCWOCQiEuNvjDvzHvGkk+6H5cGn/XR32FjWBwQJCr/6860yYdDTcb1Hr8pWRC3KVzcgHL2EoxSYfV5x5REKMEITgnecvQT4jZk0GbK+XnltTVQVKm0ufhDhZl3TK0I0oYr0UYKZSLXK1Uc2CAmdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760545439; c=relaxed/simple;
	bh=VB/OwIbJqvi4QYOo1fW+d9Mssp3i7i/A5LBb4pBrAuM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZBxmdvpGwTvXKzfjB6y1BmyqbmmUpJs2U7RyYo/k7ho3YPrUE4eH96ZSh5BxFYBcmR2eiWeH6e6MV0vVFtOIFTQnShN1GJ9lQqQykC8+staLSBUMe2EXGNZdBq7H+dvdfDmP5Pl9HiofPpTxZOC2jB3X7T2GnUgma/F+tkYiQ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SlYquHh9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SlYquHh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760545436; x=1792081436;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VB/OwIbJqvi4QYOo1fW+d9Mssp3i7i/A5LBb4pBrAuM=;
  b=SlYquHh9qM+fehKIAIsYJbLbPSV6e6Bl5Wsx5tcl2LB8eJulPYUOIn4Y
   ZYZj0mOLHqgDdVCPem1s0VkCxDuN4rnTn46CEAjDRRrzuRn99+mKzPKEO
   P6WIHNHXxNYZWEnV9w8A91hmMZv8nzRZE+xatTyy64KIUmTzFzD7Sm4Kb
   NGfo36OYmdKM8NsbHR+dWadpfEvdRYOaynqQdHHwglZDQ8BM8BQo8DklD
   IMHy2wLnt94hujN2P49cS9RDpXflFCy6X1t6q/jTnaBjCawo2ps+noMGQ
   883lfYglov8WM2WMHcAaG83uMtPuVqcEjmcZ1QZ+0waPrX3uYs35lKxhH
   w==;
X-CSE-ConnectionGUID: uYIzGrXpScCQV6jidvJ1uw==
X-CSE-MsgGUID: gjcJKrMgQLqxWEGt5DDE8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="85342587"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="85342587"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 09:23:55 -0700
X-CSE-ConnectionGUID: zeGkCHs1SLSskEQHBYI/fQ==
X-CSE-MsgGUID: 5cke1MA1TzePRqqY+LUDEg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2025 09:23:53 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v94I3-00041H-0u;
	Wed, 15 Oct 2025 16:23:51 +0000
Date: Thu, 16 Oct 2025 00:16:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/4] kbuild: Disable AutoFDO and Propeller flags for
 kernel modules
Message-ID: <202510152308.eqq7in1N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251014191156.3836703-3-xur@google.com>
References: <20251014191156.3836703-3-xur@google.com>
TO: xur@google.com
TO: Alexey Gladkov <legion@kernel.org>
TO: Alice Ryhl <aliceryhl@google.com>
TO: Ard Biesheuvel <ardb@kernel.org>
TO: Bill Wendling <morbo@google.com>
TO: Han Shen <shenhan@google.com>
TO: Ingo Molnar <mingo@kernel.org>
TO: Josh Poimboeuf <jpoimboe@kernel.org>
TO: Justin Stitt <justinstitt@google.com>
TO: Kees Cook <kees@kernel.org>
TO: Linus Walleij <linus.walleij@linaro.org>
TO: Masahiro Yamada <masahiroy@kernel.org>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
TO: Nicolas Schier <nicolas.schier@linux.dev>
TO: Peter Zijlstra <peterz@infradead.org>
TO: Tamir Duberstein <tamird@gmail.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>
TO: Yabin Cui <yabinc@google.com>
TO: Sriraman Tallam <tmsriram@google.com>
CC: linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: llvm@lists.linux.dev
CC: Rong Xu <xur@google.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9b332cece987ee1790b2ed4c989e28162fa47860]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-Fix-Propeller-flags/20251015-031420
base:   9b332cece987ee1790b2ed4c989e28162fa47860
patch link:    https://lore.kernel.org/r/20251014191156.3836703-3-xur%40google.com
patch subject: [PATCH v2 2/4] kbuild: Disable AutoFDO and Propeller flags for kernel modules
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-buildonly-randconfig-001-20251015 (https://download.01.org/0day-ci/archive/20251015/202510152308.eqq7in1N-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251015/202510152308.eqq7in1N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510152308.eqq7in1N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ld: warning: orphan section `.init.ramfs.info' from `usr/initramfs_data.o' being placed in section `.init.ramfs.info'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/entry/entry.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `.altinstructions' from `arch/x86/entry/entry.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/entry/entry.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.export_symbol' from `arch/x86/entry/entry.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.entry.text' from `arch/x86/entry/entry.o' being placed in section `.entry.text'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/entry/entry.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.entry.text' from `arch/x86/entry/entry_32.o' being placed in section `.entry.text'
   ld: warning: orphan section `.altinstructions' from `arch/x86/entry/entry_32.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/entry/entry_32.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `__ex_table' from `arch/x86/entry/entry_32.o' being placed in section `__ex_table'
   ld: warning: orphan section `__jump_table' from `arch/x86/entry/syscall_32.o' being placed in section `__jump_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/entry/syscall_32.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/entry/syscall_32.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/entry/syscall_32.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/entry/syscall_32.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/entry/syscall_32.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/entry/syscall_32.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `__bug_table' from `arch/x86/entry/syscall_32.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/entry/vdso/vma.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.smp_locks' from `arch/x86/entry/vdso/vma.o' being placed in section `.smp_locks'
   ld: warning: orphan section `__bug_table' from `arch/x86/entry/vdso/vma.o' being placed in section `__bug_table'
   ld: warning: orphan section `.init.text' from `arch/x86/entry/vdso/vma.o' being placed in section `.init.text'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/entry/vdso/vma.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.initcall4.init' from `arch/x86/entry/vdso/vdso-image-32.o' being placed in section `.initcall4.init'
   ld: warning: orphan section `.init.text' from `arch/x86/entry/vdso/vdso-image-32.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/entry/vdso/vdso-image-32.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/entry/vdso/vdso-image-32.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.initcall6.init'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.setup' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.init.setup'
   ld: warning: orphan section `.init.rodata' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/entry/vdso/vdso32-setup.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/entry/thunk.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.export_symbol' from `arch/x86/entry/thunk.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.static_call.text' from `arch/x86/events/core.o' being placed in section `.static_call.text'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/core.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcallearly.init' from `arch/x86/events/core.o' being placed in section `.initcallearly.init'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/core.o' being placed in section `__jump_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/core.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/core.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/core.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/core.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/core.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/core.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/core.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/core.o' being placed in section `__ex_table'
   ld: warning: orphan section `.init.text' from `arch/x86/events/core.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/core.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/core.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/core.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/events/core.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/events/core.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/events/core.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/probe.o' being placed in section `.export_symbol'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/probe.o' being placed in section `__ex_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/probe.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.static_call.text' from `arch/x86/events/amd/core.o' being placed in section `.static_call.text'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/amd/core.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/amd/core.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/amd/core.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/amd/core.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/amd/core.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/amd/core.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/amd/core.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/amd/core.o' being placed in section `__bug_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/amd/core.o' being placed in section `.smp_locks'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/amd/core.o' being placed in section `__jump_table'
   ld: warning: orphan section `.init.text' from `arch/x86/events/amd/core.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/amd/core.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.data..once' from `arch/x86/events/amd/core.o' being placed in section `.data..once'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/amd/core.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/amd/core.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/events/amd/core.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/amd/core.o' being placed in section `.init.rodata'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/amd/lbr.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/amd/lbr.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/amd/lbr.o' being placed in section `__bug_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/amd/lbr.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/amd/lbr.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/amd/lbr.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.init.text' from `arch/x86/events/amd/lbr.o' being placed in section `.init.text'
   ld: warning: orphan section `.static_call.text' from `arch/x86/events/amd/brs.o' being placed in section `.static_call.text'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/amd/brs.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/events/amd/brs.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/amd/brs.o' being placed in section `__ex_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/amd/brs.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/amd/brs.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/amd/brs.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/amd/brs.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.init.text' from `arch/x86/events/amd/brs.o' being placed in section `.init.text'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/amd/brs.o' being placed in section `__bug_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/amd/brs.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/events/amd/power.o' being placed in section `.initcall6.init'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/amd/power.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/amd/power.o' being placed in section `__ex_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/amd/power.o' being placed in section `__bug_table'
>> ld: warning: orphan section `.altinstructions' from `arch/x86/events/amd/power.o' being placed in section `.altinstructions'
>> ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/amd/power.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/amd/power.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.exit.text' from `arch/x86/events/amd/power.o' being placed in section `.exit.text'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/amd/power.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/events/amd/power.o' being placed in section `.init.text'
   ld: warning: orphan section `.modinfo' from `arch/x86/events/amd/power.o' being placed in section `.modinfo'
   ld: warning: orphan section `.exitcall.exit' from `arch/x86/events/amd/power.o' being placed in section `.exitcall.exit'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/amd/power.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/amd/ibs.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/events/amd/ibs.o' being placed in section `.initcall6.init'
>> ld: warning: orphan section `.altinstructions' from `arch/x86/events/amd/ibs.o' being placed in section `.altinstructions'
>> ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/amd/ibs.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/amd/ibs.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/amd/ibs.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/amd/ibs.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.init.text' from `arch/x86/events/amd/ibs.o' being placed in section `.init.text'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/amd/ibs.o' being placed in section `__jump_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/amd/ibs.o' being placed in section `__bug_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/amd/ibs.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/amd/ibs.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/amd/ibs.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/amd/ibs.o' being placed in section `.data..percpu'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/events/amd/ibs.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/events/msr.o' being placed in section `.initcall6.init'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/msr.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.init.text' from `arch/x86/events/msr.o' being placed in section `.init.text'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/msr.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/msr.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/msr.o' being placed in section `__ex_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/msr.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/msr.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.static_call.text' from `arch/x86/events/intel/core.o' being placed in section `.static_call.text'
   ld: warning: orphan section `.initcall4.init' from `arch/x86/events/intel/core.o' being placed in section `.initcall4.init'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/core.o' being placed in section `__ex_table'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/intel/core.o' being placed in section `__jump_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/intel/core.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/core.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/core.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/core.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/core.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/intel/core.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/intel/core.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/intel/core.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/intel/core.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.data' from `arch/x86/events/intel/core.o' being placed in section `.init.data'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/intel/core.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/core.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/intel/core.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/events/intel/core.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.initcallearly.init' from `arch/x86/events/intel/bts.o' being placed in section `.initcallearly.init'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/intel/bts.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/intel/bts.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/bts.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/bts.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/intel/bts.o' being placed in section `__jump_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/bts.o' being placed in section `__bug_table'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/bts.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/intel/bts.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/intel/bts.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/bts.o' being placed in section `.data..percpu'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/ds.o' being placed in section `__ex_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/intel/ds.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/intel/ds.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/ds.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/ds.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/ds.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/intel/ds.o' being placed in section `__jump_table'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/ds.o' being placed in section `.init.text'
   ld: warning: orphan section `.data..once' from `arch/x86/events/intel/ds.o' being placed in section `.data..once'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/intel/ds.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/ds.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..percpu..page_aligned' from `arch/x86/events/intel/ds.o' being placed in section `.data..percpu..page_aligned'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/knc.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/knc.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/knc.o' being placed in section `__bug_table'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/knc.o' being placed in section `.init.text'
   ld: warning: orphan section `.data..once' from `arch/x86/events/intel/knc.o' being placed in section `.data..once'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/intel/knc.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/intel/lbr.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/intel/lbr.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/intel/lbr.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/events/intel/lbr.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/lbr.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/lbr.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/lbr.o' being placed in section `__bug_table'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/intel/lbr.o' being placed in section `__jump_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/lbr.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/lbr.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/intel/lbr.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/intel/lbr.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/lbr.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/p4.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/p4.o' being placed in section `__ex_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/p4.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/p4.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.smp_locks' from `arch/x86/events/intel/p4.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/p4.o' being placed in section `.init.text'
   ld: warning: orphan section `.data..once' from `arch/x86/events/intel/p4.o' being placed in section `.data..once'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/p4.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/intel/p4.o' being placed in section `.init.rodata'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/p6.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/p6.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/p6.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/p6.o' being placed in section `.init.text'
   ld: warning: orphan section `.init.data' from `arch/x86/events/intel/p6.o' being placed in section `.init.data'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/intel/p6.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.export_symbol' from `arch/x86/events/intel/pt.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcall3.init' from `arch/x86/events/intel/pt.o' being placed in section `.initcall3.init'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/intel/pt.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/intel/pt.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/intel/pt.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/intel/pt.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/events/intel/pt.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/intel/pt.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/events/intel/pt.o' being placed in section `.init.text'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/intel/pt.o' being placed in section `__jump_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/events/intel/pt.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/events/intel/pt.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/events/intel/pt.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/events/intel/pt.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `__ex_table' from `arch/x86/events/zhaoxin/core.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/events/zhaoxin/core.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/events/zhaoxin/core.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/events/zhaoxin/core.o' being placed in section `.init.text'
   ld: warning: orphan section `__jump_table' from `arch/x86/events/zhaoxin/core.o' being placed in section `__jump_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/events/zhaoxin/core.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/events/zhaoxin/core.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.init.data' from `arch/x86/events/zhaoxin/core.o' being placed in section `.init.data'
   ld: warning: orphan section `.init.rodata' from `arch/x86/events/zhaoxin/core.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/events/zhaoxin/core.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.initcallearly.init' from `arch/x86/realmode/init.o' being placed in section `.initcallearly.init'
   ld: warning: orphan section `.init.text' from `arch/x86/realmode/init.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/realmode/init.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/realmode/init.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__bug_table' from `arch/x86/realmode/init.o' being placed in section `__bug_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/realmode/init.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.data' from `arch/x86/realmode/rmpiggy.o' being placed in section `.init.data'
   ld: warning: orphan section `.bss..brk' from `arch/x86/kernel/head_32.o' being placed in section `.bss..brk'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/head_32.o' being placed in section `.init.text'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/head_32.o' being placed in section `.init.data'
   ld: warning: orphan section `.ref.data' from `arch/x86/kernel/head_32.o' being placed in section `.ref.data'
   ld: warning: orphan section `.bss..page_aligned' from `arch/x86/kernel/head_32.o' being placed in section `.bss..page_aligned'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/head_32.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.init.rodata' from `arch/x86/kernel/head_32.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/head32.o' being placed in section `.init.text'
   ld: warning: orphan section `__ex_table' from `arch/x86/kernel/head32.o' being placed in section `__ex_table'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/head32.o' being placed in section `.init.data'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/ebda.o' being placed in section `.init.text'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/platform-quirks.o' being placed in section `.init.text'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/process_32.o' being placed in section `.export_symbol'
   ld: warning: orphan section `__ex_table' from `arch/x86/kernel/process_32.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/process_32.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/process_32.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/process_32.o' being placed in section `__bug_table'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/process_32.o' being placed in section `__jump_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/process_32.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/process_32.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.initcallearly.init' from `arch/x86/kernel/signal.o' being placed in section `.initcallearly.init'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/signal.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/signal.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/signal.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/signal.o' being placed in section `__bug_table'
   ld: warning: orphan section `.init.setup' from `arch/x86/kernel/signal.o' being placed in section `.init.setup'
   ld: warning: orphan section `.init.rodata' from `arch/x86/kernel/signal.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/signal.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/signal.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `__ex_table' from `arch/x86/kernel/signal_32.o' being placed in section `__ex_table'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/signal_32.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/signal_32.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/signal_32.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/kernel/signal_32.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/traps.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/kernel/traps.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/traps.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/traps.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/traps.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/traps.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/kernel/traps.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `__ex_table' from `arch/x86/kernel/traps.o' being placed in section `__ex_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/traps.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/traps.o' being placed in section `.init.text'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/kernel/traps.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/idt.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/idt.o' being placed in section `.init.text'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/idt.o' being placed in section `__bug_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/idt.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/idt.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.bss..page_aligned' from `arch/x86/kernel/idt.o' being placed in section `.bss..page_aligned'
   ld: warning: orphan section `.init.rodata' from `arch/x86/kernel/idt.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/idt.o' being placed in section `.init.data'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/irq.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/irq.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/irq.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/kernel/irq.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/irq.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.data..percpu..hot..__softirq_pending' from `arch/x86/kernel/irq.o' being placed in section `.data..percpu..hot..__softirq_pending'
   ld: warning: orphan section `.data..percpu..shared_aligned' from `arch/x86/kernel/irq.o' being placed in section `.data..percpu..shared_aligned'
   ld: warning: orphan section `.data..percpu..hot..hardirq_stack_ptr' from `arch/x86/kernel/irq.o' being placed in section `.data..percpu..hot..hardirq_stack_ptr'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/irq_32.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/irq_32.o' being placed in section `.rodata.str1.1'
>> ld: warning: orphan section `__jump_table' from `arch/x86/kernel/irq_32.o' being placed in section `__jump_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/irq_32.o' being placed in section `__bug_table'
>> ld: warning: orphan section `alloc_tags' from `arch/x86/kernel/irq_32.o' being placed in section `alloc_tags'
>> ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/irq_32.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/kernel/irq_32.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.data..percpu..hot..softirq_stack_ptr' from `arch/x86/kernel/irq_32.o' being placed in section `.data..percpu..hot..softirq_stack_ptr'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/dumpstack_32.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/dumpstack_32.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.data..once' from `arch/x86/kernel/dumpstack_32.o' being placed in section `.data..once'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/time.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/time.o' being placed in section `.init.text'
   ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/time.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/time.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/kernel/time.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/time.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/time.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/time.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/ioport.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/ioport.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/ioport.o' being placed in section `.rodata.str1.1'
>> ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/ioport.o' being placed in section `.altinstructions'
>> ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/ioport.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/ioport.o' being placed in section `__jump_table'
>> ld: warning: orphan section `__bug_table' from `arch/x86/kernel/ioport.o' being placed in section `__bug_table'
   ld: warning: orphan section `alloc_tags' from `arch/x86/kernel/ioport.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/ioport.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/dumpstack.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/dumpstack.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/dumpstack.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/kernel/dumpstack.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/kernel/dumpstack.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.initcall5.init' from `arch/x86/kernel/nmi.o' being placed in section `.initcall5.init'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/nmi.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/nmi.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/nmi.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/nmi.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/nmi.o' being placed in section `__bug_table'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/kernel/nmi.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/nmi.o' being placed in section `__jump_table'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/nmi.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/nmi.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/nmi.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/kernel/nmi.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/nmi.o' being placed in section `.data..percpu'
   ld: warning: orphan section `_kprobe_blacklist' from `arch/x86/kernel/nmi.o' being placed in section `_kprobe_blacklist'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/nmi.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.setup' from `arch/x86/kernel/nmi.o' being placed in section `.init.setup'
   ld: warning: orphan section `.init.rodata' from `arch/x86/kernel/nmi.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/kernel/nmi.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/ldt.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/ldt.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/ldt.o' being placed in section `__jump_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/ldt.o' being placed in section `__bug_table'
   ld: warning: orphan section `.altinstructions' from `arch/x86/kernel/ldt.o' being placed in section `.altinstructions'
   ld: warning: orphan section `.altinstr_replacement' from `arch/x86/kernel/ldt.o' being placed in section `.altinstr_replacement'
   ld: warning: orphan section `.altinstr_aux' from `arch/x86/kernel/ldt.o' being placed in section `.altinstr_aux'
   ld: warning: orphan section `alloc_tags' from `arch/x86/kernel/ldt.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/ldt.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/setup.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcall3.init' from `arch/x86/kernel/setup.o' being placed in section `.initcall3.init'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/kernel/setup.o' being placed in section `.initcall6.init'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/setup.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/setup.o' being placed in section `.init.text'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/setup.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/setup.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/setup.o' being placed in section `__bug_table'
   ld: warning: orphan section `__ex_table' from `arch/x86/kernel/setup.o' being placed in section `__ex_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/setup.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/setup.o' being placed in section `.init.data'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/setup.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.data..read_mostly' from `arch/x86/kernel/setup.o' being placed in section `.data..read_mostly'
   ld: warning: orphan section `.bss..brk' from `arch/x86/kernel/setup.o' being placed in section `.bss..brk'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/x86_init.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/x86_init.o' being placed in section `.init.text'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/x86_init.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/x86_init.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/x86_init.o' being placed in section `.init.data'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/i8259.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcall6.init' from `arch/x86/kernel/i8259.o' being placed in section `.initcall6.init'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/i8259.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.smp_locks' from `arch/x86/kernel/i8259.o' being placed in section `.smp_locks'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/i8259.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/i8259.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/i8259.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/i8259.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/irqinit.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/irqinit.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/irqinit.o' being placed in section `__bug_table'
   ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/irqinit.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/jump_label.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/jump_label.o' being placed in section `__bug_table'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/jump_label.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.ref.text' from `arch/x86/kernel/jump_label.o' being placed in section `.ref.text'
   ld: warning: orphan section `.noinstr.text' from `arch/x86/kernel/irq_work.o' being placed in section `.noinstr.text'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/probe_roms.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/probe_roms.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/probe_roms.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/probe_roms.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.initcall3.init' from `arch/x86/kernel/ksysfs.o' being placed in section `.initcall3.init'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/ksysfs.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/ksysfs.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/ksysfs.o' being placed in section `.init.text'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/ksysfs.o' being placed in section `__jump_table'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/ksysfs.o' being placed in section `__bug_table'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/ksysfs.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `alloc_tags' from `arch/x86/kernel/ksysfs.o' being placed in section `alloc_tags'
   ld: warning: orphan section `.data..percpu' from `arch/x86/kernel/ksysfs.o' being placed in section `.data..percpu'
   ld: warning: orphan section `.data..ro_after_init' from `arch/x86/kernel/ksysfs.o' being placed in section `.data..ro_after_init'
   ld: warning: orphan section `.initcall3.init' from `arch/x86/kernel/bootflag.o' being placed in section `.initcall3.init'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/bootflag.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/bootflag.o' being placed in section `.init.text'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/bootflag.o' being placed in section `.discard.addressable'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/bootflag.o' being placed in section `.init.data'
   ld: warning: orphan section `.export_symbol' from `arch/x86/kernel/e820.o' being placed in section `.export_symbol'
   ld: warning: orphan section `.initcall1.init' from `arch/x86/kernel/e820.o' being placed in section `.initcall1.init'
   ld: warning: orphan section `.init.text' from `arch/x86/kernel/e820.o' being placed in section `.init.text'
   ld: warning: orphan section `.rodata.str1.1' from `arch/x86/kernel/e820.o' being placed in section `.rodata.str1.1'
   ld: warning: orphan section `.rodata.str1.4' from `arch/x86/kernel/e820.o' being placed in section `.rodata.str1.4'
   ld: warning: orphan section `__bug_table' from `arch/x86/kernel/e820.o' being placed in section `__bug_table'
   ld: warning: orphan section `__jump_table' from `arch/x86/kernel/e820.o' being placed in section `__jump_table'
   ld: warning: orphan section `.init.data' from `arch/x86/kernel/e820.o' being placed in section `.init.data'
   ld: warning: orphan section `.init.setup' from `arch/x86/kernel/e820.o' being placed in section `.init.setup'
   ld: warning: orphan section `.init.rodata' from `arch/x86/kernel/e820.o' being placed in section `.init.rodata'
   ld: warning: orphan section `.discard.addressable' from `arch/x86/kernel/e820.o' being placed in section `.discard.addressable'
..

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for I2C_K1
   Depends on [n]: I2C [=y] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && OF [=n]
   Selected by [m]:
   - MFD_SPACEMIT_P1 [=m] && HAS_IOMEM [=y] && (ARCH_SPACEMIT || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
