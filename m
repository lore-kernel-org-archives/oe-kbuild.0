Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC1122083
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764202295; cv=none; b=rtzkYinEhH3n4BK2oNORxBzOaWDgHkY4EeFLlcLsKhvBLzrkZoJ9AFfLdFauhQOrHfHb4TlqLLr5jFKoJAuMBeub2jLK4M7Gwp0x1QL3oLap94DNrl55if/T4agXGiLlBFz1iGPHOjIokDCLCWZDXmB2HvhFPBErGx5GKjeAoH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764202295; c=relaxed/simple;
	bh=9YQcQEh1HSBsWaZQRckfIGieeFMHTtUA60xK7oKmVbo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u0bTNpeE2GmcG+AUlDgqF5vc27QOtUMQUaRUtS6xk/d6aMdfouzOMSskF2nV4gZeAOEhgSgjg/peD2UYuxCo8FjuRN6XSJIWUbm/oS2wyYp3MhTQbFKgjluBVgyCT6skOjKmZS3fkhD/IO/wcBN0abVC3xn62vKB4Wdmo3E7KYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAyWwumC; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAyWwumC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764202293; x=1795738293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9YQcQEh1HSBsWaZQRckfIGieeFMHTtUA60xK7oKmVbo=;
  b=OAyWwumCYbcxv3FXMQT/LmCJ53Qi4m9JUApMnOEdJkIM4OdU0BEc2W7d
   grF91Uazh7vu5iIneTssX0pBePiNLWxQG2Tk7T102jttC9XIDI91s5K7a
   aEWXyvEkd7rf4WpQO1UMxcMBlRJ7VRfVlorQ29SDXmJj5FuskmtJ867eK
   zyZsWW3e0AeZ5MhgTWZL270VTG/XGRFII6Jumr9JcuOVYYn7wDXFnC/Ca
   rxZROe9gRArBpGgTXFihNn7kbEpIlsu0Lhhv3ockWRw9EHHf35HIp7I9+
   YYrp5buVqyGThHpKp5uO/gUe7GodWgAaDTEVx+fdIhMksjVuLn9omIhUi
   w==;
X-CSE-ConnectionGUID: zVKehB/vSFW2UAOkJNn9Pw==
X-CSE-MsgGUID: ofY516HMRheM5Zr6NlBPkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="69870642"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="69870642"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 16:11:33 -0800
X-CSE-ConnectionGUID: NVW0YvMsSRO7LQ51R1C8ZA==
X-CSE-MsgGUID: JckCGv1qT2uleQGAqDOzXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="230358016"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 26 Nov 2025 16:11:32 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOPbd-000000001Yn-2lD9;
	Thu, 27 Nov 2025 00:11:29 +0000
Date: Thu, 27 Nov 2025 01:11:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12-lts 1/1]
 kernel/trace/trace_events.c:2807:6: warning: no previous prototype for
 function 'remove_event_from_tracers'
Message-ID: <202511270141.OKIjUmAB-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   639650a6ed80de770c67234a586c214adfee1c7d
commit: 43c26111cafa87d81570c63d96c497e13ec883da [1/1] ANDROID: binder: unload C Binder trace events
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251127/202511270141.OKIjUmAB-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 226765b60cc54e03386f38874a177c906f5aa6e7)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251127/202511270141.OKIjUmAB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511270141.OKIjUmAB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/trace/trace_events.c:2807:6: warning: no previous prototype for function 'remove_event_from_tracers' [-Wmissing-prototypes]
    2807 | void remove_event_from_tracers(struct trace_event_call *call)
         |      ^
   kernel/trace/trace_events.c:2807:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2807 | void remove_event_from_tracers(struct trace_event_call *call)
         | ^
         | static 
   1 warning generated.


vim +/remove_event_from_tracers +2807 kernel/trace/trace_events.c

1473e4417c79f1 Steven Rostedt           2009-02-24  2806  
43c26111cafa87 Alice Ryhl               2025-10-20 @2807  void remove_event_from_tracers(struct trace_event_call *call)
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2808  {
7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05  2809) 	struct trace_event_file *file;
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2810  	struct trace_array *tr;
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2811  
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2812  	do_for_each_event_file_safe(tr, file) {
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2813  		if (file->event_call != call)
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2814  			continue;
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2815  
f6a84bdc75b5c1 Oleg Nesterov            2013-07-26  2816  		remove_event_file_dir(file);
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2817  		/*
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2818  		 * The do_for_each_event_file_safe() is
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2819  		 * a double loop. After finding the call for this
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2820  		 * trace_array, we use break to jump to the next
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2821  		 * trace_array.
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2822  		 */
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2823  		break;
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2824  	} while_for_each_event_file();
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2825  }
ae63b31e4d0e2e Steven Rostedt           2012-05-03  2826  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
