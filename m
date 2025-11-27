Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785342DA760
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 16:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764261859; cv=none; b=W0/udkYFeyC4vI+6bSOkipKxMMDWeykXeh65jZIbvsXQ2oj8WY0znoMmBFPAIoxPub3nNKGraZdj0G6zdDt+7Lf3tkvIWFGttQuuzDmrZ1w4lRQ6vNm42jAEgQfFwhgbg7r9cM+iuFG/dNwrQM41BIQdB8ZGAY20IorWLrMeTm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764261859; c=relaxed/simple;
	bh=5ilDT8eFP2c+FcnpGcGz5PHrEfr/jspIP/dwGnOmvL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DuxD/ws5bx4jYxjGD4MPi+HYrZKfzEwbtObeybzf0d31H7FMIi+9jzLjLsDRkwQAjjRIewdYAIbr02k74JyuO/F+HO6E/yjvEnG+hNE1wH27D4SrqtG30gtcGjEtlAOeQJVl92k8SNdcpfQE3eIUloFnhm0oDzjdzMR5Ze5Ra00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TL/Vrat8; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TL/Vrat8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764261857; x=1795797857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5ilDT8eFP2c+FcnpGcGz5PHrEfr/jspIP/dwGnOmvL4=;
  b=TL/Vrat8YQKlpSXUcI4fJNW3yGvHJ1sVsIPkzDJeiEwr52Iu+PZjsioB
   lxaTcnSVlNfCygvpe4k+mqFBXAPAJu2H30qK+w6ut2MnbQ1SMm7mO2BGc
   3cE4OCDstdU0feI4bSk9DYJqMa7xhGMnSVAAhsL22gmc8MMRx2+R38ixe
   3HTA8aqrUo93wVDjXorx/JGsBmM/QA7mMIkg3XdLtG+n43UELyN/o3soI
   nu2iqIexf6Dsi6wdHcXncUosEKfYyJRjBiuuV0GfVUnP8aQx5G4bkIDPd
   4Jv+XmGQlslBFCIGYASfvgn1SzIea4zuxA2tFXVWu4aJzQ0/iqO/3LZJl
   A==;
X-CSE-ConnectionGUID: Te3Hry/JQ+aXRUq1lD6PhQ==
X-CSE-MsgGUID: wFz5L7uORoKfQmT9R8lKTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="66205261"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="66205261"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 08:44:16 -0800
X-CSE-ConnectionGUID: MdjKFiptRKmbh+MiSRvNYA==
X-CSE-MsgGUID: zer7B7wkREWpKuZV39M+YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="193495423"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Nov 2025 08:44:15 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOf6L-000000005PR-1rCc;
	Thu, 27 Nov 2025 16:44:13 +0000
Date: Fri, 28 Nov 2025 00:43:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/3] ACPI: processor: idle: Update idle states from
 avaiable power information
Message-ID: <202511272353.nOqEau6n-lkp@intel.com>
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
In-Reply-To: <20251125072933.3706006-4-lihuisong@huawei.com>
References: <20251125072933.3706006-4-lihuisong@huawei.com>
TO: Huisong Li <lihuisong@huawei.com>
TO: rafael@kernel.org
TO: lenb@kernel.org
CC: linux-acpi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Sudeep.Holla@arm.com
CC: linuxarm@huawei.com
CC: jonathan.cameron@huawei.com
CC: zhanjie9@hisilicon.com
CC: zhenglifeng1@huawei.com
CC: yubowen8@huawei.com
CC: lihuisong@huawei.com

Hi Huisong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge linus/master v6.18-rc7 next-20251127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huisong-Li/cpuidle-Add-enable_cpuidle-interface/20251125-153615
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20251125072933.3706006-4-lihuisong%40huawei.com
patch subject: [PATCH 3/3] ACPI: processor: idle: Update idle states from avaiable power information
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20251126 (https://download.01.org/0day-ci/archive/20251127/202511272353.nOqEau6n-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511272353.nOqEau6n-lkp@intel.com/

smatch warnings:
drivers/acpi/processor_idle.c:1339 acpi_processor_power_state_has_changed() error: we previously assumed '_pr' could be null (see line 1339)

vim +/_pr +1339 drivers/acpi/processor_idle.c

4f86d3a8e29720 Len Brown                 2007-10-03  1293  
a36a7fecfe6071 Sudeep Holla              2016-07-21  1294  int acpi_processor_power_state_has_changed(struct acpi_processor *pr)
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1295  {
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1296  	int cpu;
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1297  	struct acpi_processor *_pr;
3d339dcbb56d8d Daniel Lezcano            2012-09-17  1298  	struct cpuidle_device *dev;
ffff9603ddf90a Huisong Li                2025-11-25  1299  	int ret = 0;
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1300  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1301  	if (disabled_by_idle_boot_param())
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1302  		return 0;
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1303  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1304  	if (!pr->flags.power_setup_done)
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1305  		return -ENODEV;
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1306  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1307  	/*
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1308  	 * FIXME:  Design the ACPI notification to make it once per
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1309  	 * system instead of once per-cpu.  This condition is a hack
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1310  	 * to make the code that updates C-States be called once.
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1311  	 */
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1312  
9505626d7bfeb5 Paul E. McKenney          2012-02-28  1313  	if (pr->id == 0 && cpuidle_get_driver() == &acpi_idle_driver) {
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1314  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1315  		/* Protect against cpu-hotplug */
95ac706744de78 Sebastian Andrzej Siewior 2021-08-03  1316  		cpus_read_lock();
6726655dfdd2dc Jiri Kosina               2014-09-03  1317  		cpuidle_pause_and_lock();
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1318  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1319  		/* Disable all cpuidle devices */
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1320  		for_each_online_cpu(cpu) {
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1321  			_pr = per_cpu(processors, cpu);
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1322  			if (!_pr || !_pr->flags.power_setup_done)
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1323  				continue;
3d339dcbb56d8d Daniel Lezcano            2012-09-17  1324  			dev = per_cpu(acpi_cpuidle_device, cpu);
3d339dcbb56d8d Daniel Lezcano            2012-09-17  1325  			cpuidle_disable_device(dev);
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1326  		}
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1327  
ffff9603ddf90a Huisong Li                2025-11-25  1328  		/*
ffff9603ddf90a Huisong Li                2025-11-25  1329  		 * Update C-state information based on new power information.
ffff9603ddf90a Huisong Li                2025-11-25  1330  		 *
ffff9603ddf90a Huisong Li                2025-11-25  1331  		 * The same idle state is used for all CPUs.
ffff9603ddf90a Huisong Li                2025-11-25  1332  		 * The old idle state may not be usable anymore if fail to get
092a52b5417fd4 Huisong Li                2025-11-25  1333  		 * available ACPI power information from any online CPU.
ffff9603ddf90a Huisong Li                2025-11-25  1334  		 * The cpuidle of all CPUs should be disabled.
ffff9603ddf90a Huisong Li                2025-11-25  1335  		 */
092a52b5417fd4 Huisong Li                2025-11-25  1336  		ret = -ENODEV;
092a52b5417fd4 Huisong Li                2025-11-25  1337  		for_each_online_cpu(cpu) {
092a52b5417fd4 Huisong Li                2025-11-25  1338  			_pr = per_cpu(processors, cpu);
092a52b5417fd4 Huisong Li                2025-11-25 @1339  			if (!_pr && !_pr->flags.power_setup_done)
092a52b5417fd4 Huisong Li                2025-11-25  1340  				continue;
092a52b5417fd4 Huisong Li                2025-11-25  1341  			ret = acpi_processor_get_power_info(_pr);
092a52b5417fd4 Huisong Li                2025-11-25  1342  			if (!ret) {
092a52b5417fd4 Huisong Li                2025-11-25  1343  				acpi_processor_setup_cpuidle_states(_pr);
092a52b5417fd4 Huisong Li                2025-11-25  1344  				break;
092a52b5417fd4 Huisong Li                2025-11-25  1345  			}
092a52b5417fd4 Huisong Li                2025-11-25  1346  		}
ffff9603ddf90a Huisong Li                2025-11-25  1347  		if (ret) {
ffff9603ddf90a Huisong Li                2025-11-25  1348  			/* Ensure cpuidle of offline CPUs are inavaliable. */
ffff9603ddf90a Huisong Li                2025-11-25  1349  			disable_cpuidle();
092a52b5417fd4 Huisong Li                2025-11-25  1350  			pr_err("No available ACPI power information, disable cpuidle of all CPUs.\n");
ffff9603ddf90a Huisong Li                2025-11-25  1351  			goto release_lock;
ffff9603ddf90a Huisong Li                2025-11-25  1352  		}
ffff9603ddf90a Huisong Li                2025-11-25  1353  		enable_cpuidle();
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1354  
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1355  		/* Enable all cpuidle devices */
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1356  		for_each_online_cpu(cpu) {
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1357  			_pr = per_cpu(processors, cpu);
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1358  			if (!_pr || !_pr->flags.power_setup_done)
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1359  				continue;
ffff9603ddf90a Huisong Li                2025-11-25  1360  			ret = acpi_processor_get_power_info(_pr);
ffff9603ddf90a Huisong Li                2025-11-25  1361  			if (!ret && _pr->flags.power) {
3d339dcbb56d8d Daniel Lezcano            2012-09-17  1362  				dev = per_cpu(acpi_cpuidle_device, cpu);
a36a7fecfe6071 Sudeep Holla              2016-07-21  1363  				acpi_processor_setup_cpuidle_dev(_pr, dev);
3d339dcbb56d8d Daniel Lezcano            2012-09-17  1364  				cpuidle_enable_device(dev);
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1365  			}
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1366  		}
ffff9603ddf90a Huisong Li                2025-11-25  1367  release_lock:
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1368  		cpuidle_resume_and_unlock();
95ac706744de78 Sebastian Andrzej Siewior 2021-08-03  1369  		cpus_read_unlock();
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1370  	}
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1371  
ffff9603ddf90a Huisong Li                2025-11-25  1372  	return ret;
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1373  }
46bcfad7a819bd Deepthi Dharwar           2011-10-28  1374  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
