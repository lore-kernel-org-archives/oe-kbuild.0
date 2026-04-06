Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BA939D6E1
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Apr 2026 22:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775513794; cv=none; b=iY/3+8yUTKoUpGW5YcHZLIDA9VcdEnL1Y5f4PTs3DWmZFcXz2FAQ/ZOV3OeZC6utJnrKau0Mf0yiGx9EIfNRtR21DnPS+5p9AIYHM/jfVdOdUKHqrM1d53Fz+V0vJGfZIpBCmsYBU3dLYrv79TmPpIAU9IYOkqqSImKxH8fvpIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775513794; c=relaxed/simple;
	bh=rkj4BOdsfT0fd3U1SS9VbIw0JogcAd3Hkz9KyXHWaI0=;
	h=Date:From:To:Subject:Message-ID; b=LxeZUgzTyVvPKeP5/ILJ9NbWQFaCGnN4yN6VXWxAnETA1uTXgcsvWGJQsezZ/pMK6m1eBPsVbtdLZzKpNbVyMfpTlgeNn0eQB7hdKFmsaFfNlY+l5CIN9NkFYpwBqwfl6GXqo7hu2jW50gd8Kj2bjrOkkC9ZoviyGwV3Ta8A+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXpJBVWH; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXpJBVWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775513794; x=1807049794;
  h=date:from:to:subject:message-id;
  bh=rkj4BOdsfT0fd3U1SS9VbIw0JogcAd3Hkz9KyXHWaI0=;
  b=MXpJBVWHr78HRpZDTjAvY7bjJ/w6XBuCYgUsbSVZ7hcOHnpIGlxCqBL9
   AMs9jlIt3Au1b335vBt1Xv5JfHbfog34zyxuovPTLmmqR1XvoQ7n0WtNl
   8dV1e4KZ7Cd+ySukTAo6DRqbVmbxSd3G8AC3AGKngBZJYxsX+lgkqNOXl
   wdoAQNOobBajKUQxzm6ULWkqEa6/A95tlD5Zw9+BAEi6XV3zVRBMFwVmq
   OjPhll2tVeNHBzdmzyLXeTtru0Jd2DF320aBO5o1MaHushLC0HwFzyYLY
   iw5x+4EsO0I12HJDN4pV3e6yIlJd845WAuV9Vu9+5R0us/jfpfCqkiTHM
   Q==;
X-CSE-ConnectionGUID: jsIzIls0STq1JGnZNaPx9Q==
X-CSE-MsgGUID: F+VZljf2S9ucEg3qK5lIHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="75641543"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="75641543"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 15:16:30 -0700
X-CSE-ConnectionGUID: D73rzImJT2WpdJqrAvxD9A==
X-CSE-MsgGUID: miTqlIYyQzKobwxVXydv/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="221413371"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 06 Apr 2026 15:16:29 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9sF9-00000000AAl-0u3r
	for oe-kbuild@lists.linux.dev;
	Mon, 06 Apr 2026 22:16:27 +0000
Date: Tue, 07 Apr 2026 00:16:05 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [zab-rpdfs:rpdfs-initial 49/51] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'to'
Message-ID: <202604070005.K2MaZlOz-lkp@intel.com>
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
TO: Zach Brown <zab@zabbo.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/zab/linux-rpdfs.git rpdfs-initial
head:   9a0627207ad856d2a5eb09f3458afb1e34ac10a3
commit: 9b4ade91cd7c1b14aff0338fb8ada7838ca1e0c0 [49/51] rpdfs: mark blocks dirty as acquired
:::::: branch date: 59 minutes ago
:::::: commit date: 59 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260407/202604070005.K2MaZlOz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'to'
#61: FILE: fs/rpdfs/block.c:791:
+ * used as we dirty blocks in one transaction to to ensure that they're

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
