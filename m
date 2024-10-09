Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090D91714B6
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 07:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728459342; cv=none; b=TRh2ncfjv9csq5gjBPotffD9inRXd3afU7nBQ1U75STWOLX/T+8Dt4OAaNJUyYSv4WNvmyzqKB58xoJtWwlKg+hnXycbj/1UgxonAwyTd1/Jb+AeePNRe45bRvTc6H1+UV0QbQn5f0uC66vtLgZ2tSKZq/JpeG/zU16hMM++9Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728459342; c=relaxed/simple;
	bh=acp2WV7fX/TNnltdBYIfO4bY48lCaLNpvB3nL+CEBDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j+xKlSlPUqSx/od3vOmL2KMYWEoGHXD+B29uH36eXGtfv2uPVnjhUG4MWqHmEpQvr100QeDgA2mPRNeMMHvwNmrsBvmn5s42zbCgL3lFZ2JbxIFxTAJrhSPkyLbKC863kcwI7FTz3QtxxfzL04o8pWxRYefPIHF5Cv0xIQ4g2IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ILnhiDYw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ILnhiDYw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728459341; x=1759995341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=acp2WV7fX/TNnltdBYIfO4bY48lCaLNpvB3nL+CEBDY=;
  b=ILnhiDYwu7zdTseGG7MQMPsjemQG/M1tKj3MuZFsLP6/hhTYKZYt2obQ
   yNnixHHDTXLaOOaKgQbsCK+z63RTElz08udBJkiLnFAEETAisGN1hE6SP
   rWdBfG+SEsKWC2nmT1fKW9yen4nAf3ZMV+ji7o4z1n2hDKY1Fyb8LSCJo
   bo1rGHJoXa+cdEJPf3nwUly7uMeDqhhmAS4s05wM2I51YJGRDckZJNzEE
   y4jRCunlqPUSqgQSEXfKoJTDT38F7OQu1NRUsc65B0y75n1zNPPOcMXgC
   zDFGmc0kS5j/CceUZdztLc9aEDVAn8+0pT6JUgygsACu+vjjrvajnYXqt
   g==;
X-CSE-ConnectionGUID: hxsHaMiUTbC8PSXe2sFEHA==
X-CSE-MsgGUID: BoQ9jEKOSdOUoMr2kTNQnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27863892"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="27863892"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 00:35:41 -0700
X-CSE-ConnectionGUID: blUVSsq1S4S7gIkx0jj2pA==
X-CSE-MsgGUID: fCBSvi4UQnqOphhxUr79eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80956104"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Oct 2024 00:35:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syREP-0008x2-1n;
	Wed, 09 Oct 2024 07:35:37 +0000
Date: Wed, 9 Oct 2024 15:35:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/fuse/dev.o: warning: objtool: __fuse_simple_request+0x2d0:
 unreachable instruction
Message-ID: <202410091530.kajFFTWp-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
CC: Miklos Szeredi <mszeredi@redhat.com>
CC: Christian Brauner <brauner@kernel.org>

Hi Alexander,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   75b607fab38d149f232f01eae5e6392b394dd659
commit: 0c6793823d2b0eb079f4c6f54d9cdf6b2beec9d8 fs/fuse: introduce and use fuse_simple_idmap_request() helper
date:   2 weeks ago
:::::: branch date: 12 hours ago
:::::: commit date: 2 weeks ago
config: loongarch-randconfig-001-20240804 (https://download.01.org/0day-ci/archive/20241009/202410091530.kajFFTWp-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410091530.kajFFTWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410091530.kajFFTWp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/dev.o: warning: objtool: fuse_copy_fill+0xb0: unreachable instruction
>> fs/fuse/dev.o: warning: objtool: __fuse_simple_request+0x2d0: unreachable instruction


objdump-func vmlinux.o __fuse_simple_request:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
