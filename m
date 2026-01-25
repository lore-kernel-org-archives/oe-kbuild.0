Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BD6171C9
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 08:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769331118; cv=none; b=mZyx774RBOLnqoLnSdfwavbGnkdUjnMii7nXa50KvHl1efUF+d9ptGHLkqBs1HRRXwN4Uso6HiixT+Iu+aoDc3ycnyAjdnscHv/YMreLSyjIpR6VmUmByVXmtJmeS/2x02qso38EQXECAsqxlRWHZJB5cXbdS6kiOsZDy4jbOzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769331118; c=relaxed/simple;
	bh=rO3QExkFE1OZa2FvHJK2c/nlyxQFOhrWzjJfd4SonH0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pxk9XoQ7fc0zbbcOQVPRqmwZRKcT3ENx/qqiBxnMVxdDMEtthjdubvdcTRIVhGmcTaeJ9bLmV1ZcZ9a1N5JPECkn6mLv5juj52Jw6c+qaEm7yuYNHQtVS/OA/D9PxXj/2NQ9jqvZUPDYWFSqtW3eZzx2HA+sV6BPy5ujIxfqS24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMJPz8fL; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMJPz8fL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769331117; x=1800867117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rO3QExkFE1OZa2FvHJK2c/nlyxQFOhrWzjJfd4SonH0=;
  b=IMJPz8fLERkuQFYHlOjofrJjzCp99nWifX4AAwQVgCBUEgIRjzEDotQ5
   QVn82hGd1u+AH7T2Rp/awQCxzxhxGRHZ9dO6H6gZbXflG+rCAhJCnEeWb
   80QD6XESK9SmpwvYJL7DR5enkxmLVxQtixexpeZZ5ErCBIfvgBPF62waT
   OEMkX/iGdXhIq1kQC3vbylMD1INct1hwdzQnLhjZIPOB+BrFmS1bDUHx9
   lqNyvADItz6g/hpZ4AyDCqiioRO+cSrZ5mflYHH3b3bscH7W6zsD/yKRJ
   jyRfMS+WW5NkZD/jxxaCyXDqxVAKBJ7tXBchqNJim0wtTBPYVsks9fbxp
   A==;
X-CSE-ConnectionGUID: h6pZEJy0RTmHgc9Fm69O2g==
X-CSE-MsgGUID: VBut9cwkQi2vPqzE/mziZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="70247909"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="70247909"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 00:51:55 -0800
X-CSE-ConnectionGUID: 2ufz/fn+TRyhyt+I5DwoPQ==
X-CSE-MsgGUID: 2/kUiLMzTOejzMNg8Z5gdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="211879284"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jan 2026 00:51:54 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjvqa-00000000Vt0-0G57;
	Sun, 25 Jan 2026 08:51:52 +0000
Date: Sun, 25 Jan 2026 16:51:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH bpf-next v6 3/4] bpf: Add signature verification kfuncs
Message-ID: <202601251601.ChPv1VSq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: crypto/bpf_crypto_sig.c:88:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260124174349.16861-4-git@danielhodges.dev>
References: <20260124174349.16861-4-git@danielhodges.dev>
TO: Daniel Hodges <git@danielhodges.dev>
TO: bpf@vger.kernel.org
CC: ast@kernel.org
CC: andrii@kernel.org
CC: daniel@iogearbox.net
CC: vadim.fedorenko@linux.dev
CC: song@kernel.org
CC: yatsenko@meta.com
CC: martin.lau@linux.dev
CC: eddyz87@gmail.com
CC: haoluo@google.com
CC: jolsa@kernel.org
CC: john.fastabend@gmail.com
CC: kpsingh@kernel.org
CC: sdf@fomichev.me
CC: yonghong.song@linux.dev
CC: herbert@gondor.apana.org.au
CC: davem@davemloft.net
CC: linux-crypto@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Daniel Hodges <git@danielhodges.dev>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Hodges/bpf-Add-hash-kfunc-for-cryptographic-hashing/20260125-015004
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20260124174349.16861-4-git%40danielhodges.dev
patch subject: [PATCH bpf-next v6 3/4] bpf: Add signature verification kfuncs
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: m68k-randconfig-r131-20260125 (https://download.01.org/0day-ci/archive/20260125/202601251601.ChPv1VSq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251601.ChPv1VSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601251601.ChPv1VSq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> crypto/bpf_crypto_sig.c:88:1: sparse: sparse: bad integer constant expression
   crypto/bpf_crypto_sig.c:88:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
>> crypto/bpf_crypto_sig.c:88:1: sparse: sparse: bad integer constant expression
   crypto/bpf_crypto_sig.c:88:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"
   crypto/bpf_crypto_sig.c:89:1: sparse: sparse: bad integer constant expression
   crypto/bpf_crypto_sig.c:89:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"

vim +88 crypto/bpf_crypto_sig.c

0363f73e3051ae8 Daniel Hodges 2026-01-24  85  
0363f73e3051ae8 Daniel Hodges 2026-01-24  86  module_init(bpf_crypto_sig_init);
0363f73e3051ae8 Daniel Hodges 2026-01-24  87  module_exit(bpf_crypto_sig_exit);
0363f73e3051ae8 Daniel Hodges 2026-01-24 @88  MODULE_LICENSE("GPL");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
