Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B0033DEF7
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764186088; cv=none; b=dAVsnbT1PBArAxBDtcmSfRzCLI6lyRjAYngXuE87ynwNbrA0SfssGsFGXHy/s6MlRtSYJ0HVSMDCvFqkB/BuG7OqrUw6dgOVW/z8iz3rLlksBfVlmStpxw4wYtrEG+NPO+4QUueUW7ioIaoRkTGzA8H+FTVbjW4fEuXAc6PVsXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764186088; c=relaxed/simple;
	bh=/4tHGOVPKbEaNCg3t27Dv+s1SdLoE1+G8k+NIncHkJI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/fzWtGTuECeyTAvOSl3E9SnhOKGt01Vd8APmF8v35ol8V1S8ePRjFyEwO882BFpTP6V25EtjNrIMsrpIqEMYSqrQ/wrWdKYwDPt4QBuuJSynsOh61qAhaUB7CL4A5kC0yrdHyHURG8ZZzMVzf1DNkkcPJuSUIKKc9C2hlHfwg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nUdrNH9v; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nUdrNH9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764186086; x=1795722086;
  h=date:from:to:subject:message-id:mime-version;
  bh=/4tHGOVPKbEaNCg3t27Dv+s1SdLoE1+G8k+NIncHkJI=;
  b=nUdrNH9vCtd+3IWqqae+kbvVdSdQBY9rprClP68evykVj/LHhbp00zxu
   qJNmcpEQ/EvczHzDWZYkb4a2k4D1T5/39hu8KnQDXNwQUwID1jsLP3Zm/
   SZ62NW74Dd9U9WN+fUi08ocjpKjXkt8VqZpj4BbF6mfBOYuoAf68VS4Js
   iH7WLk91TgyqA3579ycRNd7wgg37EzhtYbeY7NrLFLDI/WTMvyh29hjvR
   5u7XvA1PqRyilZq2RTKg+XFUXL8SQOIt7cd0reFki1j16m3ItYVoL5Qyr
   +az41is+rcJGy+4HVG9xoR5S3PLDp5TZBcTrfLtYZObgRtDlsHfVCsZbV
   w==;
X-CSE-ConnectionGUID: +SsSJWa5RLeYS2zGXjgFkg==
X-CSE-MsgGUID: AjsE1dfWSTKiN3pVo+EiRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="69855353"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="69855353"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:41:26 -0800
X-CSE-ConnectionGUID: getiqWX2T5WQTZAqFlcj2w==
X-CSE-MsgGUID: vNIEshSdQ/+03Jo60fS4Zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="197361181"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2025 11:41:24 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLOE-000000001Nv-1zGm
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:41:22 +0000
Date: Wed, 26 Nov 2025 20:41:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 518/999] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202511262052.LfC4RM40-lkp@intel.com>
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
commit: 383cf0dacfb4922419e7d38a3c22766d62fddc05 [518/999] bcachefs: more __free() conversion
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262052.LfC4RM40-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#212: FILE: fs/bcachefs/init/chardev.c:629:
+	try(copy_to_user_errcode(user_arg, &arg, sizeof(arg)));;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
