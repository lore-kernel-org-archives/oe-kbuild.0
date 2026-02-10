Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860ED4C9D
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Feb 2026 04:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770697885; cv=none; b=mQbTdXIdnJ2TZaxxef08ziKeCaKuHpT2AzKOit2QHqO1Bcgn8S6yDWG0OMAaeDZdPnG0KCCfwAOMaBhx9Hbz1OBzb3KUj+WNaxkoMgWsjPX8VyIzGcQD1r7p26cxA3AhXnjGUeQ1xOfLdJ4szKGtAA78oN2frHJk4VrfUgQxS7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770697885; c=relaxed/simple;
	bh=WsO4SX5IlsI0ZfxcJJjZ9qEwak9SFP4cVJ3ptgpCu5g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UK1Xq51cRHEfQU4/+lzc/Stif7Wh155ycafWcQYczn2AUp+RVdgTRVGCA7vPnDJG+vrSesiEq9soP9YupAVxuuYr2m8dHar8El52U3PX3B200ovQZdvLqNHoZJQaCfCHPEijyIP7q5TPu0JUu4G1zqO9+Pu7NxBo8N7n/f77m9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5xThcMl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5xThcMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770697882; x=1802233882;
  h=date:from:to:cc:subject:message-id;
  bh=WsO4SX5IlsI0ZfxcJJjZ9qEwak9SFP4cVJ3ptgpCu5g=;
  b=J5xThcMlgT7LmYeaq+DaVferszND/p1yCXN+B0ovHXHGnMojoHldeo/v
   v0xSY+rTo1isepU+yLD1LxNkZVZafj+XstLQLR93/ZbH6ySzgY1aRBsCo
   JvJt777jNEI8AfJlhGDKKn4XTQSB+ObE6i59NLTv52WeyrjXM7LtOmTGh
   24i5tHQ0VV5rlQ4LdxEE4ddSguak5fuBKo5K6dsgyjTnc1Oo2wdr0t2RT
   iBgjQEIS3nDDEViISIhRKSjcKxEu4zasNZzEgIbuUi6W4tJ9TTUPAgmxD
   B/T6YeF+9AKekLGldUZoLIsmlhqBopDmaJPJd3f7zLtMLv5Yo1S//JHZm
   Q==;
X-CSE-ConnectionGUID: 6kWyXAI3RBmGX7HC4ugHTw==
X-CSE-MsgGUID: 26kRN0uGTnactI767HNOaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="59385033"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="59385033"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 20:31:21 -0800
X-CSE-ConnectionGUID: FfTcHEgET12SVXLHR9zF2Q==
X-CSE-MsgGUID: p75rmlwSRtSZGD2xCIxouQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211621210"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Feb 2026 20:31:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpfPC-00000000odq-16hb;
	Tue, 10 Feb 2026 04:31:18 +0000
Date: Tue, 10 Feb 2026 12:30:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/net/libeth/xdp.h:1315 libeth_xdp_process_buff()
 error: we previously assumed 'xdp->data' could be null (see line 1310)
Message-ID: <202602101205.Ce7wRn0m-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Tony Nguyen <anthony.l.nguyen@intel.com>
CC: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8a5203c630c67d578975ff237413f5e0b5000af8
commit: 93f53db9f9dc4a16b40ecd18e6d338ad57e4b670 ice: switch to Page Pool
date:   3 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-141-20260210 (https://download.01.org/0day-ci/archive/20260210/202602101205.Ce7wRn0m-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202602101205.Ce7wRn0m-lkp@intel.com/

smatch warnings:
include/net/libeth/xdp.h:1315 libeth_xdp_process_buff() error: we previously assumed 'xdp->data' could be null (see line 1310)

vim +1315 include/net/libeth/xdp.h

3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1288  
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1289  /**
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1290   * libeth_xdp_process_buff - attach Rx buffer to &libeth_xdp_buff
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1291   * @xdp: XDP buffer to attach the Rx buffer to
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1292   * @fqe: Rx buffer to process
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1293   * @len: received data length from the descriptor
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1294   *
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1295   * If the XDP buffer is empty, attaches the Rx buffer as head and initializes
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1296   * the required fields. Otherwise, attaches the buffer as a frag.
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1297   * Already performs DMA sync-for-CPU and frame start prefetch
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1298   * (for head buffers only).
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1299   *
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1300   * Return: true on success, false if the descriptor must be skipped (empty or
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1301   * no space for a new frag).
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1302   */
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1303  static inline bool libeth_xdp_process_buff(struct libeth_xdp_buff *xdp,
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1304  					   const struct libeth_fqe *fqe,
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1305  					   u32 len)
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1306  {
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1307  	if (!libeth_rx_sync_for_cpu(fqe, len))
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1308  		return false;
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1309  
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12 @1310  	if (xdp->data)
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1311  		return libeth_xdp_buff_add_frag(xdp, fqe, len);
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1312  
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1313  	libeth_xdp_prepare_buff(xdp, fqe, len);
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1314  
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12 @1315  	prefetch(xdp->data);
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1316  
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1317  	return true;
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1318  }
3ef2b0192e8ba1 Alexander Lobakin 2025-06-12  1319  

:::::: The code at line 1315 was first introduced by commit
:::::: 3ef2b0192e8ba133f597919632bd9cf196076f0b libeth: xdp: add helpers for preparing/processing &libeth_xdp_buff

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
