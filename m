Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4012CBA4B
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Sep 2024 10:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727432655; cv=none; b=GCAfFX3Tk45nCVXgpJyLJHFVxbrPYqe5D2vOR1qgoegt9XtAOTSkNJWKJO79HDN5ATQcDr4wH4EUj+1zRt7ChSJezEJGZr+4uMpDR6xYkv585iyI1k8VR1UazZpdoN1Edh2sBvrTsWyTJIM+qfMTRxbLp8zfwTNgXvk7XyJ2hJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727432655; c=relaxed/simple;
	bh=xOOLDYPCYOpcbwm+sNR6SXy67kt+9LJ4TgVPvTIUahc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l0DbxvfcdQpkVFF1z54bx70fBPZdfIkrnsVO3qYe4hroqZXU8Pa5FBdSTVq2nZE3MqWqiaLMKtqohVidjozYmPq1I8CtkImAwF6z79mvx28LkGumIbaXhbGCNNqYr3Emyi61UR8mFBQeW2z8lvCNqRkcPelgzm0/8d5yaRlDge0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eKeeKpo9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eKeeKpo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727432653; x=1758968653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xOOLDYPCYOpcbwm+sNR6SXy67kt+9LJ4TgVPvTIUahc=;
  b=eKeeKpo9C3WdmuXXOi8S6CfWXSIxqpTVsPLwXmM/mNIE64EFVbYXoFaS
   9hyOdnHBEDgtWq2/p4tNBKZSFjtuKmfW0S3y6LoWrhh1b49o0xBMM5ZbR
   a/kWq4Fb5IhQ/4TIZ4No8gUU/L/LYFCgyHgic4l6UL4SRMZk6PEYb++KY
   IOw/Oc5LK455K4tIH7bIwWJhY8EMgt/5QICbDFAFUf4RMiiH67mMSjTzi
   Yo9IfnBOchMMn8RfYTlAEQENH1m3UaAx7/jfHohL/ku7pYsDoSH3+CHWv
   uwZijrCCfan2QKLysoj70vRW6so43y6QAncgxKt9TXlQ9ZG260gXCwKGo
   A==;
X-CSE-ConnectionGUID: yq85g/CoQcm5kwMN/X1eIg==
X-CSE-MsgGUID: sg52N2SlSCqiU7m6b29PQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26518284"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26518284"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 03:24:12 -0700
X-CSE-ConnectionGUID: snBX9CM3QiCTMWU0BjYciw==
X-CSE-MsgGUID: j/u/bW4ESoqwMx4rIIm3qQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="77433981"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 27 Sep 2024 03:24:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1su88v-000Lnv-1W;
	Fri, 27 Sep 2024 10:24:09 +0000
Date: Fri, 27 Sep 2024 18:23:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [cip:linux-4.19.y-cip-rt-rebase 6382/30000]
 include/linux/blk-cgroup.h: linux/kthread.h is included more than once.
Message-ID: <202409271803.PQA3eNK2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "cip tree"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: 827b6f6962daf2e13170c0185c0f7b51cf74a0ed [6382/30000] workqueue: rework
:::::: branch date: 3 days ago
:::::: commit date: 5 years ago
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409271803.PQA3eNK2-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/blk-cgroup.h: linux/kthread.h is included more than once.

vim +17 include/linux/blk-cgroup.h

  > 17	#include <linux/kthread.h>
    18	#include <linux/percpu_counter.h>
    19	#include <linux/seq_file.h>
    20	#include <linux/radix-tree.h>
    21	#include <linux/blkdev.h>
    22	#include <linux/atomic.h>
  > 23	#include <linux/kthread.h>
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
