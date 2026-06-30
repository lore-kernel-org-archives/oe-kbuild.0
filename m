Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C9F78F59
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jun 2026 01:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782784597; cv=none; b=hQoM/04pG69esIYzlEjbV8OKs9fqYm6dkDotEBq8V3Zt/G33Xlaii+jIWLf/Tjt0ytHJOefXnkIS8BzLhXBjRsTGt3G3Ftad27MPmmjHrjHQQhkev1Iy2dbtu4Si4hmzyefTHI2UIKnOeDYYrVMY2bAI6l9T3z2/GjxyOZP1Jzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782784597; c=relaxed/simple;
	bh=KXPEhSuK7mUJgmz2T9y3HqAIqks9kcHiWsTsC6qyafo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BX9Xej5u5DX88IfYsJIMwIwgoY+WDFJcDjIHyrrLcNlmDnfeCNAE8HtuUadA0s8EQgbZmMfE4zDZAnxApFhjZbLTDjmPbBjCoMjp6QgQazvJyv5w3VIn0jm9tFKnNWe/LKD+b4VXhHnN1Nl+ntkaUIxaGRbhqUL/9eOhHUH8Thc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oKVf+Uze; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oKVf+Uze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782784595; x=1814320595;
  h=date:from:to:cc:subject:message-id;
  bh=KXPEhSuK7mUJgmz2T9y3HqAIqks9kcHiWsTsC6qyafo=;
  b=oKVf+Uze1rMHjIT91HAzSXdMhG+Y0Kes7IdvEUNfM/UxbAIrEd8YtI4U
   AqlIjsImYHc9FRO/bkNvmaEddhR9PWQxZq0/TfkSt7mgKTxnMp0mGmy0n
   +dXAoM1fxmdaeL0W9v+RTyR555iMYv0DsbuhKmQB2c7GazA9oEviDFyZq
   JmI8TxkwbQ/HHhOO0c6eaHERz7BaYhow7F3zLvAmdtHwIM3plzSbO1Uke
   4VXTcYbx7U6ttj5i8nErZ2HxYR/tGo9H7rjeD/4i4mguOl3r9BpGL7qyN
   Ovgh66iebI0Cul8BwxowD2wPmhnZnTmO+T/wsjnSdKkubgo8Qp8hixhPz
   Q==;
X-CSE-ConnectionGUID: kAU4LJi+TZG0NaYKOB5Xdw==
X-CSE-MsgGUID: Bw74km95Tje2OyZnXGX0MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="82600694"
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="82600694"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 18:56:34 -0700
X-CSE-ConnectionGUID: u3TtEThzQtG3kRNil07BUQ==
X-CSE-MsgGUID: n1Ccn/BxQf2BJZ2SN6WWPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,233,1774335600"; 
   d="scan'208";a="252775905"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Jun 2026 18:56:33 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weNiA-000000007vd-3u9x;
	Tue, 30 Jun 2026 01:56:30 +0000
Date: Tue, 30 Jun 2026 09:55:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/irqchip/irq-econet-en751221.c:43 Cannot
 find identifier on line:
Message-ID: <202606300942.bkTx83wC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Jonathan Corbet <corbet@lwn.net>

Hi Mauro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   dc59e4fea9d83f03bad6bddf3fa2e52491777482
commit: 292eca3163218f2185a8eabe59f4a576bb9e05f8 docs: kdoc: fix logic to handle unissued warnings
date:   5 months ago
:::::: branch date: 31 hours ago
:::::: commit date: 5 months ago
config: mips-randconfig-r073-20260629 (https://download.01.org/0day-ci/archive/20260630/202606300942.bkTx83wC-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260630/202606300942.bkTx83wC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 292eca316321 ("docs: kdoc: fix logic to handle unissued warnings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606300942.bkTx83wC-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/irqchip/irq-econet-en751221.c:43 Cannot find identifier on line:
    * @membase: Base address of the interrupt controller registers
   Warning: drivers/irqchip/irq-econet-en751221.c:44 Cannot find identifier on line:
    * @interrupt_shadows: Array of all interrupts, for each value,
   Warning: drivers/irqchip/irq-econet-en751221.c:45 Cannot find identifier on line:
    *      - NOT_PERCPU: This interrupt is not per-cpu, so it has no shadow
   Warning: drivers/irqchip/irq-econet-en751221.c:46 Cannot find identifier on line:
    *      - IS_SHADOW: This interrupt is a shadow of another per-cpu interrupt
   Warning: drivers/irqchip/irq-econet-en751221.c:47 Cannot find identifier on line:
    *      - else: This is a per-cpu interrupt whose shadow is the value
   Warning: drivers/irqchip/irq-econet-en751221.c:48 Cannot find identifier on line:
    */
   Warning: drivers/irqchip/irq-econet-en751221.c:49 Cannot find identifier on line:
   static struct {
>> Warning: drivers/irqchip/irq-econet-en751221.c:50 This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst
           void __iomem    *membase;

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_8250
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && !S390
   Selected by [y]:
   - ECONET [=y]
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
   Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
   Selected by [y]:
   - ECONET [=y]
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
   Selected by [y]:
   - ECONET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
