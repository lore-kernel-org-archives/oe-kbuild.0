Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D188B33F8D8
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764186268; cv=none; b=nekRkeaWrr9GaQ2OQVe8zP4oca0Lz10VY348b/BD3Ov305KjShdEVeBwrCcn6xb8/Uodiaglpn/c81gISTc9yXOjgvKVH5DIDno67KYF92vr7T3RwDq74i6IGhLJDCww81et5yZIKHyxCuzr0E47BhpXhG4sxq0XtEUQXI71foo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764186268; c=relaxed/simple;
	bh=h9URB/kQZf7vju1ifv9oETT1hcadAHhdjFkLqSQneck=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kdLAVs6+J3bkhUa2PLj0R4450U2yn6nIWXtnlPKs6uJa4d9J2CKjtdmpNrtIeB7yvF4GwWexXego68bWz6lCriAboZOPQDEDSg/XhAEoCQu+agKSo6cfmXl9IeomdLdXhvD2nNFPljjwNjQ3ZkR3bHTxlKSyh5S2g4jWkP/Rm1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PP5zRx/W; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PP5zRx/W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764186267; x=1795722267;
  h=date:from:to:subject:message-id:mime-version;
  bh=h9URB/kQZf7vju1ifv9oETT1hcadAHhdjFkLqSQneck=;
  b=PP5zRx/WDTKu+P299NCzpkiI1ceEAjamlYmD4uIeM7ZiUyrJOHRBLqE+
   H8dvkcfwarS2SMQKzGrTBY4WHeQhSfr5Ojy2Ktl3a9SxNSeJDSxY7H4qw
   XGFpP3o28CecwRewz7dIL8IuhPjkN1jQeD9NDXPd19Tn/qANWArWX9nAS
   rjBlePx1iAK+aFtBnMmg8nqmDmdu7As7+AwAWMdL7ugAhw2kvGJCYNW94
   3VlY1gtGc/jZHDeW4KK5UdaNLRhRxqa+xxx6e3cfvWwVTrmXGAEApw4bA
   s3BuXNKycMsI8wC9UEnue19+CiNNd9fKGDDOrJlDDAk4YxXMfAcG3IeTL
   w==;
X-CSE-ConnectionGUID: SaL5Du23RCOyJIyxMRWhVA==
X-CSE-MsgGUID: ov0CoiI4QByGz59jJN/qcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76919457"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76919457"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:44:26 -0800
X-CSE-ConnectionGUID: IGREKmy7RUW3NDEiQrxSIQ==
X-CSE-MsgGUID: FfZ59wXETT+NtNOoA7tgAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192162473"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Nov 2025 11:44:26 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLR9-000000001P8-1N1I
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:44:23 +0000
Date: Wed, 26 Nov 2025 20:44:17 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 575/999] checkpatch: WARNING:BRACES: braces {} are
 not necessary for any arm of this statement
Message-ID: <202511262004.KoJP0e0z-lkp@intel.com>
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
commit: 407060d9ae7d986bc4f12b09ae32828fcb479d25 [575/999] bcachefs: kill racy access to bch_write_op.flags
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262004.KoJP0e0z-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BRACES: braces {} are not necessary for any arm of this statement
#40: FILE: fs/bcachefs/data/write.c:1275:
+	if (unlikely(op->io_error)) {
[...]
 	} else if (unlikely(op->flags & BCH_WRITE_convert_unwritten))
[...]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
