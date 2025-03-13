Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62982690D1
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Mar 2025 15:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741881485; cv=none; b=RG4Tq9TMctd/10IBYJtCOq/nly/ZOqVFjEtnOh8ZcG3DK1PpBYh2rGHYVYmnfvtI0EigZytoXJv4xHSJbA9CHVLz47zmAc7bu14PLf0gZMVqSC6GOgGaxWc1cOqW847zmv5db0IPuqcByE3GRxjt0tUriSq3vDQK3gwifrNY6OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741881485; c=relaxed/simple;
	bh=lBHKS2iPAsTaiA4uMgREgWTU/6VH5EISH9yaAzJgQLM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PvC5Jr2I2RwY8aocU3JxrYhxolo1NUbNtBmPYKdmVrG8KFQ0pAgawMAIusU/SM92KPmSY+1R+sZROTzKbG+vG3J+P3cKBW5rIDbJDTBuMBgPq5aEDQIp6cKems8CoKTupvqBdIyjKWyGCUXQdKz6W1G7vWUQOxtCAno0JP1YAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XfaRpSC0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XfaRpSC0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741881483; x=1773417483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lBHKS2iPAsTaiA4uMgREgWTU/6VH5EISH9yaAzJgQLM=;
  b=XfaRpSC0jNebQ1stXLK6zJOYTHRcWoanCD5fQ1ZOKcXoQKdhgNYbGBqR
   QvHZZt6J6wkmBrqzSlFqmNkQ7We45XToIh2AKMGkZw0x4SOdlCQxKbYpP
   a/dj99KHHlhICiWEzN6cUW3Gq3BEHnRSJVLXEfpfRX74NsGQ5s69Vk+mD
   nsrlmf6kcZ4fVx8Vxdp4k2pFa1SETyI5KY4GhX7FKvVdkhnSS07L5iZQ0
   DORR5R1/8Y/yMnS/pls4J0Sl9w7XLSGi5kZPyo8Jlry3hHqPzqzX9EufX
   8x4gqUKRC3IM0ah/urJZAwUQ1AaiS2Kck2Mc/aC03DAL49W+O57A5SRY/
   A==;
X-CSE-ConnectionGUID: tFzqTIy9SJ+domWzuuqf4A==
X-CSE-MsgGUID: NW6UJj2YSYy0WILit4Owsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="42177501"
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="42177501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2025 08:58:02 -0700
X-CSE-ConnectionGUID: PWm34eh/RlCSa3Co4ooiIA==
X-CSE-MsgGUID: HbfThQn0S1uduE/nLNZqug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,245,1736841600"; 
   d="scan'208";a="121493700"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 13 Mar 2025 08:58:01 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tskwY-0009cG-0y;
	Thu, 13 Mar 2025 15:57:58 +0000
Date: Thu, 13 Mar 2025 23:57:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ
 number from DeviceTree
Message-ID: <202503132345.uKNehsnm-lkp@intel.com>
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
In-Reply-To: <20250307220304.247725-9-romank@linux.microsoft.com>
References: <20250307220304.247725-9-romank@linux.microsoft.com>
TO: Roman Kisel <romank@linux.microsoft.com>
TO: arnd@arndb.de
TO: bhelgaas@google.com
TO: bp@alien8.de
TO: catalin.marinas@arm.com
TO: conor+dt@kernel.org
TO: dave.hansen@linux.intel.com
TO: decui@microsoft.com
TO: haiyangz@microsoft.com
TO: hpa@zytor.com
TO: joey.gouly@arm.com
TO: krzk+dt@kernel.org
TO: kw@linux.com
TO: kys@microsoft.com
TO: lenb@kernel.org
TO: lpieralisi@kernel.org
TO: manivannan.sadhasivam@linaro.org
TO: mark.rutland@arm.com
TO: maz@kernel.org
TO: mingo@redhat.com
TO: oliver.upton@linux.dev
TO: rafael@kernel.org
TO: robh@kernel.org
TO: ssengar@linux.microsoft.com
TO: sudeep.holla@arm.com
TO: suzuki.poulose@arm.com
TO: tglx@linutronix.de
TO: wei.liu@kernel.org
TO: will@kernel.org
TO: yuzenghui@huawei.com
TO: devicetree@vger.kernel.org

Hi Roman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 3a7f7785eae7cf012af128ca9e383c91e4955354]

url:    https://github.com/intel-lab-lkp/linux/commits/Roman-Kisel/arm64-kvm-smccc-Introduce-and-use-API-for-detectting-hypervisor-presence/20250308-060639
base:   3a7f7785eae7cf012af128ca9e383c91e4955354
patch link:    https://lore.kernel.org/r/20250307220304.247725-9-romank%40linux.microsoft.com
patch subject: [PATCH hyperv-next v5 08/11] Drivers: hv: vmbus: Get the IRQ number from DeviceTree
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm64-randconfig-r071-20250312 (https://download.01.org/0day-ci/archive/20250313/202503132345.uKNehsnm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503132345.uKNehsnm-lkp@intel.com/

smatch warnings:
drivers/hv/vmbus_drv.c:2355 vmbus_set_irq() warn: platform_get_irq() does not return zero

vim +2355 drivers/hv/vmbus_drv.c

f83705a51275ed2 Saurabh Sengar 2023-03-20  2347  
2e494cbd89c51d1 Roman Kisel    2025-03-07  2348  static int __maybe_unused vmbus_set_irq(struct platform_device *pdev)
2e494cbd89c51d1 Roman Kisel    2025-03-07  2349  {
2e494cbd89c51d1 Roman Kisel    2025-03-07  2350  	struct irq_data *data;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2351  	int irq;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2352  	irq_hw_number_t hwirq;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2353  
2e494cbd89c51d1 Roman Kisel    2025-03-07  2354  	irq = platform_get_irq(pdev, 0);
2e494cbd89c51d1 Roman Kisel    2025-03-07 @2355  	if (irq == 0) {
2e494cbd89c51d1 Roman Kisel    2025-03-07  2356  		pr_err("VMBus interrupt mapping failure\n");
2e494cbd89c51d1 Roman Kisel    2025-03-07  2357  		return -EINVAL;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2358  	}
2e494cbd89c51d1 Roman Kisel    2025-03-07  2359  	if (irq < 0) {
2e494cbd89c51d1 Roman Kisel    2025-03-07  2360  		pr_err("VMBus interrupt data can't be read from DeviceTree, error %d\n", irq);
2e494cbd89c51d1 Roman Kisel    2025-03-07  2361  		return irq;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2362  	}
2e494cbd89c51d1 Roman Kisel    2025-03-07  2363  
2e494cbd89c51d1 Roman Kisel    2025-03-07  2364  	data = irq_get_irq_data(irq);
2e494cbd89c51d1 Roman Kisel    2025-03-07  2365  	if (!data) {
2e494cbd89c51d1 Roman Kisel    2025-03-07  2366  		pr_err("No interrupt data for VMBus virq %d\n", irq);
2e494cbd89c51d1 Roman Kisel    2025-03-07  2367  		return -ENODEV;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2368  	}
2e494cbd89c51d1 Roman Kisel    2025-03-07  2369  	hwirq = irqd_to_hwirq(data);
2e494cbd89c51d1 Roman Kisel    2025-03-07  2370  
2e494cbd89c51d1 Roman Kisel    2025-03-07  2371  	vmbus_irq = irq;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2372  	vmbus_interrupt = hwirq;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2373  	pr_debug("VMBus virq %d, hwirq %d\n", vmbus_irq, vmbus_interrupt);
2e494cbd89c51d1 Roman Kisel    2025-03-07  2374  
2e494cbd89c51d1 Roman Kisel    2025-03-07  2375  	return 0;
2e494cbd89c51d1 Roman Kisel    2025-03-07  2376  }
2e494cbd89c51d1 Roman Kisel    2025-03-07  2377  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
