Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB1F156F33
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 12:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725195467; cv=none; b=J/BjUAqXdq3DMbgJ9k54gPsA7+2CAll911dVK0ZUe6LFRsgkyGy5lf5cTIPXBUna1I1zecdvrL9nNq5iRh6ud991LR51U/VP2AreHce2AJ3FIg1egKJxvGHkWRIjSqZQ6BMr3D9pn7Yv4usGFAoORloW+bsnjUqSag1RwKlsFus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725195467; c=relaxed/simple;
	bh=A5jhs4fIzndHlrylLiQjrtYZdjdq8w23e4az9IZbTi0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kqZMv7H9h1isX1vUTo1jo0sCazcXRyV+ZB6HC3KV/b26nkd8gPEaCetHSPIXxauo9uMizZvhecECvQIZba9BFYgc2k/Fo9IS2GI9PUUmqwXaw1+ADQTNigXgZxnDpkceFy1CTnBZlx7JeILrN37xXPYOy2NfXJk8GyHhuQ6QtO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGaB6KSc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGaB6KSc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725195465; x=1756731465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=A5jhs4fIzndHlrylLiQjrtYZdjdq8w23e4az9IZbTi0=;
  b=UGaB6KScMWOx3tiXBnRVDXcOBJeotnw3brrosIKBma4L63w3DdadKztG
   JXqVIUZgqQtYeVWmll/b5cW1O4x9ZQqxikoh//Ar9HhpDgLndH+IPSS3f
   bLuxyTIW+w/4ArPgAkBGVEoB8TS2jdAkJxEzjms6EQN384cNT1oejAodq
   mFA9wDOR5siC7nGML1fv0QdZugmPsFCdCwg0laY+p/t1AuXhFTRxFm6vi
   AR20H/sV6VLP7cYOT0mn21yt77w2OZHff7fOSnWqcNr+LIycfqagDoVIG
   +YHP77bfYotYLsbdLV6ohh/ACKl5CVJJ0qJEXx7+p2yWxaWuXeAe/w0hH
   g==;
X-CSE-ConnectionGUID: qdHOlw/XRIScGBAYXDmZjw==
X-CSE-MsgGUID: 1wS29MP0SMeRSKRYu+yIvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="35185847"
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="35185847"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 05:57:45 -0700
X-CSE-ConnectionGUID: KaC1tJ+dTh6EueqfJg9l9g==
X-CSE-MsgGUID: 2uFf5McqQ0GrrDja8ESwkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,194,1719903600"; 
   d="scan'208";a="64842778"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 Sep 2024 05:57:44 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skk9F-0003f4-2O;
	Sun, 01 Sep 2024 12:57:41 +0000
Date: Sun, 1 Sep 2024 20:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] selftests: vDSO: Do not rely on $ARCH for
 vdso_test_getrandom && vdso_test_chacha
Message-ID: <202409012034.hcMbZCrE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <ddf594c81787dba708fc392cb03027470dee64fb.1725124064.git.christophe.leroy@csgroup.eu>
References: <ddf594c81787dba708fc392cb03027470dee64fb.1725124064.git.christophe.leroy@csgroup.eu>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: "Jason A . Donenfeld" <Jason@zx2c4.com>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Adhemerval Zanella <adhemerval.zanella@linaro.org>
CC: Xi Ruoyao <xry111@xry111.site>

Hi Christophe,

kernel test robot noticed the following build errors:

[auto build test ERROR on crng-random/master]
[cannot apply to shuah-kselftest/next shuah-kselftest/fixes linus/master v6.11-rc6 next-20240830]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Christophe-Leroy/selftests-vDSO-Do-not-rely-on-ARCH-for-vdso_test_getrandom-vdso_test_chacha/20240901-011346
base:   https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git master
patch link:    https://lore.kernel.org/r/ddf594c81787dba708fc392cb03027470dee64fb.1725124064.git.christophe.leroy%40csgroup.eu
patch subject: [PATCH] selftests: vDSO: Do not rely on $ARCH for vdso_test_getrandom && vdso_test_chacha
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409012034.hcMbZCrE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409012034.hcMbZCrE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from vdso_test_chacha-asm.S:5:
>> ./../../../../arch/x86/entry/vdso/vgetrandom-chacha.S:7:10: fatal error: 'asm/frame.h' file not found
       7 | #include <asm/frame.h>
         |          ^~~~~~~~~~~~~
   1 error generated.


vim +7 tools/testing/selftests/vDSO/./../../../../arch/x86/entry/vdso/vgetrandom-chacha.S

33385150ac456f6 Jason A. Donenfeld 2022-11-18 @7  #include <asm/frame.h>
33385150ac456f6 Jason A. Donenfeld 2022-11-18  8  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
