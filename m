Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E251DED4C
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Jun 2025 19:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749324933; cv=none; b=Iftnq2Ur4Y9WHaxrHif5Quv+wU/7lINj9azLo7CkannfT4r/LQq/hVqZQD8+bJs+NbXlAGYI17rT0ABhdjwkHl5LGabGeBw/Cch8z4grVaTKzpaBynFJ8Q5B9L+All4FdYhmGH5+QEuv9pVGfbt/VwrphOd/9QkU51HDCRYMGCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749324933; c=relaxed/simple;
	bh=NDhd2kzlYXVn0uw0IxvQkC+JcK81EDcWDhydxdFF7y8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aNxubyhpn0pEwe0VGoAUS0pKlq3ra2bAAiSzYQVnt6J4EIwdTz+ImziwxI5KsdQiIqs9qsIwQ7L07MHWqcbbXLSRoSbpq1ST4roe1veDRKO6akFMOL6nZGP0U6zoolYHu9oDwXbWFVx9pXVafFmQIoud+wvJk07TMtk8/AuI7Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bYGvkxxG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bYGvkxxG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749324932; x=1780860932;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NDhd2kzlYXVn0uw0IxvQkC+JcK81EDcWDhydxdFF7y8=;
  b=bYGvkxxGoBSFadNRLRKqHaImLHCnoE1PgWS3/94qLcn3lqCMpTFvVSXj
   VCqEMy5Y4xynwNn0C+tKJUsCHP35g1LzpmgkV6oeCN7V+EkQew83+zPQB
   TqTyd5FXyacwQf+ECWXkSCtzIS9AMFRYJftgoFJ2pmEjz/N91E4scjfdO
   OzmuidZVZl3s+wpfPMBf+LThGQsL9KQIZLAyY95sdO5y0Zrlyn5kKK7Qw
   wzZbdaYV0jaQZ7PP5vt925J8LjHXwzmAOMnjbXryQhrlkvVWTrfLrTVce
   Aemo3hjm295BZv9EsRh2q/upN8HUsp4ILBvzmiesvwznpzZYtN5xfBu/g
   A==;
X-CSE-ConnectionGUID: huvH0c3wQZKKriNcwv1+AQ==
X-CSE-MsgGUID: TyJr4G9cRG6rHdTIypWjSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="51330744"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="51330744"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 12:35:32 -0700
X-CSE-ConnectionGUID: +khOmLqaSP66Cy0GlPxRcA==
X-CSE-MsgGUID: xJJ9ksUmT6CSmR9RjoRPGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="146119606"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 07 Jun 2025 12:35:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNzKB-0005y3-1q;
	Sat, 07 Jun 2025 19:35:27 +0000
Date: Sun, 8 Jun 2025 03:34:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC PATCH] drm: Add support for io_uring's uring_cmd in
 DRM/accel
Message-ID: <202506080322.Lsc4bCGT-lkp@intel.com>
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
In-Reply-To: <20250606180806.2193463-1-zachary.mckevitt@oss.qualcomm.com>
References: <20250606180806.2193463-1-zachary.mckevitt@oss.qualcomm.com>
TO: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Hi Zack,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-exynos/exynos-drm-next]
[also build test WARNING on linus/master v6.15 next-20250606]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zack-McKevitt/drm-Add-support-for-io_uring-s-uring_cmd-in-DRM-accel/20250607-021118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
patch link:    https://lore.kernel.org/r/20250606180806.2193463-1-zachary.mckevitt%40oss.qualcomm.com
patch subject: [RFC PATCH] drm: Add support for io_uring's uring_cmd in DRM/accel
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: x86_64-randconfig-161-20250607 (https://download.01.org/0day-ci/archive/20250608/202506080322.Lsc4bCGT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506080322.Lsc4bCGT-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/drm_ioctl.c:958 drm_uring_cmd() warn: statement has no effect 'const'

vim +/const +958 drivers/gpu/drm/drm_ioctl.c

09504f8ef576ed Zack McKevitt 2025-06-06  940  
09504f8ef576ed Zack McKevitt 2025-06-06  941  /**
09504f8ef576ed Zack McKevitt 2025-06-06  942   * drm_uring_cmd - Implement uring_cmd callback for io_uring
09504f8ef576ed Zack McKevitt 2025-06-06  943   * @cmd: pointer to io_uring_cmd struct
09504f8ef576ed Zack McKevitt 2025-06-06  944   * @issue_flags: flags specified by io_uring's issue implementation
09504f8ef576ed Zack McKevitt 2025-06-06  945   *
09504f8ef576ed Zack McKevitt 2025-06-06  946   * This function implements the uring_cmd file operation to incorporate
09504f8ef576ed Zack McKevitt 2025-06-06  947   * arbitrary io_uring functionality for drm. Currently, it acts as a way
09504f8ef576ed Zack McKevitt 2025-06-06  948   * for io_uring to issue ioctls to a drm device, so this function
09504f8ef576ed Zack McKevitt 2025-06-06  949   * dispatches ioctls to the standard drm ioctl interface.
09504f8ef576ed Zack McKevitt 2025-06-06  950   *
09504f8ef576ed Zack McKevitt 2025-06-06  951   * Returns:
09504f8ef576ed Zack McKevitt 2025-06-06  952   * Zero on success, negative error code on failure.
09504f8ef576ed Zack McKevitt 2025-06-06  953   */
09504f8ef576ed Zack McKevitt 2025-06-06  954  int drm_uring_cmd(struct io_uring_cmd *cmd, unsigned int issue_flags)
09504f8ef576ed Zack McKevitt 2025-06-06  955  {
09504f8ef576ed Zack McKevitt 2025-06-06  956  	switch (cmd->cmd_op) {
09504f8ef576ed Zack McKevitt 2025-06-06  957  	case DRM_URING_CMD_IOCTL:
09504f8ef576ed Zack McKevitt 2025-06-06 @958  		const struct drm_uring_cmd_ioctl *drm_cmd = io_uring_sqe_cmd(cmd->sqe);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
