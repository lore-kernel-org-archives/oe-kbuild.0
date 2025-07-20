Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB963FE4
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Jul 2025 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753019060; cv=none; b=LcUYfIJ+OWCoV4gPn9/xPWjLiZzUHMJ0CDuEsLGJl/hqY7K4Y0nSApKCRsofcy/fTUPJFIwcI0n/+xPItzSyIv7BtWnzXygN1TJkNfImUsfKyjzap5bwAvobF9TLbZix5iVfOnEtaSBhyGLH+tGC6PEwxHLvNaFf9Pqn1ZqMGEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753019060; c=relaxed/simple;
	bh=h2Bi3ntruOoZLwk5kENEROzte3S7HhNJA6ho5P0YOt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RltUsaJvDHK8yjzIr6DQfQFlMwddAN96X63vyEMRsOOPmvQL85oRmEX1rrQjCPjszufW7/oe/MxFMm6EyZ/EQUNTOHRglJzLI35+ILXSOH89Xb1cIBsgwMbY/JhgCUSygUlcYntefcNUiVdQAY2+fWoJvdzBzZoL/SM6b2Hpigc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKy16VcJ; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKy16VcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753019059; x=1784555059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2Bi3ntruOoZLwk5kENEROzte3S7HhNJA6ho5P0YOt8=;
  b=bKy16VcJfSZTQHmV46vEfhDr228I7tjxo78xv8UT6J4TjlPoytymX4T2
   YYXsmtpc6JgvhpL2825TC7n/0naX71gZjNqn4mJZ6bG1XRyMIPSDrLAEM
   bKTIeZlXAmsx0tuyAaI2j79GcPQwQ1pLvpaLjX9TMYvd7yLW4OTYkVdt1
   2cvYVz7gOMLKiJ+RKdLwt5DNv4Nvt/azkp4GDRirye9tBZjktffLqJg3G
   vt8lpsvYhBeGmXVepaKu3GiQl9vF2ukuhAZjDeljjN+dwSaoBXYKpDHtM
   HSMn3spSFEMgUgHfpvUGsaaaIrCHhqkMlfm3OX1DM0dKuqLSS4HLMVleA
   g==;
X-CSE-ConnectionGUID: WmnTagXqQROH/oetKXJQKA==
X-CSE-MsgGUID: waSfZHKcRMyQHhD2MdlZ1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11498"; a="55128384"
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="55128384"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2025 06:44:16 -0700
X-CSE-ConnectionGUID: 669onYnpSKmpdo3GWBK3Qw==
X-CSE-MsgGUID: TaFqIR26SEGUdUdH3jwFWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,327,1744095600"; 
   d="scan'208";a="157934283"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jul 2025 06:44:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udUKq-000G8P-0Y;
	Sun, 20 Jul 2025 13:44:12 +0000
Date: Sun, 20 Jul 2025 21:43:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [bcachefs:master 8/212] fs/bcachefs/journal.c:1091
 __bch2_next_write_buffer_flush_journal_buf() warn: 'ret' is an error pointer
 or valid
Message-ID: <202507202116.ELQyRxI3-lkp@intel.com>
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
CC: Kent Overstreet <kent.overstreet@linux.dev>
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   d156fb9d839cefc9bfff54b421e93c9178afc40f
commit: a911a076477d96cc41e74e849af6960b2c5694c3 [8/212] bcachefs: Add missing barriers around journal reservations
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250720 (https://download.01.org/0day-ci/archive/20250720/202507202116.ELQyRxI3-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507202116.ELQyRxI3-lkp@intel.com/

smatch warnings:
fs/bcachefs/journal.c:1091 __bch2_next_write_buffer_flush_journal_buf() warn: 'ret' is an error pointer or valid

vim +/ret +1091 fs/bcachefs/journal.c

768ac63924775d Kent Overstreet 2019-02-14  1059  
0eaac0b44fa93a Kent Overstreet 2024-04-23  1060  static struct journal_buf *__bch2_next_write_buffer_flush_journal_buf(struct journal *j,
0eaac0b44fa93a Kent Overstreet 2024-04-23  1061  						u64 max_seq, bool *blocked)
09caeabe1a5daa Kent Overstreet 2023-11-02  1062  {
09caeabe1a5daa Kent Overstreet 2023-11-02  1063  	struct journal_buf *ret = NULL;
09caeabe1a5daa Kent Overstreet 2023-11-02  1064  
72e71bf0298c7e Kent Overstreet 2024-05-06  1065  	/* We're inside wait_event(), but using mutex_lock(: */
72e71bf0298c7e Kent Overstreet 2024-05-06  1066  	sched_annotate_sleep();
09caeabe1a5daa Kent Overstreet 2023-11-02  1067  	mutex_lock(&j->buf_lock);
09caeabe1a5daa Kent Overstreet 2023-11-02  1068  	spin_lock(&j->lock);
09caeabe1a5daa Kent Overstreet 2023-11-02  1069  	max_seq = min(max_seq, journal_cur_seq(j));
09caeabe1a5daa Kent Overstreet 2023-11-02  1070  
09caeabe1a5daa Kent Overstreet 2023-11-02  1071  	for (u64 seq = journal_last_unwritten_seq(j);
09caeabe1a5daa Kent Overstreet 2023-11-02  1072  	     seq <= max_seq;
09caeabe1a5daa Kent Overstreet 2023-11-02  1073  	     seq++) {
09caeabe1a5daa Kent Overstreet 2023-11-02  1074  		unsigned idx = seq & JOURNAL_BUF_MASK;
09caeabe1a5daa Kent Overstreet 2023-11-02  1075  		struct journal_buf *buf = j->buf + idx;
09caeabe1a5daa Kent Overstreet 2023-11-02  1076  
09caeabe1a5daa Kent Overstreet 2023-11-02  1077  		if (buf->need_flush_to_write_buffer) {
09caeabe1a5daa Kent Overstreet 2023-11-02  1078  			union journal_res_state s;
09caeabe1a5daa Kent Overstreet 2023-11-02  1079  			s.v = atomic64_read_acquire(&j->reservations.counter);
09caeabe1a5daa Kent Overstreet 2023-11-02  1080  
0eaac0b44fa93a Kent Overstreet 2024-04-23  1081  			unsigned open = seq == journal_cur_seq(j) && __journal_entry_is_open(s);
0eaac0b44fa93a Kent Overstreet 2024-04-23  1082  
0eaac0b44fa93a Kent Overstreet 2024-04-23  1083  			if (open && !*blocked) {
0eaac0b44fa93a Kent Overstreet 2024-04-23  1084  				__bch2_journal_block(j);
0eaac0b44fa93a Kent Overstreet 2024-04-23  1085  				*blocked = true;
0eaac0b44fa93a Kent Overstreet 2024-04-23  1086  			}
0eaac0b44fa93a Kent Overstreet 2024-04-23  1087  
898bda5b72a72a Kent Overstreet 2025-01-23  1088  			ret = journal_state_count(s, idx & JOURNAL_STATE_BUF_MASK) > open
09caeabe1a5daa Kent Overstreet 2023-11-02  1089  				? ERR_PTR(-EAGAIN)
09caeabe1a5daa Kent Overstreet 2023-11-02  1090  				: buf;
a911a076477d96 Kent Overstreet 2025-07-17 @1091  			if (!ret)
a911a076477d96 Kent Overstreet 2025-07-17  1092  				smp_mb();
09caeabe1a5daa Kent Overstreet 2023-11-02  1093  			break;
09caeabe1a5daa Kent Overstreet 2023-11-02  1094  		}
09caeabe1a5daa Kent Overstreet 2023-11-02  1095  	}
09caeabe1a5daa Kent Overstreet 2023-11-02  1096  
09caeabe1a5daa Kent Overstreet 2023-11-02  1097  	spin_unlock(&j->lock);
09caeabe1a5daa Kent Overstreet 2023-11-02  1098  	if (IS_ERR_OR_NULL(ret))
09caeabe1a5daa Kent Overstreet 2023-11-02  1099  		mutex_unlock(&j->buf_lock);
09caeabe1a5daa Kent Overstreet 2023-11-02  1100  	return ret;
09caeabe1a5daa Kent Overstreet 2023-11-02  1101  }
09caeabe1a5daa Kent Overstreet 2023-11-02  1102  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
