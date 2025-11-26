Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7232633E368
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764187170; cv=none; b=TihnfwcDSAaFcu5C1n5BpPqgqMCq53mvyeP1471ufEDsZvyhJ0+v+/lk8mbUCy6PdksfS7nH7qzhOoiUyAdjGvirrgN+n2Pk3b4HNjBWaHK8MzedW4qMivnDYXODiisgd6elisGVeuAGgS4jcFXkpi5jyUmC3W/UBCjwfKNn+I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764187170; c=relaxed/simple;
	bh=2IUNsKexTZlyWABKi0wpbVykfXmtHOg9NS1fSlzNEwY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZVctzrVbXDhECYnRDTkeKmI066ZrzYIq/3hmJg3UdA1J/lPOwRWUadyogQb090tM0j6zxLxNqBk7JVOogqBw8iee8JmWgpsojVPZHYoL7g0zZy7eR+0ECjzK91JVu/pk5ctBo0oHuINb5tLPnWSezAkok6jw/UwwikZVXwxoyFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAI6K8h8; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAI6K8h8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764187168; x=1795723168;
  h=date:from:to:subject:message-id:mime-version;
  bh=2IUNsKexTZlyWABKi0wpbVykfXmtHOg9NS1fSlzNEwY=;
  b=SAI6K8h8K+dAhirELqqxn4VYa3x46wOu4QsEUtGSMGo1UCXQmZChZ7A8
   DOiVPChbDyckL/98r1CBTKACCqQRK5RS8pm96umTD7YEMgqaO4stVKNtq
   qZza7OlYlww0FZ+fFH5Qc4y8rJ1Zwmj+byTDQUMRz2ParArgKZEi6enz9
   g8FoNyx7gImgRweKc3LS/OXGdD7XsLGAyLfPNGb9lBDrFvEXAPFF6H+1B
   6fjofNV4WHXfxYH2hhBUfmhglC6wYPscQa9Ql/OCeNk4IYe2vktu4WuFt
   7YJk9QK7+B/k1nuCD4ukBqPVtnVRPqjgxbaoPJKH3Sq3G/2eVoL/GeAz8
   g==;
X-CSE-ConnectionGUID: 2cXi4iWlRYWvjE6O8xdoCQ==
X-CSE-MsgGUID: YSnsGP4WSvO5Z/YUHsdYgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="83841149"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="83841149"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:59:28 -0800
X-CSE-ConnectionGUID: lRE45Sh4TaKOJN16e47OUg==
X-CSE-MsgGUID: a+R0EUbbQmGIKaK06RDhdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="197199000"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 26 Nov 2025 11:59:27 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLfg-000000001Rr-3eHg
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:59:24 +0000
Date: Wed, 26 Nov 2025 20:58:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 845/999] checkpatch: ERROR:SPACING: space required
 after that ',' (ctx:VxO)
Message-ID: <202511262040.UcpaI9NB-lkp@intel.com>
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
commit: 463dd6744558757e5667fae2d5da73c918424f1b [845/999] bcachefs: REBALANCE_SCAN_pending
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262040.UcpaI9NB-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxO)
#40: FILE: fs/bcachefs/alloc/disk_groups.c:477:
+	scoped_guard(mutex,&c->sb_lock) {
 	                  ^

ERROR:SPACING: space required before that '&' (ctx:OxV)
#40: FILE: fs/bcachefs/alloc/disk_groups.c:477:
+	scoped_guard(mutex,&c->sb_lock) {
 	                   ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
