Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0D74D0A0D
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 16:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354505; cv=none; b=B9+xixR9aBgc95se+9I5/1RbAnX5+6NgBXHsXpGkZGt9zZuHmugw+7UMDlPWA9G5D56tPLjmlDBVyav/jBwHnn1+ZLjRH7y5ltOftz8+y5D5JKAhPDdbJoYnPoiQD7CU6sa8h8MvksqI3exfHoFcO78pUhm5VjV5pOiN1T3ZJXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354505; c=relaxed/simple;
	bh=Dnjggaqz9Gf4zeE5+KxsEWhoQkn5uBcrWCW+6Cg60sY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ay4MTPimDCcE/VXRxgTinWyEjS015VwhVYhU50V8IG9Nh3/sIkAR0OkFXFtC/+06Q5CQ+MiKVfR/OmnK4sWqA6eEd+7QzBFqEcTi44/w3nMDLJlZRRaA4aJvuxcmLSL6NkBB8x8roDylJ2q4lkHWMRdCp99QXnQflldOtUinJ4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fj/afBEz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fj/afBEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790354498; x=1821890498;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Dnjggaqz9Gf4zeE5+KxsEWhoQkn5uBcrWCW+6Cg60sY=;
  b=Fj/afBEzq4iz6iVFJkhNU0moU4RGVGiTXhT0UPBE5pZU4R2n561o/Xue
   NXXFjjiWNG7QiEMR2sAMJDewVIzU/adpRrbusflh4JjUuQp4ygnPWUUPh
   xCJC3E3NeM5BJmn1TlIPi3lL96dCqhQmivj2GJbYUiiXQN7w70/rV0xoA
   BGPoXw0ljwU2dpVvLBnSBpryxeWcK/TKTK5Xt9jtWqw7hVJ7UL1gRjPqH
   UBseNWpDElFXcwxbuyMBRkQ9X8pZPlvsIyUctNfVfQsFlMhJHAwDidqXq
   jaArldkmHdqWytR2RsoxN3Qnw2cgO83I80j5FHl4/9MI08OQGPphwg/88
   g==;
X-CSE-ConnectionGUID: V/jLZlQ9SBmJ56sHXxVrHA==
X-CSE-MsgGUID: fHJtMIkJRtWGXraWGXiA+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102506261"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="102506261"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 09:41:34 -0700
X-CSE-ConnectionGUID: SXP4gfhDSRGJkbELnlYpaw==
X-CSE-MsgGUID: KedC2k6zSGCbFOQ4Uf1BDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273478020"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2026 09:41:32 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA8zF-000000000pC-0vww;
	Fri, 25 Sep 2026 16:41:25 +0000
Date: Fri, 25 Sep 2026 18:40:43 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] platform/x86: bitland-mifs-wmi: Support WUJIE15 PRO HPT
Message-ID: <202609251829.pXRbftlk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <0da43a8c-1755-49fe-b8e2-403489297f06@gmail.com>
References: <0da43a8c-1755-49fe-b8e2-403489297f06@gmail.com>
TO: Bozhen Peng <bozhenpeng93@gmail.com>
TO: Hans de Goede <hansg@kernel.org>
TO: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Armin Wolf <W_Armin@gmx.de>
CC: Gladyshev Ilya <foxido@foxido.dev>
CC: Mingyou Chen <qby140326@gmail.com>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Randy Dunlap <rdunlap@infradead.org>
CC: platform-driver-x86@vger.kernel.org
CC: linux-doc@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Bozhen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cee9395acd8043be0644b25c34bfa86623f2b935]

url:    https://github.com/intel-lab-lkp/linux/commits/Bozhen-Peng/platform-x86-bitland-mifs-wmi-Support-WUJIE15-PRO-HPT/20260913-181208
base:   cee9395acd8043be0644b25c34bfa86623f2b935
patch link:    https://lore.kernel.org/r/0da43a8c-1755-49fe-b8e2-403489297f06%40gmail.com
patch subject: [PATCH] platform/x86: bitland-mifs-wmi: Support WUJIE15 PRO HPT
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260925/202609251829.pXRbftlk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609251829.pXRbftlk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:58: ERROR: Unknown target name: "network flags". [docutils]
   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:63: ERROR: Unknown target name: "scope flags". [docutils]
   Documentation/userspace-api/landlock:621: ./include/uapi/linux/landlock.h:24: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:630: ./include/uapi/linux/landlock.h:241: ERROR: Unknown target name: "filesystem flags". [docutils]
   Documentation/userspace-api/landlock:630: ./include/uapi/linux/landlock.h:264: ERROR: Unknown target name: "network flags". [docutils]
>> Documentation/wmi/devices/bitland-mifs-wmi.rst:11: WARNING: Title underline too short.


vim +11 Documentation/wmi/devices/bitland-mifs-wmi.rst

dc1ec4fa86b2b8 Mingyou Chen 2026-03-23   9  
3960b46cc0bcbd Bozhen Peng  2026-09-13  10  MECHREVO WUJIE15 PRO (HPT) firmware variant
3960b46cc0bcbd Bozhen Peng  2026-09-13 @11  -----------------------------------------
3960b46cc0bcbd Bozhen Peng  2026-09-13  12  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
