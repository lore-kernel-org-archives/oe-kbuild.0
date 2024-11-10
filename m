Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDE717C91
	for <oe-kbuild@lists.linux.dev>; Sun, 10 Nov 2024 22:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731279180; cv=none; b=LsZefQc4+QR1AxLKAybEcUn2uVgJECqr2cCH31geFCCZwReB/WSERBC9K/i+aenqYuVf2QN2NKn7pFn4U10mV8Wnco7PHCoeopj1RcFhAk7sl5Ow31zVXnnmu3WQXtX5OwIf8bTR+tOCk7UMm1zBd8oMKsvcZWi2Cl/foJmiG5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731279180; c=relaxed/simple;
	bh=jei44bcHdRjYD/JXKF7vgoNn+VZpzxUHt0q0vYVwPaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CgWsPbwbFNqIZIbTUGlY7fAZox/rJcpZtM66eNr215FP50nVcUtX4vLaPogOdXe5WkGcQM9nkn1UpdHShfiZdW7EOlSqnicT5VNIraFJv8SCH7XkJ0BPdetttK3C1Fpts0JNXcw9gHhyb0IBAYt0cLsKyGybgd1KMxpgFWDeHvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dOz9RLOX; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dOz9RLOX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731279178; x=1762815178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jei44bcHdRjYD/JXKF7vgoNn+VZpzxUHt0q0vYVwPaQ=;
  b=dOz9RLOX43HrgLMqVHhkpoGw/qfelC8aFBiaPfT2cFGf5GUHIHaWQBNG
   YIjbB6mzKbFnTz2OlZRW9UWoRX4ohnLSzgYX50uQFPUwpFpXim0wyUZaW
   qn+u6fC9TdRv5HtLduW4lXAieQnyLn+2TO4pmRqsau0bRawjenJwbycxv
   Z8RDfHSu78zHxqhx2SniD7CxXBMREwBL8UAgKUpQns5BnJhHpUk8tKYBF
   we1djrJURrfnwnrXb/b63vO/RNrIyvwF9DeTrN80oFf8d+TzMvKnwKfHP
   kqHd+7hw4KQ9U1v/Y6BOwawsA1C0LvTy7i4tKuzGYZpoEDTuI2CwckqRG
   g==;
X-CSE-ConnectionGUID: CW0dbh2BSP+0FCmRTKsy3g==
X-CSE-MsgGUID: bjuJITYXT3OIOpSatRNrEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11252"; a="56480072"
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="56480072"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2024 14:52:57 -0800
X-CSE-ConnectionGUID: 75dOZC+VQAWyoPVdKDfoug==
X-CSE-MsgGUID: 0iS4uzkmSp+g4V+IFTzI1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; 
   d="scan'208";a="124163132"
Received: from lkp-server01.sh.intel.com (HELO 7b17a4138caf) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 10 Nov 2024 14:52:56 -0800
Received: from kbuild by 7b17a4138caf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tAGnd-0000T3-22;
	Sun, 10 Nov 2024 22:52:53 +0000
Date: Mon, 11 Nov 2024 06:52:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 3606/10559] net/ipv4/netfilter/arp_tables.c:857
 get_entries() warn: potential user controlled sizeof overflow '36 +
 get.size' '36 + 0-u32max'
Message-ID: <202411110613.2oHuXwMG-lkp@intel.com>
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
TO: Breno Leitao <leitao@debian.org>
CC: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   929beafbe7acce3267c06115e13e03ff6e50548a
commit: 6c959fd5e17387201dba3619b2e6af213939a0a7 [3606/10559] netfilter: Make legacy configs user selectable
:::::: branch date: 3 days ago
:::::: commit date: 4 weeks ago
config: arm-randconfig-r071-20241110 (https://download.01.org/0day-ci/archive/20241111/202411110613.2oHuXwMG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411110613.2oHuXwMG-lkp@intel.com/

smatch warnings:
net/ipv4/netfilter/arp_tables.c:857 get_entries() warn: potential user controlled sizeof overflow '36 + get.size' '36 + 0-u32max'

vim +857 net/ipv4/netfilter/arp_tables.c

41acd975b954ad Patrick McHardy   2007-12-17  845  
79df341ab6c0b1 Alexey Dobriyan   2008-01-31  846  static int get_entries(struct net *net, struct arpt_get_entries __user *uptr,
d5d1baa15f5b05 Jan Engelhardt    2009-06-26  847  		       const int *len)
^1da177e4c3f41 Linus Torvalds    2005-04-16  848  {
^1da177e4c3f41 Linus Torvalds    2005-04-16  849  	int ret;
11f6dff8af95d8 Patrick McHardy   2007-12-17  850  	struct arpt_get_entries get;
4abff0775d5e4f Jan Engelhardt    2008-04-14  851  	struct xt_table *t;
^1da177e4c3f41 Linus Torvalds    2005-04-16  852  
d7cdf81657776c Pablo Neira Ayuso 2016-05-03  853  	if (*len < sizeof(get))
11f6dff8af95d8 Patrick McHardy   2007-12-17  854  		return -EINVAL;
11f6dff8af95d8 Patrick McHardy   2007-12-17  855  	if (copy_from_user(&get, uptr, sizeof(get)) != 0)
11f6dff8af95d8 Patrick McHardy   2007-12-17  856  		return -EFAULT;
d7cdf81657776c Pablo Neira Ayuso 2016-05-03 @857  	if (*len != sizeof(struct arpt_get_entries) + get.size)
11f6dff8af95d8 Patrick McHardy   2007-12-17  858  		return -EINVAL;
d7cdf81657776c Pablo Neira Ayuso 2016-05-03  859  
b301f253875993 Pablo Neira Ayuso 2016-03-24  860  	get.name[sizeof(get.name) - 1] = '\0';
11f6dff8af95d8 Patrick McHardy   2007-12-17  861  
ee999d8b9573df Jan Engelhardt    2008-10-08  862  	t = xt_find_table_lock(net, NFPROTO_ARP, get.name);
03d13b6868a261 Florian Westphal  2017-12-08  863  	if (!IS_ERR(t)) {
d3d40f237480ab Mark Tomlinson    2021-03-08  864  		const struct xt_table_info *private = t->private;
5452e425adfdfc Jan Engelhardt    2008-04-14  865  
11f6dff8af95d8 Patrick McHardy   2007-12-17  866  		if (get.size == private->size)
2e4e6a17af35be Harald Welte      2006-01-12  867  			ret = copy_entries_to_user(private->size,
^1da177e4c3f41 Linus Torvalds    2005-04-16  868  						   t, uptr->entrytable);
d7cdf81657776c Pablo Neira Ayuso 2016-05-03  869  		else
544473c1664f3a Patrick McHardy   2008-04-14  870  			ret = -EAGAIN;
d7cdf81657776c Pablo Neira Ayuso 2016-05-03  871  
6b7d31fcdda593 Harald Welte      2005-10-26  872  		module_put(t->me);
2e4e6a17af35be Harald Welte      2006-01-12  873  		xt_table_unlock(t);
^1da177e4c3f41 Linus Torvalds    2005-04-16  874  	} else
03d13b6868a261 Florian Westphal  2017-12-08  875  		ret = PTR_ERR(t);
^1da177e4c3f41 Linus Torvalds    2005-04-16  876  
^1da177e4c3f41 Linus Torvalds    2005-04-16  877  	return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  878  }
^1da177e4c3f41 Linus Torvalds    2005-04-16  879  

:::::: The code at line 857 was first introduced by commit
:::::: d7cdf81657776ca1aa8377fd84d02fd8774db483 netfilter: x_tables: get rid of old and inconsistent debugging

:::::: TO: Pablo Neira Ayuso <pablo@netfilter.org>
:::::: CC: Pablo Neira Ayuso <pablo@netfilter.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
