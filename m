Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FA331ED6C
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 18:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769020977; cv=none; b=EvTi9VvPs6lLOzwyZ4mNwnusIfvtI+zn16qVbQk/wHmJNX72uUsot6RFIWx57V1ZSIuFzSakrO3Q++Ll7jFFgzS5SzLs8hDlgO8hyPiwevPD0VDoimuf+buTCxuFowpF8DhuGw20MWfq2MbdK/73qgiA6PaAHLdKFvmttcPP2wM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769020977; c=relaxed/simple;
	bh=RCgcgvlRDNITFS3haiPwoegsowlBrZit/Xp22jVYkgM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s9NikQhjjPfIFBlRsKLmEZElkM85mFGNJ5AiR5e7mA7PIYAQdgx/OzMAW52+/rVeQiTN5j+O5ASJignjWH84kF2Wk2P6pdPI5gblbEo1Bewg8h/G+fgBk5rePCS2fsxyWsIAEjh/A09kJg9ZK3QqFezS8/QFKmqeORj7/0PTSRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BJmjI0X6; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BJmjI0X6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769020976; x=1800556976;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RCgcgvlRDNITFS3haiPwoegsowlBrZit/Xp22jVYkgM=;
  b=BJmjI0X65CmioJk8Bngb/BUVLbaDcLKUcxB8xUU0iva+G5BvNNslm2db
   lqM11dPsffTg5yXhxJuHV2z+ezEyoMH3hgTqOENprdTsm+CvttZIixn57
   rEZuv0E2oav5RM/Yd9DC5BJqXcFZZyNeAHuQi6SaqOcXS1x8B8mE4pSns
   NBjQlmSqpeTZtCtE6CcvuZXVp3XfvdImwZrURZWN2d0XuqN1payiXtBP3
   QO+l1Ts4VEfHKMgfHfNcFxI+39pav9rmG8SRv/DUL4IMfgnnJqSv7hwSg
   ZoL3Z0ulx7LHeZCzEAvw7BKH+CB4xRVOSSvMFF8rB5bUowZJ4ETlzYBRB
   g==;
X-CSE-ConnectionGUID: wKU6x95BRAKwDN7YFFhEbw==
X-CSE-MsgGUID: Uv9U0bB2SbuZ/Zd/rPyg6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="72846877"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="72846877"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 10:42:55 -0800
X-CSE-ConnectionGUID: CmUDGGagTbCycYfK2N4xDA==
X-CSE-MsgGUID: UxPwckxORkGa4OrG+O/j7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; 
   d="scan'208";a="206768151"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Jan 2026 10:42:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vidAK-00000000RZb-0sjh;
	Wed, 21 Jan 2026 18:42:52 +0000
Date: Thu, 22 Jan 2026 02:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf-next v5 2/7] crypto: Add BPF hash algorithm type
 registration module
Message-ID: <202601220157.xo80r7ZB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/bpf_crypto_shash.c:95:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260120184701.23082-3-git@danielhodges.dev>
References: <20260120184701.23082-3-git@danielhodges.dev>
TO: Daniel Hodges <git@danielhodges.dev>
TO: bpf@vger.kernel.org
CC: Alexei Starovoitov <ast@kernel.org>
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Daniel Borkmann <daniel@iogearbox.net>
CC: Vadim Fedorenko <vadim.fedorenko@linux.dev>
CC: Song Liu <song@kernel.org>
CC: Mykyta Yatsenko <yatsenko@meta.com>
CC: Martin KaFai Lau <martin.lau@linux.dev>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Hao Luo <haoluo@google.com>
CC: Jiri Olsa <jolsa@kernel.org>
CC: John Fastabend <john.fastabend@gmail.com>
CC: KP Singh <kpsingh@kernel.org>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: "David S . Miller" <davem@davemloft.net>
CC: linux-crypto@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Daniel Hodges <git@danielhodges.dev>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Hodges/bpf-Extend-bpf_crypto_type-with-hash-operations/20260121-034255
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260120184701.23082-3-git%40danielhodges.dev
patch subject: [PATCH bpf-next v5 2/7] crypto: Add BPF hash algorithm type registration module
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: powerpc64-randconfig-r132-20260121 (https://download.01.org/0day-ci/archive/20260122/202601220157.xo80r7ZB-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601220157.xo80r7ZB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601220157.xo80r7ZB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/bpf_crypto_shash.c:95:1: sparse: sparse: bad integer constant expression
   crypto/bpf_crypto_shash.c:95:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> crypto/bpf_crypto_shash.c:95:1: sparse: sparse: bad integer constant expression
   crypto/bpf_crypto_shash.c:95:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   crypto/bpf_crypto_shash.c:96:1: sparse: sparse: bad integer constant expression
   crypto/bpf_crypto_shash.c:96:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +95 crypto/bpf_crypto_shash.c

f9aa284e7f59b4 Daniel Hodges 2026-01-20  92  
f9aa284e7f59b4 Daniel Hodges 2026-01-20  93  module_init(bpf_crypto_shash_init);
f9aa284e7f59b4 Daniel Hodges 2026-01-20  94  module_exit(bpf_crypto_shash_exit);
f9aa284e7f59b4 Daniel Hodges 2026-01-20 @95  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
