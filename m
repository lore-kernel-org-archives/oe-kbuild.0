Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377DD3C3431
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 10:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774435533; cv=none; b=PAa6+f0s6ueaesPxpo7qDwWi7JGn5aY7oLk9IWF73SLQfuXZcNPY8Nvsq4HkbW3+F11sm82C+esMnKlQLGZPXcvTZAsDNxj2YqB+uIYgovxadqAWAev+8afmejJ5mYQpC+VgqrbIsiB3IPfpUqN0Q0TJ8dyHZHXv012J25nsMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774435533; c=relaxed/simple;
	bh=3VzFzDz6Npx3QsflxatFoYArF/M2nQAyTihtD2qYlng=;
	h=Date:From:To:Subject:Message-ID; b=KthiggqGj2y0B+HZTsSn0aSjU81ZowHY1q1v5/GizgQiHxz2lnW+Ml0nkTxYG6G6//W8zWcGSevXFC7Zj847fIHgukYCGEstoVmZBFRkT3rhewbNz/WSe8+9lZyKC2Qm1Ddp1DIe0jCFA9kNcIDv60a6os9ErxYWRI6XmM04lH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eb8Yex4f; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eb8Yex4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774435531; x=1805971531;
  h=date:from:to:subject:message-id;
  bh=3VzFzDz6Npx3QsflxatFoYArF/M2nQAyTihtD2qYlng=;
  b=eb8Yex4fLSigCndkMJauRld9Uu47oWd6fF4zBs094EZLQ/Mj/4sEAGGm
   dHDf1UfTLc8Jn9UNcbrdyN8PX0F8pxG9Bw3pQPoB2ry/Ur7Qb/GKu7YYq
   5FtGDGSDI02HnVDy/0m3KmsXnj+QOyDhwy0UW0SxXur4M72sVSW6VhPRI
   EnsGd3Wyd/15wkVMk2LSmOD5zf+jNGdRlGqwgRnd5PsUr0R+C1YV6ehQr
   7TsJq3LUYg0N3Nen6prmLs5SZP77JTGHLTG2MGrxIvELZemYQwOGuZXM8
   1CGGI6bnXRYQaxlqH17nkNJBkwd1YgjP1tX6v2Qbnn2S0LKGrr2tgGNo4
   g==;
X-CSE-ConnectionGUID: t2DHphQbSSKlNeGRw3RZDQ==
X-CSE-MsgGUID: asOHffkHRqSN5p8EXTUH4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75350838"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75350838"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 03:45:30 -0700
X-CSE-ConnectionGUID: 2BICrF4MSAWaCT1RNGvtnw==
X-CSE-MsgGUID: 3aEWUrQhR6KePrOi4p1N5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="255148000"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Mar 2026 03:45:30 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5Ljr-0000000074v-3w2p
	for oe-kbuild@lists.linux.dev;
	Wed, 25 Mar 2026 10:45:27 +0000
Date: Wed, 25 Mar 2026 11:44:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [iwlwifi-next:mac80211_candidate 53/62] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202603251115.GICal84v-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Benjamin Berg <benjamin.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git mac80211_candidate
head:   47d0a775695d43aa2479bb666153f37ffae08779
commit: 165115c3e3e12a6ffeabd5cea420c70dd208a275 [53/62] wifi: mac80211_hwsim: implement NAN synchronization
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260325/202603251115.GICal84v-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#211: FILE: drivers/net/wireless/virtual/mac80211_hwsim_nan.c:131:
+		u64 tsf = mac80211_hwsim_get_tsf(hw, data->nan.device_vif);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
