Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5B13246EC
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069304; cv=none; b=eiknU+Yu333kiYOkw7jnj8wRXTRZBidljPLya6pBlSwTyS+F+aeJ3KjspeYD9YzvdCHTeFJpW23Y2yQK9jLUrePhcbPeNSITh0M/rzNkKQcyGxCUCPk+NBBDj8qxKoPrt7cnkl4WUVozS2d1yWpq+FqloA3YqOpCS0GZYRyaqOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069304; c=relaxed/simple;
	bh=rV30BjVo0n2FgR5xGLC+k5nVjXChpyyjyIlnzjwYXKg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pVpwCc12LS3i1K9AZDWlfI8FAaWZ3ifuvHpAfXK+UR1VkmwsVWXGw8PlbF+E9mZRg2WgJokaEGzY9l0LHFKToP2Gr3tWsOpujzzufzyOdJQWXKreFLg3Wuf+Ym1CW/nzYggNF6etUO1Bx7xrqEYxHVkYeSTCP5XrOD+tpYZhw0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDbaOISj; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDbaOISj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069303; x=1794605303;
  h=date:from:to:subject:message-id:mime-version;
  bh=rV30BjVo0n2FgR5xGLC+k5nVjXChpyyjyIlnzjwYXKg=;
  b=cDbaOISjPoxaYBHcRYOUjLAO9oA4tokqgtSQ6PQYrjOymPcdcFRX6mJo
   6Sd9CWqhTEXQlm/ht4TvEKp/utVGYbClKrCBuzzB+erAf6yPO+w9Kjn1u
   nRDNPKiT0GGi4oj27T0rnHRdP8O/Jjgh7kfbSneltxJwtjQNXRSvn1+Z5
   5K66rNrVCe1MQlgdhznpkIVzLVqw4SQF+mTIWWXNPx03NwKcM9yMhve7S
   Exe633+iMZIQRULZrIFN5o+g8jdJ9sFFwis1n7mtEvdJ9MlhqoW2yneZZ
   w/ro3V9ACKtADfj9D/wjf6+BjvANUKKjs1Wqgzq2wN4R3Wtr1A8MGZJ/e
   A==;
X-CSE-ConnectionGUID: BdavvG5QSpqZUaD3cX+d3g==
X-CSE-MsgGUID: Nq350lL4Q2uPTKL/xBlfQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="90637520"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="90637520"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:28:17 -0800
X-CSE-ConnectionGUID: NrMLS1+IQ72mi/3vj2V3ow==
X-CSE-MsgGUID: qh+CRJ20SpWxKTdZsYMjFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="190035935"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 13 Nov 2025 13:28:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJerW-000000001A9-2VWD
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:28:14 +0000
Date: Thu, 13 Nov 2025 22:27:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 605/867] checkpatch:
 WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or
 return
Message-ID: <202511131902.dqXEryYL-lkp@intel.com>
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
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 070d2bc7add0280eda84fc77cdf894f4056958d8 [605/867] bcachefs: Clean up extent ptr helpers
:::::: branch date: 2 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131902.dqXEryYL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131902.dqXEryYL-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:UNNECESSARY_ELSE: else is not generally useful after a break or return
#54: FILE: fs/bcachefs/data/extents.c:762:
+		return bkey_s_c_to_reservation(k).v->nr_replicas;
+	} else {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
