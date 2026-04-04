Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD93935C1B0
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Apr 2026 06:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775283055; cv=none; b=FPC4p44WdKlKsRUgX4VgViKl+Dr2mOaUO06bNl9yWhRxe7qiGGV5t+a15QWVLrQrYXP/hfdlwGDJBif8h/8wqGbA2iAiMWiS/xmhFU7Trn/z2lTezHV/hkpcOCmhhaJf/EEfmD+g6ngM36jrf0r+axLRoQlnZ5Vo/1ZdYm+Krz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775283055; c=relaxed/simple;
	bh=bTWcAZmnjOZpOOU9+1Ckkn1jhDMdfUZA7vPameTkYLU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PVNjp512w5Cizde+hluO6dRg6uDNzffdbugj/Wg7qZod7j+YpyfMHJM6wEmZ5ppEOOhII5PrCgroysLZr7PJoNQLz9oIu/I83IXC4JWpGVNSdLcXpoCLWoZWYlXN/TIuizUVSOtzJn+AGXEQG4Hf8JsMybcxOp9kp0SbEAmsWMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhD5H4Vh; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhD5H4Vh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775283053; x=1806819053;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bTWcAZmnjOZpOOU9+1Ckkn1jhDMdfUZA7vPameTkYLU=;
  b=BhD5H4VhV2QI3rxoyA6CQIZ8uIFyAaEbaVcI2NdeGOYnPJKbT9TXjvP0
   6HHmwA6cEQZwPgr5IuovjL9lQATz39H46zDXL5ilUps4tmLVMt2aQLiVj
   2Lkuy9PvuJWjZD7Spsgm5fG6wdEuuQ26O7SGvNu1hV5oWufQLelCQwfXx
   J2kEC79phkVELG/dyuvb2tawPQlKwbT9/xjQ4xMxPDc0btSrpM38M+wHz
   dAFPKiRAXt9HJOKfhdgLLMUaWL8+2V6RjZcnWzX+T4F3DqmmCgYAty3VP
   dJE3iv4mg8Wmt4Nx9hwXakaVAxqUCQPfQZjHcJYoVP+QH2jVKXoD6lWA7
   g==;
X-CSE-ConnectionGUID: G68Jt9hRQLa8mV6GTBZc+g==
X-CSE-MsgGUID: 3GY6c2VMR/e/sHabNM4sSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11748"; a="76524634"
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="76524634"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 23:10:52 -0700
X-CSE-ConnectionGUID: L1LqNkQfRPy6oCbZnKjcPw==
X-CSE-MsgGUID: tZRMgKCXQ2uDmF2ThO1LhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,159,1770624000"; 
   d="scan'208";a="250653066"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 03 Apr 2026 23:10:51 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8uDZ-000000009Y1-0GiM;
	Sat, 04 Apr 2026 06:10:49 +0000
Date: Sat, 04 Apr 2026 08:10:46 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9150/12133]
 /usr/s390x-linux-gnu/include/asm/sigcontext.h:73:9: error: unknown type name
 '__vector128'
Message-ID: <202604040819.Q90Gla3S-lkp@intel.com>
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
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   2febe6e6ee6e34c7754eff3c4d81aa7b0dcb7979
commit: 9b93f7e3277490f0356309c9b241eeeaa27ba859 [9150/12133] tools/getdela=
ys: use the static UAPI headers from tools/include/uapi
:::::: branch date: 15 hours ago
:::::: commit date: 7 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260=
404/202604040819.Q90Gla3S-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260404/202604040819.Q90Gla3S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604040819.Q90Gla3S-lkp@intel.com/

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
