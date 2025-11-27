Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFC31F5EA
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 06:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225759; cv=none; b=ELlg6jA0CxBcMRgpHbw2En/2Ji+IvxILLKszk9RMVmLDfoJH37ZKTMQ8Um+66nGbk8waInW5JQazV1jA1VlDiumJmNZD6ycuu5scWzEa5HkLGWJCrcxYqVeW5mEdq5AIEdZfJMHWslov0DVJBMfa68noRgjW1eyS0aNVfdvDKCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225759; c=relaxed/simple;
	bh=URaRVkf9gbavdn8tHwvWxqFrhDdlHiCmlstfjcTuBg0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jNcqAIOlwyjqOn9aogGGtBtGvWW1+HsodLHtVCkLy6uQodVOnaxnBRkOImjfMEcBdOKOR3iGnKdijk3tCu++9qz6fj+kfVNLMn+nYW+SuK/Ya4TAI1NznTmRjonFnMpIqyhETNsBijaip5398tF6j0PJTpoEhXHpohYiJNbU9yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l/urYnep; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l/urYnep"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764225757; x=1795761757;
  h=date:from:to:subject:message-id:mime-version;
  bh=URaRVkf9gbavdn8tHwvWxqFrhDdlHiCmlstfjcTuBg0=;
  b=l/urYnepj3H4gYkHGwISPy8f+rjkwaS7hwRJNlTtcvifXC6/fOG6k1bF
   X5bbgoIlAhWY4XUUFl+VW/Gy6UIofQYr0pzhKm64qUguen31x15TT+QKm
   EQ+/L9k0pXjDNQBXa1w2mSfQEc9N/9dzPVCGX+x9LhFcGRYtY/32bSUdt
   8RCoRfgAh81OA+OfUhEGJxKNueiBRcb0uw94ZWhAEqJsAqR8oC6e/rXYD
   rAdexZbIZuZEEp/aKNOVeHtQg4GckM9SLSYv0a9lixUK/elOTnFc3hml6
   +qDv6f8hyJCtkHFmWnfFeds8jbelOX0wbjzif9oSiTAAipdxsaxEoR9M+
   g==;
X-CSE-ConnectionGUID: QdC+KCYRSi61+Eq8Veu58Q==
X-CSE-MsgGUID: MOSIosC8SPius2J8lKQa7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66343258"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66343258"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 22:42:36 -0800
X-CSE-ConnectionGUID: puBQ6FcQSKuCQxecBBoSQg==
X-CSE-MsgGUID: Y41k2FhgQVa5bOaHqf0etQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="192281481"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Nov 2025 22:42:36 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOVi5-000000001dp-1MPO
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 06:42:33 +0000
Date: Thu, 27 Nov 2025 07:41:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 107/111] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'user'
Message-ID: <202511270712.rkosfOWs-lkp@intel.com>
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
head:   047c355d60e87d6bcfb18dafdb0dd0acdd586513
commit: ad7735508acb4cacf7c576569e43f421df5ea322 [107/111] liveupdate: luo_flb: introduce File-Lifecycle-Bound global state
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270712.rkosfOWs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'user'
#25: 
This patch does not have current user user, but multiple streams depend on

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
