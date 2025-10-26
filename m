Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B892FE560
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 19:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761506907; cv=none; b=SQQJMB69usppM4NJrIYfxjd5+g1uxxhTZ5XiNn/i1Te0MrOAkAWvu9++vldvqQd5+gRHFUw5wvxiWc3p8t97KB6ojkuIIHn0tO5NytXZFUVgdnPtMCMiivKQGf92JKZVbbEJQRnUyi23zpReV2y/o+e4i3XifUkdD3Ag4YCKdso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761506907; c=relaxed/simple;
	bh=4II6Dcx5T2qd9rD9bCENYbHCqVTT21QXHRn+BlWxZDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zlqh6ElSfn+/lLSLm0SaLLqNuMpKhmY18ipK5eGNoZMHkmLI04T8afPXjQ6iy8VdOMW9z1iz0kxNvAHT250H1LjAdAcCEMiHhfqRc1sG7n3y9bE0/8YYiKcbgH/Ny/Bj1IoeNIAhogqUp+7g+hk8CaoNQpnCYdCZLBOFs4PRuyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OymiV/TH; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OymiV/TH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761506906; x=1793042906;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4II6Dcx5T2qd9rD9bCENYbHCqVTT21QXHRn+BlWxZDI=;
  b=OymiV/THsgXwnSEqgKlLrC/Vp7zzB1LjE3WoF6o1CTIEz1melAExdup5
   ra0fVJkm8/M2JJIaUlQvKUDhHKlEFIXhzfj62Bk4BkwaryAKwaqMRS4LS
   NEhv2nvyfOjeOskXHOjTQi69R2qdekLG39hqWsQ/4A/k3MQ7hnzWDug65
   4RgguWFXJ5CPjepddwMRLYhhkNns8knW7a+O6zp/k+c5M2xSPQCJtEPBX
   +l2Xr+siVob/9b8CLyEzydmHYjxeWmmcPhgDrGmUIjT5JLPFBYeaZ1G0t
   L7rvMhvm0kWdnsGxSUa86DxYch6eNwfvMvYl/7g52vjtXLpiRrLK6DVGx
   A==;
X-CSE-ConnectionGUID: thDpROYKQUipBxMJynBOSg==
X-CSE-MsgGUID: o5fHNRMGTmqQuMOydWZJbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62626949"
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="62626949"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 12:28:25 -0700
X-CSE-ConnectionGUID: EtzKT9XGTpe1g3p2g8Eh8w==
X-CSE-MsgGUID: XPh2MK7YQJ2UwvYJdlTfEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,257,1754982000"; 
   d="scan'208";a="184954600"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 26 Oct 2025 12:28:24 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD6Pe-000GJj-0O;
	Sun, 26 Oct 2025 19:28:22 +0000
Date: Mon, 27 Oct 2025 03:27:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [koverstreet-bcachefs:bcachefs-testing 468/674]
 fs/bcachefs/fs/quota.c:117:9: sparse: sparse: unknown escape sequence: '\%'
Message-ID: <202510270331.YrnoFhYW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/bcachefs/fs/quota.c:117:9: sparse: sparse: unknown escape sequence: '\%'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   a4abf4352bcdf7adc9cf5605c5035f6441ed7576
commit: 0e349fe46a443dc2f5f3d2b67a3cc42c12d2bf35 [468/674] bcachefs: move fs code to fs/
:::::: branch date: 35 minutes ago
:::::: commit date: 17 hours ago
config: hexagon-randconfig-r121-20251026 (https://download.01.org/0day-ci/archive/20251027/202510270331.YrnoFhYW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251027/202510270331.YrnoFhYW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510270331.YrnoFhYW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/bcachefs/fs/quota.c:117:9: sparse: sparse: unknown escape sequence: '%'

vim +117 fs/bcachefs/fs/quota.c

f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  108  
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  109  static void qc_dqblk_to_text(struct printbuf *out, struct qc_dqblk *q)
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  110  {
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  111  	printbuf_tabstops_reset(out);
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  112  	printbuf_tabstop_push(out, 20);
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  113  
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  114  	prt_printf(out, "d_fieldmask\t%x\n",		q->d_fieldmask);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  115  	prt_printf(out, "d_spc_hardlimit\t%llu\n",	q->d_spc_hardlimit);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  116  	prt_printf(out, "d_spc_softlimit\t%llu\n",	q->d_spc_softlimit);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10 @117  	prt_printf(out, "d_ino_hardlimit\%llu\n",	q->d_ino_hardlimit);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  118  	prt_printf(out, "d_ino_softlimit\t%llu\n",	q->d_ino_softlimit);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  119  	prt_printf(out, "d_space\t%llu\n",		q->d_space);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  120  	prt_printf(out, "d_ino_count\t%llu\n",		q->d_ino_count);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  121  	prt_printf(out, "d_ino_timer\t%llu\n",		q->d_ino_timer);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  122  	prt_printf(out, "d_spc_timer\t%llu\n",		q->d_spc_timer);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  123  	prt_printf(out, "d_ino_warns\t%i\n",		q->d_ino_warns);
7423330e30ab91 fs/bcachefs/quota.c Kent Overstreet 2024-04-10  124  	prt_printf(out, "d_spc_warns\t%i\n",		q->d_spc_warns);
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  125  }
f866870f5dbe9c fs/bcachefs/quota.c Kent Overstreet 2022-10-12  126  

:::::: The code at line 117 was first introduced by commit
:::::: 7423330e30ab916d56ce9a9d49e37e40ead5b153 bcachefs: prt_printf() now respects \r\n\t

:::::: TO: Kent Overstreet <kent.overstreet@linux.dev>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
