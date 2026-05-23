Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEBA25B0AA
	for <oe-kbuild@lists.linux.dev>; Sat, 23 May 2026 13:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779544644; cv=none; b=OkglIZt/pgvn7vGZDKz77DSHfaEtC62WRH+YVbLctxerzjva3Carvf2KvuZbUxz1XWIgsRDfbib/vaN5oV4QJcqgkp16LPjFHCYde8omOdVO7iP8oMtC0sgZ7EyFwgAvLc7YmtDdsnk05yUqjmR2tY1Ds7nWyrL/GwqLeWxWDWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779544644; c=relaxed/simple;
	bh=aorLW5kt95Q38aLcMG6mvWXuxRRX4G6FwrXR4ZWXj5s=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ra/h8ptKw9dEYIpVtTVhnL2Y268hBh1kQmcjKcvwGzhCoAx4JYlhzZMjvDpwMZbnmtu2Rrgx8MZgxymaMsSfUE3vqJX/eWW2UEC+P8iuN6wAG5nGR3vrmPE1Lzfj3HNbR1xkoyxWG57ldIFoWKtSzIdLNsGRtzdxeQW1TivIRD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbomhMEQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbomhMEQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779544642; x=1811080642;
  h=date:from:to:cc:subject:message-id;
  bh=aorLW5kt95Q38aLcMG6mvWXuxRRX4G6FwrXR4ZWXj5s=;
  b=RbomhMEQs0VNjNkd27C5ha1FM734aI4iFid3FZrdXzlKuelOw1CxUSE/
   jQXI2qLNOTcwZYUVKx/zUR1Sek2FDJvxdk3I3yzMoBxOYSL+qV9p9cvMf
   dgegevFI89U9rQ+fYHWrIwLoghzjJlufFZpkR9HW1drmfvGb1IjpjhtGx
   28wOSRfTHAm2VsnPLW+rT00gHSBmtv8M/PDcADEWCfE1ruXIm9aZOcgJ7
   DsNodkH7VXwMuSDXaWN+voFSDxa8bCexJ2ceQJiaIWIfBtQqA/2S/mcx4
   MhXtDj3lZvZzr+BH/CEzCZ87HK56YjcCCg0z48RwvPz+LTPArCoqWz4TH
   Q==;
X-CSE-ConnectionGUID: 6l77rC+FTIy2RPKgFgH1fg==
X-CSE-MsgGUID: mtIVt0NoQ8KI6+evE/KSGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="79478788"
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="79478788"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 06:57:21 -0700
X-CSE-ConnectionGUID: l7HQ6ZKoQfqTkDMLYErsZQ==
X-CSE-MsgGUID: IzumINDzTam+in8Qp60IkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,164,1774335600"; 
   d="scan'208";a="246246564"
Received: from lkp-server01.sh.intel.com (HELO cef7325a8999) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 May 2026 06:57:19 -0700
Received: from kbuild by cef7325a8999 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQmqs-0000000006J-0pz9;
	Sat, 23 May 2026 13:57:18 +0000
Date: Sat, 23 May 2026 21:57:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: include/net/libeth/xdp.h:1315 libeth_xdp_process_buff()
 error: we previously assumed 'xdp->data' could be null (see line 1310)
Message-ID: <202605232120.b195V7GQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Tony Nguyen <anthony.l.nguyen@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   79bd2dded182b1d458b18e62684b7f82ffc682e5
commit: a4d755d1040a49014b52de286c5f535e20788aa3 idpf: use generic functions to build xdp_buff and skb
date:   9 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 9 months ago
config: i386-randconfig-r071-20260523 (https://download.01.org/0day-ci/archive/20260523/202605232120.b195V7GQ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a4d755d1040a ("idpf: use generic functions to build xdp_buff and skb")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605232120.b195V7GQ-lkp@intel.com/

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
