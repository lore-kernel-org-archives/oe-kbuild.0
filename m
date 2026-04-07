Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123740DFD3
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Apr 2026 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587122; cv=none; b=rX/2a22gYrnddpB+vD/22jp8vlRK+K6jxedrHK6DyIZELJcfMKJNXt0eNrttwR3GwaLdU/pNUXYGfm0b6I4LzvGSqfYGS79OJ9VdJrYk3vMbHkOiUBD8DI31+boD9LfMepSJMgl6qUBOSL58TyXq+mOVPf9YkphhobwDw9VvUDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587122; c=relaxed/simple;
	bh=PWkuxq/W2mSzxf+v4dwdL7HGLlb5mNkddgraGjNIgjs=;
	h=Date:From:To:Subject:Message-ID; b=Fm+wMO50nPMV7qwWIC/SS9dc9H5dJOwZO4xOSVGptHoTXwGOhwHl8q6RGnyJxHzJGqDdrl+D0LCxtHVQ9XCQ7Plq9+EMgVuI6cMY3zGZGo82UVV7cLM+4luCtL3vJvjqQDElIIfFlUpG/FhjdEIz5jytlFoS2kltUWcETL5QlHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9BeVVhy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9BeVVhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775587120; x=1807123120;
  h=date:from:to:subject:message-id;
  bh=PWkuxq/W2mSzxf+v4dwdL7HGLlb5mNkddgraGjNIgjs=;
  b=c9BeVVhyre3UXy3n009oqZe5swaV3FDtCpeNFt1rfeujpOcNF2QDtsyU
   CnsC4IhHtrrRY4s6mbrbwRsSo/wQAx8rJcMJH6OsRK5TwVDhoR7LQyLxC
   8gdQY63aNsVvzjQh2Rqv9VW7ah2EDiMtqDlSgNT4NogNy22hCAg2fSAiZ
   3XMov+uROgFUqKNtsDia6VifZC5mI2JWIBZWk618I0kQ6Y30G3HDbQX/A
   D+zHS3EUHjdIPeqwPFq5Nh7vAqFx8pFsxyyd2livyRmOEhIqUTRNzN9fV
   8EJuPyLRwv8PZ6/bq1fNV9b06XZBcrt0msgrdni8sEfLvKZOOtcUio/vL
   Q==;
X-CSE-ConnectionGUID: ar3pt0r/QlCKKCSPDzdxlg==
X-CSE-MsgGUID: e855m5joQfyUOFhdozDRCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="87188022"
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="87188022"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 11:38:40 -0700
X-CSE-ConnectionGUID: ZY8rhy7yT7alJpVbLPNjBg==
X-CSE-MsgGUID: kRJVXHGyRZSgf5pdVfL/eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,166,1770624000"; 
   d="scan'208";a="227410120"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 07 Apr 2026 11:38:38 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wABJs-00000000AKD-2nDE
	for oe-kbuild@lists.linux.dev;
	Tue, 07 Apr 2026 18:38:36 +0000
Date: Tue, 07 Apr 2026 20:37:41 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [norov:bitmap-for-next 23/24] checkpatch:
 WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Madhavan Srinivasan
 <maddy@linux.ibm.com> for powerpc patch', should be: 'Madhavan Srinivasan
 <maddy@linux.ibm.com> (for powerpc patch)'
Message-ID: <202604072034.bEN8vrkT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/norov/linux bitmap-for-next
head:   916aedc424155719a4cacf55b6d88ba556c1bd0e
commit: 2a0be80c5a620ab380ef483c2c20c6cc3325e311 [23/24] powerpc/xive: simplify xive_spapr_debug_show()
:::::: branch date: 2 hours ago
:::::: commit date: 5 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260407/202604072034.bEN8vrkT-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Madhavan Srinivasan <maddy@linux.ibm.com> for powerpc patch', should be: 'Madhavan Srinivasan <maddy@linux.ibm.com> (for powerpc patch)'
#11: 
Acked-by: Madhavan Srinivasan <maddy@linux.ibm.com> for powerpc patch

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
