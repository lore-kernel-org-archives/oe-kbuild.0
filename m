Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ED12FE581
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 08:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764924654; cv=none; b=IZsSWLNgrL7VzyvQMvST9OWWhMqqIJZjvPMfwFiqnKAWahreQQ3HE5M524WRj4t3VdE7/CWTU0dwgU4FH3wUf2PB9OVyYsr+iPM7erGb3TmSSIZqr5gqVMq9MG49Ki8Jo1ndUZpgi8nywMEyS9tswF+tLE/836m7UKkCJbY9Wd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764924654; c=relaxed/simple;
	bh=naAc8SAo43UfS3Dq/GeRKym8g2dcRrIjK2mteZ6ra7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=vBSLDsdnPiUpucdl5FCHUCxMSBWqbtq2TOyZfUDG2+ojYq+Czyt7ZzcxfBL0ZNEASZl7J4RYqY2SyhOhsGapRgSju01yKim2ZtDg18KlPdCIfHK1Tg7ZE7R/OUBVHmeYyO7l03i8aIWrDm3jwcyws/w/l6NbPKURUARrjBl69sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KooWPF/y; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KooWPF/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764924641; x=1796460641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=naAc8SAo43UfS3Dq/GeRKym8g2dcRrIjK2mteZ6ra7s=;
  b=KooWPF/yt+TYi7R1CaWTQSqlW6yjyAOgdx/6gb70RYBfrO08JgzyMQEy
   dpaBVZVerjYLFObCHhh7WqfXRxE/5uAx6P1/JBNre8hjIZIH4uJ940p6L
   lftsWVf+cuWn36+IIkG7xfFEQ+Crg0qer8qvAdv5D12htxdVFQem8z48K
   4iAT+embap/MDolu68Nt0Ot0V9yEbU1xsWxNSSCa4SxX6oI2Up7CoyP8e
   Vx7NtX14l78pF++j699PTeqqSqla+nogLP55sQnctMuyEh7N1RFYsUoSx
   +CeOvF3cMXPJ2HWMwKH3RiTu3jLqlQs73eBnpUD+Nr3a6uBaLckg2p7BD
   Q==;
X-CSE-ConnectionGUID: 1EWQh9DpR02om0zy1wKb+Q==
X-CSE-MsgGUID: QNSC3+FMT8eLBSlt8OFISQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66996807"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="66996807"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 00:50:39 -0800
X-CSE-ConnectionGUID: On3oO/UiTceLRzm50cE6eA==
X-CSE-MsgGUID: i8epXsokSMmIHshhzPGj2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="232609768"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Dec 2025 00:50:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRRWL-00000000Enl-2oW6;
	Fri, 05 Dec 2025 08:50:33 +0000
Date: Fri, 5 Dec 2025 16:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5326/13363] samples/damon/mtier.c:21:1: sparse:
 sparse: bad integer constant expression
Message-ID: <202512051641.cG2WFNJD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: samples/damon/mtier.c:21:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <kees@kernel.org>
CC: Daniel Gomez <da.gomez@samsung.com>
CC: Aaron Tomlin <atomlin@atomlin.com>
CC: Petr Pavlu <petr.pavlu@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc04acf4aeca588496124a6cf54bfce3db327039
commit: ae83f3b72621bd3187eb7956c7c2993a97d4b187 [5326/13363] module: Add compile-time check for embedded NUL characters
:::::: branch date: 26 hours ago
:::::: commit date: 4 weeks ago
config: i386-randconfig-061-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051641.cG2WFNJD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051641.cG2WFNJD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512051641.cG2WFNJD-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> samples/damon/mtier.c:21:1: sparse: sparse: bad integer constant expression
>> samples/damon/mtier.c:21:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   samples/damon/mtier.c:24:1: sparse: sparse: bad integer constant expression
   samples/damon/mtier.c:24:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   samples/damon/mtier.c:27:1: sparse: sparse: bad integer constant expression
   samples/damon/mtier.c:27:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   samples/damon/mtier.c:30:1: sparse: sparse: bad integer constant expression
   samples/damon/mtier.c:30:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   samples/damon/mtier.c:33:1: sparse: sparse: bad integer constant expression
   samples/damon/mtier.c:33:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   samples/damon/mtier.c:36:1: sparse: sparse: bad integer constant expression
   samples/damon/mtier.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   samples/damon/mtier.c:48:1: sparse: sparse: bad integer constant expression
>> samples/damon/mtier.c:48:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   samples/damon/mtier.c:51:1: sparse: sparse: bad integer constant expression
   samples/damon/mtier.c:51:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
--
>> samples/hung_task/hung_task_tests.c:161:1: sparse: sparse: bad integer constant expression
>> samples/hung_task/hung_task_tests.c:161:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> samples/hung_task/hung_task_tests.c:161:1: sparse: sparse: bad integer constant expression
>> samples/hung_task/hung_task_tests.c:161:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   samples/hung_task/hung_task_tests.c:162:1: sparse: sparse: bad integer constant expression
>> samples/hung_task/hung_task_tests.c:162:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   samples/hung_task/hung_task_tests.c:163:1: sparse: sparse: bad integer constant expression
   samples/hung_task/hung_task_tests.c:163:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   samples/hung_task/hung_task_tests.c:164:1: sparse: sparse: bad integer constant expression
>> samples/hung_task/hung_task_tests.c:164:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
   samples/kobject/kset-example.c:287:1: sparse: sparse: bad integer constant expression
   samples/kobject/kset-example.c:287:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   samples/kobject/kset-example.c:288:1: sparse: sparse: bad integer constant expression
>> samples/kobject/kset-example.c:288:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   samples/kobject/kset-example.c:288:1: sparse: sparse: bad integer constant expression
   samples/kobject/kset-example.c:288:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   samples/kobject/kset-example.c:289:1: sparse: sparse: bad integer constant expression
   samples/kobject/kset-example.c:289:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
--
   samples/kobject/kobject-example.c:143:1: sparse: sparse: bad integer constant expression
   samples/kobject/kobject-example.c:143:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   samples/kobject/kobject-example.c:144:1: sparse: sparse: bad integer constant expression
>> samples/kobject/kobject-example.c:144:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   samples/kobject/kobject-example.c:144:1: sparse: sparse: bad integer constant expression
   samples/kobject/kobject-example.c:144:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   samples/kobject/kobject-example.c:145:1: sparse: sparse: bad integer constant expression
   samples/kobject/kobject-example.c:145:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
--
>> samples/vfio-mdev/mdpy.c:43:1: sparse: sparse: bad integer constant expression
>> samples/vfio-mdev/mdpy.c:43:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   samples/vfio-mdev/mdpy.c:44:1: sparse: sparse: bad integer constant expression
>> samples/vfio-mdev/mdpy.c:44:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   samples/vfio-mdev/mdpy.c:44:1: sparse: sparse: bad integer constant expression
>> samples/vfio-mdev/mdpy.c:44:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   samples/vfio-mdev/mdpy.c:759:1: sparse: sparse: bad integer constant expression
>> samples/vfio-mdev/mdpy.c:759:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   samples/vfio-mdev/mdpy.c:760:1: sparse: sparse: bad integer constant expression
>> samples/vfio-mdev/mdpy.c:760:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
--
   drivers/acpi/acpi_dbg.c:783:1: sparse: sparse: bad integer constant expression
   drivers/acpi/acpi_dbg.c:783:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/acpi/acpi_dbg.c:784:1: sparse: sparse: bad integer constant expression
   drivers/acpi/acpi_dbg.c:784:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/acpi/acpi_dbg.c:785:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/acpi_dbg.c:785:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/acpi/acpi_dbg.c:785:1: sparse: sparse: bad integer constant expression
   drivers/acpi/acpi_dbg.c:785:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/clocksource/scx200_hrt.c:24:1: sparse: sparse: bad integer constant expression
>> drivers/clocksource/scx200_hrt.c:24:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/clocksource/scx200_hrt.c:25:1: sparse: sparse: bad integer constant expression
>> drivers/clocksource/scx200_hrt.c:25:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/clocksource/scx200_hrt.c:28:1: sparse: sparse: bad integer constant expression
   drivers/clocksource/scx200_hrt.c:28:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/clocksource/scx200_hrt.c:29:1: sparse: sparse: bad integer constant expression
   drivers/clocksource/scx200_hrt.c:29:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/clocksource/scx200_hrt.c:88:1: sparse: sparse: bad integer constant expression
>> drivers/clocksource/scx200_hrt.c:88:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/clocksource/scx200_hrt.c:89:1: sparse: sparse: bad integer constant expression
>> drivers/clocksource/scx200_hrt.c:89:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/clocksource/scx200_hrt.c:90:1: sparse: sparse: bad integer constant expression
>> drivers/clocksource/scx200_hrt.c:90:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/clocksource/scx200_hrt.c:90:1: sparse: sparse: bad integer constant expression
>> drivers/clocksource/scx200_hrt.c:90:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/cpufreq/e_powersaver.c:406:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:406:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:407:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:407:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:408:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:408:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:409:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:409:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:411:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:411:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:412:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:412:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:414:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:414:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:415:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:415:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:417:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:417:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:418:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:418:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:419:1: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/e_powersaver.c:419:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/cpufreq/e_powersaver.c:419:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/e_powersaver.c:419:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/cpufreq/speedstep-ich.c:379:1: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/speedstep-ich.c:379:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-ich.c:380:1: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/speedstep-ich.c:380:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-ich.c:382:1: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/speedstep-ich.c:382:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-ich.c:382:1: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/speedstep-ich.c:382:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/cpufreq/speedstep-lib.c:472:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-lib.c:472:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-lib.c:473:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-lib.c:473:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-lib.c:477:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-lib.c:477:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-lib.c:478:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-lib.c:478:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-lib.c:479:1: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/speedstep-lib.c:479:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-lib.c:479:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-lib.c:479:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/cpufreq/speedstep-smi.c:376:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-smi.c:376:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-smi.c:377:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-smi.c:377:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-smi.c:378:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-smi.c:378:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-smi.c:380:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-smi.c:380:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-smi.c:382:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-smi.c:382:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-smi.c:384:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-smi.c:384:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-smi.c:387:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-smi.c:387:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-smi.c:388:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-smi.c:388:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-smi.c:389:1: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/speedstep-smi.c:389:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/cpufreq/speedstep-smi.c:389:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/speedstep-smi.c:389:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/cpufreq/longhaul.c:982:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:982:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:983:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:983:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:986:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:986:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:987:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:987:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:991:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:991:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:992:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:992:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:995:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:995:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:996:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:996:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:998:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:998:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:999:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:999:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:1000:1: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/longhaul.c:1000:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/cpufreq/longhaul.c:1000:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/longhaul.c:1000:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/extcon/extcon-max77843.c:969:1: sparse: sparse: bad integer constant expression
   drivers/extcon/extcon-max77843.c:969:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/extcon/extcon-max77843.c:970:1: sparse: sparse: bad integer constant expression
   drivers/extcon/extcon-max77843.c:970:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/extcon/extcon-max77843.c:971:1: sparse: sparse: bad integer constant expression
>> drivers/extcon/extcon-max77843.c:971:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/extcon/extcon-max77843.c:971:1: sparse: sparse: bad integer constant expression
   drivers/extcon/extcon-max77843.c:971:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/firewire/sbp2.c:56:1: sparse: sparse: bad integer constant expression
   drivers/firewire/sbp2.c:56:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/firewire/sbp2.c:57:1: sparse: sparse: bad integer constant expression
   drivers/firewire/sbp2.c:57:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/firewire/sbp2.c:103:1: sparse: sparse: bad integer constant expression
   drivers/firewire/sbp2.c:103:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/firewire/sbp2.c:104:1: sparse: sparse: bad integer constant expression
   drivers/firewire/sbp2.c:104:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/firewire/sbp2.c:1603:1: sparse: sparse: bad integer constant expression
   drivers/firewire/sbp2.c:1603:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/firewire/sbp2.c:1604:1: sparse: sparse: bad integer constant expression
   drivers/firewire/sbp2.c:1604:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/firewire/sbp2.c:1605:1: sparse: sparse: bad integer constant expression
>> drivers/firewire/sbp2.c:1605:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/firewire/sbp2.c:1605:1: sparse: sparse: bad integer constant expression
   drivers/firewire/sbp2.c:1605:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/firewire/sbp2.c:1609:1: sparse: sparse: bad integer constant expression
   drivers/firewire/sbp2.c:1609:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
--
   drivers/fpga/microchip-spi.c:410:1: sparse: sparse: bad integer constant expression
   drivers/fpga/microchip-spi.c:410:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/fpga/microchip-spi.c:411:1: sparse: sparse: bad integer constant expression
   drivers/fpga/microchip-spi.c:411:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/fpga/microchip-spi.c:412:1: sparse: sparse: bad integer constant expression
>> drivers/fpga/microchip-spi.c:412:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/fpga/microchip-spi.c:412:1: sparse: sparse: bad integer constant expression
   drivers/fpga/microchip-spi.c:412:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/hid/hid-emsff.c:147:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-emsff.c:147:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hid/hid-emsff.c:148:1: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-emsff.c:148:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hid/hid-emsff.c:148:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-emsff.c:148:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/hid/hid-gfrm.c:146:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-gfrm.c:146:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hid/hid-gfrm.c:147:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-gfrm.c:147:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hid/hid-gfrm.c:148:1: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-gfrm.c:148:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hid/hid-gfrm.c:148:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-gfrm.c:148:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/hid/hid-goodix-spi.c:816:1: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-goodix-spi.c:816:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hid/hid-goodix-spi.c:817:1: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-goodix-spi.c:817:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hid/hid-goodix-spi.c:818:1: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-goodix-spi.c:818:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hid/hid-goodix-spi.c:818:1: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-goodix-spi.c:818:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/hid/hid-ite.c:143:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-ite.c:143:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hid/hid-ite.c:144:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-ite.c:144:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hid/hid-ite.c:145:1: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-ite.c:145:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hid/hid-ite.c:145:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-ite.c:145:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/hid/hid-maltron.c:165:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-maltron.c:165:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hid/hid-maltron.c:166:1: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-maltron.c:166:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hid/hid-maltron.c:166:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-maltron.c:166:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/hid/hid-viewsonic.c:105:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-viewsonic.c:105:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hid/hid-viewsonic.c:106:1: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-viewsonic.c:106:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hid/hid-viewsonic.c:106:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-viewsonic.c:106:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/hid/hid-waltop.c:745:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-waltop.c:745:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/hid/hid-waltop.c:746:1: sparse: sparse: bad integer constant expression
>> drivers/hid/hid-waltop.c:746:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hid/hid-waltop.c:746:1: sparse: sparse: bad integer constant expression
   drivers/hid/hid-waltop.c:746:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/input/gameport/ns558.c:21:1: sparse: sparse: bad integer constant expression
   drivers/input/gameport/ns558.c:21:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/input/gameport/ns558.c:22:1: sparse: sparse: bad integer constant expression
   drivers/input/gameport/ns558.c:22:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/gameport/ns558.c:23:1: sparse: sparse: bad integer constant expression
>> drivers/input/gameport/ns558.c:23:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/gameport/ns558.c:23:1: sparse: sparse: bad integer constant expression
   drivers/input/gameport/ns558.c:23:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/leds/leds-net48xx.c:83:1: sparse: sparse: bad integer constant expression
   drivers/leds/leds-net48xx.c:83:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/leds/leds-net48xx.c:84:1: sparse: sparse: bad integer constant expression
   drivers/leds/leds-net48xx.c:84:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/leds/leds-net48xx.c:85:1: sparse: sparse: bad integer constant expression
>> drivers/leds/leds-net48xx.c:85:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/leds/leds-net48xx.c:85:1: sparse: sparse: bad integer constant expression
   drivers/leds/leds-net48xx.c:85:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/mfd/intel_soc_pmic_mrfld.c:156:1: sparse: sparse: bad integer constant expression
   drivers/mfd/intel_soc_pmic_mrfld.c:156:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mfd/intel_soc_pmic_mrfld.c:157:1: sparse: sparse: bad integer constant expression
>> drivers/mfd/intel_soc_pmic_mrfld.c:157:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/mfd/intel_soc_pmic_mrfld.c:157:1: sparse: sparse: bad integer constant expression
   drivers/mfd/intel_soc_pmic_mrfld.c:157:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/char/mwave/mwavedd.c:68:1: sparse: sparse: bad integer constant expression
   drivers/char/mwave/mwavedd.c:68:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/char/mwave/mwavedd.c:69:1: sparse: sparse: bad integer constant expression
   drivers/char/mwave/mwavedd.c:69:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/char/mwave/mwavedd.c:70:1: sparse: sparse: bad integer constant expression
>> drivers/char/mwave/mwavedd.c:70:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/char/mwave/mwavedd.c:70:1: sparse: sparse: bad integer constant expression
   drivers/char/mwave/mwavedd.c:70:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/char/mwave/mwavedd.c:83:1: sparse: sparse: bad integer constant expression
   drivers/char/mwave/mwavedd.c:83:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/char/mwave/mwavedd.c:84:1: sparse: sparse: bad integer constant expression
   drivers/char/mwave/mwavedd.c:84:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/char/mwave/mwavedd.c:85:1: sparse: sparse: bad integer constant expression
   drivers/char/mwave/mwavedd.c:85:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/char/mwave/mwavedd.c:86:1: sparse: sparse: bad integer constant expression
   drivers/char/mwave/mwavedd.c:86:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/char/mwave/mwavedd.c:87:1: sparse: sparse: bad integer constant expression
   drivers/char/mwave/mwavedd.c:87:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
--
   drivers/char/tpm/tpm_tis.c:91:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:91:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:92:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:92:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:95:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:95:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:96:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:96:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:100:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:100:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:101:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:101:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:310:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:310:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:312:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:312:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:432:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:432:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:433:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:433:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:434:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:434:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:435:1: sparse: sparse: bad integer constant expression
>> drivers/char/tpm/tpm_tis.c:435:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_tis.c:435:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_tis.c:435:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/char/tpm/tpm_i2c_atmel.c:218:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_i2c_atmel.c:218:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_i2c_atmel.c:219:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_i2c_atmel.c:219:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_i2c_atmel.c:220:1: sparse: sparse: bad integer constant expression
>> drivers/char/tpm/tpm_i2c_atmel.c:220:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_i2c_atmel.c:220:1: sparse: sparse: bad integer constant expression
   drivers/char/tpm/tpm_i2c_atmel.c:220:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/firmware/google/gsmi.c:135:1: sparse: sparse: bad integer constant expression
>> drivers/firmware/google/gsmi.c:135:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/firmware/google/gsmi.c:136:1: sparse: sparse: bad integer constant expression
>> drivers/firmware/google/gsmi.c:136:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/firmware/google/gsmi.c:150:1: sparse: sparse: bad integer constant expression
   drivers/firmware/google/gsmi.c:150:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/firmware/google/gsmi.c:1094:1: sparse: sparse: bad integer constant expression
>> drivers/firmware/google/gsmi.c:1094:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/firmware/google/gsmi.c:1095:1: sparse: sparse: bad integer constant expression
>> drivers/firmware/google/gsmi.c:1095:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/firmware/google/gsmi.c:1096:1: sparse: sparse: bad integer constant expression
>> drivers/firmware/google/gsmi.c:1096:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/firmware/google/gsmi.c:1096:1: sparse: sparse: bad integer constant expression
>> drivers/firmware/google/gsmi.c:1096:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/iio/accel/adxl372_spi.c:58:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/adxl372_spi.c:58:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/accel/adxl372_spi.c:59:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/adxl372_spi.c:59:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/accel/adxl372_spi.c:60:1: sparse: sparse: bad integer constant expression
>> drivers/iio/accel/adxl372_spi.c:60:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/accel/adxl372_spi.c:60:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/adxl372_spi.c:60:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/accel/adxl372_spi.c:61:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/adxl372_spi.c:61:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
--
   drivers/scsi/device_handler/scsi_dh_hp_sw.c:283:1: sparse: sparse: bad integer constant expression
   drivers/scsi/device_handler/scsi_dh_hp_sw.c:283:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/scsi/device_handler/scsi_dh_hp_sw.c:284:1: sparse: sparse: bad integer constant expression
   drivers/scsi/device_handler/scsi_dh_hp_sw.c:284:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/scsi/device_handler/scsi_dh_hp_sw.c:285:1: sparse: sparse: bad integer constant expression
>> drivers/scsi/device_handler/scsi_dh_hp_sw.c:285:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/scsi/device_handler/scsi_dh_hp_sw.c:285:1: sparse: sparse: bad integer constant expression
   drivers/scsi/device_handler/scsi_dh_hp_sw.c:285:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/input/joystick/db9.c:22:1: sparse: sparse: bad integer constant expression
>> drivers/input/joystick/db9.c:22:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/input/joystick/db9.c:23:1: sparse: sparse: bad integer constant expression
>> drivers/input/joystick/db9.c:23:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/joystick/db9.c:24:1: sparse: sparse: bad integer constant expression
>> drivers/input/joystick/db9.c:24:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/joystick/db9.c:24:1: sparse: sparse: bad integer constant expression
>> drivers/input/joystick/db9.c:24:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/input/joystick/db9.c:34:1: sparse: sparse: bad integer constant expression
>> drivers/input/joystick/db9.c:34:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/input/joystick/db9.c:35:1: sparse: sparse: bad integer constant expression
>> drivers/input/joystick/db9.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/input/joystick/db9.c:36:1: sparse: sparse: bad integer constant expression
   drivers/input/joystick/db9.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/input/joystick/db9.c:37:1: sparse: sparse: bad integer constant expression
   drivers/input/joystick/db9.c:37:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/input/joystick/db9.c:38:1: sparse: sparse: bad integer constant expression
   drivers/input/joystick/db9.c:38:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/input/joystick/db9.c:39:1: sparse: sparse: bad integer constant expression
   drivers/input/joystick/db9.c:39:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
--
   drivers/input/joystick/sidewinder.c:21:1: sparse: sparse: bad integer constant expression
   drivers/input/joystick/sidewinder.c:21:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/input/joystick/sidewinder.c:22:1: sparse: sparse: bad integer constant expression
   drivers/input/joystick/sidewinder.c:22:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/joystick/sidewinder.c:23:1: sparse: sparse: bad integer constant expression
>> drivers/input/joystick/sidewinder.c:23:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/joystick/sidewinder.c:23:1: sparse: sparse: bad integer constant expression
   drivers/input/joystick/sidewinder.c:23:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/thermal/intel/intel_tcc_cooling.c:122:1: sparse: sparse: bad integer constant expression
   drivers/thermal/intel/intel_tcc_cooling.c:122:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   drivers/thermal/intel/intel_tcc_cooling.c:123:1: sparse: sparse: bad integer constant expression
   drivers/thermal/intel/intel_tcc_cooling.c:123:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/thermal/intel/intel_tcc_cooling.c:124:1: sparse: sparse: bad integer constant expression
   drivers/thermal/intel/intel_tcc_cooling.c:124:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/thermal/intel/intel_tcc_cooling.c:125:1: sparse: sparse: bad integer constant expression
>> drivers/thermal/intel/intel_tcc_cooling.c:125:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/thermal/intel/intel_tcc_cooling.c:125:1: sparse: sparse: bad integer constant expression
   drivers/thermal/intel/intel_tcc_cooling.c:125:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/firmware/efi/test/efi_test.c:23:1: sparse: sparse: bad integer constant expression
>> drivers/firmware/efi/test/efi_test.c:23:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/firmware/efi/test/efi_test.c:24:1: sparse: sparse: bad integer constant expression
>> drivers/firmware/efi/test/efi_test.c:24:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/firmware/efi/test/efi_test.c:25:1: sparse: sparse: bad integer constant expression
>> drivers/firmware/efi/test/efi_test.c:25:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/firmware/efi/test/efi_test.c:25:1: sparse: sparse: bad integer constant expression
>> drivers/firmware/efi/test/efi_test.c:25:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/surface/surface_acpi_notify.c:882:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surface_acpi_notify.c:882:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/surface/surface_acpi_notify.c:883:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surface_acpi_notify.c:883:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/surface/surface_acpi_notify.c:884:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surface_acpi_notify.c:884:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/surface/surface_acpi_notify.c:884:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surface_acpi_notify.c:884:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/surface/surface_dtx.c:1280:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surface_dtx.c:1280:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/surface/surface_dtx.c:1281:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surface_dtx.c:1281:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/surface/surface_dtx.c:1282:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surface_dtx.c:1282:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/surface/surface_dtx.c:1282:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surface_dtx.c:1282:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/platform/surface/surface_gpe.c:349:1: sparse: sparse: bad integer constant expression
   drivers/platform/surface/surface_gpe.c:349:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/surface/surface_gpe.c:350:1: sparse: sparse: bad integer constant expression
   drivers/platform/surface/surface_gpe.c:350:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/surface/surface_gpe.c:351:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surface_gpe.c:351:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/surface/surface_gpe.c:351:1: sparse: sparse: bad integer constant expression
   drivers/platform/surface/surface_gpe.c:351:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/surface/surface_gpe.c:352:1: sparse: sparse: bad integer constant expression
   drivers/platform/surface/surface_gpe.c:352:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
--
>> drivers/platform/surface/surfacepro3_button.c:43:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surfacepro3_button.c:43:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/surface/surfacepro3_button.c:44:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surfacepro3_button.c:44:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/surface/surfacepro3_button.c:45:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surfacepro3_button.c:45:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/surface/surfacepro3_button.c:45:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/surfacepro3_button.c:45:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/media/i2c/msp3400-driver.c:51:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:51:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:52:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:52:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:53:1: sparse: sparse: bad integer constant expression
>> drivers/media/i2c/msp3400-driver.c:53:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:53:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:53:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:69:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:69:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:72:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:72:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:73:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:73:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:74:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:74:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:75:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:75:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:76:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:76:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:77:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:77:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:79:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:79:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:80:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:80:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:81:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:81:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:82:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:82:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:83:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:83:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:84:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:84:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/i2c/msp3400-driver.c:85:1: sparse: sparse: bad integer constant expression
   drivers/media/i2c/msp3400-driver.c:85:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
--
   drivers/target/sbp/sbp_target.c:2296:1: sparse: sparse: bad integer constant expression
   drivers/target/sbp/sbp_target.c:2296:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/target/sbp/sbp_target.c:2297:1: sparse: sparse: bad integer constant expression
>> drivers/target/sbp/sbp_target.c:2297:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/target/sbp/sbp_target.c:2297:1: sparse: sparse: bad integer constant expression
   drivers/target/sbp/sbp_target.c:2297:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/mmc/host/sdhci-xenon.c:725:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/sdhci-xenon.c:725:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mmc/host/sdhci-xenon.c:726:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/sdhci-xenon.c:726:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mmc/host/sdhci-xenon.c:727:1: sparse: sparse: bad integer constant expression
>> drivers/mmc/host/sdhci-xenon.c:727:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/mmc/host/sdhci-xenon.c:727:1: sparse: sparse: bad integer constant expression
   drivers/mmc/host/sdhci-xenon.c:727:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/tty/serial/8250/serial_cs.c:64:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:64:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:65:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:65:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:844:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:844:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:845:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:845:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:846:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:846:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:847:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:847:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:848:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:848:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:849:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:849:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:850:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:850:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:851:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:851:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:852:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:852:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:853:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:853:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:854:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:854:1: sparse: sparse: static assertion failed: "MODULE_INFO(firmware, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:867:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:867:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:868:1: sparse: sparse: bad integer constant expression
>> drivers/tty/serial/8250/serial_cs.c:868:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/tty/serial/8250/serial_cs.c:868:1: sparse: sparse: bad integer constant expression
   drivers/tty/serial/8250/serial_cs.c:868:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/surface/aggregator/core.c:892:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/aggregator/core.c:892:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/surface/aggregator/core.c:893:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/aggregator/core.c:893:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/surface/aggregator/core.c:894:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/aggregator/core.c:894:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/surface/aggregator/core.c:894:1: sparse: sparse: bad integer constant expression
>> drivers/platform/surface/aggregator/core.c:894:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/platform/x86/asus-wireless.c:196:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/asus-wireless.c:196:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/asus-wireless.c:197:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/asus-wireless.c:197:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/x86/asus-wireless.c:198:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/asus-wireless.c:198:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/asus-wireless.c:198:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/asus-wireless.c:198:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/x86/gpd-pocket-fan.c:31:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/gpd-pocket-fan.c:31:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/platform/x86/gpd-pocket-fan.c:32:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/gpd-pocket-fan.c:32:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/platform/x86/gpd-pocket-fan.c:36:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/gpd-pocket-fan.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/platform/x86/gpd-pocket-fan.c:37:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/gpd-pocket-fan.c:37:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/platform/x86/gpd-pocket-fan.c:41:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/gpd-pocket-fan.c:41:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/platform/x86/gpd-pocket-fan.c:42:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/gpd-pocket-fan.c:42:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/platform/x86/gpd-pocket-fan.c:222:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/gpd-pocket-fan.c:222:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/x86/gpd-pocket-fan.c:223:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/gpd-pocket-fan.c:223:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/gpd-pocket-fan.c:224:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/gpd-pocket-fan.c:224:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/gpd-pocket-fan.c:224:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/gpd-pocket-fan.c:224:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/platform/x86/asus-tf103c-dock.c:32:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/asus-tf103c-dock.c:32:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/platform/x86/asus-tf103c-dock.c:33:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/asus-tf103c-dock.c:33:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/platform/x86/asus-tf103c-dock.c:941:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/asus-tf103c-dock.c:941:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/x86/asus-tf103c-dock.c:942:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/asus-tf103c-dock.c:942:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/asus-tf103c-dock.c:943:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/asus-tf103c-dock.c:943:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/asus-tf103c-dock.c:943:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/asus-tf103c-dock.c:943:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/x86/pcengines-apuv2.c:334:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/pcengines-apuv2.c:334:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/x86/pcengines-apuv2.c:335:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/pcengines-apuv2.c:335:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/pcengines-apuv2.c:336:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/pcengines-apuv2.c:336:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/pcengines-apuv2.c:336:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/pcengines-apuv2.c:336:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/x86/pcengines-apuv2.c:338:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/pcengines-apuv2.c:338:1: sparse: sparse: static assertion failed: "MODULE_INFO(softdep, ...) contains embedded NUL byte"
--
   drivers/platform/x86/topstar-laptop.c:396:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/topstar-laptop.c:396:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/x86/topstar-laptop.c:397:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/topstar-laptop.c:397:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/x86/topstar-laptop.c:398:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/topstar-laptop.c:398:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/topstar-laptop.c:399:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/topstar-laptop.c:399:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/topstar-laptop.c:399:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/topstar-laptop.c:399:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/x86/sel3350-platform.c:246:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/sel3350-platform.c:246:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/x86/sel3350-platform.c:247:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/sel3350-platform.c:247:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/sel3350-platform.c:248:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/sel3350-platform.c:248:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/sel3350-platform.c:248:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/sel3350-platform.c:248:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/x86/sel3350-platform.c:249:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/sel3350-platform.c:249:1: sparse: sparse: static assertion failed: "MODULE_INFO(softdep, ...) contains embedded NUL byte"
--
>> drivers/platform/x86/amd/hsmp/hsmp.c:464:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/amd/hsmp/hsmp.c:464:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/amd/hsmp/hsmp.c:465:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/amd/hsmp/hsmp.c:465:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/platform/x86/amd/hsmp/hsmp.c:466:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/amd/hsmp/hsmp.c:466:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/amd/hsmp/hsmp.c:466:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/amd/hsmp/hsmp.c:466:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/x86/amd/hsmp/plat.c:347:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/amd/hsmp/plat.c:347:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   drivers/platform/x86/amd/hsmp/plat.c:348:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/amd/hsmp/plat.c:348:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/amd/hsmp/plat.c:349:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/amd/hsmp/plat.c:349:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/platform/x86/amd/hsmp/plat.c:350:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/amd/hsmp/plat.c:350:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/amd/hsmp/plat.c:350:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/amd/hsmp/plat.c:350:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/media/radio/radio-aztech.c:32:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-aztech.c:32:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/radio/radio-aztech.c:33:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-aztech.c:33:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/radio/radio-aztech.c:34:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-aztech.c:34:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/radio/radio-aztech.c:34:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-aztech.c:34:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/radio/radio-aztech.c:35:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-aztech.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/media/radio/radio-aztech.c:48:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-aztech.c:48:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-aztech.c:49:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-aztech.c:49:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/radio/radio-aztech.c:50:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-aztech.c:50:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-aztech.c:51:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-aztech.c:51:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
--
>> drivers/media/radio/radio-cadet.c:49:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-cadet.c:49:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/radio/radio-cadet.c:50:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-cadet.c:50:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/radio/radio-cadet.c:51:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-cadet.c:51:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/radio/radio-cadet.c:51:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-cadet.c:51:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/radio/radio-cadet.c:52:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-cadet.c:52:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/media/radio/radio-cadet.c:57:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-cadet.c:57:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-cadet.c:58:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-cadet.c:58:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/radio/radio-cadet.c:59:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-cadet.c:59:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
--
   drivers/media/radio/radio-gemtek.c:43:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:43:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:44:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:44:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:45:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-gemtek.c:45:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:45:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:45:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:46:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:46:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:67:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:67:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:68:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:68:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:70:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:70:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:71:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:71:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:73:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:73:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:74:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:74:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:76:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:76:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-gemtek.c:77:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-gemtek.c:77:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
--
   drivers/media/radio/radio-isa.c:25:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-isa.c:25:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/radio/radio-isa.c:26:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-isa.c:26:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/radio/radio-isa.c:27:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-isa.c:27:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/radio/radio-isa.c:27:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-isa.c:27:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/media/radio/radio-sf16fmi.c:35:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-sf16fmi.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/radio/radio-sf16fmi.c:36:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-sf16fmi.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/radio/radio-sf16fmi.c:37:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-sf16fmi.c:37:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/radio/radio-sf16fmi.c:37:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-sf16fmi.c:37:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/radio/radio-sf16fmi.c:38:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-sf16fmi.c:38:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/media/radio/radio-sf16fmi.c:43:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-sf16fmi.c:43:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-sf16fmi.c:44:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-sf16fmi.c:44:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/radio/radio-sf16fmi.c:45:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-sf16fmi.c:45:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
--
   drivers/media/radio/radio-typhoon.c:44:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-typhoon.c:44:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/radio/radio-typhoon.c:45:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-typhoon.c:45:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/radio/radio-typhoon.c:46:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-typhoon.c:46:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/radio/radio-typhoon.c:46:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-typhoon.c:46:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/radio/radio-typhoon.c:47:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-typhoon.c:47:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/media/radio/radio-typhoon.c:64:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-typhoon.c:64:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-typhoon.c:65:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-typhoon.c:65:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/radio/radio-typhoon.c:66:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-typhoon.c:66:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-typhoon.c:67:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-typhoon.c:67:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/radio/radio-typhoon.c:68:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-typhoon.c:68:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-typhoon.c:69:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-typhoon.c:69:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
--
>> drivers/media/radio/radio-zoltrix.c:54:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-zoltrix.c:54:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/radio/radio-zoltrix.c:55:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-zoltrix.c:55:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/media/radio/radio-zoltrix.c:56:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-zoltrix.c:56:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/media/radio/radio-zoltrix.c:56:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-zoltrix.c:56:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/radio/radio-zoltrix.c:57:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-zoltrix.c:57:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/media/radio/radio-zoltrix.c:69:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-zoltrix.c:69:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-zoltrix.c:70:1: sparse: sparse: bad integer constant expression
>> drivers/media/radio/radio-zoltrix.c:70:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/media/radio/radio-zoltrix.c:71:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-zoltrix.c:71:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/media/radio/radio-zoltrix.c:72:1: sparse: sparse: bad integer constant expression
   drivers/media/radio/radio-zoltrix.c:72:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
--
>> drivers/media/spi/gs1662.c:481:1: sparse: sparse: bad integer constant expression
>> drivers/media/spi/gs1662.c:481:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> drivers/media/spi/gs1662.c:481:1: sparse: sparse: bad integer constant expression
>> drivers/media/spi/gs1662.c:481:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/media/spi/gs1662.c:482:1: sparse: sparse: bad integer constant expression
>> drivers/media/spi/gs1662.c:482:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/media/spi/gs1662.c:483:1: sparse: sparse: bad integer constant expression
>> drivers/media/spi/gs1662.c:483:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
   drivers/vfio/mdev/mdev_core.c:272:1: sparse: sparse: bad integer constant expression
   drivers/vfio/mdev/mdev_core.c:272:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/vfio/mdev/mdev_core.c:273:1: sparse: sparse: bad integer constant expression
>> drivers/vfio/mdev/mdev_core.c:273:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/vfio/mdev/mdev_core.c:273:1: sparse: sparse: bad integer constant expression
   drivers/vfio/mdev/mdev_core.c:273:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/vfio/mdev/mdev_core.c:274:1: sparse: sparse: bad integer constant expression
   drivers/vfio/mdev/mdev_core.c:274:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/vfio/mdev/mdev_core.c:275:1: sparse: sparse: bad integer constant expression
   drivers/vfio/mdev/mdev_core.c:275:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
   drivers/platform/x86/dell/dell-pc.c:300:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-pc.c:300:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-pc.c:301:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-pc.c:301:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-pc.c:302:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/dell/dell-pc.c:302:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-pc.c:302:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-pc.c:302:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/platform/x86/dell/dell-smo8800.c:176:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-smo8800.c:176:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-smo8800.c:177:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/dell/dell-smo8800.c:177:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-smo8800.c:177:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-smo8800.c:177:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-smo8800.c:178:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-smo8800.c:178:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
--
   drivers/platform/x86/dell/dell-lis3lv02d.c:67:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-lis3lv02d.c:67:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-lis3lv02d.c:68:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-lis3lv02d.c:68:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-lis3lv02d.c:257:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-lis3lv02d.c:257:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-lis3lv02d.c:258:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-lis3lv02d.c:258:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-lis3lv02d.c:259:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/dell/dell-lis3lv02d.c:259:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/dell/dell-lis3lv02d.c:259:1: sparse: sparse: bad integer constant expression
   drivers/platform/x86/dell/dell-lis3lv02d.c:259:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/input/keyboard/adp5588-keys.c:871:1: sparse: sparse: bad integer constant expression
>> drivers/input/keyboard/adp5588-keys.c:871:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/keyboard/adp5588-keys.c:871:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/adp5588-keys.c:871:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/input/keyboard/adp5588-keys.c:872:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/adp5588-keys.c:872:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/input/keyboard/adp5588-keys.c:873:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/adp5588-keys.c:873:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
>> drivers/input/keyboard/applespi.c:97:1: sparse: sparse: bad integer constant expression
>> drivers/input/keyboard/applespi.c:97:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:98:1: sparse: sparse: bad integer constant expression
>> drivers/input/keyboard/applespi.c:98:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:101:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/applespi.c:101:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:102:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/applespi.c:102:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:105:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/applespi.c:105:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:106:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/applespi.c:106:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:109:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/applespi.c:109:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:111:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/applespi.c:111:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:1930:1: sparse: sparse: bad integer constant expression
>> drivers/input/keyboard/applespi.c:1930:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:1930:1: sparse: sparse: bad integer constant expression
>> drivers/input/keyboard/applespi.c:1930:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:1931:1: sparse: sparse: bad integer constant expression
>> drivers/input/keyboard/applespi.c:1931:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:1932:1: sparse: sparse: bad integer constant expression
>> drivers/input/keyboard/applespi.c:1932:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/input/keyboard/applespi.c:1933:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/applespi.c:1933:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
--
   drivers/input/misc/cma3000_d0x_i2c.c:111:1: sparse: sparse: bad integer constant expression
   drivers/input/misc/cma3000_d0x_i2c.c:111:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/misc/cma3000_d0x_i2c.c:112:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/cma3000_d0x_i2c.c:112:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/misc/cma3000_d0x_i2c.c:112:1: sparse: sparse: bad integer constant expression
   drivers/input/misc/cma3000_d0x_i2c.c:112:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/input/misc/cma3000_d0x_i2c.c:113:1: sparse: sparse: bad integer constant expression
   drivers/input/misc/cma3000_d0x_i2c.c:113:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
--
>> drivers/input/misc/pcspkr.c:18:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/pcspkr.c:18:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/input/misc/pcspkr.c:19:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/pcspkr.c:19:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/misc/pcspkr.c:20:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/pcspkr.c:20:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/misc/pcspkr.c:20:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/pcspkr.c:20:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/input/misc/pcspkr.c:21:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/pcspkr.c:21:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
--
>> drivers/input/misc/wistron_btns.c:34:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/wistron_btns.c:34:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/input/misc/wistron_btns.c:35:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/wistron_btns.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/misc/wistron_btns.c:36:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/wistron_btns.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/misc/wistron_btns.c:36:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/wistron_btns.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/input/misc/wistron_btns.c:39:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/wistron_btns.c:39:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/input/misc/wistron_btns.c:40:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/wistron_btns.c:40:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/input/misc/wistron_btns.c:43:1: sparse: sparse: bad integer constant expression
   drivers/input/misc/wistron_btns.c:43:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/input/misc/wistron_btns.c:44:1: sparse: sparse: bad integer constant expression
   drivers/input/misc/wistron_btns.c:44:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
--
>> drivers/platform/x86/intel/mrfld_pwrbtn.c:105:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/intel/mrfld_pwrbtn.c:105:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/intel/mrfld_pwrbtn.c:106:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/intel/mrfld_pwrbtn.c:106:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/intel/mrfld_pwrbtn.c:106:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/intel/mrfld_pwrbtn.c:106:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/x86/intel/atomisp2/led.c:114:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/intel/atomisp2/led.c:114:1: sparse: sparse: static assertion failed: "MODULE_INFO(softdep, ...) contains embedded NUL byte"
   drivers/platform/x86/intel/atomisp2/led.c:115:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/intel/atomisp2/led.c:115:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/x86/intel/atomisp2/led.c:116:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/intel/atomisp2/led.c:116:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/x86/intel/atomisp2/led.c:117:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/intel/atomisp2/led.c:117:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/x86/intel/atomisp2/led.c:117:1: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/intel/atomisp2/led.c:117:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/video/backlight/ams369fg06.c:561:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/ams369fg06.c:561:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/video/backlight/ams369fg06.c:562:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/ams369fg06.c:562:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/video/backlight/ams369fg06.c:563:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/ams369fg06.c:563:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/video/backlight/ams369fg06.c:563:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/ams369fg06.c:563:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/video/backlight/l4f00242t03.c:250:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/l4f00242t03.c:250:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/video/backlight/l4f00242t03.c:251:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/l4f00242t03.c:251:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/video/backlight/l4f00242t03.c:252:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/l4f00242t03.c:252:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/video/backlight/l4f00242t03.c:252:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/l4f00242t03.c:252:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/video/backlight/lms283gf05.c:189:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/lms283gf05.c:189:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/video/backlight/lms283gf05.c:190:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/lms283gf05.c:190:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/video/backlight/lms283gf05.c:191:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/lms283gf05.c:191:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/video/backlight/lms283gf05.c:191:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/lms283gf05.c:191:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/video/backlight/lms501kf03.c:418:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/lms501kf03.c:418:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/video/backlight/lms501kf03.c:419:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/lms501kf03.c:419:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/video/backlight/lms501kf03.c:420:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/lms501kf03.c:420:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/video/backlight/lms501kf03.c:420:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/lms501kf03.c:420:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/video/backlight/otm3225a.c:248:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/otm3225a.c:248:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/video/backlight/otm3225a.c:249:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/otm3225a.c:249:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/video/backlight/otm3225a.c:250:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/otm3225a.c:250:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   drivers/video/backlight/otm3225a.c:251:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/otm3225a.c:251:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/video/backlight/otm3225a.c:251:1: sparse: sparse: bad integer constant expression
   drivers/video/backlight/otm3225a.c:251:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/video/backlight/tdo24m.c:444:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/tdo24m.c:444:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/video/backlight/tdo24m.c:445:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/tdo24m.c:445:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/video/backlight/tdo24m.c:446:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/tdo24m.c:446:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/video/backlight/tdo24m.c:446:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/tdo24m.c:446:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/video/backlight/tdo24m.c:447:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/tdo24m.c:447:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
--
>> drivers/video/backlight/max8925_bl.c:193:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/max8925_bl.c:193:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/video/backlight/max8925_bl.c:194:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/max8925_bl.c:194:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/video/backlight/max8925_bl.c:195:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/max8925_bl.c:195:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/video/backlight/max8925_bl.c:195:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/max8925_bl.c:195:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/video/backlight/max8925_bl.c:196:1: sparse: sparse: bad integer constant expression
>> drivers/video/backlight/max8925_bl.c:196:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
--
>> drivers/iio/adc/intel_mrfld_adc.c:238:1: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/intel_mrfld_adc.c:238:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/intel_mrfld_adc.c:239:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/intel_mrfld_adc.c:239:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/intel_mrfld_adc.c:240:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/intel_mrfld_adc.c:240:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/intel_mrfld_adc.c:241:1: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/intel_mrfld_adc.c:241:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/adc/intel_mrfld_adc.c:242:1: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/intel_mrfld_adc.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/adc/intel_mrfld_adc.c:242:1: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/intel_mrfld_adc.c:242:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/iio/adc/ltc2496.c: note: in included file:
   drivers/iio/adc/ltc2497.h:26:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ltc2497.h:26:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
   drivers/iio/adc/ltc2496.c:111:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ltc2496.c:111:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/ltc2496.c:112:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ltc2496.c:112:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/adc/ltc2496.c:113:1: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/ltc2496.c:113:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/adc/ltc2496.c:113:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/ltc2496.c:113:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/iio/adc/ti-ads124s08.c:374:1: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/ti-ads124s08.c:374:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/ti-ads124s08.c:375:1: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/ti-ads124s08.c:375:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/adc/ti-ads124s08.c:376:1: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/ti-ads124s08.c:376:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/adc/ti-ads124s08.c:376:1: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/ti-ads124s08.c:376:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/watchdog/sbc8360.c:197:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/sbc8360.c:197:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/watchdog/sbc8360.c:198:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/sbc8360.c:198:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/watchdog/sbc8360.c:199:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/sbc8360.c:199:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/watchdog/sbc8360.c:200:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/sbc8360.c:200:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/watchdog/sbc8360.c:398:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/sbc8360.c:398:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/watchdog/sbc8360.c:399:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/sbc8360.c:399:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/watchdog/sbc8360.c:400:1: sparse: sparse: bad integer constant expression
>> drivers/watchdog/sbc8360.c:400:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/watchdog/sbc8360.c:400:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/sbc8360.c:400:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/watchdog/sbc8360.c:401:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/sbc8360.c:401:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
--
>> drivers/watchdog/sbc7240_wdt.c:35:1: sparse: sparse: bad integer constant expression
>> drivers/watchdog/sbc7240_wdt.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/watchdog/sbc7240_wdt.c:36:1: sparse: sparse: bad integer constant expression
>> drivers/watchdog/sbc7240_wdt.c:36:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/watchdog/sbc7240_wdt.c:41:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/sbc7240_wdt.c:41:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/watchdog/sbc7240_wdt.c:42:1: sparse: sparse: bad integer constant expression
   drivers/watchdog/sbc7240_wdt.c:42:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/watchdog/sbc7240_wdt.c:298:1: sparse: sparse: bad integer constant expression
>> drivers/watchdog/sbc7240_wdt.c:298:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/watchdog/sbc7240_wdt.c:299:1: sparse: sparse: bad integer constant expression
>> drivers/watchdog/sbc7240_wdt.c:299:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/watchdog/sbc7240_wdt.c:301:1: sparse: sparse: bad integer constant expression
>> drivers/watchdog/sbc7240_wdt.c:301:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/watchdog/sbc7240_wdt.c:301:1: sparse: sparse: bad integer constant expression
>> drivers/watchdog/sbc7240_wdt.c:301:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/iio/dac/cio-dac.c:34:1: sparse: sparse: bad integer constant expression
>> drivers/iio/dac/cio-dac.c:34:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/iio/dac/cio-dac.c:35:1: sparse: sparse: bad integer constant expression
>> drivers/iio/dac/cio-dac.c:35:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/iio/dac/cio-dac.c:159:1: sparse: sparse: bad integer constant expression
>> drivers/iio/dac/cio-dac.c:159:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/dac/cio-dac.c:160:1: sparse: sparse: bad integer constant expression
>> drivers/iio/dac/cio-dac.c:160:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/dac/cio-dac.c:161:1: sparse: sparse: bad integer constant expression
>> drivers/iio/dac/cio-dac.c:161:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/dac/cio-dac.c:161:1: sparse: sparse: bad integer constant expression
>> drivers/iio/dac/cio-dac.c:161:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/iio/magnetometer/st_magn_spi.c:111:1: sparse: sparse: bad integer constant expression
>> drivers/iio/magnetometer/st_magn_spi.c:111:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/magnetometer/st_magn_spi.c:112:1: sparse: sparse: bad integer constant expression
>> drivers/iio/magnetometer/st_magn_spi.c:112:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/magnetometer/st_magn_spi.c:113:1: sparse: sparse: bad integer constant expression
>> drivers/iio/magnetometer/st_magn_spi.c:113:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/magnetometer/st_magn_spi.c:113:1: sparse: sparse: bad integer constant expression
>> drivers/iio/magnetometer/st_magn_spi.c:113:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/magnetometer/st_magn_spi.c:114:1: sparse: sparse: bad integer constant expression
>> drivers/iio/magnetometer/st_magn_spi.c:114:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
--
   drivers/iio/potentiometer/max5481.c:192:1: sparse: sparse: bad integer constant expression
   drivers/iio/potentiometer/max5481.c:192:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/potentiometer/max5481.c:193:1: sparse: sparse: bad integer constant expression
   drivers/iio/potentiometer/max5481.c:193:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/potentiometer/max5481.c:194:1: sparse: sparse: bad integer constant expression
>> drivers/iio/potentiometer/max5481.c:194:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/potentiometer/max5481.c:194:1: sparse: sparse: bad integer constant expression
   drivers/iio/potentiometer/max5481.c:194:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +21 samples/damon/mtier.c

775c96714dca287 SeongJae Park 2025-07-05  19  
82a08bde3cf7bbb SeongJae Park 2025-04-20  20  static unsigned long node0_start_addr __read_mostly;
82a08bde3cf7bbb SeongJae Park 2025-04-20 @21  module_param(node0_start_addr, ulong, 0600);
82a08bde3cf7bbb SeongJae Park 2025-04-20  22  
82a08bde3cf7bbb SeongJae Park 2025-04-20  23  static unsigned long node0_end_addr __read_mostly;
82a08bde3cf7bbb SeongJae Park 2025-04-20  24  module_param(node0_end_addr, ulong, 0600);
82a08bde3cf7bbb SeongJae Park 2025-04-20  25  
82a08bde3cf7bbb SeongJae Park 2025-04-20  26  static unsigned long node1_start_addr __read_mostly;
82a08bde3cf7bbb SeongJae Park 2025-04-20  27  module_param(node1_start_addr, ulong, 0600);
82a08bde3cf7bbb SeongJae Park 2025-04-20  28  
82a08bde3cf7bbb SeongJae Park 2025-04-20  29  static unsigned long node1_end_addr __read_mostly;
82a08bde3cf7bbb SeongJae Park 2025-04-20  30  module_param(node1_end_addr, ulong, 0600);
82a08bde3cf7bbb SeongJae Park 2025-04-20  31  
c5e67d40a102345 Yunjeong Mun  2025-06-27  32  static unsigned long node0_mem_used_bp __read_mostly = 9970;
c5e67d40a102345 Yunjeong Mun  2025-06-27  33  module_param(node0_mem_used_bp, ulong, 0600);
c5e67d40a102345 Yunjeong Mun  2025-06-27  34  
c5e67d40a102345 Yunjeong Mun  2025-06-27  35  static unsigned long node0_mem_free_bp __read_mostly = 50;
c5e67d40a102345 Yunjeong Mun  2025-06-27  36  module_param(node0_mem_free_bp, ulong, 0600);
c5e67d40a102345 Yunjeong Mun  2025-06-27  37  
82a08bde3cf7bbb SeongJae Park 2025-04-20  38  static int damon_sample_mtier_enable_store(
82a08bde3cf7bbb SeongJae Park 2025-04-20  39  		const char *val, const struct kernel_param *kp);
82a08bde3cf7bbb SeongJae Park 2025-04-20  40  
793020545cea0c9 Honggyu Kim   2025-07-07  41  static const struct kernel_param_ops enabled_param_ops = {
82a08bde3cf7bbb SeongJae Park 2025-04-20  42  	.set = damon_sample_mtier_enable_store,
82a08bde3cf7bbb SeongJae Park 2025-04-20  43  	.get = param_get_bool,
82a08bde3cf7bbb SeongJae Park 2025-04-20  44  };
82a08bde3cf7bbb SeongJae Park 2025-04-20  45  
793020545cea0c9 Honggyu Kim   2025-07-07  46  static bool enabled __read_mostly;
793020545cea0c9 Honggyu Kim   2025-07-07  47  module_param_cb(enabled, &enabled_param_ops, &enabled, 0600);
793020545cea0c9 Honggyu Kim   2025-07-07 @48  MODULE_PARM_DESC(enabled, "Enable or disable DAMON_SAMPLE_MTIER");
82a08bde3cf7bbb SeongJae Park 2025-04-20  49  

:::::: The code at line 21 was first introduced by commit
:::::: 82a08bde3cf7bbbe90de57baa181bebf676582c7 samples/damon: implement a DAMON module for memory tiering

:::::: TO: SeongJae Park <sj@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
