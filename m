Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB7419D090
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Feb 2025 20:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738959245; cv=none; b=PoPrlAePRvwi2r9TPAb66r5sNTvMKvY3xxAQbMfIXmcYhr1UFQeIkjaH1i/k10hsDt0FJENt0tyXCHmly9+RumTIH4DGhJxDJuAahsMIUAxJaFj/blJZS7m2eOArndQHvTSuC2lq+1nh1a0lwO1zaoL766EhvQwlAFXp32uyG24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738959245; c=relaxed/simple;
	bh=ng4xxRuA+D+jdbX/DF9FAtEt/mYD0xCQUXTaYz5AU4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+8efOQwtV0DNCmk7E/cy4xMJseXArLyVv3548tXnyr53SgQvYqC7wxSTVXU8bDoh3VMBKZD6ykxAbSBgeYn+4rgstVNsB9Lz55uMkNqLOZSVi841JnlN0Ve2lJC5OWeuneWZSSKC8zWYbqG4NlnIBsGKWR0U36OjbnB+X0Ormk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RT20QGnA; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RT20QGnA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738959244; x=1770495244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ng4xxRuA+D+jdbX/DF9FAtEt/mYD0xCQUXTaYz5AU4g=;
  b=RT20QGnAH/xtJrsDrMnK1EXCsKH2MwPdJ9tfA9xAR+R3LssSr8Flp6nn
   7NVAR2sXijoBviOdNoN8V/6vw2k7rQelg5+TiESA5DUhtQPHXUasXMVj3
   v3gtkPJwFQpDJYuN5EgJwIdCkjdEfDguDuSCYYK0bmTpWLFKEKot15pgy
   e6A6CDvddHj+mu9XMgrwk+ArPVX5CIXdXYIg6HtljjNhL3UZpvoERnsUa
   r+h4/gKu0Y/Euo4Tkek+GNaU6VD2/uxQOkx/rBt0QW658rtlcXYr2jlKD
   fDyPkohx5rmhS52Pahr+6RChH1no7zpb5n9Cn9d6zMZGqH6q0ZGvqPWjx
   w==;
X-CSE-ConnectionGUID: +avsohLzScSoqjVL9LDt7Q==
X-CSE-MsgGUID: xCAdTLFwQVCKzkEr/ELReg==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="42454351"
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="42454351"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 12:14:03 -0800
X-CSE-ConnectionGUID: FGG98P27Q12kgGESVi467Q==
X-CSE-MsgGUID: 4/n59u7KR7ehc4MQx5ZtZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,268,1732608000"; 
   d="scan'208";a="112242978"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Feb 2025 12:14:02 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgUjg-000yyp-0y;
	Fri, 07 Feb 2025 20:14:00 +0000
Date: Sat, 8 Feb 2025 04:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-6.1 3/3] WARNING: modpost:
 lib/test_user_copy.o: section mismatch in reference: (unknown) (section:
 .text.fixup) -> .Ltmp1 (section: .init.text)
Message-ID: <202502080422.YsrV7cyX-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Nathan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   1ac09f5c057146455dc10fccd52a8f5f34039fb0
commit: 36fbcadc208e968008ed3ffb89cb2a265c4f276c [3/3] modpost: Include '.text.*' in TEXT_SECTIONS
:::::: branch date: 73 minutes ago
:::::: commit date: 12 months ago
config: arm-randconfig-r053-20250208 (https://download.01.org/0day-ci/archive/20250208/202502080422.YsrV7cyX-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502080422.YsrV7cyX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502080422.YsrV7cyX-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp1 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp4 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp7 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp10 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp13 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp16 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp19 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp22 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp25 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp28 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp31 (section: .init.text)
>> WARNING: modpost: lib/test_user_copy.o: section mismatch in reference: (unknown) (section: .text.fixup) -> .Ltmp34 (section: .init.text)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
