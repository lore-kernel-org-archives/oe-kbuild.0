Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BBA3AEB5C
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Sep 2026 20:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900047; cv=none; b=mfm/np4jC83DJ7zw7LzQ4mo+FcqGkAH0TnNMaWE6Rv9sZLoLtF01FF4j8IWnOAvw1u5Ilg7cxjgS9KzgQ8U6bygkpwp140FCAlZZ6xyiLOJl2j1AlbJTPTjwtRzZechen+NAtq+6YFSme0rIM+zdIJ/BoUMgwyZRBw2OkwSOiAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900047; c=relaxed/simple;
	bh=NjGnhNZ3bI0MMHY5CIJcRfQQHJ0Cy+C/9vuwTwja0Jg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UoHdf/Qmvws+QNUV2tAXmu6P/vfwcSwQMpPaL7zmogjk//wJQ+DlRidDL7CnuE8fhJQ9FhOLkjy9H2yYu1o+hBSQxGRZg6zI3F9aa/BmeBYRACisDCG2Pr+A4IEDP/gxyMJ1TL7MjA1IenGV9Sa/3ZUglmih0Jo8WjQqZ8v1OA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBc6zyBh; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBc6zyBh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788900044; x=1820436044;
  h=date:from:to:cc:subject:message-id;
  bh=NjGnhNZ3bI0MMHY5CIJcRfQQHJ0Cy+C/9vuwTwja0Jg=;
  b=bBc6zyBhlnv46H0KJ+5DJ1uNE1WK6bLzOR4I1tL/t5VbBVwveDmJcmE9
   sMWtYqrsGUPlSqRfMZoxMk3YTcLzI1IOOJDhl+Iflg0uXdCE9w6dy80NO
   keIaN3cH5eW3FRIMRTictsBhiEREwOb6g+d/Xi4f2NN0qc0diOmbw8Moa
   y8KYtfvqv+q26L9eY61tAXdQa/p8TRuHPybw5mgvmwv515cTyBKin3EK2
   iQ62xr5L51OLORVWPv11olVuGgfk4bc97FxPpwPRwLs3NSnsFb6xeyQeI
   BmpXYvLvZxhPuPLFGJNZFzYk1rIKjjYU61W0+gVIkS/6NXJZ5cqiC0TG5
   Q==;
X-CSE-ConnectionGUID: QyruLd0vRKuiQz/gPi0+Zg==
X-CSE-MsgGUID: hywUQFiTRFqzzMblnY53VQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100669588"
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="100669588"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 13:40:44 -0700
X-CSE-ConnectionGUID: pr85aYZDSxOXiZ7Sjgp01A==
X-CSE-MsgGUID: myIZJx21SOi2UASztZGwHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,269,1779174000"; 
   d="scan'208";a="294625808"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 08 Sep 2026 13:40:42 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x42cS-000000000pe-2WFK;
	Tue, 08 Sep 2026 20:40:40 +0000
Date: Tue, 08 Sep 2026 22:39:59 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [intel-lts:6.18/linux 1/1] unix_listen.c:26:10: fatal error:
 kselftest_harness.h: No such file or directory
Message-ID: <202609082248.MZqUA1cF-lkp@intel.com>
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

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   fba0f76dc652f3ae4d38d5a486cad998d353c67f
commit: 814c5b1590037330381a4ae83aaf40c0986ba2bb [1/1] selftests/net/af_unix: test listen() rejects wrong socket states
:::::: branch date: 6 days ago
:::::: commit date: 4 weeks ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260908/202609082248.MZqUA1cF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260908/202609082248.MZqUA1cF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609082248.MZqUA1cF-lkp@intel.com/

Note: the intel-lts/6.18/linux HEAD fba0f76dc652f3ae4d38d5a486cad998d353c67f builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> unix_listen.c:26:10: fatal error: kselftest_harness.h: No such file or directory
      26 | #include "kselftest_harness.h"
         |          ^~~~~~~~~~~~~~~~~~~~~
   compilation terminated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
