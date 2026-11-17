Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794878393;
	b=Zc1TaIHeWO7LxLhgo4MbK5CkngS2tt8JUML6/3slU8+0jNHo3fBA/iOb5TtVBQF++EwM
	 0iSZk9C0WF0CTK9/ECXEY349I0JXhEtbF0m4eIyin279ZFjCG1kWrgdQ1iSrWXHNmPMLe
	 J56XhP1Qf8acOZBqOWp4t1BnoBWZt8uliAvgzrt8B7qTX9iE4xFE1zwYKjAFow/v6AmtP
	 GhxlZt5de408/S9i9G4doZRTRhchDFUOzvq8QUr+5dq5/QISDHFH7LmsiTo3E2X4grDRY
	 zvEwKFZksWYO4TeKtav5+Y6EvayLM+uMi7BK8+YszdIAtPyaezhUd1/LEvMJlfUq+ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794878393;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=FBMYIGpB9NNdENlNSlGUTgXn/NzPa176u+cbeJTZu38=;
	b=pXgHY7IqJt6ZrXlJYV+0lp9dK2LFpxKp3AasLwDuFpOaZ5SeKY+WiwdiPT+31c/VQ8nA
	 ezzigvAHrJbTtdsw5DFta9Kk3Wa1Zn3IezETwaDJJ2xi2auudJWm5+Sf6Y/gpu5+bLpzG
	 Z5ZXBXwajj9GyY6W4rEo13IRC5+//lVIR9Qnv0jXEk+c+tsFnAxShtZdgeJrd0r2lrjdE
	 DO1zoZMc8Hej7wK2Qtu8ivQcRCxt9bvXpW+sHCbfx5fA9ZxztFD+A60n6/knl2pb/nczn
	 RGOFvyhZUMXBLAr6O0sbf3RxmoW8OJ5YXaCMdDqGxItt7DxcD1FFRDV8ZC22laykxXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="b/3cTBLj";
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBF6606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 01:19:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BBF6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b/3cTBLj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794878393; x=1826414393;
  h=date:from:to:cc:subject:message-id;
  bh=iDrcC5FMbXddwby52iidu+XX7++/KQOxsUftfA+VLAo=;
  b=b/3cTBLjKbg8NTUD0x3kfz32XxXkjkuLB+88t5d9PDt4NdyG74e2BrJx
   IDmquQDGs4DkzPaS3J9RYljurc45vWcJG56q11SU1NmUiHekO6WVn5OBr
   /wU/h9JyaQgjfUnBajR9gjADKLTCe9/CR7aeKJhbIZFcHiSuzKGRGF8nN
   OEEkV95zAtoRRdhogu1IrccQ0HBI3jrCiE3JyIFrrxKJ4WmrWfxNswJ3F
   Bi4ovPwbgWRJo0pQJe32FkGFdGI/Ec+tDtpBr1qPvRKugiVQPYMpDTyJd
   mXvSlVw9ktHBwlMNCzZFUji2HCNMvBS5Q6pl9KIH0HOgvcyUz/T4l8hwT
   A==;
X-CSE-ConnectionGUID: NKqXODjiSEyi2Yy1lzQGBg==
X-CSE-MsgGUID: 6Z/hC6ENQaqTWcZ8ztajGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3624318"
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="3624318"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 17:19:51 -0800
X-CSE-ConnectionGUID: yQli2W2mTGWdBxelS4SoWg==
X-CSE-MsgGUID: 2gJRLP6yTzKpjCzerN9ovA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,217,1787036400"; 
   d="scan'208";a="11617409"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 16 Nov 2026 17:19:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xT7rN-000000002uQ-0NKh;
	Tue, 17 Nov 2026 01:19:45 +0000
Date: Tue, 17 Nov 2026 02:18:46 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-lts 152/152]
 ../kselftest.h:311:9: warning: 'ret' may be used uninitialized
Message-ID: <202611170230.IUlCiWZZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "likely FALSE maybe-used-uninitialized warning on old compiler"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   c5e3d3a3d3b60eb95c36e3c49dbfe7a34c220c5a
commit: b66287124d5d6b7ee2ebaf2c3c130388136fb5e8 [152/152] selftests/mm: ksm_tests: use kselftest framework
:::::: branch date: 2 days ago
:::::: commit date: 9 weeks ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261117/202611170230.IUlCiWZZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170230.IUlCiWZZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611170230.IUlCiWZZ-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from ksm_tests.c:15:
   ksm_tests.c: In function 'main':
>> ../kselftest.h:311:9: warning: 'ret' may be used uninitialized [-Wmaybe-uninitialized]
     311 |         switch (result) {                                       \
         |         ^~~~~~
   ksm_tests.c:933:9: note: in expansion of macro 'ksft_test_result_report'
     933 |         ksft_test_result_report(ret, "%s\n", test_descr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   ksm_tests.c:773:13: note: 'ret' was declared here
     773 |         int ret, opt;
         |             ^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
