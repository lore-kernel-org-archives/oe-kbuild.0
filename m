Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BF02FFDDF
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 23:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764198816; cv=none; b=EvAfSm3nfzthilFBJC2I8rG7nePKBiFZcEv4gUcDcFt/6Kx8/dxbIE/g7Gd96tSlo2HBv+yPlCCWo57gm58oME/69nFol+rzjDswjZq7+idoq6Z232xVzNmlSkmxy+KhFbHYkc4ikrqIxRbYXr1if20BjBMc9cQPjYhN6gNpGWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764198816; c=relaxed/simple;
	bh=+K94WEG8Fr7pwKfSCyCrKCxEnI4E+rDdQJamrHAJWug=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XsIz0yqlQaz7L83OTuSg6Ls7WxcBV+U9dYnpAYFpdf6E4f8NWUgvKvdZStxPBl8gwi7eZcNME7qalwSbY/ia3AbE/q8JzMxTti9/vM7dYwcjdqz17dHOY63I4dcd/TmGuz1D1p/EuGt5evtDc9ByP+vK6mgZEWuxnFMM0IjZ47k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FCw0sfBR; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FCw0sfBR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764198815; x=1795734815;
  h=date:from:to:subject:message-id:mime-version;
  bh=+K94WEG8Fr7pwKfSCyCrKCxEnI4E+rDdQJamrHAJWug=;
  b=FCw0sfBRjeNn7t6k84HWkc3Z2zhkl59f6KQHpdh1a4kae1S7VQjaCsqA
   jt99KB3tf1BqiGiJDy7fijt5Xyg3uvecEXtyIJu4FcKFX85sinZx/EWxJ
   BATSqmyg+awW2M6Atmqdskr01DwgRvXR3uRfUUNEDmDh0eSJkGY++MUeZ
   XgMlMA4MgU8moVVvmcfXmRwhDt8b4ql4Vk01zvgDSpIbxxwySLp4AznZI
   WlBCKDPrS+iA7uP+FnLIMDBxhihVag5jnq8DAP2NBOTSOPzL13oe/apqj
   5Frpsxy35Av18rgD+kzZRXNvQWgF6iFCoep4s1fFF2mlvq0zWYOzyYOOr
   w==;
X-CSE-ConnectionGUID: j42vVq/RTe+RgO9iyvAVFQ==
X-CSE-MsgGUID: lMLcAgmuT/yRUAUiXDCdAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66137726"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66137726"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 15:13:32 -0800
X-CSE-ConnectionGUID: wAZj4vrZQqG7yxBmDQve5A==
X-CSE-MsgGUID: opQESoMwTsmvUbY5uHd5ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="193173105"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 26 Nov 2025 15:13:31 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOOhV-000000001Y1-066I
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 23:13:29 +0000
Date: Thu, 27 Nov 2025 00:12:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-vfs:vfs-6.19.misc 13/29] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'to'
Message-ID: <202511270025.MCsyDIuO-lkp@intel.com>
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
TO: Davidlohr Bueso <dave@stgolabs.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.19.misc
head:   f403e1206b70e6790b2e2409747dd95ce5aa39c5
commit: c29383a874ee86af1c68488f15f88544140414fe [13/29] watch_queue: Use local kmap in post_one_notification()
:::::: branch date: 9 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270025.MCsyDIuO-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#12: 
is planned to to be removed[1].

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
