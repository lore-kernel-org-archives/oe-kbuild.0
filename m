Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6C51C68F
	for <oe-kbuild@lists.linux.dev>; Sun,  7 Dec 2025 00:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765066805; cv=none; b=ssqwQn0uqJUoRUREvW7WL8yPmdoqYpZUcuW8Pqfe0/z4yCvA0JnqaHDSAJTzERzjIBGagWTxxEZce8++w7vHwB047wuMy6OQkJbmjxI7/2nw3Dmix6AMa9C9Z6qMKeAdf2wRS5AQPqi95ibAsjGP0iuLkzJUOZUJr+jsiuPK97Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765066805; c=relaxed/simple;
	bh=TOWk2sSZuuqgpm03sxouffMD5A3LBObo2cZUEDZGaJw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fWxeDCi8UOr72tdvbBkHoGUOcJcogTfgfzEpjOTbLWpX5XwUJXDXQN9o8L4iXt9yTdYzA7s+vkp99vZs/2cC8sZrpqafFnvCa3mle13tRlk7f9/49B+1wkh+dFP8iGkCezxyklEn93uHzoC+A1odnYtfn9da57ayIP4/2zHNiUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MCAhfHOz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MCAhfHOz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765066804; x=1796602804;
  h=date:from:to:subject:message-id:mime-version;
  bh=TOWk2sSZuuqgpm03sxouffMD5A3LBObo2cZUEDZGaJw=;
  b=MCAhfHOzjWFPbVEtn0FS9WMr48su1y96bwEpsSTXQstjwJBfaSy+zdB0
   immNHO7SulcWuVVAbWPyIBHZACviEk191ENYie0oszKkbrS2iwHjJCDHK
   YGoE8CAD1WdFRFAb0OrY30r8spIU98cop2FQLYfkRpXw4tvgTtL/T+XuM
   ZAPmHz6cCoKGOEamjJwiHjhBR3KGCLR/bR6SdI7n5ZkYZi+mXBlU/DS3o
   92rw5UHtwgN6sWd2KqEOdE40CJAO+1jYlYfPEuihRAqFwWz38bf9DcMDP
   3Gz7TFfHxfqkW2qpEJG29jv0mZ8pkVZorCaW89BkvHZG8VsrPLKxHIWN7
   g==;
X-CSE-ConnectionGUID: FhQ/k8JFTl6pyGA2NNFcMQ==
X-CSE-MsgGUID: PQJJ4sTMQwOBSV/ROLdzGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="89713251"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="89713251"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 16:20:04 -0800
X-CSE-ConnectionGUID: KU3+4nkwQmWZM0O3PJiRQA==
X-CSE-MsgGUID: Qoh3YF/gQ4qIdAxhaAMo3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="226262921"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2025 16:20:03 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS2VM-0000000019Z-0lPK
	for oe-kbuild@lists.linux.dev;
	Sun, 07 Dec 2025 00:20:00 +0000
Date: Sun, 7 Dec 2025 01:19:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 58/76] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'user'
Message-ID: <202512070105.30UAoSxJ-lkp@intel.com>
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
head:   f38557294736997e116c98d37bb45e1155128ff6
commit: 4bf8e91db0c7609981c9867bfad2230becbaa01e [58/76] liveupdate: luo_flb: introduce File-Lifecycle-Bound global state
:::::: branch date: 68 minutes ago
:::::: commit date: 68 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251207/202512070105.30UAoSxJ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'user'
#25: 
This patch does not have current user user, but multiple streams depend on

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
