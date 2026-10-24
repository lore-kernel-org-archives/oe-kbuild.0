Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792883427;
	b=RUcLFOdI1BD5m7Jh9hyIo4nOEW7CzTgF74+QuC07e88dNwj9ClF8HHFrI42gshmVJlee
	 rwdhPhh5BS8kv/uwWLbQ8QQyPf5dDvCIwQIZ5EgCYCB+8a8BLhOGwVOu2/4QJXh+5veVy
	 jYCeCuYmy2mdeg/e6oYSG5YjMAdDBCX9un7IxH03x2T20SIAo5N2ZYvrja+a+C5iPkL/F
	 lUHXWh5sa4Bl/yNMvF86H4+clbWkjQnigTE2djBs7fnsO0gNYHtFC3TwlPvm7hp2r1y3E
	 XdjUFwhAqXpnJTNPm52jKBSPa9NdKeF0ISQ2hr9mzv3upEfku2DIibpsXZe4haOK7mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792883427;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type;
	bh=xkKYqxzxD5V1Nw+bSvJI6EC8w20K2pstMqPLMUY/YJs=;
	b=Ep2kweV83C7DfSd8WfMvzzZkvh0pvYVkwmWXTTax+r2xYrSRQP1oIGwEsLHwZ0gj2geV
	 DIjrT4sc41vtAKpXSXjOM0aNgqn1wemw76eM4NnkAnWkXWwdL1h5JHDQuA/hXxbOy0WMy
	 4cwgbamW/uK9qg3GwVmgr7Gj811kTQnUJ60AHWzJb1Io9b70PPqZGddWFwLEsGENcm7Mm
	 NQbMa77u1MXqNr4419dUDizZgMlysRY4MfAEawSVSirntLGlJTvxVsPWwryt6ZdRfzOVz
	 /puNK4USGZGc1FkokEsYh5CNTd+yCdVzS7kl1+//0lRIWpCrf1Uaw0T/4BC8YRVfszw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="m3avkO/0";
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6348C606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Oct 2026 23:10:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6348C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m3avkO/0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792883424; x=1824419424;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9/uw7gIuiLLXZGd0rod/mill5rz88wO3E+N8hukfTi4=;
  b=m3avkO/0QxJMcR/JWZFNyCVj5D/M8EdGpIst1DVMvqimu7kPCMNNhIAA
   8PKxCub08DWq4Ugqq6i+wCjc+N4giPsPi6TwfYaUcP0o09/RxlhZnK3Vm
   0w9JJLd0V8STT42h87mM+F2ZzG2FCEcrAQG9hAgo78RRPR+CbH/owo1HR
   gUa57isoR06WRaVUHnWXV/l/8obIFZSB8+UPS5vnqbzePerufcvliFf6W
   1lLOJ4CFQhSNTZD4o2I+glYi0mZvQq/ju9GEtNEQzgWVN46tQSDBkpQNV
   u9VulSmy+mubrBfK1hCeKX2Jqa0NNjTamOafhBZB0c/DMCWuN9pZYOrHR
   A==;
X-CSE-ConnectionGUID: nUov2ZxqSiGfthSc/wXHlA==
X-CSE-MsgGUID: n4MSJhciTwmuJQhUjoKWQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1609036"
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="1609036"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 16:10:23 -0700
X-CSE-ConnectionGUID: Ik3SZ2dzS1uRnY0BqK9biw==
X-CSE-MsgGUID: Hrbf7mM2RROd5ReVZEEXWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,177,1787036400"; 
   d="scan'208";a="4286489"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Oct 2026 16:10:21 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKksV-000000003W3-2Zqg;
	Sat, 24 Oct 2026 23:10:19 +0000
Date: Sun, 25 Oct 2026 01:10:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android14-6.1 0/1]
 fs/smb/client/smb2ops.c:1411:13-22: WARNING use flexible-array member instead
 =?us-ascii?Q?(https://www.kernel.org/doc/html/latest/process/deprecated.?=
 =?us-ascii?Q?html#zero-length-and-one-element-arrays)?=
Message-ID: <202610250131.R2XQJd1S-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   2f0d864181b9acf801e9b51c345e11b6156b767a
commit: 29429a1f5871dbe54ee0da81bb12db8567f15379 [0/1] smb: move client and server files to common directory fs/smb
:::::: branch date: 12 hours ago
:::::: commit date: 3 years, 4 months ago
config: i386-randconfig-2101-20261024 (https://download.01.org/0day-ci/archive/20261025/202610250131.R2XQJd1S-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610250131.R2XQJd1S-lkp@intel.com/

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
