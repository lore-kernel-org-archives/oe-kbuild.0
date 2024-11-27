Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891EA18FDD0
	for <oe-kbuild@lists.linux.dev>; Wed, 27 Nov 2024 15:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732722676; cv=none; b=ffEGfcqh6aC6imhqKL07as9WbeP/qfAJ/5QT+HTvVoKOE7XZhGqJNCM8L52hLJY7FslURwdhKLsNYfiLOlWduCPsueW77ORuHHcjRPbHKdJ1ulYbXoa2bXqh/XlzdHhRTcQzuiPVxkLFxAptLMLyvU2K+G+kMFHiLUPNxH9Hc+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732722676; c=relaxed/simple;
	bh=l7p6UVW2rGpUMzFLzWHD98X/T8pDHdCd7ZeaMvcqjxk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WYmsgGCmGWkBP0/rkFUFCLYPxmvn2rAyjFPwBH7vSy1CBZxLB1RlDQpZxfqL3DyPQBW9LIl51U2yNj2srKQa3d4pz8HTQxB09tgECbvC7YMjsHfLKieIa3AdI3Ks9CapasGSoCew4E+m/Q/Of7GivKcKWUD0QHGs1Cln73E1I7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xli8Ezsa; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xli8Ezsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732722674; x=1764258674;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l7p6UVW2rGpUMzFLzWHD98X/T8pDHdCd7ZeaMvcqjxk=;
  b=Xli8EzsafdCydvDWMIi+jBgpwhobhzUErSvWHOmZEqaA3wbaAMbol1g4
   U/bjI6EPyZdYf+FY7Nf4HBi8Y5kh5dbv8iezhAyWwE6loYV3AoIh+Avt+
   TmrDuF95H7mVlsYQlCOnhIHXiecKyw3+pX3t9wMnRViy5FsP6vjb4jI7D
   Ui7bqqpiAgAucKYtCWFJtND9W3RdjSwLQqBMWNLUEdoZLleDDcQTcaUQf
   IOC7atIoLT++VYxb+G1X5MWodSoTf3zk8XrZGiCHWnQUnDwKhjWBbIaiw
   gkDkzf7703w5Svhp4EIaBtfPI3ZG8CzOWDKq9jypXQINGdmzCUHmXI+Jy
   w==;
X-CSE-ConnectionGUID: OJfHLf7gRIe33pIoNVF/zw==
X-CSE-MsgGUID: 97f3JOdqQEaz0LeMz1X2Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="36597567"
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="36597567"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 07:51:13 -0800
X-CSE-ConnectionGUID: EqPeAnQqRZKwOWuLZyWbjA==
X-CSE-MsgGUID: km/811K2SfGEc5ixOxJWpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,189,1728975600"; 
   d="scan'208";a="96921892"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2024 07:51:12 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGKJp-00086Z-0x;
	Wed, 27 Nov 2024 15:51:09 +0000
Date: Wed, 27 Nov 2024 23:50:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 2490/2490] drivers/thermal/intel/intel_hfi.c:245
 hfi_update_work_fn() warn: can 'hfi_instance' even be NULL?
Message-ID: <202411272348.6eld5bPC-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Jun Tian <jun.j.tian@intel.com>

Hi Srinivas,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   68b0fb4e955465eef28bed1f5a252c4e6c636a36
commit: d1b287f6c142193c6dc5a5abfe2fe59e2f03cee6 [2490/2490] thermal: netlink: Add a new event to notify CPU capabilities change
:::::: branch date: 7 hours ago
:::::: commit date: 2 years, 5 months ago
config: x86_64-randconfig-161-20241127 (https://download.01.org/0day-ci/archive/20241127/202411272348.6eld5bPC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411272348.6eld5bPC-lkp@intel.com/

smatch warnings:
drivers/thermal/intel/intel_hfi.c:245 hfi_update_work_fn() warn: can 'hfi_instance' even be NULL?

vim +/hfi_instance +245 drivers/thermal/intel/intel_hfi.c

07dc6e0b04d8ec Ricardo Neri        2022-01-27  238  
07dc6e0b04d8ec Ricardo Neri        2022-01-27  239  static void hfi_update_work_fn(struct work_struct *work)
07dc6e0b04d8ec Ricardo Neri        2022-01-27  240  {
07dc6e0b04d8ec Ricardo Neri        2022-01-27  241  	struct hfi_instance *hfi_instance;
07dc6e0b04d8ec Ricardo Neri        2022-01-27  242  
07dc6e0b04d8ec Ricardo Neri        2022-01-27  243  	hfi_instance = container_of(to_delayed_work(work), struct hfi_instance,
07dc6e0b04d8ec Ricardo Neri        2022-01-27  244  				    update_work);
07dc6e0b04d8ec Ricardo Neri        2022-01-27 @245  	if (!hfi_instance)
07dc6e0b04d8ec Ricardo Neri        2022-01-27  246  		return;
07dc6e0b04d8ec Ricardo Neri        2022-01-27  247  
b0b8a4822c7764 Srinivas Pandruvada 2022-01-27  248  	update_capabilities(hfi_instance);
07dc6e0b04d8ec Ricardo Neri        2022-01-27  249  }
07dc6e0b04d8ec Ricardo Neri        2022-01-27  250  

:::::: The code at line 245 was first introduced by commit
:::::: 07dc6e0b04d8eca2963e138452d5b24af8f82b28 thermal: intel: hfi: Enable notification interrupt

:::::: TO: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
:::::: CC: Jun Tian <jun.j.tian@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
