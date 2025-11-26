Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A9B2D23BC
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764152584; cv=none; b=qSKjaNq8XosQxG2y8AinCopmUMmPHMKmBNwo5KUwyQ/KWhFYrZLpzFsFTLz/EeCvM7gsXUZhceF7ii7uYa7vDODlIuDreVoHatjwu4K46LpNVh/F4OcGugDjBi/Wi7UsgQI4Z5iGxN4srN54wHLXmZvlFJtqA3I/WguTgblFhQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764152584; c=relaxed/simple;
	bh=p/h6eBv5fvuYCNm6DKaICl20uFicqUg0VZqIi091nas=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JD/QnlncFueCI8v67aWc2QXiAuUCdt6PxaOxaZA2VGR3ewLrg2FA1BEjhMSNv8Ci0bgPM7ojmjvARvkC6RTGlIiTTjdS8P3zmrBVIzDlgQn2NSWiMY00fOelWGgotpklb58lB/oIRmiruYlROH2Gv/gx9UurSaRtVTlRy6j2UtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gL8WpT2d; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gL8WpT2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764152582; x=1795688582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p/h6eBv5fvuYCNm6DKaICl20uFicqUg0VZqIi091nas=;
  b=gL8WpT2dFhs1otmNJ/mpbFK6MMBjNmWg0fJxE3de65ukjhLNsIjXfJur
   0Xf5rwEaFRg4OhmZJxgCY23IIf3ocaTeS5wlLVlw+tySH9TErH8dVDgJe
   Tns2HGMkIId9376xksTVAd3gKhCDXA9LhXPMmsZcUdxjGd4fudwngh03m
   GSiOgW6oqlBIT3NHkHD80H1oRGGf85O/pWG8Na99cmLSLDqJyXONN1yMe
   Q7DF/q59QhLCQtMzAAxZIgg3cvwfX7Jeb+RuhsfJ8R39C44lEILYpEZ36
   CgzdqCTVamfgJfvS3k4l6gLycEcPCLW0sEgMho3xMRNTJTw1Ngp0FV4Hq
   A==;
X-CSE-ConnectionGUID: Uwgo/tkOSYyFlp6xoxiO7A==
X-CSE-MsgGUID: UwBasot7QeKcKQQJ6B8ZcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65893394"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="65893394"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 02:23:00 -0800
X-CSE-ConnectionGUID: yqn+m1ZZTOWJ3pTXe3+qBQ==
X-CSE-MsgGUID: bnSD6+XEQ2Oj1bZoa3syUw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 26 Nov 2025 02:22:59 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOCfp-000000000sX-1qgU;
	Wed, 26 Nov 2025 10:22:57 +0000
Date: Wed, 26 Nov 2025 11:22:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next] selftests: af_unix: remove unused stdlib.h
 include
Message-ID: <202511261103.vhvOPMLC-lkp@intel.com>
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
In-Reply-To: <20251125113648.25903-1-adelodunolaoluwa@yahoo.com>
References: <20251125113648.25903-1-adelodunolaoluwa@yahoo.com>
TO: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
TO: kuniyu@google.com
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: horms@kernel.org
TO: shuah@kernel.org
CC: netdev@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: skhan@linuxfoundation.org
CC: david.hunter.linux@gmail.com
CC: linux-kernel-mentees@lists.linuxfoundation.org
CC: oe-kbuild-all@lists.linux.dev
CC: Sunday Adelodun <adelodunolaoluwa@yahoo.com>
CC: kernel test robot <lkp@intel.com>

Hi Sunday,

kernel test robot noticed the following build errors:

[auto build test ERROR on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Sunday-Adelodun/selftests-af_unix-remove-unused-stdlib-h-include/20251125-193918
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251125113648.25903-1-adelodunolaoluwa%40yahoo.com
patch subject: [PATCH net-next] selftests: af_unix: remove unused stdlib.h include
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251126/202511261103.vhvOPMLC-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511261103.vhvOPMLC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511261103.vhvOPMLC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> unix_connreset.c:17:10: fatal error: string.h: No such file or directory
      17 | #include <string.h>
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
