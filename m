Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281B81D88D7
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Apr 2026 20:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775681271; cv=none; b=bkmM5k87ioTkdyp1DqspspHLh9rLIob69nHkIl6SfpY0FF/1shNR8BMOJiPZk0XGYE9KrEznup/KDVsxHPga+Y7/y+JvW6to8EkrkG0OkwKekz5nm0t8FiVClWbn45AoRrU9uOnWMr3OpTq7ZEI00+c6fspkRG3fGJh0oYKuLEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775681271; c=relaxed/simple;
	bh=Hyz84x5mkir5RT1sY49vz6P+TU+M6nYTAtr3DHCGUZ0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=da+p0zBtJJsv8W6HCI6scuCinlrze0bCmfza8cPyVqHYy6LYqWCt6cpz/KABcyGezOw7wpei51Nr74bkQOUnAnqWjWwBdlGMvK4ipnD9Jt4GrmkZ5v36g56/YoOWTF23s4LUZT6AM06favXjggppZVZxRgI35fqiDbpskV1eLnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kiUCmcsd; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kiUCmcsd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775681270; x=1807217270;
  h=date:from:to:subject:message-id:mime-version;
  bh=Hyz84x5mkir5RT1sY49vz6P+TU+M6nYTAtr3DHCGUZ0=;
  b=kiUCmcsdnhEPLQI/D7kV+l4EBR1xbDRtD9HwT3MQJbQ+tvEkqAsZG6X6
   yYewz9aR+9aqR4dUqMq9FbeEbUQO2hd12hcTkyvuiS7yaM+sY3be0+j40
   IqjGsZZ8MN3N2ZxcqUE9aIuvvAJobd5a5DgSeMsRChUBBCIpfa4n8YM90
   E2h+gP9Tla0QnK5PNDd7v/kUq6SO51d/i39eEt2T71cqV1Ffq9cmS3N+7
   06VvJRtFNHLqTNXItnETZZoMSOZZ2Yo0/TztStIvQyEnOWgXkQPUwqo9i
   urQjfrEeRez+4a3u3eR/JbZq+6+BiCjdPjFu1PoZ/kgDWTnIBO9oeypci
   w==;
X-CSE-ConnectionGUID: L1rD2SACTX61MZWEpKEwnQ==
X-CSE-MsgGUID: r2OpUjV0TWKVRqnKmW8Nzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11753"; a="76695004"
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="76695004"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 13:47:50 -0700
X-CSE-ConnectionGUID: XMWM9NVoRSKd0imIidPm5w==
X-CSE-MsgGUID: CnnE2TlMSxG3NzjJC66s9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,168,1770624000"; 
   d="scan'208";a="233455462"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Apr 2026 13:47:49 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wAZoR-00000000AVt-0Du9
	for oe-kbuild@lists.linux.dev;
	Wed, 08 Apr 2026 20:47:47 +0000
Date: Wed, 8 Apr 2026 22:46:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: fix heap buffer overflow in
 cfg80211_rtw_add_key
Message-ID: <202604082249.CcWXI0B7-lkp@intel.com>
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
In-Reply-To: <adQ4yU-Pc0uHXtb5@ans-MacBook-Pro.local>
References: <adQ4yU-Pc0uHXtb5@ans-MacBook-Pro.local>
TO: Feng Ning <feng@innora.ai>
TO: gregkh@linuxfoundation.org

Hi Feng,

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Feng-Ning/staging-rtl8723bs-fix-heap-buffer-overflow-in-cfg80211_rtw_add_key/20260408-172928
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/adQ4yU-Pc0uHXtb5%40ans-MacBook-Pro.local
patch subject: [PATCH] staging: rtl8723bs: fix heap buffer overflow in cfg80211_rtw_add_key
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260408/202604082249.CcWXI0B7-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org', should be: 'linux-staging@lists.linux.dev (linux-kernel@vger.kernel.org)'
#13: 
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
