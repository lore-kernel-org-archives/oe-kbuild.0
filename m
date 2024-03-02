Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB043E46D
	for <oe-kbuild@lists.linux.dev>; Sat,  2 Mar 2024 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709409121; cv=none; b=bu6urG4Bioh04qdDSZxo9ah8J0o/c61xRF7oGm9Z8Iif/4ocnNOoTjBoB5DP/8altNWhpMIpjPMDpt8FVYUwiq4OkdB6Ig0t6FLAiTTRZDiGVmNSAZ98fmK2BRDpCfLoBE9NDkz4bH+WdaYdewNXMcA4jXWpYDx+PJo4Y6tnDCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709409121; c=relaxed/simple;
	bh=bNccwwJJ4cmdzi8TZQxjAryqrrPW0bMO9+vu12kWAu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EFTmw1chMsrLF8sCi6PE//L46w/D7r/WJS9gbhtdOXeFnE4AURmIKJSv8TIvxos14jlYKAjowg6CvsuBiyQ7oG/R421b+Yjf6gFLFAcHB8GOq6TVXonQd7OUUaYaHCzDFognLJz11TcXCq7LnZ+gXs89nR9HGIzIMysd1HYD8yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ov+bWcc5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ov+bWcc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709409119; x=1740945119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bNccwwJJ4cmdzi8TZQxjAryqrrPW0bMO9+vu12kWAu4=;
  b=Ov+bWcc5XGNUqDTwQ+M2c/YkeZ+9JgDDcGrQyeEtv79fhUdQ6x2IYNbY
   OdHJBhv7E0opCKCLoVbaAiuFhvDtyjWI/dpvfKjidxls4lwVAB0GR3V4e
   pIDQ7ONGCcePz4lH2DdCtToejOEsZ/YOWRvRLb4aPnoVu/di+BFypQrLr
   4HnHPQVWMdCFIDwWX+lqS/7EC3yvYiG6h/NbxP0H4aOqZhGJsOk5OFIfa
   lD0c+4o25jjdWhjaeHDYwgz3fOroiAU1tnQrmn+duPDzGtLuk31C17RdR
   L/2tDIoAxxgTIq6O6K5mFIgyY+Fn4PnkXSZdYOZoBn1evC5kVlTP8fBBi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="14583714"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="14583714"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 11:51:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="8488016"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Mar 2024 11:51:58 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgVOl-0000G6-1L;
	Sat, 02 Mar 2024 19:51:55 +0000
Date: Sun, 3 Mar 2024 03:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [zen:6.7/zen-sauce 8/31] arch/x86/include/asm/string_32.h:150:25:
 warning: '__builtin_memcpy' forming offset [21, 56] is out of the bounds [0,
 20] of object 'para' with type 'struct virtio_crypto_akcipher_session_para'
Message-ID: <202403030354.0JmmpenE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: steven@liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 6.7/zen-sauce
head:   01ffb5c93fff64050b2eda359d20f812f62c91c3
commit: 47715d438aa7c28ae732ab8cce27b832e93b6b51 [8/31] ZEN: Disable stack conservation for GCC
:::::: branch date: 8 weeks ago
:::::: commit date: 8 weeks ago
config: i386-buildonly-randconfig-002-20240302 (https://download.01.org/0day-ci/archive/20240303/202403030354.0JmmpenE-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403030354.0JmmpenE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202403030354.0JmmpenE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:21:
   drivers/crypto/virtio/virtio_crypto_common.h: In function 'virtio_crypto_get_current_node':
   drivers/crypto/virtio/virtio_crypto_common.h:135:6: warning: variable 'cpu' set but not used [-Wunused-but-set-variable]
     135 |  int cpu, node;
         |      ^~~
   In file included from arch/x86/include/asm/string.h:3,
                    from include/linux/string.h:61,
                    from arch/x86/include/asm/page_32.h:18,
                    from arch/x86/include/asm/page.h:14,
                    from arch/x86/include/asm/thread_info.h:12,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from include/crypto/aead.h:13,
                    from include/crypto/engine.h:10,
                    from drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:10:
   In function 'virtio_crypto_alg_akcipher_init_session',
       inlined from 'virtio_crypto_rsa_set_key' at drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:425:9:
>> arch/x86/include/asm/string_32.h:150:25: warning: '__builtin_memcpy' forming offset [21, 56] is out of the bounds [0, 20] of object 'para' with type 'struct virtio_crypto_akcipher_session_para' [-Warray-bounds]
     150 | #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:131:2: note: in expansion of macro 'memcpy'
     131 |  memcpy(&ctrl->u, para, sizeof(ctrl->u));
         |  ^~~~~~
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c: In function 'virtio_crypto_rsa_set_key':
   drivers/crypto/virtio/virtio_crypto_akcipher_algs.c:375:45: note: 'para' declared here
     375 |  struct virtio_crypto_akcipher_session_para para;
         |                                             ^~~~


vim +150 arch/x86/include/asm/string_32.h

^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  149  
ff60fab71bb3b4 arch/x86/include/asm/string_32.h Arjan van de Ven 2009-09-28 @150  #define memcpy(t, f, n) __builtin_memcpy(t, f, n)
^1da177e4c3f41 include/asm-i386/string.h        Linus Torvalds   2005-04-16  151  

:::::: The code at line 150 was first introduced by commit
:::::: ff60fab71bb3b4fdbf8caf57ff3739ffd0887396 x86: Use __builtin_memset and __builtin_memcpy for memset/memcpy

:::::: TO: Arjan van de Ven <arjan@infradead.org>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
