Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32453FF1
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jan 2026 23:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767484765; cv=none; b=SI2ga6+dfzLqo3TCxI3ad0vGN8I4ZqbNLW82PR7+BXFrR0yzQljWPjdjDt4cCMbS5ROi8Q8glDZoqqic1eX2VBpWvceDsHXJuGh2kx1VYZxUT8wSmRXUMOC6pEfPExoLcmfbXCkTF74s6kdMO6us9rwTvzFCA2HVFpuCJ6kSV9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767484765; c=relaxed/simple;
	bh=kDqcg1dOWcUOBnQ0NpDkzrOd7vwEWU9rgi2b6inwHMQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=oqIPgCFidWuhghdF3GmC2KCz9qWgJWpIoUowQDhFt9znKDdYB/U8vaUWniPgphYN0IfKSP1YVLfPMEo/8HbkiV567YsH9fXTLbEulK5eHGw4/C7pRe695Z1aQK+gNkrvVqYjsm5jx5DqOMPaaBXEUQV6ClqCnbydbiRgGIyedP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GrNMT/v9; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GrNMT/v9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767484764; x=1799020764;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=kDqcg1dOWcUOBnQ0NpDkzrOd7vwEWU9rgi2b6inwHMQ=;
  b=GrNMT/v9jUkq3eEhMSMJBsmfsRAyozVcwkc0vjnaYYZwjZQSdjxEfh/X
   QgKTyZM91RYE1VsK+FfXwp9hMEwa1eoHmAIyo/448YH7Y2WwbzcLW4Efj
   QxoNs+ff5MSBZSwQ0sLKTR1PUP5M3RNUyvDlnU2QgYILSlpHNn8OzsTXB
   MeKIMVeQSCh+8q8S5zgbOEDsGEnlJ5fxpMUHmrWoUb5w7MfjoIY2yVnMM
   Nd9daUnEo24qsvT1lPsvKlcER4JV1r3QqrF8cTrViMPaKHyP1aYuDn1uB
   Wz+NDy1gjHkavTk8/x1YswMfndoiTYc+RY04E47KIMOOWR4ox/U+LC5GI
   Q==;
X-CSE-ConnectionGUID: beQXehqeQ9mawabuGqQsvQ==
X-CSE-MsgGUID: /FPVO/bsSwinT7S3Nl2pmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80355559"
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="80355559"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 15:59:24 -0800
X-CSE-ConnectionGUID: EUEJnP4sRW6GGfOlNQeKIg==
X-CSE-MsgGUID: 0TE51oP6S/+XxbbWS6hqgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,200,1763452800"; 
   d="scan'208";a="232761843"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Jan 2026 15:59:22 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcBWi-000000000n7-1CLW
	for oe-kbuild@lists.linux.dev;
	Sat, 03 Jan 2026 23:59:20 +0000
Date: Sun, 04 Jan 2026 00:58:37 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jimc:dd-shrink-maple-2 35/43] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202601040010.tE9MlU2t-lkp@intel.com>
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
:::::: Manual check reason: "high confidence checkpatch report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git dd-shrink-maple-2
head:   1b2447b5c13b7c9ea4cf68923f2daedd1f4eaeba
commit: cfb95dddc3aa1d51013ab887b5f3a5ecafed6303 [35/43] dyndbg: save _ddeb=
ug_site mod,file,func fields into maple-trees
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260104/202601040010.t=
E9MlU2t-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#81: FILE: lib/dynamic_debug.c:197:
+static const char * desc_##name(struct _ddebug const *dp)	\

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#89: FILE: lib/dynamic_debug.c:205:
+		       (unsigned long)dp, (char*)ret, dref_##name(dp)); \

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#111: FILE: lib/dynamic_debug.c:1462:
+	rc =3D mtree_store_range(mt, first, last, (void*)name, GFP_KERNEL);

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
