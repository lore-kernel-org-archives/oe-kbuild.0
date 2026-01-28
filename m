Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54370288CA3
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 13:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606869; cv=none; b=rdstekMRKAzzo2FjDRE3P9UP19ps4Znt2BEndXtgiWLEE5efP5TaPKite6dey7JMFkHHkvFb2TC+Yuwer7FoTBXPgsyyEGAIvb3V29afVg43ZVsX2G7vYapg2EPlorWHBt9TYIiZF21YnOZYFc2I+b0cZ52OiaYqidelq2RUbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606869; c=relaxed/simple;
	bh=xFnKyT7YwJIP5udFuH3Aia8K1b9mvU5AGh+EbNt7I88=;
	h=Date:From:To:Subject:Message-ID; b=ADwWFCtoWTNPTxWyDUeaKdodp+LlT0ODGbn9jhgs9bHPBOyr2o1ZBW/oss4ldqupXd0Q5vZeCBlIUujQPlrQ027I8Oozj4jk9D9CJdutSEkN9VDWDb1r95I0LJEgJkLb30T/3MfkCjXF9bKCoVwGCMxLOrZ/sQWiqEncvQttjEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C/tGAkZS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C/tGAkZS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769606868; x=1801142868;
  h=date:from:to:subject:message-id;
  bh=xFnKyT7YwJIP5udFuH3Aia8K1b9mvU5AGh+EbNt7I88=;
  b=C/tGAkZSl9jQcIRsW38rNMdLwmHTylXUAhYXgsx8QBiwi2odlB/vrgMy
   5jpzaRbkmQxyChDLIb9XRbvDuaisDV5+mTRud1bmUNK8mcAm4ItRCD0Mk
   aJOsq9jOySwS9jtHaxwIaXhU8vD+nSu9jo4eMytnuZ8bMQ1ThLPfZ7gnB
   A5FsbIdIVFakD7oFqc4360wc/PrmbASJG8eMo/CTNoMn8pbU96bgYWxlj
   /XEF/S3Lzw3V79FMyYoO8W8p8Pch1NyPHGOugkgUTF5QAhic32yPyXWRJ
   C77U89NNhCf3H3vX5MDWWueroCsN8oNVSRX8GjB0jH0scIViR9MLWDWr3
   A==;
X-CSE-ConnectionGUID: 2CiYPlzzQYW8n6fFJMyK8Q==
X-CSE-MsgGUID: /baiu7hsSqG1bS7E3ak10Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="88234477"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="88234477"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 05:27:47 -0800
X-CSE-ConnectionGUID: e/65UqawQ6KpFnI+MjjKmQ==
X-CSE-MsgGUID: IHT1jRmJRbCG0Yg5+l5EqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="245875100"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Jan 2026 05:27:47 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vl5aC-0000000023x-0GwG
	for oe-kbuild@lists.linux.dev;
	Wed, 28 Jan 2026 13:27:44 +0000
Date: Wed, 28 Jan 2026 14:26:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tj-sched-ext:for-6.20 15/15] checkpatch:
 ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
Message-ID: <202601281423.vIUhX8Ip-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Emil Tsalapatis <emil@etsalapatis.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git for-6.20
head:   36929ebd17ae66ed3acde9056a9daf611d81a2e5
commit: 36929ebd17ae66ed3acde9056a9daf611d81a2e5 [15/15] tools/sched_ext: add arena based scheduler
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260128/202601281423.vIUhX8Ip-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#434: FILE: tools/sched_ext/scx_sdt.bpf.c:396:
+static sdt_desc_t * desc_find_empty(sdt_desc_t *desc, __u64 *idxp)

ERROR:POINTER_LOCATION: "foo * bar" should be "foo *bar"
#942: FILE: tools/sched_ext/scx_sdt.h:81:
+		sdt_desc_t * descs[SDT_TASK_ENTS_PER_CHUNK];

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
