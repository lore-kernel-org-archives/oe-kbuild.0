Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD61227EC7C
	for <oe-kbuild@lists.linux.dev>; Thu, 10 Sep 2026 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789002352; cv=none; b=qZlDSV2B/O698Se61LuaXnz0/9Lk3NsUStGYwH+a8Ersx/OXDjb02owCUTCvhRRgsQFql0mR9QW2ER3Hy5PBhO5XKrg8nGOaLk/YBtxYOcBQ1cK4M+BHpg6dwg2PKXNRJW+vqS5Ot683t82e/nx8hHnyMGRINt3flK9M17E+ka8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789002352; c=relaxed/simple;
	bh=7/4ofKDBVhf56xC+9sSFU2MAzRzCTHYfn3/uqWpRc9U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kBvhg2xHPZhLOMNYFLwi3iuBvmTNGdRBIxV8nWAiCPbpvmoZw03uDLhPR8bCOh8FSsHkn7WOE6bW1aBJNp6yuz1RIJ0q2bKsqv03zyDZCZN8W8s1GGjlIdVWRySldP1JRhY7Dev5Evp8iDzXZf1uEVyJnhGce1V92lGouX/UDew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5KFvdcg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5KFvdcg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789002351; x=1820538351;
  h=date:from:to:cc:subject:message-id;
  bh=7/4ofKDBVhf56xC+9sSFU2MAzRzCTHYfn3/uqWpRc9U=;
  b=I5KFvdcgimedgWWUpGe9Kw+Q3f9t8tA82tPhOxe0Cwo0n3Gnn495wVqg
   gCNp4CME+u5k02F0ldjjl2xZ6hT1mvOagUzv7dmXFV4XRix+SAbAmLqBi
   0Jhuk5wx64VJ4mbyFP6lPMlbgjvr54rLY5aOXaR5LYjnb9n0qC1J0ov3x
   8Ta4rtJl9KEzADHWJaP1gEhr6yGRQp2Heqbgu1g4dw40pZFgXD/a74MXY
   0YThdSrSo8GZh1JaiIC/A3IT2OcdVvLpTCif3/6TgeSh0x4TMm+VBAcsM
   dsZgmNZEYjFXQviY31iQ7tIbdcwWghTsBueMNt+LSSihWtIMA/jDMuEpD
   g==;
X-CSE-ConnectionGUID: uxgVs/U1Tt+22jVsNbwkxQ==
X-CSE-MsgGUID: 8Fx6vL5eTwy7XOZjWl98TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89474843"
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="89474843"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 18:05:50 -0700
X-CSE-ConnectionGUID: q345XmC/R9q4ewey7QbLlw==
X-CSE-MsgGUID: 7qwPOPYaR8STxHyBZjhpqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,271,1779174000"; 
   d="scan'208";a="301385368"
Received: from lkp-server01.sh.intel.com (HELO a3e91e2cf319) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Sep 2026 18:05:49 -0700
Received: from kbuild by a3e91e2cf319 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4TEZ-000000001BK-0nwn;
	Thu, 10 Sep 2026 01:05:47 +0000
Date: Thu, 10 Sep 2026 09:05:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/wireless/nl80211.c:19576:7: error: use of undeclared
 identifier 'n_dl_tids'
Message-ID: <202609100921.T1b3g7D0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Pooventhiran-G/net-skbuff-Add-SKB-extension-support-to-wireless-drivers/20260908-223929, commit: 5759d7244ab491b9e71de0281e62985f9db9ea7a"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
CC: 0day robot <lkp@intel.com>
CC: Aditya Sathish <asathish@qti.qualcomm.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Pooventhiran-G/net-skbuff-Add-SKB-extension-support-to-wireless-drivers/20260908-223929
head:   682493f4354196bc329dcf05f25bbd6d7a63dea0
commit: 5759d7244ab491b9e71de0281e62985f9db9ea7a wifi: nl80211: Pack SMD dynamic context along with frame
date:   32 hours ago
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260910/202609100921.T1b3g7D0-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260910/202609100921.T1b3g7D0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609100921.T1b3g7D0-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/wireless/nl80211.c:19576:7: error: use of undeclared identifier 'n_dl_tids'
    19576 |         n += n_dl_tids * (nla_total_size(0) + /* tid nest header */
          |              ^~~~~~~~~
   1 error generated.


vim +/n_dl_tids +19576 net/wireless/nl80211.c

904c277342936b Ilan Peer      2025-01-02  19570  
5759d7244ab491 Pooventhiran G 2026-09-08  19571  static size_t _nl80211_smd_ctx_nl_ba_param_size(void)
5759d7244ab491 Pooventhiran G 2026-09-08  19572  {
5759d7244ab491 Pooventhiran G 2026-09-08  19573  	size_t n = 0;
5759d7244ab491 Pooventhiran G 2026-09-08  19574  
5759d7244ab491 Pooventhiran G 2026-09-08  19575  	n += nla_total_size(0); /* ba_params nest header */
5759d7244ab491 Pooventhiran G 2026-09-08 @19576  	n += n_dl_tids * (nla_total_size(0) + /* tid nest header */
5759d7244ab491 Pooventhiran G 2026-09-08  19577  			nla_total_size(sizeof(u16)) + /* buff_size */
5759d7244ab491 Pooventhiran G 2026-09-08  19578  			nla_total_size(sizeof(u8)) + /* policy */
5759d7244ab491 Pooventhiran G 2026-09-08  19579  			nla_total_size(0) + /* amsdu_support */
5759d7244ab491 Pooventhiran G 2026-09-08  19580  			nla_total_size(sizeof(u16)) + /* timeout */
5759d7244ab491 Pooventhiran G 2026-09-08  19581  			nla_total_size(0) + /* ext_no_frag */
5759d7244ab491 Pooventhiran G 2026-09-08  19582  			nla_total_size(sizeof(u8)) + /* ext_frag_lvl */
5759d7244ab491 Pooventhiran G 2026-09-08  19583  			nla_total_size(sizeof(u16))); /* ext_buff_size */
5759d7244ab491 Pooventhiran G 2026-09-08  19584  
5759d7244ab491 Pooventhiran G 2026-09-08  19585  	return n;
5759d7244ab491 Pooventhiran G 2026-09-08  19586  }
5759d7244ab491 Pooventhiran G 2026-09-08  19587  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
