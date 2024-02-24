Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917EF168BA
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Feb 2024 05:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708752399; cv=none; b=GAP7C4I93YpEUlBEe4ddIUktMAzBqtAHhM8e84JvI2cYwv9lAoWWqmYXidelxAxPTgM3aSerzi7rSm95v36NalIptpnFNSjqeK2bvklRhMmxWv4ybLlyPtAuSpxo3Tx6j5dpOpMai4tuZX1anhXsOPiPcygFeIIPpCHaAZXBFd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708752399; c=relaxed/simple;
	bh=y4hoKZszW33cXwSv7yORgwyosNbCqWavj7WQuIeuH50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X5BNRHK9MrmZhluEMpA1j870M1izsSTR+eSLbFHCXEgS8mG992DHIHr9jomucb6HQ/snCDqpIEgyDyA8JFTyogX5DKrRbnWbbQWcQyS7plXC8Li/WSc5oFXfUDjl3MhwV/94g6FGpl7JShAnjHx60fp9QvNF9vE5OFkpDP6xN6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJfVQXa9; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJfVQXa9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708752359; x=1740288359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y4hoKZszW33cXwSv7yORgwyosNbCqWavj7WQuIeuH50=;
  b=kJfVQXa9Q5xATTjyC3NpPdaKD/v3VoN9a2pyrFXMtjpIuSu7XpsG1IyM
   BgtzbN2pSE6mfG9/F6UKBSrE2afN8SoaoEy55LR+wby32LFG7C7CkvE6e
   HQRroRniGUMUWvLsh2FAuQA0AQqKANZpqCnphRYUItRZcSJhr2G37fv4y
   sXAJ3E+GzLRi5OyRpLxTsiTeW0T465JW6EHsYWmSxHq+d8S5CtCTi80cR
   zrLDoCusw2C1Y7gYcB//D2Qmlxf+b65rJpgQmYFBG8H8KARKsmdpJ6lEY
   RtHHv7K70UY6/cKsevXkgKMLke1FLP2C5YnT7ZC/IvWD5sCFOsxlNiMNf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="25566332"
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="25566332"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 21:25:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,181,1705392000"; 
   d="scan'208";a="29310917"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 23 Feb 2024 21:25:57 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdkXr-0008Ff-0D;
	Sat, 24 Feb 2024 05:25:55 +0000
Date: Sat, 24 Feb 2024 13:25:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 4154/8260] drivers/md/dm-vdo/encodings.c:971
 vdo_get_known_partition() error: uninitialized symbol 'partition'.
Message-ID: <202402241337.mP3nFXlB-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Mike Snitzer <snitzer@kernel.org>
CC: Matthew Sakai <msakai@redhat.com>

Hi Mike,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33e1d31873f87d119e5120b88cd350efa68ef276
commit: 0925957f5cff4fb934739c01102f9c763b376ec6 [4154/8260] dm vdo: use a proper Makefile for dm-vdo
:::::: branch date: 25 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-161-20240224 (https://download.01.org/0day-ci/archive/20240224/202402241337.mP3nFXlB-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402241337.mP3nFXlB-lkp@intel.com/

smatch warnings:
drivers/md/dm-vdo/encodings.c:971 vdo_get_known_partition() error: uninitialized symbol 'partition'.
drivers/md/dm-vdo/dm-vdo-target.c:1502 vdo_initialize() error: we previously assumed 'vdo' could be null (see line 1474)

vim +/partition +971 drivers/md/dm-vdo/encodings.c

d92271fb73df32 Matthew Sakai 2023-11-16  956  
d92271fb73df32 Matthew Sakai 2023-11-16  957  /**
d92271fb73df32 Matthew Sakai 2023-11-16  958   * vdo_get_known_partition() - Get a partition by id from a validated layout.
d92271fb73df32 Matthew Sakai 2023-11-16  959   * @layout: The layout from which to get a partition.
d92271fb73df32 Matthew Sakai 2023-11-16  960   * @id: The id of the partition.
d92271fb73df32 Matthew Sakai 2023-11-16  961   *
d92271fb73df32 Matthew Sakai 2023-11-16  962   * Return: the partition
d92271fb73df32 Matthew Sakai 2023-11-16  963   */
d92271fb73df32 Matthew Sakai 2023-11-16  964  struct partition *vdo_get_known_partition(struct layout *layout, enum partition_id id)
d92271fb73df32 Matthew Sakai 2023-11-16  965  {
d92271fb73df32 Matthew Sakai 2023-11-16  966  	struct partition *partition;
d92271fb73df32 Matthew Sakai 2023-11-16  967  	int result = vdo_get_partition(layout, id, &partition);
d92271fb73df32 Matthew Sakai 2023-11-16  968  
d92271fb73df32 Matthew Sakai 2023-11-16  969  	ASSERT_LOG_ONLY(result == VDO_SUCCESS, "layout has expected partition: %u", id);
d92271fb73df32 Matthew Sakai 2023-11-16  970  
d92271fb73df32 Matthew Sakai 2023-11-16 @971  	return partition;
d92271fb73df32 Matthew Sakai 2023-11-16  972  }
d92271fb73df32 Matthew Sakai 2023-11-16  973  

:::::: The code at line 971 was first introduced by commit
:::::: d92271fb73df32344177d0ba26625ca62721b95f dm vdo: add the on-disk formats and marshalling of vdo structures

:::::: TO: Matthew Sakai <msakai@redhat.com>
:::::: CC: Mike Snitzer <snitzer@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
