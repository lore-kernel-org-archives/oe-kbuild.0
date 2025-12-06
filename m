Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B756227FB3A
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Dec 2025 22:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765058765; cv=none; b=NOFYduwSJSGi3Fe2SLgjjlV2hw/YZQaA4YBC8hIp3DOVavGIbBfWYHH3KwsXZ3faZLtq+MD/fVW+jaswfuN5XHT50ao5F0CjmWxejj9a1XRNjHRA2VL2QQNxhnks97lUvk48YPq7FMhxpZ/TUiSz1xwXEgNSvSUS5Af3ktiHQXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765058765; c=relaxed/simple;
	bh=iT5lsgOeN3Lwfn+6BO89vyROZ8bXdvTzy7mfxVstlHg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NBW8Bm3zFj6ae3v6eHuPacyCnpGwmc9vd4JZU/W86DG1tM7U/HOPQssW6/Aox5DlR58Wgb+mlCC0BcnRIr3UMePba8EvQ3QgYTM60ywxSWIex8V906mNJyq8k1HDW2d4HF1pbCFSuq+sRXOKa6yhMUGjPa6SLEhZpXhFZjUhXY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bWu/UOzJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bWu/UOzJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765058764; x=1796594764;
  h=date:from:to:subject:message-id:mime-version;
  bh=iT5lsgOeN3Lwfn+6BO89vyROZ8bXdvTzy7mfxVstlHg=;
  b=bWu/UOzJWPKwtw36KPgajlHgesEKFQfCG/P5Hr5E/JlZMPUiKoHNRp5z
   3122QM3K5QXGAi/j3YYD8ZRM1wlbR6bqG6FJBP3Kz12XBFka2dSDpNZw9
   /qZmtGURv/MI1kQGuOXzKrmZ4sZG6Ek49o16oKg6BMkJKiqTNCV2RydCR
   Jw0KvVXeFuxuP+C+jupbYrR+xLj/SkkyHEac+VNZ3iHK2zK94Mn8I/1OL
   +shyyHeQNXo0tiWr9moUYl9gQyOk6Le/jbRrdqUsluwcesEkEgbo8vUzY
   DfHQ8xPkqlHXALmhGB+V+7UESQw+U6wo8f3GBjd0ZBqzWVF5AL4TLs8fB
   g==;
X-CSE-ConnectionGUID: YOaipDzaSYy9dQus6IhW+Q==
X-CSE-MsgGUID: qdfGbf7tTK6gOoAVbj5Dxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="70908764"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="70908764"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 14:06:02 -0800
X-CSE-ConnectionGUID: TWVXZKipQG27kq/fmh52NQ==
X-CSE-MsgGUID: qQ8njcw9QiSXERYhiY+unA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="200726046"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 06 Dec 2025 14:06:02 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vS0Pf-0000000018r-2c5g
	for oe-kbuild@lists.linux.dev;
	Sat, 06 Dec 2025 22:05:59 +0000
Date: Sat, 6 Dec 2025 23:05:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-nonmm-unstable 59/74] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'user'
Message-ID: <202512062302.vzQ1bgBS-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   9db2412368aeb2bbec725122f9100dcd69c6c3d5
commit: 3955ae0102f35216848ccd7f7c30ca6847f56328 [59/74] liveupdate: luo_flb: introduce File-Lifecycle-Bound global state
:::::: branch date: 68 minutes ago
:::::: commit date: 68 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251206/202512062302.vzQ1bgBS-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'user'
#25: 
This patch does not have current user user, but multiple streams depend on

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
