Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EDE13D296
	for <oe-kbuild@lists.linux.dev>; Sun,  6 Oct 2024 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728226825; cv=none; b=kxXna6XHv8B5NYoij1qOs/P2j/t438tZtrFgAfSWm6/Voom2VIR7RNRLgmUrSEge1U7YlqN/x+VLEPqwO9mjOsvZEPzxWqQWK38EK7O+cMTchMz0QIDjiZyepTWabhHZe1+VSdo9LvkO9huAXUylx8jSbDA7PB4KVxoWt24N/Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728226825; c=relaxed/simple;
	bh=u17ryF/o0RNsK7PtH+nWe0BqM4C/cEeG8IIaXHyFsx4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D4fgPUb88HQOH8gfZUIP7FLj9Xo3FVl8ydUhvV3MJj2/vK7bhxlAT/n8r/JycRPhBY22f8TbJgxoDfJXiq0PusIsbnJnrdwdl/9IETm2R68XI6WRNY+7ALAdX6wFUjxY6Q4KMQV3Enp2A0wStAlZ6W15q6FUSqi/b6hdcF/QLD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TmeQrzUe; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TmeQrzUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728226823; x=1759762823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u17ryF/o0RNsK7PtH+nWe0BqM4C/cEeG8IIaXHyFsx4=;
  b=TmeQrzUeT+0YBlzxMwF4OtsEiQXk5jkzyR5lHS9rxqgbp9r2EEokRSTv
   H6lW82cZ6qIAkiHneLfDyAhgg97yOZGiZxZ+MIaFL6wbIlRX7atEsJipH
   ofkzLwtxwCC0fMW/ED+6jqeFogsGQcH93X9ld7dt+zKcOGRgtmqhqiaHA
   K6FFZ4PNntTjoJvIm4mItOHbjkslGqL9mIyVD/FObCvJJXVGy+w7SZvx4
   J1hydH87+heKc1EOOBqCUw8Nw8/9qVLBblreg9uQWHcloReTsJ7cPhyO/
   qUJomK3px4/7L68weE+XF0S2x8l7UQrOHpsXMgxQ6umYF0Qgs8+L9wtdR
   g==;
X-CSE-ConnectionGUID: sxGg1UjVQzGpbwGijcragw==
X-CSE-MsgGUID: 9xJ2PyZIQEaeDQjjEFMZFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11217"; a="44908865"
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="44908865"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2024 08:00:22 -0700
X-CSE-ConnectionGUID: 78hzZ5A6RtefXdJeO2YX+A==
X-CSE-MsgGUID: jrDx8rhwTt2dO9tAg8IMZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,182,1725346800"; 
   d="scan'208";a="79800729"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Oct 2024 08:00:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxSk7-0003zA-0z;
	Sun, 06 Oct 2024 15:00:19 +0000
Date: Sun, 6 Oct 2024 22:59:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/ext4/mballoc.c:4597:47-50: opportunity for str_yes_no(ret)
Message-ID: <202410062256.BoynX3c2-lkp@intel.com>
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
TO: Ritesh Harjani <riteshh@linux.ibm.com>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f602276d3902642fdc3429b548d73c745446601
commit: 07b5b8e1ac4004b7db1065a301df65cd434c31c9 ext4: mballoc: introduce pcpu seqcnt for freeing PA to improve ENOSPC handling
date:   4 years, 4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 years, 4 months ago
config: x86_64-randconfig-102-20241006 (https://download.01.org/0day-ci/archive/20241006/202410062256.BoynX3c2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410062256.BoynX3c2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ext4/mballoc.c:4597:47-50: opportunity for str_yes_no(ret)

vim +4597 fs/ext4/mballoc.c

c9de560ded61fa Alex Tomas     2008-01-29  4577  
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4578  static bool ext4_mb_discard_preallocations_should_retry(struct super_block *sb,
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4579  			struct ext4_allocation_context *ac, u64 *seq)
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4580  {
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4581  	int freed;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4582  	u64 seq_retry = 0;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4583  	bool ret = false;
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4584  
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4585  	freed = ext4_mb_discard_preallocations(sb, ac->ac_o_ex.fe_len);
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4586  	if (freed) {
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4587  		ret = true;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4588  		goto out_dbg;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4589  	}
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4590  	seq_retry = ext4_get_discard_pa_seq_sum();
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4591  	if (seq_retry != *seq) {
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4592  		*seq = seq_retry;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4593  		ret = true;
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4594  	}
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4595  
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4596  out_dbg:
07b5b8e1ac4004 Ritesh Harjani 2020-05-20 @4597  	mb_debug(sb, "freed %d, retry ? %s\n", freed, ret ? "yes" : "no");
07b5b8e1ac4004 Ritesh Harjani 2020-05-20  4598  	return ret;
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4599  }
cf5e2ca6c99077 Ritesh Harjani 2020-05-20  4600  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
