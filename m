Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6910629B0
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Jun 2025 04:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748752403; cv=none; b=lFstN4k7nPM44tCjo9yRYIYXmwB6hkghqQRYn8QsRbnEE3mH49s+S3bARv4y6aVKzLxsEs+6rXhWO3ORVt9EEn8aKb16Uw+CTxmesxWETmF64eIxmU6zbh90lDtj9kILj17vy59EX+5COgt6DqES89gfYsobDuwqH+mmFyXdAeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748752403; c=relaxed/simple;
	bh=+pyODcLwOBrXeZvlfl0mu9RDOz9Y04dKmu/zpmk32kQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bWhGUVY6sCQZQ/c/ySHpoePl/3pirDbD3EXSmeKx21KmA4WbfdmUayJ70A/yNv61FftOj1lAzR+y2nDXgym3pYltA+csLNN4KGrq7OVNWaPuxeFe6wQkN23HNdgBpgTRLORHkwDqBP9odRz8IvFDZCnEoIciFWT8590bqW4Pbpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hX1nm6Ux; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hX1nm6Ux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748752400; x=1780288400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+pyODcLwOBrXeZvlfl0mu9RDOz9Y04dKmu/zpmk32kQ=;
  b=hX1nm6UxShjx11vHuyl5jmIVMUHPnPKtnjFwbkBSUwZMvrw8k3p8PWQA
   OWpea6zzKrMTcA9pJwATfo3YTnmFW3mmg73t8N6KquSWZlskwvmhnjW7f
   CZjqunCa7InauGgVBbsiYbOmOQn4MYUNM+tCyiDvGbFhCjTgBZpZ2PM1i
   3+UsFI3k77DCA/txzD1Leh+8KFMqDJct/OfWC3/YImjHaMrUuY5sy4SHR
   vuS2kgkye4XQKLoCZv4vRAIjxXJ1bAo3Li6+EFWeEhvDR04VVxv2tvTRx
   /e+D9AQQEQOiji15T+kXY3XNVs9VrsOK5Yy9TfHkgw4jzQkoKjHcNwurm
   g==;
X-CSE-ConnectionGUID: N7bDmhs7QE65Jlr87oTPPA==
X-CSE-MsgGUID: ilXXlDDtSyGb3wy0OkYhdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11450"; a="49919029"
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="49919029"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2025 21:33:20 -0700
X-CSE-ConnectionGUID: eWqtfXVVS8SDkMJyaEc6dA==
X-CSE-MsgGUID: VUE3mwoIRSOHeb1pMAKi1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,200,1744095600"; 
   d="scan'208";a="144703078"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 31 May 2025 21:33:19 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLaNo-000Yo0-2Y;
	Sun, 01 Jun 2025 04:33:16 +0000
Date: Sun, 1 Jun 2025 12:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:OLK-5.10 2938/2938] drivers/irqchip/irq-gic-v3-its.c:
 linux/pci.h is included more than once.
Message-ID: <202506011207.GF5fjCi8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Jia Qingtong <jiaqingtong@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: f234395f459d55fc974ff1f4241c379d9d7d6b32 [2938/2938] acpi/iort: Add func to get used deviceid bitmap
:::::: branch date: 2 days ago
:::::: commit date: 5 months ago
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506011207.GF5fjCi8-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/irqchip/irq-gic-v3-its.c: linux/pci.h is included more than once.

vim +40 drivers/irqchip/irq-gic-v3-its.c

    36	
    37	#include <linux/irqchip.h>
    38	#include <linux/irqchip/arm-gic-v3.h>
    39	#include <linux/irqchip/arm-gic-v4.h>
  > 40	#include <linux/pci.h>
    41	
    42	#include <asm/cputype.h>
    43	#include <asm/exception.h>
    44	
    45	#ifdef CONFIG_ARCH_PHYTIUM
    46	#include <asm/phytium_machine_types.h>
    47	#endif
    48	
    49	#include "irq-gic-common.h"
    50	
    51	#ifdef CONFIG_VIRT_PLAT_DEV
  > 52	#include <linux/pci.h>
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
