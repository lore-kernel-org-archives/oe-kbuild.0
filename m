Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C252CCDD
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jan 2024 01:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705800244; cv=none; b=Plhhs5OAtXEocHbYzmaXF7oVtjSKnOxzNQq8migprFIPyP7HLpAzW1blQz33QUdrM+l6bUVEo8RhYuENuaYhvcYas6Wvo7JHAMlUXUM/HnYMIvQ16wZ7ujGqdo3UowZnsnT/b6d20JPqx+PJFLR2fHI9bcOjLuFLhmGwbREz20A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705800244; c=relaxed/simple;
	bh=ggJX/FoqYDH/UTorNDyWNBcx0al1S5fDOctGFXEP1l0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pBpbqLrxRllsQppLju4H1tB7ZjeC+wfj2CTG3nZbiQuWN4FXuBd+ULMBQ/LSrD5b9umhHyHSJvukqOJngHAawqa8kw76WI9oQ9ltJ1jUGz5tTyY80z6BTVhpxRXib4YH5L8btorGifCGP8GLTM19aLLx38npNHH/vTP2CRxwim0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZz5ydOT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZz5ydOT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705800243; x=1737336243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ggJX/FoqYDH/UTorNDyWNBcx0al1S5fDOctGFXEP1l0=;
  b=LZz5ydOTqyO5Yb4hzKSeyCJ2CvtiIJPe/Z2ZHF4iQGEadszqQdhHb0Bk
   fMd+do/LIQ+SnJCzvKL/m4eoYeIwerQwnosg/wsUGazGNQkESKyUmSCuN
   CtLUQpuzpmwtWJV9BdEFjr/RzSColb6EEWz+ahthjVG9MfaXt/RuDCK6z
   4LN1Hulux1ZKonMUFpy7iJ7PCoumXnykrbzv3WeygqMNe80PZKUqGMPd9
   ewRYxnl2d87XnP1h68fyA5Q0VaGa11RuOMvtYXBXPbP9lYcYF5jrEXXNb
   ditsamLl7RXCBdETVdOrl80/4QyypFB8Yfnp+xnHDnNIvHzQdweCpbKMp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="7746812"
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="7746812"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 17:24:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,209,1701158400"; 
   d="scan'208";a="909558"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 20 Jan 2024 17:23:59 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRMZ1-0005Zm-2u;
	Sun, 21 Jan 2024 01:23:55 +0000
Date: Sun, 21 Jan 2024 09:22:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function
 kallsyms_sym_address: .text+0x10): relocation R_RISCV_PCREL_HI20 out of
 range: -524419 is not in [-524288, 524287]; references
 kallsyms_relative_base
Message-ID: <202401210942.sDlZ3viL-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Jesse Taube <mr.bossman075@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>

Hi Jesse,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e5075d8ec5647322fb9e699bfb76331cc8ee098d
commit: 49f965b6fbca63904d7397ce96066fa992f401a3 soc: canaan: Make K210_SYSCTL depend on CLK_K210
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-r064-20240120 (https://download.01.org/0day-ci/archive/20240121/202401210942.sDlZ3viL-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401210942.sDlZ3viL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401210942.sDlZ3viL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_sym_address: .text+0x10): relocation R_RISCV_PCREL_HI20 out of range: -524419 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_sym_address: .text+0x20): relocation R_RISCV_PCREL_HI20 out of range: -524419 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_lookup_names: .text+0x20c): relocation R_RISCV_PCREL_HI20 out of range: -524419 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_symbol: .text+0x798): relocation R_RISCV_PCREL_HI20 out of range: -524420 is not in [-524288, 524287]; references kallsyms_num_syms
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_symbol: .text+0x7b4): relocation R_RISCV_PCREL_HI20 out of range: -524420 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_symbol: .text+0x7c0): relocation R_RISCV_PCREL_HI20 out of range: -524420 is not in [-524288, 524287]; references kallsyms_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_symbol: .text+0x7c8): relocation R_RISCV_PCREL_HI20 out of range: -524420 is not in [-524288, 524287]; references kallsyms_offsets
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_symbol: .text+0x7d0): relocation R_RISCV_PCREL_HI20 out of range: -524420 is not in [-524288, 524287]; references kallsyms_token_index
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_symbol: .text+0x7d8): relocation R_RISCV_PCREL_HI20 out of range: -524420 is not in [-524288, 524287]; references kallsyms_token_table
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x9c0): relocation R_RISCV_PCREL_HI20 out of range: -524420 is not in [-524288, 524287]; references kallsyms_relative_base
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
--
>> ld.lld: error: vmlinux.a(kernel/kallsyms.o):(function kallsyms_on_each_match_symbol: .text+0x9cc): relocation R_RISCV_PCREL_HI20 out of range: -524420 is not in [-524288, 524287]; references kallsyms_seqs_of_names
   >>> referenced by kallsyms.c
   >>> defined in vmlinux.a(kernel/kallsyms.o)
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
