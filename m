Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE31EB46
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 04:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726980199; cv=none; b=FY5tRI3nkNkJg+S4zn1HuuN3+vl6pcjBtqMi4SKqVH41g1p3rPQlX2eovb+xBTRRA/mT2aT5i48bQW6ke4S2+Jmtx/vBWd4kkmb5jxPQ/ilICkKez4YeRveElbwepW3X1zaAkKWs1tzqkMlAIzr3m6+a0M9Nh6fKN/Q+nylMaxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726980199; c=relaxed/simple;
	bh=mNUE1ez8y+C7QZVqP/csQ7dYRo2jCr+U5WDx2LD2JYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNRMsQ4KkypWAXP5vIab+4MEKOqurWh+ZFKHbr2EJDgIGiJkZN3PfQTrKhoMbaf+h95l5OLnNq7tWcZshJNhTcHC46S8oBdOPQ+RBMS6vQtqxE+auWCHO10nieIhlDbxGsn0KguQLJ0ycgh8jfzgExhDke0TUDCp9XsLQF3XDeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VQPl9seS; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VQPl9seS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726980197; x=1758516197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mNUE1ez8y+C7QZVqP/csQ7dYRo2jCr+U5WDx2LD2JYk=;
  b=VQPl9seS51hhR08H/ph5K4OtBUOpS6/ECLl9wSulP08QMjMDtaECW4Bw
   TG0eVqaqZ3cQ2Vw1anKRCDj3p1il9fMbhKtVf41XtPRB/p1U5F7CXlqpp
   SosLQz9pOhB5Ico921g04SBymJ7KDSMu0P/wz6s2+1QlwerHnDTHB+Ctm
   epW/RPORworpMOqjRe7M9uvFgkPzIVxFnV3zqIKrf9RzgXvLQyYa5dI0M
   XTPkT9QRX32NnaKawlAYTw6caqOOIe7zYCdRQbm9yLrnNt6KRq6iwgRd3
   wdgJZqTP5QuriUVDjYTCTMKvuB1NahQ9ysIssnejXtxouOH2rrbYcU3re
   w==;
X-CSE-ConnectionGUID: Y6Qpr1oLR/SF22DmEZpQbw==
X-CSE-MsgGUID: qdWM/xElQSWJVLI4cbiaew==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25893476"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="25893476"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 21:43:16 -0700
X-CSE-ConnectionGUID: rkzZVmK3RSqk/yG2mSaShQ==
X-CSE-MsgGUID: U1LyKPjsTimXZNLlfi5ItA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="108153733"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Sep 2024 21:43:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssERE-000G2A-2m;
	Sun, 22 Sep 2024 04:43:12 +0000
Date: Sun, 22 Sep 2024 12:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath12k-mlo 23/64] net/wireless/core.c:719
 wiphy_verify_combinations() error: uninitialized symbol 'ret'.
Message-ID: <202409221252.ChfLmJcT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Jeff Johnson <jjohnson@kernel.org>
CC: Kalle Valo <kvalo@kernel.org>
CC: ath12k@lists.infradead.org
TO: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo
head:   71a66ca2c46d815d17e234a10726ca6c94af5272
commit: aa7a766fe400cb792a183e8e488eb14904aabf73 [23/64] wifi: cfg80211: check radio iface combination for multi radio per wiphy
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221252.ChfLmJcT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409221252.ChfLmJcT-lkp@intel.com/

smatch warnings:
net/wireless/core.c:719 wiphy_verify_combinations() error: uninitialized symbol 'ret'.

vim +/ret +719 net/wireless/core.c

7527a782e187d12 Johannes Berg          2011-05-13  698  
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  699  static int wiphy_verify_combinations(struct wiphy *wiphy)
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  700  {
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  701  	int i, ret;
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  702  
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  703  	if (wiphy->n_radio) {
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  704  		for (i = 0; i < wiphy->n_radio; i++) {
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  705  			const struct wiphy_radio *radio = &wiphy->radio[i];
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  706  
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  707  			ret = wiphy_verify_iface_combinations(wiphy,
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  708  							      radio->iface_combinations,
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  709  							      radio->n_iface_combinations);
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  710  			if (ret)
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  711  				return ret;
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  712  		}
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  713  	} else {
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  714  		ret = wiphy_verify_iface_combinations(wiphy,
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  715  						      wiphy->iface_combinations,
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  716  						      wiphy->n_iface_combinations);
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  717  	}
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  718  
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15 @719  	return ret;
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  720  }
aa7a766fe400cb7 Karthikeyan Periyasamy 2024-07-15  721  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
