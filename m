Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46C218B479
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 22:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724969984; cv=none; b=jQK+S+ozSqKSwmq7aUteWKA3o1S8k+++PTWDX20c0foLqa+ommzSFZL0n+nZpP0KsYrJPH96x/AZi7d2XO9Cblgt3bGwKEy+UHT30dyXgyO2EVMQ0hebbaDhB1zywFVogmbR7l//stxeCLXqDgylNA8CI1u4AU8cUJqwxEa4Joo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724969984; c=relaxed/simple;
	bh=JxXmjhbfj/j80eaSH0uo7ATmhfHyo/hDJR7rD3u0Q9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B/Vkrg9y3taD0BsjyFaLYWH594wOJnyBRx6kUpk3DtKOLC7ddJ2VjDOrGWNg9XvWe/PBOrIRCJkGGSqGcbsbglHcWOqWXrgj8RQKizTCK1fkWm34YQ9ZLs4fk+fqUbjm3GItkkjBM7Lwbe9kSFsh5YpxiTTwOUBnwsBYNDrEpQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PN6ijDsy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PN6ijDsy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724969983; x=1756505983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JxXmjhbfj/j80eaSH0uo7ATmhfHyo/hDJR7rD3u0Q9I=;
  b=PN6ijDsyPySiLAynPlOq7t259MLiJmNQZd49j/v+Y1HrMW2a9NcfaLpa
   KeKbvhWHphexbjR/KrbUWKkvZQBO75LQqDZ2yTV9rb2djASTzllGJbm+t
   3XbTxLVx9BuSOwgUy5621vaflvZF0dUShyhpw0BcXbxu/fy+7TwsXLfbB
   F68jHK1AqR1rMOrTP8LBKsWxpqKMXffA0YQFlKVdSetQt4Q/JjhMs9Fsd
   bxRXrHj/T+Xz2gc45oNTo9R2PwapDpauspwa9gDYt+/joFeor0iyLSgzk
   iB29zOAGWesPYPUzhNp7sXIXOfW/fqfegzvwMpmdWJbxhV8PfcFIWxrhR
   Q==;
X-CSE-ConnectionGUID: xVMoYQyqSTqu8ZYdZ6obIw==
X-CSE-MsgGUID: GfG8mKAlQc6rwL4qNNndGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23783571"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="23783571"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2024 15:19:42 -0700
X-CSE-ConnectionGUID: VnQsm3vjQtixsogsnHrQRQ==
X-CSE-MsgGUID: WmUf9uTTT2OfqY8ZMmMWrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; 
   d="scan'208";a="64452576"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Aug 2024 15:19:41 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjnUP-0000m8-3D;
	Thu, 29 Aug 2024 22:19:37 +0000
Date: Fri, 30 Aug 2024 06:19:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: llvm-objcopy: error: Link field value 85 in section .rela.plt is not
 a symbol table
Message-ID: <202408300628.TxTe6LMk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only scripts/mod/modpost.c file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b9dfd9e59367eff5f65ef2a850f2df674f1f1c5
commit: 397586506c3da005b9333ce5947ad01e8018a3be modpost: Add '.ltext' and '.ltext.*' to TEXT_SECTIONS
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: um-randconfig-r061-20240829 (https://download.01.org/0day-ci/archive/20240830/202408300628.TxTe6LMk-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408300628.TxTe6LMk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408300628.TxTe6LMk-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: warning: .tmp_vmlinux.btf has a LOAD segment with RWX permissions
>> llvm-objcopy: error: Link field value 85 in section .rela.plt is not a symbol table
   btf_encoder__write_elf: failed to add .BTF section to '.tmp_vmlinux.btf': 2!
   Failed to encode BTF
   .btf.vmlinux.bin.o: file not recognized: file format not recognized
   clang: error: linker command failed with exit code 1 (use -v to see invocation)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
