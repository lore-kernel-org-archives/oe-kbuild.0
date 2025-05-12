Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C99B25A2DE
	for <oe-kbuild@lists.linux.dev>; Mon, 12 May 2025 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747040145; cv=none; b=RT+g4sfm67IMj1KS/azhyzaijSG2JgzfGBJkY9KcE3HmIAolSkUZPhF+AW6nd8Ly+YusPKeJh80pG+nV4RkaZJhB44t6oEtMVGr6XLH2FQ/EO7AjNpwFzdgc16cnc3ZWncMZUcvtEitzKg/Dp6At1LqghPTOKNS91ql/sPBAUW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747040145; c=relaxed/simple;
	bh=12ZIO0D4wCHPFl7acXnDvgchEp95RIr7LfZN/D2SG/s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d7sUXsFVcExFSi6yUZsFIMLPXLrCD/3QZQU3YuQwkFFtwV5f7fgzw7S9UNnFe4B+pJ1S7AbmfJOmKKvHi/QOJM1qkKe2wx9VGf6CJ/bLcr61M/tLxbBqb7BTkPJHsoh2EU1v2KIfOkhpIB3S7oOfBkFtuQhrGZjlkeLSwl0+jGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NNdr4c59; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NNdr4c59"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747040143; x=1778576143;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=12ZIO0D4wCHPFl7acXnDvgchEp95RIr7LfZN/D2SG/s=;
  b=NNdr4c59hFY5tRQwAtUtAEJpbnan9Sr06jTk5cA8XQtjnXQxncAezRAc
   t4YOcLew+K7IP1Nmh3pw/9edjG2RD7nzkqNr826Sw8yKhSo41JBCtv4z4
   7nLEbTSZEPP/hX9ei/FNFtx8YcT4AWi4nbzNkiTyNGsdTMk+dmngxgwyT
   cgZ22yfH40I+UlBH/nY5hXw5jeFePSZUi3I9rEb5j/WcWuIgcNTdZfHAO
   YuaVHuMxq3afvEyg43kfQbvCX3ww8OZRLhasv6WLksxAPU9GJ6eF6KCGi
   uO7981FODSeNOEbI+aQJY+imZ200nqL8X67FvUFWaG9UtZDAvBv6ODy1I
   w==;
X-CSE-ConnectionGUID: 4icYVWTgRlS7AqH3eLSPzg==
X-CSE-MsgGUID: j5h8/LB3Qi28+8yy06dwCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48944242"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="48944242"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 01:55:16 -0700
X-CSE-ConnectionGUID: J6sm3mWeRd660FiFXXzp1Q==
X-CSE-MsgGUID: Cm2sKrFjTNqSwGzA6UKOmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="138275787"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 12 May 2025 01:55:15 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEOwL-000EKB-1e;
	Mon, 12 May 2025 08:55:13 +0000
Date: Mon, 12 May 2025 16:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gfs2:for-next 18/18] fs/gfs2/aops.o: warning: objtool:
 gfs2_jdata_writeback+0x148: unreachable instruction
Message-ID: <202505121612.mXYCgtOL-lkp@intel.com>
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
CC: gfs2@lists.linux.dev
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
head:   4b6f23f4cf269dced46a48a7d43f50e6594db455
commit: 4b6f23f4cf269dced46a48a7d43f50e6594db455 [18/18] gfs2: Don't call gfs2_jdata_writepages during journal flush
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505121612.mXYCgtOL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505121612.mXYCgtOL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505121612.mXYCgtOL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/gfs2/log.o: warning: objtool: gfs2_ail1_start_one+0x21c: unreachable instruction
--
>> fs/gfs2/aops.o: warning: objtool: gfs2_jdata_writeback+0x148: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
