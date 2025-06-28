Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0AA1854
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 06:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751092233; cv=none; b=rzJ02gwQOJ26jp+iIscbEsx2E/MiwTHb2VmQKnWG6qz2QPbKKymBmK/DBWCb511VaKVDcmTU2C9c35DOzs6sC9Zgtz3Ftf0g2ROHyfsxjAhWCnbt6mRf03nAmLNGGzr5Mcch8hX4qx53Ghd1eO+0ExcaeE4vvUDkQMPmAR4ETws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751092233; c=relaxed/simple;
	bh=PlFIZNv8Mj08op776cfHjHgRMyqhf6GIrUVfljeU3eM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=exNPOdwzxgf/tAf0iOm5yt9fqUu5TRaBSPf5wW3WIKnNBaMEpjJUrdACSIrREpn+TgNLxJQqXcsLeopgGicDoRmhmJlIiXppWAg9xbQXyx1ae57Dqi5e7yDmVP5ifrq8dzXcpSu0DhP4cfKa+iLOeUMSPE/Yh/Z3UxQI2mM7z/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAaCIeKn; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAaCIeKn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751092231; x=1782628231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PlFIZNv8Mj08op776cfHjHgRMyqhf6GIrUVfljeU3eM=;
  b=cAaCIeKnsChdAp+aTCAPTdfACPZtTo1BAVwqJXzrznYtmW8XqF0tI7U7
   tZdqFbbZe3t4nUxQ1GEE7NEL0gXx6wd4JleejLhDa85U3P/cKPYKW27XD
   RdhB79Run62DhTaRCujfhCYOfz8gQqSINT5gzqdU+k+7cM+eOcPnCSRwj
   2CTAWtOKc07MlFRmIkfVNmAFAXFqv7HuI+4ZtFKCgngidnWFvLvp1TmMe
   Fgt+miVZo5IRsmQqES4YLV6k41pSc1OQUw8uO1s3xHzijmId6w/ol1diT
   S35diBtCJOyX7j5hf9NvR4aAU1i0aYoNfbIxVF9+fIA1FxiqLhpMAFFa+
   A==;
X-CSE-ConnectionGUID: KZDR2yvlRdybhVOIkm9CjA==
X-CSE-MsgGUID: HuqOaLBKRCS3qd+wpbeDsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53339363"
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="53339363"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 23:30:31 -0700
X-CSE-ConnectionGUID: 6QgINUsZTRefg1HUt+p0wg==
X-CSE-MsgGUID: SXJ0Ch04TPuXCUG3f4JN7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,272,1744095600"; 
   d="scan'208";a="158484892"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jun 2025 23:30:29 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVP51-000WrG-1R;
	Sat, 28 Jun 2025 06:30:27 +0000
Date: Sat, 28 Jun 2025 14:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4213/4739] lib/test_objagg.c:923
 test_hints_case2() error: uninitialized symbol 'errmsg'.
Message-ID: <202506281403.DsuyHFTZ-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2aeda9592360c200085898a258c4754bfe879921
commit: 8c8f1e89eb88d49b5bf26eca8185505c18bbbcdf [4213/4739] lib: test_objagg: split test_hints_case() into two functions
:::::: branch date: 21 hours ago
:::::: commit date: 5 days ago
config: powerpc64-randconfig-r072-20250627 (https://download.01.org/0day-ci/archive/20250628/202506281403.DsuyHFTZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project e04c938cc08a90ae60440ce22d072ebc69d67ee8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506281403.DsuyHFTZ-lkp@intel.com/

smatch warnings:
lib/test_objagg.c:923 test_hints_case2() error: uninitialized symbol 'errmsg'.

vim +/errmsg +923 lib/test_objagg.c

9069a3817d82b0 Jiri Pirko    2019-02-07  908  
8c8f1e89eb88d4 Arnd Bergmann 2025-06-20  909  static int test_hints_case2(const struct hints_case *hints_case,
8c8f1e89eb88d4 Arnd Bergmann 2025-06-20  910  			    struct objagg_hints *hints, struct objagg *objagg)
9069a3817d82b0 Jiri Pirko    2019-02-07  911  {
9069a3817d82b0 Jiri Pirko    2019-02-07  912  	struct objagg_obj *objagg_obj;
9069a3817d82b0 Jiri Pirko    2019-02-07  913  	struct world world2 = {};
9069a3817d82b0 Jiri Pirko    2019-02-07  914  	struct objagg *objagg2;
9069a3817d82b0 Jiri Pirko    2019-02-07  915  	const char *errmsg;
9069a3817d82b0 Jiri Pirko    2019-02-07  916  	int i;
9069a3817d82b0 Jiri Pirko    2019-02-07  917  	int err;
9069a3817d82b0 Jiri Pirko    2019-02-07  918  
9069a3817d82b0 Jiri Pirko    2019-02-07  919  	pr_debug_hints_stats(hints);
9069a3817d82b0 Jiri Pirko    2019-02-07  920  	err = check_expect_hints_stats(hints, &hints_case->expect_stats_hints,
9069a3817d82b0 Jiri Pirko    2019-02-07  921  				       &errmsg);
9069a3817d82b0 Jiri Pirko    2019-02-07  922  	if (err) {
9069a3817d82b0 Jiri Pirko    2019-02-07 @923  		pr_err("Hints stats: %s\n", errmsg);
8c8f1e89eb88d4 Arnd Bergmann 2025-06-20  924  		return err;
9069a3817d82b0 Jiri Pirko    2019-02-07  925  	}
9069a3817d82b0 Jiri Pirko    2019-02-07  926  
9069a3817d82b0 Jiri Pirko    2019-02-07  927  	objagg2 = objagg_create(&delta_ops, hints, &world2);
951d3d6fcd72f1 Dan Carpenter 2019-02-13  928  	if (IS_ERR(objagg2))
951d3d6fcd72f1 Dan Carpenter 2019-02-13  929  		return PTR_ERR(objagg2);
9069a3817d82b0 Jiri Pirko    2019-02-07  930  
9069a3817d82b0 Jiri Pirko    2019-02-07  931  	for (i = 0; i < hints_case->key_ids_count; i++) {
9069a3817d82b0 Jiri Pirko    2019-02-07  932  		objagg_obj = world_obj_get(&world2, objagg2,
9069a3817d82b0 Jiri Pirko    2019-02-07  933  					   hints_case->key_ids[i]);
9069a3817d82b0 Jiri Pirko    2019-02-07  934  		if (IS_ERR(objagg_obj)) {
9069a3817d82b0 Jiri Pirko    2019-02-07  935  			err = PTR_ERR(objagg_obj);
9069a3817d82b0 Jiri Pirko    2019-02-07  936  			goto err_world2_obj_get;
9069a3817d82b0 Jiri Pirko    2019-02-07  937  		}
9069a3817d82b0 Jiri Pirko    2019-02-07  938  	}
9069a3817d82b0 Jiri Pirko    2019-02-07  939  
9069a3817d82b0 Jiri Pirko    2019-02-07  940  	pr_debug_stats(objagg2);
9069a3817d82b0 Jiri Pirko    2019-02-07  941  	err = check_expect_stats(objagg2, &hints_case->expect_stats_hints,
9069a3817d82b0 Jiri Pirko    2019-02-07  942  				 &errmsg);
9069a3817d82b0 Jiri Pirko    2019-02-07  943  	if (err) {
9069a3817d82b0 Jiri Pirko    2019-02-07  944  		pr_err("Stats2: %s\n", errmsg);
9069a3817d82b0 Jiri Pirko    2019-02-07  945  		goto err_check_expect_stats2;
9069a3817d82b0 Jiri Pirko    2019-02-07  946  	}
9069a3817d82b0 Jiri Pirko    2019-02-07  947  
9069a3817d82b0 Jiri Pirko    2019-02-07  948  	err = 0;
9069a3817d82b0 Jiri Pirko    2019-02-07  949  
9069a3817d82b0 Jiri Pirko    2019-02-07  950  err_check_expect_stats2:
9069a3817d82b0 Jiri Pirko    2019-02-07  951  err_world2_obj_get:
9069a3817d82b0 Jiri Pirko    2019-02-07  952  	for (i--; i >= 0; i--)
9069a3817d82b0 Jiri Pirko    2019-02-07  953  		world_obj_put(&world2, objagg, hints_case->key_ids[i]);
9069a3817d82b0 Jiri Pirko    2019-02-07  954  	i = hints_case->key_ids_count;
a6379f0ad6375a Aditya Pakki  2020-06-12  955  	objagg_destroy(objagg2);
8c8f1e89eb88d4 Arnd Bergmann 2025-06-20  956  
8c8f1e89eb88d4 Arnd Bergmann 2025-06-20  957  	return err;
8c8f1e89eb88d4 Arnd Bergmann 2025-06-20  958  }
8c8f1e89eb88d4 Arnd Bergmann 2025-06-20  959  

:::::: The code at line 923 was first introduced by commit
:::::: 9069a3817d82b01b3a55da382c774e3575946130 lib: objagg: implement optimization hints assembly and use hints for object creation

:::::: TO: Jiri Pirko <jiri@mellanox.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
