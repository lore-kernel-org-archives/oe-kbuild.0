Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56DA91D5CF2
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 08:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769674737; cv=none; b=G3Fr23XMdINeNBmPrMTgdV1cG1mWcZV96AoFwQkI+6n8fpuJzIswEWwVD/ZEMs70559RmjUQi46LhaaAeBwBuFkno95uyGFQ3aAoUaUEj+YB471aLcRY4dzPZjv9ZQBK1y1bgAYeW7IG4J+JY8uLfPJ+f3R6oM2Dg8jnLPeOHPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769674737; c=relaxed/simple;
	bh=b/SlOFBq9jMp3AP/iszmyg4S/b31GrLCXauYNmA0omc=;
	h=Date:From:To:Subject:Message-ID; b=IVy8Ac5RJaXZePh6KGVYE6AcFJ6RoCIICt+87OU9KEhCryciyQXAO9bcKswhN2jIwH1z6xqhhtKibi95uu7AETeLwfs+kp9/MkbY24rBTkpBtXj0+Apbj7JxySFM00Y+hAfEILBXxRjkcbP8slYhLDUAfB1LjGFRvEt4S608adM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DeRpUl5D; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DeRpUl5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769674735; x=1801210735;
  h=date:from:to:subject:message-id;
  bh=b/SlOFBq9jMp3AP/iszmyg4S/b31GrLCXauYNmA0omc=;
  b=DeRpUl5DMLzqy4CMiPeQHHc56xMWhM8ha6rSJqXA+oXkqYB7sMlg1WWk
   XoKvq6ynniGi/OVClk4m08lGaqic2l09Fh2aK0YG0pTXmVnTcQlgfGHXy
   r6NqxEOdFbiOQ0BI4FtyeTYBf2BtV/rEdir/rJhWKKBcEV700+VclMHES
   IIkctCiZK87wiVl93SlDaSZ9T/dK33wUqGKs7xDn4ybJC4hyi5GzBAl9Q
   TF/IC4babhOwKUaG7Ccd6/cyKrufgqbrtQeBlpLuy7rsKQegxLnZein5w
   jxuY4SK1OtT0+HojbmjEitbfmX073PZRin/RRP3f02/J08ymeBp2sksLC
   g==;
X-CSE-ConnectionGUID: VCNE94p3TuyW6aAPIeFPKg==
X-CSE-MsgGUID: jq1AWK+zT9Oj0MewBypafg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="96367466"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="96367466"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2026 00:18:54 -0800
X-CSE-ConnectionGUID: Wr7qs1/ZTa+3lnyKp36jeg==
X-CSE-MsgGUID: ULL+wqk2TK2DYvcc8jcdmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208111783"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jan 2026 00:18:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlNEp-000000002E1-3obe
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 08:18:51 +0000
Date: Thu, 29 Jan 2026 09:18:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [agd5f:drm-next 1/27] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'is'
Message-ID: <202601290939.9SIFWQFu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git drm-next
head:   ba205ac3d6e83f56c4f824f23f1b4522cb844ff3
commit: f7e06786512e730f750138b1221b6342bcf07859 [1/27] drm/amdgpu/mes: Remove idr leftovers v2
:::::: branch date: 11 hours ago
:::::: commit date: 33 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601290939.9SIFWQFu-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#15: 
be using it, but is is unreachable since nothing ever allocates the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
