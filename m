Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31162264A0
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Oct 2025 22:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760223165; cv=none; b=a3i7fqQrMnpEizcGGhiPDZxYUgo9f4LMOJ1p4L1sae8jrFE3oDrCxEz5GFCAM6NUEQfjPT/x6EqeFPl1q36vON8QIemqV5eW4vZKBOPI6iPHmsZcv8CfTj9DFVVuvBPubetTfMH4rrb24YSOKSpSPSdeWTEgIdFPvYms7NECIME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760223165; c=relaxed/simple;
	bh=ahub3FsUtkKEhGz+GNivP9E2O9w3UlFzCjXilY4q44w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UGsuIWCwh8zMmKIOKPQY5ZTtww7+7RCl8tNMh++dKqfuamgIAg9z07SxNldVe+qxBZdsAgM3Wu/4uedTljNGeQSBYvu3xbWzoqGYVYyDDc0leaTMkNDQR5pF4APrADU6dspYncRXsF39+UHFUXIlvBZR6uxh+wStvrRcZpfc1rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hlyV84V/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hlyV84V/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760223164; x=1791759164;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=ahub3FsUtkKEhGz+GNivP9E2O9w3UlFzCjXilY4q44w=;
  b=hlyV84V/C4YCgwqafMmi/hX/hiM6ZlwksAnEpQ7Vhvpg/5Or7f9JIEl8
   tN04T1i24semXBG/+dLf+weIxiAoBzf5OARcjZYZuaevhbwEc+PmbvPaY
   6lUTdqLSRNrQ4dzbxhgGbSKFymdcBKJrBuJ/udc4lfalhUrb5/1O3fLtW
   3ZzKMNjOuXFp072KH1cJQjGGWYTgGuqLKmkhQuQltIemENadSGBDTF/nv
   5Oa5P65cLI0wBt1prS6GujL2CY6CN+UkyABziGOVaWeXWU3sm7zRB8tTD
   jOA0RtYd5/dxwaLiplqY1aPYuVcyKQ9Hrt++pgHr+SNsQo1b5qEJRIF5G
   w==;
X-CSE-ConnectionGUID: z2B8h1RSTLyHpB4U4Ca2rA==
X-CSE-MsgGUID: EVXR+9gnSzaABgNn3f2Oig==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="62288851"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; 
   d="scan'208";a="62288851"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2025 15:52:43 -0700
X-CSE-ConnectionGUID: HMEAsuiFSCaBd36fxPG9QQ==
X-CSE-MsgGUID: 2a6iAXx7TSuZH1KNZTh17w==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Oct 2025 15:52:41 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7iS7-000425-1J;
	Sat, 11 Oct 2025 22:52:39 +0000
Date: Sun, 12 Oct 2025 06:52:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for
 kernel modules
Message-ID: <202510120641.H3SMaB6Q-lkp@intel.com>
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
In-Reply-To: <20251010210134.2066321-2-xur@google.com>
References: <20251010210134.2066321-2-xur@google.com>
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

[auto build test WARNING on kees/for-next/kspp]
[also build test WARNING on linus/master v6.17 next-20251010]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuild-Disable-AutoFDO-and-Propeller-flags-for-kernel-modules/20251011-050345
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/kspp
patch link:    https://lore.kernel.org/r/20251010210134.2066321-2-xur%40google.com
patch subject: [PATCH 2/4] kbuild: Disable AutoFDO and Propeller flags for kernel modules
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20251012/202510120641.H3SMaB6Q-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510120641.H3SMaB6Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510120641.H3SMaB6Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.head.text' from `arch/powerpc/kernel/head_book3s_32.o' being placed in section `.head.text'
>> powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/head_book3s_32.o' being placed in section `__ftr_alt_97'
>> powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/head_book3s_32.o' being placed in section `__mmu_ftr_fixup'
>> powerpc-linux-ld: warning: orphan section `__ftr_fixup' from `arch/powerpc/kernel/head_book3s_32.o' being placed in section `__ftr_fixup'
>> powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/fpu.o' being placed in section `.export_symbol'
>> powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/main.o' being placed in section `.export_symbol'
>> powerpc-linux-ld: warning: orphan section `.init.text' from `init/main.o' being placed in section `.init.text'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/main.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `__bug_table' from `init/main.o' being placed in section `__bug_table'
>> powerpc-linux-ld: warning: orphan section `.ref.text' from `init/main.o' being placed in section `.ref.text'
>> powerpc-linux-ld: warning: orphan section `.text.unlikely' from `init/main.o' being placed in section `.text.unlikely'
>> powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `init/main.o' being placed in section `.data..read_mostly'
>> powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `init/main.o' being placed in section `.data..ro_after_init'
>> powerpc-linux-ld: warning: orphan section `.discard.addressable' from `init/main.o' being placed in section `.discard.addressable'
>> powerpc-linux-ld: warning: orphan section `.init.data' from `init/main.o' being placed in section `.init.data'
>> powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/main.o' being placed in section `.init.rodata'
>> powerpc-linux-ld: warning: orphan section `.init.setup' from `init/main.o' being placed in section `.init.setup'
>> powerpc-linux-ld: warning: orphan section `__param' from `init/main.o' being placed in section `__param'
>> powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/version.o' being placed in section `.export_symbol'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/version.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `init/version.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `init/version.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/version.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `init/version.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.note.Linux' from `init/version.o' being placed in section `.note.Linux'
   powerpc-linux-ld: warning: orphan section `.init.text' from `init/do_mounts.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/do_mounts.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `init/do_mounts.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.init.data' from `init/do_mounts.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/do_mounts.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `init/do_mounts.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/noinitramfs.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `init/noinitramfs.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.initcallrootfs.init' from `init/noinitramfs.o' being placed in section `.initcallrootfs.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/init_task.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `init/init_task.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/cputable.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/cputable.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/cputable.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/cputable.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/kernel/cputable.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/cputable.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/kernel/cputable.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/irq.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/irq.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/irq.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/irq.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `arch/powerpc/kernel/irq.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/irq.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.static_call_sites' from `arch/powerpc/kernel/irq.o' being placed in section `.static_call_sites'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/align.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/align.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/align.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/signal_32.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/signal_32.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/pmc.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/pmc.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/pmc.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/pmc.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/vdso.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/vdso.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/vdso.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/kernel/vdso.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch/powerpc/kernel/vdso.o' being placed in section `.initcall3.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/process.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/process.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/process.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/kernel/process.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/process.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__ftr_fixup' from `arch/powerpc/kernel/process.o' being placed in section `__ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/process.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/process.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/process.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/kernel/process.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/kernel/process.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcallearly.init' from `arch/powerpc/kernel/process.o' being placed in section `.initcallearly.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/idle.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/idle.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/idle.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/idle.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/kernel/idle.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/kernel/idle.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcall6.init' from `arch/powerpc/kernel/idle.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/signal.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/signal.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/sysfs.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/sysfs.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/sysfs.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/sysfs.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/sysfs.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.initcall4.init' from `arch/powerpc/kernel/sysfs.o' being placed in section `.initcall4.init'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/cacheinfo.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/cacheinfo.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..once' from `arch/powerpc/kernel/cacheinfo.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/time.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/time.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/time.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.data..once' from `arch/powerpc/kernel/time.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `arch/powerpc/kernel/time.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/kernel/time.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/time.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/prom.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/prom.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/prom.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/prom.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/prom.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/kernel/prom.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/kernel/prom.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/kernel/prom.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/traps.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/traps.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/traps.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.noinstr.text' from `arch/powerpc/kernel/traps.o' being placed in section `.noinstr.text'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/kernel/traps.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/setup-common.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/setup-common.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/kernel/setup-common.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/setup-common.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/setup-common.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/kernel/setup-common.o' being placed in section `.init.data'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
