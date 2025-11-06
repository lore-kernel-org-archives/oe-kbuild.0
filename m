Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8658830CD89
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Nov 2025 09:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422126; cv=none; b=jq7AB9hGy/NZFsvJW8bUXr0LnN3prl2qj7ig1nfFqlpM0V7OA7FeLEYOmMzftmq87/UL8nbZ66qVxQdBDMqAQXNaGM87nojX/4xJJR/Rryye6cJu9Xpu5lMljAomlfBmxAij5aaq8YxpW790ZN7fP2eJvVfnm9H6x8h+pYjtDq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422126; c=relaxed/simple;
	bh=cI5wYj7+CwqsHo06i/ihWn2OUYk/w4dpnaPzbW5qYJ0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OsgKnBW3unTF0xynYDlLN6u+QTT0l7BsZjWNkHaTxWoSsC2Qi6MwKsP09xO5BCgKUgzAKmARs+ppRygrG0iGObahCsHuNSRr7FXILnic6Pvy2w27AeiuExhy4E+S/LzEIpZAkQ9SOxXhbhef3RfMhH1pa/4Cm1fOhX3ntB3Fv2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFkQs8HA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFkQs8HA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762422124; x=1793958124;
  h=date:from:to:subject:message-id:mime-version;
  bh=cI5wYj7+CwqsHo06i/ihWn2OUYk/w4dpnaPzbW5qYJ0=;
  b=QFkQs8HA5r22Po4EC6IvkNOAr220KBzccdc1ceSZ2zQRtfD3Mvb2efac
   bsDrlw98VngWIX83g+fy3ZMCYZBu7TljTDjM49911FyQkR7aoNrWX1BoS
   Om0shNJVBzg7ERzGABeBOegnA3yPIw3CF5c8yxCIXc4d69SB00UK6E/DP
   zMKjlCX0/aVmXjHT2Y5SUdixpmSQ7rFpdpo1ScT/BGD2kxAXw3gxOiw0G
   r+IdRXsGUw/pZl6T4kimLqqUtgD+PnV85e6FF4F/i6dtEVZ6/Xxle2RXd
   KP1bq0PDBvQLfmTuKW7uoFAEp2z0bS/tJ35DOZ9/0aEw5GKP+wpFHZJu2
   A==;
X-CSE-ConnectionGUID: UTlzgcIBQaeznqTNh8s8oQ==
X-CSE-MsgGUID: /9oyRLRTQKeY+FgUOquvkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="63565083"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="63565083"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 01:42:03 -0800
X-CSE-ConnectionGUID: FWvY/xdQSUWUuebDAWbvzw==
X-CSE-MsgGUID: i/umM8XDRPGnG9Y/qCM+pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="187658044"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2025 01:42:02 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vGwVD-000000002v6-2gPv
	for oe-kbuild@lists.linux.dev;
	Thu, 06 Nov 2025 09:41:59 +0000
Date: Thu, 6 Nov 2025 10:41:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [viro-vfs:untested.efivarfs 3/54] checkpatch: ERROR: code indent
 should use tabs where possible
Message-ID: <202511061011.dAIUolTE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Al Viro <viro@zeniv.linux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git untested.efivarfs
head:   36051c77301534759fd96e906ea11c5d09bdf81f
commit: 5aaad153df2076254f2db4b4e328aa5d9ebfe66e [3/54] new helper: simple_remove_by_name()
reproduce: (https://download.01.org/0day-ci/archive/20251106/202511061011.dAIUolTE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061011.dAIUolTE-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:CODE_INDENT: code indent should use tabs where possible
#53: FILE: fs/libfs.c:659:
+                           void (*callback)(struct dentry *))$

ERROR:CODE_INDENT: code indent should use tabs where possible
#77: FILE: include/linux/fs.h:3635:
+                              void (*callback)(struct dentry *));$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
