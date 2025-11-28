Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D113279CD
	for <oe-kbuild@lists.linux.dev>; Fri, 28 Nov 2025 15:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764343079; cv=none; b=hKY6tGq9MU4XypSonUz8P/KsKaeXiQR6Kzy0c/PJONsHQEkcwImGMIF+nzpVbVhxUsvhKdj5/LV8QenpiXbE4MCISiyhNEsCgd5YYvGtTH95CuPSACS+8SdwflG7hvJNLvbSJe2ATEpTORDgG3uwsbT5jaXw7SyPQ43pshzrkss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764343079; c=relaxed/simple;
	bh=g083KH4vVyEJshJdg+XwMwJzPEzIG/BWfLjngkMxOro=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iuCj52MT/j8zFEFxKKquv64YyRgo7JLQrZoH4SnQvl6o7hfwk3P7KEDbHtNJtY4PQfhuYfIXOaMsV4joU9M/GvkSNKzfBuWtIK6aP8ZCYwuqkVLS4qCROSSWzuyaMHoZB3WH7GJAND2lbycpgBvwahOusb5wPgvxHyVsxa+eHJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TAaK9Zjd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TAaK9Zjd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764343077; x=1795879077;
  h=date:from:to:subject:message-id:mime-version;
  bh=g083KH4vVyEJshJdg+XwMwJzPEzIG/BWfLjngkMxOro=;
  b=TAaK9Zjd+UBReLMbEbbFh8qhQeUI9L02+rBOsskuR1nF0SZ+Ff4M7Pnl
   /WhAu0vkfuxUA3LCHiz6m7ft3UnzJq2BNzMa7wGOZd4kCXhcED0WX6FN5
   gGuQWdJK3iR8KZrWND47mt/tDwAraXE2UWYkp4NiTs1CPPIvIDwZtZpN7
   tfLpWmhju6tU5B5eXplMQCgUmROyUwZWL6A7o91zzmPfFG4ERVMwn6+7t
   JQ7PTK1XOyPLYO3COJpDXpJNjc+ZrcEFoHZKMiG9cfNtfbQPKSewmf2mv
   vgTpIgQI1KNgmNu/Qu8BZxw5Nrbb4xdPfDfi13taxRK8kH60zIrCjl6TA
   A==;
X-CSE-ConnectionGUID: tl/AJaLfSGW+r+nwAdm21Q==
X-CSE-MsgGUID: OMBTNwTNRCOs2LvxeQ4w+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="70234675"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="70234675"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 07:17:57 -0800
X-CSE-ConnectionGUID: 8Ymaao8XSEOd7HBD7a86Sg==
X-CSE-MsgGUID: jzVDJY7KSYOtWv0kcdPZVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="192599394"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 28 Nov 2025 07:17:56 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP0EM-0000000024L-0Syc
	for oe-kbuild@lists.linux.dev;
	Fri, 28 Nov 2025 15:17:54 +0000
Date: Fri, 28 Nov 2025 16:17:34 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [linux-review:Benjamin-Berg/wifi-mac80211_hwsim-fix-typo-in-frequency-notification/20251128-222914
 18/18] checkpatch: WARNING:ONE_SEMICOLON: Statements terminations use 1
 semicolon
Message-ID: <202511281609.x4T5XRVY-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Benjamin Berg <benjamin.berg@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Benjamin-Berg/wifi-mac80211_hwsim-fix-typo-in-frequency-notification/20251128-222914
head:   bdadc90769103aebeb26e0d70d236cb17855da6a
commit: bdadc90769103aebeb26e0d70d236cb17855da6a [18/18] wifi: mac80211_hwsim: implement NAN synchronization
:::::: branch date: 47 minutes ago
:::::: commit date: 47 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251128/202511281609.x4T5XRVY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#205: FILE: drivers/net/wireless/virtual/mac80211_hwsim_nan.c:131:
+		u64 tsf = mac80211_hwsim_get_tsf(hw, data->nan.device_vif);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
