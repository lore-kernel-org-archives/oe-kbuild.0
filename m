Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1745C3009C1
	for <oe-kbuild@lists.linux.dev>; Fri, 30 Jan 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769778609; cv=none; b=UH55nueEDhUJlXNakN8c3xEL6TEAC+oWDrYnseJrd1xU7xZ3HM5fSrHNm4N1OQcxHxQbDndWT/DGw/ikz/S/QJkEz+sFo+CQKRFvI/3Q8uT6krjJQ6t9ZGPF4VTkp/dp0/ofEYtV/cw2iPf8eSl73/OG0hqa29x7QXaLWkng5YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769778609; c=relaxed/simple;
	bh=kCb+QTsmKTuHTkAnuaFUTay90TF/qItDvEz+VkUw3Sg=;
	h=Date:From:To:Subject:Message-ID; b=NROHaTbG0ef4A166tpJyN+1tYvK7qwFml0RyrSP0SWrRus5ttHflDxxsC9nulNO4tvHEMjDwjCw8Al5Jp93jQTYKPOtgDpuqyAsgozu7oOXnCQQcWV0rlojyUeDTkxKlP9qCGMJjJw2DDtJdn5Ej+rUxf9EyW9oMp8tXu8+MQAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5RgunEw; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5RgunEw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769778608; x=1801314608;
  h=date:from:to:subject:message-id;
  bh=kCb+QTsmKTuHTkAnuaFUTay90TF/qItDvEz+VkUw3Sg=;
  b=T5RgunEwQlTtDIxYPl8z7KWxNveZihz+DabVTsOz37ITf5xsjdNqnvns
   jy6OqTKUsCYWLQnTAmZnFVuqkDn5zFEQnuRLMlUGDtGNp/tIaX8v7JO8m
   RO6e6wMMB6VosobbZawIvC+us46uKf47cPypRMv+fVXi1GkVfwKrIjUUI
   mKosjl92VsX6oAcz7aBBeOmC8Uwf0yfwaAvp2q9ZHt7WQoPGyMuD7ubAD
   LGOokHNC7jhE/qGwSuKxayxFgBck/UYfakMt+d+UZxu8ZOaKvUxja6pXd
   DAVKuM71QTOgfjQ+h2NdsCTwarzj1DKULaXaP62Ug0bHCa8dw3K4ijubs
   g==;
X-CSE-ConnectionGUID: QPy58/8tSA+Gscffs81k9A==
X-CSE-MsgGUID: pPIkFV9URxyy83D3MW99pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74880723"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="74880723"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2026 05:10:07 -0800
X-CSE-ConnectionGUID: E2BVg1pnTuCfDw5cpe/x1Q==
X-CSE-MsgGUID: JNirMLcNRh6/9jwbdB4b/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; 
   d="scan'208";a="239574476"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 30 Jan 2026 05:10:07 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vloGC-000000002VH-1lG5
	for oe-kbuild@lists.linux.dev;
	Fri, 30 Jan 2026 13:10:04 +0000
Date: Fri, 30 Jan 2026 14:09:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [kdave-btrfs-devel:misc-next 134/134] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-5'
Message-ID: <202601301417.zHHdvmcX-lkp@intel.com>
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
TO: Boris Burkov <boris@bur.io>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   34bf269b8ab7e55aeb7fbf229db39ca0a728df19
commit: 34bf269b8ab7e55aeb7fbf229db39ca0a728df19 [134/134] btrfs: tests: add unit tests for pending extent walking functions
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260130/202601301417.zHHdvmcX-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Claude:claude-opus-4-5'
#30: 
Assisted-by: Claude:claude-opus-4-5

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
