Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA99340A5A
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764186688; cv=none; b=ZBTtzu9wpR9I/JnFyy5o27lUBaRxrvdoQKPVNFesPEo9+P9zqkEkCAru9veTwMW+QQw3uf7m02TT3hMYu4RIt8XMecDQshERgH8bFYB4VUWqB0v7MNzfr8kcpAykonTNHP6BimoECpq80LB3Cb296PUt4lIBPNyE9sRP/kLp7nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764186688; c=relaxed/simple;
	bh=LladrZpoS/Q4TRtMBd4wbfwCmKUhQG7SNj6xVqzqp4M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BtKHpDA9awQhX67PA7qVL+tOvqLkK4RUm1Tol+8pG9iNgxvlht+NkPUm6MVc+ysjuoZWv8+yloVNn2bhcczDgwfYhJ7pJpinhhVE1D5nixXTWVMfVuunQQZOQmp782cyuPE9D0+UCA5r2puKMmP+J1+oZih+LfgfuX0SkI/Pieo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iPFXF5zO; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iPFXF5zO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764186687; x=1795722687;
  h=date:from:to:subject:message-id:mime-version;
  bh=LladrZpoS/Q4TRtMBd4wbfwCmKUhQG7SNj6xVqzqp4M=;
  b=iPFXF5zOlEAa64DBa+sVhKb1x+gNNz9c7Iboc6oiWVOK1laQ/0AhtHKD
   UC8PubNeukg6yVcnDM1Dntladb64lJc4qdvsXwi3TT/f1q+1HuNpiweLm
   fX+0ftc0RIzpHKbSU/A4hy6hrQTslSYrujj+HEMbNu5Qw5mnZB4do+I5K
   EdqA5HJRkMOqMB49Mb197BtHBtNLTLnQUpLyOfTQoRJ9zZqTk4eJpXkp4
   8VBBrEWb28Z/GDF9iuMd3mZz5JxSY0+0JGzixT+nKWj/7aGaJCNlWTYst
   4UbTHUkXE1P5TselMAplju/nQziX9fuRE9o42qBF3OOc7ah/7A6sNLXkl
   w==;
X-CSE-ConnectionGUID: 4IFszvybQNuKBG7tp8qW/Q==
X-CSE-MsgGUID: t39/X3/7SFGSg3zwvHL5tA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76919975"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76919975"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:51:27 -0800
X-CSE-ConnectionGUID: yIYS+WLySYSxoiaeB5a4+Q==
X-CSE-MsgGUID: x7u+vGxaRBiTRL1CD8wVFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192937470"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Nov 2025 11:51:26 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLXv-000000001QI-3zoy
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:51:23 +0000
Date: Wed, 26 Nov 2025 20:50:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 719/999] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202511262047.zXsOmAsz-lkp@intel.com>
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
commit: 170e790c993f2dc5503d5edf6c7e211f47c320ab [719/999] bcachefs: bcachefs_metadata_version_sb_field_extent_type_u64s
:::::: branch date: 5 hours ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262047.zXsOmAsz-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#169: FILE: fs/bcachefs/data/extents_sb.c:44:
+		c->extent_type_u64s[i] = extent_entry_u64s_known(i);;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
