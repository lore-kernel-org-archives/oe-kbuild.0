Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B4A242D65
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Jul 2026 06:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785306189; cv=none; b=qES9DW8ioW6yZ6rHNgSBAlwGtrhlU9txlWyN7BdHpB5MMP7218Eej9JeaPZWqIPkx/nsIKIFrnHmC3RMNdQsdNPj9B+0uUIt3yJU7LuVMrVFFgTx5zEe3yTxmx/MmsKyD8oJGKmUP3GIIh5XmlNgMZA980NikbpzRWUvt4+MhAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785306189; c=relaxed/simple;
	bh=ziXZH3uReMql33toCoFtcIrjAEtlE8wzF6f0KOdkBrA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GYmcQuZkW5jon+CZM7yeu627Ub0SCXF7yPA7FMViLomE2fH9BLWNfCM9RCDmhpncQH4cd+e3EzurmCvFT08GR0NFSHtbCbCZMKg57hK7XD/K2ZU8JMjbkPUwCYq8Oa2pwzlIWWMGfIMp4kVsFYUlAZK8I2F0L+D/qntvZNyPMcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ChoJR/Ta; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ChoJR/Ta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785306187; x=1816842187;
  h=date:from:to:cc:subject:message-id;
  bh=ziXZH3uReMql33toCoFtcIrjAEtlE8wzF6f0KOdkBrA=;
  b=ChoJR/TahcMsQLojUXwYoPH5Nn6uqGtA51f1+xu6wDzVdUloHcmWKYy/
   A1Xw9k69Qt4sxFXARNLC4fUpbtEJYdqqz3zxvMJdwswCuqph9Bo/PJcda
   TkgFGyYYOQ8MFqmD3K44vZ8TkVU3yFB88OfYvZqcSDgjZoPKvAgVHFdF5
   d1rGGpRsZQsDcDxU+VGTV7ZyJaYSV/bsf3lCmP5WBB2MTMENhmq+RfxZr
   KcFdUsDZFyq6g0RgYwjxVMkwfHWcDJSD+QNvzGILwytLoWmQRTBWj42kj
   DROsmaddzXBJG2cfwswcSv+OCJ7q4DInWniDsBO2zj2ldyqRBJ1np2oBY
   Q==;
X-CSE-ConnectionGUID: 13Cy1c6YSX673CjkrcWoOQ==
X-CSE-MsgGUID: dhS/xHVcRJyNwElNPFzx/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85757083"
X-IronPort-AV: E=Sophos;i="6.25,191,1779174000"; 
   d="scan'208";a="85757083"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 23:23:06 -0700
X-CSE-ConnectionGUID: Ao/eHbHnSIefb66EzrF/yA==
X-CSE-MsgGUID: 4mvaZ/XVQ425iy0OKheLCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,192,1779174000"; 
   d="scan'208";a="264199183"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 28 Jul 2026 23:23:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woxh1-00000000f79-3dvK;
	Wed, 29 Jul 2026 06:23:03 +0000
Date: Wed, 29 Jul 2026 14:22:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: net/wireless/util.c:3087:6: warning: no previous prototype
 for 'cfg80211_validate_ies'
Message-ID: <202607291343.GQPreqJa-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Deepanshu-Kartikey/wifi-cfg80211-add-cfg80211_validate_ies-helper-and-use-it/20260729-101807, commit: 9f00c96249f6b1cad035a9ece55d6a199cf08cbf"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Deepanshu Kartikey <kartikey406@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Deepanshu-Kartikey/wifi-cfg80211-add-cfg80211_validate_ies-helper-and-use-it/20260729-101807
head:   9f00c96249f6b1cad035a9ece55d6a199cf08cbf
commit: 9f00c96249f6b1cad035a9ece55d6a199cf08cbf wifi: cfg80211: add cfg80211_validate_ies() helper and use it
date:   3 hours ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260729/202607291343.GQPreqJa-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260729/202607291343.GQPreqJa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607291343.GQPreqJa-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> net/wireless/util.c:3087:6: warning: no previous prototype for 'cfg80211_validate_ies' [-Wmissing-prototypes]
    3087 | bool cfg80211_validate_ies(const u8 *data, int len)
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/cfg80211_validate_ies +3087 net/wireless/util.c

9f00c96249f6b1 Deepanshu Kartikey 2026-07-29  3086  
9f00c96249f6b1 Deepanshu Kartikey 2026-07-29 @3087  bool cfg80211_validate_ies(const u8 *data, int len)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
