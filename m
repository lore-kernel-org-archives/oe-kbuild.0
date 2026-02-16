Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C143033FF
	for <oe-kbuild@lists.linux.dev>; Mon, 16 Feb 2026 11:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771242747; cv=none; b=Z9W4Dhymfhb+99KYVJLL4CkDXGlp73IwBCtzsV6ARSZoWTx4G4oTemY8uB6+wWaw+yGHKKrb3LAUumBr7LG4q0Qymyj4qFlAqNRCopb5iU2j9ZJ1BMkWrwV3VNZPCp8hMyNZTTVO904ap5PpNbXGlspU19WHWQWEfiDpOs9sJTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771242747; c=relaxed/simple;
	bh=IH7aB1r10zCzMntgFhQGMfqpWZ0+ydQCGt2cWQ2giHo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i2B0oisEk5OIfJudCJH8d2vdfg5IiqZjvyWlexBUsIV6nHb7WOSJ4LNwMQ/dP7lzsuJLKwdQulyPseu6GYUNoDslUlJFuTneVSkPUZrOUnikD85i/Nxw95JVsh2dYzaB6aXN3z1Rpop35HUq0B9176a31I+J9aeIRWTFIsEFyWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BeRmRAKP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BeRmRAKP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771242746; x=1802778746;
  h=date:from:to:subject:message-id:mime-version;
  bh=IH7aB1r10zCzMntgFhQGMfqpWZ0+ydQCGt2cWQ2giHo=;
  b=BeRmRAKPR7+6Mj5OIEB80flkpMKvXotuJVmWmPWA/J5eN++h1DFBT7s9
   0sAu+1b6XiHepkIWB+aP1RL0D2tgWpmpSAj3NtXoFoIC+SkRzA96PI+t4
   2SjYFm+gRF7/plW1THb7v/mpEBsSxdoias0UJ4NavNbMAdgo3CU+YDP+a
   oS7QijQA3KXlgztCMZ2o5Mtpb3E72xC6s8RVJavSiVcCdAg31Tu9i0pFs
   Lj62SsCcPrXuMZnZ3rsHNYQlTi5AAKoGdiXWgwumWjzSMP7EVBE54vpsg
   allYjEtB0bOa6L9pcxYy1wijytXXXEMJFrjSw0koh3J95Q1Vtc/YjnFuX
   A==;
X-CSE-ConnectionGUID: 2+9vNLrpRy+CcbHzr5rCeA==
X-CSE-MsgGUID: PeE1CXP+TRSmItGwpQkzSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="59888644"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="59888644"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 03:52:25 -0800
X-CSE-ConnectionGUID: Idz7hPH8ThyNjcUW27dAZA==
X-CSE-MsgGUID: QKTd5tKWR7Cgj/7ah82Sxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="212840500"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 16 Feb 2026 03:52:24 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrx9K-000000002Px-23Om
	for oe-kbuild@lists.linux.dev;
	Mon, 16 Feb 2026 11:52:22 +0000
Date: Mon, 16 Feb 2026 12:51:30 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH] smb: smbdirect: select CONFIG_SG_POOL
Message-ID: <202602161201.RnNbW8pJ-lkp@intel.com>
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
In-Reply-To: <20260216105404.2381695-1-arnd@kernel.org>
References: <20260216105404.2381695-1-arnd@kernel.org>
TO: Arnd Bergmann <arnd@kernel.org>
TO: Steve French <sfrench@samba.org>
TO: Stefan Metzmacher <metze@samba.org>
TO: Namjae Jeon <linkinjeon@kernel.org>

Hi Arnd,

kernel test robot noticed the following build warnings:

[auto build test WARNING on v6.19]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arnd-Bergmann/smb-smbdirect-select-CONFIG_SG_POOL/20260216-185745
base:   v6.19
patch link:    https://lore.kernel.org/r/20260216105404.2381695-1-arnd%40kernel.org
patch subject: [PATCH] smb: smbdirect: select CONFIG_SG_POOL
:::::: branch date: 42 minutes ago
:::::: commit date: 42 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602161201.RnNbW8pJ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'so'
#16: 
The other users of this interface all 'select SG_POOL', so so the same

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
