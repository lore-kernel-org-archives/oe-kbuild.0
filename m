Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E24721C16A
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 02:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764900414; cv=none; b=N+7c7l4r06A4VYo9c260aE7Iz8AFOnvTBAuSe7BxImrGd4Y0ovEB4aEJ3ZTkHVpwk0FJjG1JufAJUvLfeivl1DjP/JJAgNQ/qNtBXIqZLg6fTolzNz+vbAa1BkK3XJ9IaskmHom1bpAUc7+hHLNLtkUy3YtnjpXD77I4jY03D6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764900414; c=relaxed/simple;
	bh=E93QwySDfX9pL6C5J/S2A3JyPqxJSEULhCnBfPnjd30=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iYmoxxyiPqSh0NvqIUCHbLmCxT6Ko3IVd6TbY3ncf9HkeFLExC+OMI0AoeQwEFgSMjK3L11rEJJo+zU654CnMqY+1s1J5lLXmnUFfchj0yK+hd3UZURrcDkFHLsKdX3zX1qc2RkwuVhlUPnzAsXysxh6t/0zMBxflaQ16q8PwH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brnqt44P; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brnqt44P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764900412; x=1796436412;
  h=date:from:to:subject:message-id:mime-version;
  bh=E93QwySDfX9pL6C5J/S2A3JyPqxJSEULhCnBfPnjd30=;
  b=brnqt44PGxNheQJlaXFrIN2/ew+bPo8sJm8GNCP+UQajqnlEH56DS4NW
   8rdug8LGVj+52xs17VtW2QT8ZZvZhgeggoZMrGghjIM4htGI2IyubH+gx
   noQpEN7QOLOTvQgxIErNxppnsj9AgUq13faPg04IOOcQ1gGi33bhvMtiS
   t9bzLeDofMqBVp///JOE53uo/NyaZ0Z+qy3V/okrUdXRHyyeQgEtcfUzC
   v9+kIm5rzKL/KHFcYLVc21bjK4tndIf+2mTCF9zP0BL+D1a56BbeHrqKy
   iFrnTmMqLvIGkYFLRIUc2um1dvtjKitVSEwLJXq+q+dd0SMSTt/pbvWTV
   A==;
X-CSE-ConnectionGUID: ZlgoOnluRlmgtKruhuCLlQ==
X-CSE-MsgGUID: 5gE4/XQGSMWXPOJsYYlUXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="84540403"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="84540403"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 18:06:48 -0800
X-CSE-ConnectionGUID: lgXD9Ci/QKKHvJhihqFmow==
X-CSE-MsgGUID: J25l0WB3RN+Ua/Irz1rOCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="218510071"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Dec 2025 18:06:47 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRLDZ-000000000q3-3JMe
	for oe-kbuild@lists.linux.dev;
	Fri, 05 Dec 2025 02:06:45 +0000
Date: Fri, 5 Dec 2025 03:06:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 57/72] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'user'
Message-ID: <202512050311.da5E1rUu-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   55b7d75112c25b3e2a5eadc11244c330a5c00a41
commit: 6ae88b58caeb6825bc83a224c69c0f15803ecdf2 [57/72] liveupdate: luo_flb: introduce File-Lifecycle-Bound global state
:::::: branch date: 70 minutes ago
:::::: commit date: 70 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251205/202512050311.da5E1rUu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'user'
#25: 
This patch does not have current user user, but multiple streams depend on

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
