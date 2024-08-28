Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887403AC2B
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Aug 2024 20:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724875352; cv=none; b=hEuNtiNUiDPhs0YKASGfRIe6uEcelm/RPl4u0zv7EMKWZbi8Gb6mMPi16rmOA8OOCZq6PBpaTJNhR4NJNIwE8nPsulCI+L+3AaWsXc4eJ2xUJ3fTfSdLnWKcJuHa8/JBtHQU5QVVYzFrKRNgW70C3feWYPuo6tEzN995lRWiZUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724875352; c=relaxed/simple;
	bh=127jnK62n9wlI1eRPmBsXIzGyEAcWtKYA1p4NDMqVgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Iy3UV7lH2cQyTkF3YZqy9jxG22ZI4xulLAoRy6eYtz1NCwJ2xGrlKX0LeJXpTyRiWqKO8GEgCdATzzofreRQsxy8vED1eiEr/D2GQvv4/9PlIB2RGpxgZia8No7hp4BEWxwvT+K8J964/B1ksgTjewNxX6i9o2uY3RY95zETEIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GKHohPAq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GKHohPAq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724875351; x=1756411351;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=127jnK62n9wlI1eRPmBsXIzGyEAcWtKYA1p4NDMqVgE=;
  b=GKHohPAqtrUCtlPhtJm7QcdQaHQ3F0/r//q0E4jBvDrAChdhhZMKh08N
   lNzk9TzXNcF32KajjKiCGGmxceypG2oyt5ZDtaipfnV4ciQPflein3OIq
   zQPtthDDFVNeacfSNYXcg/xeS3lMp/veRREs1goNUzaKbpCEhNO+5fiGK
   n9JdPt58gSu0WmX6LqyZNmsf28KH6wMhu4IsB3CkNa5R7FHbqYbdqaRAt
   fUNmPktEnoDSgScnL0SvvtAt9c2T+gH1Mt12TprpTNyJsTm6O+fZFhfwR
   tu/3AP25DmtCdG5GS3Y5TXBBJ3CH0TWXdwgqEGg/Vib50HDJaLN2kz56F
   g==;
X-CSE-ConnectionGUID: PTanYiyPQ6qsHGQgUuqEwQ==
X-CSE-MsgGUID: jDHNbbA9QvS//o7qFY1ofA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="23321319"
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="23321319"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 13:02:28 -0700
X-CSE-ConnectionGUID: SrDz+x2OSEOHU+V1ezQM0A==
X-CSE-MsgGUID: S5pK+BbATl2Kt0P5U9fvLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,183,1719903600"; 
   d="scan'208";a="63033266"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Aug 2024 13:02:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjOs3-000LJ4-1r;
	Wed, 28 Aug 2024 20:02:23 +0000
Date: Thu, 29 Aug 2024 04:02:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/5] tmpfs: Create casefold mount options
Message-ID: <202408290349.lp2Eq74b-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240823173332.281211-4-andrealmeid@igalia.com>
References: <20240823173332.281211-4-andrealmeid@igalia.com>
TO: "André Almeida" <andrealmeid@igalia.com>
TO: Hugh Dickins <hughd@google.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Alexander Viro <viro@zeniv.linux.org.uk>
TO: Christian Brauner <brauner@kernel.org>
TO: Jan Kara <jack@suse.cz>
CC: linux-kernel@vger.kernel.org
CC: linux-fsdevel@vger.kernel.org
CC: kernel-dev@igalia.com
CC: krisman@kernel.org
CC: Daniel Rosenberg <drosen@google.com>
CC: smcv@collabora.com
CC: "André Almeida" <andrealmeid@igalia.com>

Hi André,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.11-rc5 next-20240828]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andr-Almeida/tmpfs-Add-casefold-lookup-support/20240826-135457
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240823173332.281211-4-andrealmeid%40igalia.com
patch subject: [PATCH 3/5] tmpfs: Create casefold mount options
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240827 (https://download.01.org/0day-ci/archive/20240829/202408290349.lp2Eq74b-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408290349.lp2Eq74b-lkp@intel.com/

smatch warnings:
mm/shmem.c:4307 shmem_parse_opt_casefold() error: uninitialized symbol 'maj'.
mm/shmem.c:4307 shmem_parse_opt_casefold() error: uninitialized symbol 'min'.
mm/shmem.c:4307 shmem_parse_opt_casefold() error: uninitialized symbol 'rev'.

vim +/maj +4307 mm/shmem.c

a024e87c2944676 André Almeida 2024-08-23  4290  
a024e87c2944676 André Almeida 2024-08-23  4291  static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *param)
a024e87c2944676 André Almeida 2024-08-23  4292  {
a024e87c2944676 André Almeida 2024-08-23  4293  	struct shmem_options *ctx = fc->fs_private;
a024e87c2944676 André Almeida 2024-08-23  4294  	unsigned int maj, min, rev, version_number;
a024e87c2944676 André Almeida 2024-08-23  4295  	char version[10];
a024e87c2944676 André Almeida 2024-08-23  4296  	int ret;
a024e87c2944676 André Almeida 2024-08-23  4297  	struct unicode_map *encoding;
a024e87c2944676 André Almeida 2024-08-23  4298  
a024e87c2944676 André Almeida 2024-08-23  4299  	if (strncmp(param->string, "utf8-", 5))
a024e87c2944676 André Almeida 2024-08-23  4300  		return invalfc(fc, "Only utf8 encondings are supported");
a024e87c2944676 André Almeida 2024-08-23  4301  	ret = strscpy(version, param->string + 5, sizeof(version));
a024e87c2944676 André Almeida 2024-08-23  4302  	if (ret < 0)
a024e87c2944676 André Almeida 2024-08-23  4303  		return invalfc(fc, "Invalid enconding argument: %s",
a024e87c2944676 André Almeida 2024-08-23  4304  			       param->string);
a024e87c2944676 André Almeida 2024-08-23  4305  
a024e87c2944676 André Almeida 2024-08-23  4306  	utf8_parse_version(version, &maj, &min, &rev);
a024e87c2944676 André Almeida 2024-08-23 @4307  	version_number = UNICODE_AGE(maj, min, rev);
a024e87c2944676 André Almeida 2024-08-23  4308  	encoding = utf8_load(version_number);
a024e87c2944676 André Almeida 2024-08-23  4309  	if (IS_ERR(encoding))
a024e87c2944676 André Almeida 2024-08-23  4310  		return invalfc(fc, "Invalid utf8 version: %s", version);
a024e87c2944676 André Almeida 2024-08-23  4311  	pr_info("tmpfs: Using encoding provided by mount options: %s\n",
a024e87c2944676 André Almeida 2024-08-23  4312  		param->string);
a024e87c2944676 André Almeida 2024-08-23  4313  	ctx->encoding = encoding;
a024e87c2944676 André Almeida 2024-08-23  4314  
a024e87c2944676 André Almeida 2024-08-23  4315  	return 0;
a024e87c2944676 André Almeida 2024-08-23  4316  }
a024e87c2944676 André Almeida 2024-08-23  4317  #else
a024e87c2944676 André Almeida 2024-08-23  4318  static int shmem_parse_opt_casefold(struct fs_context *fc, struct fs_parameter *param)
a024e87c2944676 André Almeida 2024-08-23  4319  {
a024e87c2944676 André Almeida 2024-08-23  4320  	return invalfc(fc, "tmpfs: No kernel support for casefold filesystems\n");
a024e87c2944676 André Almeida 2024-08-23  4321  }
a024e87c2944676 André Almeida 2024-08-23  4322  #endif
a024e87c2944676 André Almeida 2024-08-23  4323  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
