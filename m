Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE551F1308
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Jan 2025 13:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737464966; cv=none; b=iOqEdJ+CTfaS4hkv8fRPYpW49kl0Lqj1cwhRQ4voIZmMXar9KMNV98RuieaIoiVAjlvlCyNfponOR0nuHnxldSysjOb9DKhGKKBA6/ScNoncD90qh3CqXOF3mHTX30S/HSUxzKl7bt2fbc/caps97iOkj/7BeIrptPp6+acSvgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737464966; c=relaxed/simple;
	bh=YZc8X4n2Md6CMl5Ognr+M+g6tsGkMiDVKgsFsg9xbwg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IQj8DVDKLwG78sNNhZz1go+dRNyGmypJS3P+XUzMxNX/2Gy9zrrjpci42GCeMs4mYIktrScAPsDgoD2unB8lC4+ydVhANsPf21ANjElahPxrky7MP/tdKH7Rq75fCH69FZNwhz7CPjToPBe9gjrVfn5rRUHP+sgtK/fSQK+yRWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ah6FoUE9; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ah6FoUE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737464964; x=1769000964;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YZc8X4n2Md6CMl5Ognr+M+g6tsGkMiDVKgsFsg9xbwg=;
  b=Ah6FoUE9kqu6lfB2WBp14YXhnt3U89AfKYuRLTRnku2ED5es6+MSJubf
   W9CCHkYNEXGDZcgscUhTpbV+p7O+8BQGX1WU+4+wq3bcMqubW5SnW+4Me
   e1tWWRbYwlMVsSZbEQwNKNcvNc1ACMxpuZ+r6XnirzQ+q2i3caJluo6rd
   kG1bqhdNAbGbAg/mgeM0ZiieVH0ybN7fzq9oxvkCWNifMybN56e5c+u/O
   TQmwR+7+84qBJWW1pJrXTECC37QS6HfEAPhPMTqpH4UL3sDLz462PJJiQ
   /WOrqNk9EHZgkgG/nsJQqrF0npbHJPxAGrQxDC8jAkLViPtwhw2KWZSVS
   Q==;
X-CSE-ConnectionGUID: p2C4eViZQ+erIq363ZkrVg==
X-CSE-MsgGUID: kp0D/bYjRoy1njA7/u0oGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="38027139"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; 
   d="scan'208";a="38027139"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 05:09:24 -0800
X-CSE-ConnectionGUID: wzVVAHaDTrmgEHtmii830w==
X-CSE-MsgGUID: Da36CVutRxeFgyh5oDzHQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="111418970"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Jan 2025 05:09:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taE0N-000Y3r-0r;
	Tue, 21 Jan 2025 13:09:19 +0000
Date: Tue, 21 Jan 2025 21:08:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version
 generation failed, symbol will not be versioned.
Message-ID: <202501212112.yCddwtA7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Randy Dunlap <rdunlap@infradead.org>
CC: Richard Weinberger <richard@nod.at>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3
commit: a730af6e3114d549555f4b130c216bad1c3aa80e um: Add 2 missing libs to fix various build errors
date:   3 years, 9 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 3 years, 9 months ago
config: um-randconfig-r054-20230701 (https://download.01.org/0day-ci/archive/20250121/202501212112.yCddwtA7-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250121/202501212112.yCddwtA7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501212112.yCddwtA7-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: EXPORT symbol "csum_partial" [vmlinux] version generation failed, symbol will not be versioned.
>> WARNING: modpost: EXPORT symbol "cmpxchg8b_emu" [vmlinux] version generation failed, symbol will not be versioned.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
