Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ACF11FC0EF
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 13:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764249763; cv=none; b=YXC9EU7/Okcahl2XYvX9f4h6n+s0qpd4d66v6bI89PwB2vlZduOA2kHtzPfaiHTriuUdQVK7To36EfOrp249oEB+HoRmSjaTWw73J4K0C53v7qVf3VItPiEvbGgY+Jo+uPJ/o4YpTQkoh/4Py5n6z7r+8r32OPHMHqgzo9QaZ28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764249763; c=relaxed/simple;
	bh=yWNSwRxCYWCA+mqztfQP3dJZIFmopSWsq73QFguGg7Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rs6Uo5xIy6wUT942wJ0iohpZ0sTAZKvey1SKCS29Qz/HGfT4BMcgmrLSIic1WKzC0ZTXZqc7vIbSNpk8aErkk3ii/k9ipgeUXYFhvrr5wHY1R/qthlJxcrGFOIvGz8XxbXj5ggTWU1oFhzsn/SBXc/L+rcrderVUe6slBX/BVlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lo4Q6zow; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lo4Q6zow"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764249762; x=1795785762;
  h=date:from:to:subject:message-id:mime-version;
  bh=yWNSwRxCYWCA+mqztfQP3dJZIFmopSWsq73QFguGg7Y=;
  b=Lo4Q6zowefyoGtarqS6+ze5ujGqa5PPyNnSQ4EduzvSfXS6urH0utyTS
   6iScx5lEdx5giZuCehrmpRbw+Afdp8aNo5R65Nm4InnNr6w0s8U+F8Ohx
   YAHncYjOMCoGqLv8RwHTVO/qwnybFUpFxTjsxud9Ul8PR+YpyRDlYB1th
   FO8Ohu8h1a0ClnncFD5m/BOFvoJ9N/NF75Jry9oeJqn3zgwcTFSlz+v+6
   MTfagc4T9VLq+PGaLQSIhzDQkrWKAsSZl6ECQOy1jatyx2DucIlPS+D6V
   AFWAvZGWicMFdO/1eeDpzAoXTUYobUjOwDH4XJOUUdXVGH6d2EBwXmyiv
   g==;
X-CSE-ConnectionGUID: m0DH7wEgTJKk1X9UN9KFlQ==
X-CSE-MsgGUID: yNn4t+ESSmGJAUZjN6CoUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="65303104"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="65303104"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 05:22:41 -0800
X-CSE-ConnectionGUID: n5yuEfKNQDWWs/fn5wg5ag==
X-CSE-MsgGUID: ibPwOhVoQ4qj3F08wQ4/Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; 
   d="scan'208";a="192893778"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Nov 2025 05:22:41 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vObxG-000000001kz-44hp
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 13:22:38 +0000
Date: Thu, 27 Nov 2025 14:22:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 38/58] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
Message-ID: <202511271404.RCbrD8Rs-lkp@intel.com>
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
TO: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Hi Shyam,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   0b39ce8f71c92c72681d9a678298a9a59ff9b5d3
commit: bc3c0a3231b78589896f283d971a003761b100e5 [38/58] platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
:::::: branch date: 83 minutes ago
:::::: commit date: 6 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511271404.RCbrD8Rs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
#18: 
Reviewed-by:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
