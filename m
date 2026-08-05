Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3165B41A937
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Aug 2026 20:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785961253; cv=none; b=CtZfTi4gCyrROUFU2uUwImZBHAW70fjus7xIiZMhBuwOy2ySm2ImqMxpcH9MReo5EDC5UP37PeBIdII/EEzgOCPgZ6w2FrCvyGBUoW3xf1vitJyvAhDbdjrRZyMZuR3AFeekmBpXgD9MuAoXcyNu+HOgXbCaM6g4VohPldA8DX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785961253; c=relaxed/simple;
	bh=HdWXt+gYCRlXu0JwIx0RVO/u2RLC7w+/jOdzx73+7gU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vAwabpmqc+ixCV6PCi4WDJ6f8CJVdkCAPKBc5yw7f+Jbo322uwuIy+KImJi8WO5A2cmDz7wiBZCGdvpltA19UJfuZdtq4UdoVwkdf+P89epMnyrKACpXc9crie5amv6H6D7N1SqTak2jzOolTQmDN1kL/32PP9FkYlAnZci9BoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M7PpbKKJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M7PpbKKJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785961250; x=1817497250;
  h=date:from:to:cc:subject:message-id;
  bh=HdWXt+gYCRlXu0JwIx0RVO/u2RLC7w+/jOdzx73+7gU=;
  b=M7PpbKKJsgatgyDy7ZAzsQQfMyB1sKHjfMUHkSd4OKJRbvcSOWtJ2x4b
   jGiQDj7fDBIS9v4d+ndcXk8CH3Qgo7dwj5k1BmGbTzfoC+f3DDHsBW/pT
   Iy4IsJwXXmWtn65oXB1cEgF+ZzhiEDNEkBbv1SG5cdPIEvx0OLwgIEBTZ
   k4tITPj6bbjArOH5bgABlqlXchPIeyu169uqrrkiMOmTYCIfoToPG2BHv
   FhvpIH5Y87wiOpEz7h7aT/NSVdciPXdFDYDp17Schf7EACL3Iplx2H0zY
   LOUgTTg8YsJNGl10KfwiTZZNOlRVamqAOsigD1Fya6EdNkOWH1lHC7b4x
   g==;
X-CSE-ConnectionGUID: 1NAELW5CStG+E09CjMPrLA==
X-CSE-MsgGUID: XY/kz+9VQNys35BNltBR3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11866"; a="90430326"
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="90430326"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2026 13:20:48 -0700
X-CSE-ConnectionGUID: QE9eoPkESiKKjQ2TmQDWyg==
X-CSE-MsgGUID: RI+Tfx3LTgeHIaC649guLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,207,1779174000"; 
   d="scan'208";a="263884611"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Aug 2026 13:20:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wri6Q-00000000DN9-1PsB;
	Wed, 05 Aug 2026 20:20:38 +0000
Date: Thu, 06 Aug 2026 04:20:14 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [smfrench-smb3:ksmbd-for-next-next 67/110]
 fs/smb/server/smb2pdu.c:9073 smb2_lock() warn: missing error code 'err'
Message-ID: <202608060342.A3MhTzNY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Steve French <stfrench@microsoft.com>

tree:   https://github.com/smfrench/smb3-kernel.git ksmbd-for-next-next
head:   0be3df1505155c5cb9a15199b14cc2974f850605
commit: 10e5f86a51f4383b51eb1cdae9c88146d05d46e8 [67/110] ksmbd: add SMB3 request replay support
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20260805 (https://download.01.org/0day-ci/archive/20260806/202608060342.A3MhTzNY-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608060342.A3MhTzNY-lkp@intel.com/

New smatch warnings:
fs/smb/server/smb2pdu.c:9073 smb2_lock() warn: missing error code 'err'

Old smatch warnings:
fs/smb/server/smb2pdu.c:8392 smb2_read() warn: missing unwind goto?

vim +/err +9073 fs/smb/server/smb2pdu.c

e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  8992  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  8993  /**
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  8994   * smb2_lock() - handler for smb2 file lock command
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  8995   * @work:	smb work containing lock command buffer
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  8996   *
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  8997   * Return:	0 on success, otherwise error
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  8998   */
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  8999  int smb2_lock(struct ksmbd_work *work)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9000  {
7b7d709ef7cf285 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  9001  	struct smb2_lock_req *req;
7b7d709ef7cf285 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  9002  	struct smb2_lock_rsp *rsp;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9003  	struct smb2_lock_element *lock_ele;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9004  	struct ksmbd_file *fp = NULL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9005  	struct file_lock *flock = NULL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9006  	struct file *filp = NULL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9007  	int lock_count;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9008  	int flags = 0;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9009  	int cmd = 0;
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9010  	int err = -EIO, i, rc = 0;
50bf80a553ccb5e fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-14  9011  	u64 lock_start, lock_length;
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9012  	struct ksmbd_lock *smb_lock = NULL, *cmp_lock, *tmp, *tmp2;
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9013  	struct ksmbd_conn *conn;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9014  	int nolock = 0;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9015  	LIST_HEAD(lock_list);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9016  	LIST_HEAD(rollback_list);
0bcc831be535269 fs/smb/server/smb2pdu.c Namjae Jeon       2025-10-01  9017  	int prior_lock = 0, bkt;
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9018  	unsigned int id = KSMBD_NO_FID, pid = KSMBD_NO_FID;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9019  
7b7d709ef7cf285 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  9020  	WORK_BUFFERS(work, req, rsp);
7b7d709ef7cf285 fs/smb/server/smb2pdu.c Namjae Jeon       2023-06-24  9021  
e333e77638b3cc8 fs/smb/server/smb2pdu.c Namjae Jeon       2024-11-22  9022  	ksmbd_debug(SMB, "Received smb2 lock request\n");
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9023  
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9024  	if (smb2_compound_has_failed(work, &rsp->hdr))
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9025  		return -EACCES;
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9026  
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9027  	if (work->next_smb2_rcv_hdr_off &&
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9028  	    !has_file_id(req->VolatileFileId)) {
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9029  		ksmbd_debug(SMB, "Compound request set FID = %llu\n",
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9030  			    work->compound_fid);
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9031  		id = work->compound_fid;
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9032  		pid = work->compound_pfid;
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9033  	}
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9034  
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9035  	if (!has_file_id(id)) {
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9036  		id = req->VolatileFileId;
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9037  		pid = req->PersistentFileId;
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9038  	}
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9039  
3f67e624e591747 fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-21  9040  	fp = ksmbd_lookup_fd_slow(work, id, pid);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9041  	if (!fp) {
2d004c6cae567e3 fs/ksmbd/smb2pdu.c      Paulo Alcantara   2022-03-21  9042  		ksmbd_debug(SMB, "Invalid file id for lock : %llu\n", req->VolatileFileId);
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9043  		err = -ENOENT;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9044  		goto out2;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9045  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9046  
10e5f86a51f4383 fs/smb/server/smb2pdu.c Namjae Jeon       2026-07-19  9047  	err = smb2_set_request_open(work, fp, &req->hdr, false, false);
10e5f86a51f4383 fs/smb/server/smb2pdu.c Namjae Jeon       2026-07-19  9048  	if (err)
10e5f86a51f4383 fs/smb/server/smb2pdu.c Namjae Jeon       2026-07-19  9049  		goto out2;
10e5f86a51f4383 fs/smb/server/smb2pdu.c Namjae Jeon       2026-07-19  9050  
10e5f86a51f4383 fs/smb/server/smb2pdu.c Namjae Jeon       2026-07-19  9051  	smb2_verify_lock_sequence(work, fp, req);
10e5f86a51f4383 fs/smb/server/smb2pdu.c Namjae Jeon       2026-07-19  9052  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9053  	filp = fp->filp;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9054  	lock_count = le16_to_cpu(req->LockCount);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9055  	lock_ele = req->locks;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9056  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9057  	ksmbd_debug(SMB, "lock count is %d\n", lock_count);
bd0a1ca52b6da64 fs/smb/server/smb2pdu.c Akif Sait         2026-04-20  9058  	/*
bd0a1ca52b6da64 fs/smb/server/smb2pdu.c Akif Sait         2026-04-20  9059  	 * Cap lock_count at 64. The MS-SMB2 spec defines Open.LockSequenceArray
bd0a1ca52b6da64 fs/smb/server/smb2pdu.c Akif Sait         2026-04-20  9060  	 * as exactly 64 entries so 64 is the intended ceiling. No real workload
bd0a1ca52b6da64 fs/smb/server/smb2pdu.c Akif Sait         2026-04-20  9061  	 * comes close to this in a single request.
bd0a1ca52b6da64 fs/smb/server/smb2pdu.c Akif Sait         2026-04-20  9062  	 */
bd0a1ca52b6da64 fs/smb/server/smb2pdu.c Akif Sait         2026-04-20  9063  	if (!lock_count || lock_count > 64) {
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9064  		err = -EINVAL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9065  		goto out2;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9066  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9067  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9068  	for (i = 0; i < lock_count; i++) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9069  		flags = le32_to_cpu(lock_ele[i].Flags);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9070  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9071  		flock = smb_flock_init(filp);
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9072  		if (!flock)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16 @9073  			goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9074  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9075  		cmd = smb2_set_flock_flags(flock, flags);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9076  
50bf80a553ccb5e fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-14  9077  		lock_start = le64_to_cpu(lock_ele[i].Offset);
50bf80a553ccb5e fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-14  9078  		lock_length = le64_to_cpu(lock_ele[i].Length);
50bf80a553ccb5e fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-14  9079  		if (lock_start > U64_MAX - lock_length) {
bde1694aecdb535 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-06-28  9080  			pr_err("Invalid lock range requested\n");
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9081  			rsp->hdr.Status = STATUS_INVALID_LOCK_RANGE;
01f6c61bae3d658 fs/ksmbd/smb2pdu.c      Marios Makassikis 2022-11-29  9082  			locks_free_lock(flock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9083  			goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9084  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9085  
50bf80a553ccb5e fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-14  9086  		if (lock_start > OFFSET_MAX)
50bf80a553ccb5e fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-14  9087  			flock->fl_start = OFFSET_MAX;
50bf80a553ccb5e fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-14  9088  		else
50bf80a553ccb5e fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-14  9089  			flock->fl_start = lock_start;
50bf80a553ccb5e fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-14  9090  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9091  		lock_length = le64_to_cpu(lock_ele[i].Length);
50bf80a553ccb5e fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-14  9092  		if (lock_length > OFFSET_MAX - flock->fl_start)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9093  			lock_length = OFFSET_MAX - flock->fl_start;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9094  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9095  		flock->fl_end = flock->fl_start + lock_length;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9096  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9097  		if (flock->fl_end < flock->fl_start) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9098  			ksmbd_debug(SMB,
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9099  				    "the end offset(%llx) is smaller than the start offset(%llx)\n",
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9100  				    flock->fl_end, flock->fl_start);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9101  			rsp->hdr.Status = STATUS_INVALID_LOCK_RANGE;
01f6c61bae3d658 fs/ksmbd/smb2pdu.c      Marios Makassikis 2022-11-29  9102  			locks_free_lock(flock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9103  			goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9104  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9105  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9106  		/* Check conflict locks in one request */
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9107  		list_for_each_entry(cmp_lock, &lock_list, llist) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9108  			if (cmp_lock->fl->fl_start <= flock->fl_start &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9109  			    cmp_lock->fl->fl_end >= flock->fl_end) {
16f9ce818901c7b fs/smb/server/smb2pdu.c Jeff Layton       2024-01-31  9110  				if (cmp_lock->fl->c.flc_type != F_UNLCK &&
16f9ce818901c7b fs/smb/server/smb2pdu.c Jeff Layton       2024-01-31  9111  				    flock->c.flc_type != F_UNLCK) {
bde1694aecdb535 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-06-28  9112  					pr_err("conflict two locks in one request\n");
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9113  					err = -EINVAL;
01f6c61bae3d658 fs/ksmbd/smb2pdu.c      Marios Makassikis 2022-11-29  9114  					locks_free_lock(flock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9115  					goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9116  				}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9117  			}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9118  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9119  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9120  		smb_lock = smb2_lock_init(flock, cmd, flags, &lock_list);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9121  		if (!smb_lock) {
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9122  			err = -EINVAL;
01f6c61bae3d658 fs/ksmbd/smb2pdu.c      Marios Makassikis 2022-11-29  9123  			locks_free_lock(flock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9124  			goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9125  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9126  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9127  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9128  	list_for_each_entry_safe(smb_lock, tmp, &lock_list, llist) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9129  		if (smb_lock->cmd < 0) {
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9130  			err = -EINVAL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9131  			goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9132  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9133  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9134  		if (!(smb_lock->flags & SMB2_LOCKFLAG_MASK)) {
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9135  			err = -EINVAL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9136  			goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9137  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9138  
64b39f4a2fd293c fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-30  9139  		if ((prior_lock & (SMB2_LOCKFLAG_EXCLUSIVE | SMB2_LOCKFLAG_SHARED) &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9140  		     smb_lock->flags & SMB2_LOCKFLAG_UNLOCK) ||
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9141  		    (prior_lock == SMB2_LOCKFLAG_UNLOCK &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9142  		     !(smb_lock->flags & SMB2_LOCKFLAG_UNLOCK))) {
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9143  			err = -EINVAL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9144  			goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9145  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9146  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9147  		prior_lock = smb_lock->flags;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9148  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9149  		if (!(smb_lock->flags & SMB2_LOCKFLAG_UNLOCK) &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9150  		    !(smb_lock->flags & SMB2_LOCKFLAG_FAIL_IMMEDIATELY))
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9151  			goto no_check_cl;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9152  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9153  		nolock = 1;
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9154  		/* check locks in connection list */
abcc506a9a71976 fs/ksmbd/smb2pdu.c      Namjae Jeon       2023-05-03  9155  		down_read(&conn_list_lock);
0bcc831be535269 fs/smb/server/smb2pdu.c Namjae Jeon       2025-10-01  9156  		hash_for_each(conn_list, bkt, conn, hlist) {
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9157  			spin_lock(&conn->llist_lock);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9158  			list_for_each_entry_safe(cmp_lock, tmp2, &conn->lock_list, clist) {
16f9ce818901c7b fs/smb/server/smb2pdu.c Jeff Layton       2024-01-31  9159  				if (file_inode(cmp_lock->fl->c.flc_file) !=
16f9ce818901c7b fs/smb/server/smb2pdu.c Jeff Layton       2024-01-31  9160  				    file_inode(smb_lock->fl->c.flc_file))
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9161  					continue;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9162  
6a277077ac5189d fs/smb/server/smb2pdu.c Jeff Layton       2024-01-31  9163  				if (lock_is_unlock(smb_lock->fl)) {
16f9ce818901c7b fs/smb/server/smb2pdu.c Jeff Layton       2024-01-31  9164  					if (cmp_lock->fl->c.flc_file == smb_lock->fl->c.flc_file &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9165  					    cmp_lock->start == smb_lock->start &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9166  					    cmp_lock->end == smb_lock->end &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9167  					    !lock_defer_pending(cmp_lock->fl)) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9168  						nolock = 0;
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9169  						list_del(&cmp_lock->flist);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9170  						list_del(&cmp_lock->clist);
c1016dd1d8b2bcd fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-15  9171  						cmp_lock->conn = NULL;
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9172  						spin_unlock(&conn->llist_lock);
abcc506a9a71976 fs/ksmbd/smb2pdu.c      Namjae Jeon       2023-05-03  9173  						up_read(&conn_list_lock);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9174  
c1016dd1d8b2bcd fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-15  9175  						ksmbd_conn_put(conn);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9176  						locks_free_lock(cmp_lock->fl);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9177  						kfree(cmp_lock);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9178  						goto out_check_cl;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9179  					}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9180  					continue;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9181  				}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9182  
16f9ce818901c7b fs/smb/server/smb2pdu.c Jeff Layton       2024-01-31  9183  				if (cmp_lock->fl->c.flc_file == smb_lock->fl->c.flc_file) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9184  					if (smb_lock->flags & SMB2_LOCKFLAG_SHARED)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9185  						continue;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9186  				} else {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9187  					if (cmp_lock->flags & SMB2_LOCKFLAG_SHARED)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9188  						continue;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9189  				}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9190  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9191  				/* check zero byte lock range */
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9192  				if (cmp_lock->zero_len && !smb_lock->zero_len &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9193  				    cmp_lock->start > smb_lock->start &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9194  				    cmp_lock->start < smb_lock->end) {
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9195  					spin_unlock(&conn->llist_lock);
abcc506a9a71976 fs/ksmbd/smb2pdu.c      Namjae Jeon       2023-05-03  9196  					up_read(&conn_list_lock);
bde1694aecdb535 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-06-28  9197  					pr_err("previous lock conflict with zero byte lock range\n");
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9198  					goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9199  				}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9200  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9201  				if (smb_lock->zero_len && !cmp_lock->zero_len &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9202  				    smb_lock->start > cmp_lock->start &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9203  				    smb_lock->start < cmp_lock->end) {
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9204  					spin_unlock(&conn->llist_lock);
abcc506a9a71976 fs/ksmbd/smb2pdu.c      Namjae Jeon       2023-05-03  9205  					up_read(&conn_list_lock);
bde1694aecdb535 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-06-28  9206  					pr_err("current lock conflict with zero byte lock range\n");
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9207  					goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9208  				}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9209  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9210  				if (((cmp_lock->start <= smb_lock->start &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9211  				      cmp_lock->end > smb_lock->start) ||
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9212  				     (cmp_lock->start < smb_lock->end &&
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9213  				      cmp_lock->end >= smb_lock->end)) &&
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9214  				    !cmp_lock->zero_len && !smb_lock->zero_len) {
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9215  					spin_unlock(&conn->llist_lock);
abcc506a9a71976 fs/ksmbd/smb2pdu.c      Namjae Jeon       2023-05-03  9216  					up_read(&conn_list_lock);
bde1694aecdb535 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-06-28  9217  					pr_err("Not allow lock operation on exclusive lock range\n");
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9218  					goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9219  				}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9220  			}
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9221  			spin_unlock(&conn->llist_lock);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9222  		}
abcc506a9a71976 fs/ksmbd/smb2pdu.c      Namjae Jeon       2023-05-03  9223  		up_read(&conn_list_lock);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9224  out_check_cl:
6a277077ac5189d fs/smb/server/smb2pdu.c Jeff Layton       2024-01-31  9225  		if (lock_is_unlock(smb_lock->fl) && nolock) {
bde1694aecdb535 fs/cifsd/smb2pdu.c      Namjae Jeon       2021-06-28  9226  			pr_err("Try to unlock nolocked range\n");
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9227  			rsp->hdr.Status = STATUS_RANGE_NOT_LOCKED;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9228  			goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9229  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9230  
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9231  no_check_cl:
84d2d1641b71dec fs/smb/server/smb2pdu.c Namjae Jeon       2025-02-26  9232  		flock = smb_lock->fl;
84d2d1641b71dec fs/smb/server/smb2pdu.c Namjae Jeon       2025-02-26  9233  		list_del(&smb_lock->llist);
84d2d1641b71dec fs/smb/server/smb2pdu.c Namjae Jeon       2025-02-26  9234  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9235  		if (smb_lock->zero_len) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9236  			err = 0;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9237  			goto skip;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9238  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9239  retry:
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9240  		rc = vfs_lock_file(filp, smb_lock->cmd, flock, NULL);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9241  skip:
e26e2d2e15daf1a fs/smb/server/smb2pdu.c Namjae Jeon       2025-02-27  9242  		if (smb_lock->flags & SMB2_LOCKFLAG_UNLOCK) {
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9243  			locks_free_lock(flock);
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9244  			kfree(smb_lock);
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9245  			if (!rc) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9246  				ksmbd_debug(SMB, "File unlocked\n");
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9247  			} else if (rc == -ENOENT) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9248  				rsp->hdr.Status = STATUS_NOT_LOCKED;
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9249  				err = rc;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9250  				goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9251  			}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9252  		} else {
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9253  			if (rc == FILE_LOCK_DEFERRED) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9254  				void **argv;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9255  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9256  				ksmbd_debug(SMB,
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9257  					    "would have to wait for getting lock\n");
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9258  				list_add(&smb_lock->llist, &rollback_list);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9259  
0066f623bce8f98 fs/smb/server/smb2pdu.c Namjae Jeon       2024-11-22  9260  				argv = kmalloc(sizeof(void *), KSMBD_DEFAULT_GFP);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9261  				if (!argv) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9262  					err = -ENOMEM;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9263  					goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9264  				}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9265  				argv[0] = flock;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9266  
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9267  				rc = setup_async_work(work,
070fb21e5912b6a fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-26  9268  						      smb2_remove_blocked_lock,
070fb21e5912b6a fs/cifsd/smb2pdu.c      Namjae Jeon       2021-05-26  9269  						      argv);
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9270  				if (rc) {
8f1752723019db9 fs/smb/server/smb2pdu.c Zizhi Wo          2023-12-01  9271  					kfree(argv);
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9272  					err = -ENOMEM;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9273  					goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9274  				}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9275  				spin_lock(&fp->f_lock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9276  				list_add(&work->fp_entry, &fp->blocked_works);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9277  				spin_unlock(&fp->f_lock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9278  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9279  				smb2_send_interim_resp(work, STATUS_PENDING);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9280  
45a64e8b08493b7 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9281  				ksmbd_vfs_posix_lock_wait(flock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9282  
d3ca9f7aeba793d fs/ksmbd/smb2pdu.c      Hangyu Hua        2023-02-17  9283  				spin_lock(&fp->f_lock);
d3ca9f7aeba793d fs/ksmbd/smb2pdu.c      Hangyu Hua        2023-02-17  9284  				list_del(&work->fp_entry);
d3ca9f7aeba793d fs/ksmbd/smb2pdu.c      Hangyu Hua        2023-02-17  9285  				spin_unlock(&fp->f_lock);
d3ca9f7aeba793d fs/ksmbd/smb2pdu.c      Hangyu Hua        2023-02-17  9286  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9287  				list_del(&smb_lock->llist);
d20d1c8ba5765d1 fs/smb/server/smb2pdu.c Davide Ornaghi    2026-06-06  9288  				release_async_work(work);
d20d1c8ba5765d1 fs/smb/server/smb2pdu.c Davide Ornaghi    2026-06-06  9289  
d20d1c8ba5765d1 fs/smb/server/smb2pdu.c Davide Ornaghi    2026-06-06  9290  				if (work->state == KSMBD_WORK_ACTIVE)
d20d1c8ba5765d1 fs/smb/server/smb2pdu.c Davide Ornaghi    2026-06-06  9291  					goto retry;
d20d1c8ba5765d1 fs/smb/server/smb2pdu.c Davide Ornaghi    2026-06-06  9292  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9293  				locks_free_lock(flock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9294  
d4075abbc6b571e fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-06-25  9295  				if (work->state == KSMBD_WORK_CANCELLED) {
d20d1c8ba5765d1 fs/smb/server/smb2pdu.c Davide Ornaghi    2026-06-06  9296  					rsp->hdr.Status = STATUS_CANCELLED;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9297  					kfree(smb_lock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9298  					smb2_send_interim_resp(work,
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9299  							STATUS_CANCELLED);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9300  					work->send_no_response = 1;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9301  					goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9302  				}
3a9b557f44ea8f2 fs/ksmbd/smb2pdu.c      Namjae Jeon       2023-03-31  9303  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9304  				rsp->hdr.Status =
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9305  					STATUS_RANGE_NOT_LOCKED;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9306  				kfree(smb_lock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9307  				goto out2;
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9308  			} else if (!rc) {
75ac9a3dd65f7ea fs/smb/server/smb2pdu.c Namjae Jeon       2023-10-04  9309  				list_add(&smb_lock->llist, &rollback_list);
c1016dd1d8b2bcd fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-15  9310  				smb_lock->conn = ksmbd_conn_get(work->conn);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9311  				spin_lock(&work->conn->llist_lock);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9312  				list_add_tail(&smb_lock->clist,
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9313  					      &work->conn->lock_list);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9314  				list_add_tail(&smb_lock->flist,
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9315  					      &fp->lock_list);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9316  				spin_unlock(&work->conn->llist_lock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9317  				ksmbd_debug(SMB, "successful in taking lock\n");
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9318  			} else {
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9319  				locks_free_lock(flock);
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9320  				kfree(smb_lock);
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9321  				err = rc;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9322  				goto out;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9323  			}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9324  		}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9325  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9326  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9327  	if (atomic_read(&fp->f_ci->op_count) > 1)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9328  		smb_break_all_oplock(work, fp);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9329  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9330  	rsp->StructureSize = cpu_to_le16(4);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9331  	ksmbd_debug(SMB, "successful in taking lock\n");
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9332  	rsp->hdr.Status = STATUS_SUCCESS;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9333  	rsp->Reserved = 0;
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  9334  	err = ksmbd_iov_pin_rsp(work, rsp, sizeof(struct smb2_lock_rsp));
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  9335  	if (err)
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  9336  		goto out;
10e5f86a51f4383 fs/smb/server/smb2pdu.c Namjae Jeon       2026-07-19  9337  	smb2_update_lock_sequence(work, fp, req);
e2b76ab8b5c9327 fs/smb/server/smb2pdu.c Namjae Jeon       2023-08-29  9338  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9339  	ksmbd_fd_put(work, fp);
96ad4ec51c06c6f fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-13  9340  	return 0;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9341  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9342  out:
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9343  	list_for_each_entry_safe(smb_lock, tmp, &lock_list, llist) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9344  		locks_free_lock(smb_lock->fl);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9345  		list_del(&smb_lock->llist);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9346  		kfree(smb_lock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9347  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9348  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9349  	list_for_each_entry_safe(smb_lock, tmp, &rollback_list, llist) {
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9350  		struct file_lock *rlock = NULL;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9351  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9352  		rlock = smb_flock_init(filp);
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9353  		if (rlock) {
16f9ce818901c7b fs/smb/server/smb2pdu.c Jeff Layton       2024-01-31  9354  			rlock->c.flc_type = F_UNLCK;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9355  			rlock->fl_start = smb_lock->start;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9356  			rlock->fl_end = smb_lock->end;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9357  
7ecbe92696bb7fe fs/ksmbd/smb2pdu.c      Jeff Layton       2022-11-11  9358  			rc = vfs_lock_file(filp, F_SETLK, rlock, NULL);
96ad4ec51c06c6f fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-13  9359  			if (rc)
96ad4ec51c06c6f fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-13  9360  				pr_err("rollback unlock fail : %d\n", rc);
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9361  		} else {
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9362  			pr_err("rollback unlock alloc failed\n");
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9363  		}
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9364  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9365  		list_del(&smb_lock->llist);
c1016dd1d8b2bcd fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-15  9366  		conn = smb_lock->conn;
c1016dd1d8b2bcd fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-15  9367  		spin_lock(&conn->llist_lock);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9368  		if (!list_empty(&smb_lock->flist))
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9369  			list_del(&smb_lock->flist);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9370  		list_del(&smb_lock->clist);
c1016dd1d8b2bcd fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-15  9371  		smb_lock->conn = NULL;
c1016dd1d8b2bcd fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-15  9372  		spin_unlock(&conn->llist_lock);
c1016dd1d8b2bcd fs/smb/server/smb2pdu.c Namjae Jeon       2026-06-15  9373  		ksmbd_conn_put(conn);
d63528eb0d43c47 fs/ksmbd/smb2pdu.c      Hyunchul Lee      2021-07-10  9374  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9375  		locks_free_lock(smb_lock->fl);
309b44ed684496e fs/smb/server/smb2pdu.c Werner Kasselman  2026-03-17  9376  		if (rlock)
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9377  			locks_free_lock(rlock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9378  		kfree(smb_lock);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9379  	}
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9380  out2:
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9381  	ksmbd_debug(SMB, "failed in taking lock(flags : %x), err : %d\n", flags, err);
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9382  
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9383  	if (!rsp->hdr.Status) {
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9384  		if (err == -EINVAL)
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9385  			rsp->hdr.Status = STATUS_INVALID_PARAMETER;
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9386  		else if (err == -ENOMEM)
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9387  			rsp->hdr.Status = STATUS_INSUFFICIENT_RESOURCES;
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9388  		else if (err == -ENOENT)
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9389  			rsp->hdr.Status = STATUS_FILE_CLOSED;
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9390  		else
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9391  			rsp->hdr.Status = STATUS_LOCK_NOT_GRANTED;
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9392  	}
6c99dfc4c5f6fa1 fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-27  9393  
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9394  	smb2_set_err_rsp(work);
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9395  	ksmbd_fd_put(work, fp);
96ad4ec51c06c6f fs/ksmbd/smb2pdu.c      Namjae Jeon       2021-07-13  9396  	return err;
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9397  }
e2f34481b24db2f fs/cifsd/smb2pdu.c      Namjae Jeon       2021-03-16  9398  

:::::: The code at line 9073 was first introduced by commit
:::::: e2f34481b24db2fd634b5edb0a5bd0e4d38cc6e9 cifsd: add server-side procedures for SMB3

:::::: TO: Namjae Jeon <namjae.jeon@samsung.com>
:::::: CC: Steve French <stfrench@microsoft.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
