Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C27EA55
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Feb 2026 00:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770855516; cv=none; b=MsVkHPPRDlY2vnP3rvTQAouFZnkcLa8E4eJ4Y/KrUb0msbPXvV7+mfWuiYs4BajG+VhVhtuRbGbqFXZ5XNoFZgmlqXlBtxZnUoxkDbRulNn8qOOSEylruwsg11gfuXgs45zCglHzRGL9fDclguaJdkQHzS/eWhvECFOT5ZAgJRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770855516; c=relaxed/simple;
	bh=FkRRAbhiBmaEdFiU3sDf8QIYtml6dyWS0wc5dpnkMVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=m3Pe2bMt3okIx8vOUnK+7wm9gqBZS8eHky2jIcNbGSYTi3oTwxegPGSPVLPKDNgz/uzxgezRkZZ7hI7uofyJgIlY6HyPZg7lkKHrmPk7SXmOIDxzeOBbWVsEXv4JOgB3WJ31CseiPl3XJ90JG4QxhFHP48SJOyopMJX8R9Xsa2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oGJoqNrA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oGJoqNrA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770855514; x=1802391514;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FkRRAbhiBmaEdFiU3sDf8QIYtml6dyWS0wc5dpnkMVs=;
  b=oGJoqNrARAS+0h08NYRl4HYM3R17vdyxQUs3BpkLs1OlWmKSCr1G10jH
   IrJvrmm1/e02qUHlWkmyl6xeMI4aD74VQx8YaUJpH7RGNpvY4Mm33tKcc
   VMZQqfWYaQ47+uBfK02YNomfeu8PcSNQUiW0uZTM1cWDvSu/4ML2IC+Ap
   DoC6bHmt9dx+RoQGt5BavZK9SSdrDwz8fD8cAtvRcnOkGmovkakHmLzkr
   Esc1ELIkwaCb/6sn0ANWwpWi2hhk7xRM3zpU0RO3rASdET2c+NZ0Us469
   DVsnCOn2nTv4pUSqMCR6ym7FGUVpXA5SgA3GGtZMC/2VD5lhYtfjuzti5
   Q==;
X-CSE-ConnectionGUID: p1bqXOlbR5SgoOxsN9PYtQ==
X-CSE-MsgGUID: QSpDkmtsQOO8+ooKblRISg==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="89602142"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="89602142"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 16:18:33 -0800
X-CSE-ConnectionGUID: g8Um5fEASwCoiehjerP6gg==
X-CSE-MsgGUID: fEPpEhYERJWAT7OR+M92TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="216939929"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 11 Feb 2026 16:18:33 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqKPd-000000001DF-1GFR;
	Thu, 12 Feb 2026 00:18:29 +0000
Date: Thu, 12 Feb 2026 01:17:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11582/12577] tsync_test.c:9:10: fatal
 error: pthread.h: No such file or directory
Message-ID: <202602120104.fDhAEAZu-lkp@intel.com>
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
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "G=C3=BCnther Noack" <gnoack@google.com>
CC: "Micka=C3=ABl Sala=C3=BCn" <mic@digikod.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   9152bc8cebcb14dc16b03ec81f2377ee8ce12268
commit: 50c058e3eafe31a5197d4cffb599f2f5f165d4eb [11582/12577] selftests/la=
ndlock: Add LANDLOCK_RESTRICT_SELF_TSYNC tests
:::::: branch date: 10 hours ago
:::::: commit date: 5 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
212/202602120104.fDhAEAZu-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260212/202602120104.fDhAEAZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602120104.fDhAEAZu-lkp@intel.com/

Note: the linux-next/master HEAD 9152bc8cebcb14dc16b03ec81f2377ee8ce12268 b=
uilds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

>> tsync_test.c:9:10: fatal error: pthread.h: No such file or directory
       9 | #include <pthread.h>
         |          ^~~~~~~~~~~
   compilation terminated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
