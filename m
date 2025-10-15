Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E978131BCB5
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Oct 2025 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760525838; cv=none; b=nJLSpMs+vGS/cyCfMD9W9Teel7q8IIVTmoStzelMZnEFe1ZSJoqAelHzeyMUHOWTCtU3XiO8TmgIBp9ZZfevyrDWpDjMdk9L7NxtohOt7FnJJyleM8n2Fs2FOegDDBalYUTTLVKQqpp1XsnwzAqziXQswYfi9Tccz1qig6rOwlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760525838; c=relaxed/simple;
	bh=7GKwEWESA3rAGf1fBQWf1hrCfHaRshCYcrjAVVn3WYc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y0KB1G4E8yh88FWUhK3CoWX8ayNA1k5bW1QdEhbe5UybtD080DsnwtP1P+4Q/JvUzMK3RN5J9loPa4e+RYOY3GWhDmbA7YtV8LL7CuvOqCT1GaaODfuOoWjzsP9BUgawrgWrz/GdR2rmMJaNHMhOLR4ZZiSJ7Uhc0E5KkBnCg8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iiS4HbA3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iiS4HbA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760525837; x=1792061837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7GKwEWESA3rAGf1fBQWf1hrCfHaRshCYcrjAVVn3WYc=;
  b=iiS4HbA3BKOvoWWRaWvKuYqSvuOlOBQosG4Qwwr19wLwD5E4buwMcY4L
   6WPRRPWdW3LsfEDcdSzevgp52Ir/+sXx95l2Zl5T0xiMqh6khXEAjRCni
   eW22EGWsohr/ec4HZJzPL0OcBgI3cl7Qj3X/QMTVESBevLQGMHD0Ai+Ox
   V/C5XUutw/qGsjVIWJc1xWGK6WEpG/qjwmAnS3aJtSN9ekr0atSFDBX54
   SHJBaQ9RSdijnJLFvKpvlb9jAg741bdrlyHVY95ZadFehiNfOZmLaDnGz
   hw6cW15KYkmgTt7Y6QN+zK1033jGDS5PgLfJ6Zi2OlJj9Q2Oph6PyerKk
   A==;
X-CSE-ConnectionGUID: /ftsktxjQky0XSmTa5XF6g==
X-CSE-MsgGUID: gKsSD+oSR/iTMUcQ0b1/Eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61904861"
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="61904861"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 03:57:15 -0700
X-CSE-ConnectionGUID: eeH+Nt1uSruuRVrcMva2qQ==
X-CSE-MsgGUID: RVzzVF5ZQQqroe2RxZgeDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,231,1754982000"; 
   d="scan'208";a="181698458"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 15 Oct 2025 03:57:14 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8zBv-0003kj-24;
	Wed, 15 Oct 2025 10:57:11 +0000
Date: Wed, 15 Oct 2025 18:56:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [alobakin:libeth 4/6] include/net/libeth/xdp.h:1315
 libeth_xdp_process_buff() error: we previously assumed 'xdp->data' could be
 null (see line 1310)
Message-ID: <202510151844.pTZiNd0P-lkp@intel.com>
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
TO: Michal Kubiak <michal.kubiak@intel.com>
CC: Alexander Lobakin <aleksander.lobakin@intel.com>
CC: Jacob Keller <jacob.e.keller@intel.com>

tree:   https://github.com/alobakin/linux libeth
head:   46e7030e337bfa1856db3dd07d5ee70182c4fa7f
commit: 691ae4cf90f480461f30e913b9102b4d94aa4ab5 [4/6] ice: switch to Page Pool
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: i386-randconfig-141-20251015 (https://download.01.org/0day-ci/archive/20251015/202510151844.pTZiNd0P-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510151844.pTZiNd0P-lkp@intel.com/

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
