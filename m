Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FF52AE78
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Apr 2026 17:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777138638; cv=none; b=lUDzriB4sOHDQSqAaC4txnwPDMy8r9VsskwoEHnn3I043XnCCaimh6fR3OeZGrl2AiJjlg2NQGYsfAHxjLqNnod59BmZmY4s6p0S1PcXD5HBf0MAg8sc+y7ddBQXivi+JLbXbRJo6/QLGCvq4XIXNH5sBwf+0BKWbuF5fGbvWuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777138638; c=relaxed/simple;
	bh=YL3Oc0TO7Wzx1N/ZjklFLHWo4DwO0tS6jiTuKHvQMcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=fyZZs8HfNfB+N/HVmqpXR77qDguMQEHwtnhST+FufAFv12X6hDqWgafhrgP0xZQCMZV8USoGxsJ4579LxFOHaArlkAKaOGDjNfaJ7vT1ILw9aubsuMYg/S4fsAhIqw7NgGuFgGlnyUKjgQqj8opIhjWa4qGR1JeTAtvWMLEZlQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DNbKpvgj; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DNbKpvgj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777138635; x=1808674635;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=YL3Oc0TO7Wzx1N/ZjklFLHWo4DwO0tS6jiTuKHvQMcI=;
  b=DNbKpvgjeigMGrDY9yJDGn4r0Od3/+kE5qrg+EZSSaPSCclDNV2DaXQT
   qg7z1X48G9cfwY+Imw1+1AkVkycPsUeRUgqpNNuKs5d+VsaxpMRlyaxGR
   Gud8uyjCnKKjMjQkMlf2oJfzb10yUiEl+gagm8Vf8GMPLVCwSoBq8qUkH
   DdkGJAy4HVC+ms+n99SHyttN+QaHgv3+KnuUpVbayk3nccuu4v+sdx1Vy
   SSXcboA6f4qQ+zMWmAdXXeSF6zYJdbsKVjBmpqHUOmpFyDHBGq0EHtVr4
   wHgkOFwUfj3OQRArHRZvDUKJcjfCvSqyqsLqX0FePUcdhOVIjf3aoh29M
   Q==;
X-CSE-ConnectionGUID: JSqmW3KhTmaRewkLUG2O+Q==
X-CSE-MsgGUID: YRM2MHjJR5emkqXvU/MGeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11767"; a="100744075"
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="100744075"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2026 10:37:15 -0700
X-CSE-ConnectionGUID: ngUncuL7Ro2pN34ZXQnOMA==
X-CSE-MsgGUID: rwdD3Ty4TneNCZttjNS1Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,198,1770624000"; 
   d="scan'208";a="256541329"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2026 10:37:13 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGgwJ-000000003Qf-21M1;
	Sat, 25 Apr 2026 17:37:11 +0000
Date: Sat, 25 Apr 2026 19:36:36 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /usr/s390x-linux-gnu/include/asm/sigcontext.h:73:9: error:
 unknown type name '__vector128'
Message-ID: <202604251910.osFNDk7E-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

Hi Thomas,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   897d54018cc9aa97fd1529ca08a53b429d05a566
commit: 9b93f7e3277490f0356309c9b241eeeaa27ba859 tools/getdelays: use the s=
tatic UAPI headers from tools/include/uapi
date:   4 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 weeks ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
425/202604251910.osFNDk7E-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260425/202604251910.osFNDk7E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 9b93f7e32774 ("tools/getdelays: use the static UAPI headers from t=
ools/include/uapi")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604251910.osFNDk7E-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from /usr/s390x-linux-gnu/include/bits/sigcontext.h:30,
                    from /usr/s390x-linux-gnu/include/signal.h:301,
                    from /usr/s390x-linux-gnu/include/sys/wait.h:36,
                    from getdelays.c:25:
>> /usr/s390x-linux-gnu/include/asm/sigcontext.h:73:9: error: unknown type =
name '__vector128'
      73 |         __vector128 vxrs_high[__NUM_VXRS_HIGH];
         |         ^~~~~~~~~~~

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
