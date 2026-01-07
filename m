Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90E0281356
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Jan 2026 07:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767771212; cv=none; b=ufjMOx/ldF8SCpMjACEpE6kECuFiwTjAqHa1PDtVjBQj6SMOHmZJVs3t7JOA4dFP9T0ODDND+VtqxoJpKgqVWsaMBP+y0AELJkWlaXHxrFjzGaj0dVdf6hWAvwPB4pKV9zOAXJ4aVlsLoT2TGeRrUUcJVh7Dlwxkw4AAQkU+L5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767771212; c=relaxed/simple;
	bh=bpdduXc9IcidbuHOVoY82GP5YFwQ6Rw8OliDJDI31j8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X3th2L7MgdQUjZ3ONG1Z75q/g/fon8iQk3wCSyEo8nB7UP+Z0iZ6NznaZVO9qsgwPKvpTO766krYGxVkWiyCPAlRXJTkzqFwCFsL7TY6jCG0Jp/4RfbqHcwPU3SKWqx5h4N0b6S74XX5NOBRKT96Mm4gIfHhOzX6Mnm+jtkQSpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I+wZZ+Kf; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I+wZZ+Kf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767771210; x=1799307210;
  h=date:from:to:cc:subject:message-id;
  bh=bpdduXc9IcidbuHOVoY82GP5YFwQ6Rw8OliDJDI31j8=;
  b=I+wZZ+Kf8iSQOoU51/b/CJ/5+wfJkCCLHfNAk4BPV00fS2gE2mJRHIOB
   7wDZ82zLHWy3x1TWqz6dbmTWKQo8fYrPwLBXwcJqyek1HKIpONEaYqVKU
   G8/p+NAkvFphHlRZ4jtfUv4W5Dw1iCauzwg98o/W4CfefMJfaTg4XI76S
   f48KwOjAvtB/Q5TfOqU2PkcpVbv3ShskSTqX9iJgZvjyVXTj18W9mbT6t
   FvIwJn/jXEIERMsK3IqfcSbLnAH4WJ42chMZCERkvRX+orYUpw032eLa3
   7qe9HEEqvDvf7PwoWU2CE8Mz+6zNTmEyANXv3NVAfXfGTNIwP/Jl4t9qF
   A==;
X-CSE-ConnectionGUID: ePx9qkQ4TaW3aVtKz9Ho0w==
X-CSE-MsgGUID: QB6EqL+jRG698PZtgJYwag==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="56697560"
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="56697560"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 23:33:29 -0800
X-CSE-ConnectionGUID: CKrTaDYYQNK1OWPwp7Ry9g==
X-CSE-MsgGUID: 0EfUhCmLQMWMlq2LEyZAcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,207,1763452800"; 
   d="scan'208";a="202071575"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2026 23:33:28 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdO2n-000000003Z7-1rLL;
	Wed, 07 Jan 2026 07:33:25 +0000
Date: Wed, 07 Jan 2026 15:32:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tip:locking/core 27/40] arch/powerpc/kernel/nvram_64.c:704
 oops_to_nvram() error: uninitialized symbol 'flags'.
Message-ID: <202601071511.Amr87nyW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: x86@kernel.org
TO: Marco Elver <elver@google.com>
CC: Peter Zijlstra <peterz@infradead.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
head:   c10d860e0baae0853773dc90a94b26adc5687380
commit: e4588c25c9d122b5847b88e18b184404b6959160 [27/40] compiler-context-analysis: Remove __cond_lock() function-like helper
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r072-20260107 (https://download.01.org/0day-ci/archive/20260107/202601071511.Amr87nyW-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601071511.Amr87nyW-lkp@intel.com/

New smatch warnings:
arch/powerpc/kernel/nvram_64.c:704 oops_to_nvram() error: uninitialized symbol 'flags'.

Old smatch warnings:
arch/powerpc/kernel/nvram_64.c:688 oops_to_nvram() error: uninitialized symbol 'text_len'.
arch/powerpc/kernel/nvram_64.c:696 oops_to_nvram() error: uninitialized symbol 'text_len'.

vim +/flags +704 arch/powerpc/kernel/nvram_64.c

78989f0a559218 Hari Bathini    2015-02-06  637  
78989f0a559218 Hari Bathini    2015-02-06  638  /*
78989f0a559218 Hari Bathini    2015-02-06  639   * This is our kmsg_dump callback, called after an oops or panic report
78989f0a559218 Hari Bathini    2015-02-06  640   * has been written to the printk buffer.  We want to capture as much
78989f0a559218 Hari Bathini    2015-02-06  641   * of the printk buffer as possible.  First, capture as much as we can
78989f0a559218 Hari Bathini    2015-02-06  642   * that we think will compress sufficiently to fit in the lnx,oops-log
78989f0a559218 Hari Bathini    2015-02-06  643   * partition.  If that's too much, go back and capture uncompressed text.
78989f0a559218 Hari Bathini    2015-02-06  644   */
78989f0a559218 Hari Bathini    2015-02-06  645  static void oops_to_nvram(struct kmsg_dumper *dumper,
e1a261ba599eec Jocelyn Falempe 2024-07-02  646  			  struct kmsg_dump_detail *detail)
78989f0a559218 Hari Bathini    2015-02-06  647  {
78989f0a559218 Hari Bathini    2015-02-06  648  	struct oops_log_info *oops_hdr = (struct oops_log_info *)oops_buf;
78989f0a559218 Hari Bathini    2015-02-06  649  	static unsigned int oops_count = 0;
f9f3f02db98bbe John Ogness     2021-03-03  650  	static struct kmsg_dump_iter iter;
78989f0a559218 Hari Bathini    2015-02-06  651  	static bool panicking = false;
78989f0a559218 Hari Bathini    2015-02-06  652  	static DEFINE_SPINLOCK(lock);
78989f0a559218 Hari Bathini    2015-02-06  653  	unsigned long flags;
78989f0a559218 Hari Bathini    2015-02-06  654  	size_t text_len;
78989f0a559218 Hari Bathini    2015-02-06  655  	unsigned int err_type = ERR_TYPE_KERNEL_PANIC_GZ;
78989f0a559218 Hari Bathini    2015-02-06  656  	int rc = -1;
78989f0a559218 Hari Bathini    2015-02-06  657  
e1a261ba599eec Jocelyn Falempe 2024-07-02  658  	switch (detail->reason) {
6d3cf962dd1a95 Kees Cook       2020-05-15  659  	case KMSG_DUMP_SHUTDOWN:
78989f0a559218 Hari Bathini    2015-02-06  660  		/* These are almost always orderly shutdowns. */
78989f0a559218 Hari Bathini    2015-02-06  661  		return;
78989f0a559218 Hari Bathini    2015-02-06  662  	case KMSG_DUMP_OOPS:
78989f0a559218 Hari Bathini    2015-02-06  663  		break;
78989f0a559218 Hari Bathini    2015-02-06  664  	case KMSG_DUMP_PANIC:
78989f0a559218 Hari Bathini    2015-02-06  665  		panicking = true;
78989f0a559218 Hari Bathini    2015-02-06  666  		break;
78989f0a559218 Hari Bathini    2015-02-06  667  	case KMSG_DUMP_EMERG:
78989f0a559218 Hari Bathini    2015-02-06  668  		if (panicking)
78989f0a559218 Hari Bathini    2015-02-06  669  			/* Panic report already captured. */
78989f0a559218 Hari Bathini    2015-02-06  670  			return;
78989f0a559218 Hari Bathini    2015-02-06  671  		break;
78989f0a559218 Hari Bathini    2015-02-06  672  	default:
78989f0a559218 Hari Bathini    2015-02-06  673  		pr_err("%s: ignoring unrecognized KMSG_DUMP_* reason %d\n",
e1a261ba599eec Jocelyn Falempe 2024-07-02  674  		       __func__, (int) detail->reason);
78989f0a559218 Hari Bathini    2015-02-06  675  		return;
78989f0a559218 Hari Bathini    2015-02-06  676  	}
78989f0a559218 Hari Bathini    2015-02-06  677  
78989f0a559218 Hari Bathini    2015-02-06  678  	if (clobbering_unread_rtas_event())
78989f0a559218 Hari Bathini    2015-02-06  679  		return;
78989f0a559218 Hari Bathini    2015-02-06  680  
78989f0a559218 Hari Bathini    2015-02-06  681  	if (!spin_trylock_irqsave(&lock, flags))
78989f0a559218 Hari Bathini    2015-02-06  682  		return;
78989f0a559218 Hari Bathini    2015-02-06  683  
78989f0a559218 Hari Bathini    2015-02-06  684  	if (big_oops_buf) {
f9f3f02db98bbe John Ogness     2021-03-03  685  		kmsg_dump_rewind(&iter);
f9f3f02db98bbe John Ogness     2021-03-03  686  		kmsg_dump_get_buffer(&iter, false,
78989f0a559218 Hari Bathini    2015-02-06  687  				     big_oops_buf, big_oops_buf_sz, &text_len);
78989f0a559218 Hari Bathini    2015-02-06  688  		rc = zip_oops(text_len);
78989f0a559218 Hari Bathini    2015-02-06  689  	}
78989f0a559218 Hari Bathini    2015-02-06  690  	if (rc != 0) {
f9f3f02db98bbe John Ogness     2021-03-03  691  		kmsg_dump_rewind(&iter);
f9f3f02db98bbe John Ogness     2021-03-03  692  		kmsg_dump_get_buffer(&iter, false,
78989f0a559218 Hari Bathini    2015-02-06  693  				     oops_data, oops_data_sz, &text_len);
78989f0a559218 Hari Bathini    2015-02-06  694  		err_type = ERR_TYPE_KERNEL_PANIC;
78989f0a559218 Hari Bathini    2015-02-06  695  		oops_hdr->version = cpu_to_be16(OOPS_HDR_VERSION);
78989f0a559218 Hari Bathini    2015-02-06  696  		oops_hdr->report_length = cpu_to_be16(text_len);
e4a9616c548f67 Hari Bathini    2015-02-06  697  		oops_hdr->timestamp = cpu_to_be64(ktime_get_real_seconds());
78989f0a559218 Hari Bathini    2015-02-06  698  	}
78989f0a559218 Hari Bathini    2015-02-06  699  
78989f0a559218 Hari Bathini    2015-02-06  700  	(void) nvram_write_os_partition(&oops_log_partition, oops_buf,
78989f0a559218 Hari Bathini    2015-02-06  701  		(int) (sizeof(*oops_hdr) + text_len), err_type,
78989f0a559218 Hari Bathini    2015-02-06  702  		++oops_count);
78989f0a559218 Hari Bathini    2015-02-06  703  
78989f0a559218 Hari Bathini    2015-02-06 @704  	spin_unlock_irqrestore(&lock, flags);
78989f0a559218 Hari Bathini    2015-02-06  705  }
78989f0a559218 Hari Bathini    2015-02-06  706  

:::::: The code at line 704 was first introduced by commit
:::::: 78989f0a5592182a3d45d869ddaafc71c8f673af powerpc/nvram: Move generic code for nvram and pstore

:::::: TO: Hari Bathini <hbathini@linux.vnet.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
