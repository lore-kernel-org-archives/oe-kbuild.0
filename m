Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE8B340400
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789225496; cv=none; b=MX24LZuDouU5/VJFE7UJqpB6gvDaUWpEBN214JvKTzjSUanJ1o/xwxhBIUAqs7P7OsfIQjB+pNKaz+0OjhhGcdoqefamV40yM3ea1ttPR4AigkQs4/41KJ5xzdZcMWEg6nEKkB9k5aQzvruvg/XBmCr+A1EfV5OQexQeQiW9OZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789225496; c=relaxed/simple;
	bh=FJwqPJeObSTwubFoD44Wy+/bacyj7SVkPy0pgH2UPYc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fZan9qELh8oMyu6sEQ4V1dehWWCDghjILEY57xyd34ItKQd+bqB8uPjUzH3RIOaFJKGOgwle83p5rA5rFGQqrns58VEpyO462UIaVA2C7NE0EYZKwE86YOJw14bLS5xDw5QY9D2XQnxp2fLlWLMzesJSCmOhjORG73aVvuNWkEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BYJ2F1p3; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BYJ2F1p3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789225495; x=1820761495;
  h=date:from:to:cc:subject:message-id;
  bh=FJwqPJeObSTwubFoD44Wy+/bacyj7SVkPy0pgH2UPYc=;
  b=BYJ2F1p37kzfRQRZTyRoPhCnaH1yfHN2ACrk1tnTigUAsdLJ6zRRr9oW
   pDj2e7agaLACW2iSq26DkDn0dsBOViEmtnarJ4KVR8RjP2bYV/roZ2uif
   lOAN7VPdVAorJF8ZWEo7gd6LbKIzDrJfAblf9Jzy7aJ+IWYFVlIYT5LIX
   QPoCmtCCynQ9iKVJUAN76/5V8dkIgpza6O+oXl0K5c4hyeX+gUtV356ps
   dRCPRoNeSSuiM+cnutuC/vaP2lNRBDN2tUYnW4yrjLC0Up+zhGV4L3s28
   LLjvwMOl7PwV628v3DY6N425OHBkckwgHCcRftgKTRSpvYi5BZQnf9NWW
   Q==;
X-CSE-ConnectionGUID: FGDlS6KPRp6lMI8oD2mhSQ==
X-CSE-MsgGUID: qV2UOe8/SZ2QVaGZ0jFajw==
X-IronPort-AV: E=McAfee;i="6800,10657,11903"; a="107033160"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="107033160"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 08:04:54 -0700
X-CSE-ConnectionGUID: 1sUXN/lcQg696Rfk0T3A8A==
X-CSE-MsgGUID: 4vq1f+JrTfivSm3ynXGrOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="275728693"
Received: from igk-lkp-server01.igk.intel.com (HELO 2232cf45ba3c) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Sep 2026 08:04:53 -0700
Received: from kbuild by 2232cf45ba3c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5PHe-0000000019b-2eyC;
	Sat, 12 Sep 2026 15:04:50 +0000
Date: Sat, 12 Sep 2026 17:03:53 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/net/libeth/xdp.h:1315 libeth_xdp_process_buff()
 error: we previously assumed 'xdp->data' could be null (see line 1310)
Message-ID: <202609121629.yctGe10N-lkp@intel.com>
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
head:   5225b8eec4c9bb21aecff6295fab6346a3c3738e
commit: 93f53db9f9dc4a16b40ecd18e6d338ad57e4b670 ice: switch to Page Pool
date:   11 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 11 months ago
config: i386-randconfig-r071-20260911 (https://download.01.org/0day-ci/archive/20260912/202609121629.yctGe10N-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 93f53db9f9dc ("ice: switch to Page Pool")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609121629.yctGe10N-lkp@intel.com/

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
