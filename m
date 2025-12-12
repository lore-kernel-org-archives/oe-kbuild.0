Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31021339B1
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 12:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765544217; cv=none; b=q06++r8u5SaBNjhR+M6+CtaBIiHbRJcjsqSK5vc0/HoNY4VapZgIV1TBS24xR13IhiVQOX7oK7c0if9n/rtOeU7G97IYw1/zKfsYHvcVHnEVlNuObbC9shhmnLIzt7hS2LEaXk5/o+DYaBs0JrkpcOSSWKNHzBU7oxyEv/YRBBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765544217; c=relaxed/simple;
	bh=qbsgz4vaRqdTgZHOQSee+jeAAYEgI7JXGQf2OCzro3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=spOLJVvOtTFlsSusrLRD+W4ZtatNvWsJv+klUs16LgJYll4oek/SXEUUdX4KJ0x8TUUFFRc0P+TY84jyH3D3xAenuO9xnj9gXXfzlCTYXRADQhlkhwVG8fo4MzCioxbnSBTUqkirNwNROTiWTr71a+p5CCpcj7r1R8fjdHCnKlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J2MGBH2V; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J2MGBH2V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765544216; x=1797080216;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=qbsgz4vaRqdTgZHOQSee+jeAAYEgI7JXGQf2OCzro3A=;
  b=J2MGBH2VX+9ucvAvvsqsfjp8lUwf7EUcUHM2k1GL8yIn6Ao4DxpYpFn+
   eVfL2r03hThUdGXJm+gBOrjK/RBZ/0QXH80PpZTIv+AiIGeMn+SGHqCoM
   WSnw1tvMfW1vxZ4CHaO+mdNjHL3GOF+GvpHeZzRoxdLSCKrinR11IIqFe
   2zSHhwtBxWa8fqixPc5fKHZ+J9qZ6ox/mG/Iq84G6Shx7DMKrt8IFmHvF
   on0SiWZJVC0stqSu6F5FufOcYBL+hY+KDWyz9EPwXgZ+YsHGehF5QKw0W
   +ia3pEktza2NdpZB260LgzTWv55z30eQkqCqEbVoHaZr2TCOkJNHiHvWB
   w==;
X-CSE-ConnectionGUID: HU4434xYQXSK5b+zFB2HkA==
X-CSE-MsgGUID: rj2IRHkXRTmSuIm7OfdXMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="93023224"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="93023224"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 04:56:55 -0800
X-CSE-ConnectionGUID: Zxc9oJf7RsmhhaAakxw6ew==
X-CSE-MsgGUID: JZirkuxiSaiugFtyd/WYIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="234488600"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 04:56:54 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU2hX-00000000645-3T5h;
	Fri, 12 Dec 2025 12:56:51 +0000
Date: Fri, 12 Dec 2025 20:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/scheduler/sched_main.c:1097
 drm_sched_select_entity() error: uninitialized symbol 'entity'.
Message-ID: <202512122032.MLo3oh0R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Philipp Stanner <phasta@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   187d0801404f415f22c0b31531982c7ea97fa341
commit: 5a99350794fec11faaed8a4b36a6931e696f672f drm/sched: Add scheduler unit testing infrastructure and some basic tests
date:   9 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 9 months ago
config: nios2-randconfig-r071-20251212 (https://download.01.org/0day-ci/archive/20251212/202512122032.MLo3oh0R-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512122032.MLo3oh0R-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/scheduler/sched_main.c:1097 drm_sched_select_entity() error: uninitialized symbol 'entity'.

Old smatch warnings:
arch/nios2/include/asm/thread_info.h:62 current_thread_info() error: uninitialized symbol 'sp'.

vim +/entity +1097 drivers/gpu/drm/scheduler/sched_main.c

88079006dc412c drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-24  1069  
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1070  /**
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1071   * drm_sched_select_entity - Select next entity to process
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1072   *
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1073   * @sched: scheduler instance
2d33948e4e00b5 drivers/gpu/drm/scheduler/gpu_scheduler.c     Nayan Deshmukh    2018-05-29  1074   *
a78422e9dff366 drivers/gpu/drm/scheduler/sched_main.c        Danilo Krummrich  2023-11-10  1075   * Return an entity to process or NULL if none are found.
a78422e9dff366 drivers/gpu/drm/scheduler/sched_main.c        Danilo Krummrich  2023-11-10  1076   *
a78422e9dff366 drivers/gpu/drm/scheduler/sched_main.c        Danilo Krummrich  2023-11-10  1077   * Note, that we break out of the for-loop when "entity" is non-null, which can
a78422e9dff366 drivers/gpu/drm/scheduler/sched_main.c        Danilo Krummrich  2023-11-10  1078   * also be an error-pointer--this assures we don't process lower priority
a78422e9dff366 drivers/gpu/drm/scheduler/sched_main.c        Danilo Krummrich  2023-11-10  1079   * run-queues. See comments in the respectively called functions.
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1080   */
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach       2017-12-06  1081  static struct drm_sched_entity *
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach       2017-12-06  1082  drm_sched_select_entity(struct drm_gpu_scheduler *sched)
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1083  {
1b1f42d8fde4fe drivers/gpu/drm/scheduler/gpu_scheduler.c     Lucas Stach       2017-12-06  1084  	struct drm_sched_entity *entity;
d033a6de800541 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Chunming Zhou     2015-11-05  1085  	int i;
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1086  
38f922a563aac3 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-11-22  1087  	/* Start with the highest priority.
38f922a563aac3 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-11-22  1088  	 */
38f922a563aac3 drivers/gpu/drm/scheduler/sched_main.c        Luben Tuikov      2023-11-22  1089  	for (i = DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs; i++) {
08fb97de03aa22 drivers/gpu/drm/scheduler/sched_main.c        Andrey Grodzovsky 2022-09-30  1090  		entity = drm_sched_policy == DRM_SCHED_POLICY_FIFO ?
a78422e9dff366 drivers/gpu/drm/scheduler/sched_main.c        Danilo Krummrich  2023-11-10  1091  			drm_sched_rq_select_entity_fifo(sched, sched->sched_rq[i]) :
a78422e9dff366 drivers/gpu/drm/scheduler/sched_main.c        Danilo Krummrich  2023-11-10  1092  			drm_sched_rq_select_entity_rr(sched, sched->sched_rq[i]);
d033a6de800541 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Chunming Zhou     2015-11-05  1093  		if (entity)
d033a6de800541 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Chunming Zhou     2015-11-05  1094  			break;
d033a6de800541 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Chunming Zhou     2015-11-05  1095  	}
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1096  
a78422e9dff366 drivers/gpu/drm/scheduler/sched_main.c        Danilo Krummrich  2023-11-10 @1097  	return IS_ERR(entity) ? NULL : entity;
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1098  }
e688b728228b95 drivers/gpu/drm/amd/scheduler/gpu_scheduler.c Christian König   2015-08-20  1099  

:::::: The code at line 1097 was first introduced by commit
:::::: a78422e9dff366b3a46ae44caf6ec8ded9c9fc2f drm/sched: implement dynamic job-flow control

:::::: TO: Danilo Krummrich <dakr@redhat.com>
:::::: CC: Danilo Krummrich <dakr@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
