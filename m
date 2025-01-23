Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136101CAA83
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 23:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737674399; cv=none; b=PGB50zJBO8mSxWWckOt57VMhzL/j4PNpSXiKlf5yxv8/lEV1JnO+5PaKIgFu+qI53XeZVNs8whcZRcgZcwLWuxcunvfAqdQT/F2DUJh7urJjrJff4qGtOpvM/0DQWF1DRMOSUOs9WJkhHUkteFkrrWRlLdx77mbU17LuYO4k3LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737674399; c=relaxed/simple;
	bh=bjAdxewya6MuFTnaDGSt+WZQ92wSQ+j2sdcNHUxmxUI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHNH0fL773GvB4izNQll34aKki+cWliNNG1B622WvO3dM3HhXuzQfc9mIsste4dv3FmbUEgf2mGphYe58SbAck+v5fxF3R7AG9A0YCJbpuPhyEof/SEm8j19UTfo/6IzgTUkEiAB00sChOATweqdyrGRPhsEDQkzuw3x2woKdHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBmojLnG; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBmojLnG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737674397; x=1769210397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bjAdxewya6MuFTnaDGSt+WZQ92wSQ+j2sdcNHUxmxUI=;
  b=IBmojLnGMkGVHub8wrLn1q9Q2QYV2FEpCs9ZIWyqzN384znYeBM7QzbV
   /1aDUUPBayJLfKhciNVH9YArvwdvXf0YOms52BbpZxFfAzqJtjOPpODfB
   uAPHZw41JuWVELDW1Mu8PUuJ7Eu+cMYL+rMWloej2+BF+7VZhThCFUL4K
   Hs08exMZsXxNS/ea+9fVn5oKHwITdOt75+rR/4t3iVtLK4pDv3qDnoV7i
   MU+ZLrsQE+HQJywi3ElYq/dpMH+6/XPbK6eF+K4KlHkgD+w2NVQZ/evfH
   Ehq51BmhUwPNqKLhvytCyCsNJLWntGyiXbr1cwBlvZ4Ce083H7VgyllbU
   g==;
X-CSE-ConnectionGUID: hpvG1CPqTVm8NSFMFhol0A==
X-CSE-MsgGUID: qeFn1mNQTs6v6VydH+RLIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37456422"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="37456422"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 15:19:56 -0800
X-CSE-ConnectionGUID: DHLFMOxTSwSzDyMH/uBtPA==
X-CSE-MsgGUID: GNLX+o8NQW2xASj/fwVbWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="112632283"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jan 2025 15:19:55 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb6UK-000bqR-01;
	Thu, 23 Jan 2025 23:19:52 +0000
Date: Fri, 24 Jan 2025 07:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 1414/1414] kismet: WARNING: unmet
 direct dependencies detected for HARDLOCKUP_DETECTOR when selected by
 SDEI_WATCHDOG
Message-ID: <202501240741.Xrks2FML-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Yang Yingliang <yangyingliang@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   da51139d17e9d53d61a9877d9042e43b85d71ee1
commit: 818ac22d9d2f02632b39ef1a4f472e6dbe0d417a [1414/1414] sdei_watchdog: fix compile error when CONFIG_HARDLOCKUP_DETECTOR is not set
:::::: branch date: 15 hours ago
:::::: commit date: 4 years, 7 months ago
config: arm64-kismet-CONFIG_HARDLOCKUP_DETECTOR-CONFIG_SDEI_WATCHDOG-0-0 (https://download.01.org/0day-ci/archive/20250124/202501240741.Xrks2FML-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501240741.Xrks2FML-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501240741.Xrks2FML-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR when selected by SDEI_WATCHDOG
   WARNING: unmet direct dependencies detected for HARDLOCKUP_DETECTOR
     Depends on [n]: DEBUG_KERNEL [=n] && !S390 && (HAVE_HARDLOCKUP_DETECTOR_PERF [=n] || HAVE_HARDLOCKUP_DETECTOR_ARCH [=y])
     Selected by [y]:
     - SDEI_WATCHDOG [=y] && <choice> && ARM_SDE_INTERFACE [=y] && !HARDLOCKUP_CHECK_TIMESTAMP [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
