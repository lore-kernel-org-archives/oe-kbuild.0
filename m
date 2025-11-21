Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199A123F27B
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 04:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763698867; cv=none; b=lq8neWy6Xxa/Fyq06hYARSlRiQ2JeCd2hHkmy8rdsDDyzOOMh4GkpHCl/Xn75yk8YFvy/tlpfNnpCzm0XTp3s19i8kSb6lyIj5o6nC3hNCrbGYZ/QRZcdTp6eZwB0WjelSVkHpJqD+PTI8oMAsIuLKAHeJ1cBjgoukTZ9pKoy48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763698867; c=relaxed/simple;
	bh=Jo22SZDWH1CsZ+674880vsYwD4wTdwYnJA+KGeOM2Es=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WIpQklRTZV6DKeCPUcd4hUvDxfNJOwTuTnwULho5KSlTbqDe0qpE4GgH/m8ad0oC0ZHUlcRCUkJtfErKOg68hK6G++oIbIKFQ5aj1qT3MTLXj/7oSu/6L3TE+A8HkezZGzuWPe99e8+JPdyUaZQJkMjQBBFf+fODWKWrm1t1V94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G/P9UQO5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G/P9UQO5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763698866; x=1795234866;
  h=date:from:to:subject:message-id:mime-version;
  bh=Jo22SZDWH1CsZ+674880vsYwD4wTdwYnJA+KGeOM2Es=;
  b=G/P9UQO5rFAoZn27kZyCF9CasfuefPAJkws4+ZlHlXxQpeBzkcwC0+PN
   Jx4Ngu2r7LfvB2HRx6Ir4Q0fN1FFZ3Y4bjLb2JHe3+S9HnIXQPBfvimNf
   iLPo0nNXFdKiUgy8XUSihygQPnLx/NXHrXjRZQtZbgS10HYBZy2zpTdgv
   ZCp1mrPz60/GRImZO8qQuxJgVgPKoeybFcD9Psr+iPUW9gM9vNeNFfOjR
   cA+EXRU55SvkaWl/fcgl3OtprRSgnZqQSOXWW6RYTIHxWVMScAmcllkLN
   vl/WOxpAg/+jIFGa//l5VjAcTdhpMrnJzbPjru2IrzUvYPXwg7rUyISnO
   A==;
X-CSE-ConnectionGUID: Xp5Bl5ERRr6ZB/xMvBxmWg==
X-CSE-MsgGUID: sxtwC02zRXu/dSPLfMZSyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="77149039"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="77149039"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 20:21:04 -0800
X-CSE-ConnectionGUID: nVfMT+GeQVa4KaHCOB7nGA==
X-CSE-MsgGUID: HJ1NQ5aUR26VkrGcM21QkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="222214397"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 20 Nov 2025 20:21:04 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMIdp-000000001fT-11Q9
	for oe-kbuild@lists.linux.dev;
	Fri, 21 Nov 2025 04:21:01 +0000
Date: Fri, 21 Nov 2025 05:20:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Animesh-Manna/drm-i915-cmtg-enable-cmtg-LNL-onwards/20251117-202055
 1/8] checkpatch: ERROR:SPACING: space required before the open parenthesis
 '('
Message-ID: <202511210535.TIw81dhd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Animesh Manna <animesh.manna@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Animesh-Manna/drm-i915-cmtg-enable-cmtg-LNL-onwards/20251117-202055
head:   f9ef9db0f8f9b35cadb70f8d2420a4eb072b5665
commit: e23776fc05cd8cdda59af9aa2e372d22da09e642 [1/8] drm/i915/cmtg: enable cmtg LNL onwards
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251121/202511210535.TIw81dhd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511210535.TIw81dhd-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open parenthesis '('
#37: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3424:
+	if(DISPLAY_VER(display) >= 15 && intel_dp_is_edp(intel_dp)) {

ERROR:SPACING: space required after that ',' (ctx:VxV)
#39: FILE: drivers/gpu/drm/i915/display/intel_dp.c:3426:
+		drm_dbg_kms(display->drm,"ANI-DBG: intel_dp_compute_config\n");
 		                        ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
