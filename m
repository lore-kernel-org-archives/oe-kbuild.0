Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71336374190
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Aug 2026 14:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785939479; cv=none; b=jYBqRLW2e2dkMyb4IphMr5g8JzhhhzIClJQhFfXnm5HZZghCLXM/chxyperqg/0n+sIPmxFPiLkzhnERKeqxJaAK5bA+/t0M75ufdOnfiKy0tskPhMZ2Arou2QvuASwqAxJ91eHhgRivbv5Npz1IFmIrkyoTYSowRb8F3cG3+qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785939479; c=relaxed/simple;
	bh=MrNq1JHSeN/TrXyMFefFbwFgsZ3ucFJL2vuY3RKQwiU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qbnGHv2OJosa9HTjNgkkaA1HgERL9BgtWIChSfaD9z7NG10aZd7pM3PQ5CZ1ngLeKazrC7UpKOSgTwOih3JsB03tOzdLoNOzz15kF55lcCJ+hWwk8KT9xvlYni2oDhi+xZKsv5ZDTA72qYaqUPMFmHgder15VGdkaVKAA1HKs/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYnsq8G3; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYnsq8G3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785939474; x=1817475474;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MrNq1JHSeN/TrXyMFefFbwFgsZ3ucFJL2vuY3RKQwiU=;
  b=JYnsq8G3wjUmsH34SgwBguw7xzzedJqP0aGoI54ot1Ol3hU5iWmsXtA6
   0SVHf4bNMf1T9YohnPtaaex1NsGaCwn99UCpsIxgWE6OqcCNlHVzZZaO+
   ZwZGPRHUE2L+u/IewM4HSbNR7/5sGyOB3+f39PqJDqKgcKRmGk9jHYVfX
   3RSv0Qis9sh/X6ds6+OcED728UuSisd0xgpRxHlTJYEwsxEslA0kSzGId
   fRhDjC0GpHjA5oQVd+opO/4qN4t7YjrI3HFE9Al8UmsYmCfm0uPt/MkHw
   3ffgEQjYMHA3AQSnvr2S0AmHRc9aX01k+Cd+YcGoqbEssE9BYaOnGdMZ+
   A==;
X-CSE-ConnectionGUID: lQ8I8NfQRbKxQ5fdlt1iZQ==
X-CSE-MsgGUID: IjCRQjA7SFSLIx77rv4XGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86629592"
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="86629592"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 07:17:53 -0700
X-CSE-ConnectionGUID: Plyas6JoScqPUGlF6PyuWg==
X-CSE-MsgGUID: /3tlMc+oRs6k64n+ac4vxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,206,1779174000"; 
   d="scan'208";a="266049041"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Aug 2026 07:17:51 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wrcRJ-00000000Ch9-1u1K;
	Wed, 05 Aug 2026 14:17:49 +0000
Date: Wed, 05 Aug 2026 22:17:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11685/12727]
 drivers/gpu/drm/xe/xe_guc_pc.c:1254:9: sparse: sparse: Trying to use reserved
 word 'return' as identifier
Message-ID: <202608052258.rtG9Z166-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence static check warning: drivers/g=
pu/drm/xe/xe_guc_pc.c:1254:9: sparse: sparse: Trying to use reserved word '=
return' as identifier"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   0f6da28aab51b16762ed82e8fdeaa5042da45b08
commit: 5c45e2dbe6967bf75a500931d643d5989291109b [11685/12727] drm/xe: Use =
IBC v3 on PTL
:::::: branch date: 21 hours ago
:::::: commit date: 2 days ago
config: xtensa-randconfig-r123-20260805 (https://download.01.org/0day-ci/ar=
chive/20260805/202608052258.rtG9Z166-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260805/202608052258.rtG9Z166-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608052258.rtG9Z166-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/xe/xe_guc_pc.c: note: in included file (through arch/xte=
nsa/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, inc=
lude/asm-generic/div64.h, ...):
   arch/xtensa/include/asm/processor.h:105:2: sparse: sparse: Unsupported x=
tensa ABI
   arch/xtensa/include/asm/processor.h:135:2: sparse: sparse: Unsupported X=
tensa ABI
   drivers/gpu/drm/xe/xe_guc_pc.c:1243:21: sparse: sparse: Expected ) in ex=
pression
   drivers/gpu/drm/xe/xe_guc_pc.c:1243:21: sparse: sparse: got 0
>> drivers/gpu/drm/xe/xe_guc_pc.c:1254:9: sparse: sparse: Trying to use res=
erved word 'return' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1254:16: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1254:16: sparse: sparse: got ret
   drivers/gpu/drm/xe/xe_guc_pc.c:1255:1: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1255:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got &
>> drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Trying to use res=
erved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got 1
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got (
>> drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Trying to use res=
erved word 'void' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1272:13: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1272:13: sparse: sparse: got !
>> drivers/gpu/drm/xe/xe_guc_pc.c:1272:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1275:15: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1275:15: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1275:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1278:17: sparse: sparse: Trying to use re=
served word 'return' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1278:24: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1278:24: sparse: sparse: got 0
   drivers/gpu/drm/xe/xe_guc_pc.c:1279:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1279:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ) in nes=
ted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ) in fun=
ction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Trying to use res=
erved word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ; at end=
 of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1282:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1286:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1287:17: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1287:17: sparse: sparse: got return
   drivers/gpu/drm/xe/xe_guc_pc.c:1289:30: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1289:30: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1289:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1291:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1291:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1291:17: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1291:17: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1291:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1291:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1295:38: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1295:38: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1295:17: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1297:25: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1297:25: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1297:25: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1297:25: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1297:25: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1297:25: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1298:25: sparse: sparse: Trying to use re=
served word 'return' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1298:32: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1298:32: sparse: sparse: got -
   drivers/gpu/drm/xe/xe_guc_pc.c:1299:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1299:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1303:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1303:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1306:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1307:17: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1307:17: sparse: sparse: got return
   drivers/gpu/drm/xe/xe_guc_pc.c:1310:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1311:17: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1311:17: sparse: sparse: got return
   drivers/gpu/drm/xe/xe_guc_pc.c:1314:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1315:17: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1315:17: sparse: sparse: got return
   drivers/gpu/drm/xe/xe_guc_pc.c:1322:13: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1322:13: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1322:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1325:9: sparse: sparse: Trying to use res=
erved word 'return' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1325:16: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1325:16: sparse: sparse: got ret
   drivers/gpu/drm/xe/xe_guc_pc.c:1326:1: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1326:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1336:15: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1336:15: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1336:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1339:20: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1339:20: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_pc.c:1340:11: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1340:11: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1341:22: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1341:22: sparse: sparse: got &
   drivers/gpu/drm/xe/xe_guc_pc.c:1342:1: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1342:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1353:29: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1353:29: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1353:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:27: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:27: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Trying to use re=
served word 'do' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: got <
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:29: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1361:1: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1361:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1376:15: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1376:15: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1376:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1380:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1381:17: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1381:17: sparse: sparse: got return
   drivers/gpu/drm/xe/xe_guc_pc.c:1388:19: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1388:19: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1388:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1391:11: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1391:11: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1393:11: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1393:11: sparse: sparse: got ->
   drivers/gpu/drm/xe/xe_guc_pc.c:1395:9: sparse: sparse: Trying to use res=
erved word 'return' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1395:16: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1395:16: sparse: sparse: got __devm_add_a=
ction_or_reset
   drivers/gpu/drm/xe/xe_guc_pc.c:1396:1: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1396:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got volatile
>> drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Trying to use re=
served word 'const' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1400:17: sparse: sparse: got }
>> drivers/gpu/drm/xe/xe_guc_pc.c:1403:9: sparse: sparse: Trying to use res=
erved word 'case' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1403:14: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1403:14: sparse: sparse: got SLPC_GLOBAL_=
STATE_INITIALIZING
   drivers/gpu/drm/xe/xe_guc_pc.c:1405:9: sparse: sparse: Trying to use res=
erved word 'case' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1405:14: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1405:14: sparse: sparse: got SLPC_GLOBAL_=
STATE_RESETTING
   drivers/gpu/drm/xe/xe_guc_pc.c:1407:9: sparse: sparse: Trying to use res=
erved word 'case' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1407:14: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1407:14: sparse: sparse: got SLPC_GLOBAL_=
STATE_RUNNING
   drivers/gpu/drm/xe/xe_guc_pc.c:1409:9: sparse: sparse: Trying to use res=
erved word 'case' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1409:14: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1409:14: sparse: sparse: got SLPC_GLOBAL_=
STATE_SHUTTING_DOWN
   drivers/gpu/drm/xe/xe_guc_pc.c:1411:9: sparse: sparse: Trying to use res=
erved word 'case' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1411:14: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1411:14: sparse: sparse: got SLPC_GLOBAL_=
STATE_ERROR
>> drivers/gpu/drm/xe/xe_guc_pc.c:1413:9: sparse: sparse: Trying to use res=
erved word 'default' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1413:16: sparse: sparse: Expected ; at en=
d of declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1413:16: sparse: sparse: got :
   drivers/gpu/drm/xe/xe_guc_pc.c:1415:9: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1415:9: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:21: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got volatile
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Trying to use re=
served word 'const' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1426:39: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1427:21: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1427:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1429:39: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1429:39: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1429:9: sparse: sparse: Trying to use res=
erved word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1432:21: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1432:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1433:21: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1433:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got volatile
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Trying to use re=
served word 'const' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1434:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1436:21: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1436:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got volatile
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Trying to use re=
served word 'const' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1437:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1439:21: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1439:21: sparse: sparse: got ,
--
   drivers/gpu/drm/xe/xe_guc_pc.c:1446:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1446:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1446:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1446:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1446:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1446:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1446:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1446:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1446:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1446:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1448:21: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1448:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got volatile
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Trying to use re=
served word 'const' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1449:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1451:21: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1451:21: sparse: sparse: got ,
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got {
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got (
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ) in fu=
nction declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got !
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Trying to use re=
served word 'if' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ) in ne=
sted declarator
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got volatile
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Trying to use re=
served word 'const' as identifier
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: Expected ; at th=
e end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1452:31: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1454:1: sparse: sparse: Expected ; at the=
 end of type declaration
   drivers/gpu/drm/xe/xe_guc_pc.c:1454:1: sparse: sparse: got }
   drivers/gpu/drm/xe/xe_guc_pc.c:1243:21: sparse: sparse: undefined identi=
fier '__VA_OPT__'
   drivers/gpu/drm/xe/xe_guc_pc.c:1264:37: sparse: sparse: undefined identi=
fier 'pc'
   drivers/gpu/drm/xe/xe_guc_pc.c:1269:9: sparse: sparse: undefined identif=
ier '__xe'
   drivers/gpu/drm/xe/xe_guc_pc.c:1284:9: sparse: sparse: symbol 'earlier' =
redeclared with different type (different type sizes):
   drivers/gpu/drm/xe/xe_guc_pc.c:1284:9: sparse:    int [addressable] [top=
level] earlier
   drivers/gpu/drm/xe/xe_guc_pc.c:1266:17: sparse: note: previously declare=
d as:
   drivers/gpu/drm/xe/xe_guc_pc.c:1266:17: sparse:    signed long long [add=
ressable] [toplevel] [usertype] earlier
   drivers/gpu/drm/xe/xe_guc_pc.c:1285:31: sparse: sparse: undefined identi=
fier 'pc'
   drivers/gpu/drm/xe/xe_guc_pc.c:1291:17: sparse: sparse: undefined identi=
fier '_entry'
   drivers/gpu/drm/xe/xe_guc_pc.c:1297:25: sparse: sparse: undefined identi=
fier '_entry'
   drivers/gpu/drm/xe/xe_guc_pc.c:1297:25: sparse: sparse: symbol '_entry_p=
tr' has multiple initializers (originally initialized at drivers/gpu/drm/xe=
/xe_guc_pc.c:1291)
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: undefined identi=
fier '_entry'
   drivers/gpu/drm/xe/xe_guc_pc.c:1301:17: sparse: sparse: symbol '_entry_p=
tr' has multiple initializers (originally initialized at drivers/gpu/drm/xe=
/xe_guc_pc.c:1297)
   drivers/gpu/drm/xe/xe_guc_pc.c:1309:29: sparse: sparse: undefined identi=
fier 'pc'
   drivers/gpu/drm/xe/xe_guc_pc.c:1309:9: sparse: sparse: symbol 'ret' has =
multiple initializers (originally initialized at drivers/gpu/drm/xe/xe_guc_=
pc.c:1285)
   drivers/gpu/drm/xe/xe_guc_pc.c:1313:36: sparse: sparse: undefined identi=
fier 'pc'
   drivers/gpu/drm/xe/xe_guc_pc.c:1313:9: sparse: sparse: symbol 'ret' has =
multiple initializers (originally initialized at drivers/gpu/drm/xe/xe_guc_=
pc.c:1309)
   drivers/gpu/drm/xe/xe_guc_pc.c:1318:38: sparse: sparse: undefined identi=
fier 'pc'
   drivers/gpu/drm/xe/xe_guc_pc.c:1318:9: sparse: sparse: symbol 'ret' has =
multiple initializers (originally initialized at drivers/gpu/drm/xe/xe_guc_=
pc.c:1313)
   drivers/gpu/drm/xe/xe_guc_pc.c:1321:43: sparse: sparse: undefined identi=
fier 'pc'
   drivers/gpu/drm/xe/xe_guc_pc.c:1321:9: sparse: sparse: symbol 'ret' has =
multiple initializers (originally initialized at drivers/gpu/drm/xe/xe_guc_=
pc.c:1318)
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: undefined identi=
fier '_entry'
   drivers/gpu/drm/xe/xe_guc_pc.c:1323:17: sparse: sparse: symbol '_entry_p=
tr' has multiple initializers (originally initialized at drivers/gpu/drm/xe=
/xe_guc_pc.c:1301)
   drivers/gpu/drm/xe/xe_guc_pc.c:1359:9: sparse: sparse: symbol 'fw_ref' h=
as multiple initializers (originally initialized at drivers/gpu/drm/xe/xe_g=
uc_pc.c:1271)
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:9: sparse: sparse: symbol 'pc_set_cu=
r_freq' redeclared with different type (incompatible argument 1 (different =
base types)):
   drivers/gpu/drm/xe/xe_guc_pc.c:1360:9: sparse:    int static [signed] [t=
oplevel] pc_set_cur_freq( ... )
   drivers/gpu/drm/xe/xe_guc_pc.c:329:13: sparse: note: previously declared=
 as:
   drivers/gpu/drm/xe/xe_guc_pc.c:329:13: sparse:    void static [toplevel]=
 pc_set_cur_freq( ... )
   drivers/gpu/drm/xe/xe_guc_pc.c:1371:26: sparse: sparse: symbol 'xe' has =
multiple initializers (originally initialized at drivers/gpu/drm/xe/xe_guc_=
pc.c:1351)
   drivers/gpu/drm/xe/xe_guc_pc.c:1373:13: sparse: sparse: symbol 'size' ha=
s multiple initializers (originally initialized at drivers/gpu/drm/xe/xe_gu=
c_pc.c:1265)
>> drivers/gpu/drm/xe/xe_guc_pc.c:1379:15: sparse: sparse: cannot dereferen=
ce this type
>> drivers/gpu/drm/xe/xe_guc_pc.c:1379:15: sparse: sparse: cannot dereferen=
ce this type
   drivers/gpu/drm/xe/xe_guc_pc.c:1383:9: sparse: sparse: symbol 'bo' redec=
lared with different type (different base types):
   drivers/gpu/drm/xe/xe_guc_pc.c:1383:9: sparse:    int [addressable] [top=
level] bo
   drivers/gpu/drm/xe/xe_guc_pc.c:1372:22: sparse: note: previously declare=
d as:
   drivers/gpu/drm/xe/xe_guc_pc.c:1372:22: sparse:    struct xe_bo *[addres=
sable] [toplevel] bo

vim +/return +1254 drivers/gpu/drm/xe/xe_guc_pc.c

40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1228 =20
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1229  static int pc_modif=
y_defaults(struct xe_guc_pc *pc)
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1230  {
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1231  	struct xe_device *=
xe =3D pc_to_xe(pc);
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1232  	struct xe_gt *gt =
=3D pc_to_gt(pc);
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1233  	int ret =3D 0;
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1234 =20
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1235  	if (xe->info.platf=
orm =3D=3D XE_PANTHERLAKE) {
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1236  		ret =3D pc_action=
_set_dcc(pc, false);
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1237  		if (unlikely(ret)=
) {
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1238  			xe_gt_err(gt, "F=
ailed to modify DCC default: %pe\n", ERR_PTR(ret));
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1239  			return ret;
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1240  		}
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1241 =20
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1242  		if (xe_gt_is_main=
_type(gt) &&
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1243  		    GUC_FIRMWARE_=
VER_AT_LEAST(&gt->uc.guc, 70, 48, 0)) {
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1244  			ret =3D pc_actio=
n_set_param(pc,
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1245  						  SLPC_PARAM_=
SET_IBC_VERSION,
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1246  						  3);
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1247  			if (unlikely(ret=
)) {
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1248  				xe_gt_err(gt, "=
Failed to modify IBC version: %pe\n", ERR_PTR(ret));
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1249  				return ret;
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1250  			}
5c45e2dbe6967b Vinay Belgaumkar       2026-07-29  1251  		}
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1252  	}
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1253 =20
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23 @1254  	return ret;
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1255  }
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1256 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  1257  /**
dd08ebf6c3525a Matthew Brost          2023-03-30  1258   * xe_guc_pc_start =
- Start GuC's Power Conservation component
dd08ebf6c3525a Matthew Brost          2023-03-30  1259   * @pc: Xe_GuC_PC i=
nstance
dd08ebf6c3525a Matthew Brost          2023-03-30  1260   */
dd08ebf6c3525a Matthew Brost          2023-03-30  1261  int xe_guc_pc_start=
(struct xe_guc_pc *pc)
dd08ebf6c3525a Matthew Brost          2023-03-30  1262  {
dd08ebf6c3525a Matthew Brost          2023-03-30  1263  	struct xe_device *=
xe =3D pc_to_xe(pc);
dd08ebf6c3525a Matthew Brost          2023-03-30  1264  	struct xe_gt *gt =
=3D pc_to_gt(pc);
dd08ebf6c3525a Matthew Brost          2023-03-30  1265  	u32 size =3D PAGE_=
ALIGN(sizeof(struct slpc_shared_data));
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1266  	ktime_t earlier;
dd08ebf6c3525a Matthew Brost          2023-03-30  1267  	int ret;
dd08ebf6c3525a Matthew Brost          2023-03-30  1268 =20
c4991ee01d480c Daniele Ceraolo Spurio 2023-09-13 @1269  	xe_gt_assert(gt, x=
e_device_uc_enabled(xe));
dd08ebf6c3525a Matthew Brost          2023-03-30  1270 =20
e9bc4162bf3915 Matt Roper             2025-11-18  1271  	CLASS(xe_force_wak=
e, fw_ref)(gt_to_fw(gt), XE_FW_GT);
e9bc4162bf3915 Matt Roper             2025-11-18 @1272  	if (!xe_force_wake=
_ref_has_domain(fw_ref.domains, XE_FW_GT))
31a5dce0a37cbd Himal Prasad Ghimiray  2024-10-14  1273  		return -ETIMEDOUT;
dd08ebf6c3525a Matthew Brost          2023-03-30  1274 =20
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1275  	if (xe->info.skip_=
guc_pc) {
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1276  		/* Request max po=
ssible since dynamic freq mgmt is not enabled */
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1277  		pc_set_cur_freq(p=
c, UINT_MAX);
e9bc4162bf3915 Matt Roper             2025-11-18  1278  		return 0;
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1279  	}
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1280 =20
21cf47d89fba35 Lucas De Marchi        2025-06-12  1281  	xe_map_memset(xe, =
&pc->bo->vmap, 0, 0, size);
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17 @1282  	slpc_shared_data_w=
rite(pc, header.size, size);
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1283 =20
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1284  	earlier =3D ktime_=
get();
dd08ebf6c3525a Matthew Brost          2023-03-30  1285  	ret =3D pc_action_=
reset(pc);
dd08ebf6c3525a Matthew Brost          2023-03-30  1286  	if (ret)
e9bc4162bf3915 Matt Roper             2025-11-18  1287  		return ret;
dd08ebf6c3525a Matthew Brost          2023-03-30  1288 =20
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1289  	if (wait_for_pc_st=
ate(pc, SLPC_GLOBAL_STATE_RUNNING,
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1290  			      SLPC_RESET=
_TIMEOUT_MS)) {
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1291  		xe_gt_warn(gt, "G=
uC PC start taking longer than normal [freq =3D %dMHz (req =3D %dMHz), perf=
_limit_reasons =3D 0x%08X]\n",
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1292  			   xe_guc_pc_get=
_act_freq(pc), get_cur_freq(gt),
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1293  			   xe_gt_throttl=
e_get_limit_reasons(gt));
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1294 =20
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1295  		if (wait_for_pc_s=
tate(pc, SLPC_GLOBAL_STATE_RUNNING,
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1296  				      SLPC_RESE=
T_EXTENDED_TIMEOUT_MS)) {
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1297  			xe_gt_err(gt, "G=
uC PC Start failed: Dynamic GT frequency control and GT sleep states are no=
w disabled.\n");
e9bc4162bf3915 Matt Roper             2025-11-18  1298  			return -EIO;
dd08ebf6c3525a Matthew Brost          2023-03-30  1299  		}
dd08ebf6c3525a Matthew Brost          2023-03-30  1300 =20
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1301  		xe_gt_warn(gt, "G=
uC PC excessive start time: %lldms",
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1302  			   ktime_ms_delt=
a(ktime_get(), earlier));
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1303  	}
b4b05e53b550a8 Rodrigo Vivi           2025-03-07  1304 =20
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1305  	ret =3D pc_modify_=
defaults(pc);
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1306  	if (ret)
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1307  		return ret;
40ee63f5df2d5c Vinay Belgaumkar       2026-01-23  1308 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  1309  	ret =3D pc_init_fr=
eqs(pc);
dd08ebf6c3525a Matthew Brost          2023-03-30  1310  	if (ret)
e9bc4162bf3915 Matt Roper             2025-11-18  1311  		return ret;
dd08ebf6c3525a Matthew Brost          2023-03-30  1312 =20
3b1592fb783549 Vinay Belgaumkar       2024-06-20  1313  	ret =3D pc_set_mer=
t_freq_cap(pc);
3b1592fb783549 Vinay Belgaumkar       2024-06-20  1314  	if (ret)
e9bc4162bf3915 Matt Roper             2025-11-18  1315  		return ret;
3b1592fb783549 Vinay Belgaumkar       2024-06-20  1316 =20
5488bec96bccbd Tejas Upadhyay         2025-02-28  1317  	/* Enable SLPC Opt=
imized Strategy for compute */
5488bec96bccbd Tejas Upadhyay         2025-02-28  1318  	ret =3D pc_action_=
set_strategy(pc, SLPC_OPTIMIZED_STRATEGY_COMPUTE);
dd08ebf6c3525a Matthew Brost          2023-03-30  1319 =20
60d2b7899142d5 Vinay Belgaumkar       2025-09-03  1320  	/* Set cached valu=
e of power_profile */
60d2b7899142d5 Vinay Belgaumkar       2025-09-03  1321  	ret =3D xe_guc_pc_=
set_power_profile(pc, power_profile_to_string(pc));
60d2b7899142d5 Vinay Belgaumkar       2025-09-03  1322  	if (unlikely(ret))
60d2b7899142d5 Vinay Belgaumkar       2025-09-03  1323  		xe_gt_err(gt, "Fa=
iled to set SLPC power profile: %pe\n", ERR_PTR(ret));
60d2b7899142d5 Vinay Belgaumkar       2025-09-03  1324 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  1325  	return ret;
dd08ebf6c3525a Matthew Brost          2023-03-30  1326  }
dd08ebf6c3525a Matthew Brost          2023-03-30  1327 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  1328  /**
dd08ebf6c3525a Matthew Brost          2023-03-30  1329   * xe_guc_pc_stop -=
 Stop GuC's Power Conservation component
dd08ebf6c3525a Matthew Brost          2023-03-30  1330   * @pc: Xe_GuC_PC i=
nstance
dd08ebf6c3525a Matthew Brost          2023-03-30  1331   */
60b040fcea21dc Raag Jadav             2026-04-27  1332  void xe_guc_pc_stop=
(struct xe_guc_pc *pc)
dd08ebf6c3525a Matthew Brost          2023-03-30  1333  {
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1334  	struct xe_device *=
xe =3D pc_to_xe(pc);
dd08ebf6c3525a Matthew Brost          2023-03-30  1335 =20
40a684f91d2671 Vinay Belgaumkar       2026-02-03  1336  	if (xe->info.skip_=
guc_pc)
60b040fcea21dc Raag Jadav             2026-04-27  1337  		return;
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1338 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  1339  	mutex_lock(&pc->fr=
eq_lock);
dd08ebf6c3525a Matthew Brost          2023-03-30  1340  	pc->freq_ready =3D =
false;
dd08ebf6c3525a Matthew Brost          2023-03-30  1341  	mutex_unlock(&pc->=
freq_lock);
dd08ebf6c3525a Matthew Brost          2023-03-30  1342  }
dd08ebf6c3525a Matthew Brost          2023-03-30  1343 =20
bef52b5c7a1904 Rodrigo Vivi           2023-12-08  1344  /**
6d95155ae71963 Matthew Auld           2024-05-22  1345   * xe_guc_pc_fini_h=
w - Finalize GuC's Power Conservation component
8a4587ef9f9521 Micha=C5=82 Winiarski       2024-02-19  1346   * @arg: opaqu=
e pointer that should point to Xe_GuC_PC instance
bef52b5c7a1904 Rodrigo Vivi           2023-12-08  1347   */
6d95155ae71963 Matthew Auld           2024-05-22  1348  static void xe_guc_=
pc_fini_hw(void *arg)
dd08ebf6c3525a Matthew Brost          2023-03-30  1349  {
8a4587ef9f9521 Micha=C5=82 Winiarski       2024-02-19  1350  	struct xe_guc=
_pc *pc =3D arg;
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1351  	struct xe_device *=
xe =3D pc_to_xe(pc);
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1352 =20
fb74b205cdd263 Rodrigo Vivi           2024-04-23  1353  	if (xe_device_wedg=
ed(xe))
fb74b205cdd263 Rodrigo Vivi           2024-04-23  1354  		return;
fb74b205cdd263 Rodrigo Vivi           2024-04-23  1355 =20
60b040fcea21dc Raag Jadav             2026-04-27  1356  	xe_guc_pc_stop(pc);
3b1592fb783549 Vinay Belgaumkar       2024-06-20  1357 =20
3b1592fb783549 Vinay Belgaumkar       2024-06-20  1358  	/* Bind requested =
freq to mert_freq_cap before unload */
8edb1f2c729c00 Raag Jadav             2026-04-27  1359  	CLASS(xe_force_wak=
e, fw_ref)(gt_to_fw(pc_to_gt(pc)), XE_FW_GT);
2917e17b5fd254 Sk Anirban             2025-11-13  1360  	pc_set_cur_freq(pc=
, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
dd08ebf6c3525a Matthew Brost          2023-03-30  1361  }
dd08ebf6c3525a Matthew Brost          2023-03-30  1362 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  1363  /**
dd08ebf6c3525a Matthew Brost          2023-03-30  1364   * xe_guc_pc_init -=
 Initialize GuC's Power Conservation component
dd08ebf6c3525a Matthew Brost          2023-03-30  1365   * @pc: Xe_GuC_PC i=
nstance
dd08ebf6c3525a Matthew Brost          2023-03-30  1366   */
dd08ebf6c3525a Matthew Brost          2023-03-30  1367  int xe_guc_pc_init(=
struct xe_guc_pc *pc)
dd08ebf6c3525a Matthew Brost          2023-03-30  1368  {
dd08ebf6c3525a Matthew Brost          2023-03-30  1369  	struct xe_gt *gt =
=3D pc_to_gt(pc);
876611c2b75689 Matt Roper             2023-06-01  1370  	struct xe_tile *ti=
le =3D gt_to_tile(gt);
dd08ebf6c3525a Matthew Brost          2023-03-30  1371  	struct xe_device *=
xe =3D gt_to_xe(gt);
dd08ebf6c3525a Matthew Brost          2023-03-30  1372  	struct xe_bo *bo;
dd08ebf6c3525a Matthew Brost          2023-03-30  1373  	u32 size =3D PAGE_=
ALIGN(sizeof(struct slpc_shared_data));
8a4587ef9f9521 Micha=C5=82 Winiarski       2024-02-19  1374  	int err;
dd08ebf6c3525a Matthew Brost          2023-03-30  1375 =20
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1376  	if (xe->info.skip_=
guc_pc)
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1377  		return 0;
975e4a3795d4f1 Vinay Belgaumkar       2023-11-17  1378 =20
8a4587ef9f9521 Micha=C5=82 Winiarski       2024-02-19 @1379  	err =3D drmm_=
mutex_init(&xe->drm, &pc->freq_lock);
8a4587ef9f9521 Micha=C5=82 Winiarski       2024-02-19  1380  	if (err)
8a4587ef9f9521 Micha=C5=82 Winiarski       2024-02-19  1381  		return err;
dd08ebf6c3525a Matthew Brost          2023-03-30  1382 =20
0e1a47fcabc8ff Micha=C5=82 Winiarski       2023-12-05  1383  	bo =3D xe_man=
aged_bo_create_pin_map(xe, tile, size,
62742d12663145 Lucas De Marchi        2024-03-22  1384  					  XE_BO_FLAG_V=
RAM_IF_DGFX(tile) |
62742d12663145 Lucas De Marchi        2024-03-22  1385  					  XE_BO_FLAG_G=
GTT |
045448da87bfb1 Matthew Brost          2025-04-03  1386  					  XE_BO_FLAG_G=
GTT_INVALIDATE |
045448da87bfb1 Matthew Brost          2025-04-03  1387  					  XE_BO_FLAG_P=
INNED_NORESTORE);
dd08ebf6c3525a Matthew Brost          2023-03-30  1388  	if (IS_ERR(bo))
dd08ebf6c3525a Matthew Brost          2023-03-30  1389  		return PTR_ERR(bo=
);
dd08ebf6c3525a Matthew Brost          2023-03-30  1390 =20
dd08ebf6c3525a Matthew Brost          2023-03-30  1391  	pc->bo =3D bo;
8a4587ef9f9521 Micha=C5=82 Winiarski       2024-02-19  1392 =20
60d2b7899142d5 Vinay Belgaumkar       2025-09-03  1393  	pc->power_profile =
=3D SLPC_POWER_PROFILE_BASE;
60d2b7899142d5 Vinay Belgaumkar       2025-09-03  1394 =20
6d95155ae71963 Matthew Auld           2024-05-22  1395  	return devm_add_ac=
tion_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
dd08ebf6c3525a Matthew Brost          2023-03-30  1396  }
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1397 =20
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1398  static const char *=
pc_get_state_string(struct xe_guc_pc *pc)
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1399  {
aaab5404b16f19 Rodrigo Vivi           2025-01-15 @1400  	switch (slpc_share=
d_data_read(pc, header.global_state)) {
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1401  	case SLPC_GLOBAL_S=
TATE_NOT_RUNNING:
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1402  		return "not runni=
ng";
aaab5404b16f19 Rodrigo Vivi           2025-01-15 @1403  	case SLPC_GLOBAL_S=
TATE_INITIALIZING:
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1404  		return "initializ=
ing";
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1405  	case SLPC_GLOBAL_S=
TATE_RESETTING:
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1406  		return "resetting=
";
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1407  	case SLPC_GLOBAL_S=
TATE_RUNNING:
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1408  		return "running";
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1409  	case SLPC_GLOBAL_S=
TATE_SHUTTING_DOWN:
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1410  		return "shutting =
down";
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1411  	case SLPC_GLOBAL_S=
TATE_ERROR:
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1412  		return "error";
aaab5404b16f19 Rodrigo Vivi           2025-01-15 @1413  	default:
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1414  		return "unknown";
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1415  	}
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1416  }
aaab5404b16f19 Rodrigo Vivi           2025-01-15  1417 =20

:::::: The code at line 1254 was first introduced by commit
:::::: 40ee63f5df2d5c6471b583df800aac89dc0502a4 drm/xe/ptl: Disable DCC on =
PTL

:::::: TO: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
:::::: CC: Rodrigo Vivi <rodrigo.vivi@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
