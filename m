Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EB62D0601
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 17:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769879239; cv=none; b=RgnDuw6KtYDi6oPG53H/z8qm1YWfh/S/Zqxyn8bDoKfYOqX8F+hYcHHch9penHCJesEswOaMdam1YzdrvF4qyWy5XRr49GFRTa0Svs+89t+z5QlQxf+IH4glnYU3cYIT6MKQrSQoWfVt/yCezAFnpr7Taenx+WIyJ7fap0IAXH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769879239; c=relaxed/simple;
	bh=e5WyW80hykzDh9cX+YXza/Di5ae/fVM2cZP4z67Zh9I=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I2QLuwzu7kXGH4+V5poPVC9tqbj45H9C1t1vZkXLtWmT7wmETZhThnUYCfKuvtjRBS1S5N+3Iu72CMMkHB7bVF7/M7Iy+caSozRb4bDjrPDpIfWu7D3Vhkdpn75oP7UEr5qnEfGBq42tbQpHG4NNu7SlDeAc8Zj8ZGwgFXutazk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I5NnrBib; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I5NnrBib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769879238; x=1801415238;
  h=date:from:to:subject:message-id:mime-version;
  bh=e5WyW80hykzDh9cX+YXza/Di5ae/fVM2cZP4z67Zh9I=;
  b=I5NnrBibqMECpGxQbvzRCPqr/ITw7xNtXKSpHRH3vv+JfzOYIkk3UPYq
   YeJ/vCzOrrRGjj6eYRraI6dlHox3GEznXyVDG04wi0PJaLEg0wQGCG2ac
   rxgCtOq7j2IzLePzwXCn8lVbedXoe8umf41EkwNf/IMsnlf+pmGK7jsxE
   VtsM1xwPgXkyESOMHzyArYLFiF47qiQVKSig3HGYBQQAtK3RaE5tx4m5h
   gWTyV0KJrNbvuFRMLY1r64LxsOKpIJOJ4vJ0/AgKlKekufMf4H/xvCEII
   DfeVEv1fK0TtY4hIauLhNGjV6KcnWh3GySWCoafdzEukgQDdPhBo5Ajty
   Q==;
X-CSE-ConnectionGUID: RJVUckR8Tgi/YBa5qdlvjA==
X-CSE-MsgGUID: rfpGg4wdROiwq6o4dvoeFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11688"; a="71085026"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="71085026"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 09:07:17 -0800
X-CSE-ConnectionGUID: N5fhoAIQR1qb9iqBeQGIXw==
X-CSE-MsgGUID: UsPygXv/QqWPoownw6+umQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="232040675"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jan 2026 09:07:16 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vmERG-000000002it-1pkF
	for oe-kbuild@lists.linux.dev;
	Sat, 31 Jan 2026 17:07:14 +0000
Date: Sat, 31 Jan 2026 18:06:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [RFC PATCH 3/9] tools/nolibc: Add basic ELF self-relocation
 support for static PIE
Message-ID: <202601311838.nIEV2gnP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260131074440.732588-4-daniel@thingy.jp>
References: <20260131074440.732588-4-daniel@thingy.jp>
TO: Daniel Palmer <daniel@thingy.jp>

Hi Daniel,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Palmer/elf-Add-relocation-types-used-by-nolibc/20260131-154743
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20260131074440.732588-4-daniel%40thingy.jp
patch subject: [RFC PATCH 3/9] tools/nolibc: Add basic ELF self-relocation support for static PIE
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260131/202601311838.nIEV2gnP-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'helloworld'
#97: FILE: tools/include/nolibc/reloc.h:15:
+ * -static-pie -o helloworld helloworld.c

WARNING:REPEATED_WORD: Possible repeated word: 'helloworld'
#102: FILE: tools/include/nolibc/reloc.h:20:
+ * -Wl,--no-dynamic-linker -pie -o helloworld helloworld.c

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
