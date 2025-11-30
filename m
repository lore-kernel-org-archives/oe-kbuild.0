Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BBE17A2FC
	for <oe-kbuild@lists.linux.dev>; Sun, 30 Nov 2025 05:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764479720; cv=none; b=cM+SzJZK01g9RSWr/vvr3eSGgc0DcTXMPPfxKEypBxR9/UHJYuO4NI8eWgGg05NlYqfVFyADRHmoQHpv29j2fph4k8+DdDJ0dqDC9EfXTu9y8juvp+31Z0m9T5HIfI37NESUVJqrLlpgCP3VeAfq9Rb262u5rC7ar5E91zdCKR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764479720; c=relaxed/simple;
	bh=S6Rkxc1/1lM5uz1T9fgLGbVQAVaYFvLLOYI9I2m2OL8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FrSDA6w6r6PoT8eqe/A/8aLez3KuB/haCGIdEp7fzixu/3ztZZT5kEMlN5Ev+nkteJgZerEhjhAXZUEqjoU0ho8v+UX5ncpBBc3npIOOHH7gqtvg4Rx+KwZC9O//jt+lcUjeYz5j/IZsic5YtbGvvZ2+nbzSkq2BW8KK+aFVptE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mOjIVzfq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mOjIVzfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764479718; x=1796015718;
  h=date:from:to:subject:message-id:mime-version;
  bh=S6Rkxc1/1lM5uz1T9fgLGbVQAVaYFvLLOYI9I2m2OL8=;
  b=mOjIVzfqpBR8RMo8FrcrBYohU/v+xyc+V+TZDnTI2sTLh9HCFYJ9PXSx
   A7/YtKOELC9YtlK44pFRWeQj0fbjznBuBWNM0nYl1IlBwEvljuyfEAKYH
   P+6ZeKyBxbAczQbhXI1LKLu4sOSGoSLpbiuMecQMdsq8YT+0ZwdodNOIO
   J0WJBXNET6Np6FvKkSQXhoMCnky7ywXzUB4n0meHjc/pNCOGarVfp7fmh
   GYOAmsWQSjf0HcPw6pOa2cJMRMLuDJP7FzRNdoRV0iRE56w0BqY5/ttFv
   cxBY4S67Lci28qQmQZ15wUTan2DRAoc6mG9I5S6NdTp1kMYBAO/ukIYmT
   Q==;
X-CSE-ConnectionGUID: uydjuGEPRy2p84t2fmlc2w==
X-CSE-MsgGUID: 6YWDw11kSdi++o/1JL20sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66160230"
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="66160230"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 21:15:17 -0800
X-CSE-ConnectionGUID: vZVY6ciYSTSakWAvQ24VNg==
X-CSE-MsgGUID: CxjPhDpDRgO+c2A+q/z8Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,238,1758610800"; 
   d="scan'208";a="193443364"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Nov 2025 21:15:16 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPZmE-000000002Uf-0wEX
	for oe-kbuild@lists.linux.dev;
	Sun, 30 Nov 2025 05:15:14 +0000
Date: Sun, 30 Nov 2025 06:14:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [acpi:turbostat 6/10] checkpatch: ERROR:RETURN_PARENTHESES: return
 is not a function, parentheses are not required
Message-ID: <202511300625.2ZPjM9ao-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git turbostat
head:   920d6cfa40be196f789456ffd012f53527abf272
commit: 696d15cbd8c2cf29a8e7486bf9fbf085f4cefed6 [6/10] tools/power turbostat: Refactor floating point printout code
:::::: branch date: 69 minutes ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251130/202511300625.2ZPjM9ao-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:RETURN_PARENTHESES: return is not a function, parentheses are not required
#26: FILE: tools/power/x86/turbostat/turbostat.c:2741:
+	return (sprintf(outp, "%s%0.2f", (*printed++ ? delim : ""), value));

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
