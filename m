Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE0C30F92E
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 06:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772866089; cv=none; b=EoCzJgDdK+l/sKQp3JtREUnSRKn5pyvEbnIgNyJevxqgILB5eXeEnfq2CtGIEukG9d2T596T3CX6NynQN4hPgmSYwisto2MVLd5JfHmPfQ9E6R2Iko9FYv/gjbZOE7+OjJxY3qav/VdlgoyZCYfRY7S+cKzqiIwcqcnpklplnAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772866089; c=relaxed/simple;
	bh=uL4uYBrvipIjOef0kCGqgpw1q1t/KuwMan1RjksA/bY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G5p3A8jMOCAaYUXaqpqsDUeJHvOy/lfxl+/4cNMHjNHydM9e9zSv1hRfYgVF25RoPmLTEV1CxK5YANYF6W7CekyJEDOM1fVSEPdSralALY2sVg3JIWFDQZkY48WbBOkiWUxMwU3L4ZUjzEqb3Zgd/oLDGqyFJr/qbh0ggbA12rE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hjnb8/Ze; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hjnb8/Ze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772866088; x=1804402088;
  h=date:from:to:subject:message-id:mime-version;
  bh=uL4uYBrvipIjOef0kCGqgpw1q1t/KuwMan1RjksA/bY=;
  b=Hjnb8/Zea+Q2UP0cFS+K+SNoTuGFldrPe2JLDJ9PjVMQlrevFTOlNsrg
   kRghdR1JcVBP0z65fVc9PLyhc6dOY9XQdd9/efr7j7ShlurhVZzWKjvSF
   NSWErVdlP23zYrITAIBaA0Zf9nw/qUebpBpPIAwrMdT5dcXpTsxbtSBI7
   R6UcsBE7oUVIaaYnxYCRJCa54dtebH8RHu83U7zInRWDB97d9/3GalljG
   R0fgXSf0yzkTjzGL23D5oKIlEtyb4GBb39TqjS1//7bbeTKFzH+X0Jxjm
   OYlue15c9CVnzJ8H72aeOwbfV6DzTUytVPX6bBGull8xpyP688F++66fJ
   w==;
X-CSE-ConnectionGUID: f3kX/MW0TJqr8vLoyg6Z0w==
X-CSE-MsgGUID: RPJTWZklSIOqBkX2Ut0h2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="76577435"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="76577435"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 22:48:08 -0800
X-CSE-ConnectionGUID: yWly1vXMRCmghoDrMvS/FA==
X-CSE-MsgGUID: zsjN1uvSSRaA7DxPq2/qXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223338411"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2026 22:48:06 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vylSG-000000002RH-1fwT
	for oe-kbuild@lists.linux.dev;
	Sat, 07 Mar 2026 06:48:04 +0000
Date: Sat, 7 Mar 2026 07:47:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v7 05/29] drm/sched: Add some more scheduling quality
 unit tests
Message-ID: <202603070716.PqaMF8MT-lkp@intel.com>
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
In-Reply-To: <20260306163445.97243-6-tvrtko.ursulin@igalia.com>
References: <20260306163445.97243-6-tvrtko.ursulin@igalia.com>
TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
TO: amd-gfx@lists.freedesktop.org
TO: dri-devel@lists.freedesktop.org

Hi Tvrtko,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tvrtko-Ursulin/drm-sched-Disallow-initializing-entities-with-no-schedulers/20260307-012142
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260306163445.97243-6-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v7 05/29] drm/sched: Add some more scheduling quality unit tests
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260307/202603070716.PqaMF8MT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'test'
#25: 
Every 100ms for the duration of the test test logs how many jobs each

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
