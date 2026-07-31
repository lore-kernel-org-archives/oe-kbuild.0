Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058927A476
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Jul 2026 09:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785490875; cv=none; b=mY0duxnDyEzIarAoEX+VMBu5sK6Nl4tIYFttz+L8dfNdok+Jmo2lOsw/zkiCyI8lNBuoAZf1aSgxaynB+8znUMJ0W1KbGwsc3cBPwZryBPsjG+LAiw8eWYiVbCyo+62tvUgBOiGrYB1UYlVeMmYcPezP9SQJx3S//Hb89HEZbhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785490875; c=relaxed/simple;
	bh=3RsIPhnX3BoXRlH9J68S4B3zsSdySfHAQyAhwm+NpP4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mP2IrLMebgsOxtFDH725UMvRoWubkYpAF7FBt0ZiWBiJ+T7tCU+TX/bmLYG1+0oECgFgr356NR59Cig3CHhhY7KUvDSwOR3mgpz23rEmBkyBQ9knH2BpLwcTsMvmmXtjonybo45UbpU/h97r6IVMLLLHxlDvs2qysMm1L9Hw+sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0vAfssk; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0vAfssk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785490873; x=1817026873;
  h=date:from:to:cc:subject:message-id;
  bh=3RsIPhnX3BoXRlH9J68S4B3zsSdySfHAQyAhwm+NpP4=;
  b=W0vAfsskdP/59fzO3tM8VpFYZMKnEkdgNFYAQa6uBV1deXJpipRFlmpR
   eGwz6SG9JKLaq1OTdKf+J1f8QfCMeInSSSiWK2iNuS4oh1WEJQTJa5XxT
   hEGheHX1rXNLiDYY8WoCKHq62jwSwCtqPUpRQEJfM/KTpY1O6U6JcvGWF
   YUi1xiKBcvsY3QaXLvLUzmrwcJk4V9nOSYCzucoTasUQSlWuRDSzm62ZH
   d0EtzIRa2Zbi7LGjCRcTLJlbVfl9o2stLtEaid2V/QTgJTW4+ZWLpLkjj
   iZ9EL5riHw6RSiv8LaalCUnjRBxOOBFP2syhh8+dYafCS8EJiD9rzyVyu
   g==;
X-CSE-ConnectionGUID: 0vcOCX5YSCGXuIgEPb6aWg==
X-CSE-MsgGUID: O9kviSetTa+aZElad+xOvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="111663132"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="111663132"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 02:41:12 -0700
X-CSE-ConnectionGUID: a5rBCJYwQUe7DmVerf+NGg==
X-CSE-MsgGUID: j2HzMH+iTtqQEDCIScddlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="283865248"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 31 Jul 2026 02:41:11 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpjjp-000000002iQ-2EqH;
	Fri, 31 Jul 2026 09:41:09 +0000
Date: Fri, 31 Jul 2026 11:41:03 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [mst-vhost:linux-next 16/73] error:
 include/uapi/linux/virtio_media.h: missing "WITH Linux-syscall-note" for
 SPDX-License-Identifier
Message-ID: <202607311159.8BW3pzbL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: kvm@vger.kernel.org
CC: virtualization@lists.linux-foundation.org
CC: netdev@vger.kernel.org
TO: Alexandre Courbot <gnurou@gmail.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Brian Daniels <briandaniels@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
head:   a8a2a266a5d6d5a9e839422eea6ba3986e25801b
commit: cbd7147ab405921843903c72ff7b7e2066d9ba78 [16/73] media: virtio: Add skeleton virtio-media driver
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260731/202607311159.8BW3pzbL-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311159.8BW3pzbL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607311159.8BW3pzbL-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: include/uapi/linux/virtio_media.h: missing "WITH Linux-syscall-note" for SPDX-License-Identifier
--
>> s390/cpumodel_subfuncs_test.c:266:30: error: 'struct kvm_s390_vm_cpu_subfunc' has no member named 'pfcr'
     266 |         { "PFCR", cpu_subfunc.pfcr, sizeof(cpu_subfunc.pfcr), test_pfcr_asm_block, 201 },
         |                              ^
   s390/cpumodel_subfuncs_test.c:266:55: error: 'struct kvm_s390_vm_cpu_subfunc' has no member named 'pfcr'
     266 |         { "PFCR", cpu_subfunc.pfcr, sizeof(cpu_subfunc.pfcr), test_pfcr_asm_block, 201 },
         |                                                       ^
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
