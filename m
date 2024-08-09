Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E061D8831
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Aug 2024 00:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723164065; cv=none; b=dXrzO/cI5yJT0caLqKNFJAPeNpYqyTOkQBXLwXVCuSJkrabV2xzFDF5eN7yzI1/+65vrdlg/zKd5agjYyiWnFH0nSV7FPSr3ukN4EHEB9gcYc0nJm6e3TrdBPRoo05gX5P2N5T2X8ny2HlDSu+erbYuaIP35CKC0iAs8I9PCUHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723164065; c=relaxed/simple;
	bh=7ZNY4hS9yNMBDJSaCyLzSp262cJ2RA+x4JZjN8o3F0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=moRqF/gBVAZVa4JwFQ/PLvRHTe3rdz3CsER6QLkq0xU7dmkal7nn/uJstIWvq9H1FcugpZGeh3Ouswt5dgG4LEhYgbVBs/z0EHwFlVbiZWEl9IVdwuqYffpqJXh76LzqoPC0ORPqfJavwYhu4bJy7Mz+nk5nSBPcPXhpwS3+aVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EjxOINBY; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EjxOINBY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723164063; x=1754700063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ZNY4hS9yNMBDJSaCyLzSp262cJ2RA+x4JZjN8o3F0I=;
  b=EjxOINBY98jswKErlhrypmCnBWfQuFDc4tjxWWcaIeCtoG/47Gi2A95m
   VFuDvRWk+TsKIfkcFi8aekmg6D+lQ4+aUI9OaOBt5DI8j/5bQPM0v6GFn
   vUKQ+HmVmJkW4vAVfZ1XB2iUM5pQpfuGvffWO3Wz+IeJ+Ux9EMVr8KP8h
   y3luzwxtK9x44JMJxDc4f61vnuhIr3aHpjdjn0S4ru+FsY5QLhw3T+vst
   6Wy1SuB/Onc4LhNtLPSpYirlRe7q9pm8jRhFie1QeAGQ7zAPI9lgcGci1
   WRKkp5NU0/LUBBKoojJ9opPmHRpOJG6myZ3SQAUZmo88PC5KKZiJSF+BK
   w==;
X-CSE-ConnectionGUID: +HbGojagSfmbwDhfC348+Q==
X-CSE-MsgGUID: nFgPEWSDQiyfFzvXon8tmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="21475565"
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="21475565"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 17:41:02 -0700
X-CSE-ConnectionGUID: AEIl2aoeSsC9uXogSSntbg==
X-CSE-MsgGUID: pKHmn79rSpyVvMBgjff5KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,274,1716274800"; 
   d="scan'208";a="62354572"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 08 Aug 2024 17:41:01 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1scDgg-0006go-34;
	Fri, 09 Aug 2024 00:40:58 +0000
Date: Fri, 9 Aug 2024 08:40:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [acrn:pr/380 8853/19666] drivers/media/platform/intel/ipu6-acpi.c:
 linux/gpio.h is included more than once.
Message-ID: <202408090835.lGcxVdQz-lkp@intel.com>
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
TO: zouxiaoh <xiaohong.zou@intel.com>
CC: nanli2x <nanx.li@intel.com>

tree:   https://github.com/projectacrn/acrn-kernel pr/380
head:   1cfb4ffc0c480ebec70ad4ba52d984cc5f65401e
commit: b2d9ba9588cef2ff54740e1a514eec22b8ec8e8d [8853/19666] add ipu driver for kernel 5.15
:::::: branch date: 11 hours ago
:::::: commit date: 2 years, 3 months ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408090835.lGcxVdQz-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
   drivers/media/platform/intel/ipu6-acpi.c: linux/platform_device.h is included more than once.
>> drivers/media/platform/intel/ipu6-acpi.c: linux/gpio.h is included more than once.
>> drivers/media/platform/intel/ipu6-acpi.c: linux/clk.h is included more than once.

vim +19 drivers/media/platform/intel/ipu6-acpi.c

  > 19	#include <linux/gpio.h>
    20	#include <linux/i2c.h>
    21	#include <linux/module.h>
    22	#include <linux/slab.h>
    23	#include <linux/string.h>
    24	#include <linux/gpio/consumer.h>
    25	#include <linux/platform_device.h>
    26	#include <linux/regulator/consumer.h>
    27	#include <linux/regulator/driver.h>
    28	#include <linux/regulator/fixed.h>
    29	#include <linux/regulator/gpio-regulator.h>
    30	#include <linux/regulator/machine.h>
    31	#include <linux/list.h>
    32	#include <linux/platform_device.h>
    33	
    34	#include <linux/clk.h>
    35	#include <linux/clkdev.h>
  > 36	#include <linux/gpio.h>
    37	#include <linux/kernel.h>
    38	#include <linux/pci.h>
    39	#include <media/ipu-isys.h>
    40	#include "ipu.h"
    41	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
