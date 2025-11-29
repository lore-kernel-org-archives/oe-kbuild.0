Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A581188CC9
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 04:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764389270; cv=none; b=jp/yWfh9xQnePgr95DdTj1AQ8Wt8L9op18QSZUROPNU8gwH3CI8RhB++Tmsju60Qdkla9BgRAwYgHxSaeUOROznu/h1VXKfpnrXg+XHXWUDQacPlH8Tb6qw05fpwbFSq9XKoV+MrS4/uZ/We6mdYFADzsmh7PxIdTPS83Le7usI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764389270; c=relaxed/simple;
	bh=AXUwzX08uzx8+9pnS4VPCT7MxiBu3xLxZWv/fXSONqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PiLBUI3xC8Bdbq7+2J2IFB51F0l3MgWAnzvwhVZ0GuTG3DFxlIjOF1F+LBd+WxTMtr6VhqZm7pCM6vozEKz2P72IHcWz6covsk37PJmsEN14d9IFBzFkcfm1MwFrHHNQFs11+uKNo+x5GFQQYejVy5JMmQ7+d0UvrtOe8d5ZwsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KxuRm7tR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KxuRm7tR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764389268; x=1795925268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AXUwzX08uzx8+9pnS4VPCT7MxiBu3xLxZWv/fXSONqA=;
  b=KxuRm7tRXq5PAXOziC5sb1gl9Pd4FQkc5zkLXoKPFQHjdjqicVipbW//
   5sfu7Eizl3id0WZO6gtQKiAUcsW62F7dzvVnKaWqijzOlJLTDZ6IcREk5
   jha7i6le/tC7SQxE4CCpbB/OkPYebZ5/va5eHxLiZ6kFEVk+L3rpMEIQc
   HBXcTaJg8wGIbRLXrHEQs6qEaxL9D5nWVWCSpS486ckdVBV9iH5Ie0fas
   qcCpCpUn3EdWlMlMYrw7DMqJqiSzURdDcxHDi1k3MZDeo5Xr81ON2s7Km
   M1T0yD0o152aiTiDv33dzXopHwmWA3iOfuEre9K1SQEVEUnpyFr5jtVX/
   A==;
X-CSE-ConnectionGUID: f13c2U3DSlWFsHKbZ8k1qg==
X-CSE-MsgGUID: IQseesAzSeS60iQRG0eCyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="70260475"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="70260475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 20:07:47 -0800
X-CSE-ConnectionGUID: TUiqfWMDQw2MG9FG7aCu5w==
X-CSE-MsgGUID: zi22ij3fT9KFx/om5fWGAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="197913893"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Nov 2025 20:07:46 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPCFM-000000006wL-1e2C;
	Sat, 29 Nov 2025 04:07:44 +0000
Date: Sat, 29 Nov 2025 12:07:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check
 LRC timestamp in TDR
Message-ID: <202511291102.jnnKP6IB-lkp@intel.com>
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
In-Reply-To: <20251126214748.650107-9-matthew.brost@intel.com>
References: <20251126214748.650107-9-matthew.brost@intel.com>
TO: Matthew Brost <matthew.brost@intel.com>
TO: intel-xe@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20251128]
[cannot apply to drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master drm-exynos/exynos-drm-next v6.18-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-sched-Add-several-job-helpers-to-avoid-drivers-touching-scheduler-state/20251127-054955
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20251126214748.650107-9-matthew.brost%40intel.com
patch subject: [PATCH v6 8/8] drm/xe: Avoid toggling schedule state to check LRC timestamp in TDR
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20251128 (https://download.01.org/0day-ci/archive/20251129/202511291102.jnnKP6IB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511291102.jnnKP6IB-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_lrc.c:2392 xe_lrc_timestamp() error: uninitialized symbol 'new_ts'.

vim +/new_ts +2392 drivers/gpu/drm/xe/xe_lrc.c

82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2354  
8b9544e07d802b Matthew Brost         2024-06-11  2355  /**
94c0c481e1bd20 Matthew Brost         2025-11-26  2356   * xe_lrc_timestamp() - Current ctx timestamp
8b9544e07d802b Matthew Brost         2024-06-11  2357   * @lrc: Pointer to the lrc.
8b9544e07d802b Matthew Brost         2024-06-11  2358   *
94c0c481e1bd20 Matthew Brost         2025-11-26  2359   * Return latest ctx timestamp.
8b9544e07d802b Matthew Brost         2024-06-11  2360   *
8b9544e07d802b Matthew Brost         2024-06-11  2361   * Returns: New ctx timestamp value
8b9544e07d802b Matthew Brost         2024-06-11  2362   */
94c0c481e1bd20 Matthew Brost         2025-11-26  2363  u64 xe_lrc_timestamp(struct xe_lrc *lrc)
9b090d57746d96 Umesh Nerlige Ramappa 2024-05-17  2364  {
94c0c481e1bd20 Matthew Brost         2025-11-26  2365  	u64 lrc_ts, reg_ts, new_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2366  	u32 engine_id;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2367  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2368  	lrc_ts = xe_lrc_ctx_timestamp(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2369  	/* CTX_TIMESTAMP mmio read is invalid on VF, so return the LRC value */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2370  	if (IS_SRIOV_VF(lrc_to_xe(lrc))) {
94c0c481e1bd20 Matthew Brost         2025-11-26  2371  		new_ts = lrc_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2372  		goto done;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2373  	}
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2374  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2375  	if (lrc_ts == CONTEXT_ACTIVE) {
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2376  		engine_id = xe_lrc_engine_id(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2377  		if (!get_ctx_timestamp(lrc, engine_id, &reg_ts))
94c0c481e1bd20 Matthew Brost         2025-11-26  2378  			new_ts = reg_ts;
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2379  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2380  		/* read lrc again to ensure context is still active */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2381  		lrc_ts = xe_lrc_ctx_timestamp(lrc);
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2382  	}
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2383  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2384  	/*
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2385  	 * If context switched out, just use the lrc_ts. Note that this needs to
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2386  	 * be a separate if condition.
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2387  	 */
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2388  	if (lrc_ts != CONTEXT_ACTIVE)
94c0c481e1bd20 Matthew Brost         2025-11-26  2389  		new_ts = lrc_ts;
9b090d57746d96 Umesh Nerlige Ramappa 2024-05-17  2390  
82b98cadb01f63 Umesh Nerlige Ramappa 2025-05-09  2391  done:
94c0c481e1bd20 Matthew Brost         2025-11-26 @2392  	return new_ts;
94c0c481e1bd20 Matthew Brost         2025-11-26  2393  }
94c0c481e1bd20 Matthew Brost         2025-11-26  2394  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
