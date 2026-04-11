Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700191B4F1F
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 11:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775906305; cv=none; b=sP+nwHwE8nOvhiKCRB4sHGhMjgp2l3/+hb1RObi/IM1QG4ULDlnrmfS4nv7KQKqXmxkFJFzo9Sim6ZePeCqxHdV0F1WAX1MiUzo2kt010+yVFDR7BOzeVD7E08yDXQgx966VShP/S0SDDZ/5JIb0E0ZZ5cTtzDQj5NrKXwUOjNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775906305; c=relaxed/simple;
	bh=6glwjRjE95MLkfx9svsEpXrdfOnItf0RsuO7eA4c1ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WGbbB55ddVqlKY0jzyh0LYOI+ggf2h/vjEFR8GvLF4mgXJ2YAwRzIKEfyy4nuBbyJUoBxEqELW2I/mQsRDKG2uDxRDPe8zSYelLbiGzt7tL37wiKTocRYuW8SlEvrY29kFl5hdAhGabfcwDrz9AGaGf4ok0cG5LFSxcWjjcryxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B+/nADjs; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B+/nADjs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775906304; x=1807442304;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6glwjRjE95MLkfx9svsEpXrdfOnItf0RsuO7eA4c1ds=;
  b=B+/nADjsLK1cXvTployMaIUKFmBe7rzl9kowTs4O21LCp3V9qewzby3V
   KcoUTanBT0R8jA+DaJHYdaa/cD2DYkPfvaKab0vJ8Rm24e41heql6ShgB
   8avKthZGVGzHxaR1UB5x+LS/j55Hoj2Oz2dL3Qi/seGujX80DlJq7b5OP
   gLeXyKfV/IAP1Ma0HbEkx9Ax2qIt+Ef03RjsFTj28LehWwDhx9tcD87o6
   V+nrH+rq3RkRbOgYqrlxBTwNNIH6MJnGI+xgaTA6DjHvFR0ftLl0quhVB
   za6HIsR1ysq7LPL9S4i1LPnT1fNMz33MSU00eOtVV3FvasBdN3qKHhifB
   w==;
X-CSE-ConnectionGUID: bTn4jDX+TM2GQuKQCZ8low==
X-CSE-MsgGUID: t1FlUn76QVSnfQ+wwqyzOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="87203757"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="87203757"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 04:18:23 -0700
X-CSE-ConnectionGUID: u6MeRAzMS9WBeCiJ8eckzQ==
X-CSE-MsgGUID: In1O2p26Qs+l9p+lHr3sPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="224602046"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Apr 2026 04:18:22 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBWLz-0000000016P-2Mbj;
	Sat, 11 Apr 2026 11:18:19 +0000
Date: Sat, 11 Apr 2026 19:17:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] gcov: use atomic counter updates to fix concurrent
 access crashes
Message-ID: <202604111946.Erd3tguU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260402141831.1437357-2-khorenko@virtuozzo.com>
References: <20260402141831.1437357-2-khorenko@virtuozzo.com>
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
TO: Peter Oberparleiter <oberpar@linux.ibm.com>
TO: Mikhail Zaslonko <zaslonko@linux.ibm.com>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nicolas Schier <nsc@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: "Thomas Weiﬂschuh" <linux@weissschuh.net>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Steffen Klassert <steffen.klassert@secunet.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: linux-kbuild@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: netdev@vger.kernel.org
CC: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
CC: Vasileios Almpanis <vasileios.almpanis@virtuozzo.com>
CC: Jakub Kicinski <kuba@kernel.org>

Hi Konstantin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on soc/for-next]
[also build test WARNING on linus/master v7.0-rc7 next-20260410]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Konstantin-Khorenko/gcov-use-atomic-counter-updates-to-fix-concurrent-access-crashes/20260411-133428
base:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git for-next
patch link:    https://lore.kernel.org/r/20260402141831.1437357-2-khorenko%40virtuozzo.com
patch subject: [PATCH] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260411/202604111946.Erd3tguU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111946.Erd3tguU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604111946.Erd3tguU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> io_uring/io_uring.c:3224:1: warning: target does not support atomic profile update, single mode is selected
    3224 | __initcall(io_uring_init);
         | ^~~~~~~~~~
--
>> io_uring/opdef.c:890:1: warning: target does not support atomic profile update, single mode is selected
     890 | }
         | ^
--
>> io_uring/kbuf.c:740:1: warning: target does not support atomic profile update, single mode is selected
     740 | }
         | ^
--
>> io_uring/rsrc.c:1555:1: warning: target does not support atomic profile update, single mode is selected
    1555 | }
         | ^
--
>> io_uring/notif.c:141:1: warning: target does not support atomic profile update, single mode is selected
     141 | }
         | ^
--
>> io_uring/tctx.c:388:1: warning: target does not support atomic profile update, single mode is selected
     388 | }
         | ^
--
>> io_uring/filetable.c:158:1: warning: target does not support atomic profile update, single mode is selected
     158 | }
         | ^
--
>> io_uring/rw.c:1397:1: warning: target does not support atomic profile update, single mode is selected
    1397 | }
         | ^
--
>> io_uring/poll.c:963:1: warning: target does not support atomic profile update, single mode is selected
     963 | }
         | ^
--
>> io_uring/tw.c:355:1: warning: target does not support atomic profile update, single mode is selected
     355 | }
         | ^
--
>> io_uring/wait.c:308:1: warning: target does not support atomic profile update, single mode is selected
     308 | }
         | ^
..


vim +3224 io_uring/io_uring.c

76d3ccecfa186a io_uring/io_uring.c Matteo Rizzo 2023-08-21  3221  
2b188cc1bb857a fs/io_uring.c       Jens Axboe   2019-01-07  3222  	return 0;
2b188cc1bb857a fs/io_uring.c       Jens Axboe   2019-01-07  3223  };
2b188cc1bb857a fs/io_uring.c       Jens Axboe   2019-01-07 @3224  __initcall(io_uring_init);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
