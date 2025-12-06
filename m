Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5342F60CC
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Dec 2025 12:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765025284; cv=none; b=h/KRdWqMaAMDAp67svlS06bkB9NEhIFT5vTFBC4zUXH/n3j1X9bAqF/hoJ/KMt6dG+GlEiMenhyyaCjK5FhQYEVIhWRTKVW4CtUbteTyBpFJ55yhCzQ6r0gK84/4RwgYezDd0UH1iN04PZQ6YXwpwOth6Ox1NrR1D6TRucQwuEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765025284; c=relaxed/simple;
	bh=zBTquRYngMbAVULZxCX6Z0heouWcMhOFfkp1R88Cek4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mb3HWtu+f2Q6YClDge2MmC9icMJksRbkDR1TkrSNJmvVB5mJbjrlsAnmdWe0b/C24JZkU6qPwKo1spMNP5fmANX1AHFe/MG3RQu8z7fLcIuO/cnKFExKbL6VpR8Zc7kNip48FZCuPemCSNSutl3h4qF99lP+tCc332KSofc2kT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGH3ompn; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGH3ompn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765025283; x=1796561283;
  h=date:from:to:subject:message-id:mime-version;
  bh=zBTquRYngMbAVULZxCX6Z0heouWcMhOFfkp1R88Cek4=;
  b=nGH3ompnJMH0mFU1aEQ5K3sAZIHBU2fDKX63zmPle/h4UPFLXEUpn3hz
   oXfqj1ftJhQI5hFy3U0VrnAIp0lkhp8X8W0qITz/vZlc2TmgihuXFg8b9
   ULuIn+YYIj37BbqHzbGGu8Pqmsp7BUHJZckMZohjhd0eRep3IRGjkKcwG
   Z3xzxRkiiaOOgQFt7Xl4M3g9bO6pwvq+AAAQS9CAUCpfDoPfOUbRYDsyS
   OTdvN7YtYxTbtLq9ykROYIeuO7J8eChl7Jsvo36ImJOVboZKqHcXJ/WPY
   OTs7JVhuHjZUifhoFdvPm7zt9DPaWxggWOdeTGRBSxgvoTaRbTRlZa2V9
   w==;
X-CSE-ConnectionGUID: zUVBv7WLQc+o9KK/d1zM/w==
X-CSE-MsgGUID: /DtIJ97pTnC4tPp97Hz33Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="66227124"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66227124"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 04:48:01 -0800
X-CSE-ConnectionGUID: wxy1YiZYSk20jBxKrAazWw==
X-CSE-MsgGUID: Nduq8vQGRae3onV9cMxjpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="226179684"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2025 04:48:00 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRrhd-00000000163-2KZH
	for oe-kbuild@lists.linux.dev;
	Sat, 06 Dec 2025 12:47:57 +0000
Date: Sat, 6 Dec 2025 13:47:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [device-mapper-dm:dm-6.19 16/29] checkpatch: WARNING:REPEATED_WORD:
 Possible repeated word: 'could'
Message-ID: <202512061300.GdVFVVx1-lkp@intel.com>
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
TO: Mikulas Patocka <mpatocka@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/device-mapper/linux-dm.git dm-6.19
head:   58a0cbb4f70a5dfbb7b70b50ad2e13026186b14e
commit: 7f75a7c9213aa5233310b20b8a5b3fd590c4948a [16/29] dm: test for REQ_ATOMIC in dm_accept_partial_bio()
:::::: branch date: 76 minutes ago
:::::: commit date: 2 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251206/202512061300.GdVFVVx1-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'could'
#11: 
otherwise this BUG could could be triggered by stray bios that have the

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
