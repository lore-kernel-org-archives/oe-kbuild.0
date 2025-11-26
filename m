Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C773F2BCF5D
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 20:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187290; cv=none; b=V/8bEnCtoZ3eiHTC0ytYMFpXmrNiULF+YRhEeY77Q28kkzM0ztJofju6BqtP0Y3aIFZDQTuoisTAKbBIgTjbwZ2nna+ydCHBTnC+mFjZ6Cuona7ZU9BmiQx7QyY1k1UbFyjA+xtLiqDxX0kruKVn4gmGIw877EX22i36Mj2sft4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187290; c=relaxed/simple;
	bh=ZMRimnK9y9PiPcPqcXc71x+HBlBrmQ08pRSRoLyNSxk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QIiMH5W+0F0sYIqrW8ujiJ1GfrV79Q37Uatbx53p/VxX6QX+jjEPNMLtI3XhkPIGh0wrGmm+YHRPmKX9C+sT3zVxhKTOx53+qRacsAH6QGg8EZ0acrnbPMbWXGSyzuPhSME2FGWLD8PgEAAzAZnrEbElhRIiF8VxpyG7/1WTABs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bhPROuIu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bhPROuIu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764187289; x=1795723289;
  h=date:from:to:subject:message-id:mime-version;
  bh=ZMRimnK9y9PiPcPqcXc71x+HBlBrmQ08pRSRoLyNSxk=;
  b=bhPROuIu1VRd5y088rGX4UagikV1x1oDeYOphYbUnSmh+H8RnZqJ3ESU
   fLac+TmhRcV3Rz8luN8gj8FUOJukpRd020tSHJygLQijrCQHIz1DyGu+Q
   1tZvoqsaOq5yG8QzkQaPk0czWhoYBPa014lzSNViGlILhRxF3UMswonDR
   98ThcpoJMNIjGKhwmjnlUCZk544EKrLMtamH0tAO1uUrSQCpOCQ8c9+s7
   Wjd1fq6mDqFuOtpis+IXD09NbuV21DrYEX9l6HMYT9ZxOBCmvY8zCYY9W
   KrRnPsCKTzvR0I9u+n5Ea2CQCGiaNGcgNtQaKd5iLuNavKq66SHVxZ6Uf
   A==;
X-CSE-ConnectionGUID: BR6x9kFPS52KwrDPHofXeA==
X-CSE-MsgGUID: UGolG+NWRL6fM0/XJNhhwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76862467"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76862467"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 12:01:28 -0800
X-CSE-ConnectionGUID: YeMYUKPxT9uTuHsRlAnxRQ==
X-CSE-MsgGUID: zN4cdOKhSIC8EtZkE7UtHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="223737152"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 26 Nov 2025 12:01:27 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLhd-000000001SV-1Mla
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 20:01:25 +0000
Date: Wed, 26 Nov 2025 21:01:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 889/999] checkpatch: ERROR:SPACING: space required
 after that ',' (ctx:VxV)
Message-ID: <202511262100.TqoRSpVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://evilpiepirate.org/git/bcachefs.git master
head:   e336760f1aaba6ace6f898616fd9234c99fd82fd
commit: 386a60dc781dfa861285a9505dc2ac4eea7426d4 [889/999] bcachefs: Fix relocks in btree_node_get() -> fill()
:::::: branch date: 5 hours ago
:::::: commit date: 10 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262100.TqoRSpVo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#134: FILE: fs/bcachefs/sb/counters_format.h:92:
+	x(trans_restart_relock_parent_for_fill_obsolete,61,	TYPE_COUNTER)	\
 	                                               ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
