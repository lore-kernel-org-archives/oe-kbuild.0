Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FAF17C9B8
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Sep 2024 21:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727560762; cv=none; b=A//i4UTEVI2oS/258/m6yXDfyG6XFf1VBhw8eHwecOpKqC/tWx2cU9aUFV3P3/eVkI5Y7A8WEYPSvoth6BzK5DVuirEjTIjLWIvBSxBg2d01Dqb+b9rjJ+lIutQ+fkIRfta43A8/bObgOevPweRq6G00nbKIP/50XNiAa1HUEqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727560762; c=relaxed/simple;
	bh=e/6ewcTDByKoY/nPMzm9eLxmWoQkVkccFYA+MyRffU4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJI1SpBK01KhY9Fr92cKyXLX+jA9ZagL2vp1l5Nsjv7GB/kHnFVu+suNmdDjqivXkDBrrpb0WtGSHhq2JLYespX7l3GbXOyLSGCwUlJR8iw5VPuRVXYOOEhcz4BPuPUuiBRQxTVPtmm6yGK1bLucbK6xxWVMYC6BMFMrBsj9DGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AaCrXr5/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AaCrXr5/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727560744; x=1759096744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e/6ewcTDByKoY/nPMzm9eLxmWoQkVkccFYA+MyRffU4=;
  b=AaCrXr5/cpdEx5OQJF+2OBrEs0ju2mZAyx6qnlx1UtO0hO3YgMAK0ZUi
   PdXrJKvPAqnnAkKaJY/ukNoK0m9dA3HkCuUAZ881R4D58YVpC0puzUaJR
   Nvs+H92ho9g6CvOdomC+oyDeX3dfpBtqERXqrRSqJPgMHKYV0TN2S8jO9
   Y0+vfS7wvjBo2AGAvT3M/4m1xw5kUR1YIcMk+126vEL8gYZIqE92VjlJW
   XW89J/RekK3DMBxTUhAqkM+XjkkGwtKwLvLpbx3NQOAJIxh8kWHRm3w//
   L6wKEovmomuGSZqjJ0flaoQFrl4Dgzd+fxVl0jchPMsicDswXOw9EF0cs
   A==;
X-CSE-ConnectionGUID: BpPpdhSqTfqwHu/sf9DUIQ==
X-CSE-MsgGUID: ATY3picDSzqPmFWF3YMPrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37261318"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="37261318"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 14:59:02 -0700
X-CSE-ConnectionGUID: KfTEPdWpTMqfpHSp0XegGA==
X-CSE-MsgGUID: ztEz1jwVR5OqMypLyt5myw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72458913"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 28 Sep 2024 14:59:00 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sufSr-000Ngf-2n;
	Sat, 28 Sep 2024 21:58:57 +0000
Date: Sun, 29 Sep 2024 05:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:13:2:
 sparse: sparse: "AltiVec support not enabled"
Message-ID: <202409290517.iLRjMXwE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:13:2: sparse: sparse: "AltiVec support not enabled""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3efc57369a0ce8f76bf0804f7e673982384e4ac9
commit: cd575ddf57af004913ff5a994aa5f3203216fa68 bcachefs: Erasure coding
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: powerpc64-randconfig-r111-20240928 (https://download.01.org/0day-ci/archive/20240929/202409290517.iLRjMXwE-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce: (https://download.01.org/0day-ci/archive/20240929/202409290517.iLRjMXwE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409290517.iLRjMXwE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/raid6/altivec1.c: note: in included file:
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:13:2: sparse: sparse: "AltiVec support not enabled"
   lib/raid6/altivec1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: got <
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:22: sparse: sparse: bad constant expression type
   lib/raid6/altivec1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:14:26: sparse: sparse: bad constant expression type
   lib/raid6/altivec1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:14:23: sparse: sparse: bad constant expression type
   lib/raid6/altivec1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:17:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:16:24: sparse: sparse: bad constant expression type
   lib/raid6/altivec1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:41: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:20: sparse: sparse: bad constant expression type
   lib/raid6/altivec1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:14:24: sparse: sparse: bad constant expression type
   lib/raid6/altivec1.c: note: in included file:
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: got pixel
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: got float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: got float
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: got }
--
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17097:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:2: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: got unsigned
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: got char
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18166:1: sparse: sparse: Expected ; at the end of type declaration
--
   lib/raid6/altivec1.c:102:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec1.c:102:9: sparse: sparse: got }
   lib/raid6/altivec1.c:108:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid6/altivec1.c:108:9: sparse: sparse: Expected ; at end of declaration
   lib/raid6/altivec1.c:108:9: sparse: sparse: got {
   lib/raid6/altivec1.c:108:9: sparse: sparse: Expected ) in function declarator
   lib/raid6/altivec1.c:108:9: sparse: sparse: got (
   lib/raid6/altivec1.c:108:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid6/altivec1.c:108:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec1.c:108:9: sparse: sparse: got }
   lib/raid6/altivec1.c:109:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec1.c:109:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:3: sparse: sparse: symbol '__c' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:3: sparse: sparse: symbol '__b' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575)
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697)
   lib/raid6/altivec1.c:80:14: sparse: sparse: undefined identifier 'disks'
   lib/raid6/altivec1.c:81:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec1.c:81:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid6/altivec1.c:81:9: sparse:    int [addressable] [toplevel] p
   lib/raid6/altivec1.c:74:12: sparse: note: previously declared as:
   lib/raid6/altivec1.c:74:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid6/altivec1.c:82:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec1.c:82:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid6/altivec1.c:82:9: sparse:    int [addressable] [toplevel] q
   lib/raid6/altivec1.c:74:16: sparse: note: previously declared as:
   lib/raid6/altivec1.c:74:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid6/altivec1.c:88:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec1.c:89:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec1.c:90:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec1.c:91:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec1.c:91:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid6/altivec1.c:89)
   lib/raid6/altivec1.c:92:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec1.c:92:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid6/altivec1.c:90)
   lib/raid6/altivec1.c:93:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec1.c:96:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec1.c:96:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec1.c:78:9: sparse: note: previously declared as:
   lib/raid6/altivec1.c:78:9: sparse:    int static [toplevel] unative_t
   lib/raid6/altivec1.c:107:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid6/altivec1.c:107:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid6/altivec1.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:58:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:58:20: sparse:    void static inline [gnu_inline] [toplevel] disable_kernel_altivec( ... )
   lib/raid6/altivec1.c:125:9: sparse: sparse: undefined identifier 'raid6_altivec1_gen_syndrome'
--
   lib/raid6/altivec2.c: note: in included file:
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:13:2: sparse: sparse: "AltiVec support not enabled"
   lib/raid6/altivec2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: got <
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:22: sparse: sparse: bad constant expression type
   lib/raid6/altivec2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:14:26: sparse: sparse: bad constant expression type
   lib/raid6/altivec2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:14:23: sparse: sparse: bad constant expression type
   lib/raid6/altivec2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:17:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:16:24: sparse: sparse: bad constant expression type
   lib/raid6/altivec2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:41: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:20: sparse: sparse: bad constant expression type
   lib/raid6/altivec2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:14:24: sparse: sparse: bad constant expression type
   lib/raid6/altivec2.c: note: in included file:
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: got pixel
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: got float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: got float
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: got }
--
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17097:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:2: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: got unsigned
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: got char
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18166:1: sparse: sparse: Expected ; at the end of type declaration
--
   lib/raid6/altivec2.c:113:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec2.c:113:9: sparse: sparse: got }
   lib/raid6/altivec2.c:119:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid6/altivec2.c:119:9: sparse: sparse: Expected ; at end of declaration
   lib/raid6/altivec2.c:119:9: sparse: sparse: got {
   lib/raid6/altivec2.c:119:9: sparse: sparse: Expected ) in function declarator
   lib/raid6/altivec2.c:119:9: sparse: sparse: got (
   lib/raid6/altivec2.c:119:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid6/altivec2.c:119:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec2.c:119:9: sparse: sparse: got }
   lib/raid6/altivec2.c:120:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec2.c:120:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:3: sparse: sparse: symbol '__c' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:3: sparse: sparse: symbol '__b' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575)
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697)
   lib/raid6/altivec2.c:81:14: sparse: sparse: undefined identifier 'disks'
   lib/raid6/altivec2.c:82:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec2.c:82:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid6/altivec2.c:82:9: sparse:    int [addressable] [toplevel] p
   lib/raid6/altivec2.c:74:12: sparse: note: previously declared as:
   lib/raid6/altivec2.c:74:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid6/altivec2.c:83:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec2.c:83:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid6/altivec2.c:83:9: sparse:    int [addressable] [toplevel] q
   lib/raid6/altivec2.c:74:16: sparse: note: previously declared as:
   lib/raid6/altivec2.c:74:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid6/altivec2.c:87:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/altivec2.c:87:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec2.c:87:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec2.c:90:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec2.c:90:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec2.c:91:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec2.c:92:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec2.c:93:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec2.c:94:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec2.c:95:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec2.c:96:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec2.c:97:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec2.c:97:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid6/altivec2.c:93)
   lib/raid6/altivec2.c:98:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec2.c:98:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid6/altivec2.c:94)
   lib/raid6/altivec2.c:99:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec2.c:99:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid6/altivec2.c:95)
   lib/raid6/altivec2.c:100:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec2.c:100:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid6/altivec2.c:96)
   lib/raid6/altivec2.c:101:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec2.c:102:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec2.c:102:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid6/altivec2.c:87)
   lib/raid6/altivec2.c:105:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec2.c:105:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec2.c:79:9: sparse: note: previously declared as:
   lib/raid6/altivec2.c:79:9: sparse:    int static [toplevel] unative_t
   lib/raid6/altivec2.c:106:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec2.c:106:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec2.c:79:9: sparse: note: previously declared as:
   lib/raid6/altivec2.c:79:9: sparse:    int static [toplevel] unative_t
   lib/raid6/altivec2.c:107:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec2.c:107:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec2.c:79:9: sparse: note: previously declared as:
   lib/raid6/altivec2.c:79:9: sparse:    int static [toplevel] unative_t
   lib/raid6/altivec2.c:118:9: sparse: sparse: symbol 'disable_kernel_altivec' redeclared with different type (different base types):
   lib/raid6/altivec2.c:118:9: sparse:    int static [signed] [toplevel] disable_kernel_altivec( ... )
   lib/raid6/altivec2.c: note: in included file:
   arch/powerpc/include/asm/switch_to.h:58:20: sparse: note: previously declared as:
   arch/powerpc/include/asm/switch_to.h:58:20: sparse:    void static inline [gnu_inline] [toplevel] disable_kernel_altivec( ... )
   lib/raid6/altivec2.c:136:9: sparse: sparse: undefined identifier 'raid6_altivec2_gen_syndrome'
   lib/raid6/altivec2.c:138:9: sparse: sparse: undefined identifier 'raid6_have_altivec'
--
   lib/raid6/altivec4.c: note: in included file:
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:13:2: sparse: sparse: "AltiVec support not enabled"
   lib/raid6/altivec4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: got <
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:22: sparse: sparse: bad constant expression type
   lib/raid6/altivec4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:14:26: sparse: sparse: bad constant expression type
   lib/raid6/altivec4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:14:23: sparse: sparse: bad constant expression type
   lib/raid6/altivec4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:17:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:16:24: sparse: sparse: bad constant expression type
   lib/raid6/altivec4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:41: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:20: sparse: sparse: bad constant expression type
   lib/raid6/altivec4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:14:24: sparse: sparse: bad constant expression type
   lib/raid6/altivec4.c: note: in included file:
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: got pixel
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: got float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: got float
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: got }
--
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17097:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:2: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: got unsigned
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: got char
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18166:1: sparse: sparse: Expected ; at the end of type declaration
--
   lib/raid6/altivec4.c:135:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec4.c:135:9: sparse: sparse: got }
   lib/raid6/altivec4.c:141:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid6/altivec4.c:141:9: sparse: sparse: Expected ; at end of declaration
   lib/raid6/altivec4.c:141:9: sparse: sparse: got {
   lib/raid6/altivec4.c:141:9: sparse: sparse: Expected ) in function declarator
   lib/raid6/altivec4.c:141:9: sparse: sparse: got (
   lib/raid6/altivec4.c:141:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid6/altivec4.c:141:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec4.c:141:9: sparse: sparse: got }
   lib/raid6/altivec4.c:142:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec4.c:142:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:3: sparse: sparse: symbol '__c' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:3: sparse: sparse: symbol '__b' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575)
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697)
   lib/raid6/altivec4.c:83:14: sparse: sparse: undefined identifier 'disks'
   lib/raid6/altivec4.c:84:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec4.c:84:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid6/altivec4.c:84:9: sparse:    int [addressable] [toplevel] p
   lib/raid6/altivec4.c:74:12: sparse: note: previously declared as:
   lib/raid6/altivec4.c:74:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid6/altivec4.c:85:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec4.c:85:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid6/altivec4.c:85:9: sparse:    int [addressable] [toplevel] q
   lib/raid6/altivec4.c:74:16: sparse: note: previously declared as:
   lib/raid6/altivec4.c:74:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid6/altivec4.c:89:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/altivec4.c:89:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec4.c:89:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec4.c:90:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid6/altivec4.c:90:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec4.c:90:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec4.c:91:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid6/altivec4.c:91:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec4.c:91:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec4.c:94:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec4.c:94:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec4.c:95:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec4.c:95:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec4.c:96:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec4.c:96:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec4.c:97:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:98:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:99:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:100:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:101:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec4.c:102:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec4.c:103:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec4.c:104:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec4.c:105:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec4.c:106:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec4.c:107:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec4.c:108:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec4.c:109:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec4.c:109:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid6/altivec4.c:101)
   lib/raid6/altivec4.c:110:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec4.c:110:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid6/altivec4.c:102)
   lib/raid6/altivec4.c:111:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec4.c:111:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid6/altivec4.c:103)
   lib/raid6/altivec4.c:112:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec4.c:112:25: sparse: sparse: symbol 'w23' has multiple initializers (originally initialized at lib/raid6/altivec4.c:104)
   lib/raid6/altivec4.c:113:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:113:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid6/altivec4.c:105)
   lib/raid6/altivec4.c:114:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:114:25: sparse: sparse: symbol 'w11' has multiple initializers (originally initialized at lib/raid6/altivec4.c:106)
   lib/raid6/altivec4.c:115:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:115:25: sparse: sparse: symbol 'w12' has multiple initializers (originally initialized at lib/raid6/altivec4.c:107)
   lib/raid6/altivec4.c:116:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:116:25: sparse: sparse: symbol 'w13' has multiple initializers (originally initialized at lib/raid6/altivec4.c:108)
   lib/raid6/altivec4.c:117:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:118:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:118:25: sparse: sparse: symbol 'wq1' has multiple initializers (originally initialized at lib/raid6/altivec4.c:89)
   lib/raid6/altivec4.c:119:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:119:25: sparse: sparse: symbol 'wq2' has multiple initializers (originally initialized at lib/raid6/altivec4.c:90)
   lib/raid6/altivec4.c:120:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec4.c:120:25: sparse: sparse: symbol 'wq3' has multiple initializers (originally initialized at lib/raid6/altivec4.c:91)
   lib/raid6/altivec4.c:123:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec4.c:123:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec4.c:81:9: sparse: note: previously declared as:
   lib/raid6/altivec4.c:81:9: sparse:    int static [toplevel] unative_t
   lib/raid6/altivec4.c:124:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec4.c:124:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec4.c:81:9: sparse: note: previously declared as:
   lib/raid6/altivec4.c:81:9: sparse:    int static [toplevel] unative_t
   lib/raid6/altivec4.c:125:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec4.c:125:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec4.c:81:9: sparse: note: previously declared as:
   lib/raid6/altivec4.c:81:9: sparse:    int static [toplevel] unative_t
   lib/raid6/altivec4.c:126:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec4.c:126:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec4.c:81:9: sparse: note: previously declared as:
   lib/raid6/altivec4.c:81:9: sparse:    int static [toplevel] unative_t
   lib/raid6/altivec4.c:127:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec4.c:127:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec4.c:81:9: sparse: note: previously declared as:
   lib/raid6/altivec4.c:81:9: sparse:    int static [toplevel] unative_t
   lib/raid6/altivec4.c:128:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec4.c:128:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec4.c:81:9: sparse: note: previously declared as:
   lib/raid6/altivec4.c:81:9: sparse:    int static [toplevel] unative_t
   lib/raid6/altivec4.c:129:17: sparse: sparse: symbol 'unative_t' redeclared with different type (different base types):
   lib/raid6/altivec4.c:129:17: sparse:    incomplete type *static [toplevel] unative_t
   lib/raid6/altivec4.c:81:9: sparse: note: previously declared as:
--
   lib/raid6/altivec8.c: note: in included file:
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:13:2: sparse: sparse: "AltiVec support not enabled"
   lib/raid6/altivec8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: got <
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:22: sparse: sparse: bad constant expression type
   lib/raid6/altivec8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:14:26: sparse: sparse: bad constant expression type
   lib/raid6/altivec8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:14:23: sparse: sparse: bad constant expression type
   lib/raid6/altivec8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:17:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:16:24: sparse: sparse: bad constant expression type
   lib/raid6/altivec8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:41: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:20: sparse: sparse: bad constant expression type
   lib/raid6/altivec8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:14:24: sparse: sparse: bad constant expression type
   lib/raid6/altivec8.c: note: in included file:
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: got pixel
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: got float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: got float
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: got }
--
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17097:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:2: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: got unsigned
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: got char
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18166:1: sparse: sparse: Expected ; at the end of type declaration
--
   lib/raid6/altivec8.c:179:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec8.c:179:9: sparse: sparse: got }
   lib/raid6/altivec8.c:185:9: sparse: sparse: Trying to use reserved word 'do' as identifier
   lib/raid6/altivec8.c:185:9: sparse: sparse: Expected ; at end of declaration
   lib/raid6/altivec8.c:185:9: sparse: sparse: got {
   lib/raid6/altivec8.c:185:9: sparse: sparse: Expected ) in function declarator
   lib/raid6/altivec8.c:185:9: sparse: sparse: got (
   lib/raid6/altivec8.c:185:9: sparse: sparse: Trying to use reserved word 'if' as identifier
   lib/raid6/altivec8.c:185:9: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec8.c:185:9: sparse: sparse: got }
   lib/raid6/altivec8.c:186:1: sparse: sparse: Expected ; at the end of type declaration
   lib/raid6/altivec8.c:186:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:3: sparse: sparse: symbol '__c' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:3: sparse: sparse: symbol '__b' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575)
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697)
   lib/raid6/altivec8.c:87:14: sparse: sparse: undefined identifier 'disks'
   lib/raid6/altivec8.c:88:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:88:9: sparse: sparse: symbol 'p' redeclared with different type (different base types):
   lib/raid6/altivec8.c:88:9: sparse:    int [addressable] [toplevel] p
   lib/raid6/altivec8.c:74:12: sparse: note: previously declared as:
   lib/raid6/altivec8.c:74:12: sparse:    unsigned char [usertype] *[addressable] [toplevel] p
   lib/raid6/altivec8.c:89:13: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:89:9: sparse: sparse: symbol 'q' redeclared with different type (different base types):
   lib/raid6/altivec8.c:89:9: sparse:    int [addressable] [toplevel] q
   lib/raid6/altivec8.c:74:16: sparse: note: previously declared as:
   lib/raid6/altivec8.c:74:16: sparse:    unsigned char [usertype] *[addressable] [toplevel] q
   lib/raid6/altivec8.c:93:23: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/altivec8.c:93:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:93:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:94:23: sparse: sparse: undefined identifier 'wp2'
   lib/raid6/altivec8.c:94:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:94:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:95:23: sparse: sparse: undefined identifier 'wp3'
   lib/raid6/altivec8.c:95:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:95:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:96:23: sparse: sparse: undefined identifier 'wp4'
   lib/raid6/altivec8.c:96:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:96:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:97:23: sparse: sparse: undefined identifier 'wp5'
   lib/raid6/altivec8.c:97:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:97:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:98:23: sparse: sparse: undefined identifier 'wp6'
   lib/raid6/altivec8.c:98:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:98:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:99:23: sparse: sparse: undefined identifier 'wp7'
   lib/raid6/altivec8.c:99:29: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:99:44: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:102:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:102:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:103:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:103:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:104:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:104:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:105:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:105:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:106:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:106:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:107:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:107:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:108:31: sparse: sparse: cannot dereference this type
   lib/raid6/altivec8.c:108:46: sparse: sparse: undefined identifier 'dptr'
   lib/raid6/altivec8.c:109:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec8.c:110:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec8.c:111:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec8.c:112:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec8.c:113:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec8.c:114:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec8.c:115:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec8.c:116:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec8.c:117:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec8.c:118:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec8.c:119:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec8.c:120:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec8.c:121:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec8.c:122:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec8.c:123:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec8.c:124:31: sparse: sparse: undefined identifier 'MASK'
   lib/raid6/altivec8.c:125:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec8.c:126:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec8.c:127:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec8.c:128:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec8.c:129:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec8.c:130:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec8.c:131:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec8.c:132:31: sparse: sparse: undefined identifier 'SHLBYTE'
   lib/raid6/altivec8.c:133:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec8.c:133:25: sparse: sparse: symbol 'w20' has multiple initializers (originally initialized at lib/raid6/altivec8.c:117)
   lib/raid6/altivec8.c:134:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec8.c:134:25: sparse: sparse: symbol 'w21' has multiple initializers (originally initialized at lib/raid6/altivec8.c:118)
   lib/raid6/altivec8.c:135:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec8.c:135:25: sparse: sparse: symbol 'w22' has multiple initializers (originally initialized at lib/raid6/altivec8.c:119)
   lib/raid6/altivec8.c:136:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec8.c:136:25: sparse: sparse: symbol 'w23' has multiple initializers (originally initialized at lib/raid6/altivec8.c:120)
   lib/raid6/altivec8.c:137:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec8.c:137:25: sparse: sparse: symbol 'w24' has multiple initializers (originally initialized at lib/raid6/altivec8.c:121)
   lib/raid6/altivec8.c:138:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec8.c:138:25: sparse: sparse: symbol 'w25' has multiple initializers (originally initialized at lib/raid6/altivec8.c:122)
   lib/raid6/altivec8.c:139:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec8.c:139:25: sparse: sparse: symbol 'w26' has multiple initializers (originally initialized at lib/raid6/altivec8.c:123)
   lib/raid6/altivec8.c:140:31: sparse: sparse: undefined identifier 'vec_and'
   lib/raid6/altivec8.c:140:25: sparse: sparse: symbol 'w27' has multiple initializers (originally initialized at lib/raid6/altivec8.c:124)
   lib/raid6/altivec8.c:141:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/altivec8.c:141:25: sparse: sparse: symbol 'w10' has multiple initializers (originally initialized at lib/raid6/altivec8.c:125)
--
   lib/raid6/vpermxor1.c: note: in included file:
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:13:2: sparse: sparse: "AltiVec support not enabled"
   lib/raid6/vpermxor1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: got <
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:22: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:14:26: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:14:23: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:17:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:16:24: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:41: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:20: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor1.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:14:24: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor1.c: note: in included file:
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: got pixel
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: got float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: got float
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: got }
--
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17097:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:2: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: got unsigned
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: got char
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18166:1: sparse: sparse: Expected ; at the end of type declaration
--
   lib/raid6/vpermxor1.c:36:30: sparse: sparse: Expected ; at end of declaration
   lib/raid6/vpermxor1.c:36:30: sparse: sparse: got char
   lib/raid6/vpermxor1.c:39:21: sparse: sparse: two or more data types in declaration specifiers
   lib/raid6/vpermxor1.c:39:21: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   lib/raid6/vpermxor1.c:39:30: sparse: sparse: Expected ; at end of declaration
   lib/raid6/vpermxor1.c:39:30: sparse: sparse: got char
   lib/raid6/vpermxor1.c:49:19: sparse: sparse: Expected ; at end of statement
   lib/raid6/vpermxor1.c:49:19: sparse: sparse: got wp0
   lib/raid6/vpermxor1.c:56:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor1.c:59:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor1.c:67:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor1.c:68:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:3: sparse: sparse: symbol '__c' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:3: sparse: sparse: symbol '__b' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575)
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697)
   lib/raid6/vpermxor1.c:49:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor1.c:56:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor1.c:56:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor1.c:56:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor1.c:56:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor1.c:59:25: sparse: sparse: undefined identifier 'wd0'
   lib/raid6/vpermxor1.c:59:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor1.c:59:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor1.c:61:25: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor1.c:61:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor1.c:64:56: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor1.c:65:25: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor1.c:65:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor1.c:67:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor1.c:67:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor1.c:67:47: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor1.c:68:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor1.c:68:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor1.c:68:47: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor1.c:55:37: sparse: sparse: undefined identifier 'unative_t'
--
   lib/raid6/vpermxor2.c: note: in included file:
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:13:2: sparse: sparse: "AltiVec support not enabled"
   lib/raid6/vpermxor2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: got <
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:22: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:14:26: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:14:23: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:17:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:16:24: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:41: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:20: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor2.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:14:24: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor2.c: note: in included file:
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: got pixel
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: got float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: got float
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: got }
--
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17097:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:2: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: got unsigned
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: got char
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18166:1: sparse: sparse: Expected ; at the end of type declaration
--
   lib/raid6/vpermxor2.c:49:19: sparse: sparse: Expected ; at end of statement
   lib/raid6/vpermxor2.c:49:19: sparse: sparse: got wp0
   lib/raid6/vpermxor2.c:50:19: sparse: sparse: Expected ; at end of statement
   lib/raid6/vpermxor2.c:50:19: sparse: sparse: got wp1
   lib/raid6/vpermxor2.c:57:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor2.c:58:42: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor2.c:61:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor2.c:62:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor2.c:73:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor2.c:74:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor2.c:75:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor2.c:76:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:3: sparse: sparse: symbol '__c' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:3: sparse: sparse: symbol '__b' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575)
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697)
   lib/raid6/vpermxor2.c:49:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:50:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:57:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor2.c:57:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor2.c:57:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:57:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:58:17: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/vpermxor2.c:58:23: sparse: sparse: undefined identifier 'wq1'
   lib/raid6/vpermxor2.c:58:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:58:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:61:25: sparse: sparse: undefined identifier 'wd0'
   lib/raid6/vpermxor2.c:61:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:61:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:62:25: sparse: sparse: undefined identifier 'wd1'
   lib/raid6/vpermxor2.c:62:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:62:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:64:25: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor2.c:64:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor2.c:65:25: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/vpermxor2.c:65:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor2.c:68:56: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor2.c:69:56: sparse: sparse: undefined identifier 'wq1'
   lib/raid6/vpermxor2.c:70:25: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor2.c:70:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor2.c:71:25: sparse: sparse: undefined identifier 'wq1'
   lib/raid6/vpermxor2.c:71:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor2.c:73:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:73:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:73:47: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor2.c:74:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:74:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:74:47: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/vpermxor2.c:75:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:75:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:75:47: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor2.c:76:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:76:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor2.c:76:47: sparse: sparse: undefined identifier 'wq1'
   lib/raid6/vpermxor2.c:56:37: sparse: sparse: undefined identifier 'unative_t'
--
   lib/raid6/vpermxor4.c: note: in included file:
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:13:2: sparse: sparse: "AltiVec support not enabled"
   lib/raid6/vpermxor4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: got <
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:22: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:14:26: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:14:23: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:17:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:16:24: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:41: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:20: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor4.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:14:24: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor4.c: note: in included file:
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: got pixel
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: got float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: got float
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: got }
--
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17097:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:2: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: got unsigned
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: got char
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18166:1: sparse: sparse: Expected ; at the end of type declaration
--
   lib/raid6/vpermxor4.c:65:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:66:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:67:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:68:44: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:85:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:86:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:87:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:88:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:89:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:90:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:91:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor4.c:92:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:3: sparse: sparse: symbol '__c' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:3: sparse: sparse: symbol '__b' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575)
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697)
   lib/raid6/vpermxor4.c:49:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:50:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:51:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:52:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:59:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor4.c:59:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor4.c:59:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:59:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:60:17: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/vpermxor4.c:60:23: sparse: sparse: undefined identifier 'wq1'
   lib/raid6/vpermxor4.c:60:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:60:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:61:17: sparse: sparse: undefined identifier 'wp2'
   lib/raid6/vpermxor4.c:61:23: sparse: sparse: undefined identifier 'wq2'
   lib/raid6/vpermxor4.c:61:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:61:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:62:17: sparse: sparse: undefined identifier 'wp3'
   lib/raid6/vpermxor4.c:62:23: sparse: sparse: undefined identifier 'wq3'
   lib/raid6/vpermxor4.c:62:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:62:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:65:25: sparse: sparse: undefined identifier 'wd0'
   lib/raid6/vpermxor4.c:65:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:65:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:66:25: sparse: sparse: undefined identifier 'wd1'
   lib/raid6/vpermxor4.c:66:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:66:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:67:25: sparse: sparse: undefined identifier 'wd2'
   lib/raid6/vpermxor4.c:67:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:67:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:68:25: sparse: sparse: undefined identifier 'wd3'
   lib/raid6/vpermxor4.c:68:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:68:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:70:25: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor4.c:70:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor4.c:71:25: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/vpermxor4.c:71:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor4.c:72:25: sparse: sparse: undefined identifier 'wp2'
   lib/raid6/vpermxor4.c:72:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor4.c:73:25: sparse: sparse: undefined identifier 'wp3'
   lib/raid6/vpermxor4.c:73:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor4.c:76:56: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor4.c:77:56: sparse: sparse: undefined identifier 'wq1'
   lib/raid6/vpermxor4.c:78:56: sparse: sparse: undefined identifier 'wq2'
   lib/raid6/vpermxor4.c:79:56: sparse: sparse: undefined identifier 'wq3'
   lib/raid6/vpermxor4.c:80:25: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor4.c:80:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor4.c:81:25: sparse: sparse: undefined identifier 'wq1'
   lib/raid6/vpermxor4.c:81:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor4.c:82:25: sparse: sparse: undefined identifier 'wq2'
   lib/raid6/vpermxor4.c:82:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor4.c:83:25: sparse: sparse: undefined identifier 'wq3'
   lib/raid6/vpermxor4.c:83:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor4.c:85:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:85:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:85:47: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor4.c:86:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:86:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:86:47: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/vpermxor4.c:87:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:87:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:87:47: sparse: sparse: undefined identifier 'wp2'
   lib/raid6/vpermxor4.c:88:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:88:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:88:47: sparse: sparse: undefined identifier 'wp3'
   lib/raid6/vpermxor4.c:89:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:89:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:89:47: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor4.c:90:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:90:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:90:47: sparse: sparse: undefined identifier 'wq1'
   lib/raid6/vpermxor4.c:91:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:91:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:91:47: sparse: sparse: undefined identifier 'wq2'
   lib/raid6/vpermxor4.c:92:19: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:92:36: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor4.c:92:47: sparse: sparse: undefined identifier 'wq3'
   lib/raid6/vpermxor4.c:58:37: sparse: sparse: undefined identifier 'unative_t'
--
   lib/raid6/vpermxor8.c: note: in included file:
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:13:2: sparse: sparse: "AltiVec support not enabled"
   lib/raid6/vpermxor8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: Expected ) in function call
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:44: sparse: sparse: got <
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:43: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h:22:22: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_ptrdiff_t.h:14:26: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_size_t.h:14:23: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:17:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_wchar_t.h:16:24: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:41: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_null.h:10:20: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor8.c: note: in included file (through /opt/cross/clang-7773243d99/lib/clang/20/include/stddef.h, /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h):
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:15:50: sparse: sparse: not a function <noident>
   /opt/cross/clang-7773243d99/lib/clang/20/include/__stddef_offsetof.h:14:24: sparse: sparse: bad constant expression type
   lib/raid6/vpermxor8.c: note: in included file:
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:50:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:53:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:57:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:60:26: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:64:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:68:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:71:26: sparse: sparse: got pixel
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:75:26: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:79:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:82:26: sparse: sparse: got bool
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:85:26: sparse: sparse: got float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:107:26: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:116:26: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:119:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:124:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:129:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:18: sparse: sparse: got float
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:144:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:146:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:163:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:169:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:175:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:202:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:207:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:217:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:222:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:227:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:232:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:237:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:242:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:247:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:252:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:257:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:262:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:267:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:272:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:277:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:282:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:287:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:345:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:386:10: sparse: sparse: got signed
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:387:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:388:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:394:10: sparse: sparse: got unsigned
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:395:10: sparse: sparse: got vec_add
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:396:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:478:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:483:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:488:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:493:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:498:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:503:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:512:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:517:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:522:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:527:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:532:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:537:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:551:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:556:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:561:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:566:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:571:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:580:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:588:1: sparse: sparse: got }
--
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17097:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17103:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17109:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17115:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17121:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17125:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17130:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17136:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17142:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17154:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17160:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17212:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17250:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17268:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17286:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17304:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17321:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17334:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17531:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17536:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17542:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17546:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17550:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17555:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17559:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17564:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17569:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17573:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17600:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17605:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17610:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17616:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17617:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17623:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17624:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17630:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17631:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17637:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17638:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17644:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17645:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17651:10: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17652:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:2: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17658:9: sparse: sparse: got vec_perm
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17659:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17717:16: sparse: sparse: got unsigned
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17718:23: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17719:25: sparse: sparse: got short
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:16: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17720:23: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:16: sparse: sparse: Trying to use reserved word 'unsigned' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17721:25: sparse: sparse: got int
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: two or more data types in declaration specifiers
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:16: sparse: sparse: Trying to use reserved word 'float' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17722:22: sparse: sparse: got unaligned_vec_float
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: two or more data types in declaration specifiers
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:35: sparse: sparse: Trying to use reserved word 'signed' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17724:42: sparse: sparse: got char
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17727:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17732:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17737:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17738:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17743:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17744:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17749:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17750:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17755:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17756:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17761:10: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17762:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17812:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17814:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17819:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17821:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17826:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17827:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:3: sparse: sparse: Trying to use reserved word 'return' as identifier
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: Expected ; at end of declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17832:10: sparse: sparse: got __builtin_shufflevector
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17833:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17838:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17843:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17848:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:17997:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18002:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18007:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18008:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18014:26: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18015:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18020:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18021:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18026:24: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18027:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: Expected ) in nested declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18032:25: sparse: sparse: got *
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18033:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18137:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18138:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18147:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18148:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18156:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: Expected ; at the end of type declaration
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18157:1: sparse: sparse: got }
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: Expected ) in function declarator
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18165:28: sparse: sparse: got (
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:18166:1: sparse: sparse: Expected ; at the end of type declaration
--
   lib/raid6/vpermxor8.c:113:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:114:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:115:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:116:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:117:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:118:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:119:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:120:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:121:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:122:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:123:30: sparse: sparse: No right hand side of '*'-expression
   lib/raid6/vpermxor8.c:124:30: sparse: sparse: No right hand side of '*'-expression
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7967)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7982)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:7996)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8011)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8026)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8040)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8055)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8070)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8083)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:9: sparse: sparse: undefined identifier 'vec_xor'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8112:3: sparse: sparse: symbol '__d' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:8097)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10107)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10116)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10125)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10134)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10143)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10152)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:22: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:35: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:30: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:48: sparse: sparse: undefined identifier 'b0'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170:43: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10161)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10241)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10250)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10259)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10268)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10170)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10281)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10290)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:22: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:17: sparse: sparse: symbol 'b1' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:36: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:31: sparse: sparse: symbol 'b2' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:50: sparse: sparse: undefined identifier '__b'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10308:45: sparse: sparse: symbol 'b3' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:10299)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:9: sparse: sparse: undefined identifier '__builtin_altivec_vsum2sws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12554:3: sparse: sparse: symbol '__c' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12537)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:9: sparse: sparse: undefined identifier '__builtin_altivec_vsumsws'
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12588:3: sparse: sparse: symbol '__b' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:12575)
>> /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14654)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14664)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14672)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14681)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14688)
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:22: sparse: sparse: invalid initializer
   /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14704:3: sparse: sparse: symbol '__res' has multiple initializers (originally initialized at /opt/cross/clang-7773243d99/lib/clang/20/include/altivec.h:14697)
   lib/raid6/vpermxor8.c:49:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:50:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:51:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:52:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:53:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:54:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:55:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:56:9: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:63:17: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor8.c:63:23: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor8.c:63:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:63:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:64:17: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/vpermxor8.c:64:23: sparse: sparse: undefined identifier 'wq1'
   lib/raid6/vpermxor8.c:64:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:64:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:65:17: sparse: sparse: undefined identifier 'wp2'
   lib/raid6/vpermxor8.c:65:23: sparse: sparse: undefined identifier 'wq2'
   lib/raid6/vpermxor8.c:65:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:65:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:66:17: sparse: sparse: undefined identifier 'wp3'
   lib/raid6/vpermxor8.c:66:23: sparse: sparse: undefined identifier 'wq3'
   lib/raid6/vpermxor8.c:66:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:66:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:67:17: sparse: sparse: undefined identifier 'wp4'
   lib/raid6/vpermxor8.c:67:23: sparse: sparse: undefined identifier 'wq4'
   lib/raid6/vpermxor8.c:67:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:67:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:68:17: sparse: sparse: undefined identifier 'wp5'
   lib/raid6/vpermxor8.c:68:23: sparse: sparse: undefined identifier 'wq5'
   lib/raid6/vpermxor8.c:68:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:68:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:69:17: sparse: sparse: undefined identifier 'wp6'
   lib/raid6/vpermxor8.c:69:23: sparse: sparse: undefined identifier 'wq6'
   lib/raid6/vpermxor8.c:69:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:69:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:70:17: sparse: sparse: undefined identifier 'wp7'
   lib/raid6/vpermxor8.c:70:23: sparse: sparse: undefined identifier 'wq7'
   lib/raid6/vpermxor8.c:70:31: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:70:57: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:73:25: sparse: sparse: undefined identifier 'wd0'
   lib/raid6/vpermxor8.c:73:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:73:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:74:25: sparse: sparse: undefined identifier 'wd1'
   lib/raid6/vpermxor8.c:74:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:74:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:75:25: sparse: sparse: undefined identifier 'wd2'
   lib/raid6/vpermxor8.c:75:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:75:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:76:25: sparse: sparse: undefined identifier 'wd3'
   lib/raid6/vpermxor8.c:76:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:76:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:77:25: sparse: sparse: undefined identifier 'wd4'
   lib/raid6/vpermxor8.c:77:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:77:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:78:25: sparse: sparse: undefined identifier 'wd5'
   lib/raid6/vpermxor8.c:78:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:78:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:79:25: sparse: sparse: undefined identifier 'wd6'
   lib/raid6/vpermxor8.c:79:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:79:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:80:25: sparse: sparse: undefined identifier 'wd7'
   lib/raid6/vpermxor8.c:80:33: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:80:58: sparse: sparse: undefined identifier 'unative_t'
   lib/raid6/vpermxor8.c:82:25: sparse: sparse: undefined identifier 'wp0'
   lib/raid6/vpermxor8.c:82:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor8.c:83:25: sparse: sparse: undefined identifier 'wp1'
   lib/raid6/vpermxor8.c:83:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor8.c:84:25: sparse: sparse: undefined identifier 'wp2'
   lib/raid6/vpermxor8.c:84:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor8.c:85:25: sparse: sparse: undefined identifier 'wp3'
   lib/raid6/vpermxor8.c:85:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor8.c:86:25: sparse: sparse: undefined identifier 'wp4'
   lib/raid6/vpermxor8.c:86:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor8.c:87:25: sparse: sparse: undefined identifier 'wp5'
   lib/raid6/vpermxor8.c:87:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor8.c:88:25: sparse: sparse: undefined identifier 'wp6'
   lib/raid6/vpermxor8.c:88:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor8.c:89:25: sparse: sparse: undefined identifier 'wp7'
   lib/raid6/vpermxor8.c:89:31: sparse: sparse: undefined identifier 'vec_xor'
   lib/raid6/vpermxor8.c:92:56: sparse: sparse: undefined identifier 'wq0'
   lib/raid6/vpermxor8.c:93:56: sparse: sparse: undefined identifier 'wq1'
   lib/raid6/vpermxor8.c:94:56: sparse: sparse: undefined identifier 'wq2'
   lib/raid6/vpermxor8.c:95:56: sparse: sparse: undefined identifier 'wq3'
   lib/raid6/vpermxor8.c:96:56: sparse: sparse: undefined identifier 'wq4'
   lib/raid6/vpermxor8.c:97:56: sparse: sparse: undefined identifier 'wq5'
   lib/raid6/vpermxor8.c:98:56: sparse: sparse: undefined identifier 'wq6'
   lib/raid6/vpermxor8.c:99:56: sparse: sparse: undefined identifier 'wq7'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
