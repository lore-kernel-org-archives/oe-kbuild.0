Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084AA85274
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Apr 2024 11:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714046158; cv=none; b=AOYm11tLBmnFD2hC3ronAsSCZL58FSZwD+B100CGWudwhcIl5ybdNoAtsDZBjruQC+atN/Z5ceXQgAoELGjscCrCdv7U4tADKKr4/0sWaSDapnVF96ugfCwrLDghWXL6BOPtP4lI9ov2TBtM/CegsSp/J/qr0NgWQw4NuRJJUUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714046158; c=relaxed/simple;
	bh=XrW7TZqM0uRfk0zSamUmN/es8Uyo8ZrnoULQtzNcmFw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WDwSP9bMZddp7O23bUGGYyCn+TC3WfKdqFuQToKM2QYqaM6ReKCMgfBHQyhjSugAGLa0TvfPXG5f8N5pqLofu0/YLi5zWXDJy3jReMFppzPBNgsWoJOQ+biL47+ZGGGyFnae40XLhmhKPUoUrnNxJJxyuYAxP7On5SXgOIv0EVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wolp9m7N; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wolp9m7N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714046157; x=1745582157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XrW7TZqM0uRfk0zSamUmN/es8Uyo8ZrnoULQtzNcmFw=;
  b=Wolp9m7NveOzABid/ujTX/+QvvFNgTOfA15wuqINESyr0bD5rX5RxWUP
   /48TqpANaItBczNER8oBxTFmMoTD09buVmY5gcx4uZXmbS+8tMY+Hg9pY
   6sOmqBgxRv8C/uVbd/ZvNNBkf50wkyHhaIZdEKJ0aZNdGnAwYLw4SXVwv
   hTEJEQhlJNXrsgW3N59l7sNV++xOLb87gEkxDcGgki9HBuKYmBPmuQRno
   ZKjdP3agXgbpVT7UXIgtH+su+GbpVkvPwmQV8VkXsdB3EhclxDuoEWpX5
   HUcZPQACoO9YeJUbYZGfpZrnFYkr9ijGZxNbj5lW7vz1uBbW5AInackx3
   w==;
X-CSE-ConnectionGUID: CcEwGXr0TZiRfg3M7GBVNw==
X-CSE-MsgGUID: RYLrMUV1TvC7sChtCB5dUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11054"; a="20414923"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="20414923"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2024 04:55:56 -0700
X-CSE-ConnectionGUID: mLJF6a3jRwmYwP8JiRei5A==
X-CSE-MsgGUID: /YrJaCNyQFqG2Kb15g8lYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; 
   d="scan'208";a="48309315"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Apr 2024 04:55:55 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rzxhh-0002Jc-0W;
	Thu, 25 Apr 2024 11:55:53 +0000
Date: Thu, 25 Apr 2024 19:55:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 7867/8170]
 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.c:501:9: sparse:
 sparse: static assertion failed: "DMUB command size mismatch"
Message-ID: <202404251956.riTlbHss-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.c:501:9: sparse: sparse: static assertion failed: "DMUB command size mismatch""
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5e4f84f18c4ee9b0ccdc19e39b7de41df21699dd
commit: 3dc4c954031129a68ba68c99b1803d775ee78258 [7867/8170] drm/amd/display: Add DCN401 dependant changes for DMCUB
:::::: branch date: 26 hours ago
:::::: commit date: 2 days ago
config: mips-randconfig-r131-20240425 (https://download.01.org/0day-ci/archive/20240425/202404251956.riTlbHss-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240425/202404251956.riTlbHss-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202404251956.riTlbHss-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.c:501:9: sparse: sparse: static assertion failed: "DMUB command size mismatch"
   drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.c:537:9: sparse: sparse: static assertion failed: "DMUB command size mismatch"

vim +501 drivers/gpu/drm/amd/amdgpu/../display/dmub/src/dmub_dcn401.c

3df48ddedee4b6 Aurabindo Pillai 2024-04-19  495  
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  496  void dmub_dcn401_send_reg_inbox0_cmd_msg(struct dmub_srv *dmub,
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  497  		union dmub_rb_cmd *cmd)
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  498  {
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  499  	uint32_t *dwords = (uint32_t *)cmd;
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  500  
3df48ddedee4b6 Aurabindo Pillai 2024-04-19 @501  	static_assert(sizeof(*cmd) == 64, "DMUB command size mismatch");
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  502  
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  503  	REG_WRITE(DMCUB_REG_INBOX0_MSG0, dwords[0]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  504  	REG_WRITE(DMCUB_REG_INBOX0_MSG1, dwords[1]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  505  	REG_WRITE(DMCUB_REG_INBOX0_MSG2, dwords[2]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  506  	REG_WRITE(DMCUB_REG_INBOX0_MSG3, dwords[3]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  507  	REG_WRITE(DMCUB_REG_INBOX0_MSG4, dwords[4]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  508  	REG_WRITE(DMCUB_REG_INBOX0_MSG5, dwords[5]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  509  	REG_WRITE(DMCUB_REG_INBOX0_MSG6, dwords[6]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  510  	REG_WRITE(DMCUB_REG_INBOX0_MSG7, dwords[7]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  511  	REG_WRITE(DMCUB_REG_INBOX0_MSG8, dwords[8]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  512  	REG_WRITE(DMCUB_REG_INBOX0_MSG9, dwords[9]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  513  	REG_WRITE(DMCUB_REG_INBOX0_MSG10, dwords[10]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  514  	REG_WRITE(DMCUB_REG_INBOX0_MSG11, dwords[11]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  515  	REG_WRITE(DMCUB_REG_INBOX0_MSG12, dwords[12]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  516  	REG_WRITE(DMCUB_REG_INBOX0_MSG13, dwords[13]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  517  	REG_WRITE(DMCUB_REG_INBOX0_MSG14, dwords[14]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  518  	/* writing to INBOX RDY register will trigger DMUB REG INBOX0 RDY
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  519  	 * interrupt.
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  520  	 */
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  521  	REG_WRITE(DMCUB_REG_INBOX0_RDY, dwords[15]);
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  522  }
3df48ddedee4b6 Aurabindo Pillai 2024-04-19  523  

:::::: The code at line 501 was first introduced by commit
:::::: 3df48ddedee4b68787087cdbdbec8fa28ad0ce68 drm/amd/display: Add new DCN401 sources

:::::: TO: Aurabindo Pillai <aurabindo.pillai@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
