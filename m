Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2213327442
	for <oe-kbuild@lists.linux.dev>; Sun, 28 Dec 2025 01:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766885749; cv=none; b=iJWjJvS65KNu095Ow+FxSdsvrBpOxshqlL8EM7RebblAx8j3buQJG8BbQoGkLa1w1voI9i4twxjvXImCIhDraPjCryvkCMObflNM5YAipGYUs6WIcHKqrbIIuqbNJnXFIIROeKeAl3jwCWXwYI7RWJaycPAU6k2YDGjnw0+HVkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766885749; c=relaxed/simple;
	bh=Sg58nesoZ78RhhXTl4fcVuGuAN6vauf8SkaHjNHCxSs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G7e8EKqZHqQ02PId5StlM7Q0BG8lvzKQlX2PrKOrhvTUppjAQajgX9JjEkPvO4VBA4BD3G+MDQ1QiguVAPK91RpN5MLPeOwkCGzmiRY9onUUCP8roMzTDzqMbQ/NjiIDn9bsywTHceeAG4tFcfgNM8iMfbFB5bGGFfi400FZsh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGdV8Ja5; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGdV8Ja5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766885749; x=1798421749;
  h=date:from:to:subject:message-id:mime-version;
  bh=Sg58nesoZ78RhhXTl4fcVuGuAN6vauf8SkaHjNHCxSs=;
  b=HGdV8Ja5tYPlEt2sI2B8Y31luYmwf4rHB7i8oLHYHJFg8Zc3L0M9C3cm
   GPMnvmVTmENnWUFJsMm4HxkHU9SIqtb2+QvmRzkj0kXKmO5PMcOwtviyS
   uaWMaQtXTFbazFmhJdvTqkknxGwnLDZit926rD90Io81DmlGrmFgCs7qM
   IUlR3u7u9GbDvgX0n9E5VdWufW7H0j+aAHrk1QoYUXBWm1Iug8TFLLUtd
   +ReavANGeDJvAsr5lPPo6OY7yGhiZhedqG/94okWlK86ngH6ki4OH9n6D
   +UJOmvLF+tVbYCKNTYTBNRc+9FLClQV1n+tJLs6w0Zi1Src+Ay2szC/xh
   g==;
X-CSE-ConnectionGUID: 7aAVqffNS2eUDxxZ7aoe3A==
X-CSE-MsgGUID: cuM9x4vYRVSolNMI1lEo1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11654"; a="68448719"
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="68448719"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2025 17:35:47 -0800
X-CSE-ConnectionGUID: i5zMjhAIQoiN3GkayQPYIQ==
X-CSE-MsgGUID: tzfD9fkdTKWQMh8469h/aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,182,1763452800"; 
   d="scan'208";a="200601998"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 27 Dec 2025 17:35:46 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZfhA-000000007Lq-00NG
	for oe-kbuild@lists.linux.dev;
	Sun, 28 Dec 2025 01:35:44 +0000
Date: Sun, 28 Dec 2025 02:35:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH v1 6/7] NFSD: Add filehandle crypto functions and helpers
Message-ID: <202512280256.GTPtf4k7-lkp@intel.com>
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
In-Reply-To: <0688787cf4764d5add06c8ef1fecc9ea549573d7.1766848778.git.bcodding@hammerspace.com>
References: <0688787cf4764d5add06c8ef1fecc9ea549573d7.1766848778.git.bcodding@hammerspace.com>
TO: Benjamin Coddington <bcodding@hammerspace.com>
TO: Chuck Lever <chuck.lever@oracle.com>
TO: Jeff Layton <jlayton@kernel.org>
TO: NeilBrown <neil@brown.name>
TO: Trond Myklebust <trondmy@kernel.org>
TO: Anna Schumaker <anna@kernel.org>
TO: Benjamin Coddington <bcodding@hammerspace.com>

Hi Benjamin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Coddington/nfsd-Convert-export-flags-to-use-BIT-macro/20251228-010753
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/0688787cf4764d5add06c8ef1fecc9ea549573d7.1766848778.git.bcodding%40hammerspace.com
patch subject: [PATCH v1 6/7] NFSD: Add filehandle crypto functions and helpers
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251228/202512280256.GTPtf4k7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#160: FILE: fs/nfsd/nfsfh.c:251:
+		memset(iv, 0, sizeof(iv));;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
