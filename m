Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B675A3208
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Dec 2024 18:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735151332; cv=none; b=FI9nFsDFTfhgnauktn9V9RcdfYbbE5hV/18rA2K+bLwIazCzGvpYv2oePiFTuEtEBXutY883HE1pw7u8i9wwqNHlaqIXx1GqzEwwM4WQcElYpQftLEWuhi+k92U723PWGCqFywA2zBm0qQigtrbg5aS71Oguv1ZhD5EqbvIVowg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735151332; c=relaxed/simple;
	bh=226YlJVAhBAIjh9oYcXtkwol4Hr9Z/60uC5i/o0A6Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZvzCrQo0dSrAQ6/QqfH8Ywc9FBDlR9Y5Tv5myPZ58ROvh3nqOfK3sY4sytP3K4PKmVv9e4YKvNZheDSZ3Wo9h6KV2HjmByq+0LWMDeKd24GukHcB/bGHbP98JoRPo317ch5/ViS7E6KpZPzbTlHk2DaOgwnL8YsW/OfVdIeEgTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IH/uL83U; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IH/uL83U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735151330; x=1766687330;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=226YlJVAhBAIjh9oYcXtkwol4Hr9Z/60uC5i/o0A6Qg=;
  b=IH/uL83URmfkKk8esliGya30v6JjH/BzZQzh5eDMFzZCTegijZl24YJ7
   hY3+qH7xg6ynUYG5YTLVliryDTH63/2+xXvrryoUhdEXSj2+et91ym5cN
   yEG2CmzlfpX7EAV9J5rFBWjoj33o9j6c3ar2c8bspRuUl7JF526bWuz2m
   /o4KsAt5xRGTZ9iUyLWuFeUD6s/yIgUDMny9CrcQty+vDDgW9LfIubxak
   Cw/dLw1X7g2cyb8IpKC9Kfurs7/PCPv8RSxxRvWpIhNUxvFs8y9+diuro
   p+GvnaZ27/qKq84z0UnP9qwB4zUeqLO7fVVk5NJWXsY/5XgnvEqgziy1p
   Q==;
X-CSE-ConnectionGUID: KvqwpZsCQPOTPk7dnrjtrw==
X-CSE-MsgGUID: /qFN7w8ZQMi/7PifAXOFew==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35708173"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="35708173"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 10:28:49 -0800
X-CSE-ConnectionGUID: 2ky/TLmGTn6FNdNObJ7pHw==
X-CSE-MsgGUID: DgVJL4OTQn6lPv9kgB5DkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="99504946"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Dec 2024 10:28:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQW7i-00024u-0E;
	Wed, 25 Dec 2024 18:28:46 +0000
Date: Thu, 26 Dec 2024 02:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: kernel/bpf/kmem_cache_iter.c:48:8-9: ERROR: invalid reference to the
 index variable of the iterator on line 30
Message-ID: <202412260245.DCtZxKec-lkp@intel.com>
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
TO: Namhyung Kim <namhyung@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b2ffa6148b1e4468d08f7e0e7e371c43cac9ffe
commit: 4971266e1595f76be3f844c834c1f9357a97dbde bpf: Add kmem_cache iterator
date:   2 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 2 months ago
config: powerpc-randconfig-r052-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260245.DCtZxKec-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 9daf10ff8f29ba3a88a105aaa9d2379c21b77d35)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412260245.DCtZxKec-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/kmem_cache_iter.c:48:8-9: ERROR: invalid reference to the index variable of the iterator on line 30

vim +48 kernel/bpf/kmem_cache_iter.c

4971266e1595f7 Namhyung Kim 2024-10-10  15  
4971266e1595f7 Namhyung Kim 2024-10-10  16  static void *kmem_cache_iter_seq_start(struct seq_file *seq, loff_t *pos)
4971266e1595f7 Namhyung Kim 2024-10-10  17  {
4971266e1595f7 Namhyung Kim 2024-10-10  18  	loff_t cnt = 0;
4971266e1595f7 Namhyung Kim 2024-10-10  19  	bool found = false;
4971266e1595f7 Namhyung Kim 2024-10-10  20  	struct kmem_cache *s;
4971266e1595f7 Namhyung Kim 2024-10-10  21  
4971266e1595f7 Namhyung Kim 2024-10-10  22  	mutex_lock(&slab_mutex);
4971266e1595f7 Namhyung Kim 2024-10-10  23  
4971266e1595f7 Namhyung Kim 2024-10-10  24  	/* Find an entry at the given position in the slab_caches list instead
4971266e1595f7 Namhyung Kim 2024-10-10  25  	 * of keeping a reference (of the last visited entry, if any) out of
4971266e1595f7 Namhyung Kim 2024-10-10  26  	 * slab_mutex. It might miss something if one is deleted in the middle
4971266e1595f7 Namhyung Kim 2024-10-10  27  	 * while it releases the lock.  But it should be rare and there's not
4971266e1595f7 Namhyung Kim 2024-10-10  28  	 * much we can do about it.
4971266e1595f7 Namhyung Kim 2024-10-10  29  	 */
4971266e1595f7 Namhyung Kim 2024-10-10 @30  	list_for_each_entry(s, &slab_caches, list) {
4971266e1595f7 Namhyung Kim 2024-10-10  31  		if (cnt == *pos) {
4971266e1595f7 Namhyung Kim 2024-10-10  32  			/* Make sure this entry remains in the list by getting
4971266e1595f7 Namhyung Kim 2024-10-10  33  			 * a new reference count.  Note that boot_cache entries
4971266e1595f7 Namhyung Kim 2024-10-10  34  			 * have a negative refcount, so don't touch them.
4971266e1595f7 Namhyung Kim 2024-10-10  35  			 */
4971266e1595f7 Namhyung Kim 2024-10-10  36  			if (s->refcount > 0)
4971266e1595f7 Namhyung Kim 2024-10-10  37  				s->refcount++;
4971266e1595f7 Namhyung Kim 2024-10-10  38  			found = true;
4971266e1595f7 Namhyung Kim 2024-10-10  39  			break;
4971266e1595f7 Namhyung Kim 2024-10-10  40  		}
4971266e1595f7 Namhyung Kim 2024-10-10  41  		cnt++;
4971266e1595f7 Namhyung Kim 2024-10-10  42  	}
4971266e1595f7 Namhyung Kim 2024-10-10  43  	mutex_unlock(&slab_mutex);
4971266e1595f7 Namhyung Kim 2024-10-10  44  
4971266e1595f7 Namhyung Kim 2024-10-10  45  	if (!found)
4971266e1595f7 Namhyung Kim 2024-10-10  46  		return NULL;
4971266e1595f7 Namhyung Kim 2024-10-10  47  
4971266e1595f7 Namhyung Kim 2024-10-10 @48  	return s;
4971266e1595f7 Namhyung Kim 2024-10-10  49  }
4971266e1595f7 Namhyung Kim 2024-10-10  50  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
