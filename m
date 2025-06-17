Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F512EBDC7
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 12:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750162108; cv=none; b=OBUrpGyslWEM1SSzFm/mcrr0DibFEBSIEVM/+pRWoMFnEu7r7Z/5/fhn9pT+UQthMYqo95c5Q9E/DpficPiBHD1LWEFOXtEeVINV6g+9gzXWTQWufXZnj+lrGp2r7nhEIHd+Cvptr3j91dbG3vhGqknML6kyCHrCykHDwMYZsH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750162108; c=relaxed/simple;
	bh=Ww53WJnPD03VAEgCaaQLtjB/XpClusnBjaKfrrEsSVU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gMW/Yrx7n7mr93tYbohuG5hNma+inYOyWZMWnv6KpCmZfxfhM4Tu0acXYnE+8tSxRcAYDtXo6MYfHkSQyDKu6b+gEqkVZU82BIIK/R9C8QvJlziepHx/2pgpRWvWfCr+QjiJgrMhnJKVFoP5VAAAS1OzamZMDyH6YRm7HbG2a5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgEnaQtt; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgEnaQtt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750162106; x=1781698106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ww53WJnPD03VAEgCaaQLtjB/XpClusnBjaKfrrEsSVU=;
  b=lgEnaQttuBZMPnS6S7SMl1xxIfczOs5MNbiTwoHxESZPLpQAz0sRYNRY
   1R6exSir670Fh8bCo6JRryQjYYdWERIctqhs7lIBXOY+I4+3AXyCD6FCO
   8RIJ1hJobjSJQ3wnMruzFAO7TKNSZs606Xi1L2klW4N2EoDSsmvkT220O
   VyBIl5I1ooUlvQRu6z5M8/M6wGZKwe4RTJcxwUZJ4xDjwH/Dl3g5kof+Q
   R0zvmobTXBRJvAyiwFqi6G4vyX5GjGgwPODKCuVU1bpyJCZxKGkniTwUW
   +gyIwLLdny7PKD6jNV9LAmv1IFka+e9r/u7a7w+6szEQu2iU9CGKI/Pzp
   A==;
X-CSE-ConnectionGUID: gK1J7ozbTHCpqJ231frdGQ==
X-CSE-MsgGUID: Ms4dbh8YSMuYzF28+xEEMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52471382"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52471382"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:08:26 -0700
X-CSE-ConnectionGUID: miUvJBrGRbSgefs7iNcgAw==
X-CSE-MsgGUID: 2ujmpC2RSPiMglqOa6rc1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="148667250"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Jun 2025 05:08:25 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRV70-000Fws-2k;
	Tue, 17 Jun 2025 12:08:22 +0000
Date: Tue, 17 Jun 2025 20:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sverdlin:snps-trng 9/23]
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb:
 /soc/reset-controller@3003000: failed to match any schema with compatible:
 ['sophgo,cv1800b-reset']
Message-ID: <202506171945.bXAyOJ8V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Inochi Amaoto <inochiama@gmail.com>
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>

tree:   https://github.com/sverdlin/linux snps-trng
head:   21e232768cb64142db24034d3dceffbc48c2447e
commit: 2634d7a3694b04294e85c039260809f2c59503a8 [9/23] riscv: dts: sophgo: add reset generator for Sophgo CV1800 series SoC
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: riscv-randconfig-051-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171945.bXAyOJ8V-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171945.bXAyOJ8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506171945.bXAyOJ8V-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
--
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
--
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
