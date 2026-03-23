Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E14F29D26E
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 04:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774241883; cv=none; b=ItEyMwNkUnDsmRDLwveeCpqOzWJv2brGYpUGYTelRuaKh5UlHeP3M48lLHZnCwN86eR+20Qbn6YcnZ5rS+FJbTCFC9pB1r1RmRgKpN4LdpSWgwZQb2jut1SY8ihGUi8whsoWie5d2ACVl/iHnPEzK4Hx1/u+Zk1iCMof+vf5GZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774241883; c=relaxed/simple;
	bh=AbAbXum2jNmtaZcTN2jMWegerz9gN297CVIgoF+DGb8=;
	h=Date:From:To:Subject:Message-ID; b=iEkvaQbY/yNQOSTrz2FfEq0Y+JLPdo+0Qo/nZ1W/v0h+B68xOvwvEK9+gPcS/Z8UQBttSiDtzGr6gWwvn8Uqaf7cgrVSRQ8KUBvTVKUyvZZbvs6UyoX7HMdLjSIm8Fk4DuCZFlQqde01+CDdVxq0JL7rkXq4H0NpClSf4Gs1l94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=luYC85Yw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="luYC85Yw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774241882; x=1805777882;
  h=date:from:to:subject:message-id;
  bh=AbAbXum2jNmtaZcTN2jMWegerz9gN297CVIgoF+DGb8=;
  b=luYC85Ywizc1/IWiiIaWPS5kJsv2f98NgzfTDv84yQHyJIJlfA1qL0N2
   JGenvngmCNGH2fObRZY7Oq5eE30xn6fa0FEPuc6uM7Q60AhvphVACqfRF
   A/HQpsuIKJc79pbYNyTwWHUcqgpO8Qp7SckwYkk+wDfmBiGb1i1kXr9Ki
   U2zI8wPieW9LXVz9HicoexGp013CoufoguNAkyr3BKnGicB368kymH5um
   h/PVxWZF67xoW3PuY2mpdKMPni64SSEm5cE64qwMRrngKRWM/cXao/MIe
   jSubDQnhdLPc8to68iQvTL6/yfno2+0VynvN8sKiPrHr+w0igWnu5RZp7
   A==;
X-CSE-ConnectionGUID: Frl7gQa9SbiChnPd8XHD9g==
X-CSE-MsgGUID: HAbie0mkSYS7fUlXE68xvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75117408"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="75117408"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2026 21:58:02 -0700
X-CSE-ConnectionGUID: +m2+VbWjRGeOs+zIVb45+w==
X-CSE-MsgGUID: guKy32EUSkue94vsOPxXYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; 
   d="scan'208";a="222980093"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 22 Mar 2026 21:58:02 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4XMV-000000006Yf-1TFO
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Mar 2026 04:57:59 +0000
Date: Mon, 23 Mar 2026 05:57:15 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [mdraid:md-7.1 6/10] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'missing'
Message-ID: <202603230557.4BGKJmyj-lkp@intel.com>
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
TO: FengWei Shih <dannyshih@synology.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mdraid/linux md-7.1
head:   6f507eb2bb5491327fe634dc23558d4ca5d710b8
commit: 52e4324935be917f8f3267354b3cc06bb8ffcec1 [6/10] md/raid5: skip 2-failure compute when other disk is R5_LOCKED
:::::: branch date: 11 hours ago
:::::: commit date: 27 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260323/202603230557.4BGKJmyj-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'missing'
#20: 
  mdadm -C /dev/md0 -l6 -n6 -R -f /dev/loop[0-3] missing missing

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
