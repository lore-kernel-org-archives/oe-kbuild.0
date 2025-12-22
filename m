Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF81522F767
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 18:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766429481; cv=none; b=SFhY4ITvJRlNddagY9FTqJuj0RY12FNpQib2sDQvE8edUSlw9b6rfLIcRGkLK7nEUlyIQBnDnEGFLO1pCXxsBDsISRI9nFKpUwgEDGASPjl0R9ddfLuKN7JztFlvgFDK1NCcqmxAyZ4jYj1e9LwJ7D6Ro7Uqq0eKw/1/xnrj8tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766429481; c=relaxed/simple;
	bh=kpL076jZMhc/OndIDmSFhluSDDr3BWmH0VoPWbkaMqg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afiMci7HTd7NCZuDIo8ZhiqcqG+EbQYzJM46efYvdqZoKWwlbxvUBqvRUmyt49L3HeKF2/GfH/Zi2gzX8AiZeRNPKEwVOlcRng95mTMc138VCJlMutOGWRREGM17d0vCWc3SkGJfmjrAKkHl1LqHzapB6/YBPP03v4yYI/STCfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JzGe1LuV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JzGe1LuV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766429479; x=1797965479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kpL076jZMhc/OndIDmSFhluSDDr3BWmH0VoPWbkaMqg=;
  b=JzGe1LuVOk+R6G8Djl5jYbKhL/idPJ5+ZGXhXG2YzrHFliBG0DYgiyyS
   smagau/2U0/cz0x6HHhx712LI2f1KOYLh1S5Xpo9X06dEqf0MiPZ2nqfN
   fVWjshYUXLuWn//spZROBT+jjXhh/prBQTb7cpxm0Pbh4epy1E0Wld8Kn
   Av7oG6Wot68xI0sXIsMf59Brdg1JGy+W94EnqqbmpKWGQV2kmn5Hhoahp
   QUeAApqlaXIAnuL6wRalZrXBZdH5Sjvy/K9yHkB5i+8R6FcmMbSp6k5oz
   zrKnP1tQ6bTnvsruYDp8dMne6fBbmoxzJG3DFpzJFt6MDZQgux3nfwRz3
   A==;
X-CSE-ConnectionGUID: qmbrhI70ReK4pzvok4DH9Q==
X-CSE-MsgGUID: HrISJdabQx+bK5ufQdQwLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="68170335"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68170335"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 10:51:18 -0800
X-CSE-ConnectionGUID: pS4G1mjmRoiSei9vASVJ+w==
X-CSE-MsgGUID: ID/qKYiyTG+UNQEb0lDlYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199620805"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Dec 2025 10:51:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXkzo-0000000010T-1Ttp;
	Mon, 22 Dec 2025 18:51:07 +0000
Date: Tue, 23 Dec 2025 02:50:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] mux: adg2404: add driver support
Message-ID: <202512230206.nc11lecw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/mux/adg2404.c:131:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251219143244.21674-3-antoniu.miclaus@analog.com>
References: <20251219143244.21674-3-antoniu.miclaus@analog.com>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: Peter Rosin <peda@axentia.se>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Antoniu Miclaus <antoniu.miclaus@analog.com>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org

Hi Antoniu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Antoniu-Miclaus/dt-bindings-mux-adg2404-add-support/20251219-224249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20251219143244.21674-3-antoniu.miclaus%40analog.com
patch subject: [PATCH 2/2] mux: adg2404: add driver support
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: openrisc-randconfig-r122-20251221 (https://download.01.org/0day-ci/archive/20251223/202512230206.nc11lecw-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251223/202512230206.nc11lecw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512230206.nc11lecw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mux/adg2404.c:131:1: sparse: sparse: bad integer constant expression
   drivers/mux/adg2404.c:131:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/mux/adg2404.c:132:1: sparse: sparse: bad integer constant expression
   drivers/mux/adg2404.c:132:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/mux/adg2404.c:133:1: sparse: sparse: bad integer constant expression
   drivers/mux/adg2404.c:133:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/mux/adg2404.c:133:1: sparse: sparse: bad integer constant expression
   drivers/mux/adg2404.c:133:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +131 drivers/mux/adg2404.c

ac3fd4fe1af6f0 Antoniu Miclaus 2025-12-19  130  
ac3fd4fe1af6f0 Antoniu Miclaus 2025-12-19 @131  MODULE_DESCRIPTION("Analog Devices ADG2404 multiplexer driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
