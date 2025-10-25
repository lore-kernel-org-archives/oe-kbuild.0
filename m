Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3FD1EFF8B
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Oct 2025 21:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761428505; cv=none; b=J1qTF2A0EA+BhwXdrP0IQpW8apSF//GXlFCeZv8YO3CL4OrHfvzjd9dkiOjtkb9dbRxytoLqSSF5/DAQmIi0/s1GRotxnVt0yq6bG4nYaCwWuJj9VBjXH6xhhIVy0sQytcCBs7q6lN0c2AzAEKCyKpXi08vwlzAOhSxszvlHbMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761428505; c=relaxed/simple;
	bh=75tubrJcV95bNhmzgmAfa6SSREholDijMvWWF6547T8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YtnWWSKCg9RaKvPv7Tkrdcom2DEU0c+Yv2nc6e8tjC1RRbMWlm5rWqECfZmNWPIoYov7XbwO12cB9899uOc3Wd+MSxKuwGu/5qeE0YDTsPY1GkCDjDmhzWeQhe9JL9FRvPGU7SOCG97YDktQIQSRwMnv6kozfAEgSWjtvQZAmiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kbsTOkw8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kbsTOkw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761428503; x=1792964503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=75tubrJcV95bNhmzgmAfa6SSREholDijMvWWF6547T8=;
  b=kbsTOkw8+U2Dg46JyDlgxcdC2x+fxSQdQYzHnwyA7SLW9WVlll6U89VY
   4RAgsHf1hAH74W2OsDSTt3WNoUdJcHTXjMzeGNjLArAUZpQI1y5PhlZhE
   +5Y8GgiEdWo9gFefS5pr69itdPfGNjOJ8K2o4JeHpYxeUHL7etsAsfMuI
   E8hjXPiiJXj7fsapnbfMExTMompu7tEQkkraLRoJwqwSTQIvxgUigRsk+
   WSLWdINCKO2i8qdbivIHcAavCSLd099Q7FQn5BLkjN/BMc1sSRDCajykP
   pL4hS4rOgDssE4XZgleaBBTjRb9fhCmtjTiAD6HiHvxmzQoSYph9rc3av
   A==;
X-CSE-ConnectionGUID: mgVGIPvETx662tFUNAapaQ==
X-CSE-MsgGUID: oa3uog+yTWmvvOhzRZEHIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75008931"
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="75008931"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2025 14:41:42 -0700
X-CSE-ConnectionGUID: /YSIWEToRaemnmP81Be15Q==
X-CSE-MsgGUID: 67c5hbcwSluH/ivA7OTfmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,255,1754982000"; 
   d="scan'208";a="184609899"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 25 Oct 2025 14:41:41 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCm15-000FcL-0z;
	Sat, 25 Oct 2025 21:41:39 +0000
Date: Sun, 26 Oct 2025 05:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-kminext 1/1] posix_timers.c:398:13:
 warning: 'check_delete' defined but not used
Message-ID: <202510260511.IBcF8UVO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   8979fee435bfd762771c71f3cf99f6f279038337
commit: f3a29e7eb6dea8119f0d5132e39b52adf4d1ea76 [1/1] ANDROID: Disable check_sig_ign within kselftest_timers_posix_timers
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 1 month ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510260511.IBcF8UVO-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510260511.IBcF8UVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510260511.IBcF8UVO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> posix_timers.c:398:13: warning: 'check_delete' defined but not used [-Wunused-function]
     398 | static void check_delete(void)
         |             ^~~~~~~~~~~~
>> posix_timers.c:342:13: warning: 'check_rearm' defined but not used [-Wunused-function]
     342 | static void check_rearm(void)
         |             ^~~~~~~~~~~
   posix_timers.c:235:14: warning: 'ignore_thread' defined but not used [-Wunused-function]
     235 | static void *ignore_thread(void *arg)
         |              ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
