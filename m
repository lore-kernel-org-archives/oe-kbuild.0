Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80CE28643C
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770450219; cv=none; b=FXOj7hLNCpWnpUQQ9cbB36C7VkTaZocmexAWAI9bfefR4ETvDHlLKIosG5qmGSPH0Q16ubmO9YRnEzbq57cKRk1cX8fgpCiPk+3g6UDaSQUg6ct1gTWeZZ2Ze2rPDY/c2SQ/pg2j0NLBShz99pckDVG6SpnsE+6R5bwlRtm1wF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770450219; c=relaxed/simple;
	bh=vMvy3Lgt7bexFUfPV0pVb7mJFTICQt9FOI65DIEFtF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=NIL+g+EQXJjx3nJ8P9wNU2/A3WOhrMaz3xzpNKtDZ4jHrHr+6tWJUY37Gu+16Lhz04d+spglMAMd4NxsZQa93Bge0IcZ6kXc/KwxfviPdkUK/vkEvrcjMn14BRdUnMF4MU1xND5C54/CcEQjY1xys/kY1DVzWpUfUHt06g00hGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jPFzIQMH; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jPFzIQMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770450218; x=1801986218;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=vMvy3Lgt7bexFUfPV0pVb7mJFTICQt9FOI65DIEFtF4=;
  b=jPFzIQMH9XviQz1pHheIvyXtxJAwb/qnkM4iyX6gFILBiUpXuC5sA5me
   90FgJRvdWde1D4UWaq/Hx6zomFM/w8gcyzKNr/TNu0boFYxGUbkynouTC
   id5U6j2tGjC+pzOyogyV72YMC1AbLoJYoJgD7XyCjXX0q+fNpwm0E/JSn
   DhCBCltIHDkrjg6UtuafAxN6msPaDQU4TXCwu1pIoTAGn4b3L2kR6WyFI
   plfacEkyg6+NOppWzrJkqWiHQBamkGVGNlQE3Z600mFkdak3tvE/O61rN
   mQoKAGExDSrv5VJeszfRboxAIem9tQtsHUc/ryJT9/V6jL/z8InxCPvNX
   g==;
X-CSE-ConnectionGUID: opfzaQLwQD6bZhwCSV90Mg==
X-CSE-MsgGUID: btFwALhgRlua/SkNiUmFUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71712823"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71712823"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 23:43:37 -0800
X-CSE-ConnectionGUID: ozVMyoqHS1C5Eo/7QAyEJg==
X-CSE-MsgGUID: AqeHUFd/SYK7JQzgKqBNkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="216057906"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 23:43:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vocyb-00000000lUm-2eFJ;
	Sat, 07 Feb 2026 07:43:33 +0000
Date: Sat, 07 Feb 2026 15:43:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [thomas-weissschuh:b4/kbuild-uapi-libc 8/11]
 ./usr/include/asm/sigcontext.h:32:13: error: expected parameter declarator
Message-ID: <202602071507.QKmwioZr-lkp@intel.com>
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
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: "Thomas Wei=C3=9Fschuh" <linux@weissschuh.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/l=
inux.git b4/kbuild-uapi-libc
head:   9f2ce252d5f1b625e013269265f25f86540cbdf3
commit: 6b07258ca2b6698cc22a5332c65e141c4972e586 [8/11] kbuild: uapi: use c=
ustom stub headers instead of libc ones
:::::: branch date: 35 hours ago
:::::: commit date: 35 hours ago
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20260=
207/202602071507.QKmwioZr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260207/202602071507.QKmwioZr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602071507.QKmwioZr-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/asm/sigcontext.h:32:13: error: expected parameter declarat=
or
      32 | } __aligned(8);
         |             ^
>> ./usr/include/asm/sigcontext.h:32:13: error: expected ')'
   ./usr/include/asm/sigcontext.h:32:12: note: to match this '('
      32 | } __aligned(8);
         |            ^
>> ./usr/include/asm/sigcontext.h:32:12: error: a function declaration with=
out a prototype is deprecated in all versions of C [-Werror,-Wstrict-protot=
ypes]
      32 | } __aligned(8);
         |            ^=20
         |              void
   3 errors generated.

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
