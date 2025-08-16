Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508B21C5D55
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Aug 2025 06:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755326464; cv=none; b=dpcV0Jxkva6NymBiQ5FcsZpG9AhEHtYDcaJKEuuY4d0nUxbCHkGFZoSt7TLydElHdh9AMD1LYcErklCLdOXp5iyCMDKXWGSjE9GYaxlTn1gusnEGrPTi/m3Sb7q/lVzVFQlDVyV7DTwu5yITa4NIAqKTpYt6nQYnEtxrdErcOe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755326464; c=relaxed/simple;
	bh=OndpsDdaNM/erfrS5Ibg0c7sNpWDzrk/+bxsisREalA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jQ+TnieKcaH1sIXXXDFpq5OmfsHI+9HbE5c5+0Sya+aOgSNuylFYTlcB0HhyDwXwSIzS/FfPRPAi8THNz0eymh4qGJ/RJ8I/xY1lt/tp58fSYa4Zjvn06rfqpQmyjoCZu7pn5rkjiLdQsbKmi+Xn1Z3B9BqIUt7GuO+62o0Oy58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J7erbNyA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J7erbNyA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755326463; x=1786862463;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OndpsDdaNM/erfrS5Ibg0c7sNpWDzrk/+bxsisREalA=;
  b=J7erbNyAZP4lR3jhnSgrNAEv5kGPYqmCAmDTGV/VDCIPimdHBQ2wtorX
   esCbL3q2yxO8rBfYtnBFMA1dmU92dVZsVd7EPxl7DUKdFOmUY55Qs6XeK
   OLnazFCpoDxneZx4KUFGY/1Y7Luk+8MgM/VWPW2OtaOD5NCx0xYWQHOId
   ICgfghPFhC1u7Pej+Bu2kicdYPH5VOA8NwMkB5xUvN4ZJOCyaDHmiYhmq
   R+A/KpI1Crn73UOUdACCXQHHwoqjmyogg+94MjjUTVY6zoEiwhu4sqdHt
   vjg6fEMIAaPThdx1oOQFIIMA5eZ1lUTItxQH3v/WJ7LeDK/eKVI7jqOao
   w==;
X-CSE-ConnectionGUID: iqj/um1aQ4+oYXhtedCoFQ==
X-CSE-MsgGUID: GhJZw23WQQewOFGzD2lCDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="57349705"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="57349705"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 23:41:02 -0700
X-CSE-ConnectionGUID: +9iMVuB1T6Sif+qoFi0LgA==
X-CSE-MsgGUID: JNE/weoWQX24iL8TCT5png==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="166351556"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Aug 2025 23:41:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1unAb4-000Ce8-1J;
	Sat, 16 Aug 2025 06:40:58 +0000
Date: Sat, 16 Aug 2025 14:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v5 4/9] ovl: Create ovl_casefold() to support casefolded
 strncmp()
Message-ID: <202508161416.sbuLMXuI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250814-tonyk-overlayfs-v5-4-c5b80a909cbd@igalia.com>
References: <20250814-tonyk-overlayfs-v5-4-c5b80a909cbd@igalia.com>
TO: "André Almeida" <andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/fs-Create-sb_encoding-helper/20250815-013213
base:   0cc53520e68bea7fb80fdc6bdf8d226d1b6a98d9
patch link:    https://lore.kernel.org/r/20250814-tonyk-overlayfs-v5-4-c5b80a909cbd%40igalia.com
patch subject: [PATCH v5 4/9] ovl: Create ovl_casefold() to support casefolded strncmp()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: alpha-randconfig-r071-20250816 (https://download.01.org/0day-ci/archive/20250816/202508161416.sbuLMXuI-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202508161416.sbuLMXuI-lkp@intel.com/

New smatch warnings:
fs/overlayfs/readdir.c:82 ovl_casefold() warn: variable dereferenced before check 'dst' (see line 80)

Old smatch warnings:
fs/overlayfs/readdir.c:1008 ovl_dir_fsync() warn: 'realfile' is an error pointer or valid

vim +/dst +82 fs/overlayfs/readdir.c

4edb83bb1041e2 Miklos Szeredi 2017-07-27  71  
3f345b5617fb37 André Almeida  2025-08-14  72  static int ovl_casefold(struct unicode_map *map, const char *str, int len, char **dst)
3f345b5617fb37 André Almeida  2025-08-14  73  {
3f345b5617fb37 André Almeida  2025-08-14  74  	const struct qstr qstr = { .name = str, .len = len };
3f345b5617fb37 André Almeida  2025-08-14  75  	int cf_len;
3f345b5617fb37 André Almeida  2025-08-14  76  
3f345b5617fb37 André Almeida  2025-08-14  77  	if (!IS_ENABLED(CONFIG_UNICODE) || !map || is_dot_dotdot(str, len))
3f345b5617fb37 André Almeida  2025-08-14  78  		return 0;
3f345b5617fb37 André Almeida  2025-08-14  79  
3f345b5617fb37 André Almeida  2025-08-14 @80  	*dst = kmalloc(NAME_MAX, GFP_KERNEL);
3f345b5617fb37 André Almeida  2025-08-14  81  
3f345b5617fb37 André Almeida  2025-08-14 @82  	if (dst) {
3f345b5617fb37 André Almeida  2025-08-14  83  		cf_len = utf8_casefold(map, &qstr, *dst, NAME_MAX);
3f345b5617fb37 André Almeida  2025-08-14  84  
3f345b5617fb37 André Almeida  2025-08-14  85  		if (cf_len > 0)
3f345b5617fb37 André Almeida  2025-08-14  86  			return cf_len;
3f345b5617fb37 André Almeida  2025-08-14  87  	}
3f345b5617fb37 André Almeida  2025-08-14  88  
3f345b5617fb37 André Almeida  2025-08-14  89  	kfree(*dst);
3f345b5617fb37 André Almeida  2025-08-14  90  	return 0;
3f345b5617fb37 André Almeida  2025-08-14  91  }
3f345b5617fb37 André Almeida  2025-08-14  92  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
