Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C19D530
	for <oe-kbuild@lists.linux.dev>; Fri, 14 Mar 2025 19:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741979775; cv=none; b=czSecbuwiR759+FNsidNu6HPYGU8HjUyfSfqGASsE1R5R9sTDQrmUQ7xmzhP8OVKTc1pYjDLok0I1DznnFXDaBgUv/X/VaLfohmSL2WFKAyxoUzWKh4GZ5S9AWLqUESCcNUTMxOa6gCmAswzXQG3Y2hJMxTFAhcZQY/NYO45xY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741979775; c=relaxed/simple;
	bh=NlSZbf50btthGRxteOllqhOVxXZZIega7ty0ucXrihk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dNqgZM4h+dAJPatI3lFxBvn1MaLX42naDJqfNGwp0v6JWxC0wx277lEQztIu91drjjFeFBfuCBBm/eMOdNiDE4wE6CfrS957kGSwRpVQTBsoiyMpHD0jLMQI19d1pN780vcUd5njaIP9/dUahTobajz8qsI4bLJNiHbAne4Wa5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/Fh5SkZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/Fh5SkZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741979773; x=1773515773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NlSZbf50btthGRxteOllqhOVxXZZIega7ty0ucXrihk=;
  b=C/Fh5SkZbQ7VqaUK+xT3uQIqZDjpwguKgaxvJKP5cy4MDIPxkrL0aml8
   yFIfrlOjHh3PNJC0W71wRDuWOpJH+HzvPqMuCQ9sY4+veSeHg61O5in0+
   AvbZ3RNw59kfK3+NLe4tQPx+rwbViWocG/YYwc+ntbh2kOdHUjsjQWVSy
   Sm/1mIiFIgGEqK2TxJ1UgXCErj0Nnc8XaDoRBri0m2IaoCnQS0Q8i5p1r
   lQ/Ls12rKpy8tdvzosMv4NUGZvvDk0nmnuztPD+/s4KNaJsfg43jDQOhJ
   SxIqU8HFn+v1/wrfo8Ev/MfJ7fHtsIIt4LBiUdLyW6xeQxa1aK2GOCNcd
   w==;
X-CSE-ConnectionGUID: v2VG46w6RYicWRksYt9ffw==
X-CSE-MsgGUID: tstsgZiuSZKBmkrHm/tN1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11373"; a="30730188"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="30730188"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2025 12:16:12 -0700
X-CSE-ConnectionGUID: nZLL173qRTWE9He6z5Moow==
X-CSE-MsgGUID: ozwTg9U2T8isNtFH35Ciow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; 
   d="scan'208";a="121858956"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 14 Mar 2025 12:16:11 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ttAVt-000AlE-19;
	Fri, 14 Mar 2025 19:16:09 +0000
Date: Sat, 15 Mar 2025 03:15:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [openeuler:openEuler-1.0-LTS 1488/1488]
 /kbuild/src/consumer/Makefile:626: include/config/auto.conf.cmd: No such
 file or directory
Message-ID: <202503150349.Roa6uXS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Xie XiuQi <xiexiuqi@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9b569f9f94967c82e0b90de68c468b0e67e84e29
commit: 9cd721e370b364f30d97f7b5ea4ec036ce5dd807 [1488/1488] kbuild: turn auto.conf.cmd into a mandatory include file
:::::: branch date: 12 hours ago
:::::: commit date: 5 years ago
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce: (https://download.01.org/0day-ci/archive/20250315/202503150349.Roa6uXS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503150349.Roa6uXS0-lkp@intel.com/

All errors (new ones prefixed by >>):

   ***
   *** Configuration file ".config" not found!
   ***
   *** Please run some configurator (e.g. "make oldconfig" or
   *** "make menuconfig" or "make xconfig").
   ***
   make[3]: *** [/kbuild/src/consumer/scripts/kconfig/Makefile:69: syncconfig] Error 1
   make[2]: *** [/kbuild/src/consumer/Makefile:539: syncconfig] Error 2
>> /kbuild/src/consumer/Makefile:626: include/config/auto.conf.cmd: No such file or directory
   make[1]: *** [/kbuild/src/consumer/Makefile:638: include/config/auto.conf] Error 2
   /kbuild/src/consumer/Makefile:595: Failed to remake makefile 'include/config/auto.conf'.
   /kbuild/src/consumer/Makefile:626: Failed to remake makefile 'include/config/auto.conf.cmd'.
   make: *** [Makefile:146: sub-make] Error 2
   make: Target 'headers' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
