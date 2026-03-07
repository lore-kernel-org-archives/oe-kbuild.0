Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4992D36C595
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 05:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772860249; cv=none; b=lLGxIknbQ0N8tlt3gA5CkWNQ1z/qyuUBzSdvB04DbvCfRcgs7VXoTk1CSJFf0qshhyGOtd5Nm50yvGFbCvNGmOGz6fzgbSER3yvCzpPhEt/bos5RtBe7gqUkQsv25q4HGy868NLNa8VE13CXtr2d97ZZaBpk9pIuhE4TLvoTDx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772860249; c=relaxed/simple;
	bh=eadVuDEyZOlxVFfXaSwJBD2o4Ly27xUsdUqCfZ8OaTY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=AjQU8qyjwhE0V+fCYUf6kdUf/24RngLVyDz8YCYXLcvfYKsUEPrgkC9dTZzNB4FJH7fbcTwh2p+mDXHbrqq/V/WNXBAwd/p9OKzlu7W+6loyeZeOKtz0GK4QOPTLtQy5IY2gdi2jZrO1gwjRJaPQcexgCii9M36BFRh5gwO96C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QXXzC7P8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QXXzC7P8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772860244; x=1804396244;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=eadVuDEyZOlxVFfXaSwJBD2o4Ly27xUsdUqCfZ8OaTY=;
  b=QXXzC7P8LXokbrb2pHaMs5LuFTzH8ofzYTjTzfs1VSaeX4g+7w/40Sps
   f5BX9spfdMNhfsfCQnALjXh2fRlhbrPg3LemJhIuWuh0zPfQNXCVFiseN
   +ZQ8ZP89SfmRMOLlwJSBDN6txxRrqHmylIpRa4Kk24bBM0Tv0xKyQ2aoT
   sIGEXp4TQl8/U9WT1Q+771jdKEATxBoEZKgrrVwnXLJSVlyQnO2/ljGv+
   QYxqWDd69X3DyPoQEDoaYZA0LPtxel+HHdCmk9vGUzeGNkHmZaUxxo3t0
   tYRNd1obHfTwGmtvHACjeb3Dj3XJSrOiEGwZdPAyvsmlCNUCmjlQffpAN
   Q==;
X-CSE-ConnectionGUID: XhD2rWLSSiWrxEFJUgCdKg==
X-CSE-MsgGUID: uGUOJCrdSmSN8T9U72z+Nw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84603011"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="84603011"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 21:10:43 -0800
X-CSE-ConnectionGUID: 6xBU7WfZS/qvs0sPrBR6tg==
X-CSE-MsgGUID: BWDVSGK9S+qLlVetosLYsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="224160637"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Mar 2026 21:10:43 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyjvz-000000001hd-3lVM;
	Sat, 07 Mar 2026 05:10:39 +0000
Date: Sat, 07 Mar 2026 13:09:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-uapi-c 5/5] arc-linux-gcc:
 error: language c++ not recognized
Message-ID: <202603071307.hyDnQxKA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-uapi-c
head:   0e24d72b7819b3a5142507d142a909f647b9f550
commit: 0e24d72b7819b3a5142507d142a909f647b9f550 [5/5] kbuild: uapi: also t=
est UAPI headers against C++ compilers
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260307/=
202603071307.hyDnQxKA-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260307/202603071307.hyDnQxKA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603071307.hyDnQxKA-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arc-linux-gcc: error: language c++ not recognized
>> arc-linux-gcc: error: language c++ not recognized

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
