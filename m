Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793833269;
	b=qUGSrhG2eBkZEwZ6ahJBo6JJvBdBWgG979QCfD+pLeV4yGSQ9yWUMqHG6CdVaa4EhmJG
	 7Foa5qL+mlNQZjb0XP070gp9LZBCnl54D8BaXB+fD3/ig0k8BtMxDF7kdGI7e8v/ESDQg
	 1iV5I8qbA4efwC+PdzGnVdiJoLkrLmXXfCQf8eyciisiuwd3Q2YM8GTfwUO91r6/BtoIy
	 zwTH2z1lcVi2164Rp8APirvQriSKYo5Pi3i4Dy6jWdZL6osRlYzZIcvONWW42770+FRLw
	 zvsKSzZcNLKkmoZ8nZhF7IeNBQB3rwBvEAcincSioLP2KlMufMJdhmd5Gt6YN6nEDOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793833269;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=x3OX/bZqUWwAVjRPawr/9hqyu9yuVhMH8rxUNTFEYCI=;
	b=ttHnkgruzHfuzD4GcF2k+29pDfXaI71A7S3Y+T/wSxW/TF6skexKKAmgyFjFWV6uzXQa
	 pkRK+OcwL0qZfdtXWNfbsj/kY+dvUjPUilyum+wbyQDZIvd4zsPDbS/bnwc2JIr1WMLm1
	 N7KfgY6RGrCs//vwRQlYxziTeN8YTkxUnUbRgafbCzxo5J9ryI/S8k7PUzRDgoyiFfIeY
	 D2ob9hkIunPtCRCmGsIdLotNJazPMc0sPOngz6KyH8wRT9/YfIuDqUt7DxClqKvpubuP3
	 O46KctXXQvVjytA58vytdgEb6ja3tKhGOV2UP3kWlNmvCVvQSOhTgaCsGdPOYtqZFfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RfYFbWGl;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E63A606A31B
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Nov 2026 23:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E63A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RfYFbWGl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793833267; x=1825369267;
  h=date:from:to:cc:subject:message-id;
  bh=u/UANwyi9UdSOOqQV5rUAwwGyAvhVX7sLNFhBoqgg44=;
  b=RfYFbWGlALGhcKSoTAUM8hJCQ7yK+h2C/0VpdaLj4XjNMCFc3T+BDcq7
   wVPuypueunSPsV1bBdfXZcZ+/K0S6W96OxG1YAy/jOU3klVpQXieDkWz+
   wk47HpT8u/LYN3Y5/5yqA6+z/tcZpKFkGOQiTe6hs8QOeFuab82X2Fofe
   Qe9BT81S5uIdv2E0tBtz5x9eo2WV7s62Y302qKwxIK0gou3DrBsZ11G2/
   phTM9hxNlrlCDhSsZ+PfjxNjiawSHCKjN6kq6mn3L1kv7mDxAKNujZ5ud
   1b00Zs3OzIUI/gE41O9MMd+qZESQH6BN4oMJr0rqz223flVhIOvhdjoa6
   A==;
X-CSE-ConnectionGUID: i86ffxweQBiwBuZIxBIMMw==
X-CSE-MsgGUID: y3eoBE8cTvqj6NoplAT3QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2625147"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2625147"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 15:01:07 -0800
X-CSE-ConnectionGUID: EESDmbldTPSTz0Oj5oVDuw==
X-CSE-MsgGUID: RYnSKpT7RPGDOB1dnKhTqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6713530"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 04 Nov 2026 15:01:04 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOjyW-000000009Iy-2Ceo;
	Wed, 04 Nov 2026 23:01:00 +0000
Date: Thu, 05 Nov 2026 00:00:01 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse:
 Trying to use reserved word 'typeof' as identifier
Message-ID: <202611042320.44XGVye8-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Trying to use reserved word 'typeof' as identifier"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   05441d697f7f9a927264f4058cbbc6a03dfcac9d
commit: 5c45e2dbe6967bf75a500931d643d5989291109b drm/xe: Use IBC v3 on PTL
date:   3 months ago
:::::: branch date: 30 hours ago
:::::: commit date: 3 months ago
config: alpha-randconfig-r2309-20261104 (https://download.01.org/0day-ci/archive/20261104/202611042320.44XGVye8-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.4.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611042320.44XGVye8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 5c45e2dbe696 ("drm/xe: Use IBC v3 on PTL")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611042320.44XGVye8-lkp@intel.com/

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
