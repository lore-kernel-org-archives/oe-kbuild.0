Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459BA191F65
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 09:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728467637; cv=none; b=ALu5/7rpJLeKHqEAiyWxk7Tdys/hJ8GW+v5mdZQj3+cMxFv3ZVTcc6eyzIlOeXp2kw6qy39v8rViDX5nUq3xVQuAYBaLHA/5mapDiiTaHg4DulfvBLJOGB3RvAVlCDxlmQK7NSCq7NCLRoQc7ZpGK8RdrbpoTMfyUzncTpSw0oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728467637; c=relaxed/simple;
	bh=psRBCvpPthxXFUPfvaXnJ61FyhHqzGKOXGjQ8oLm5xA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R/V2mNk/VB5qu9ETbCgZHB3Mo3pJd1Q6f11IpLZzdjE/O3vMtCWSx0XaqWI9onU2qYgpxNvETfmGuSbfGum0Y5eJ6lgNe8YWSSbiUyacfkNM8XAmjIxg7owq09T77UlL+bcsqrRrXSey4LOf811gUHOc1PCcO2PbkpwX/oz+jNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdbkQbnZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdbkQbnZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728467636; x=1760003636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=psRBCvpPthxXFUPfvaXnJ61FyhHqzGKOXGjQ8oLm5xA=;
  b=CdbkQbnZtGmEXopvrHD8Fv51zXR+oYPxeJv4vID3HQE/uXZr3J0HskXV
   aO32oSmWfQRj/85vWmzmuitI1QuPkZNds5kvsTrD5U6xO7+qhY9NTDZRn
   pXgTIRm7gKwMbNXNKyth8ZZcUy2OUAlxd3TOPacl7cyZM1DN9HMU87t+H
   kqFBSMZutggdexdXY89G4SFtYa4gOh3XI5q4CWdRcYlPlhevnBZ4jfuNy
   ydVIHUqB2Jxe412lRITtGOrt85DfcqY2c+81zhm+lzXgT9/YALgexqNri
   TfSXJ20Ygw1G9fjyfoji/qEHWw7XUGnU5+HXpC6n/Iy7RB1sq6XCeaBlO
   Q==;
X-CSE-ConnectionGUID: n6C/Tra3THys7bPRMYtdvA==
X-CSE-MsgGUID: Om6M1ZJ5RASbfcUD9SxaRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="53164258"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="53164258"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 02:53:46 -0700
X-CSE-ConnectionGUID: bIQvCj4ERRuxXE0ymHENNg==
X-CSE-MsgGUID: 9c3PICGZTQ+DFvSNYvdLpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80703099"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2024 02:53:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syTO2-00094o-30;
	Wed, 09 Oct 2024 09:53:42 +0000
Date: Wed, 9 Oct 2024 17:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gerg-m68knommu:cf 1/11] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
Message-ID: <202410091720.grDsayDh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-m68k@lists.linux-m68k.org
CC: uclinux-dev@uclinux.org
TO: Greg Ungerer <gerg@linux-m68k.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cf
head:   472b9fae6baae3d777a1d49fa38893ad0e5f0d67
commit: 050dde147e3a6afee3df72e7252c9b59856cc2b9 [1/11] m68k: use kernel's generic muldi3 libgcc function
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: m68k-randconfig-r113-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091720.grDsayDh-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410091720.grDsayDh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410091720.grDsayDh-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
>> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
>> lib/muldi3.c:53:28: sparse: sparse: not addressable
>> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (11)
>> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (11)

vim +53 lib/muldi3.c

b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  48  
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  49  long long notrace __muldi3(long long u, long long v)
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  50  {
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  51  	const DWunion uu = {.ll = u};
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  52  	const DWunion vv = {.ll = v};
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23 @53  	DWunion w = {.ll = __umulsidi3(uu.s.low, vv.s.low)};

:::::: The code at line 53 was first introduced by commit
:::::: b35cd9884fa5d81c9d5e7f57c9d03264ae2bd835 lib: Add shared copies of some GCC library routines

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
