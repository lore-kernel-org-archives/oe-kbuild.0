Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE0339854
	for <oe-kbuild@lists.linux.dev>; Tue, 16 Dec 2025 14:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895639; cv=none; b=lC0FS+0aqXTC7H0RVobrh746/7pfvyokCa3HNNJo4NOZf/FV65ckr4nrPabwWLlg56ZzXng26hUqveqO3h5tcJbK6vfWamFKEY9cFcfknYAhAbeLqsD3knEtAc7YAqVe6CBIQANx9/kNZhQGyFdnz9n98J7VF9rKjGqL/bzyDYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895639; c=relaxed/simple;
	bh=2yJ6TH1SAN2KLyLO5ON3u5TcXBcWwgqG7gUwen0li1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HodX1Km/cu/FpGM1W0+VNo738uf1E4lvxuEd6G2+9S6PPLl3eyRkuLPmpOT7FlrxLEpi0/LHTlRTB+m4KTu/X0eQaaf1oRu5JHoEhv9OEQoTGciH5HDA2Z7wIiO0vM2nBysMipYvPpF6hTRAqc4QG4hC/n6uAoFIlM2ycFo57Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMEHjFTw; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMEHjFTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765895637; x=1797431637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2yJ6TH1SAN2KLyLO5ON3u5TcXBcWwgqG7gUwen0li1Y=;
  b=AMEHjFTwh2nDCiQ8J3gSNXlNTxDBXHlJ4X+uZ+9ArxAwxv0ivfOoZBTc
   q6wUtdpSsQ8wxeiln4M6e6yv+468xbc1ijF2LE19cZWyCMbH/CHs/Yp15
   bvZNKGVbLUJxRyVGM1fIvUYa8v1Ev+0IQ9GiuxokwMjGdxt11aFfM6Y7v
   1aJ+RJiM2UfsSL3yCRFsfWq6xk5SRNR4pJQ/74KWs4U/47eU+dj+6bFpL
   7a22L4ygBZOIvMXfeOSo/6WY1ZsPLMHhV9DfODsh/Ji6twpF7XzBo8kWN
   hMlZiWwL5xLRCMBBngQ6lul0AFm6xupKss740WeWBWRjyvSjilFLBmTYS
   w==;
X-CSE-ConnectionGUID: sZqvx79iRYGvDu3I6+wUTg==
X-CSE-MsgGUID: q0PhsOWMS8OFBjFBjNtVTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78527407"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78527407"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 06:33:56 -0800
X-CSE-ConnectionGUID: bXL7iwvcTQeW3wZF9vV0xQ==
X-CSE-MsgGUID: CS6LeImoTqG9UvHzi/sbGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198019373"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 06:33:54 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVW7Z-000000003LV-10eH;
	Tue, 16 Dec 2025 14:33:49 +0000
Date: Tue, 16 Dec 2025 22:32:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/ralink/rt2x00/rt2x00queue.c:1257
 rt2x00queue_allocate() warn: potentially one past the end of array 'queue[2
 + rt2x00dev->ops->tx_queues]'
Message-ID: <202512162212.vzOnVShQ-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   40fbbd64bba6c6e7a72885d2f59b6a3be9991eeb
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   11 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 11 months ago
config: microblaze-randconfig-r073-20251216 (https://download.01.org/0day-ci/archive/20251216/202512162212.vzOnVShQ-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512162212.vzOnVShQ-lkp@intel.com/

smatch warnings:
drivers/net/wireless/ralink/rt2x00/rt2x00queue.c:1257 rt2x00queue_allocate() warn: potentially one past the end of array 'queue[2 + rt2x00dev->ops->tx_queues]'

vim +1257 drivers/net/wireless/ralink/rt2x00/rt2x00queue.c

8f539276ee97bd drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-10  1230  
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1231  int rt2x00queue_allocate(struct rt2x00_dev *rt2x00dev)
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1232  {
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1233  	struct data_queue *queue;
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1234  	enum data_queue_qid qid;
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1235  	unsigned int req_atim =
b9d305cc47407f drivers/net/wireless/rt2x00/rt2x00queue.c        Fred Chou            2014-12-26  1236  	    rt2x00_has_cap_flag(rt2x00dev, REQUIRE_ATIM_QUEUE);
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1237  
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1238  	/*
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1239  	 * We need the following queues:
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1240  	 * RX: 1
61448f88078e81 drivers/net/wireless/rt2x00/rt2x00queue.c        Gertjan van Wingerde 2008-05-10  1241  	 * TX: ops->tx_queues
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1242  	 * Beacon: 1
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1243  	 * Atim: 1 (if required)
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1244  	 */
61448f88078e81 drivers/net/wireless/rt2x00/rt2x00queue.c        Gertjan van Wingerde 2008-05-10  1245  	rt2x00dev->data_queues = 2 + rt2x00dev->ops->tx_queues + req_atim;
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1246  
baeb2ffab4e67b drivers/net/wireless/rt2x00/rt2x00queue.c        Joe Perches          2010-08-11  1247  	queue = kcalloc(rt2x00dev->data_queues, sizeof(*queue), GFP_KERNEL);
cd7c0cdab7ff2d drivers/net/wireless/ralink/rt2x00/rt2x00queue.c Markus Elfring       2017-12-29  1248  	if (!queue)
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1249  		return -ENOMEM;
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1250  
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1251  	/*
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1252  	 * Initialize pointers
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1253  	 */
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1254  	rt2x00dev->rx = queue;
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1255  	rt2x00dev->tx = &queue[1];
61448f88078e81 drivers/net/wireless/rt2x00/rt2x00queue.c        Gertjan van Wingerde 2008-05-10  1256  	rt2x00dev->bcn = &queue[1 + rt2x00dev->ops->tx_queues];
e74df4a7562da5 drivers/net/wireless/rt2x00/rt2x00queue.c        Gertjan van Wingerde 2011-03-03 @1257  	rt2x00dev->atim = req_atim ? &queue[2 + rt2x00dev->ops->tx_queues] : NULL;
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1258  
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1259  	/*
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1260  	 * Initialize queue parameters.
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1261  	 * RX: qid = QID_RX
f615e9a38a8e62 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2010-12-13  1262  	 * TX: qid = QID_AC_VO + index
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1263  	 * TX: cw_min: 2^5 = 32.
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1264  	 * TX: cw_max: 2^10 = 1024.
565a019ac635d4 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-06-03  1265  	 * BCN: qid = QID_BEACON
565a019ac635d4 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-06-03  1266  	 * ATIM: qid = QID_ATIM
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1267  	 */
8f539276ee97bd drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-10  1268  	rt2x00queue_init(rt2x00dev, rt2x00dev->rx, QID_RX);
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1269  
f615e9a38a8e62 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2010-12-13  1270  	qid = QID_AC_VO;
8f539276ee97bd drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-10  1271  	tx_queue_for_each(rt2x00dev, queue)
8f539276ee97bd drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-10  1272  		rt2x00queue_init(rt2x00dev, queue, qid++);
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1273  
e74df4a7562da5 drivers/net/wireless/rt2x00/rt2x00queue.c        Gertjan van Wingerde 2011-03-03  1274  	rt2x00queue_init(rt2x00dev, rt2x00dev->bcn, QID_BEACON);
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1275  	if (req_atim)
e74df4a7562da5 drivers/net/wireless/rt2x00/rt2x00queue.c        Gertjan van Wingerde 2011-03-03  1276  		rt2x00queue_init(rt2x00dev, rt2x00dev->atim, QID_ATIM);
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1277  
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1278  	return 0;
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1279  }
181d6902b6bad9 drivers/net/wireless/rt2x00/rt2x00queue.c        Ivo van Doorn        2008-02-05  1280  

:::::: The code at line 1257 was first introduced by commit
:::::: e74df4a7562da56a7e4dbf41ff167b2f44e84a50 rt2x00: Don't treat ATIM queue as second beacon queue.

:::::: TO: Gertjan van Wingerde <gwingerde@gmail.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
