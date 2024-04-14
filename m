Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4012C190
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Apr 2024 10:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713090416; cv=none; b=Y5hlZh5cbL3Y3Us5Wj4Zls//Nyq2c6GJmojBoXMtVo/C8UVKxtu1ypUhRhuo4XRbxRYdrpDti9ubVT4etNqrVyeEiclEJVUuCDjqWk9BT077yMOphGCP6ZvVegtgGq7n2NqQ1YYDvssKAam/jCnWBtapQKx+5sxSHYQEdK/0H+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713090416; c=relaxed/simple;
	bh=Q03w+Y/D3Mvue1mxK6G6O7uSMkHfW6tchaKjpXSadvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y1Ybr6O2kH+bm1MSD65yJNHliwuRFvh4eqWDJyHhleHRCixCWrS2EjW/RmlP9b5A1by601EEyT+5N5sDuoLl10iuygIzDv3FRMT/3VzrR5bdxKowKjtRfb6C4p4a+J7BhAXq3TijPJJh502Qio3j/tR70FbNV+TfP/vxRf4YClQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y9EzGY+T; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y9EzGY+T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713090415; x=1744626415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q03w+Y/D3Mvue1mxK6G6O7uSMkHfW6tchaKjpXSadvk=;
  b=Y9EzGY+TCl658a2Zb5rqnny8U7SXCuDFoOquNT2h30zc/KJc8QAevS94
   RjBnriHzMSgoyvkUhRTde+evRhhPzLVQjkaz68Sw+4WZAdxbGKPtnDztO
   b5Qp0bp49hnzi6F6PAK4psYSyADWlmmjbZRMrIrSskgZsoiLjus1Sl6B3
   54p82527CerBWbFexWDnARjsmRd2evSc5LYkeCdW84xAfdWmlenNlzyLs
   jqAb0y7AA+awn+jhYWJ2qgdvNEpCnU2ElpEYmdI6h8SRLZh+mrrG579li
   snYsdNWlOJoEVXCX9tCJUsd+k4uIY9nNzfMaKsGOhJ67U6JsdXgoDKUjv
   g==;
X-CSE-ConnectionGUID: KPxvQRY1S9qu0FD2xeEOqQ==
X-CSE-MsgGUID: hfZ1jcfQTEiMlV4azqbq9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11043"; a="12268059"
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="12268059"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2024 03:26:54 -0700
X-CSE-ConnectionGUID: WgD+8BGdTxiXVVoadnehpQ==
X-CSE-MsgGUID: YjtQlVigQiKAD8HPFsr01g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,200,1708416000"; 
   d="scan'208";a="21572652"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 14 Apr 2024 03:26:52 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvx4G-0003ZE-2P;
	Sun, 14 Apr 2024 10:26:44 +0000
Date: Sun, 14 Apr 2024 18:25:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: clang: error: unknown argument '-static-libasan'; did you mean
 '-static-libsan'?
Message-ID: <202404141807.LgsqXPY5-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Ryan Roberts <ryan.roberts@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7efd0a74039fb6b584be2cb91c1d0ef0bd796ee1
commit: c652df8a4a9d7853fa1100b244024fd6f1a9c18a selftests: link libasan statically for tests with -fsanitize=address
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240414/202404141807.LgsqXPY5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404141807.LgsqXPY5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> clang: error: unknown argument '-static-libasan'; did you mean '-static-libsan'?
--
>> clang: error: unknown argument '-static-libasan'; did you mean '-static-libsan'?
   clang: error: cannot specify -o when generating multiple output files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
