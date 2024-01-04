Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9821DDEE
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Jan 2024 07:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ha64/33U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704352060; x=1735888060;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPidWpw7bnX7BnfyWX+6Oi2ULajFfVTx5tCQ4oGaDM0=;
  b=Ha64/33UHhhodXd7jTspd9neSjojYDQsRtLU+ER7cXS2vwXx4ZPFMNAm
   RDpu46E4T+JMc66U56WSEGj0AvFMKpexRWuOXTQzGMs1Ma4+rk7cNlDTk
   2C01lGirsVoA5JwTYS1Wi7DQaLvoPFqwAKLml0yaWvP8fh/lXAwPWGNDI
   ghzU6IOJLnmsBDPIG6MGaQFVQkdPPL6KPo6oCF9RZDCmCDmzpAMcCnD9g
   FF2NzBtxeUJpffLeM6qXpPeDWhKzgAUf/I6rJulQWNRVBxlCbZuKphn1N
   luzXXibBgH8Apkj8d/Uhf2MsdZNVAcIiNsohcXio8k+TWLbFgjXlu29qx
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="399919976"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="399919976"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 23:07:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10942"; a="756489462"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="756489462"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 03 Jan 2024 23:07:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLHp9-000N0K-17;
	Thu, 04 Jan 2024 07:07:27 +0000
Date: Thu, 4 Jan 2024 15:07:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [linux-next:master 11864/12403]
 drivers/net/ethernet/broadcom/bnxt/bnxt.c:5333:6-25: WARNING:
 atomic_dec_and_test variation before object free at line 5336.
Message-ID: <202401041542.7OAahgqF-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Michael Chan <michael.chan@broadcom.com>
CC: Vasundhara Volam <vasundhara-v.volam@broadcom.com>
CC: Andy Gospodarek <andrew.gospodarek@broadcom.com>
CC: Pavan Chebbi <pavan.chebbi@broadcom.com>
CC: Simon Horman <horms@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d0b3c8aa5e37775cd7c3ac07b256218df0fd6678
commit: 1f6e77cb9b328f2ec145e73be97cab6fec838678 [11864/12403] bnxt_en: Add bnxt_l2_filter hash table.
:::::: branch date: 2 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r053-20240104 (https://download.01.org/0day-ci/archive/20240104/202401041542.7OAahgqF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401041542.7OAahgqF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/broadcom/bnxt/bnxt.c:5333:6-25: WARNING: atomic_dec_and_test variation before object free at line 5336.

vim +5333 drivers/net/ethernet/broadcom/bnxt/bnxt.c

c0c050c58d8409 Michael Chan 2015-10-22  5330  
1f6e77cb9b328f Michael Chan 2023-12-22  5331  void bnxt_del_l2_filter(struct bnxt *bp, struct bnxt_l2_filter *fltr)
1f6e77cb9b328f Michael Chan 2023-12-22  5332  {
1f6e77cb9b328f Michael Chan 2023-12-22 @5333  	if (!atomic_dec_and_test(&fltr->refcnt))
1f6e77cb9b328f Michael Chan 2023-12-22  5334  		return;
1f6e77cb9b328f Michael Chan 2023-12-22  5335  	spin_lock_bh(&bp->ntp_fltr_lock);
1f6e77cb9b328f Michael Chan 2023-12-22 @5336  	hlist_del_rcu(&fltr->base.hash);
1f6e77cb9b328f Michael Chan 2023-12-22  5337  	if (fltr->base.flags) {
1f6e77cb9b328f Michael Chan 2023-12-22  5338  		clear_bit(fltr->base.sw_id, bp->ntp_fltr_bmap);
1f6e77cb9b328f Michael Chan 2023-12-22  5339  		bp->ntp_fltr_count--;
1f6e77cb9b328f Michael Chan 2023-12-22  5340  	}
1f6e77cb9b328f Michael Chan 2023-12-22  5341  	spin_unlock_bh(&bp->ntp_fltr_lock);
1f6e77cb9b328f Michael Chan 2023-12-22  5342  	kfree_rcu(fltr, base.rcu);
1f6e77cb9b328f Michael Chan 2023-12-22  5343  }
1f6e77cb9b328f Michael Chan 2023-12-22  5344  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
