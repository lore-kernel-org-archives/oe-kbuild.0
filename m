Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A413320DD72
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764184284; cv=none; b=arcP2j2W71m390T/dBnBxyw1FNvQK8y8yBCkuo6NwwOU4OKYlC1D9uo1FTkKAitOeI5fUdXBX7Oe7FlDKvNElzEAowWUs3773Xa0qUIiz41DDLmdgyuVIiYYG81iesVu4Ezf1Bx06rh5I3yhSL8ey3+Ufv1qi0jetO3wqqVcYZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764184284; c=relaxed/simple;
	bh=DrifNSWjE/t2WPcTDRtvQ0RdmyKkzzNk2lPY6KRkrIY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X9nAEjVF7frzFPgvaHDu0ZFjG5Wi/WtZ0WajAyKucdYVLjYpfPutx6xif+S6OI9uVAdHCeyzaZthXbJVr2Xx1DkBtDlKNXilvvwAZKysYLNnq/hDdFYC4dQsltALuc6WzSAywpIXgneuOuu/MG324PxtIia7JxIdlYwG4Rr548w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j+icsj6z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j+icsj6z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764184282; x=1795720282;
  h=date:from:to:subject:message-id:mime-version;
  bh=DrifNSWjE/t2WPcTDRtvQ0RdmyKkzzNk2lPY6KRkrIY=;
  b=j+icsj6z31jDBb7vDy+Yi3fQSIbNUIZacFl/jw0Oh7Pg03vDUM7jUzg1
   pqiTSHir7RzEvUpimZXmt3+zNKwsKFRKlWCN+PLZJbowj4sPN0BV1O1b6
   i8bWUIcxl/bkTiTgnP7ClvB+j1h64iQ7kDY3YCEIi3I4r66c0cuA0VPHR
   A58rqjug6kVSmQXNqfT10O4VuhGfifcG3E4p0E1w5UGH8a0ziQ94NBwMx
   1PKyNj1e0NY2c3/ckeGv+yIBVnagBLYnU1zPj9uJRF2GwBLXTB5fcUuLb
   uFrfMr28UoHajbjwp0k3r5ejk3JoKCoiZJ/dIsHqhup57K2+JkwLCGLOX
   A==;
X-CSE-ConnectionGUID: SQzsjhJYR8CM7SzKIeCjUw==
X-CSE-MsgGUID: V94oAIyZSK62AwUkgn0ocA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76555267"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="76555267"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:11:22 -0800
X-CSE-ConnectionGUID: 0UfQN4w6S/K9jhyXEhWvpA==
X-CSE-MsgGUID: 65kDYUsWRFCIdyi2lFQGVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="198138574"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2025 11:11:22 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOKv9-000000001JL-1rWW
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:11:19 +0000
Date: Wed, 26 Nov 2025 20:11:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 22/999] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202511262049.4Kae8qGL-lkp@intel.com>
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
commit: 54582f52ed7a63a557308bd0a3efd0f5fc5443c6 [22/999] bcachefs: Evict/bypass key cache when deleting
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262049.4Kae8qGL-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#70: FILE: fs/bcachefs/btree_trans_commit.c:345:
+	       bkey_deleted(&i->k->k));;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
