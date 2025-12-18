Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E2125EFBC
	for <oe-kbuild@lists.linux.dev>; Thu, 18 Dec 2025 01:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766021945; cv=none; b=HfvvwiC77iF+oX641aZpDKgUpBc9rBn3Nd9gUw3QbaTsLlVcq9/N9nz2cAlba6qzW4YwO6VIWPYQ49O3j7oXgSLCA+9KK0og79JIkfuVZz6c+EKcuTYk436CTbBwiAjpis9sLXFLamlScsalm3diasPpHFVPaob0DU9ItXs8tzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766021945; c=relaxed/simple;
	bh=6un07QV7U9tQKJlKA+VPJbW/h8Qv8d2lyuORCGS5Zzo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pOMe8zKxaGRlEo9AQX8eEV+qjXMY30WagVEwwKLrfMfkO22+D1tFUhMal3wpL6F7zXyRZV88pNaq4Gl0sgiPdOzZmkPns7nVwU5PCtkqmccX8Otoy/48qJ6dt7gIj8N/pDK69GP5o6WbgMR5uXJdBzpfwtqnsiEpMLctKrjoVjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JNKSyWSl; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JNKSyWSl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766021944; x=1797557944;
  h=date:from:to:subject:message-id:mime-version;
  bh=6un07QV7U9tQKJlKA+VPJbW/h8Qv8d2lyuORCGS5Zzo=;
  b=JNKSyWSl6LNiadB6cAC1EF+0wcvUMT4sEC1vInhZW0QR0J1EoIDih16N
   N78ozbKyUQgZiaf2QmthTXxFjPeUiWbRNNiPyvEjkl58M/QpXTISzq86I
   nDTjegE8stqIKJDvCkHVhh83+ccSqWFNHHcAb77n6FwIyGxgfjg25mkqZ
   ELWlBXbRgMIa/hJ+j67SdEjfi3adWVZICK0+Hms+fOKxA7ErmAeATKdX9
   WibC+hllFiCPfTIAEuCJWcUff6w1OkKB6c8dyTJn0omIFO23rRRevkleh
   JB62bZlw83PcaGVaY140jNWpeDoaBgyALlwGzqzRSh1Wqo4cJ+Ph28y0o
   A==;
X-CSE-ConnectionGUID: HxFt/LljRfK0thjqLsH+Hg==
X-CSE-MsgGUID: GsO25e3/RV2tSgF7zbvqBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="90630444"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="90630444"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 17:39:03 -0800
X-CSE-ConnectionGUID: NVUbBtjDR6OBvB2MVehE+g==
X-CSE-MsgGUID: ajeEcO4nSECfEkvUlydUVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198224782"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 17 Dec 2025 17:39:03 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW2yq-000000003ng-2ST6
	for oe-kbuild@lists.linux.dev;
	Thu, 18 Dec 2025 01:39:00 +0000
Date: Thu, 18 Dec 2025 02:38:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:cifs-cleanup 28/37] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'from'
Message-ID: <202512180203.QfGbvGm9-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git cifs-cleanup
head:   b85103543e0f050c63f5bdace9c2cef1b53c6e1f
commit: fcbcc65031335d36c8a0f4c5ca73f0e6c0279e70 [28/37] cifs: SMB1 split: Don't return smb_hdr from cifs_{,small_}buf_get()
:::::: branch date: 78 minutes ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251218/202512180203.QfGbvGm9-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'from'
#7: 
Return void* rather than struct smb_hdr* from from cifs_buf_get() and

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
