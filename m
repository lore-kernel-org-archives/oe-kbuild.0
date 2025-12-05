Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D407719D093
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Dec 2025 18:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959276; cv=none; b=WAHuPB9ePC2jOQWKeLbUl2PqXEIMXZUxrZdRNjbb6RC0cjTL/TP97Rdv8PbynXL77Ng0TEYeUdSOltTQ0q0a9bBWudnvfkyKzPTrpgcITs75jJ/dlrkfmsUH6kWWVR7YRIhaPpChI5FCOGYcbtvkZKbCq19F4ey+DJ3N4o4jUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959276; c=relaxed/simple;
	bh=5PQdbhOi/DRc6827LVi7LmrVYcvExjgEC6U0s1Yzarg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RsWiFwB/E0RDIrNVbjAukmb4c7kI741/PS7eQSqxGjCeklBz+FuaRROwkDv0IKB18X+LSzGOPZB6aZxIL65usX0G/ocfHtd8ZcPJyRmQnnQ/ELVs2zzFq9M/irmJa9Y/pt/Tq2xbM6PkTKNH9N6ql3jl8bYGKSjyMwY3ThlDGe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGwiPV/G; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGwiPV/G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764959275; x=1796495275;
  h=date:from:to:subject:message-id:mime-version;
  bh=5PQdbhOi/DRc6827LVi7LmrVYcvExjgEC6U0s1Yzarg=;
  b=WGwiPV/GKi+U3Gr+xjKpbKf4kPK7sXAnZlhZSt5La+OkBmCZtNgpZg0H
   WCYKOf5UR2OofjhTnn3/Pca0o3GxYJelxFC3PCNYrfbh2CNUmKlaj6Hgi
   BceVEDSMtCc3NBHxBochBlUURvJfIhd6PaQZwaLxbjOOAPncab8Ym0M9F
   VF+jM/FG8hmAgGeN0Q2w4rTLGjz6HiqqmflF3IDHI5cEnomFyor6w8iNw
   IukLhDI5cFsL7wtFbGVIjPXHT1/jg9xH6ZrT++QYRG7/3YcE3utDTIIOO
   NOy2CAiQxZARxJRo4poSRQWED9LoZD0pIKGKDmzqm8EWvNIi2Ck40VMUQ
   A==;
X-CSE-ConnectionGUID: S1Wy4AFzTQipC8p58EFcqA==
X-CSE-MsgGUID: Pw7ONP4XSDKneNk9mU3aGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="78109540"
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="78109540"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 10:27:55 -0800
X-CSE-ConnectionGUID: ZZZOmcZYSUivJ0yG8muChg==
X-CSE-MsgGUID: A1y1/cEpQWmjDzlYuOoIxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,252,1758610800"; 
   d="scan'208";a="200500190"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 05 Dec 2025 10:27:54 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRaX1-000000000y7-3KOF
	for oe-kbuild@lists.linux.dev;
	Fri, 05 Dec 2025 18:27:51 +0000
Date: Fri, 5 Dec 2025 19:27:39 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [lenb:turbostat 6/24] checkpatch: ERROR:RETURN_PARENTHESES: return
 is not a function, parentheses are not required
Message-ID: <202512051913.sHYym7Th-lkp@intel.com>
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
TO: Len Brown <len.brown@intel.com>

tree:   https://github.com/lenb/linux turbostat
head:   033c41888d8173ce16d8a8e9cc2c9cbdea792e75
commit: 696d15cbd8c2cf29a8e7486bf9fbf085f4cefed6 [6/24] tools/power turbostat: Refactor floating point printout code
:::::: branch date: 50 minutes ago
:::::: commit date: 6 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251205/202512051913.sHYym7Th-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not required
#26: FILE: tools/power/x86/turbostat/turbostat.c:2741:
+	return (sprintf(outp, "%s%0.2f", (*printed++ ? delim : ""), value));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
