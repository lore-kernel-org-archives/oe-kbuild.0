Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FB830E847
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Nov 2025 06:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763362167; cv=none; b=OSSrLShcumA/cfWGC3h5pCT7uIOp12fHPT6riV+35CKNvj/lJ+2rArR0VRe3+lt2SgPzKr6GJx8fniEN/roAAcUeDytjbW9Kywt7bNS2xaK4+V+DdZUWgCkWiMNgHWqFH4rbBIIrW0rmvePwQUm78zR3sddFq4oTvEzw5xOtW/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763362167; c=relaxed/simple;
	bh=ayOuk2UQ5Tv4BIHM6ChykPBFV4iY3GPIO8n1j+HTQ9E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fCSR7ThbJV+jcnjgsxtFb96lsf/CDfokZThO3hYUnGi7EK72MlcwiaGtPFhU33JJaqaHSNl3SxkMyTFY5NvF/0E1ap1cG3DfI4WDegqkBk8krQXUnXfMKgv4da+oKGG2OPKPn+JRj07CQ0zkzN0VQCMbUxegXCxOmEx8/bgzWoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JTZ56FPE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JTZ56FPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763362165; x=1794898165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ayOuk2UQ5Tv4BIHM6ChykPBFV4iY3GPIO8n1j+HTQ9E=;
  b=JTZ56FPEG7wjMIbwNX52hil+lWOViGi+p/7hQzLvFwgsHHBJWqtOD+5+
   SIBGrMt4y38g4JZE+u2ruHfsj0P04ROF1Nkb3W/cC9D7FIfkJ9cqoXrOG
   EjG9F61Z3URZ03VTNxxFAidouTY8sWPMeQD47oywtX6VT/ym//p5d+U3y
   oQBAdDFnv2t1149M6AwyLRFPFZl/lFCeGZg1fEK5Fhn9toEfIUknGfBSL
   OzwP0OQo4mpsOiNuUyqjF6NNcwmWs0SD23gWK6ha7RoZXK0q9sQDIWLby
   xD2P/9TlTUbEPWdWn1Uhdmm2SeQifjsl+2oUkpIkO0JdqGLNw5RpWw3Y6
   w==;
X-CSE-ConnectionGUID: KExCSgU2QrylZG5W0RPZww==
X-CSE-MsgGUID: YfVwJc3kTqOXIETh+V2jgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11615"; a="82742137"
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="82742137"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2025 22:49:21 -0800
X-CSE-ConnectionGUID: KWyHcRbcQJqGiS32GD3hhQ==
X-CSE-MsgGUID: oAamnJKMTV6zFHP1GW6K9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,311,1754982000"; 
   d="scan'208";a="189668874"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Nov 2025 22:49:21 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vKt38-0000ES-1J;
	Mon, 17 Nov 2025 06:49:18 +0000
Date: Mon, 17 Nov 2025 14:48:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] fs: move mntput_no_expire() slowpath into a dedicated
 routine
Message-ID: <202511171219.cCv4BBxg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251114201803.2183505-1-mjguzik@gmail.com>
References: <20251114201803.2183505-1-mjguzik@gmail.com>
TO: Mateusz Guzik <mjguzik@gmail.com>
TO: viro@zeniv.linux.org.uk
CC: brauner@kernel.org
CC: jack@suse.cz
CC: linux-kernel@vger.kernel.org
CC: linux-fsdevel@vger.kernel.org
CC: Mateusz Guzik <mjguzik@gmail.com>

Hi Mateusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on brauner-vfs/vfs.all]
[also build test WARNING on linus/master v6.18-rc6 next-20251114]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mateusz-Guzik/fs-move-mntput_no_expire-slowpath-into-a-dedicated-routine/20251115-042059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.all
patch link:    https://lore.kernel.org/r/20251114201803.2183505-1-mjguzik%40gmail.com
patch subject: [PATCH] fs: move mntput_no_expire() slowpath into a dedicated routine
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-randconfig-r073-20251117 (https://download.01.org/0day-ci/archive/20251117/202511171219.cCv4BBxg-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511171219.cCv4BBxg-lkp@intel.com/

New smatch warnings:
fs/namespace.c:1422 mntput_no_expire() warn: inconsistent returns 'rcu_read'.

Old smatch warnings:
fs/namespace.c:2834 may_change_propagation() warn: inconsistent indenting
fs/namespace.c:4739 mount_setattr_prepare() error: uninitialized symbol 'err'.

vim +/rcu_read +1422 fs/namespace.c

b3e19d924b6eaf Nicholas Piggin 2011-01-07  1404  
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1405  static void mntput_no_expire(struct mount *mnt)
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1406  {
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1407  	rcu_read_lock();
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1408  	if (likely(READ_ONCE(mnt->mnt_ns))) {
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1409  		/*
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1410  		 * Since we don't do lock_mount_hash() here,
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1411  		 * ->mnt_ns can change under us.  However, if it's
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1412  		 * non-NULL, then there's a reference that won't
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1413  		 * be dropped until after an RCU delay done after
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1414  		 * turning ->mnt_ns NULL.  So if we observe it
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1415  		 * non-NULL under rcu_read_lock(), the reference
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1416  		 * we are dropping is not the final one.
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1417  		 */
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1418  		mnt_add_count(mnt, -1);
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1419  		rcu_read_unlock();
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1420  		return;
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1421  	}
f644eac96cf3c0 Mateusz Guzik   2025-11-14 @1422  	mntput_no_expire_slowpath(mnt);
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1423  }
f644eac96cf3c0 Mateusz Guzik   2025-11-14  1424  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
