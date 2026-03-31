Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F2440DFAE
	for <oe-kbuild@lists.linux.dev>; Tue, 31 Mar 2026 04:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774931591; cv=none; b=QsPJCvhtFXBOi67/72dJa2nj8L/oKh4NGEbiFadsydkdwNd/S1TQN+CwIII8VGC4jDxHQx1//CbsxspnIDNtmVxzQsl1KlAcpTHkCbwbM9BVGecJDg527g8Rckvp8WvydhTQQfnRI0UPxmaCSHD4JfuBcmHPpQtBzLjupIf09i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774931591; c=relaxed/simple;
	bh=SJ77CT6NHaInS4G5lK5ZYafrE09VE04AI0CsL1zegVs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GMKQ1n2Kl9Az5v7+8uBMzRRLodIInwXj8caO9BUb6weacjUZwuIdHwRD2fUBwdX9TfUyByQyCLcNzJIY5m56VM7CD8/U15jHQO9DQbDFKtCe+ihRS9q8honrEP1GwWvOeRa1soXFQQDk7byQ/gc2yaHgTuu/2qXCdIz2Kg3fT8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9COWx+W; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9COWx+W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774931589; x=1806467589;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=SJ77CT6NHaInS4G5lK5ZYafrE09VE04AI0CsL1zegVs=;
  b=L9COWx+WyR9He1Je+pRfBkrBmNq/Caee9kD//Rmq/tuUN7v/mV8LtDt1
   3kv1TAQjxSldxGB/xmXGBGCjaZi1F2ACoVLb0d7uw1YXajWntBkiOGB5t
   V9vLJs8Up44OZtlTCk/5svvPzjOb17JPdR2Jv8ZcuT25avC9hpNlMtqgq
   3w2rZ/zDWLDqxj2/7Pn6wphNSRj8II2hvkuFi4guTBrzeCrHWQ7XDCjGg
   WFk6lTJvHyTiQTPZb2aKY7kOgA51Re0CyVHHEKXifP02w5xFIrOWk6D9S
   6CW8UgpN80b57aP2Lz50cIf0TVJW3T8j7LetviW4X9LTflxdwga+Pu5pC
   Q==;
X-CSE-ConnectionGUID: lUc1sSiLQICTlicP2dWg3Q==
X-CSE-MsgGUID: CT+U58dwQP2PqBPCWxb0BQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75107265"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75107265"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 21:33:08 -0700
X-CSE-ConnectionGUID: ZU0NBT6MRMSScSoT91k3pA==
X-CSE-MsgGUID: u27mcRjRST6WL7GMfWl/Dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="227867969"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Mar 2026 21:33:08 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Qmn-000000002E3-3WRa;
	Tue, 31 Mar 2026 04:33:05 +0000
Date: Tue, 31 Mar 2026 12:32:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android16-6.12 1/1]
 lib/longest_symbol_kunit.c:28:14: sparse: sparse: '##' failed: concatenation
 is not a valid token
Message-ID: <202603311233.3ce8kwsF-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: lib/longe=
st_symbol_kunit.c:28:14: sparse: sparse: '##' failed: concatenation is not =
a valid token"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   c9dd6d939a0d4c818436b4f27e08d48e330fc6c4
commit: b8abcba6e4aec53868dfe44f97270fc4dee0df2a [1/1] Kunit to check the l=
ongest symbol length
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-r121-20260331 (https://download.01.org/0day-ci/ar=
chive/20260331/202603311233.3ce8kwsF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260331/202603311233.3ce8kwsF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603311233.3ce8kwsF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/longest_symbol_kunit.c:28:14: sparse: sparse: '##' failed: concatena=
tion is not a valid token
>> lib/longest_symbol_kunit.c:28:14: sparse: sparse: '##' failed: concatena=
tion is not a valid token
   lib/longest_symbol_kunit.c:29:14: sparse: sparse: '##' failed: concatena=
tion is not a valid token
   lib/longest_symbol_kunit.c:29:14: sparse: sparse: '##' failed: concatena=
tion is not a valid token
   lib/longest_symbol_kunit.c:34:23: sparse: sparse: '##' failed: concatena=
tion is not a valid token
   lib/longest_symbol_kunit.c:34:23: sparse: sparse: '##' failed: concatena=
tion is not a valid token
   lib/longest_symbol_kunit.c:37:1: sparse: sparse: '##' failed: concatenat=
ion is not a valid token
   lib/longest_symbol_kunit.c:37:1: sparse: sparse: '##' failed: concatenat=
ion is not a valid token
   lib/longest_symbol_kunit.c:41:9: sparse: sparse: '##' failed: concatenat=
ion is not a valid token
   lib/longest_symbol_kunit.c:41:9: sparse: sparse: '##' failed: concatenat=
ion is not a valid token
   lib/longest_symbol_kunit.c:64:47: sparse: sparse: '##' failed: concatena=
tion is not a valid token
   lib/longest_symbol_kunit.c:64:47: sparse: sparse: '##' failed: concatena=
tion is not a valid token
   lib/longest_symbol_kunit.c:28:14: sparse: sparse: Expected ; at end of d=
eclaration
   lib/longest_symbol_kunit.c:28:14: sparse: sparse: got nnnng1h2i3j4k5l6m7=
ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l=
6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3=
j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h=
2i3j4k5l6m7n
   lib/longest_symbol_kunit.c:29:14: sparse: sparse: Expected ; at end of d=
eclaration
   lib/longest_symbol_kunit.c:29:14: sparse: sparse: got nnnng1h2i3j4k5l6m7=
ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l=
6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3=
j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h=
2i3j4k5l6m7n
   lib/longest_symbol_kunit.c:32:1: sparse: sparse: Expected ; at the end o=
f type declaration
   lib/longest_symbol_kunit.c:32:1: sparse: sparse: got }
   lib/longest_symbol_kunit.c:41:9: sparse: sparse: Expected ) after typeof
   lib/longest_symbol_kunit.c:41:9: sparse: sparse: got nnnng1h2i3j4k5l6m7n=
g1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6=
m7nng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nnnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j=
4k5l6m7ng1h2i3j4k5l6m7nnng1h2i3j4k5l6m7ng1h2i3j4k5l6m7nng1h2i3j4k5l6m7ng1h2=
i3j4k5l6m7n
   lib/longest_symbol_kunit.c:41:9: sparse: sparse: undefined identifier '_=
_right'
   lib/longest_symbol_kunit.c:41:9: sparse: sparse: undefined identifier '_=
_right'

vim +28 lib/longest_symbol_kunit.c

b8abcba6e4aec5 Sergio Gonz=C3=A1lez Collado 2025-03-02  27 =20
b8abcba6e4aec5 Sergio Gonz=C3=A1lez Collado 2025-03-02 @28  noinline int LO=
NGEST_SYM_NAME(void);
b8abcba6e4aec5 Sergio Gonz=C3=A1lez Collado 2025-03-02  29  noinline int LO=
NGEST_SYM_NAME(void)
b8abcba6e4aec5 Sergio Gonz=C3=A1lez Collado 2025-03-02  30  {
b8abcba6e4aec5 Sergio Gonz=C3=A1lez Collado 2025-03-02  31  	return RETURN_=
LONGEST_SYM;
b8abcba6e4aec5 Sergio Gonz=C3=A1lez Collado 2025-03-02  32  }
b8abcba6e4aec5 Sergio Gonz=C3=A1lez Collado 2025-03-02  33 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
