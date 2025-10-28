Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5698C3469FC
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Oct 2025 17:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761670805; cv=none; b=SeKLuDT5kz2ky2oTu3xh8P9bITeAefxcD0TQmnr9l7iRzNZW2KwsIa2QJufeJZpJQHEL7tOsaZ1txYtjBA6TfGXzgbCWU7tdvqTNxTpPymbb9wL7nrBGzQ866VNZjVkcIZB9UDCewzTcEf8OPfqSZsvn9imT10R3SvWkf0Ml6Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761670805; c=relaxed/simple;
	bh=92vfMLwlEnJN4ovUCdLV/jZLVrzGNjMXJEEim51x3mg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jCGZ9bCEADp65f6tnAoQvBQeSgYnxcqKCzU9OF0dzJtOO9afjphUJExHNnHxnlQxU53ttRAUiyaY83JhyVmvMR06Uq6agf8NUzg3NUGKIRFDktBgB4iAfbryPVWLofo4Pi7ICZwqE+A2QD2reflH7nQQzdGG1pJNZw7ySqKmAgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MQY1DOOO; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MQY1DOOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761670803; x=1793206803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92vfMLwlEnJN4ovUCdLV/jZLVrzGNjMXJEEim51x3mg=;
  b=MQY1DOOONdsz/ZdzSUM/Bcp+43sXHKn7kRQQDJi1MTdJRsAWNKf7N/EB
   V6FsR8X5m2vBJP66s6wB/85l1olSmyNjw6Mh8pxSfvrrtj0gOw8U53RNR
   Ib2Ckm6krV5t+qDW3CIVCmddBsFnBW+rTbRgBF56GnQ/tCXEy08uz31oQ
   EUnC0xMMb2MEvat2Vrusl8KJRa35RbPJ2VFIGR2QVlCvO1vRHIbvAlWeF
   EmYK5L1TALU6jQUR/IXb9+njDnlU2zfpIXAVfK5XvzXHHxwcPeuC7JITd
   HPxZ+Glzv1mZB5igcrM7bOFqySuvqPPQHlj1KQAhpABGvIczz/Nwff0i1
   A==;
X-CSE-ConnectionGUID: 7Aavz/CDQLWMo3ivetl3JA==
X-CSE-MsgGUID: 5G6pTVTVRVmIuUcKINoiSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67617381"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67617381"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 10:00:03 -0700
X-CSE-ConnectionGUID: 6+TmyBdBSZOSU+WzGpT5Xw==
X-CSE-MsgGUID: +vwRotwPSKO76mIHV+SpzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189761444"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2025 10:00:01 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDn39-000JUJ-1V;
	Tue, 28 Oct 2025 16:59:59 +0000
Date: Wed, 29 Oct 2025 00:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/ethernet/cisco/enic/vnic_vic.c:64 vic_provinfo_size()
 warn: potential user controlled sizeof overflow
 '((__builtin_constant_p((vp->length))) ?((((((vp->length)) & 255) << 24) |
 ((((vp->length)) & 65280) << 8) | ((((vp->length)) & 16711680) >> ...
Message-ID: <202510290000.29IrWGTk-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Tiwei Bie <tiwei.btw@antgroup.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fd57572253bc356330dbe5b233c2e1d8426c66fd
commit: a0e2cb6a90634f3dc80f16e882a683ee5761b0b0 um: Add VFIO-based virtual PCI driver
date:   6 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 6 months ago
config: um-randconfig-r071-20251028 (https://download.01.org/0day-ci/archive/20251029/202510290000.29IrWGTk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510290000.29IrWGTk-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/cisco/enic/vnic_vic.c:64 vic_provinfo_size() warn: potential user controlled sizeof overflow '((__builtin_constant_p((vp->length))) ?((((((vp->length)) & 255) << 24) | ((((vp->length)) & 65280) << 8) | ((((vp->length)) & 16711680) >> 8) | ((((vp->length)) & 4278190080) >> 24))):__fswab32((vp->length))) + 12' '0-u32max + 12'

vim +64 drivers/net/ethernet/cisco/enic/vnic_vic.c

f8bd909183acff drivers/net/enic/vnic_vic.c Scott Feldman 2010-05-17  61  
f8bd909183acff drivers/net/enic/vnic_vic.c Scott Feldman 2010-05-17  62  size_t vic_provinfo_size(struct vic_provinfo *vp)
f8bd909183acff drivers/net/enic/vnic_vic.c Scott Feldman 2010-05-17  63  {
f8bd909183acff drivers/net/enic/vnic_vic.c Scott Feldman 2010-05-17 @64  	return vp ?  ntohl(vp->length) + sizeof(*vp) - sizeof(vp->num_tlvs) : 0;

:::::: The code at line 64 was first introduced by commit
:::::: f8bd909183acffad68780b10c1cdf36161cfd5d1 net: Add ndo_{set|get}_vf_port support for enic dynamic vnics

:::::: TO: Scott Feldman <scofeldm@cisco.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
