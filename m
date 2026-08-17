Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5094322E5
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Aug 2026 14:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786978160; cv=none; b=ldGqKqRGI3xrUFHq5YME0hbvqVdevaOQwKgw2ovFfKRAsAvZnEFkNYtNuwT8ioF1gzaeJkA33vYkzzJU8Y+MDBuWKs695SkQVQ1dJD57oV7rWioh6E7Z7t5F7VRAfkbqf9RUZ0IkrB4IXltoD79SshDxqjy7Kyp/FgLoBuXzF6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786978160; c=relaxed/simple;
	bh=LPWjvM12+tjCfL3kxEym+6KRR4c8Lblg4TXtGyQKEhE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oelanYonMWfWQtcfZGrSfJl4f+Q6Qa+y+/FrLb/iQK8OQd0dna91j/Pj220MzxoMWt6qw+MYOWC9QOm9v+h1vuZvxm+QcL/XkA1m6zv2UGzbH66646bDDtPwk0C02k5MijpXUjA+AjWOd46iHJZywZkMD3uCYxc6FcLT/G9/JJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MMfJf6nT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MMfJf6nT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786978154; x=1818514154;
  h=date:from:to:cc:subject:message-id;
  bh=LPWjvM12+tjCfL3kxEym+6KRR4c8Lblg4TXtGyQKEhE=;
  b=MMfJf6nTAti0sngR4iwn6pc71yEbwxls6614gxX2JBg1ALsEneltvy+I
   0nz3TZitNA3aCZ3QM1YC34dMMhyhAFgU2+EIcZbyVhyhUa65MQUSLmeVn
   94Y/xXecMhpZYay9iVe65iqQDIy2gCKdkRyM7rT+pTdueQqObOrPQkwmH
   Eg6wj9J8C867m6XVOacXlcTUh7B2nEu1LVYuvcnytODveYME0AIynNIon
   XZZtjK9pY4ExESh6SDP8UcmAi3qs8iakGy6yfZFDFPs50361TXEldDDil
   KWiYl/WpuP9z4g94pMYqB0cYFmD9vhYHaGFK2SCa7fKRWwRAPj7BpeIlf
   A==;
X-CSE-ConnectionGUID: 5HWEX1mmQJu6oxSwaerSXw==
X-CSE-MsgGUID: FCvq71g7Rm29YHucIM2x7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87216610"
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="87216610"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 07:49:11 -0700
X-CSE-ConnectionGUID: yZgdLhhcRSmdBkQS56hC8Q==
X-CSE-MsgGUID: 9pRXUQQuS5KJ0MygkMr+5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,229,1779174000"; 
   d="scan'208";a="294859017"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Aug 2026 07:49:10 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvyeC-00000000dXO-05Wm;
	Mon, 17 Aug 2026 14:49:08 +0000
Date: Mon, 17 Aug 2026 22:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10825/15435]
 drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Trying to use
 reserved word 'typeof' as identifier
Message-ID: <202608172245.40SrGRX5-lkp@intel.com>
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
head:   4477a78374a57c3809b172ad30cceabda48c47c6
commit: 5c45e2dbe6967bf75a500931d643d5989291109b [10825/15435] drm/xe: Use IBC v3 on PTL
:::::: branch date: 3 days ago
:::::: commit date: 2 weeks ago
config: alpha-randconfig-r111-20260817 (https://download.01.org/0day-ci/archive/20260817/202608172245.40SrGRX5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608172245.40SrGRX5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608172245.40SrGRX5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_guc_pc.c:1298:32: sparse: sparse: got -
   drivers/gpu/drm/xe/xe_guc_pc.c:1299:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1299:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: got }
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
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: Expected ; at the end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: got }
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

aaab5404b16f19b Rodrigo Vivi 2025-01-15  1397  
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1398  static const char *pc_get_state_string(struct xe_guc_pc *pc)
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1399  {
aaab5404b16f19b Rodrigo Vivi 2025-01-15 @1400  	switch (slpc_shared_data_read(pc, header.global_state)) {
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1401  	case SLPC_GLOBAL_STATE_NOT_RUNNING:
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1402  		return "not running";
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1403  	case SLPC_GLOBAL_STATE_INITIALIZING:
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1404  		return "initializing";
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1405  	case SLPC_GLOBAL_STATE_RESETTING:
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1406  		return "resetting";
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1407  	case SLPC_GLOBAL_STATE_RUNNING:
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1408  		return "running";
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1409  	case SLPC_GLOBAL_STATE_SHUTTING_DOWN:
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1410  		return "shutting down";
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1411  	case SLPC_GLOBAL_STATE_ERROR:
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1412  		return "error";
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1413  	default:
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1414  		return "unknown";
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1415  	}
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1416  }
aaab5404b16f19b Rodrigo Vivi 2025-01-15  1417  

:::::: The code at line 1400 was first introduced by commit
:::::: aaab5404b16f19b06c7d88787d7ba18d91eeb854 drm/xe: Introduce GuC PC debugfs

:::::: TO: Rodrigo Vivi <rodrigo.vivi@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
