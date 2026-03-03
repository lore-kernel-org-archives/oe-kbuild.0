Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A3837189D
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Mar 2026 14:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772546664; cv=none; b=R+y9qvPvvYAkC4mayLFvF1pU6U/wDsU7Qgad0txTn83z2pOiqzGp1dXYK36+EMs4zMaWiW0/bkk9I1PnTza+aQXm/XiIU1qMNlCmiOqCHGOTCqxiVCSriPTtAyycaBBsxa1BxZU/PnW9tajd9DhOELf2qaaz5Z+fzseZXJLD4i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772546664; c=relaxed/simple;
	bh=l96Ah4FvbJs2hb7t5CyqZll4rAbnk054h2tgmoM3+aI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MaWkiCQoHhgWAFKSdr8jFwfXtBRm/ThUCLQy6eE9SE0UVZLAdcrJXWiFYvro5VY9NKQILLIfZJqXXoBnsnz7Y4SRv6c1KvOlExuAmVhI7LE8LwHbMeuWOtUMWG6YRQmlPvLNg9CfacTL7LJVHHKUf8oQDLWGC9T7yr8+r5quo1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KGdioHGE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KGdioHGE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772546663; x=1804082663;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=l96Ah4FvbJs2hb7t5CyqZll4rAbnk054h2tgmoM3+aI=;
  b=KGdioHGEt4e9WBdKPI33AntSnQuREct9DC7iyPH1oKVcCYuoj/btZEpz
   SKoZPLSI9YgS7yEeKGccvB81dLhggWK6U4ulqEJteVR5CGqUwkM+BggmK
   zfwSVROrXHiXVSoYyDRramOeUDoE/SjtZT0gcWs47ubNKDH3u6TCUfc1j
   CRyAFWHSFySWl3T7R7D+WE62qKhhwexkAbY1FyjWVvwJqheG88ymde5vR
   k73dmDqC/1r+ia5itE/3Fz6gR8CqgzuGuMw9jMKF/TpRXZZ8/FxTQAwDj
   re3wc8tM8N1t7qZYwHGCsqsVAp18y/VW+/U+Qt4cq56Q/cdTg/p5+OJYC
   w==;
X-CSE-ConnectionGUID: exLKLkgxQxyKEh1PExvhew==
X-CSE-MsgGUID: A4vQR7nzSfOWJbIKmyAu+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11718"; a="73494947"
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="73494947"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 06:04:18 -0800
X-CSE-ConnectionGUID: EYLZyGA/S6O+xVjtnsvqYA==
X-CSE-MsgGUID: Ahr50MZqQIqXMhrPQsPjvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,322,1763452800"; 
   d="scan'208";a="215514775"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 03 Mar 2026 06:04:17 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxQMB-000000001TC-2RVD
	for oe-kbuild@lists.linux.dev;
	Tue, 03 Mar 2026 14:04:15 +0000
Date: Tue, 3 Mar 2026 15:03:31 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v3 3/4] drm/xe: Split TLB invalidation into submit and
 wait steps
Message-ID: <202603031501.fPtJyqCH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260303133409.11609-4-thomas.hellstrom@linux.intel.com>
References: <20260303133409.11609-4-thomas.hellstrom@linux.intel.com>
TO: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
TO: intel-xe@lists.freedesktop.org

Hi Thomas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/mm-mmu_notifier-Allow-two-pass-struct-mmu_interval_notifiers/20260303-213841
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20260303133409.11609-4-thomas.hellstrom%40linux.intel.com
patch subject: [PATCH v3 3/4] drm/xe: Split TLB invalidation into submit and wait steps
:::::: branch date: 23 minutes ago
:::::: commit date: 23 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260303/202603031501.fPtJyqCH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'GitHub Copilot:claude-sonnet-4.6'
#26: 
Assisted-by: GitHub Copilot:claude-sonnet-4.6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
