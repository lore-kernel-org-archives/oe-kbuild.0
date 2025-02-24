Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDC91F419C
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Feb 2025 22:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740434995; cv=none; b=DSUaMJnoy5sLlh6CcPolgE8IxS95E/wJ4yz3INc5ytulfokDWooLJiF2GNHGzTfanjVICIUVWduhzTSXWo12XOCglADTPXPhavJ7oj5Z694UHgfkBCNrcaOwjHsQ0F89YPfdGBJL5fjszMgM1fS6Bxj7OAjmoj4w/p1FKo/B/RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740434995; c=relaxed/simple;
	bh=l8q/mT2AFGGD52ua9l4wd0X8UDyLaml/+LUHoIqslhg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hQHNn5eLvefbpZXH5saropiPHwtEf1+2HSsYJX5j0ZODGsk2kPfanwZYFF1WlXeQ4rQZp13+/CCnblrHqYpzi86hoL+D+v3SE7lH+LlJqF1oQOHUFpcoQjw5ZWfocNKaK/JEIgT1ujDRjxHTPYco8OnthLm/ixx4supH8c+RmHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S6aozX47; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S6aozX47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740434993; x=1771970993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l8q/mT2AFGGD52ua9l4wd0X8UDyLaml/+LUHoIqslhg=;
  b=S6aozX47B0NuH5/ZNEkuhmk1XHQDa8dCFW4NwGk98j+L8gnjphSAfcTe
   XIU4nvjv6pj7sD9LBq34EA2YqGjfC7mzqi47PhmcwdrOdjCTTY8iTwo99
   n41hJOPS0UeI6Dq/rDNAR6PgvEFku4eSWbxbi1c3TIH/1UT8Z0ngJ8DI9
   AC31bnCvhOhkV3ysypKg6vns9c1OE6Bl9aQc9BDZsC/tjHDHcICblz17G
   QhekDEVhn+Z/VU8TJPUDQ9+kbYs2mamxsricyPmaoxHv/Ybcpo18oRhY5
   FVPdLDNeL5K9io8SGmpd0MfYMwI4uWGaszBpyMuR04vC+2ToVEK6qaUZ0
   w==;
X-CSE-ConnectionGUID: wTvYEFabRI27Qis9ASMXWg==
X-CSE-MsgGUID: aWfAI0FYR+aA4zNY5NqhYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="44040645"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="44040645"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 14:09:50 -0800
X-CSE-ConnectionGUID: gDt1/YmXTRC7/rTHb+Ju2Q==
X-CSE-MsgGUID: iVehfScCTFGI5xoGgv6cgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; 
   d="scan'208";a="116204910"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 24 Feb 2025 14:09:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmge3-0009Nl-0H;
	Mon, 24 Feb 2025 22:09:47 +0000
Date: Tue, 25 Feb 2025 06:09:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [chrome-os:chromeos-6.12 1/1]
 drivers/media/pci/intel/ipu6/psys/ipu6-ppg.c:328 ipu_psys_ppg_resume() warn:
 missing unwind goto?
Message-ID: <202502250645.LOy4jqQs-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.12
head:   37dbd8a8c2e99d2dc230a23b66250fcb4f26e9c0
commit: 2ef11ef12e26baa9bef7d9fc913f8e87a2d53c16 [1/1] CHROMIUM: ipu6: enable the psys downstream driver
:::::: branch date: 15 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20250224 (https://download.01.org/0day-ci/archive/20250225/202502250645.LOy4jqQs-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502250645.LOy4jqQs-lkp@intel.com/

smatch warnings:
drivers/media/pci/intel/ipu6/psys/ipu6-ppg.c:328 ipu_psys_ppg_resume() warn: missing unwind goto?
drivers/media/pci/intel/ipu6/psys/ipu-psys.c:1359 ipu6_psys_probe() warn: missing error code 'rval'

vim +328 drivers/media/pci/intel/ipu6/psys/ipu6-ppg.c

7246d8ce30d62a5 Bingbu Cao 2024-12-03  284  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  285  int ipu_psys_ppg_resume(struct ipu_psys_ppg *kppg)
7246d8ce30d62a5 Bingbu Cao 2024-12-03  286  {
7246d8ce30d62a5 Bingbu Cao 2024-12-03  287  	struct ipu_psys *psys = kppg->fh->psys;
8d5e92b8220938d Bingbu Cao 2024-12-03  288  	struct device *dev = &psys->adev->auxdev.dev;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  289  	struct ipu_psys_kcmd tmp_kcmd = {
7246d8ce30d62a5 Bingbu Cao 2024-12-03  290  		.kpg = kppg->kpg,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  291  		.fh = kppg->fh,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  292  	};
7246d8ce30d62a5 Bingbu Cao 2024-12-03  293  	int ret;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  294  
8d5e92b8220938d Bingbu Cao 2024-12-03  295  	dev_dbg(dev, "resume ppg id %d, addr 0x%p\n",
7246d8ce30d62a5 Bingbu Cao 2024-12-03  296  		ipu_fw_psys_pg_get_id(&tmp_kcmd), kppg);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  297  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  298  	kppg->state = PPG_STATE_RESUMING;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  299  	if (enable_suspend_resume) {
8d5e92b8220938d Bingbu Cao 2024-12-03  300  		ret = ipu_psys_allocate_resources(dev, kppg->kpg->pg,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  301  						  kppg->manifest,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  302  						  &kppg->kpg->resource_alloc,
8d5e92b8220938d Bingbu Cao 2024-12-03  303  						  &psys->res_pool_running);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  304  		if (ret) {
8d5e92b8220938d Bingbu Cao 2024-12-03  305  			dev_err(dev, "failed to allocate res\n");
7246d8ce30d62a5 Bingbu Cao 2024-12-03  306  			return -EIO;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  307  		}
7246d8ce30d62a5 Bingbu Cao 2024-12-03  308  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  309  		ret = ipu_fw_psys_ppg_resume(&tmp_kcmd);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  310  		if (ret) {
8d5e92b8220938d Bingbu Cao 2024-12-03  311  			dev_err(dev, "failed to resume ppg\n");
7246d8ce30d62a5 Bingbu Cao 2024-12-03  312  			goto error;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  313  		}
7246d8ce30d62a5 Bingbu Cao 2024-12-03  314  	} else {
7246d8ce30d62a5 Bingbu Cao 2024-12-03  315  		kppg->kpg->pg->state = IPU_FW_PSYS_PROCESS_GROUP_READY;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  316  		ret = ipu_fw_psys_pg_submit(&tmp_kcmd);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  317  		if (ret) {
8d5e92b8220938d Bingbu Cao 2024-12-03  318  			dev_err(dev, "failed to submit kcmd!\n");
7246d8ce30d62a5 Bingbu Cao 2024-12-03  319  			return ret;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  320  		}
7246d8ce30d62a5 Bingbu Cao 2024-12-03  321  
8d5e92b8220938d Bingbu Cao 2024-12-03  322  		ret = ipu_psys_allocate_resources(dev, kppg->kpg->pg,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  323  						  kppg->manifest,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  324  						  &kppg->kpg->resource_alloc,
8d5e92b8220938d Bingbu Cao 2024-12-03  325  						  &psys->res_pool_running);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  326  		if (ret) {
8d5e92b8220938d Bingbu Cao 2024-12-03  327  			dev_err(dev, "failed to allocate res\n");
7246d8ce30d62a5 Bingbu Cao 2024-12-03 @328  			return ret;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  329  		}
7246d8ce30d62a5 Bingbu Cao 2024-12-03  330  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  331  		ret = ipu_psys_kcmd_start(psys, &tmp_kcmd);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  332  		if (ret) {
8d5e92b8220938d Bingbu Cao 2024-12-03  333  			dev_err(dev, "failed to start kcmd!\n");
7246d8ce30d62a5 Bingbu Cao 2024-12-03  334  			goto error;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  335  		}
7246d8ce30d62a5 Bingbu Cao 2024-12-03  336  	}
8d5e92b8220938d Bingbu Cao 2024-12-03  337  	dev_dbg(dev, "s_change:%s: %p %d -> %d\n",
7246d8ce30d62a5 Bingbu Cao 2024-12-03  338  		__func__, kppg, kppg->state, PPG_STATE_RESUMED);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  339  	kppg->state = PPG_STATE_RESUMED;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  340  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  341  	return 0;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  342  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  343  error:
8d5e92b8220938d Bingbu Cao 2024-12-03  344  	ipu_psys_reset_process_cell(dev, kppg->kpg->pg, kppg->manifest,
7246d8ce30d62a5 Bingbu Cao 2024-12-03  345  				    kppg->kpg->pg->process_count);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  346  	ipu_psys_free_resources(&kppg->kpg->resource_alloc,
8d5e92b8220938d Bingbu Cao 2024-12-03  347  				&psys->res_pool_running);
7246d8ce30d62a5 Bingbu Cao 2024-12-03  348  
7246d8ce30d62a5 Bingbu Cao 2024-12-03  349  	return ret;
7246d8ce30d62a5 Bingbu Cao 2024-12-03  350  }
7246d8ce30d62a5 Bingbu Cao 2024-12-03  351  

:::::: The code at line 328 was first introduced by commit
:::::: 7246d8ce30d62a5406ca7c639087c659c8398498 CHROMIUM: ipu6: move the downstream psys driver into a separate path

:::::: TO: Bingbu Cao <bingbu.cao@intel.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
