Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BC236AB6C
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Mar 2026 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772630976; cv=none; b=ArVkE+2j+nFZp2dPUN0/0JG3nOkEdtKQcDYdKJSe7BLje1yK5HCCMW50aFwIFxoJBBbG8z2MLUm5aKk3tToTyKLakMY0KbG7t/i1wAIDMeQe87A3Lwn3SSXhUEQVpvUfG5qlbVj81NmEUq5gMDuVcjApXxsk+d3YYzi5JKwRlRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772630976; c=relaxed/simple;
	bh=3QgVT8pXDdfMeFAMQbBdLDfS2GWzOB8NOkKPka8MeHU=;
	h=Date:From:To:Subject:Message-ID; b=cUa3ZjUyCse6Hd7k/NEvP7Gc3FDXwHL8TKMdNJ1KAo7Djxz6EBh4TwgEJ1cGWksUSLmJXJFGqh3LZhSIhroLyjvjQMVL+56mHVOfMB+kSwXHx9ppTrQUVKGa30b+FL3FVVChtLUtkuQyeaQI5UQEQDef3ICAS/nwaoLDlPRqFxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eIJ0hVnC; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eIJ0hVnC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772630975; x=1804166975;
  h=date:from:to:subject:message-id;
  bh=3QgVT8pXDdfMeFAMQbBdLDfS2GWzOB8NOkKPka8MeHU=;
  b=eIJ0hVnCNne4TjBsBAy+g1C3thp9fwz+8GfkBmfXaNdi9TKBnw/HqqLS
   4JDPElKYJyL9Sfrfm3bSEaQqURYprQ9uYcI4MdlUiuFip1ICVOXavfzkZ
   r/GPoDZQ2hwYjncvv8oo96pIamk8ND7OC1la7ITYXeLnf0nt3TksAe5qU
   X98FjvQYHNQWKuJT68gTu1CpwrKY9s0Ae8Afs5ETQz2kk/DysHWLlaUA6
   i+wjIw3cWXUEUESZjG10y7brbvIdfWlmWwPxe9bSK8n9hvLeQ+pc+PBHq
   B8of1FFBnURGA4f3Uidydc7KgUWUn+bF+d1S/4hrI+3tpHuNY7rAhmOp+
   A==;
X-CSE-ConnectionGUID: QCuV5+IsSYWo3v7DITECbw==
X-CSE-MsgGUID: /y2DA7OGRMej50olkmEe5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73816013"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73816013"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 05:29:30 -0800
X-CSE-ConnectionGUID: LexnzJB/Tx+uCI9ZkcyAKg==
X-CSE-MsgGUID: m6UNJzXbS5SSCxevItdmdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="216653449"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 05:29:29 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxmI3-000000001hp-1b86
	for oe-kbuild@lists.linux.dev;
	Wed, 04 Mar 2026 13:29:27 +0000
Date: Wed, 04 Mar 2026 14:28:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [sashal:dedup-lsb128 6/11] checkpatch: ERROR:BAD_SIGN_OFF:
 Unrecognized email address: 'Claude:claude-opus-4-6'
Message-ID: <202603041450.W3J71h31-lkp@intel.com>
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
TO: Sasha Levin <sashal@kernel.org>

Hi Sasha,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux.git dedup-lsb128
head:   925cdd8d45fb4adec025cfe8e42abfa0dafa9a46
commit: cd28c5e8fa89d9d19d0370bddc8bcc7e2c03e243 [6/11] ARC: unwind: use shared leb128.h for DWARF decoding
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260304/202603041450.W3J71h31-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-6'
#15: 
Assisted-by: Claude:claude-opus-4-6

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
