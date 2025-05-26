Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0063C465
	for <oe-kbuild@lists.linux.dev>; Mon, 26 May 2025 21:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748296669; cv=none; b=P/lhE+hjMVasmCh1D2QQldiEOkGaTk8Ktn7Xa1sz9vzVP8OHMbiCjjUnVqzHmagGi2Exn5p8VmNG6zEL6i7h1v1RIoFFOMfdAh4Igf/xSYcwYirrF2cqZ9wQbJqNCgRVmXG39IH4JzhQl7HF1De6D3osmuuyb/YGeemXJDZj6UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748296669; c=relaxed/simple;
	bh=n8A/m4JbNicU+6f+yQuRDXlA4KVYtS7d1Loev3CwuuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CBSxWdaEJtF58Ul6aCzM6lCK2+ThNIlEFAHgMJuVbupHaD3/Fl64natKoDWsOOkPucYF1FMNqZmh5hgT4Hh9n4wELJoSYLbTV8x2hOQPodpWA8fcOPIiCEwi8SkajrZkhpyWKtzQquR2HO6aafxezCc5L1pnKpKIEznxK7J8grg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AI/xOoLp; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AI/xOoLp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748296668; x=1779832668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n8A/m4JbNicU+6f+yQuRDXlA4KVYtS7d1Loev3CwuuQ=;
  b=AI/xOoLpwXRPrUJ6PRGhHG4V7u0uxUej1/5WwlEIXCOiYFXcCzlV6Dxp
   ePZMwL5sz7puMbbWT7b1pYNfkRTEG6hslzrK2UAFG5Foeeu17o1qu02Wn
   GdtXE7D1BsGu6laC6WYjDiTt0U/pBruMyKh/1dBLo8KaKb9eMKfuE68Wo
   jFCPqk8T8XKPGHfQ9LWAPCfPXh2gg/OYBcn29KjgZrEpemLAejHomFBFh
   aXtyBWI3lzGpdZtsJ4Td90zFRr2ag+k/e/st5A6Fa6kRONHQ1OAhyQx5D
   Gad4WveTrmVg0n7xsW/wmiD9PBGfx9hzwzdUsfjKoL/Cq4f+Avm51udVW
   Q==;
X-CSE-ConnectionGUID: YRt7Fg9wTIiP+PaM7Iz9AQ==
X-CSE-MsgGUID: Eq3tnbXmQBKPG+vBkvAoqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="52897236"
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="52897236"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 14:57:47 -0700
X-CSE-ConnectionGUID: J9OqTdnQSjWAkhwQXB5KNw==
X-CSE-MsgGUID: JUmGhdn/SjG94GOT9fyaPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,316,1739865600"; 
   d="scan'208";a="147677815"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 May 2025 14:57:46 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJfpH-000SjE-2m;
	Mon, 26 May 2025 21:57:43 +0000
Date: Tue, 27 May 2025 05:56:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-6.1 0/1] fs/smb/client/file.c:2446:15-16:
 WARNING kmalloc is used to allocate this memory at line 2442
Message-ID: <202505270545.nnHkWawD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Steve,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   9e207186c74578f0ef1872467740ab30f74abe6d
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [0/1] smb: move client and server files to common directory fs/smb
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 11 months ago
config: i386-randconfig-053-20250527 (https://download.01.org/0day-ci/archive/20250527/202505270545.nnHkWawD-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202505270545.nnHkWawD-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/client/file.c:2446:15-16: WARNING kmalloc is used to allocate this memory at line 2442

vim +2446 fs/smb/client/file.c

fb157ed226d225b fs/cifs/file.c Steve French 2022-08-01  2436  
fb157ed226d225b fs/cifs/file.c Steve French 2022-08-01  2437  struct cifs_writedata *
fb157ed226d225b fs/cifs/file.c Steve French 2022-08-01  2438  cifs_writedata_alloc(unsigned int nr_pages, work_func_t complete)
fb157ed226d225b fs/cifs/file.c Steve French 2022-08-01  2439  {
4153d789e299b29 fs/cifs/file.c Zhang Xiaoxu 2022-10-22  2440  	struct cifs_writedata *writedata = NULL;
fb157ed226d225b fs/cifs/file.c Steve French 2022-08-01  2441  	struct page **pages =
fb157ed226d225b fs/cifs/file.c Steve French 2022-08-01 @2442  		kcalloc(nr_pages, sizeof(struct page *), GFP_NOFS);
4153d789e299b29 fs/cifs/file.c Zhang Xiaoxu 2022-10-22  2443  	if (pages) {
4153d789e299b29 fs/cifs/file.c Zhang Xiaoxu 2022-10-22  2444  		writedata = cifs_writedata_direct_alloc(pages, complete);
4153d789e299b29 fs/cifs/file.c Zhang Xiaoxu 2022-10-22  2445  		if (!writedata)
4153d789e299b29 fs/cifs/file.c Zhang Xiaoxu 2022-10-22 @2446  			kvfree(pages);
4153d789e299b29 fs/cifs/file.c Zhang Xiaoxu 2022-10-22  2447  	}
fb157ed226d225b fs/cifs/file.c Steve French 2022-08-01  2448  
4153d789e299b29 fs/cifs/file.c Zhang Xiaoxu 2022-10-22  2449  	return writedata;
fb157ed226d225b fs/cifs/file.c Steve French 2022-08-01  2450  }
fb157ed226d225b fs/cifs/file.c Steve French 2022-08-01  2451  

:::::: The code at line 2446 was first introduced by commit
:::::: 4153d789e299b29cbc57276d687c92f3a098e59b cifs: Fix pages array leak when writedata alloc failed in cifs_writedata_alloc()

:::::: TO: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
