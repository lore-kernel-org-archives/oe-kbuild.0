Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E03E3FC9
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Jan 2026 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767428479; cv=none; b=KzN0terxwu8IrbaaZIgF9p06RojFNLsRBdgf8wLik8a+X00tGzxmezsFYFrgnyombADfbRVg9GHJhFW1HEi0fM9SRppPCBxgi4t4Hfm2SjlLhrK6xogd0GzNxivKvdxG9qhuwTLpo9FxqMwqTg/9JvOTmN0qfns7LUh8ZVjDpGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767428479; c=relaxed/simple;
	bh=J2ZQPJ1qfgF9XrfumEcLJT3eKLZSzf+2OrsiTp0e0D4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=AWgPaqV7sBttxIINuMcV895GJl5XdSVCjsQzWB94LONRliDDu6vk62+gkfHov3Xdx7DBGN/ZAHCY+5XfFqdUOLXvey9qm6MRf+CLKN0MvsVI+7hurx7P474aiNLgWtHH8m7HqgUp9+RSNhwYE/Z/3xpjOabQUAz+/w/XFRX239Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cpcpzx1h; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cpcpzx1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767428477; x=1798964477;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=J2ZQPJ1qfgF9XrfumEcLJT3eKLZSzf+2OrsiTp0e0D4=;
  b=Cpcpzx1huEMn38gXafJ5T7fn+hMv0LhBGe8Cihg3veIKJMW0PUKpREUy
   EpDBeQGIeShAXx9OyriGTP6gj0+uRFNGlRqeHsHtrIXSIkT55VbMpCHeH
   DU3I3CenP+71hb/W/jsHQbDwDsnXnkGnob9kIqUtvkob1IDREdCW5LXk0
   JjrbETiA5uCm/2sx0Lkfer5XaLag7oToSWEKuyx4XpTW1FwXpNpzq1+B8
   YkmlyCsmqaWVKoRLHMzS1YdCAq/15k7uL+iwIhopWU+SAlK2Hf3a+J6lD
   tvLoo/PgOdZb+mUBYYf+eAIV8JzV8zTkLmXC0kivENNTHtAGfIrVLnM15
   w==;
X-CSE-ConnectionGUID: TCsnBNXjRxyVh0QPEXp0Hg==
X-CSE-MsgGUID: 3GiNG3pISMmf/SuxjEHvEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="68801666"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="68801666"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 00:21:17 -0800
X-CSE-ConnectionGUID: 4NQ+tEpzRi6ARDFzhYnDYQ==
X-CSE-MsgGUID: qYzIZ76gTia1qO6seQYzaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="232656804"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 03 Jan 2026 00:21:16 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbwsr-000000000eT-2k9J
	for oe-kbuild@lists.linux.dev;
	Sat, 03 Jan 2026 08:21:13 +0000
Date: Sat, 03 Jan 2026 09:20:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jimc:dd-shrink-maple-2 35/43] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202601030919.kKfRWBoY-lkp@intel.com>
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
head:   549b560de653db8ff24a3813ab2e985a355c9d18
commit: 615c294910e6348c051a89bbc23f806dc5196c6e [35/43] dyndbg: save _ddeb=
ug_site mod,file,func fields into maple-trees
:::::: branch date: 2 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260103/202601030919.k=
KfRWBoY-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#81: FILE: lib/dynamic_debug.c:197:
+static const char * desc_##name(struct _ddebug const *dp)	\

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#89: FILE: lib/dynamic_debug.c:205:
+		       (unsigned long)dp, (char*)ret, dref_##name(dp)); \

ERROR:POINTER_LOCATION: "(foo*)" should be "(foo *)"
#111: FILE: lib/dynamic_debug.c:1528:
+	rc =3D mtree_store_range(mt, first, last, (void*)name, GFP_KERNEL);

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
