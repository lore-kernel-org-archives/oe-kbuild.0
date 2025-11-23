Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5525B190664
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763902174; cv=none; b=GqKbxkxEBHuzWtn112f5AGG2IuNuykzYPYP292jdzNy0IrL9IHD+OsZt+qIzMl2r68zv5C8fo2fO7bx62YKLj7c1w8gyV97RB2boqGr6Ccl777y47USX3sfE1mDUhe3+WUrTPplS6+BWWlx+fDzgfR+3z3qOJJdincogp+EMmLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763902174; c=relaxed/simple;
	bh=4GvPR9pHIHohP3l0zEBZCSyXagZID7BZxYBw4aEvxjc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IhbuGQnEdmpwtzJY4P40MUnya/KpLvrjUg/i6f6Wa2wvJHVqU5b3pfx2aSO2L+SYTPRuC8lw2Nk3DbdKA3+5FQ0q90zv+yBWm/UgNNzxQiPEEBPQRz1np86XTJX5fTmm7Yhs0IA5F6VFy/dom3K+jBF9ohO11jdjzkdm/WiMAkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O+A3NlS6; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O+A3NlS6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763902172; x=1795438172;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GvPR9pHIHohP3l0zEBZCSyXagZID7BZxYBw4aEvxjc=;
  b=O+A3NlS67Lu4aFuOqkM2dsan/C6qSQhgJ7udZJf+FUp4PSYRF9jSYIz+
   wtOtMjk6BixBvj8lOSWf9BI39Lg8Ky0NdngR++PKrOECOfUrmfW8NGQe0
   cKOlCS0imutjiJMH/IlHDeRdNONnqnf77odhb8BzEg+3TJXl7SpjKGLZn
   axs8jPVME5ArL4nggVaNFLsq6U/6wcl1A+VMWqsGfIDNaOvtahxjdd3pc
   /lFK9jQjMSTQn0pqW+ULb37o+934ap1nOrddGFqzQT44ZHpuU/LXSpJcG
   BFiCTQcjfRjAZv/BB3qHKBL9DpWZMfU8Br4a+FqQu9krWVCB1SrMCdomU
   Q==;
X-CSE-ConnectionGUID: QDt7G0pkSoSWdiq5KBG05Q==
X-CSE-MsgGUID: ua3+WOp+RVqiLHqgPgBPBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77394449"
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="77394449"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 04:49:32 -0800
X-CSE-ConnectionGUID: ZbBw3akiQHija2fQ1XrqHA==
X-CSE-MsgGUID: 9CEPshtSQ6yXSOVXcOD8Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,220,1758610800"; 
   d="scan'208";a="191270952"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Nov 2025 04:49:31 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vN9Wx-0008Gp-31;
	Sun, 23 Nov 2025 12:49:27 +0000
Date: Sun, 23 Nov 2025 20:48:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH v1 3/3] fuse: implementation of the
 FUSE_LOOKUP_HANDLE operation
Message-ID: <202511232052.lN8GzRFA-lkp@intel.com>
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
In-Reply-To: <20251120105535.13374-4-luis@igalia.com>
References: <20251120105535.13374-4-luis@igalia.com>
TO: Luis Henriques <luis@igalia.com>

Hi Luis,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on mszeredi-fuse/for-next]
[also build test WARNING on linus/master v6.18-rc6]
[cannot apply to next-20251121]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Luis-Henriques/fuse-initial-infrastructure-for-FUSE_LOOKUP_HANDLE-support/20251120-190106
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git for-next
patch link:    https://lore.kernel.org/r/20251120105535.13374-4-luis%40igalia.com
patch subject: [RFC PATCH v1 3/3] fuse: implementation of the FUSE_LOOKUP_HANDLE operation
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-randconfig-r071-20251123 (https://download.01.org/0day-ci/archive/20251123/202511232052.lN8GzRFA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511232052.lN8GzRFA-lkp@intel.com/

smatch warnings:
fs/fuse/inode.c:1198 fuse_encode_lookup_fh() warn: potential pointer math issue ('fh' is a 32 bit pointer)
fs/fuse/inode.c:1198 fuse_encode_lookup_fh() warn: potential pointer math issue ('fh' is a 32 bit pointer)
fs/fuse/inode.c:1198 fuse_encode_lookup_fh() warn: potential pointer math issue ('fh' is a 32 bit pointer)

vim +1198 fs/fuse/inode.c

dbd561d236ff16 Miklos Szeredi 2008-07-25  1181  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1182  static int fuse_encode_lookup_fh(struct inode *inode, u32 *fh, int *max_len,
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1183  				 struct inode *parent)
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1184  {
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1185  	struct fuse_inode *fi = get_fuse_inode(inode);
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1186  	int total_len, len;
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1187  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1188  	total_len = len = sizeof(struct fuse_file_handle);
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1189  	if (parent)
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1190  		total_len *= 2;
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1191  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1192  	if (*max_len < total_len)
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1193  		return FILEID_INVALID;
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1194  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1195  	memcpy(fh, &fi->fh, len);
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1196  	if (parent) {
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1197  		fi = get_fuse_inode(parent);
c1c8bb9e0c6b30 Luis Henriques 2025-11-20 @1198  		memcpy((fh + len), &fi->fh, len);
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1199  	}
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1200  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1201  	*max_len = total_len;
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1202  
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1203  	/* XXX define new fid_type */
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1204  	return parent ? FILEID_INO64_GEN_PARENT : FILEID_INO64_GEN;
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1205  }
c1c8bb9e0c6b30 Luis Henriques 2025-11-20  1206  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
