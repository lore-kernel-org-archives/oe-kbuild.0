Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795023552;
	b=oA8Urc2i6SiSjZ/Pz4DUobmdlG+KRvFCjV/vz6m7gPAq1xSEwqKfuif6bKMgZSe3iugY
	 B91QBmthzS9+onuWa5fMrInZtQNQu7Bjhf6TwXM/m/G18Kbja/cgfR5kelsS4I+gH45Yh
	 YVLLURPeXdRXT4/0NoHWuvtID5nfoymUH1GPkzGSfNJHtziHnpWitTtMrs4Rypjxev8B3
	 namXY3iJtybEjwyB1a586+SzBvUczbxbQPEdS0QcVneqw7rjCdPB/5i5GWQhLDD2wGT7k
	 Ns5imycLPCBC+6gRYdVr36bop7GP5CBSlWU0CsTu7W7I97mF/TDCRMvrgd7ITgl6mtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795023552;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4hoJ4UMlKorimuf+Qyn8wj4yyEn25K3ycPSpbmOzIJ0=;
	b=0jSZK7YbPtHH1cOsYI97ZRyds7iTvfhYmI8ftjIynbbZml609tFO07qwLANUA9dsIZm7
	 KKD5k/lHK/ZxzvgZLJZJzW4bxGUrguqSAJnMaLWcbmt7d8cgjXsJIgYz/JJUmjlGK60aG
	 Z5jM4XiLpVlfeSCKREKpzAWKWUP6mQC14T4Nv0NxmbK0p4trNMxL63iYyiEROVhuLWybd
	 HkTJpx1yDZQAHrYHBaCtZjRa9WjUeLrlqacm9tbZFz+Bz3lcqN4RI3dKVwn3Ld+sV+V4r
	 BVJs2jv6oFu6MOPj4Mc6GwDDO1WkNqxEsGkgPNC3e+g1Erx/Lbd1CRwNIANfc4SWzqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LZ5hbxkr;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16229606A332
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Nov 2026 17:39:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16229606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LZ5hbxkr
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795023552; x=1826559552;
  h=date:from:to:cc:subject:message-id;
  bh=RyIqy7vWHMYoDH74YuDmTv6qlY2L6OvJbcVlPFUZ2+4=;
  b=LZ5hbxkrHL4L5k1OflqJR7vu/1f1eZ2YqUFBJyJWWfL9zBheIenBYVTb
   dxfXqPOP4uONik5f5wxwbFQnrBeGTuG6JMKNRBsn/3Dd0M1JdljMjJx4E
   o++DMEd2xaAEN1Kh+0l6/giMA8c3SNIcCTTTCkMxuipTvgOr3ibnjHNEj
   7QhEB1Zqjux0KwRb+682CtBsOhvAzB3plzY41AJMpNlF4dBpnhNsL18mF
   Etwy+AqPXs9cHAXf51dc1zMkcy9MtOBNxS7vFCu5aef5iK8bEpfbdV54C
   trBCzYayVi5ehE0VAsEXDpND0KAQxcr9RbvnUaQwIVcSuJNHAu7SCgiIY
   Q==;
X-CSE-ConnectionGUID: +kVZvC3fThy8g+SlrueBZA==
X-CSE-MsgGUID: 6KCW+pwnTlmbyWoYk7Sn5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3849352"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3849352"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 09:39:12 -0800
X-CSE-ConnectionGUID: dY7/5YuMRfiDud0oyLtQVw==
X-CSE-MsgGUID: X9KjOFdGQcqevPRIyrBGsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10298230"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 18 Nov 2026 09:39:10 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTjcg-000000003RC-1TqI;
	Wed, 18 Nov 2026 17:39:06 +0000
Date: Wed, 18 Nov 2026 18:38:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:ovl-pseudo-lower 10/10] mm/filemap.c:4818
 __do_sys_cachestat() warn: 'real_file' can also be NULL
Message-ID: <20261118183614.jyuXnyle-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux ovl-pseudo-lower
head:   b8ef3da9d532bb10b4f34872a7627b597c79d61d
commit: b8ef3da9d532bb10b4f34872a7627b597c79d61d [10/10] fs: add ->f_real() file operation
:::::: branch date: 5 hours ago
:::::: commit date: 5 hours ago
config: parisc-randconfig-2200-20261118 (https://download.01.org/0day-ci/archive/20261118/20261118183614.jyuXnyle-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261118183614.jyuXnyle-lkp@intel.com/

New smatch warnings:
mm/filemap.c:4818 __do_sys_cachestat() warn: 'real_file' can also be NULL
mm/filemap.c:4818 __do_sys_cachestat() warn: 'real_file' can also be NULL

Old smatch warnings:
arch/parisc/include/asm/hash.h:44 __hash_32() warn: inconsistent indenting

vim +/real_file +4818 mm/filemap.c

5f537664e705b0 Linus Torvalds 2025-01-21  4746  
cf264e1329fb03 Nhat Pham      2023-05-02  4747  /*
cf264e1329fb03 Nhat Pham      2023-05-02  4748   * The cachestat(2) system call.
cf264e1329fb03 Nhat Pham      2023-05-02  4749   *
cf264e1329fb03 Nhat Pham      2023-05-02  4750   * cachestat() returns the page cache statistics of a file in the
cf264e1329fb03 Nhat Pham      2023-05-02  4751   * bytes range specified by `off` and `len`: number of cached pages,
cf264e1329fb03 Nhat Pham      2023-05-02  4752   * number of dirty pages, number of pages marked for writeback,
cf264e1329fb03 Nhat Pham      2023-05-02  4753   * number of evicted pages, and number of recently evicted pages.
cf264e1329fb03 Nhat Pham      2023-05-02  4754   *
cf264e1329fb03 Nhat Pham      2023-05-02  4755   * An evicted page is a page that is previously in the page cache
cf264e1329fb03 Nhat Pham      2023-05-02  4756   * but has been evicted since. A page is recently evicted if its last
cf264e1329fb03 Nhat Pham      2023-05-02  4757   * eviction was recent enough that its reentry to the cache would
cf264e1329fb03 Nhat Pham      2023-05-02  4758   * indicate that it is actively being used by the system, and that
cf264e1329fb03 Nhat Pham      2023-05-02  4759   * there is memory pressure on the system.
cf264e1329fb03 Nhat Pham      2023-05-02  4760   *
cf264e1329fb03 Nhat Pham      2023-05-02  4761   * `off` and `len` must be non-negative integers. If `len` > 0,
cf264e1329fb03 Nhat Pham      2023-05-02  4762   * the queried range is [`off`, `off` + `len`]. If `len` == 0,
cf264e1329fb03 Nhat Pham      2023-05-02  4763   * we will query in the range from `off` to the end of the file.
cf264e1329fb03 Nhat Pham      2023-05-02  4764   *
cf264e1329fb03 Nhat Pham      2023-05-02  4765   * The `flags` argument is unused for now, but is included for future
cf264e1329fb03 Nhat Pham      2023-05-02  4766   * extensibility. User should pass 0 (i.e no flag specified).
cf264e1329fb03 Nhat Pham      2023-05-02  4767   *
cf264e1329fb03 Nhat Pham      2023-05-02  4768   * Currently, hugetlbfs is not supported.
cf264e1329fb03 Nhat Pham      2023-05-02  4769   *
cf264e1329fb03 Nhat Pham      2023-05-02  4770   * Because the status of a page can change after cachestat() checks it
cf264e1329fb03 Nhat Pham      2023-05-02  4771   * but before it returns to the application, the returned values may
cf264e1329fb03 Nhat Pham      2023-05-02  4772   * contain stale information.
cf264e1329fb03 Nhat Pham      2023-05-02  4773   *
cf264e1329fb03 Nhat Pham      2023-05-02  4774   * return values:
cf264e1329fb03 Nhat Pham      2023-05-02  4775   *  zero        - success
cf264e1329fb03 Nhat Pham      2023-05-02  4776   *  -EFAULT     - cstat or cstat_range points to an illegal address
cf264e1329fb03 Nhat Pham      2023-05-02  4777   *  -EINVAL     - invalid flags
cf264e1329fb03 Nhat Pham      2023-05-02  4778   *  -EBADF      - invalid file descriptor
cf264e1329fb03 Nhat Pham      2023-05-02  4779   *  -EOPNOTSUPP - file descriptor is of a hugetlbfs file
cf264e1329fb03 Nhat Pham      2023-05-02  4780   */
cf264e1329fb03 Nhat Pham      2023-05-02  4781  SYSCALL_DEFINE4(cachestat, unsigned int, fd,
cf264e1329fb03 Nhat Pham      2023-05-02  4782  		struct cachestat_range __user *, cstat_range,
cf264e1329fb03 Nhat Pham      2023-05-02  4783  		struct cachestat __user *, cstat, unsigned int, flags)
cf264e1329fb03 Nhat Pham      2023-05-02  4784  {
65c8941e7dca1c Al Viro        2024-07-22  4785  	CLASS(fd, f)(fd);
b8ef3da9d532bb Amir Goldstein 2026-11-18  4786  	struct file *real_file;
cf264e1329fb03 Nhat Pham      2023-05-02  4787  	struct address_space *mapping;
cf264e1329fb03 Nhat Pham      2023-05-02  4788  	struct cachestat_range csr;
cf264e1329fb03 Nhat Pham      2023-05-02  4789  	struct cachestat cs;
cf264e1329fb03 Nhat Pham      2023-05-02  4790  	pgoff_t first_index, last_index;
cf264e1329fb03 Nhat Pham      2023-05-02  4791  
65c8941e7dca1c Al Viro        2024-07-22  4792  	if (fd_empty(f))
cf264e1329fb03 Nhat Pham      2023-05-02  4793  		return -EBADF;
cf264e1329fb03 Nhat Pham      2023-05-02  4794  
cf264e1329fb03 Nhat Pham      2023-05-02  4795  	if (copy_from_user(&csr, cstat_range,
65c8941e7dca1c Al Viro        2024-07-22  4796  			sizeof(struct cachestat_range)))
cf264e1329fb03 Nhat Pham      2023-05-02  4797  		return -EFAULT;
cf264e1329fb03 Nhat Pham      2023-05-02  4798  
cf264e1329fb03 Nhat Pham      2023-05-02  4799  	/* hugetlbfs is not supported */
65c8941e7dca1c Al Viro        2024-07-22  4800  	if (is_file_hugepages(fd_file(f)))
cf264e1329fb03 Nhat Pham      2023-05-02  4801  		return -EOPNOTSUPP;
cf264e1329fb03 Nhat Pham      2023-05-02  4802  
5f537664e705b0 Linus Torvalds 2025-01-21  4803  	if (!can_do_cachestat(fd_file(f)))
5f537664e705b0 Linus Torvalds 2025-01-21  4804  		return -EPERM;
5f537664e705b0 Linus Torvalds 2025-01-21  4805  
65c8941e7dca1c Al Viro        2024-07-22  4806  	if (flags != 0)
cf264e1329fb03 Nhat Pham      2023-05-02  4807  		return -EINVAL;
cf264e1329fb03 Nhat Pham      2023-05-02  4808  
b8ef3da9d532bb Amir Goldstein 2026-11-18  4809  	/* The page cache of a stacked file is in its real file */
b8ef3da9d532bb Amir Goldstein 2026-11-18  4810  	real_file = file_real(fd_file(f));
b8ef3da9d532bb Amir Goldstein 2026-11-18  4811  	if (IS_ERR(real_file))
b8ef3da9d532bb Amir Goldstein 2026-11-18  4812  		return PTR_ERR(real_file);
b8ef3da9d532bb Amir Goldstein 2026-11-18  4813  
cf264e1329fb03 Nhat Pham      2023-05-02  4814  	first_index = csr.off >> PAGE_SHIFT;
cf264e1329fb03 Nhat Pham      2023-05-02  4815  	last_index =
cf264e1329fb03 Nhat Pham      2023-05-02  4816  		csr.len == 0 ? ULONG_MAX : (csr.off + csr.len - 1) >> PAGE_SHIFT;
cf264e1329fb03 Nhat Pham      2023-05-02  4817  	memset(&cs, 0, sizeof(struct cachestat));
b8ef3da9d532bb Amir Goldstein 2026-11-18 @4818  	mapping = real_file->f_mapping;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
