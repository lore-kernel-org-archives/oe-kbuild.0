Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76F341C72
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786183011; cv=none; b=ZiE+HP6JMpuGFCY6Ci/A9JKM46DmlkoHUhbD4KNyx0PPbTgXDS4OXmWvoc6+l7ru65QHV6XaRMF9yZiU6jS2aMquZYyYjLZzalThWqE/jYxJrY+lyDSuPUp/S8sotHzofOBzdyUyvsNmQBSThcDwJazx2XQZp1O58llAkKUmE7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786183011; c=relaxed/simple;
	bh=B8kglKCaQ5MShggm8Za4P0bkTUOFaW2Az7zVQ/a6C0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bh//STFWZxYvqtK3D307Q4h7410PbMQTLmEz+I2+TLa/tNCoTriprDtaWuB7fASot8Q8uLQ1xJGZAms2G6Subrxs1k5VOWr9kB8rAQDWRq/YSY+lvzPgeDOuvYhdvYD3RhcPYHEzW0NntOZ3PBFS2rn/jZylOSbymZiPab1Wik4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evxFYmsT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evxFYmsT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786183009; x=1817719009;
  h=date:from:to:cc:subject:message-id;
  bh=B8kglKCaQ5MShggm8Za4P0bkTUOFaW2Az7zVQ/a6C0g=;
  b=evxFYmsTWu7ggJ4xMH5rlwyId7DrmJuXmdWmFOFnNfXzWVIerXmHJC8b
   4jePeETTaYKlvkqQWE/RJo3MNDUo2wK9D3ml4O8jZPfkg6YeXMb1+k+gD
   11l9J06fEFMemIk04yndRcAS43Lt52cCTwfuAKgTohhO36unhVT0+frGW
   Tbg/Yj27xqn14L9i3+cssBrGDqC0vf/N6ZRhKtsphTZ5TPWxHqkE5oJ2Q
   EH7zPo72woi4+mtzQ3BfcgHDnVonVSPfU7+KgP8pQiPWw+aPlOvl9vNu/
   cLeWH2E5Ab4niIe5JlQFqr6QpAV6+futJYFXuuaSR4ZOlXD4EGfFZiEBv
   g==;
X-CSE-ConnectionGUID: H7e/PNmESlaRrRguxU30Ig==
X-CSE-MsgGUID: aHY/Ag8FS4WcTXyKTEp/AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86536464"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86536464"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 02:56:48 -0700
X-CSE-ConnectionGUID: 9eNMdTe4R26yRp719+jWnA==
X-CSE-MsgGUID: xbZ1FAtJRNGDIcH3ws/+nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="262650957"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Aug 2026 02:56:47 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsdnI-00000000K4f-1PcN;
	Sat, 08 Aug 2026 09:56:44 +0000
Date: Sat, 08 Aug 2026 17:56:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/irqchip/irq-econet-en751221.c:43 Cannot
 find identifier on line:
Message-ID: <202608081710.1cQM0zGo-lkp@intel.com>
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
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: 292eca3163218f2185a8eabe59f4a576bb9e05f8 docs: kdoc: fix logic to handle unissued warnings
date:   7 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-r122-20260808 (https://download.01.org/0day-ci/archive/20260808/202608081710.1cQM0zGo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608081710.1cQM0zGo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 292eca316321 ("docs: kdoc: fix logic to handle unissued warnings")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608081710.1cQM0zGo-lkp@intel.com/

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
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=y] && OF [=y]
   Selected by [y]:
   - ECONET [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
