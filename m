Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37FC340A57
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 19:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764186328; cv=none; b=n9rwcRDDC/gbF3iP1k4GmkNWqAZVIf/n9h9eyPPRd77TiZJJRg71XImeT1CMGTObBzEOh0x05fgUNSARpiXEZl0zznsNurU2HFqolLzqkORcFpV/oyQ8SjqnqHZ6gG4EjFg5G1dEhK33aYf1MNERZhfPFQ+fS5Nsy0JGLrwD+TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764186328; c=relaxed/simple;
	bh=UP3MAAjVBapV7j55ot6BHGmdmLanU3hbZm8ZLJJlfmY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JP4xRIipEOI4aX0WFe4AXexbN83SSH8Qu2Yj9j5s35Y1+c12RLiFrY+vDGlOlhkPHE+I5nkwl5bPbU7Po6cVu+aKxNqatrS1h7PJQxjQjhkXHw0S4F2Sa2TF/fEKyC8MErF/bbUnih0cnciAVf5v6vXpVQ7/P2UEqh+BFpBoSXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1eul9/m; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1eul9/m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764186327; x=1795722327;
  h=date:from:to:subject:message-id:mime-version;
  bh=UP3MAAjVBapV7j55ot6BHGmdmLanU3hbZm8ZLJJlfmY=;
  b=X1eul9/mG9J0XKEEVl2o7ZNcpSPBghBSgMcObWi2x1CHtUXT7MT/m9t0
   pI/7n0u1Iu2QA/VzjHA0quzLHZWDV/9Nz7kas0jw+dRNODHh1p9NEuCzu
   rDDEqtxsmrNHlQdCuE3MZXd2Sqr/+fghOdISUCHAaR0n3hXuu8AxfKTHV
   0pYiVHcWzuFU6nlUjQGzK6dkvFZV+eEX4rcvS0wbuS/Z/XCOUyGOPFTKM
   ZaeYryWAEtxsAMFmik+UJSa3IwX/FE5kYDWkn4V8ihen/Tf7kHzoqZzaC
   ncD1F36QY8ZyTfZEy4rVUXopDEyirFPp9t+xLKkR+XqogQ+1LsEB40q9z
   Q==;
X-CSE-ConnectionGUID: UF3X+KKUTw2U1Ywh/aO75g==
X-CSE-MsgGUID: rq3e6/kYRK67CEUmeroFMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66194271"
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="66194271"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 11:45:26 -0800
X-CSE-ConnectionGUID: TK0djKsAS3KA5DhPN4msbA==
X-CSE-MsgGUID: XCeCQt1rSu+YIFDmFXcQpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,229,1758610800"; 
   d="scan'208";a="192285197"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 26 Nov 2025 11:45:26 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOLS7-000000001PN-1XmK
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 19:45:23 +0000
Date: Wed, 26 Nov 2025 20:44:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:master 576/999] checkpatch: ERROR:SPACING: space required
 after that ',' (ctx:VxV)
Message-ID: <202511262018.TF5vsH5N-lkp@intel.com>
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
commit: 033347154bf3739b6b6f736bc8d027e3bf6dc3b0 [576/999] bcachefs: Compatibility with v6.18
:::::: branch date: 5 hours ago
:::::: commit date: 5 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511262018.TF5vsH5N-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required after that ',' (ctx:VxV)
#96: FILE: fs/bcachefs/util/darray.c:27:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#96: FILE: fs/bcachefs/util/darray.c:27:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#116: FILE: fs/bcachefs/util/util.h:52:
+#if defined(__KERNEL__) && LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                                                 ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#116: FILE: fs/bcachefs/util/util.h:52:
+#if defined(__KERNEL__) && LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                                                    ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#130: FILE: fs/bcachefs/util/util.h:69:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#130: FILE: fs/bcachefs/util/util.h:69:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#150: FILE: fs/bcachefs/vfs/direct.c:151:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#150: FILE: fs/bcachefs/vfs/direct.c:151:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#162: FILE: fs/bcachefs/vfs/direct.c:468:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#162: FILE: fs/bcachefs/vfs/direct.c:468:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                             ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#186: FILE: fs/bcachefs/vfs/ioctl.c:29:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                          ^

ERROR:SPACING: space required after that ',' (ctx:VxV)
#186: FILE: fs/bcachefs/vfs/ioctl.c:29:
+#if LINUX_VERSION_CODE < KERNEL_VERSION(6,18,0)
                                             ^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
