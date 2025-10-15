Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECBD3254B1
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Oct 2025 22:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760567523; cv=none; b=MBVHZ8HWViUeARIWtP3ek/G7Gjjj2w29xFyEhRrmfeYKamiEx1Su9N2scPL7/Otvaa4KFdmh1IbWk82M2k4dxdK5O65hgYjB9cAU2PfWhj/DCTMRvmo99xZlWFqtlXxdnKwhpqtxnUzYtrjGAWeTNjtzTNVf1k1Opzx2rOXnUec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760567523; c=relaxed/simple;
	bh=129QnYblkvUZjtrmLLIXDpEur0XvSaLSMGJ10Vujocg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sf8uXdryXsU4caFYUIstXrwIZ0zay/9I1syuJ53eWV6K+OaWXhssCxmF+YvvRW32wCaKVKX/vDbwsJkxn952V2upDrnPy5dmRMUZ5EuGqlsHeTNah/fHqyrxzTgTbjiYNzQBqppYzu+WcsuRgJ/YW7JazURLAyQYR+PKgTN+FVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LfIggN9d; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LfIggN9d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760567520; x=1792103520;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=129QnYblkvUZjtrmLLIXDpEur0XvSaLSMGJ10Vujocg=;
  b=LfIggN9dI3AJPbScfQVF7qAjr+/kC0xD/7mhhSDz0FaDkvS45VSkoCMW
   rXnrugRKUbPUbnuYZz4FAoqAnTbkOwX+fApTHpiVNErhuHPEvs0glqOtM
   lAhpqJktOVoIXYsWiBqlIIkBpu5hk2v45fMOt7r5JyVZ2x6YK6yryo8YV
   DB/yiHsvBtygCUAw84v+tHpVNpaZp64r1BGFIECs/14Eh5gfe0VST6lRk
   nJ0I6KVTofJPVh+RdmCYH1XRA4BA7Ts4mgKixs0bZIQDb7IVEdHx6pgmU
   eWf/4kA9vwmkj9985YxEV52HAo/39ZJtQp4ZOmUNYLLufy43zYJTuUFY3
   w==;
X-CSE-ConnectionGUID: NAatwEhbQGKuIjwZXQvZJg==
X-CSE-MsgGUID: JBd6hfxZRgC5yoRakoQDSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62847773"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="62847773"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 15:31:59 -0700
X-CSE-ConnectionGUID: K+9HzgMhTy2y8J539QVtGw==
X-CSE-MsgGUID: tD8f8/O4SJGnh50E1JgWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="181841709"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Oct 2025 15:31:57 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9A2F-0004GV-1O;
	Wed, 15 Oct 2025 22:31:55 +0000
Date: Thu, 16 Oct 2025 06:31:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/4] kbuild: Disable AutoFDO and Propeller flags for
 kernel modules
Message-ID: <202510160643.8sg6iGo3-lkp@intel.com>
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
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: powerpc-adder875_defconfig (https://download.01.org/0day-ci/archive/20251016/202510160643.8sg6iGo3-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160643.8sg6iGo3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510160643.8sg6iGo3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> powerpc-linux-ld: warning: orphan section `.head.text' from `arch/powerpc/kernel/head_8xx.o' being placed in section `.head.text'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/main.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `init/main.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/main.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `init/main.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.ref.text' from `init/main.o' being placed in section `.ref.text'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `init/main.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `init/main.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `init/main.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `init/main.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `init/main.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `init/main.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `init/main.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `__param' from `init/main.o' being placed in section `__param'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `init/version.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `init/version.o' being placed in section `.rodata.str1.4'
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
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/irq.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/irq.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/irq.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `arch/powerpc/kernel/irq.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/irq.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.static_call_sites' from `arch/powerpc/kernel/irq.o' being placed in section `.static_call_sites'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/align.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/align.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/align.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/align.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/align.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/signal_32.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/signal_32.o' being placed in section `__mmu_ftr_fixup'
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
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/process.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__ftr_fixup' from `arch/powerpc/kernel/process.o' being placed in section `__ftr_fixup'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/process.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/process.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/kernel/process.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/process.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/process.o' being placed in section `__mmu_ftr_fixup'
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
>> powerpc-linux-ld: warning: orphan section `.initcall6.init' from `arch/powerpc/kernel/time.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/prom.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/prom.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/prom.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/prom.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/prom.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/kernel/prom.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/kernel/prom.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/kernel/prom.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/traps.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/traps.o' being placed in section `__mmu_ftr_fixup'
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
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/udbg.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/udbg.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/misc.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/io.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/io.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/misc_32.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/misc_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/prom_parse.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/hw_breakpoint_constraints.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/hw_breakpoint_constraints.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/hw_breakpoint_constraints.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/interrupt.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/interrupt.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch/powerpc/kernel/kdebugfs.o' being placed in section `.initcall3.init'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/syscall.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/syscall.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/ptrace/ptrace.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/ptrace/ptrace.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/ptrace/ptrace.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/ptrace/ptrace.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/ptrace/ptrace-view.o' being placed in section `__bug_table'
>> powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/ptrace/ptrace-noadv.o' being placed in section `__ftr_alt_97'
>> powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/kernel/ptrace/ptrace-noadv.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/kernel/ptrace/ptrace-noadv.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/kernel/vdso32_wrapper.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/proc_powerpc.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/proc_powerpc.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.initcall1.init' from `arch/powerpc/kernel/proc_powerpc.o' being placed in section `.initcall1.init'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/kernel/entry_32.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/kernel/entry_32.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__ftr_fixup' from `arch/powerpc/kernel/entry_32.o' being placed in section `__ftr_fixup'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/setup_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/setup_32.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/setup_32.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/kernel/setup_32.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/setup_32.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/kernel/setup_32.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/kernel/setup_32.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch/powerpc/kernel/setup_32.o' being placed in section `.initcall3.init'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/kernel/early_32.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/static_call.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/kernel/static_call.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/static_call.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/kernel/iomap.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/kernel/iomap.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/fault.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/mm/fault.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/fault.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/mem.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/mem.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/mem.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/mem.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.bss..page_aligned' from `arch/powerpc/mm/mem.o' being placed in section `.bss..page_aligned'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/mem.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/mm/mem.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.initcall4.init' from `arch/powerpc/mm/mem.o' being placed in section `.initcall4.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/pgtable.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/pgtable.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/pgtable.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.bss..page_aligned' from `arch/powerpc/mm/pgtable.o' being placed in section `.bss..page_aligned'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/pgtable.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/pageattr.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/pageattr.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/init_32.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/init_32.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/pgtable_32.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/pgtable_32.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.ref.text' from `arch/powerpc/mm/pgtable_32.o' being placed in section `.ref.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/pgtable_32.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..page_aligned' from `arch/powerpc/mm/pgtable_32.o' being placed in section `.data..page_aligned'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/pgtable-frag.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/pgtable-frag.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/ioremap.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/ioremap.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/ioremap.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/ioremap.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/ioremap_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/ioremap_32.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/ioremap_32.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/init-common.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/init-common.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/init-common.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/init-common.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/mm/init-common.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/init-common.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/mm/init-common.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `arch/powerpc/mm/init-common.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/drmem.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/mm/drmem.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/drmem.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.initcall7.init' from `arch/powerpc/mm/drmem.o' being placed in section `.initcall7.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/cacheflush.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/cacheflush.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/cacheflush.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/cacheflush.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/nohash/mmu_context.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/nohash/mmu_context.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/nohash/mmu_context.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/mm/nohash/tlb.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/nohash/tlb.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/mm/nohash/tlb.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/nohash/kup.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/mm/nohash/kup.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/mm/nohash/kup.o' being placed in section `__mmu_ftr_fixup'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/nohash/8xx.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `.ref.text' from `arch/powerpc/mm/nohash/8xx.o' being placed in section `.ref.text'
>> powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/nohash/8xx.o' being placed in section `__bug_table'
>> powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/nohash/8xx.o' being placed in section `.init.text'
>> powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/mm/nohash/8xx.o' being placed in section `.init.data'
>> powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/mm/hugetlbpage.o' being placed in section `.init.text'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/hugetlbpage.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch/powerpc/mm/hugetlbpage.o' being placed in section `.initcall3.init'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/mm/dma-noncoherent.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/mm/dma-noncoherent.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/lib/code-patching.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/lib/code-patching.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/lib/code-patching.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/lib/code-patching.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.data..once' from `arch/powerpc/lib/code-patching.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `arch/powerpc/lib/code-patching.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/lib/feature-fixups.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.initcall7.init' from `arch/powerpc/lib/feature-fixups.o' being placed in section `.initcall7.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/pmem.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/lib/pmem.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/lib/pmem.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/lib/pmem.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/string.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/memcmp_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/strlen_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/copy_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/lib/copy_32.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/checksum_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/lib/checksum_32.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/lib/checksum_wrappers.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/lib/checksum_wrappers.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/lib/string_32.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/string_32.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/lib/sstep.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `arch/powerpc/lib/sstep.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `arch/powerpc/lib/sstep.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `arch/powerpc/lib/sstep.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/lib/sstep.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/lib/sstep.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/lib/sstep.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/sysdev/fsl_soc.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/sysdev/fsl_soc.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/sysdev/fsl_soc.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/sysdev/fsl_mpic_err.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/sysdev/fsl_mpic_err.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/sysdev/fsl_mpic_err.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/sysdev/cpm_common.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/sysdev/cpm_common.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.initcall4.init' from `arch/powerpc/sysdev/cpm_common.o' being placed in section `.initcall4.init'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/m8xx_setup.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/platforms/8xx/m8xx_setup.o' being placed in section `.text.unlikely'
>> powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/platforms/8xx/m8xx_setup.o' being placed in section `.init.text'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/machine_check.o' being placed in section `.rodata.str1.4'
>> powerpc-linux-ld: warning: orphan section `.text.unlikely' from `arch/powerpc/platforms/8xx/machine_check.o' being placed in section `.text.unlikely'
>> powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/pic.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/platforms/8xx/pic.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/platforms/8xx/cpm1.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/platforms/8xx/cpm1.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/cpm1.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/platforms/8xx/cpm1.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/platforms/8xx/cpm1-ic.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/cpm1-ic.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.initcall3.init' from `arch/powerpc/platforms/8xx/cpm1-ic.o' being placed in section `.initcall3.init'
   powerpc-linux-ld: warning: orphan section `.initcall4.init' from `arch/powerpc/platforms/8xx/cpm1-ic.o' being placed in section `.initcall4.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.data' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.init.data'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.initcall6.init' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.machine.desc' from `arch/powerpc/platforms/8xx/adder875.o' being placed in section `.machine.desc'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/fork.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/fork.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/fork.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/fork.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `kernel/fork.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `kernel/fork.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `kernel/fork.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `kernel/fork.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.data..cacheline_aligned' from `kernel/fork.o' being placed in section `.data..cacheline_aligned'
   powerpc-linux-ld: warning: orphan section `.data..once' from `kernel/fork.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/fork.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `kernel/fork.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `kernel/fork.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcall4.init' from `kernel/fork.o' being placed in section `.initcall4.init'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/exec_domain.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/exec_domain.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.initcall6.init' from `kernel/exec_domain.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/panic.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/panic.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/panic.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `kernel/panic.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/panic.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.noinstr.text' from `kernel/panic.o' being placed in section `.noinstr.text'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `kernel/panic.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `kernel/panic.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `.data..once' from `kernel/panic.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `kernel/panic.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/panic.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `kernel/panic.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `kernel/panic.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcall6.init' from `kernel/panic.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.initcall7.init' from `kernel/panic.o' being placed in section `.initcall7.init'
   powerpc-linux-ld: warning: orphan section `__param' from `kernel/panic.o' being placed in section `__param'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/cpu.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/cpu.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/cpu.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/cpu.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `kernel/cpu.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `.data..once' from `kernel/cpu.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.data..read_mostly' from `kernel/cpu.o' being placed in section `.data..read_mostly'
   powerpc-linux-ld: warning: orphan section `.data..ro_after_init' from `kernel/cpu.o' being placed in section `.data..ro_after_init'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/cpu.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `kernel/cpu.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `kernel/cpu.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/exit.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/exit.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/exit.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.text.unlikely' from `kernel/exit.o' being placed in section `.text.unlikely'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/exit.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `kernel/exit.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `kernel/exit.o' being placed in section `__mmu_ftr_fixup'
   powerpc-linux-ld: warning: orphan section `__ex_table' from `kernel/exit.o' being placed in section `__ex_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/exit.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.initcall7.init' from `kernel/exit.o' being placed in section `.initcall7.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/softirq.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/softirq.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/softirq.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/softirq.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.softirqentry.text' from `kernel/softirq.o' being placed in section `.softirqentry.text'
   powerpc-linux-ld: warning: orphan section `.data..once' from `kernel/softirq.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/softirq.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.initcallearly.init' from `kernel/softirq.o' being placed in section `.initcallearly.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/resource.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/resource.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/resource.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/resource.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/resource.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.init.rodata' from `kernel/resource.o' being placed in section `.init.rodata'
   powerpc-linux-ld: warning: orphan section `.init.setup' from `kernel/resource.o' being placed in section `.init.setup'
   powerpc-linux-ld: warning: orphan section `.initcall5.init' from `kernel/resource.o' being placed in section `.initcall5.init'
   powerpc-linux-ld: warning: orphan section `.initcall6.init' from `kernel/resource.o' being placed in section `.initcall6.init'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/sysctl.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/sysctl.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__bug_table' from `kernel/sysctl.o' being placed in section `__bug_table'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/sysctl.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.data..once' from `kernel/sysctl.o' being placed in section `.data..once'
   powerpc-linux-ld: warning: orphan section `.discard.addressable' from `kernel/sysctl.o' being placed in section `.discard.addressable'
   powerpc-linux-ld: warning: orphan section `.export_symbol' from `kernel/capability.o' being placed in section `.export_symbol'
   powerpc-linux-ld: warning: orphan section `.init.text' from `kernel/capability.o' being placed in section `.init.text'
   powerpc-linux-ld: warning: orphan section `.rodata.str1.4' from `kernel/capability.o' being placed in section `.rodata.str1.4'
   powerpc-linux-ld: warning: orphan section `__ftr_alt_97' from `kernel/capability.o' being placed in section `__ftr_alt_97'
   powerpc-linux-ld: warning: orphan section `__mmu_ftr_fixup' from `kernel/capability.o' being placed in section `__mmu_ftr_fixup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
