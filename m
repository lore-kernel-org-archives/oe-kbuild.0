Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2380A3A8D2
	for <oe-kbuild@lists.linux.dev>; Sat, 18 Jan 2025 09:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737192771; cv=none; b=k04MGVmig2C9A++C2vshG0K4Hle385OBtpGq25gVVnD2KE7wjHT4Q/69AHXdDCY/y/M0hjsHJvqxjemC/S6QIlJGGwzDyWwHD4AvobgvK3/FcVh3so847TCl91BQkkt4hac23qToQdCq4M73IZ0eZbAaeae2HpvsWsXpvcHR1rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737192771; c=relaxed/simple;
	bh=WfnkFnTshcE5igcAhCtLeFOYFqXoJEQbWdMOlXKGJA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SHE+olPscVxoV2ax/uwTmkiQgVp1nIazRdPvNOhFK0CZqVjh1N7U/sxq5teP05XFgSctRMJSr+ZLJf6UuNJXeXzqWHjOzlaJ9iWUCLvSAu2iCbcV4isX/nVMB3rnctseM2ykwPofvLnAUdjXXtx8Ln9U1KMqb7ghky8npyBDtDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPTYkb4q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPTYkb4q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737192770; x=1768728770;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WfnkFnTshcE5igcAhCtLeFOYFqXoJEQbWdMOlXKGJA8=;
  b=cPTYkb4q5OInAbGN53eH/8QqQlhL6C40z/3etO5++Lq++/xOnyBXKsWn
   njju2Fh5Z5SL33OglDBd1rwMme9fMGL2Fw3oY0BAE5mptfLLcTsoxt3FE
   suiLuUbyBLcsxanUk4cnu8cScaWVD8TfQp1T07jni4kVqrzJmTvAV9F8b
   9EEDu8vUPhKmthG/mKzam88hHdNNrvSAbNlcG/JgZVlD/6q0WYcY3aV1P
   AUj0dCwOzW3YY88iktsgFq3udg4FDmPvrYHIn0Q6jE7mDbNyESRlOU1ap
   ydtc3d35xNOJHwwI8MA4WEJsuCVjWOD2Wwcr+HPq0BXO1izqw9B3oEAos
   g==;
X-CSE-ConnectionGUID: WmQfu3AATG6pO24p/LwcxA==
X-CSE-MsgGUID: lz7wFY6dRySIJV8XvXcPhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37505892"
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="37505892"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 01:32:49 -0800
X-CSE-ConnectionGUID: F2FVJ70WQSS/JVtBATcY9A==
X-CSE-MsgGUID: PI7W2DhZTtmf7M8vfsAt5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,214,1732608000"; 
   d="scan'208";a="136867134"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jan 2025 01:32:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZ5CA-000UGw-0I;
	Sat, 18 Jan 2025 09:32:46 +0000
Date: Sat, 18 Jan 2025 17:32:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/xe/xe_devcoredump.c:184:21-22: WARNING opportunity
 for min()
Message-ID: <202501181736.zf2HY8rj-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Matthew Brost <matthew.brost@intel.com>
CC: Jonathan Cavitt <jonathan.cavitt@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   595523945be0a5a2f12a1c04772383293fbc04a1
commit: 4f04d07c0a94b0b30db839e44f1b8364a1b508ac drm/xe: Faster devcoredump
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
config: microblaze-randconfig-r061-20250118 (https://download.01.org/0day-ci/archive/20250118/202501181736.zf2HY8rj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501181736.zf2HY8rj-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_devcoredump.c:184:21-22: WARNING opportunity for min()

vim +184 drivers/gpu/drm/xe/xe_devcoredump.c

4f04d07c0a94b0 Matthew Brost 2024-08-01  162  
4f04d07c0a94b0 Matthew Brost 2024-08-01  163  static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
4f04d07c0a94b0 Matthew Brost 2024-08-01  164  				   size_t count, void *data, size_t datalen)
4f04d07c0a94b0 Matthew Brost 2024-08-01  165  {
4f04d07c0a94b0 Matthew Brost 2024-08-01  166  	struct xe_devcoredump *coredump = data;
4f04d07c0a94b0 Matthew Brost 2024-08-01  167  	struct xe_devcoredump_snapshot *ss;
4f04d07c0a94b0 Matthew Brost 2024-08-01  168  	ssize_t byte_copied;
4f04d07c0a94b0 Matthew Brost 2024-08-01  169  
4f04d07c0a94b0 Matthew Brost 2024-08-01  170  	if (!coredump)
4f04d07c0a94b0 Matthew Brost 2024-08-01  171  		return -ENODEV;
4f04d07c0a94b0 Matthew Brost 2024-08-01  172  
4f04d07c0a94b0 Matthew Brost 2024-08-01  173  	ss = &coredump->snapshot;
4f04d07c0a94b0 Matthew Brost 2024-08-01  174  
4f04d07c0a94b0 Matthew Brost 2024-08-01  175  	/* Ensure delayed work is captured before continuing */
4f04d07c0a94b0 Matthew Brost 2024-08-01  176  	flush_work(&ss->work);
4f04d07c0a94b0 Matthew Brost 2024-08-01  177  
4f04d07c0a94b0 Matthew Brost 2024-08-01  178  	if (!ss->read.buffer)
4f04d07c0a94b0 Matthew Brost 2024-08-01  179  		return -ENODEV;
4f04d07c0a94b0 Matthew Brost 2024-08-01  180  
4f04d07c0a94b0 Matthew Brost 2024-08-01  181  	if (offset >= ss->read.size)
4f04d07c0a94b0 Matthew Brost 2024-08-01  182  		return 0;
4f04d07c0a94b0 Matthew Brost 2024-08-01  183  
4f04d07c0a94b0 Matthew Brost 2024-08-01 @184  	byte_copied = count < ss->read.size - offset ? count :
4f04d07c0a94b0 Matthew Brost 2024-08-01  185  		ss->read.size - offset;
4f04d07c0a94b0 Matthew Brost 2024-08-01  186  	memcpy(buffer, ss->read.buffer + offset, byte_copied);
4f04d07c0a94b0 Matthew Brost 2024-08-01  187  
4f04d07c0a94b0 Matthew Brost 2024-08-01  188  	return byte_copied;
4f04d07c0a94b0 Matthew Brost 2024-08-01  189  }
4f04d07c0a94b0 Matthew Brost 2024-08-01  190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
