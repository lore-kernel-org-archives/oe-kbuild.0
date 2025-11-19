Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90407315D55
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582688; cv=none; b=l7uY8ilyXGD5ZxIl10UDHIhNgNmGCFz4zvOKPaYh05frJcu29NCOgkSLdh9AHV6H4EWBDiukA5c+Jb5a7mqDGYkFeKkR+T6A5mw6xNEk+xKjDPAdhfW5MPBCdxQmxXKSDUv93kwqztY3nhwAYgYKKwPBWkhBehYrydkaX82p1yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582688; c=relaxed/simple;
	bh=LzXFxa4q5ET5k4JZkYK/LlIbm7g1A7RRJ1lSgrrJ/vM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DULLyEMKYbd7h3wUFcQCF44Fwj84FZk5KowIZy47d8GFfBC2ml3iua7cSv2HOC9nbIA6yobg7iMJa5PeS/3kf20XspsBxNX0JRonsDAdwaLWtUUvmIpCVW+dqQ5rTvqOPSGzMPg9WS+r+wyGhttBuPGbxO/2sufzZy5uXpRTzSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YNgQ+4do; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YNgQ+4do"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763582686; x=1795118686;
  h=date:from:to:subject:message-id:mime-version;
  bh=LzXFxa4q5ET5k4JZkYK/LlIbm7g1A7RRJ1lSgrrJ/vM=;
  b=YNgQ+4doQ33vUHW+n6jIaqdNEqRuBUfgGBDF4yHMfFNFJqFOUIGiuK+S
   gErTp8q4S2uE4Wpfi3HT6cdhRYzn6t1WM7SJ9X5PojlcD7lAKQ6h4ek/s
   i4o6F6Fc2orqh6Gipxj0Nkzwri/M1sw8Q6deHsquj9mjdA/XIoM6WhFv2
   uH4RvYGKwSPMKZfXvtIW3ZN7iL7uRPZf+RWrTKKw+5Z/I8POpyfk297Px
   1J0DGPldl8HtsyWCIRTvXE4q2wH1qGmLZxWC/p/KHqEV4zjp3XHG8It6d
   56Ju9zNfnPTjpjMB6R0AcbT/Fc3IDVI4+4KTjRcs3DUUYN4AnlTWF0zjk
   A==;
X-CSE-ConnectionGUID: NMhAek4TR7CTqzUkVVQ75g==
X-CSE-MsgGUID: 48FZk6IxQYeia1dW0HTuyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="83262404"
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="83262404"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 12:04:44 -0800
X-CSE-ConnectionGUID: jlwWdDlGRP6ZiWC4I1k4zw==
X-CSE-MsgGUID: EM67hcHpSP+MJwOW7Eb7fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,316,1754982000"; 
   d="scan'208";a="214516125"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 19 Nov 2025 12:04:43 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vLoPx-000000001I7-1ZAo
	for oe-kbuild@lists.linux.dev;
	Wed, 19 Nov 2025 20:04:41 +0000
Date: Wed, 19 Nov 2025 21:04:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 270/301] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202511192127.PjgNUjs2-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   358b4c20d9bd90f783a5bf7273e770d827c14138
commit: ed8c1ef868e02dc4375d19c4547cee51e81de3dc [270/301] CHROMIUM: uprev kbase to Mali DDK r54p1
:::::: branch date: 15 hours ago
:::::: commit date: 13 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251119/202511192127.PjgNUjs2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511192127.PjgNUjs2-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#12935: FILE: drivers/gpu/arm/mali/backend/gpu/mali_kbase_pm_driver.c:1801:
+				/* Allow clock gating within the GPU and prevent it
+			 * from being seen as active during sleep.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
