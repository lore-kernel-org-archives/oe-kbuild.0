Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12CD335555
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 09:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764925908; cv=none; b=E/PzJk1v4xtrcKodbZ/n2mM/ALqR8qvNxckjFApbWk7bt+H9SLLC4a0/E7djTQhjelFFQB4/3esRmizk+R+aulW3CXE2+NxIrhIvzuq0qqP8dG9rMDnjkrZOosPFF5hKYU5f3tvkX+CyFtU2xXEkvZ5n/Gv+pv18xXbcj4ml2FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764925908; c=relaxed/simple;
	bh=RjOGlnHWnchYoPq28+Ejo4YxamVbqA30RKMZwvxHGeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6gOLir9CSJrnf2JXgKUJrXrbsF+wRNrpLTr1EHpxc6016lmkr46UnU2FsDI3+EC6+nqiRDLDPVEZ89x85dd/PhHrWW4W/KEAUW/u46OXgZx3aaZdGeEcOEzq6BIzSo4rimI2JkRfWOyJkFjIkXRIhF2+Slp5lxrsM6cBKGAk+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTEaAs7u; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTEaAs7u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764925902; x=1796461902;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RjOGlnHWnchYoPq28+Ejo4YxamVbqA30RKMZwvxHGeo=;
  b=TTEaAs7utWptrF7Lh5AEdbndOWnPTmG89+GsNrkpdGQ6zpV5wG50WOOu
   et9aodW0EwycFFiC0LwQFyhLnby1e86ckN1XCOWIJW3rjk64IQThB5K8V
   vzbD9ldXj6NxMTnKKGYDCLI3ycqFqhu2ver06wFGMeR3rP8t/qaGWbu/E
   e3guYzxCdMzFA/wncubcZdsnIybVuCUTVdquzDQYU+iViEvAsNmep+7Rc
   yTI+XR29n2ahe/7yzebCrQPZLL5bFLZA2erjrKXzrSMmnGvb4LyX7G36a
   HubwW+e8WbA65DAE651/TeHpAThrfTPQry9kfnETvBL6anGkrT4G+HI6Y
   Q==;
X-CSE-ConnectionGUID: OFckz43jSme6BKxWCnWKHA==
X-CSE-MsgGUID: ua3W5x20SH+3JgW/shxxSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66998925"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="66998925"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 01:11:38 -0800
X-CSE-ConnectionGUID: zq1BXnoCTNGGDLgroYWHgA==
X-CSE-MsgGUID: HyM9yeGYSuGDgyHkkz4ayw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="195148983"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Dec 2025 01:11:36 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRRqg-00000000EoP-13s8;
	Fri, 05 Dec 2025 09:11:34 +0000
Date: Fri, 5 Dec 2025 17:11:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 5324/13567] samples/tsm-mr/tsm_mr_sample.c:130:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202512051716.DB363M9w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: samples/tsm-mr/tsm_mr_sample.c:130:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kees Cook <kees@kernel.org>
CC: Daniel Gomez <da.gomez@samsung.com>
CC: Aaron Tomlin <atomlin@atomlin.com>
CC: Petr Pavlu <petr.pavlu@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6987d58a9cbc5bd57c983baa514474a86c945d56
commit: ae83f3b72621bd3187eb7956c7c2993a97d4b187 [5324/13567] module: Add compile-time check for embedded NUL characters
:::::: branch date: 4 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-121-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051716.DB363M9w-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051716.DB363M9w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512051716.DB363M9w-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> samples/tsm-mr/tsm_mr_sample.c:130:1: sparse: sparse: bad integer constant expression
>> samples/tsm-mr/tsm_mr_sample.c:130:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> samples/tsm-mr/tsm_mr_sample.c:130:1: sparse: sparse: bad integer constant expression
>> samples/tsm-mr/tsm_mr_sample.c:130:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   samples/tsm-mr/tsm_mr_sample.c:131:1: sparse: sparse: bad integer constant expression
>> samples/tsm-mr/tsm_mr_sample.c:131:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
   samples/vfio-mdev/mdpy-fb.c:232:1: sparse: sparse: bad integer constant expression
   samples/vfio-mdev/mdpy-fb.c:232:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   samples/vfio-mdev/mdpy-fb.c:233:1: sparse: sparse: bad integer constant expression
>> samples/vfio-mdev/mdpy-fb.c:233:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   samples/vfio-mdev/mdpy-fb.c:233:1: sparse: sparse: bad integer constant expression
   samples/vfio-mdev/mdpy-fb.c:233:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   samples/vfio-mdev/mtty.c:2058:1: sparse: sparse: bad integer constant expression
>> samples/vfio-mdev/mtty.c:2058:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   samples/vfio-mdev/mtty.c:2058:1: sparse: sparse: bad integer constant expression
   samples/vfio-mdev/mtty.c:2058:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   samples/vfio-mdev/mtty.c:2059:1: sparse: sparse: bad integer constant expression
   samples/vfio-mdev/mtty.c:2059:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   samples/vfio-mdev/mtty.c:2060:1: sparse: sparse: bad integer constant expression
   samples/vfio-mdev/mtty.c:2060:1: sparse: sparse: static assertion failed: "MODULE_INFO(version, ...) contains embedded NUL byte"
   samples/vfio-mdev/mtty.c:2061:1: sparse: sparse: bad integer constant expression
   samples/vfio-mdev/mtty.c:2061:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
--
>> drivers/acpi/acpi_tad.c:30:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/acpi_tad.c:30:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/acpi/acpi_tad.c:31:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/acpi_tad.c:31:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/acpi/acpi_tad.c:31:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/acpi_tad.c:31:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/acpi/acpi_tad.c:32:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/acpi_tad.c:32:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
--
>> drivers/acpi/pfr_update.c:605:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/pfr_update.c:605:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/acpi/pfr_update.c:606:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/pfr_update.c:606:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/acpi/pfr_update.c:606:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/pfr_update.c:606:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/acpi/pfr_telemetry.c:429:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/pfr_telemetry.c:429:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/acpi/pfr_telemetry.c:430:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/pfr_telemetry.c:430:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/acpi/pfr_telemetry.c:430:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/pfr_telemetry.c:430:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/acpi/acpi_pad.c:492:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/acpi_pad.c:492:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/acpi/acpi_pad.c:493:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/acpi_pad.c:493:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/acpi/acpi_pad.c:494:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/acpi_pad.c:494:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/acpi/acpi_pad.c:494:1: sparse: sparse: bad integer constant expression
>> drivers/acpi/acpi_pad.c:494:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/cpufreq/p4-clockmod.c:267:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/p4-clockmod.c:267:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/cpufreq/p4-clockmod.c:268:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/p4-clockmod.c:268:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/cpufreq/p4-clockmod.c:269:1: sparse: sparse: bad integer constant expression
>> drivers/cpufreq/p4-clockmod.c:269:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/cpufreq/p4-clockmod.c:269:1: sparse: sparse: bad integer constant expression
   drivers/cpufreq/p4-clockmod.c:269:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/hwmon/gpd-fan.c:27:1: sparse: sparse: bad integer constant expression
>> drivers/hwmon/gpd-fan.c:27:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/hwmon/gpd-fan.c:713:1: sparse: sparse: bad integer constant expression
>> drivers/hwmon/gpd-fan.c:713:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/hwmon/gpd-fan.c:713:1: sparse: sparse: bad integer constant expression
>> drivers/hwmon/gpd-fan.c:713:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/hwmon/gpd-fan.c:714:1: sparse: sparse: bad integer constant expression
>> drivers/hwmon/gpd-fan.c:714:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/hwmon/gpd-fan.c:715:1: sparse: sparse: bad integer constant expression
>> drivers/hwmon/gpd-fan.c:715:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
>> drivers/char/tpm/tpm_svsm.c:119:1: sparse: sparse: bad integer constant expression
>> drivers/char/tpm/tpm_svsm.c:119:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_svsm.c:120:1: sparse: sparse: bad integer constant expression
>> drivers/char/tpm/tpm_svsm.c:120:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_svsm.c:120:1: sparse: sparse: bad integer constant expression
>> drivers/char/tpm/tpm_svsm.c:120:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/char/tpm/tpm_svsm.c:121:1: sparse: sparse: bad integer constant expression
>> drivers/char/tpm/tpm_svsm.c:121:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
--
   drivers/power/supply/max8925_power.c:574:1: sparse: sparse: bad integer constant expression
>> drivers/power/supply/max8925_power.c:574:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/power/supply/max8925_power.c:574:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/max8925_power.c:574:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/power/supply/max8925_power.c:575:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/max8925_power.c:575:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/power/supply/max8925_power.c:576:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/max8925_power.c:576:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
--
   drivers/power/supply/mt6370-charger.c:941:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/mt6370-charger.c:941:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/power/supply/mt6370-charger.c:942:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/mt6370-charger.c:942:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/power/supply/mt6370-charger.c:943:1: sparse: sparse: bad integer constant expression
>> drivers/power/supply/mt6370-charger.c:943:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/power/supply/mt6370-charger.c:943:1: sparse: sparse: bad integer constant expression
   drivers/power/supply/mt6370-charger.c:943:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/power/supply/wilco-charger.c:189:1: sparse: sparse: bad integer constant expression
>> drivers/power/supply/wilco-charger.c:189:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   drivers/power/supply/wilco-charger.c:190:1: sparse: sparse: bad integer constant expression
>> drivers/power/supply/wilco-charger.c:190:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/power/supply/wilco-charger.c:191:1: sparse: sparse: bad integer constant expression
>> drivers/power/supply/wilco-charger.c:191:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/power/supply/wilco-charger.c:191:1: sparse: sparse: bad integer constant expression
>> drivers/power/supply/wilco-charger.c:191:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/power/supply/wilco-charger.c:192:1: sparse: sparse: bad integer constant expression
>> drivers/power/supply/wilco-charger.c:192:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
   drivers/mtd/devices/sst25l.c:418:1: sparse: sparse: bad integer constant expression
   drivers/mtd/devices/sst25l.c:418:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mtd/devices/sst25l.c:419:1: sparse: sparse: bad integer constant expression
   drivers/mtd/devices/sst25l.c:419:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mtd/devices/sst25l.c:421:1: sparse: sparse: bad integer constant expression
>> drivers/mtd/devices/sst25l.c:421:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/mtd/devices/sst25l.c:421:1: sparse: sparse: bad integer constant expression
   drivers/mtd/devices/sst25l.c:421:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/input/keyboard/max7360-keypad.c:306:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/max7360-keypad.c:306:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/keyboard/max7360-keypad.c:307:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/max7360-keypad.c:307:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/input/keyboard/max7360-keypad.c:308:1: sparse: sparse: bad integer constant expression
>> drivers/input/keyboard/max7360-keypad.c:308:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/keyboard/max7360-keypad.c:308:1: sparse: sparse: bad integer constant expression
   drivers/input/keyboard/max7360-keypad.c:308:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/platform/chrome/chromeos_laptop.c:956:1: sparse: sparse: bad integer constant expression
   drivers/platform/chrome/chromeos_laptop.c:956:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/chrome/chromeos_laptop.c:957:1: sparse: sparse: bad integer constant expression
   drivers/platform/chrome/chromeos_laptop.c:957:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/chrome/chromeos_laptop.c:958:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/chromeos_laptop.c:958:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/chrome/chromeos_laptop.c:958:1: sparse: sparse: bad integer constant expression
   drivers/platform/chrome/chromeos_laptop.c:958:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/chrome/chromeos_tbmc.c:120:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/chromeos_tbmc.c:120:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> drivers/platform/chrome/chromeos_tbmc.c:120:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/chromeos_tbmc.c:120:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/chrome/chromeos_tbmc.c:121:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/chromeos_tbmc.c:121:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
>> drivers/platform/chrome/cros_ec_lpc.c:912:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/cros_ec_lpc.c:912:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> drivers/platform/chrome/cros_ec_lpc.c:912:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/cros_ec_lpc.c:912:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/chrome/cros_ec_lpc.c:913:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/cros_ec_lpc.c:913:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
   drivers/platform/chrome/cros_ec_lightbar.c:617:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/cros_ec_lightbar.c:617:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/chrome/cros_ec_lightbar.c:617:1: sparse: sparse: bad integer constant expression
   drivers/platform/chrome/cros_ec_lightbar.c:617:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/chrome/cros_ec_lightbar.c:618:1: sparse: sparse: bad integer constant expression
   drivers/platform/chrome/cros_ec_lightbar.c:618:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
   drivers/platform/chrome/cros_ec_debugfs.c:30:1: sparse: sparse: bad integer constant expression
   drivers/platform/chrome/cros_ec_debugfs.c:30:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/platform/chrome/cros_ec_debugfs.c:31:1: sparse: sparse: bad integer constant expression
   drivers/platform/chrome/cros_ec_debugfs.c:31:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
   drivers/platform/chrome/cros_ec_debugfs.c:579:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/cros_ec_debugfs.c:579:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/chrome/cros_ec_debugfs.c:579:1: sparse: sparse: bad integer constant expression
   drivers/platform/chrome/cros_ec_debugfs.c:579:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/chrome/cros_ec_debugfs.c:580:1: sparse: sparse: bad integer constant expression
   drivers/platform/chrome/cros_ec_debugfs.c:580:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
>> drivers/input/misc/adxl34x-spi.c:101:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/adxl34x-spi.c:101:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/input/misc/adxl34x-spi.c:102:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/adxl34x-spi.c:102:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/misc/adxl34x-spi.c:103:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/adxl34x-spi.c:103:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/misc/adxl34x-spi.c:103:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/adxl34x-spi.c:103:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/input/misc/apanel.c:299:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/apanel.c:299:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/input/misc/apanel.c:300:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/apanel.c:300:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/input/misc/apanel.c:301:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/apanel.c:301:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/input/misc/apanel.c:301:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/apanel.c:301:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/input/misc/apanel.c:303:1: sparse: sparse: bad integer constant expression
>> drivers/input/misc/apanel.c:303:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
   drivers/input/misc/apanel.c:304:1: sparse: sparse: bad integer constant expression
   drivers/input/misc/apanel.c:304:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
--
>> drivers/pps/generators/pps_gen_tio.c:266:1: sparse: sparse: bad integer constant expression
>> drivers/pps/generators/pps_gen_tio.c:266:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pps/generators/pps_gen_tio.c:267:1: sparse: sparse: bad integer constant expression
   drivers/pps/generators/pps_gen_tio.c:267:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pps/generators/pps_gen_tio.c:268:1: sparse: sparse: bad integer constant expression
   drivers/pps/generators/pps_gen_tio.c:268:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pps/generators/pps_gen_tio.c:269:1: sparse: sparse: bad integer constant expression
   drivers/pps/generators/pps_gen_tio.c:269:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pps/generators/pps_gen_tio.c:270:1: sparse: sparse: bad integer constant expression
   drivers/pps/generators/pps_gen_tio.c:270:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/pps/generators/pps_gen_tio.c:271:1: sparse: sparse: bad integer constant expression
>> drivers/pps/generators/pps_gen_tio.c:271:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/pps/generators/pps_gen_tio.c:272:1: sparse: sparse: bad integer constant expression
>> drivers/pps/generators/pps_gen_tio.c:272:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/pps/generators/pps_gen_tio.c:272:1: sparse: sparse: bad integer constant expression
>> drivers/pps/generators/pps_gen_tio.c:272:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/video/fbdev/hgafb.c:673:1: sparse: sparse: bad integer constant expression
   drivers/video/fbdev/hgafb.c:673:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/video/fbdev/hgafb.c:674:1: sparse: sparse: bad integer constant expression
   drivers/video/fbdev/hgafb.c:674:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/video/fbdev/hgafb.c:675:1: sparse: sparse: bad integer constant expression
>> drivers/video/fbdev/hgafb.c:675:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/video/fbdev/hgafb.c:675:1: sparse: sparse: bad integer constant expression
   drivers/video/fbdev/hgafb.c:675:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/video/fbdev/hgafb.c:677:1: sparse: sparse: bad integer constant expression
   drivers/video/fbdev/hgafb.c:677:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/video/fbdev/hgafb.c:678:1: sparse: sparse: bad integer constant expression
   drivers/video/fbdev/hgafb.c:678:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"
--
>> drivers/iio/accel/cros_ec_accel_legacy.c:249:1: sparse: sparse: bad integer constant expression
>> drivers/iio/accel/cros_ec_accel_legacy.c:249:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/accel/cros_ec_accel_legacy.c:250:1: sparse: sparse: bad integer constant expression
>> drivers/iio/accel/cros_ec_accel_legacy.c:250:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/accel/cros_ec_accel_legacy.c:251:1: sparse: sparse: bad integer constant expression
>> drivers/iio/accel/cros_ec_accel_legacy.c:251:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/accel/cros_ec_accel_legacy.c:251:1: sparse: sparse: bad integer constant expression
>> drivers/iio/accel/cros_ec_accel_legacy.c:251:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/accel/cros_ec_accel_legacy.c:252:1: sparse: sparse: bad integer constant expression
>> drivers/iio/accel/cros_ec_accel_legacy.c:252:1: sparse: sparse: static assertion failed: "MODULE_INFO(alias, ...) contains embedded NUL byte"
--
   drivers/iio/accel/st_accel_core.c:1549:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/st_accel_core.c:1549:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/accel/st_accel_core.c:1550:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/st_accel_core.c:1550:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/accel/st_accel_core.c:1551:1: sparse: sparse: bad integer constant expression
>> drivers/iio/accel/st_accel_core.c:1551:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/accel/st_accel_core.c:1551:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/st_accel_core.c:1551:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/accel/st_accel_core.c:1552:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/st_accel_core.c:1552:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
--
   drivers/iio/accel/st_accel_spi.c:184:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/st_accel_spi.c:184:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/accel/st_accel_spi.c:185:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/st_accel_spi.c:185:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/accel/st_accel_spi.c:186:1: sparse: sparse: bad integer constant expression
>> drivers/iio/accel/st_accel_spi.c:186:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/accel/st_accel_spi.c:186:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/st_accel_spi.c:186:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/accel/st_accel_spi.c:187:1: sparse: sparse: bad integer constant expression
   drivers/iio/accel/st_accel_spi.c:187:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
--
   drivers/iio/adc/max11100.c:161:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/max11100.c:161:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/adc/max11100.c:162:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/max11100.c:162:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/adc/max11100.c:163:1: sparse: sparse: bad integer constant expression
>> drivers/iio/adc/max11100.c:163:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/adc/max11100.c:163:1: sparse: sparse: bad integer constant expression
   drivers/iio/adc/max11100.c:163:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/iio/gyro/st_gyro_spi.c:124:1: sparse: sparse: bad integer constant expression
   drivers/iio/gyro/st_gyro_spi.c:124:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/gyro/st_gyro_spi.c:125:1: sparse: sparse: bad integer constant expression
   drivers/iio/gyro/st_gyro_spi.c:125:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/gyro/st_gyro_spi.c:126:1: sparse: sparse: bad integer constant expression
>> drivers/iio/gyro/st_gyro_spi.c:126:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/gyro/st_gyro_spi.c:126:1: sparse: sparse: bad integer constant expression
   drivers/iio/gyro/st_gyro_spi.c:126:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/gyro/st_gyro_spi.c:127:1: sparse: sparse: bad integer constant expression
   drivers/iio/gyro/st_gyro_spi.c:127:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
--
   drivers/iio/light/acpi-als.c:243:1: sparse: sparse: bad integer constant expression
   drivers/iio/light/acpi-als.c:243:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/light/acpi-als.c:244:1: sparse: sparse: bad integer constant expression
   drivers/iio/light/acpi-als.c:244:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/light/acpi-als.c:245:1: sparse: sparse: bad integer constant expression
   drivers/iio/light/acpi-als.c:245:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/light/acpi-als.c:246:1: sparse: sparse: bad integer constant expression
   drivers/iio/light/acpi-als.c:246:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/light/acpi-als.c:247:1: sparse: sparse: bad integer constant expression
>> drivers/iio/light/acpi-als.c:247:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/light/acpi-als.c:247:1: sparse: sparse: bad integer constant expression
   drivers/iio/light/acpi-als.c:247:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c:93:1: sparse: sparse: bad integer constant expression
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c:93:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c:94:1: sparse: sparse: bad integer constant expression
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c:94:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c:95:1: sparse: sparse: bad integer constant expression
>> drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c:95:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c:95:1: sparse: sparse: bad integer constant expression
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c:95:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c:96:1: sparse: sparse: bad integer constant expression
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_core.c:96:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
--
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c:83:1: sparse: sparse: bad integer constant expression
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c:83:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c:84:1: sparse: sparse: bad integer constant expression
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c:84:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c:85:1: sparse: sparse: bad integer constant expression
>> drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c:85:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c:85:1: sparse: sparse: bad integer constant expression
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c:85:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c:86:1: sparse: sparse: bad integer constant expression
   drivers/iio/imu/st_lsm9ds0/st_lsm9ds0_spi.c:86:1: sparse: sparse: static assertion failed: "MODULE_INFO(import_ns, ...) contains embedded NUL byte"
--
>> drivers/gpu/drm/sysfb/efidrm.c:388:1: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/sysfb/efidrm.c:388:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/sysfb/efidrm.c:389:1: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/sysfb/efidrm.c:389:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/sysfb/efidrm.c:389:1: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/sysfb/efidrm.c:389:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/gpu/drm/sysfb/vesadrm.c:649:1: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/sysfb/vesadrm.c:649:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/gpu/drm/sysfb/vesadrm.c:650:1: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/sysfb/vesadrm.c:650:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/gpu/drm/sysfb/vesadrm.c:650:1: sparse: sparse: bad integer constant expression
>> drivers/gpu/drm/sysfb/vesadrm.c:650:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
   drivers/iio/trigger/iio-trig-hrtimer.c:197:1: sparse: sparse: bad integer constant expression
   drivers/iio/trigger/iio-trig-hrtimer.c:197:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/trigger/iio-trig-hrtimer.c:198:1: sparse: sparse: bad integer constant expression
   drivers/iio/trigger/iio-trig-hrtimer.c:198:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/iio/trigger/iio-trig-hrtimer.c:199:1: sparse: sparse: bad integer constant expression
   drivers/iio/trigger/iio-trig-hrtimer.c:199:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/iio/trigger/iio-trig-hrtimer.c:200:1: sparse: sparse: bad integer constant expression
>> drivers/iio/trigger/iio-trig-hrtimer.c:200:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/iio/trigger/iio-trig-hrtimer.c:200:1: sparse: sparse: bad integer constant expression
   drivers/iio/trigger/iio-trig-hrtimer.c:200:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/chrome/wilco_ec/core.c:172:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/core.c:172:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/core.c:173:1: sparse: sparse: bad integer constant expression
   drivers/platform/chrome/wilco_ec/core.c:173:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/core.c:174:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/core.c:174:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/core.c:174:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/core.c:174:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/core.c:175:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/core.c:175:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
>> drivers/platform/chrome/wilco_ec/debugfs.c:285:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/debugfs.c:285:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/debugfs.c:286:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/debugfs.c:286:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/debugfs.c:286:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/debugfs.c:286:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/debugfs.c:287:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/debugfs.c:287:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
--
>> drivers/platform/chrome/wilco_ec/event.c:103:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/event.c:103:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/event.c:573:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/event.c:573:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/event.c:574:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/event.c:574:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/event.c:575:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/event.c:575:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/event.c:575:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/event.c:575:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> drivers/platform/chrome/wilco_ec/telemetry.c:473:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/telemetry.c:473:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/telemetry.c:474:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/telemetry.c:474:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/telemetry.c:475:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/telemetry.c:475:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/platform/chrome/wilco_ec/telemetry.c:475:1: sparse: sparse: bad integer constant expression
>> drivers/platform/chrome/wilco_ec/telemetry.c:475:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
--
>> lib/crypto/aesgcm.c:197:1: sparse: sparse: bad integer constant expression
>> lib/crypto/aesgcm.c:197:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/crypto/aesgcm.c:198:1: sparse: sparse: bad integer constant expression
>> lib/crypto/aesgcm.c:198:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/crypto/aesgcm.c:199:1: sparse: sparse: bad integer constant expression
>> lib/crypto/aesgcm.c:199:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/crypto/aesgcm.c:199:1: sparse: sparse: bad integer constant expression
>> lib/crypto/aesgcm.c:199:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +130 samples/tsm-mr/tsm_mr_sample.c

f6953f1f9ec4ad Cedric Xing 2025-05-06  129  
f6953f1f9ec4ad Cedric Xing 2025-05-06 @130  MODULE_LICENSE("GPL");
f6953f1f9ec4ad Cedric Xing 2025-05-06 @131  MODULE_DESCRIPTION("Sample module using tsm-mr to expose emulated MRs");

:::::: The code at line 130 was first introduced by commit
:::::: f6953f1f9ec4ad68651d7c677f0c065cb4c1edf7 tsm-mr: Add tsm-mr sample code

:::::: TO: Cedric Xing <cedric.xing@intel.com>
:::::: CC: Dan Williams <dan.j.williams@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
