Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DAA26ED46
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763821313; cv=none; b=WFtFiulQyewnta5UoKbV9oG7zuJVIQdanV1rG2Hg8obF7mGOME1yGldWTCY8mpDwOiVZ/Dbg7W/mH9wdN0JfFz3FWS5lNt8GGnJN+MjJvGgQXpglurJbks8l3DBHgBHny/M8N+dtdhBFBrSbGXugq4EkWNrAX604rMD2IJdPJak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763821313; c=relaxed/simple;
	bh=4tcn3XO20ghsx446Km3ReMKyjdkZTVxQm9phm6v+uJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BLZxyyI3zRx4tUlhaQWACOVmO9fMxx5BkX2juOgXrIVCYjTZ+j726gDOmPYr4QuEcxqsh9F+qm5RLfdFinvbuKF/6oet+p8PagqAC4LfNWP5xBu6G9mUEW3Ks3O+vU3tqRK9ZQKiQ5l9djYWK+naCVeSpgWoYoD5yfAE2X5N+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6pXXRUz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6pXXRUz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763821310; x=1795357310;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4tcn3XO20ghsx446Km3ReMKyjdkZTVxQm9phm6v+uJA=;
  b=I6pXXRUzBCldyXijRgAQVMUYTEvclVVXaJM7oJ2b4puxECckOXb0qMic
   3pp/cSwKFQSLxVKgAhnSGa9/HL8GeLM5CVxUnlYbYUUJ/WMl4dm/BdXzx
   OCv3pl63lqB0LZzHkTFZpUqIoR6uBWukw9AH+JIdLm/4lfQI/9sFczGEp
   F4S2Ejuk4WW2Far9dK+jOYyykKmYy7yVnNqgPJSBrealCt7t7w/Pxj4Vj
   gCwAjF9vPzZG2GOqlV37+xlqKMVPoJiW+076ymFO+CxRTmfjkSaW0EwyG
   yF9rMRFoSjdbqzFsD4qqAuA8rdjOGTlAhLqWtaoPUvizg6S5QmFmHjYaj
   w==;
X-CSE-ConnectionGUID: 8AHo6VYaRd2bsY6EYRKhEA==
X-CSE-MsgGUID: rZjJsOoTTGyZn8PYVgMOwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="66052594"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="66052594"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 06:21:49 -0800
X-CSE-ConnectionGUID: k+Py4TDPSwih3h1Se6Qkvw==
X-CSE-MsgGUID: Brgop6VQS7KgbjsYDJXwCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="222878661"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 22 Nov 2025 06:21:48 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMoUk-0007aF-00;
	Sat, 22 Nov 2025 14:21:46 +0000
Date: Sat, 22 Nov 2025 22:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6608/11041]
 tools/testing/selftests/hid/tools/include/vmlinux.h:42868:3: error:
 declaration does not declare anything
Message-ID: <202511222209.CmfOK2uR-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: a657bc8a75cf40c3d0814fe6488ba4af56528f42 [6608/11041] nstree: switch to new structures
:::::: branch date: 32 hours ago
:::::: commit date: 11 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511222209.CmfOK2uR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511222209.CmfOK2uR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511222209.CmfOK2uR-lkp@intel.com/

Note: the linux-next/master HEAD d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
   In file included from progs/hid_bpf_helpers.h:28:
>> tools/testing/selftests/hid/tools/include/vmlinux.h:42868:3: error: declaration does not declare anything [-Werror,-Wmissing-declarations]
    42868 |                 struct ns_tree;
          |                 ^~~~~~~~~~~~~~
   progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:59:9: note: forward declaration of 'struct hid_device'
      59 |         struct hid_device *hid;
         |                ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
