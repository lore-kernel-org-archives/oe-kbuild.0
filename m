Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57AA418DB37
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Mar 2026 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772981122; cv=none; b=R/i9DZPukP3i5MIIeKiA0wT+mLkuVApQRX7VRXUb1k70ga3OyKEwxVOugmcdmDs+t3jlaFZJWRNls6a6NPVt8tLn10UyMsIKGJ3Z10EmiMwaXluppnEV0lUB1yNSYpEzAzpIqc9lzvzL8kkd3b+j/9O07w8ibIwKoZloT9hg1ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772981122; c=relaxed/simple;
	bh=6KsvC0X7J5MXEL6XpUT+Txxjzi3lPp1qF8KcrsVek80=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iW1Ki7ZNtkpf2g4bhiLa9moqxxm69V91VEdJBDQsy/CxyIKOayCsJmxLE4knOHHNJHtjxn59XrQ918UJoPw0iPyTHHhpFlFlW4GCvVCTEEHTwj1hhrwD/fSAfLoa91oG1B7EuE4IcGEkjgMxADyNFsT7AwJRABd68EAepTGnQ14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTbHfjZu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTbHfjZu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772981121; x=1804517121;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6KsvC0X7J5MXEL6XpUT+Txxjzi3lPp1qF8KcrsVek80=;
  b=RTbHfjZu+l6r/pu3qzNk0efzzVmFPIp/+F6Lc2S/05ur0G/4Ne41/xuD
   VAruKtDdhR7Tv8LuLjLniWXb+bKnsb6pi3a2SdDVnx98B1deenMgC6pri
   N9WkDzmZGMYd9+7k5xCrARzq6hSAJNZaPmy373FzI55iW8blxXreezQgH
   kdNGLijNLqtZG2h35AGtHf8y353LVyMfzmuj1GulxKn9esvF495Gh1QdA
   PWIXF4Ph+Kb28vtZ5NQHOgRLF28fZ1PaiSzX7UMFmVP51mbfZDFLC8VUN
   J3B8V7uhCKFw+8RNUae5iUjDu4zsbNRq+VPI5w/x9kXshod4Xjxo8+RRo
   w==;
X-CSE-ConnectionGUID: xt6ux5G+QMKBPW8iBEvibg==
X-CSE-MsgGUID: UwNn6LWhSBOgkFzZbQWGhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77874890"
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="77874890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 07:45:20 -0700
X-CSE-ConnectionGUID: peXxdUz/Qhq6RyxNMiNHQg==
X-CSE-MsgGUID: 8thKNGHPT7ehNf9r2tM1Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,108,1770624000"; 
   d="scan'208";a="219456818"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 08 Mar 2026 07:45:19 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzFNd-000000002fx-1K8G
	for oe-kbuild@lists.linux.dev;
	Sun, 08 Mar 2026 14:45:17 +0000
Date: Sun, 8 Mar 2026 15:44:44 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [RFC v1 09/11] drm/i915/xe3p: add V/P Override support for xe3p
Message-ID: <202603081552.dgEPyniE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260308132446.3320848-10-michal.grzelak@intel.com>
References: <20260308132446.3320848-10-michal.grzelak@intel.com>
TO: "Michał Grzelak" <michal.grzelak@intel.com>

Hi Michał,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-i915/for-linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Grzelak/drm-i915-bios-search-for-Block-57-by-default/20260308-214619
base:   https://gitlab.freedesktop.org/drm/i915/kernel.git for-linux-next
patch link:    https://lore.kernel.org/r/20260308132446.3320848-10-michal.grzelak%40intel.com
patch subject: [RFC v1 09/11] drm/i915/xe3p: add V/P Override support for xe3p
:::::: branch date: 49 minutes ago
:::::: commit date: 49 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260308/202603081552.dgEPyniE-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#159: FILE: drivers/gpu/drm/i915/display/intel_ddi_buf_trans.c:1878:
+		 /* FIXME need to check correct parsing & table index should
+		 * this ever trigger.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
