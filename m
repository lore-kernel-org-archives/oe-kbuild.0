Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE74199EAD
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Nov 2025 11:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763726174; cv=none; b=Stf8NwSNksMlu4bG/3NKsd/arQ0OEXjlrTxtHLg7w6aZIhPTPAmSQ42+2xdhp8Max6yiL2C+YVicBehs+1hXwrSRG5oCZYInyyXMhqiUlWMoRNU/8FZUKIcnuDY9Ge8eW+aQl/k86GBcc4Jm66v5rlGCCzKaNRX+hJLA+uHJ5+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763726174; c=relaxed/simple;
	bh=xtsUOUhOodHnziKeOYRIRP+YoKghJt1NNCTTRpr014s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cz0U9nAkg1gK6v+GAhtJ8MhcC5zirnflZO5cjioMdmVqJIwsABWn6lG8U/gPtVTkByKu4d3Kvn8lx+hPQnaOjE1K40RO2o0Sa2NvIsi+t/u6SvX7aATLWq8En2lRhmQYtGipcb/2yZTGCH+mHeS5ph0RmABDDbScsylicjb474o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bRYi7uMF; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bRYi7uMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763726173; x=1795262173;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xtsUOUhOodHnziKeOYRIRP+YoKghJt1NNCTTRpr014s=;
  b=bRYi7uMF+4OW92UG0mDv/9oFHoYEJwjWqd2lvJAEPzdOxE509J213OAk
   kTOuB/j3JTA0vNQR84ot5UOZGNjprLB6a5OKjf0f3rGovsr6xj/mjpcmc
   TsMLlJjYcKW0Z7oovfuAKYVS6Wzv2pZiFMaz51VJsNoiCqsO9QJ8RdGcU
   CBoR4lUPtFqHfAlkG7vazVm9QVwBDl5wZ0/wiHsL34b9n8VONDx9lpga7
   tYRiZUq96rHV9mwmCjq88SU1iAJ6ApLZ6NrWArFUdTA6Hn3MDl341Coi6
   lhP1PwPUOdjk9fiG4qHXvA9/ZbBxX/A9wouDIyV0OPauAGLQO39MprtOh
   A==;
X-CSE-ConnectionGUID: 8882jwklTl2z2KFQflkvMQ==
X-CSE-MsgGUID: 61ZcZj0LTQ2GQSbCgyej2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="83439913"
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="83439913"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 03:56:12 -0800
X-CSE-ConnectionGUID: wi7rPe/hRd+tNYE7kiwiSg==
X-CSE-MsgGUID: 818UYLBjQ7GqzegsWL11eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,215,1758610800"; 
   d="scan'208";a="192450164"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 21 Nov 2025 03:56:12 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMPkH-000000001nV-1odk;
	Fri, 21 Nov 2025 11:56:09 +0000
Date: Fri, 21 Nov 2025 12:56:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sean-jc:x86/irq_bypass_testing 10/11] lib/vfio_pci_util.c:2:10:
 fatal error: poll.h: No such file or directory
Message-ID: <202511211254.Av4Hhc5r-lkp@intel.com>
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
TO: Sean Christopherson <seanjc@google.com>

tree:   https://github.com/sean-jc/linux x86/irq_bypass_testing
head:   5fb9eccaaee7c3113a4bc735bc4e9d9268322c6e
commit: f53f18c3a83801dd2315c07e07325c5d15f2c4bd [10/11] *** DO NOT MERGE *** KVM: selftests: WIP posted interrupts test
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251121/202511211254.Av4Hhc5r-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251121/202511211254.Av4Hhc5r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511211254.Av4Hhc5r-lkp@intel.com/

Note: the sean-jc/x86/irq_bypass_testing HEAD 5fb9eccaaee7c3113a4bc735bc4e9d9268322c6e builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> lib/vfio_pci_util.c:2:10: fatal error: poll.h: No such file or directory
       2 | #include <poll.h>
         |          ^~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
