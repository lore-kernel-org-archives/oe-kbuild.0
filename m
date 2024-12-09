Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E46A21B188
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 11:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733742432; cv=none; b=TIjwJPhOJZvuurxtPGHxn9Jz6ZcXbLg7EDT41IFgvhGMvubxqEJ+dEmlF8+bqeFhZBW+iLfHPi+I3dgf121Rx7q7BtW5s2Qgk/+zd2nW+Eo5YZBcpIlXktrqv0FQWSiTX1wbSdtqOaP519yRoh6KYy/AN1CB6SLOuFBUB/izTfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733742432; c=relaxed/simple;
	bh=6iPEMT9UU/5IBBDusDshhiDljZk5PrYqLqMb/4UKkD4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qZGAItpqnSSWjAdIS0VH/GvNa4hPlX50LbEhiI86UEks63/HegTpX66nw7eG+P4csTRxuNbXrPuPMMTwTmh3LNtDh8gBBP6Yp6VjqxRClaXu6n+HMEUvLHNYfebMeXSgSDuU6iYJEpfEBT5jb1brbrwQWdhhI/4/mUsRMkgfijE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XdEWPya/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XdEWPya/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733742431; x=1765278431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6iPEMT9UU/5IBBDusDshhiDljZk5PrYqLqMb/4UKkD4=;
  b=XdEWPya/jMopqJCGI/7Yw4Iu5kKWtPpsN0hTbYdrEyoYwT+EBbEBDpJ5
   fABPetTu5OXKitUimZnubJATGdCO7SEmz2KFaw6Hor3RlTkqCDbmMytyI
   05hDBXnFh9QqXxxgsjeKvY0JmWVqpLQtE2rAA3SEzJ09bFLz6Gwfbp+KR
   nKo9dQ8fXKkg/sZAx/a5Csn1i3unzIdNMQd2GEobUUH4RIa4ujzay74cs
   WLz42th36sBcNZmbG9hrEc7Xwoim7wYCUOhhoXgKA/oo5KoJ7gq3HPMq4
   vwJlMcdqsEUkgGp2rray1c9dU0e9UK5yYY16MsMTpXGq8AW/iJK0pp03q
   Q==;
X-CSE-ConnectionGUID: Vski2IF0Sj2NpOJaGBAbhA==
X-CSE-MsgGUID: eWE3AnvLRjKmc1N3mrbV9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34154691"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="34154691"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 03:07:11 -0800
X-CSE-ConnectionGUID: y7Y/5jr/Si+qXYDjiTPwvw==
X-CSE-MsgGUID: v1Vt6V/9TZSpI3AeevnmEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="100072156"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Dec 2024 03:07:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKbbW-0004F4-1v;
	Mon, 09 Dec 2024 11:07:06 +0000
Date: Mon, 9 Dec 2024 19:06:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: net/ipv6/netfilter/ip6_tables.c:1030 get_entries() warn: potential
 user controlled sizeof overflow '36 + get.size' '36 + 0-u32max'
Message-ID: <202412091818.2TKk0zIn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Breno Leitao <leitao@debian.org>
CC: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
commit: 6c959fd5e17387201dba3619b2e6af213939a0a7 netfilter: Make legacy configs user selectable
date:   8 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 weeks ago
config: i386-randconfig-141-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091818.2TKk0zIn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412091818.2TKk0zIn-lkp@intel.com/

smatch warnings:
net/ipv6/netfilter/ip6_tables.c:1030 get_entries() warn: potential user controlled sizeof overflow '36 + get.size' '36 + 0-u32max'

vim +1030 net/ipv6/netfilter/ip6_tables.c

433665c9d110d7 Patrick McHardy   2007-12-17  1017  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1018  static int
d5d1baa15f5b05 Jan Engelhardt    2009-06-26  1019  get_entries(struct net *net, struct ip6t_get_entries __user *uptr,
d5d1baa15f5b05 Jan Engelhardt    2009-06-26  1020  	    const int *len)
^1da177e4c3f41 Linus Torvalds    2005-04-16  1021  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  1022  	int ret;
d924357c50d83e Patrick McHardy   2007-12-17  1023  	struct ip6t_get_entries get;
2e4e6a17af35be Harald Welte      2006-01-12  1024  	struct xt_table *t;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1025  
d7cdf81657776c Pablo Neira Ayuso 2016-05-03  1026  	if (*len < sizeof(get))
d924357c50d83e Patrick McHardy   2007-12-17  1027  		return -EINVAL;
d924357c50d83e Patrick McHardy   2007-12-17  1028  	if (copy_from_user(&get, uptr, sizeof(get)) != 0)
d924357c50d83e Patrick McHardy   2007-12-17  1029  		return -EFAULT;
d7cdf81657776c Pablo Neira Ayuso 2016-05-03 @1030  	if (*len != sizeof(struct ip6t_get_entries) + get.size)
d924357c50d83e Patrick McHardy   2007-12-17  1031  		return -EINVAL;
d7cdf81657776c Pablo Neira Ayuso 2016-05-03  1032  
b301f253875993 Pablo Neira Ayuso 2016-03-24  1033  	get.name[sizeof(get.name) - 1] = '\0';
d924357c50d83e Patrick McHardy   2007-12-17  1034  
336b517fdc0f92 Alexey Dobriyan   2008-01-31  1035  	t = xt_find_table_lock(net, AF_INET6, get.name);
03d13b6868a261 Florian Westphal  2017-12-08  1036  	if (!IS_ERR(t)) {
d3d40f237480ab Mark Tomlinson    2021-03-08  1037  		struct xt_table_info *private = t->private;
d924357c50d83e Patrick McHardy   2007-12-17  1038  		if (get.size == private->size)
2e4e6a17af35be Harald Welte      2006-01-12  1039  			ret = copy_entries_to_user(private->size,
^1da177e4c3f41 Linus Torvalds    2005-04-16  1040  						   t, uptr->entrytable);
d7cdf81657776c Pablo Neira Ayuso 2016-05-03  1041  		else
544473c1664f3a Patrick McHardy   2008-04-14  1042  			ret = -EAGAIN;
d7cdf81657776c Pablo Neira Ayuso 2016-05-03  1043  
6b7d31fcdda593 Harald Welte      2005-10-26  1044  		module_put(t->me);
2e4e6a17af35be Harald Welte      2006-01-12  1045  		xt_table_unlock(t);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1046  	} else
03d13b6868a261 Florian Westphal  2017-12-08  1047  		ret = PTR_ERR(t);
^1da177e4c3f41 Linus Torvalds    2005-04-16  1048  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1049  	return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1050  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  1051  

:::::: The code at line 1030 was first introduced by commit
:::::: d7cdf81657776ca1aa8377fd84d02fd8774db483 netfilter: x_tables: get rid of old and inconsistent debugging

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
