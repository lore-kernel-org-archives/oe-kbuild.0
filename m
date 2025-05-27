Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7472F1E0B62
	for <oe-kbuild@lists.linux.dev>; Tue, 27 May 2025 19:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748375670; cv=none; b=d3L6n2vuaFDUmlL06R/Oluw+NjDAwoyCCcj1k7klCsW4je7cw010Al1XaIC26Wym7GStaJLO5PTjNNteg8Sk30cs5PkoS9eVTpnLKYbp8EIRqpNp0Pt51D10DRTPEFmEBcTT4BVMDmJtkl2Nb4AlIvveMtU2ulO6IgTt+9W4DSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748375670; c=relaxed/simple;
	bh=CTN7AMQABHANNGkWijOq0V0frXiQje1B8iE+fZI3Vls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Eki8eHb7WckjjVEgRhg1ABYDPGL7rQhOirsGVwDzeww5tnvDSJf9H/8m6F3Y+rMK/4j4hImLMG4jiFwBQP8gRDeVzTufEmdUYZgst91njUgkZfnFCE0vPJlmWp+Ligi3WY7RKZ4r+XDtPo0eceZPLzdN5kMZgnzcLeclcSanaT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HcgYC1+A; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HcgYC1+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748375669; x=1779911669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CTN7AMQABHANNGkWijOq0V0frXiQje1B8iE+fZI3Vls=;
  b=HcgYC1+A7/VY12T79tUgyYVa5hdrcoZk+5RBopFeJSQXZaHgmhupvxu4
   bvp4kxRs2wLBEP1JDMplX+avkqumQfzfYFgXIJ75gZbCaqiXQ5INQi/eY
   qyn/HpkYweo0eB9KMEp4YFPYj73RVSED4r96NMbiu74yIHYWwFMf/1Opp
   y1AHMnRCK2HrcuswfmCVyM9UBZyyDt6mPzCBLYop5uiiBoZntXD1izsqu
   MTf8HnHSzs1NAH7szHuY1QGWdHfhZ8lADxat+EVDurfVFfh/TTO0OfkUw
   onusPB695YWQ+J1UHxU6Nj1j4HkcgAy7kVG7xZk0V5Sr4CGm1CMaHHgIF
   w==;
X-CSE-ConnectionGUID: 44jqkxMgSbytfq96+6rZXA==
X-CSE-MsgGUID: Brsn62SPSwCJsi5VEC2XsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="60635882"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="60635882"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2025 12:54:26 -0700
X-CSE-ConnectionGUID: XoRXJ8htQF+BS+jY1v80/w==
X-CSE-MsgGUID: AOAZLhIATHqU1XOx3ZE2Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; 
   d="scan'208";a="142928248"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 May 2025 12:54:25 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uK0NT-000UyH-0p;
	Tue, 27 May 2025 19:54:23 +0000
Date: Wed, 28 May 2025 03:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/bcachefs/btree_key_cache.o: warning: objtool:
 bch2_btree_path_traverse_cached+0x7c: unreachable instruction
Message-ID: <202505280300.4O9Rdv7R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b1456f6dc167f7f101746e495bede2bac3d0e19f
commit: 49771a7578cdfb73ca957dc1ca9516872c8b406b bcachefs: Fix bch2_btree_path_traverse_cached() when paths realloced
date:   10 days ago
:::::: branch date: 4 hours ago
:::::: commit date: 10 days ago
config: loongarch-randconfig-r063-20250522 (https://download.01.org/0day-ci/archive/20250528/202505280300.4O9Rdv7R-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250528/202505280300.4O9Rdv7R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505280300.4O9Rdv7R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/bcachefs/btree_key_cache.o: warning: objtool: btree_key_cache_flush_pos.constprop.0+0x1f4: unreachable instruction
   fs/bcachefs/btree_key_cache.o: warning: objtool: btree_key_cache_create+0x5dc: unreachable instruction
>> fs/bcachefs/btree_key_cache.o: warning: objtool: bch2_btree_path_traverse_cached+0x7c: unreachable instruction
   fs/bcachefs/btree_key_cache.o: warning: objtool: bch2_btree_insert_key_cached+0x9c: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
