Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA03224B04
	for <oe-kbuild@lists.linux.dev>; Tue, 21 Oct 2025 01:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761011197; cv=none; b=HJeEDS54AsVSnwvjzJ21XrREXXu9h2MzaEhgPUWN4vOjcccZHF4DCvNS+JVtaYzpkxVgbJN5QI2E9szZ5ZhW7HzjJz5aS31nrNx3MsSc3pYC4duTfYB4LXEh41ZPTd7yK2jsXOw4a56yheQC4sS3r5iPMnQg3F7HaywPCZLC1RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761011197; c=relaxed/simple;
	bh=2JZQXZeLG8Vl+avhm+o+3FbX4Fb+lf9eHpGB4nhacJw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LRiEc3i9faPiLu+08dBFUny3HV2xnq+MoB09sA3RSidrFfTc757Dr1AIDXcgcuJpI+RS98bjXbgnoDsX3QcRA8QDqwvo10TA+CiwvcfvhDI1trNfNJpn3et6NxRsY0f9NkxKK4XCcOuegdvahfYVPYR9C0DnApLo2GQA77qO6Rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVch+ca4; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVch+ca4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761011196; x=1792547196;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2JZQXZeLG8Vl+avhm+o+3FbX4Fb+lf9eHpGB4nhacJw=;
  b=KVch+ca40hNZUBov7Imrde681f/zGML+/mNGtBEtfFssQHyTeGUuqsNt
   4bPiYcctsgYXo5Vzac1ONQWdL70RneSX6xf/rIMQCEDFUqHNh6pxkdAlA
   1wqoPlJ8lLTjFP6be5x9nsyi4RL3IypEJ1GMX4s3cwKd6kVgvNzUwY7CS
   RU0EevHIEPEKCEqbljYR4KUqzLxzHVR+Hvigy00GxMtjVNcHJb2YQZ4JC
   xyUFc9+titIPx5iwiHSDNQxNpgOg5XaDC89lqlcrBf2Rw9/BAYRBK+Onm
   3hwYDIHABQA143i++JOeCD23dAJRXOCCUgBQPoEvVZRi0LhhJp5P1ziyS
   w==;
X-CSE-ConnectionGUID: 863vnSjvRGGQjcWztvvwAw==
X-CSE-MsgGUID: u7WZsCmQTGmeBuBy/M71Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="50706676"
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="50706676"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 18:46:35 -0700
X-CSE-ConnectionGUID: yxpv9+yhSmK6hJZSyAgrAg==
X-CSE-MsgGUID: rzy8ap9IQ4GjP/EGFycvUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,243,1754982000"; 
   d="scan'208";a="183878858"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2025 18:46:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vB1SD-000AMF-0s;
	Tue, 21 Oct 2025 01:46:27 +0000
Date: Tue, 21 Oct 2025 09:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: io_uring/register.c:575:59: sparse: signed value source
Message-ID: <202510210959.61PZw4S2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: io_uring/register.c:575:59: sparse: signed value source"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pavel Begunkov <asml.silence@gmail.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6548d364a3e850326831799d7e3ea2d7bb97ba08
commit: 93238e66185524aad925acefb2312203b9e26d63 io_uring: add memory region registration
date:   11 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 11 months ago
config: um-randconfig-r133-20251020 (https://download.01.org/0day-ci/archive/20251021/202510210959.61PZw4S2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251021/202510210959.61PZw4S2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510210959.61PZw4S2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/register.c: note: in included file:
   include/linux/io_uring_types.h:189:37: sparse: sparse: array of flexible structures
   io_uring/register.c: note: in included file (through include/linux/uaccess.h, include/linux/sched/task.h, include/linux/sched/signal.h, ...):
   arch/um/include/asm/uaccess.h:44:18: sparse: sparse: unsigned value that used to be signed checked against zero?
>> io_uring/register.c:575:59: sparse: signed value source
   arch/um/include/asm/uaccess.h:44:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   io_uring/register.c:585:19: sparse: signed value source
   arch/um/include/asm/uaccess.h:44:18: sparse: sparse: unsigned value that used to be signed checked against zero?
   io_uring/register.c:585:19: sparse: signed value source

vim +575 io_uring/register.c

79cfe9e59c2a12 Jens Axboe     2024-10-21  572  
93238e66185524 Pavel Begunkov 2024-11-15  573  static int io_register_mem_region(struct io_ring_ctx *ctx, void __user *uarg)
93238e66185524 Pavel Begunkov 2024-11-15  574  {
93238e66185524 Pavel Begunkov 2024-11-15 @575  	struct io_uring_mem_region_reg __user *reg_uptr = uarg;
93238e66185524 Pavel Begunkov 2024-11-15  576  	struct io_uring_mem_region_reg reg;
93238e66185524 Pavel Begunkov 2024-11-15  577  	struct io_uring_region_desc __user *rd_uptr;
93238e66185524 Pavel Begunkov 2024-11-15  578  	struct io_uring_region_desc rd;
93238e66185524 Pavel Begunkov 2024-11-15  579  	int ret;
93238e66185524 Pavel Begunkov 2024-11-15  580  
93238e66185524 Pavel Begunkov 2024-11-15  581  	if (io_region_is_set(&ctx->param_region))
93238e66185524 Pavel Begunkov 2024-11-15  582  		return -EBUSY;
93238e66185524 Pavel Begunkov 2024-11-15  583  	if (copy_from_user(&reg, reg_uptr, sizeof(reg)))
93238e66185524 Pavel Begunkov 2024-11-15  584  		return -EFAULT;
93238e66185524 Pavel Begunkov 2024-11-15  585  	rd_uptr = u64_to_user_ptr(reg.region_uptr);
93238e66185524 Pavel Begunkov 2024-11-15  586  	if (copy_from_user(&rd, rd_uptr, sizeof(rd)))
93238e66185524 Pavel Begunkov 2024-11-15  587  		return -EFAULT;
93238e66185524 Pavel Begunkov 2024-11-15  588  
93238e66185524 Pavel Begunkov 2024-11-15  589  	if (memchr_inv(&reg.__resv, 0, sizeof(reg.__resv)))
93238e66185524 Pavel Begunkov 2024-11-15  590  		return -EINVAL;
93238e66185524 Pavel Begunkov 2024-11-15  591  	if (reg.flags)
93238e66185524 Pavel Begunkov 2024-11-15  592  		return -EINVAL;
93238e66185524 Pavel Begunkov 2024-11-15  593  
93238e66185524 Pavel Begunkov 2024-11-15  594  	ret = io_create_region(ctx, &ctx->param_region, &rd);
93238e66185524 Pavel Begunkov 2024-11-15  595  	if (ret)
93238e66185524 Pavel Begunkov 2024-11-15  596  		return ret;
93238e66185524 Pavel Begunkov 2024-11-15  597  	if (copy_to_user(rd_uptr, &rd, sizeof(rd))) {
93238e66185524 Pavel Begunkov 2024-11-15  598  		io_free_region(ctx, &ctx->param_region);
93238e66185524 Pavel Begunkov 2024-11-15  599  		return -EFAULT;
93238e66185524 Pavel Begunkov 2024-11-15  600  	}
93238e66185524 Pavel Begunkov 2024-11-15  601  	return 0;
93238e66185524 Pavel Begunkov 2024-11-15  602  }
93238e66185524 Pavel Begunkov 2024-11-15  603  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
