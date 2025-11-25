Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6052C2DC76E
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 21:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764106220; cv=none; b=Cw3xB7W5ReVF2Bl4dNSo+V+RSaPn8NQph9xWmtqS99/1YP9iomJGEl68cd2PQEGu8p/n1KDbcgq8/0GCT1FRm6qh3rdZprRbAoWuodZXK2P+PFv0//98aA0XpAP8wGgo7J5TcItln7jiFNtL51HE2mmSapf84BuZw1fMl7jrK+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764106220; c=relaxed/simple;
	bh=YT90mhVCWWO+EXy/wawud7iCRXYn8X/c8RcEZ9tenMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i5rywrfABrHysOluSwsVh5vBgu1h8sV7U98lKNZx9Wk+LzNguPxRzfuD2MYKWEwvbwA/FK5iLAxw+JICBvJwIk2hPbPyTS1+MkzxZfLJZoZwZTK/zcOhTJPCrCOxLDyChhoTwddqXDQOqSwUgtjXK3zbnxMSzQg4iUAt3GrT6uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AUQwqqf+; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AUQwqqf+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764106218; x=1795642218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YT90mhVCWWO+EXy/wawud7iCRXYn8X/c8RcEZ9tenMc=;
  b=AUQwqqf+TgievoJdzjxhBSB2QFvzkLWSOvGpAed3oLWuSkeu6FPCk2Xi
   LFawxVbj4PySwrI+8MZlw77RH3+3NbYekha4MFtpCZdzD59VNMvtygVyR
   KmUx+UYsvQG033iqKHhgrLzCIm/f+xsW3Q82FpiYqrudXH6vlFLdl+EPf
   z/yfhI3ck7oC48kGIsYegfIXjYum7+8VKfuksEP/Qk0KrjDlPwJNKsr0S
   41DcVGIVTEF1RdLqJLUagAHxur265A6ci1rxWWUy+Qrcq5MEfS4vpV1J0
   aL5+CaZSCrZUDvRUkKzYbJQp4+NTd1kGuKkmVEYTVCH5cDO6YtcHDCk7y
   w==;
X-CSE-ConnectionGUID: 9gL6CX/nTjyiJUkJ/CneTQ==
X-CSE-MsgGUID: cNw61IcwRyaiwkhuLbOmnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65138113"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="65138113"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 13:30:17 -0800
X-CSE-ConnectionGUID: vM1xvb6qR+qSKcz6BsHodQ==
X-CSE-MsgGUID: B4Hf63iUTK+P90OPMijIVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192655089"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2025 13:30:17 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO0c2-000000002Hp-3EMz;
	Tue, 25 Nov 2025 21:30:14 +0000
Date: Wed, 26 Nov 2025 05:29:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH net-next] selftests: af_unix: remove unused stdlib.h
 include
Message-ID: <202511260511.KZs8KElX-lkp@intel.com>
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
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251126/202511260511.KZs8KElX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251126/202511260511.KZs8KElX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511260511.KZs8KElX-lkp@intel.com/

All errors (new ones prefixed by >>):

>> unix_connreset.c:17:10: fatal error: string.h: No such file or directory
      17 | #include <string.h>
         |          ^~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
