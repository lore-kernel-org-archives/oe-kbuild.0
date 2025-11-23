Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165E33EC
	for <oe-kbuild@lists.linux.dev>; Sun, 23 Nov 2025 00:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763857219; cv=none; b=bAg89E32G1B5FLRD96yyHpc9hjNHXuSjpVceD91Noxj1f1kAlzs84wo+luon7zZNtOcQ66Cs8mR2GO/F+5NDT6RvNtwfL81q0GCr6viVnQR2tJGtXFK2BXdgjbV5pti9MqNcv6gOol3NlCoaxjAAU+dP2lSXg+7uh899pWo4TbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763857219; c=relaxed/simple;
	bh=Mr+OW0KCvZQCh0i50O8BpgEof7KM2puNAjdxZ2m6/+M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=prk13Ej4zeLkxYOq0DVXYEDegJxQedi9TrwAecTGxKavXN48l0kWrPTBzW/TL347OtHFzaZUq+29AfoAcbXzrrSidxQW//iauiBalSBvuDKp7+aO/VfA5Gd1/huyGiBQdssdWaeEQGYPq/3LtrEXjI2L0LwSxbzWjmeYChgNyj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7NL0RcT; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7NL0RcT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763857217; x=1795393217;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mr+OW0KCvZQCh0i50O8BpgEof7KM2puNAjdxZ2m6/+M=;
  b=N7NL0RcTeaIRWmbbuZ2uH1buGL15aLZBByh2iI8l3BWfpROIykMzz3NJ
   tXOOp4F5cFSwy2D2e1da/gcNDdXjO/MNzWq9KGcqESdPb5qKXOu5Q/Ucq
   ocv2WcdBfv3s/rHE3Ln7r9qd76yXB35DfJhvmfBy6gEXmCb2hc4d/I6rA
   ndiWKSSwV8gaB3u5XKj8SQpLjg6KZjqpfSYvc7XVmWWPfU4sUJTjq6CGU
   oZlvTt8+DRI+g2Xe9mQBS4GaWKPZs74lmLyga4mWQcwFtTiZbp2T1Cv4g
   fLHWGzCCzWehwEJNULfrr7IQ+V5G2KBXKQCz65HgeMd5dIgppyYJrudEv
   Q==;
X-CSE-ConnectionGUID: SA8ofbZZRjKyXzywggev+Q==
X-CSE-MsgGUID: 3K121c0ST4K0uvexpiOxhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69771978"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="69771978"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 16:20:16 -0800
X-CSE-ConnectionGUID: 7hJiy3IkS2WWmMDseyRr6g==
X-CSE-MsgGUID: jP4V0n61R5Oymd3x9DRGgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="191185624"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2025 16:20:15 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMxps-0007vT-2w;
	Sun, 23 Nov 2025 00:20:12 +0000
Date: Sun, 23 Nov 2025 08:19:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] lib/crypto: blake2b: Limit frame size workaround to GCC
 < 12.2 on i386
Message-ID: <202511230820.9CzhKlk6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251122105530.441350-2-thorsten.blum@linux.dev>
References: <20251122105530.441350-2-thorsten.blum@linux.dev>
TO: Thorsten Blum <thorsten.blum@linux.dev>
TO: Eric Biggers <ebiggers@kernel.org>
TO: "Jason A. Donenfeld" <Jason@zx2c4.com>
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Thorsten Blum <thorsten.blum@linux.dev>
CC: linux-crypto@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Thorsten,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ebiggers/libcrypto-next]
[also build test WARNING on next-20251121]
[cannot apply to ebiggers/libcrypto-fixes crng-random/master linus/master v6.18-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thorsten-Blum/lib-crypto-blake2b-Limit-frame-size-workaround-to-GCC-12-2-on-i386/20251122-185851
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git libcrypto-next
patch link:    https://lore.kernel.org/r/20251122105530.441350-2-thorsten.blum%40linux.dev
patch subject: [PATCH] lib/crypto: blake2b: Limit frame size workaround to GCC < 12.2 on i386
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20251123/202511230820.9CzhKlk6-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230820.9CzhKlk6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511230820.9CzhKlk6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/crypto/blake2b.c: In function 'blake2b_compress_generic':
>> lib/crypto/blake2b.c:108:1: warning: the frame size of 3440 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     108 | }
         | ^


vim +108 lib/crypto/blake2b.c

23a16c9533ed92 Eric Biggers 2025-10-17  101  
23a16c9533ed92 Eric Biggers 2025-10-17  102  		for (i = 0; i < 8; ++i)
23a16c9533ed92 Eric Biggers 2025-10-17  103  			ctx->h[i] ^= v[i] ^ v[i + 8];
23a16c9533ed92 Eric Biggers 2025-10-17  104  
23a16c9533ed92 Eric Biggers 2025-10-17  105  		data += BLAKE2B_BLOCK_SIZE;
23a16c9533ed92 Eric Biggers 2025-10-17  106  		--nblocks;
23a16c9533ed92 Eric Biggers 2025-10-17  107  	}
23a16c9533ed92 Eric Biggers 2025-10-17 @108  }
23a16c9533ed92 Eric Biggers 2025-10-17  109  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
