Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13201DE3A6
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Feb 2025 09:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738921004; cv=none; b=JTvTv9uPIxfWST/2UNdTTwe23qUf0QapKkDjJ2AYS8FMub8q+/tjPDT6fA5nWlYJ8Yp4emcNJcpy9yw1i5LCWGetYNx2/wZ5M8kwwaCisE55OK1QIErP2En/zbbahknBdu8N4M7WeGuYSAk/YsmGznswOE0c+Rbo0pBj/FdSLJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738921004; c=relaxed/simple;
	bh=92F+DETDUL9hDCp+nj1H/cNQ2o3D6KIirI59r5pkFoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M/8DRLdTFNA8UE5BxlFa/O86L0qYUdpTQZgfRZbJIt7vzZbVQGauJOO/nYPnQ4COnWlvWmZPatcaj/3B8LoD9HOKHb4t8By5BIYrrdJBsrkjyY0r1EjHNIFgYdLJtnqD1rtFt7QL/QxqF6ItXPUaB4M9EMlxNW/EtFo2cwq/Xbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V9j+Usit; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V9j+Usit"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738921003; x=1770457003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=92F+DETDUL9hDCp+nj1H/cNQ2o3D6KIirI59r5pkFoA=;
  b=V9j+UsitnrI2vnVVkqXXjwN6OY0cT7F5zs0e7/lHWzWA137RUxFp+g/8
   K5fi3GPbFK5zVx/YM6tXAgjj7PQlflZOC1hSJuz1OU1xXptJQpsE+dsLw
   BSBhpVa64yck586gFOonBye1nkKu2E9djP4KJ6Feo54Xjk+J7NGHP28N/
   EDV+4SEzGpBYoMSMWx2tI1bS0BMlGDiPPx0uYj2+DAo5BIuwCCrXqulOF
   psSwqMZSpHegrRISapOU74+urz1q5o64yz1bWCFasHZuVxIVMQ3w2lAEK
   /wAUB13xslq/+EhN4u6Wlh3eilbSNUzYWcs7TTtZrorPfLFwnwnE7x7vw
   g==;
X-CSE-ConnectionGUID: yvvqp/zbSOKmOAQCQ4g4hg==
X-CSE-MsgGUID: hZjPEitERo2STJYyBn6fCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39584663"
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="39584663"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2025 01:36:42 -0800
X-CSE-ConnectionGUID: 4+AVkDEMQLCco2DtdCSRZg==
X-CSE-MsgGUID: j6nekjkSSGOeU8U4lUBhkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,266,1732608000"; 
   d="scan'208";a="111679513"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 07 Feb 2025 01:36:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgKms-000y6J-1j;
	Fri, 07 Feb 2025 09:36:38 +0000
Date: Fri, 7 Feb 2025 17:36:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-6.1-lts 0/1]
 fs/smb/client/smb2ops.c:1411:13-22: WARNING use flexible-array member
 instead
 (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)
Message-ID: <202502071718.wmA7oZwF-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   e6d1ba5430bf32e5b4ce880c077517f4ba614e0f
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [0/1] smb: move client and server files to common directory fs/smb
:::::: branch date: 19 hours ago
:::::: commit date: 1 year, 7 months ago
config: i386-randconfig-052-20250207 (https://download.01.org/0day-ci/archive/20250207/202502071718.wmA7oZwF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202502071718.wmA7oZwF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/client/smb2ops.c:1411:13-22: WARNING use flexible-array member instead (https://www.kernel.org/doc/html/latest/process/deprecated.html#zero-length-and-one-element-arrays)

vim +1411 fs/smb/client/smb2ops.c

41c1358e9181ab fs/cifs/smb2ops.c Steve French    2013-11-14  1403  
b2ca6c2c9eddc4 fs/cifs/smb2ops.c Ronnie Sahlberg 2020-05-21  1404  struct iqi_vars {
b2ca6c2c9eddc4 fs/cifs/smb2ops.c Ronnie Sahlberg 2020-05-21  1405  	struct smb_rqst rqst[3];
b2ca6c2c9eddc4 fs/cifs/smb2ops.c Ronnie Sahlberg 2020-05-21  1406  	struct kvec rsp_iov[3];
b2ca6c2c9eddc4 fs/cifs/smb2ops.c Ronnie Sahlberg 2020-05-21  1407  	struct kvec open_iov[SMB2_CREATE_IOV_SIZE];
b2ca6c2c9eddc4 fs/cifs/smb2ops.c Ronnie Sahlberg 2020-05-21  1408  	struct kvec qi_iov[1];
b2ca6c2c9eddc4 fs/cifs/smb2ops.c Ronnie Sahlberg 2020-05-21  1409  	struct kvec io_iov[SMB2_IOCTL_IOV_SIZE];
b2ca6c2c9eddc4 fs/cifs/smb2ops.c Ronnie Sahlberg 2020-05-21  1410  	struct kvec si_iov[SMB2_SET_INFO_IOV_SIZE];
b2ca6c2c9eddc4 fs/cifs/smb2ops.c Ronnie Sahlberg 2020-05-21 @1411  	struct kvec close_iov[1];
b2ca6c2c9eddc4 fs/cifs/smb2ops.c Ronnie Sahlberg 2020-05-21  1412  };
b2ca6c2c9eddc4 fs/cifs/smb2ops.c Ronnie Sahlberg 2020-05-21  1413  

:::::: The code at line 1411 was first introduced by commit
:::::: b2ca6c2c9eddc41c09e49e8e83f8208bd80fdb8e cifs: move some variables off the stack in smb2_ioctl_query_info

:::::: TO: Ronnie Sahlberg <lsahlber@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
