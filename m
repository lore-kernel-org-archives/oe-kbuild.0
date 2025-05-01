Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC5481993B7
	for <oe-kbuild@lists.linux.dev>; Thu,  1 May 2025 22:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746137765; cv=none; b=kQmI/zvORRxofSJTOHjzZaCqsxVkhn6cDkbq+LIYUSbjItKIwEtVL1qjcIp0eJhFBOfJ2S6UlK76W188n7BXIhwXgHBTK4q+5uG4fXphyKCjknSpjX0jkKzNf9TZ2LzhfPchhwaJ4oT4iZS1NPGxA5y024I9prKFtaUV+gLYl64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746137765; c=relaxed/simple;
	bh=Yzb77xEoYSMZ7UzjxrYyXJxN6dCecQD0oNlbOIwiMWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KrvxGjnzbYvj3z0xmKYsOMiHddR2Z5X+v/TFxW+uSnclCv5v8WRe4RnDlIwrYM5yP9jN65w0odX7R8Fdq7QeSK+uvlhKTUum1ovG6/20RrLVRTA6iaAHUJ7qJSsIkkZce9QGpqD6/3FrABoMvoaIVV5+b7kDIPI1ka+tvjDtGac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXiHowai; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXiHowai"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746137762; x=1777673762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yzb77xEoYSMZ7UzjxrYyXJxN6dCecQD0oNlbOIwiMWE=;
  b=iXiHowaiw1ClMvK5v+KVOFgPFzLyo03wJviUTRqsBp05aQ5W1vCLxkVm
   w4aUhuysIOq/2ogKyDMAwePkPde5Cg7qEPCQe3c+EgFoC/SPvQTcFsfVV
   6PNZivsE3iL1eqWwHFiqSdYR6pWS0tXLmlnigiVHYOCTGw59wnkPwL4yM
   uH2+qCeWiujz5382/jX7WZsIMJyM83F/Rq/lzDtXNKoSJtsKLhABlYODC
   QYMBXNLAgNYzjOIva7wKCdViQQXdtvgkou6JXxSdEPHNqoRPJ//yeTKYm
   qL6FXzKKMuabaFXdmWQm4CVlMLHJ3j6WoyladLyAMo35FB6CLBfhigr+m
   g==;
X-CSE-ConnectionGUID: 8tkkX/xESXmIWY/ia2Ozrw==
X-CSE-MsgGUID: 42GZnzIESL6DZFLcY3xBDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="46931191"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="46931191"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 15:16:01 -0700
X-CSE-ConnectionGUID: jvCdOqtvTPGwAc5nBgxqXg==
X-CSE-MsgGUID: O2/fUufAQV6c/+nHO/mERw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="134998898"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 May 2025 15:15:59 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAcCC-0004Pp-1x;
	Thu, 01 May 2025 22:15:56 +0000
Date: Fri, 2 May 2025 06:15:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android15-6.6 3/3] fs/smb/server/oplock.c:1510
 parse_lease_state() warn: possible memory leak of 'lreq'
Message-ID: <202505020623.KJ87fuu2-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   272d4285dd17049eceb342b5b4f2b4fd346466b5
commit: 60b7207893a8a06c78441934931a08fdad63f18e [3/3] ksmbd: add bounds check for create lease context
:::::: branch date: 4 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-161-20250501 (https://download.01.org/0day-ci/archive/20250502/202505020623.KJ87fuu2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505020623.KJ87fuu2-lkp@intel.com/

New smatch warnings:
fs/smb/server/oplock.c:1510 parse_lease_state() warn: possible memory leak of 'lreq'

Old smatch warnings:
fs/smb/server/oplock.c:1009 find_same_lease_key() warn: missing error code 'err'
fs/smb/server/oplock.c:1526 parse_lease_state() warn: possible memory leak of 'lreq'

vim +/lreq +1510 fs/smb/server/oplock.c

e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1484  
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1485  /**
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1486   * parse_lease_state() - parse lease context containted in file open request
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1487   * @open_req:	buffer containing smb2 file open(create) request
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1488   *
07f384c5be1f86 fs/smb/server/oplock.c ChenXiaoSong   2024-08-22  1489   * Return: allocated lease context object on success, otherwise NULL
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1490   */
8df4bcdb0a4232 fs/smb/server/oplock.c Namjae Jeon    2024-03-12  1491  struct lease_ctx_info *parse_lease_state(void *open_req)
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1492  {
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1493  	struct create_context *cc;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1494  	struct smb2_create_req *req = (struct smb2_create_req *)open_req;
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1495  	struct lease_ctx_info *lreq;
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1496  
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1497  	cc = smb2_find_context_vals(req, SMB2_CREATE_REQUEST_LEASE, 4);
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1498  	if (IS_ERR_OR_NULL(cc))
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1499  		return NULL;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1500  
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1501  	lreq = kzalloc(sizeof(struct lease_ctx_info), GFP_KERNEL);
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1502  	if (!lreq)
fc6c6a3c324c1b fs/smb/server/oplock.c Namjae Jeon    2023-05-28  1503  		return NULL;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1504  
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1505  	if (sizeof(struct lease_context_v2) == le32_to_cpu(cc->DataLength)) {
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1506  		struct create_lease_v2 *lc = (struct create_lease_v2 *)cc;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1507  
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1508  		if (le16_to_cpu(cc->DataOffset) + le32_to_cpu(cc->DataLength) <
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1509  		    sizeof(struct create_lease_v2) - 4)
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15 @1510  			return NULL;
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1511  
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon    2021-09-09  1512  		memcpy(lreq->lease_key, lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1513  		lreq->req_state = lc->lcontext.LeaseState;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1514  		lreq->flags = lc->lcontext.LeaseFlags;
bc025d49c507b7 fs/smb/server/oplock.c Namjae Jeon    2023-12-31  1515  		lreq->epoch = lc->lcontext.Epoch;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1516  		lreq->duration = lc->lcontext.LeaseDuration;
100117279c1da0 fs/smb/server/oplock.c Namjae Jeon    2024-05-01  1517  		if (lreq->flags == SMB2_LEASE_FLAG_PARENT_LEASE_KEY_SET_LE)
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon    2021-09-09  1518  			memcpy(lreq->parent_lease_key, lc->lcontext.ParentLeaseKey,
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon    2021-09-09  1519  			       SMB2_LEASE_KEY_SIZE);
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1520  		lreq->version = 2;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1521  	} else {
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1522  		struct create_lease *lc = (struct create_lease *)cc;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1523  
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1524  		if (le16_to_cpu(cc->DataOffset) + le32_to_cpu(cc->DataLength) <
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1525  		    sizeof(struct create_lease))
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1526  			return NULL;
60b7207893a8a0 fs/smb/server/oplock.c Norbert Szetei 2025-03-15  1527  
2734b692f7b816 fs/ksmbd/oplock.c      Namjae Jeon    2021-09-09  1528  		memcpy(lreq->lease_key, lc->lcontext.LeaseKey, SMB2_LEASE_KEY_SIZE);
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1529  		lreq->req_state = lc->lcontext.LeaseState;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1530  		lreq->flags = lc->lcontext.LeaseFlags;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1531  		lreq->duration = lc->lcontext.LeaseDuration;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1532  		lreq->version = 1;
ade62d8b429fe4 fs/cifsd/oplock.c      Namjae Jeon    2021-06-07  1533  	}
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1534  	return lreq;
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1535  }
e2f34481b24db2 fs/cifsd/oplock.c      Namjae Jeon    2021-03-16  1536  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
