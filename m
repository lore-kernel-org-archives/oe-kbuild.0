Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33077343D7B
	for <oe-kbuild@lists.linux.dev>; Thu, 20 Nov 2025 13:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763646476; cv=none; b=oHM5bATuQOKaxRhLd+1VJk7Y6fAf+JthEPMj2EDIgqciV/Pu877I7hVjJdw6GALCt7D1WoXLlaL83Z2G8FlCFhCSgO7XrwafWtPkqhGcVV/oAVph8Ia+RUg0Dh/mBqOK3cDOteBqzMo+3OF5g/EeFhCVtKS66bb3/qizFiWyl8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763646476; c=relaxed/simple;
	bh=TwVNkKa9+HtBlR4Upyayvse3MXhACPO0CjhSAs70MHI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NiKPuM1R7A7f59uo4lWWoC/lKJ+ZQthI0mkAwMh1dPUxAhMxPNGHxJzVcmYUwY9ctclzhuTk0lsk40bnRFAvmLwqTK/3CeS5wwna/iplyvifjx7tQZSjbkDzQgcsgahAgqoH4GTdmpQdVGLO2KE/1l1Z4OLaMPEuPGTHug4njPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VWZJuEi5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VWZJuEi5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763646474; x=1795182474;
  h=date:from:to:subject:message-id:mime-version;
  bh=TwVNkKa9+HtBlR4Upyayvse3MXhACPO0CjhSAs70MHI=;
  b=VWZJuEi553Nu5PH9poPOh9gg4oSdqjCnvMekRgLjcaUdMh+antRbDfaU
   YudZNARyE90sQoCypM7BstTmAl43NnORem8sJ12UCWBG6DMVk0/BfsMJd
   iQng3/HLUFFS/539Pt0Ub0HZAUx0jfzFidYLe4xxxZU60/j72iR53YFNA
   oravIUyTxVFXjO44tSEAJloTNUKoDWZirv6PjNMfdeRsHtJdiadFkR7nf
   BEEwDUsWtDWnYDVrnwjh5q32f98VPm6BoKh78b2TVF7TUIcyrvuwi96O5
   8hPfbwf3CqbtYCkwyRKYvs05/wjamqLdyi/1bgUvzsWj4hde3OzplvSEy
   w==;
X-CSE-ConnectionGUID: Fciprfc9Q2miV6eC8eUqKg==
X-CSE-MsgGUID: mlAMzK3kTUu6/SlXo+Rexw==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="69582365"
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="69582365"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 05:47:53 -0800
X-CSE-ConnectionGUID: ToP+jvaZRCyOPWnT5OdhWg==
X-CSE-MsgGUID: nURBnEQNTI6dnzGhvyBCgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,213,1758610800"; 
   d="scan'208";a="191627568"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 20 Nov 2025 05:47:52 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vM50o-000000001TL-0cJn
	for oe-kbuild@lists.linux.dev;
	Thu, 20 Nov 2025 13:47:50 +0000
Date: Thu, 20 Nov 2025 14:46:57 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20251115-081723
 24/51] checkpatch: WARNING:SPACING: space prohibited between function name
 and open parenthesis '('
Message-ID: <202511201447.6si3of2S-lkp@intel.com>
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
TO: Alex Hung <alex.hung@amd.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alex-Hung/drm-Add-helper-for-conversion-from-signed-magnitude/20251115-081723
head:   621ff29084f2623191e182f9d607500a6e474a35
commit: 579db804e7dec4b548a729d6b1a7de8df5d1f756 [24/51] drm/colorop: define a new macro for_each_new_colorop_in_state
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251120/202511201447.6si3of2S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511201447.6si3of2S-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#41: FILE: include/drm/drm_atomic.h:1107:
+		for_each_if ((__state)->colorops[__i].ptr &&		\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
