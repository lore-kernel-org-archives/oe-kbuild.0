Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471AB3BCD2B
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Sep 2026 16:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790267415; cv=none; b=m4bPyyHrJzHIY/NU6CRyK8nFecUy4+YJdhwsTytimP11RLmTWXQC9YYSRVpF7b1MazkrNktP0/uN6P2ykdBy67S2zpQeJcxDQYb29JhnyrS+k6ZB2aJi/wzTuh6fbSKHGnnjc8g1KrKNLX6PMotHuE+nbITLSt7KFSwISDp4uiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790267415; c=relaxed/simple;
	bh=08xf691ilKWCJIS8fC5qvd+juncxwJfyxQXHEyq9c8A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Vzg7ySKeRDswK7aqibUxrVO5ahSrkVMW2Tz0QYC8kNaBJAJl7U6geU9XNBHIuZC+uPIsqKSxUgjyqM6PHHGFiOL1cVj62K4WClZVarbfRUa8deKY7AUaeuQnBFHiM15810N+Ctc7AlIcU0vLbHswZcc7TQbe6q6FVWYQiQPzSgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MWIN6cJR; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MWIN6cJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790267414; x=1821803414;
  h=date:from:to:cc:subject:message-id;
  bh=08xf691ilKWCJIS8fC5qvd+juncxwJfyxQXHEyq9c8A=;
  b=MWIN6cJR/eybZk1Nmnyz4iVDwM73JnT5I83IklrS7hc0RdBpiLXXoAtk
   T7A2q+GzjbqDHhhO6/utkK4rT6owif1maOYwdXi3QDWvOjXb8Ibvpo89l
   X3uLoukb1kF074vbQ9F7lOK2Lgz+uUoh+H6pHGttM06lErdnjBeHHm1XR
   PWI8nmY46ncK3YgUMSWyS8h+iVudZ0dWmyaMbpHJetmuRZlOrx3aimUBM
   bNSrstYXpZEiH15r4/wir3u56gY6qh1cn20TnLcLfrfoQEqBVqP9mTuM/
   kFbNcLnVG4Y2EA2T3WgllgHsiZfUVbCORyI6z/+Qg3eOEzJRSAjzE0CXv
   A==;
X-CSE-ConnectionGUID: WvdV6VteRveCJXm8tnp3SQ==
X-CSE-MsgGUID: /FHFqNaqRz+oeJF0el4fJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101221709"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="101221709"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 09:30:07 -0700
X-CSE-ConnectionGUID: bnSRYA8ZSZqyLbJDJ3ggqw==
X-CSE-MsgGUID: DIyHO54cRIq/q+USoU8SHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="282164741"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 Sep 2026 09:30:05 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9mKg-00000000JA4-3PVw;
	Thu, 24 Sep 2026 16:30:02 +0000
Date: Fri, 25 Sep 2026 00:29:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 163/8910]
 drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Trying to use
 reserved word 'typeof' as identifier
Message-ID: <202609250044.R601n2jg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: 5c45e2dbe6967bf75a500931d643d5989291109b [163/8910] drm/xe: Use IBC v3 on PTL
:::::: branch date: 2 days ago
:::::: commit date: 7 weeks ago
config: alpha-randconfig-r1304-20260924 (https://download.01.org/0day-ci/archive/20260925/202609250044.R601n2jg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609250044.R601n2jg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609250044.R601n2jg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_guc_pc.c:1297:25: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1297:25: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1298:25: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1298:32: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1298:32: sparse: sparse: got -
   drivers/gpu/drm/xe/xe_guc_pc.c:1299:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1299:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1303:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1303:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1306:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1307:17: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1307:17: sparse: sparse: got return
   drivers/gpu/drm/xe/xe_guc_pc.c:1310:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1311:17: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1311:17: sparse: sparse: got return
   drivers/gpu/drm/xe/xe_guc_pc.c:1314:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1315:17: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1315:17: sparse: sparse: got return
   drivers/gpu/drm/xe/xe_guc_pc.c:1322:13: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1322:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1322:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1325:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1325:16: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1325:16: sparse: sparse: got ret
   drivers/gpu/drm/xe/xe_guc_pc.c:1326:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1326:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1336:15: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1336:15: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1336:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1339:20: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1339:20: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_pc.c:1340:11: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1340:11: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1341:22: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1341:22: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_pc.c:1342:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1342:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1353:29: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1353:29: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1353:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:27: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:27: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Trying to use reserved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: got <
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1361:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1361:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1376:15: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1376:15: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1376:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1380:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1381:17: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1381:17: sparse: sparse: got return
   drivers/gpu/drm/xe/xe_guc_pc.c:1388:19: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1388:19: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1388:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1391:11: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1391:11: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1393:11: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1393:11: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1395:9: sparse: sparse: Trying to use reserved word 'return' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1395:16: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1395:16: sparse: sparse: got __devm_add_action_or_reset
   drivers/gpu/drm/xe/xe_guc_pc.c:1396:1: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1396:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got *
>> drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1403:9: sparse: sparse: Trying to use reserved word 'case' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1403:14: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1403:14: sparse: sparse: got SLPC_GLOBAL_STATE_INITIALIZING
   drivers/gpu/drm/xe/xe_guc_pc.c:1405:9: sparse: sparse: Trying to use reserved word 'case' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1405:14: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1405:14: sparse: sparse: got SLPC_GLOBAL_STATE_RESETTING
   drivers/gpu/drm/xe/xe_guc_pc.c:1407:9: sparse: sparse: Trying to use reserved word 'case' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1407:14: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1407:14: sparse: sparse: got SLPC_GLOBAL_STATE_RUNNING
   drivers/gpu/drm/xe/xe_guc_pc.c:1409:9: sparse: sparse: Trying to use reserved word 'case' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1409:14: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1409:14: sparse: sparse: got SLPC_GLOBAL_STATE_SHUTTING_DOWN
   drivers/gpu/drm/xe/xe_guc_pc.c:1411:9: sparse: sparse: Trying to use reserved word 'case' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1411:14: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1411:14: sparse: sparse: got SLPC_GLOBAL_STATE_ERROR
   drivers/gpu/drm/xe/xe_guc_pc.c:1413:9: sparse: sparse: Trying to use reserved word 'default' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1413:16: sparse: sparse: Expected ; at end of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1413:16: sparse: sparse: got :
   drivers/gpu/drm/xe/xe_guc_pc.c:1415:9: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1415:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:21: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got *
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1427:21: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1427:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1429:39: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1429:39: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1429:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1432:21: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1432:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1433:21: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1433:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Trying to use reserved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in nested declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in function declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got *
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Trying to use reserved word 'typeof' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at the end of type declaration

vim +/typeof +1400 drivers/gpu/drm/xe/xe_guc_pc.c

aaab5404b16f19 Rodrigo Vivi 2025-01-15  1397  
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1398  static const char *pc_get_state_string(struct xe_guc_pc *pc)
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1399  {
aaab5404b16f19 Rodrigo Vivi 2025-01-15 @1400  	switch (slpc_shared_data_read(pc, header.global_state)) {
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1401  	case SLPC_GLOBAL_STATE_NOT_RUNNING:
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1402  		return "not running";
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1403  	case SLPC_GLOBAL_STATE_INITIALIZING:
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1404  		return "initializing";
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1405  	case SLPC_GLOBAL_STATE_RESETTING:
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1406  		return "resetting";
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1407  	case SLPC_GLOBAL_STATE_RUNNING:
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1408  		return "running";
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1409  	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1410  		return "shutting down";
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1411  	case SLPC_GLOBAL_STATE_ERROR:
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1412  		return "error";
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1413  	default:
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1414  		return "unknown";
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1415  	}
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1416  }
aaab5404b16f19 Rodrigo Vivi 2025-01-15  1417  

:::::: The code at line 1400 was first introduced by commit
:::::: aaab5404b16f19b06c7d88787d7ba18d91eeb854 drm/xe: Introduce GuC PC debugfs

:::::: TO: Rodrigo Vivi <rodrigo.vivi@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
