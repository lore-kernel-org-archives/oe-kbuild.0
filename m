Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C0A12CD88
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Oct 2024 03:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729827703; cv=none; b=bez6B1L00aauakXewHoNRvG9l5im+ZIh/CWr9PDo43wDYfHw08EW2fK4rRuGhpNG71Y07f0TbmP4r3duwFg996V50r0jjdrtVxtRyGJMiUQjy+7FwaLJwyvrd+OqkirwmtZSk/y04aBRfB3tjiBcCyAJeYVANIE6PzATq+PU8S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729827703; c=relaxed/simple;
	bh=WMN7uORcstezwuvXxKxWzclXAtLL3h73h9MH1EwGJQM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=efvWXFKE6AyV5+6lGLLHPJOJ0NLjxNe7QbTkxPiyRCQAgs3HdeGy9Gf9r2nWlZEgVTrSNz0AoHZehGTEWOwrX7e/JUyphiucuugMpFZYwhovoQutVjIFbQQfVoZkvOmi2jukAI8TnM79EnSv/033oNIvIOGJeTu4Hpx0Gin8XnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFmJsCtO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFmJsCtO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729827701; x=1761363701;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WMN7uORcstezwuvXxKxWzclXAtLL3h73h9MH1EwGJQM=;
  b=lFmJsCtOYOSC46og6OhQ/7xAAMgSuzLp8Yga5BtDVPBzh5X0w33AMu85
   MTgHYd+Yddx8r8C6c5fqNB/uWx5wbJcRlIu0VsAIMFDIx+4qYkRRRwgzm
   sqmvZy61G3BcCaYdZ+q56hMMWgdvSgIBz4vvIKA4/9MYyRt+Mxux/liXC
   HWiavYMyoSNGM4qlFN4ujDt4FGCPQDDmeSffjv/gcAbcvf3B3TrwGAQej
   INpYRcx7HZ0EntVP1/2mHnO0cvST9qaC9YPsc/xFfyr8VMISCHdbvBK7+
   UWqeHaXvzujO4sTzbht7YMclmnHn5KRUoXabTD7nEt5am0SSOscFRKyWl
   g==;
X-CSE-ConnectionGUID: 1zU6QXgjSRil7P3esR44dA==
X-CSE-MsgGUID: 58wOgdn6TEm+ofrJE9k4ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29347608"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29347608"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 20:41:41 -0700
X-CSE-ConnectionGUID: oiH12sA4R9areoY233/XIA==
X-CSE-MsgGUID: sAmjk3UoSuugve9Ta92BlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="111633858"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Oct 2024 20:41:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t4BCj-000XXo-16;
	Fri, 25 Oct 2024 03:41:37 +0000
Date: Fri, 25 Oct 2024 11:40:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/2] wifi: ath10k: Flush only requested txq in
 ath10k_flush()
Message-ID: <202410251152.A5axJliR-lkp@intel.com>
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
In-Reply-To: <0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk@triplefau.lt>
References: <0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk@triplefau.lt>
TO: Remi Pommarel <repk@triplefau.lt>
TO: ath10k@lists.infradead.org
TO: linux-wireless@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: Kalle Valo <kvalo@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>
CC: Cedric Veilleux <veilleux.cedric@gmail.com>
CC: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
CC: Remi Pommarel <repk@triplefau.lt>

Hi Remi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on ath/ath-next]
[also build test WARNING on wireless/main wireless-next/main linus/master v6.12-rc4 next-20241024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Remi-Pommarel/wifi-ath10k-Implement-ieee80211-flush_sta-callback/20241022-172038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath-next
patch link:    https://lore.kernel.org/r/0f55986ebe34f2b5aa4ccbcb0bed445324099fbd.1729586267.git.repk%40triplefau.lt
patch subject: [PATCH v2 2/2] wifi: ath10k: Flush only requested txq in ath10k_flush()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: parisc-randconfig-r071-20241024 (https://download.01.org/0day-ci/archive/20241025/202410251152.A5axJliR-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410251152.A5axJliR-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath10k/mac.c:8076 _ath10k_mac_wait_tx_complete() error: uninitialized symbol 'empty'.
drivers/net/wireless/ath/ath10k/mac.c:8076 _ath10k_mac_wait_tx_complete() error: uninitialized symbol 'empty'.

Old smatch warnings:
drivers/net/wireless/ath/ath10k/mac.c:5191 ath10k_start() warn: missing error code 'ret'

vim +/empty +8076 drivers/net/wireless/ath/ath10k/mac.c

92092fe528e79c Michal Kazior     2015-08-03  8061  
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8062  static void _ath10k_mac_wait_tx_complete(struct ath10k *ar,
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8063  					 unsigned long queues)
5e3dd157d7e70f Kalle Valo        2013-06-12  8064  {
affd321733eebc Michal Kazior     2013-07-16  8065  	bool skip;
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8066  	long time_left;
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8067  	unsigned int q;
5e3dd157d7e70f Kalle Valo        2013-06-12  8068  
5e3dd157d7e70f Kalle Valo        2013-06-12  8069  	/* mac80211 doesn't care if we really xmit queued frames or not
d6dfe25c8bb200 Marcin Rokicki    2017-02-20  8070  	 * we'll collect those frames either way if we stop/delete vdevs
d6dfe25c8bb200 Marcin Rokicki    2017-02-20  8071  	 */
548db54cc1890b Michal Kazior     2013-07-05  8072  
affd321733eebc Michal Kazior     2013-07-16  8073  	if (ar->state == ATH10K_STATE_WEDGED)
828853ac58265c Wen Gong          2018-08-28  8074  		return;
affd321733eebc Michal Kazior     2013-07-16  8075  
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15 @8076  	time_left = wait_event_timeout(ar->htt.empty_tx_wq, ({
5e3dd157d7e70f Kalle Valo        2013-06-12  8077  			bool empty;
affd321733eebc Michal Kazior     2013-07-16  8078  
edb8236df4d042 Michal Kazior     2013-07-05  8079  			spin_lock_bh(&ar->htt.tx_lock);
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8080  			for_each_set_bit(q, &queues, ar->hw->queues) {
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8081  				empty = (ar->htt.num_pending_per_queue[q] == 0);
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8082  				if (!empty)
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8083  					break;
c4f7022f0ef0aa Remi Pommarel     2024-10-22  8084  			}
edb8236df4d042 Michal Kazior     2013-07-05  8085  			spin_unlock_bh(&ar->htt.tx_lock);
affd321733eebc Michal Kazior     2013-07-16  8086  
7962b0d898accd Michal Kazior     2014-10-28  8087  			skip = (ar->state == ATH10K_STATE_WEDGED) ||
7962b0d898accd Michal Kazior     2014-10-28  8088  			       test_bit(ATH10K_FLAG_CRASH_FLUSH,
7962b0d898accd Michal Kazior     2014-10-28  8089  					&ar->dev_flags);
affd321733eebc Michal Kazior     2013-07-16  8090  
affd321733eebc Michal Kazior     2013-07-16  8091  			(empty || skip);
5e3dd157d7e70f Kalle Valo        2013-06-12  8092  		}), ATH10K_FLUSH_TIMEOUT_HZ);
affd321733eebc Michal Kazior     2013-07-16  8093  
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8094  	if (time_left == 0 || skip)
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8095  		ath10k_warn(ar, "failed to flush transmit queue (skip %i ar-state %i): %ld\n",
d4298a3a8c92a1 Nicholas Mc Guire 2015-06-15  8096  			    skip, ar->state, time_left);
828853ac58265c Wen Gong          2018-08-28  8097  }
548db54cc1890b Michal Kazior     2013-07-05  8098  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
