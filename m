Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA983145B08
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Mar 2024 18:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711909720; cv=none; b=Ty9xZBKLglnV3wXR3FkRuTQdYt7xrT6tY9XvroSns8SHpcidHCLmD+DJ1Z0gg1ydLpAMM88lLlCbo2XC7hGOk1OVVQVBLZO2/6nks/ynrUjx4fnBwzS3/4SgSgVyGlenSAgGYDUWWFaVIMRKraCA8nA8JaOV/kz+Fogwm1zR6qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711909720; c=relaxed/simple;
	bh=kM5ZnYRwfatwEczWvxY4pAh07yJrgjeiQz791e3I580=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Un4Ho2e3BxVeDSqQw5U+lTApLeNU7UeZ0ZdziwcZvDDuuILA8kpQ5kejz98F9lfeVxKT8GlVcS4iZDzpeNqXVEez1+d8/23fLeix/2gAch/SXm0r/Hx4CGUgIndslHDXBT7HzzaHYQfJ9t/0MqdLok928TfDXqgqBg9EYEeOYz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GlYN0KDw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GlYN0KDw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711909718; x=1743445718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kM5ZnYRwfatwEczWvxY4pAh07yJrgjeiQz791e3I580=;
  b=GlYN0KDwxe1Z5yVZSPclXvk8YlQ5yjlD6aiSVAgklB+sgROnhrOaedwH
   w/VDzpc6wwhVblJWjKy5jmQ7/JvDCiMw7k5pHfvc35jDiRJu1Gv+JQFUm
   p4PPLA7AfFb5ARzNFw0bw3U/4/4HQ34jTJKUQZqnRu6JQC0PdT2+UIJMS
   I1OwsVLw9aCCdtoeKug78v1ODaNAl6sB+C+ahVVSSTuQjDY3USWEjKhJh
   Vyxry+V/+PUxw5DBkDAEy+RmqETDQHRNHpdWBR6w3Z2jP4CnDIZlTdSWC
   m/0cQUlZotuuVXSfrs6p1Yk6uW4dW6dlqBF4TW2EUExIa/19K6VKmbdm/
   w==;
X-CSE-ConnectionGUID: i4hRYaXBQC69y5/UmQwtqA==
X-CSE-MsgGUID: H/sFIcIpTGahwqqWif0soQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11030"; a="6892724"
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="6892724"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2024 11:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,170,1708416000"; 
   d="scan'208";a="40668003"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 31 Mar 2024 11:28:36 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqzuz-0001LC-2b;
	Sun, 31 Mar 2024 18:28:33 +0000
Date: Mon, 1 Apr 2024 02:28:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: proc-empty-vm.c:342:17: warning: ignoring return value of 'write'
 declared with attribute 'warn_unused_result'
Message-ID: <202404010211.ygidvMwa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Alexey Dobriyan <adobriyan@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   712e14250dd2907346617eba275c46f53db8fae7
commit: 6e79b375adb38219099d7e3ccc973a7808108a3e proc: test /proc/${pid}/statm
date:   6 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 6 months ago
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240401/202404010211.ygidvMwa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404010211.ygidvMwa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   proc-empty-vm.c: In function 'test_proc_pid_statm':
>> proc-empty-vm.c:342:17: warning: ignoring return value of 'write' declared with attribute 'warn_unused_result' [-Wunused-result]
     342 |                 write(1, buf, rv);
         |                 ^~~~~~~~~~~~~~~~~


vim +342 tools/testing/selftests/proc/proc-empty-vm.c

6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  320  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  321  /*
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  322   * There seems to be 2 types of valid output:
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  323   * "0 A A B 0 0 0\n" for dynamic exeuctables,
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  324   * "0 0 0 B 0 0 0\n" for static executables.
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  325   */
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  326  static int test_proc_pid_statm(pid_t pid)
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  327  {
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  328  	char buf[4096];
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  329  	snprintf(buf, sizeof(buf), "/proc/%u/statm", pid);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  330  	int fd = open(buf, O_RDONLY);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  331  	if (fd == -1) {
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  332  		perror("open /proc/${pid}/statm");
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  333  		return EXIT_FAILURE;
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  334  	}
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  335  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  336  	ssize_t rv = read(fd, buf, sizeof(buf));
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  337  	close(fd);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  338  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  339  	assert(rv >= 0);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  340  	assert(rv <= sizeof(buf));
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  341  	if (0) {
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09 @342  		write(1, buf, rv);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  343  	}
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  344  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  345  	const char *p = buf;
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  346  	const char *const end = p + rv;
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  347  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  348  	/* size */
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  349  	assert(p != end && *p++ == '0');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  350  	assert(p != end && *p++ == ' ');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  351  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  352  	uint64_t resident;
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  353  	p = parse_u64(p, end, &resident);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  354  	assert(p != end && *p++ == ' ');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  355  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  356  	uint64_t shared;
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  357  	p = parse_u64(p, end, &shared);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  358  	assert(p != end && *p++ == ' ');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  359  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  360  	uint64_t text;
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  361  	p = parse_u64(p, end, &text);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  362  	assert(p != end && *p++ == ' ');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  363  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  364  	assert(p != end && *p++ == '0');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  365  	assert(p != end && *p++ == ' ');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  366  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  367  	/* data */
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  368  	assert(p != end && *p++ == '0');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  369  	assert(p != end && *p++ == ' ');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  370  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  371  	assert(p != end && *p++ == '0');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  372  	assert(p != end && *p++ == '\n');
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  373  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  374  	assert(p == end);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  375  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  376  	/*
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  377  	 * "text" is "mm->end_code - mm->start_code" at execve(2) time.
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  378  	 * munmap() doesn't change it. It can be anything (just link
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  379  	 * statically). It can't be 0 because executing to this point
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  380  	 * implies at least 1 page of code.
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  381  	 */
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  382  	assert(text > 0);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  383  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  384  	/*
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  385  	 * These two are always equal. Always 0 for statically linked
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  386  	 * executables and sometimes 0 for dynamically linked executables.
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  387  	 * There is no way to tell one from another without parsing ELF
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  388  	 * which is too much for this test.
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  389  	 */
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  390  	assert(resident == shared);
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  391  
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  392  	return EXIT_SUCCESS;
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  393  }
6e79b375adb382 Swarup Laxman Kotiaklapudi 2023-10-09  394  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
