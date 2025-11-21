Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E726727CCF0
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 23:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763768616; cv=none; b=auQxd/24oq3zs6C6jpSAeeko7PND2d5572M8bJjNrZ/mhh9F/2qStw353JexGXFqpVz1Pi1/TGIDfoMYQQ8esqiaqlaKYZ0mhdosBaJhABJasef4XjDLQS8UMRNfAu/53d2vUMOIwO5yDCXZmf0mDX3gDWDO3ygBn1k80xwqtho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763768616; c=relaxed/simple;
	bh=bN595K9YZIYG2Tg11PaPtUNjW7eVcvg8IkMqudMVnv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIX31roj8zSuJgMW6Wwi4MJRov84pT7QYrxoInEaea4j6KtAA4Mkz8bD6bHc4rvpbZHJiu7eHv+wdke/209JtsYwtAVBcdOF0Mlr6qecDay04eDfMD1CfFDnT9gVkIsYO5qvZKo5HrcgNamgcTeJ7gPYl53O5z8Jwa4yuXpqenw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yyw0pxMy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yyw0pxMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763768615; x=1795304615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bN595K9YZIYG2Tg11PaPtUNjW7eVcvg8IkMqudMVnv8=;
  b=Yyw0pxMyJrw/k6BbQ/5kXvqaFKJVxpByxtVbvk4R1fVK9LkOJfDRDIWz
   5/u0lhanzDmBs3LWjVZE7OSrIWxoKl1XBiHWLulII0gVPTFcH5y9Dbjam
   0Kqgng8OcU1NaQXE0kTWYqKX6ZprXA6AFvAZpsFJ96IEe57bfeYd1KX66
   DeOmYHT2YZCZAJMqUn5g+6F8nvLErvsJK+aYSgh+jNHAD2lOKNFhjR/9U
   vyUnN2O/EFKsru77+Y+5yKvb9pdqctU5OV1DfaSAPuF8DLgdM/sPXOeaj
   LvLbITuGcqD+OHSXbbg1xozCFij5Uv77RMJD59kIQWZauf+gOk/Y9aGpv
   g==;
X-CSE-ConnectionGUID: paka27kkS+afx0hgFCAyFg==
X-CSE-MsgGUID: 6vXxeUKeRQWMFN3GR2cm0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65910252"
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="65910252"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 15:42:58 -0800
X-CSE-ConnectionGUID: eLrOBLfgTLyD6TDPhh91gA==
X-CSE-MsgGUID: 2tCTsLVSQyGrMdIFbLEhIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,216,1758610800"; 
   d="scan'208";a="196757112"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Nov 2025 15:42:57 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMamF-0006yp-17;
	Fri, 21 Nov 2025 23:42:55 +0000
Date: Sat, 22 Nov 2025 07:42:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/media/i2c/ccs/ccs.o: error: objtool: ccs_set_selection():
 unexpected end of section .text.ccs_set_selection
Message-ID: <202511220717.5HHMLUHG-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Ingo Molnar <mingo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: x86_64-randconfig-101-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220717.5HHMLUHG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/media/i2c/ccs/ccs.o: error: objtool: ccs_set_selection(): unexpected end of section .text.ccs_set_selection

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
