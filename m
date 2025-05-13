Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDE61E8332
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 06:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747116621; cv=none; b=ZIwBpSnZXfwoclVzmMzCbWoHBpOZzJP3kPcVvXnUIgQPB/O/DGl2wSsBDrVC233QSlgO3xp6qFhr+gXsxI4I9+348BornKUwcl9YbzHcJpHih6rkWMz6aaKuObluKAHaz8+Lbw2Fhe9QfPxtxZtz9enGOgN+d3q/OfZPUNnvPOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747116621; c=relaxed/simple;
	bh=Sshtu3fEwddYfT6BsOLlJOPup4jqRjL6DoZqxy0N22Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/Nqlnldtcr7Mpprzjpexvwr+0jh+k/DmSl6YxU4fU/7cH0XyOPSj2WFAD1dEC9UbvTZkQqDiZc/YGh+r8INrBoPp/5n7YMG51XJKeQWz5bSwbsOnKKf9DB0DzQyvAJGb6nflxPHHe27XjzxMVtdEJujAq50mSNRUQkSuAfOEYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f3tk8HlX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f3tk8HlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747116620; x=1778652620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sshtu3fEwddYfT6BsOLlJOPup4jqRjL6DoZqxy0N22Q=;
  b=f3tk8HlX7gy3ZJgSK1lNm9Tknz/0/I8+QcYI686qRsQt4eCmfaj6pzQE
   uzwkbqAchAi+Q63YqRkWbnJGVtWVhlXrPt3ZMiPggpaxyyBKkWySY9mVu
   yEMjCfz/itvL93sr8Avom3GnhxLYmlScrRn3GRg4OdtRyK41md4hRGmB2
   6BbdR03PYivdkkrLL+0/5nU4mFPXfsXY7rbifoEqzZYgMoPOSxkhoNptI
   +KePWAPneN1M+xg3EXK0Got7bGHdIhmFP2M5Ukhw7zCfmcu7JmweDqs+3
   r3A01w+RoCW/SPinf0vAnF1nySsFGO7h4VUyEcpwMvHmrxMmwmOMljOlc
   Q==;
X-CSE-ConnectionGUID: 3QsrMoRdSDSKFjMz8azVBQ==
X-CSE-MsgGUID: OG6I6+UPSKuiYW9jV3wLDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="49106297"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="49106297"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 23:10:15 -0700
X-CSE-ConnectionGUID: 0xMymHmqQdaVTHV+LEYUaw==
X-CSE-MsgGUID: HWWJdwb8Sv2949QWkO1mCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="137636098"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 12 May 2025 23:10:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEiqC-000FlT-1k;
	Tue, 13 May 2025 06:10:12 +0000
Date: Tue, 13 May 2025 14:09:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 8457/10491] fs/btrfs/zlib.o: warning: objtool:
 zlib_compress_folios+0x3f4: unreachable instruction
Message-ID: <202505131445.aR5q2CT6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   edef457004774e598fc4c1b7d1d4f0bcd9d0bb30
commit: f53acf47c96ea478c135da683d53c94ba2ed50a8 [8457/10491] btrfs: prepare compression paths for large data folios
:::::: branch date: 20 hours ago
:::::: commit date: 6 days ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250513/202505131445.aR5q2CT6-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131445.aR5q2CT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505131445.aR5q2CT6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/btrfs/zlib.o: warning: objtool: zlib_compress_folios+0x3f4: unreachable instruction
--
>> fs/btrfs/zstd.o: warning: objtool: btrfs_calc_input_length+0x80: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
