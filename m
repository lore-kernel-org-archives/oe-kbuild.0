Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9001EEEC0
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Jul 2025 00:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753576004; cv=none; b=fVy4OGAaquLV+SKFZVWUrSvwsdMwC4nnU7X9sKOd3y2pzy0qBWnUqNvFGtOkNYCDvJWi1y7NdQ+o6gN7Cdd+mJgH4DK/XMsjBrrorM78EVA8vUo3YN682wNd18BLuKYnHHnz8DLy/TjNRQZB6WZKB0CfL4PNmbFY2Z8BP8X4vR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753576004; c=relaxed/simple;
	bh=BsdY37Njhq5NdNBxv60YJdKeVVS6fQScl8jjE++CygQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vDtfeS6bZV6GtvDTu65dp4tn9iR+W+YgTuK4a+mEgvpo+ycu5g2R0gcl7Tqx/0U/6dAorVFh7uYnUycV54kDwRPIW4Hx5xDNN5AMvd9lKe/r+9/t0kx6S78mGSo46XqKVzyc8sRM+YfU6KYIXpcoSsTURLNG00Yxr/W7ilI4SYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UHssUMQm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UHssUMQm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753576003; x=1785112003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BsdY37Njhq5NdNBxv60YJdKeVVS6fQScl8jjE++CygQ=;
  b=UHssUMQm7GEdIhpl27ds0ntvy2y001/2QBbYKQF9vvD2prNQtYi2ADzl
   NAkCHjJnBNax+Nf4P6DDs6jIXnJ77E5mxizNZsK/Qx0hELkndZdGWU1TX
   wplrjzWr/hHlY/xxArZMsfNYB7kZeZglCi9wrbRjYjnpgBsOIuBOiq5Iz
   Dh1H1W3+/RT8Lrm6Wu8sv1rqhhMA3BKvOgT//T7nqUer8VTFD6oR+Gn4H
   wYLbS4jGcl4zeJzo+zCOFsZboZlzw8OxzZLHmV/v1OyviOTTv38oU3tRY
   6Ip/nJIyUZmVRVut4cKAaM8nzKg8l0XcMQL8GBc13WZ64qo0NdxBgnChi
   w==;
X-CSE-ConnectionGUID: Pfe5gQ8cS7yo3ew7ruIy8g==
X-CSE-MsgGUID: gMetDJsfSom7TjPAHaK0hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55806224"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55806224"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 17:26:42 -0700
X-CSE-ConnectionGUID: LJ6rO7wZSXWP7LoV/DtbRA==
X-CSE-MsgGUID: QwXN5TW8QsitmgwTw3+nuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="162130958"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 26 Jul 2025 17:26:40 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufpDq-000MMl-10;
	Sun, 27 Jul 2025 00:26:38 +0000
Date: Sun, 27 Jul 2025 08:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2] ACPI: processor: idle: Fix resource leak and
 potential concurrent in acpi_processor_power_init()
Message-ID: <202507271001.EPy5YhFz-lkp@intel.com>
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
In-Reply-To: <20250723121034.3685996-1-lihuisong@huawei.com>
References: <20250723121034.3685996-1-lihuisong@huawei.com>
TO: Huisong Li <lihuisong@huawei.com>
TO: rafael@kernel.org
TO: lenb@kernel.org
CC: linux-acpi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linuxarm@huawei.com
CC: jonathan.cameron@huawei.com
CC: zhanjie9@hisilicon.com
CC: zhenglifeng1@huawei.com
CC: yubowen8@huawei.com
CC: liuyonglong@huawei.com
CC: lihuisong@huawei.com

Hi Huisong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.16-rc7 next-20250725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huisong-Li/ACPI-processor-idle-Fix-resource-leak-and-potential-concurrent-in-acpi_processor_power_init/20250723-201246
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20250723121034.3685996-1-lihuisong%40huawei.com
patch subject: [PATCH v2] ACPI: processor: idle: Fix resource leak and potential concurrent in acpi_processor_power_init()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20250725 (https://download.01.org/0day-ci/archive/20250727/202507271001.EPy5YhFz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507271001.EPy5YhFz-lkp@intel.com/

smatch warnings:
drivers/acpi/processor_idle.c:1387 acpi_processor_register_idle_driver() error: uninitialized symbol 'pr'.
drivers/acpi/processor_idle.c:1390 acpi_processor_register_idle_driver() error: uninitialized symbol 'ret'.

vim +/pr +1387 drivers/acpi/processor_idle.c

46bcfad7a819bd Deepthi Dharwar 2011-10-28  1362  
75621e77853b5b Huisong Li      2025-07-23  1363  int acpi_processor_register_idle_driver(void)
75621e77853b5b Huisong Li      2025-07-23  1364  {
75621e77853b5b Huisong Li      2025-07-23  1365  	struct acpi_processor *pr;
75621e77853b5b Huisong Li      2025-07-23  1366  	int cpu;
75621e77853b5b Huisong Li      2025-07-23  1367  	int ret;
75621e77853b5b Huisong Li      2025-07-23  1368  
75621e77853b5b Huisong Li      2025-07-23  1369  	/*
75621e77853b5b Huisong Li      2025-07-23  1370  	 * Acpi idle driver is used by all possible CPUs.
75621e77853b5b Huisong Li      2025-07-23  1371  	 * Install the idle handler by the processor power info of one in them.
75621e77853b5b Huisong Li      2025-07-23  1372  	 * Note that we use previously set idle handler will be used on
75621e77853b5b Huisong Li      2025-07-23  1373  	 * platforms that only support C1.
75621e77853b5b Huisong Li      2025-07-23  1374  	 */
75621e77853b5b Huisong Li      2025-07-23  1375  	for_each_cpu(cpu, (struct cpumask *)cpu_possible_mask) {
75621e77853b5b Huisong Li      2025-07-23  1376  		pr = per_cpu(processors, cpu);
75621e77853b5b Huisong Li      2025-07-23  1377  		if (pr == NULL)
75621e77853b5b Huisong Li      2025-07-23  1378  			continue;
75621e77853b5b Huisong Li      2025-07-23  1379  
75621e77853b5b Huisong Li      2025-07-23  1380  		ret = acpi_processor_get_power_info(pr);
75621e77853b5b Huisong Li      2025-07-23  1381  		if (!ret) {
75621e77853b5b Huisong Li      2025-07-23  1382  			pr->flags.power_setup_done = 1;
75621e77853b5b Huisong Li      2025-07-23  1383  			break;
75621e77853b5b Huisong Li      2025-07-23  1384  		}
75621e77853b5b Huisong Li      2025-07-23  1385  	}
75621e77853b5b Huisong Li      2025-07-23  1386  
75621e77853b5b Huisong Li      2025-07-23 @1387  	if (unlikely(!pr))
75621e77853b5b Huisong Li      2025-07-23  1388  		return -ENODEV;
75621e77853b5b Huisong Li      2025-07-23  1389  
75621e77853b5b Huisong Li      2025-07-23 @1390  	if (ret) {
75621e77853b5b Huisong Li      2025-07-23  1391  		pr_err("%s get power information failed.\n",
75621e77853b5b Huisong Li      2025-07-23  1392  		       acpi_idle_driver.name);
75621e77853b5b Huisong Li      2025-07-23  1393  		return ret;
75621e77853b5b Huisong Li      2025-07-23  1394  	}
75621e77853b5b Huisong Li      2025-07-23  1395  
75621e77853b5b Huisong Li      2025-07-23  1396  	acpi_processor_setup_cpuidle_states(pr);
75621e77853b5b Huisong Li      2025-07-23  1397  	ret = cpuidle_register_driver(&acpi_idle_driver);
75621e77853b5b Huisong Li      2025-07-23  1398  	if (ret)
75621e77853b5b Huisong Li      2025-07-23  1399  		return ret;
75621e77853b5b Huisong Li      2025-07-23  1400  
75621e77853b5b Huisong Li      2025-07-23  1401  	pr_debug("%s registered with cpuidle\n", acpi_idle_driver.name);
75621e77853b5b Huisong Li      2025-07-23  1402  	return 0;
75621e77853b5b Huisong Li      2025-07-23  1403  }
75621e77853b5b Huisong Li      2025-07-23  1404  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
