Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83386329
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 11:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769255577; cv=none; b=QyxLd/ir6FoE1D2yhoqfQTspwsCB6CgZVo0c9EatRo5S4ymWry9ProdRWe0xgJkVSZ6icwBQezbeE8rhisnzhqWpxKKMWdUIZ11s4D8K8j5v23MBVqC9Mybi2jsTgbym8JhJAi9NyuytiQyPZ5zVi0aqs6RKEfwFsJ3TSVBR5SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769255577; c=relaxed/simple;
	bh=5TsLEuImL+FABmugs5aYRF+vyBuSDsAyVR4BkljvVlA=;
	h=Date:From:To:Subject:Message-ID; b=sbhynzybvXgVfHCEF90YE6LNX179moTReBGCIUkKiFuuVZVArfV3lrFDYE/vtC31J+Y8rCcysOL/thVRF4BJ8r2rEFbfuRaHfBNiziaj35S4EsqVzaNOOd7kRe4zfGNmaw4o3k1KAmbKCpjYtyVy5xxUS1dCGUFMfdHqrgWy8d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgjAUD2Y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgjAUD2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769255576; x=1800791576;
  h=date:from:to:subject:message-id;
  bh=5TsLEuImL+FABmugs5aYRF+vyBuSDsAyVR4BkljvVlA=;
  b=CgjAUD2YXK1NwbmK3Y8MWFl9J8UpGfIZqZXVZqc0yA4Qics/tQ00IVZ2
   oSdSSksrZhLsdaKcNd6JHD+ZCSKUIM0R0byl4tQFMR8YAc1lIYcMIwHXr
   abpwzwwP0NuQ9VWoNCPVtKn9QCbAgG/wfI6oxNsB5p+5Uon3R82nfxeUh
   StRhpv++RP9cPj+9y70TrNxnQ+AvJdfdqvLqT+dxKLu6cbvg3vFVRROjc
   fXkLJ/wmUaevt8SQMN8uxqFhcA/Ctayz0GNCHIkQQdsebSyslsNBdFT3P
   CHtD+TP2q8tpnsUaGwdjtz3spbXJvu9uEN5dxIIzwcX4pfwDbAWjzri8R
   g==;
X-CSE-ConnectionGUID: KbPdJCZRQ9ubQZQ2UpKSXA==
X-CSE-MsgGUID: QbnGkw1vRH6X7qfzdKpVzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70397227"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="70397227"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 03:52:56 -0800
X-CSE-ConnectionGUID: LKyHIsf9RBGrvB2vehzCyA==
X-CSE-MsgGUID: FnDJWxiMSlSmKKBPCN72uQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jan 2026 03:52:55 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjcCC-000000000xz-3gws
	for oe-kbuild@lists.linux.dev;
	Sat, 24 Jan 2026 11:52:52 +0000
Date: Sat, 24 Jan 2026 12:52:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cifs:for-next 37/68] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'from'
Message-ID: <202601241217.jbWYOyLM-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   git://git.samba.org/sfrench/cifs-2.6.git for-next
head:   962f03905e6b1f6edbf6618b0eabf33b96eb1acd
commit: 79d2939d206102850c04f68a1dd4a205a4a0109a [37/68] cifs: SMB1 split: Don't return smb_hdr from cifs_{,small_}buf_get()
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260124/202601241217.jbWYOyLM-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'from'
#7: 
Return void* rather than struct smb_hdr* from from cifs_buf_get() and

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
