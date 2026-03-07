Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B053126C4
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 06:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772866089; cv=none; b=AONskuFfJYKMUqlKcsf30VbYywnT82im08KIKdA+Kh9/jP1JIYvlACzw20WZOdZQeHefI1k8vQIOl8cKBRQRYPhDmfKE5ET+lnqT+WIGlUlGW6y8t73wMxqTIRzVOGlphS1gjLjlc7Y0/PkfAL3qF/yVRzH4NIRUpLDjgDeTCVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772866089; c=relaxed/simple;
	bh=8ttfz7zY4HjOtYqYcrZUff8piSq9dLOeigrstVN0OB4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uJhmBe3NCU0vTVqBdxQpwNwISrbRCF0xxHayTYS+ey9HS//73gcb7FIIZpO9UKz+q0Ype2t9Tq5jtxu6jcaqc1+EucXFm6GoDmj/lBfyAwpUQ+LRccYwWQYOWqSSY/HOntVg4LWBJh6ZDWntPIIP/hgtlGzCO3F3eSdBv1Ha/5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQBgGzN6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQBgGzN6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772866087; x=1804402087;
  h=date:from:to:subject:message-id:mime-version;
  bh=8ttfz7zY4HjOtYqYcrZUff8piSq9dLOeigrstVN0OB4=;
  b=hQBgGzN6Ge+e0MOAUEWAF1VWKxCX8ObMgcK7qGKoN6OuIS11hmNwNlj1
   p5sbfgW91a9RXxgC1zas5q5WturUCeYvuo+g2MsPmuPsILerXlLpqAYoy
   pXwj1dROwUZ54DkSJRHAbpkufhxZsYnxvDghvUbAH75eU1az21pghdUZU
   H2WZrnrzI8eITtpscKYbCZiFgyDAVt2fWPOTckWVaKiudKl/5qtWbqpQy
   4G3ScrUGq2tkfAkpJtFWdi49ydGN4hXa6DrQ0f3zh7NLMFXjSBHLrDQVT
   NuaUJtdIek5TSf4+itBohlI11dKgh19Y/2csSvC7ndcpDKrd2Hw6h5kXr
   w==;
X-CSE-ConnectionGUID: FG+vxc7WQLKj6iA9xCqJmw==
X-CSE-MsgGUID: +4PrT8lsSoa39NYnzRxNcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84295564"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="84295564"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 22:48:07 -0800
X-CSE-ConnectionGUID: XT3ieEjLQrS4CDYmznG0vw==
X-CSE-MsgGUID: jP5h7cQYSKGvy4K30PY1KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="216938489"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 06 Mar 2026 22:48:06 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vylSG-000000002RF-1RxL
	for oe-kbuild@lists.linux.dev;
	Sat, 07 Mar 2026 06:48:04 +0000
Date: Sat, 7 Mar 2026 07:47:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v7 04/29] drm/sched: Add some scheduling quality unit
 tests
Message-ID: <202603070709.PgjV8bJs-lkp@intel.com>
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
In-Reply-To: <20260306163445.97243-5-tvrtko.ursulin@igalia.com>
References: <20260306163445.97243-5-tvrtko.ursulin@igalia.com>
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
patch link:    https://lore.kernel.org/r/20260306163445.97243-5-tvrtko.ursulin%40igalia.com
patch subject: [PATCH v7 04/29] drm/sched: Add some scheduling quality unit tests
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260307/202603070709.PgjV8bJs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'scheduler'
#146: FILE: drivers/gpu/drm/scheduler/tests/tests_scheduler.c:12:
+ * DRM scheduler scheduler tests exercise load balancing decisions ie. entity

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
