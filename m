Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA193064AE
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Nov 2025 15:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764169341; cv=none; b=JSCOMpxEi5EuJ1Gx5Hta+yDviQDM8R+VL8mKTBncrUZ5VVcROrR4QWm7y968LvQ5Q2tt4JslfU6JloqTxjM3qSpaR6sVauk1BL3miaQ1lkCSI2RJ+p3QaaiCnPzMcBb1oT6LsKtI5mugLIAb9xK5azMdKzDGed7/HX2lvBMbwVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764169341; c=relaxed/simple;
	bh=ICBPbKDhgJ2TXh5UwX5kI6l6fuW/mEggzakEjr13aqc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VVPYjtoQwROlw4bZILwYqVKcdwxA3Yyl4bhxKqChtmEnj9SEiIbwya05JGQu6fFh23JOCETOumrJML0vE/QNiyKccRYxRdLX165tH86cixQ6jQvdQMkv7JQ28EEoSy/m6vxNRx6LmpU9f3cLqnnsDD0GeQAVpKEBgMfccaBUtIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZxfFr2Z6; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZxfFr2Z6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764169340; x=1795705340;
  h=date:from:to:subject:message-id:mime-version;
  bh=ICBPbKDhgJ2TXh5UwX5kI6l6fuW/mEggzakEjr13aqc=;
  b=ZxfFr2Z6RYg9VsnbO92G325O2YCC5sC94wV0gwjiQiCAsJxcg1Jy3fGc
   xavb+1CMs/OAKAdQuBcSlLQCNytObSIUf8Si1BW5W+aojMyMXhLGlHDN1
   BQlyYK9495An8goHqTmIdXrwSTS9EKGAntrJbAgPJXv7XJAf/WJ9Qf/Xg
   AnHP3WZnMaFqhaXXdk5HI6auk65xNYtmTNwrMQ0+eYokHuEq0WbCGdWu0
   OXIFaQQv3rblxLMUCq//pKqE5pSbIGEz1ykJ1+dj8FiBZ06UOlksIBc15
   /UYc9khoTcGmWi9B8eysqWq2g/2H+ScA+Lu8FrLdgOkb9GdAjYXuAkhad
   w==;
X-CSE-ConnectionGUID: z9DIely+QBWIYkM05k008Q==
X-CSE-MsgGUID: W9YojrO7QDWQJa5dYdwXww==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66166995"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="66166995"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 07:02:20 -0800
X-CSE-ConnectionGUID: gwxSKggKTHWxWqIQB9+iqw==
X-CSE-MsgGUID: wVzLU68tSISvbNWEg+kNPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; 
   d="scan'208";a="223915005"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 07:02:18 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOH28-000000001FZ-2aEt
	for oe-kbuild@lists.linux.dev;
	Wed, 26 Nov 2025 15:02:16 +0000
Date: Wed, 26 Nov 2025 16:01:24 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 16/25] checkpatch: +#define
 XFS_IOC_MEDIA_ERROR	_IOW ('X', 70, struct xfs_media_error)
Message-ID: <202511261611.kVhnR0fs-lkp@intel.com>
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
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   dc427bc7b2db9a19cb1a7c2380e44fcda6314504
commit: 92593320f9f5d59e054c276bb481c728281ae364 [16/25] xfs: add media error reporting ioctl
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251126/202511261611.kVhnR0fs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#72: FILE: fs/xfs/libxfs/xfs_fs.h:1221:
+#define XFS_IOC_MEDIA_ERROR	_IOW ('X', 70, struct xfs_media_error)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
