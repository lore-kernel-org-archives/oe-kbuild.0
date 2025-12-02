Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DDF2F9D8C
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 22:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764715184; cv=none; b=nuu7JHvuR28JDqfJqO5AAZ1Khl/KllAj00fg/9FxLg6XQSd3L2nB3MouvcG2Iuu6i0c13Q83IeFYrFJMMWr+ZnhZo5K6GdVDQMLjIPQjdP29uRpjaA8NxCl/ozjfOImyQuPyvGaOwF4A0+1l3itGTIWri7Ta/CkP0xa2msQB6wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764715184; c=relaxed/simple;
	bh=WhXkci2CZ9XKfupFAgkxFdzMSU6Oueg4sEQaDCAruNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ez0nXhIL3zBG6WH2CT29mUjIobY+NKoQTQPOwFhP3u04ANEEHjxUCzKGb/9qXAtj3ZkjzjqUWBaxFJuhfCXMWrJpicusDGZvrdX+8imTDu6YwFlIJSy4p2DhFJsb7fX5a25CULTtszeUDxF1cosgx2g3oIAWNn/uWP0koAUwcSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FYbSqP/v; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FYbSqP/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764715181; x=1796251181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WhXkci2CZ9XKfupFAgkxFdzMSU6Oueg4sEQaDCAruNc=;
  b=FYbSqP/vvZOr55CcQwMGBT15LJl77WIdc2TfkE4GPzRss/yIpt6Rd7di
   6JJMETyeVx6Et9WsYOELK31f8AOzEym1fNM1WZX6Q1gIRIu4q8SdRP8ly
   rU8SbdgMQsjFdTpjQWGNma++2oPk7sNGFpiFjJph87XUUKDciIAAN2Zw3
   BJjZmUMlOcEvMvqBvQUMOBJyT4YpwIA9r2dOm28qlDBAOMJ5gA3lVjPGS
   v8JV3xW+y+9hHuiLFS0dkS+25w2/3KgTD7e8Nzxx7IqcshrR0mOZtIQkt
   RC1HsqrtmdBurpUEqeS/narH+17YvGtpIfRDMSMbPZ5TGw3FhOMOVWXV4
   w==;
X-CSE-ConnectionGUID: 0r6BsqD5QeuyrMPitbnRIg==
X-CSE-MsgGUID: pE3pTukWQEmWuy6GL5XkZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="54249684"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="54249684"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 14:39:40 -0800
X-CSE-ConnectionGUID: +15+rONlS022Bpoy+65C6Q==
X-CSE-MsgGUID: qupNsf2BTFWYs1Ntlv8pPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194917292"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 02 Dec 2025 14:39:40 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQZ21-000000002zB-1wJb;
	Tue, 02 Dec 2025 22:39:37 +0000
Date: Tue, 2 Dec 2025 23:38:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-kiwi-6.1 36/36] aarch64/vgic_init.c:9:10:
 fatal error: 'linux/bitfield.h' file not found
Message-ID: <202512022330.ji8S0eIE-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   81ab94df653806720116e45346cbfcbf5e63df44
commit: ce4e200f37db517831723e352e75df6156abf757 [36/36] KVM: selftests: Add test for uaccesses to non-existent vgic-v2 CPUIF
:::::: branch date: 27 hours ago
:::::: commit date: 1 year, 6 months ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512022330.ji8S0eIE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dd2b06d60d3eb9b07c7513358ad8b04386f79bc)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512022330.ji8S0eIE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512022330.ji8S0eIE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64/vgic_init.c:9:10: fatal error: 'linux/bitfield.h' file not found
       9 | #include <linux/bitfield.h>
         |          ^~~~~~~~~~~~~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
