Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC96A33D4E1
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Dec 2025 18:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766167634; cv=none; b=QkiLeyVz82lcrQC0iVKvIthqIcRu+MeqFvW4B3EYw3A/smvJ2cIABgzJbadZToIe2IWW5HraQQn8CvK9UcndIufyRRdTwTHfyyNTU7V7HucRjDxN+Gu3UykT8XYy+uJSkMj/nGxtj7yKEN3CtbDwedT2HMmJ6mUdZfX+LlWk49w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766167634; c=relaxed/simple;
	bh=BjAOpR2eEyKe04fKWVXOK9OtF5YKdANJi4T4zYndLf8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TByW52PiZQzW6Q2wDokt3XnL/HuJcV+i++OOd0KqfDqVAfKVD7E+VNAXTw8/I5z40HwPHPS48HxyawL6KK8nd9Ydqoh929tgcxcyRznnoD8UgaN8xUsOmVaA540gDw2oH+PixqVZU6mvZWXspIzjWEpIE00xwSqdycyEmGvx2Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a+vnJ98o; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a+vnJ98o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766167631; x=1797703631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BjAOpR2eEyKe04fKWVXOK9OtF5YKdANJi4T4zYndLf8=;
  b=a+vnJ98oSwtwTs3o6UTVXRqtZo1kA9J6MMb+dbmZceXbwksNjKhX66UO
   3RxOPjyghVV0xDU9AJOVpjTmFsfRStTwBUv8htFloU7UDznM8kxY61PST
   8U7bqE9NHxRrvHkEpkagWgvZWEleF+RHazUSn10grGDPrz5xQ/2Vgrm3q
   9lJkJyFCmTKWP7EXJCtqd/o7ZwuVRCxROW2NrPQwBuloxLjG3hDjRWqzT
   NMsUfu4pQf7xR+eAR31aoROcu2mkiETftN2EMrVo0Ru9bToq5isBJiT/V
   eQEI3FHdcRxKD5a+tCOCYYrRSEpvWw0oOb3H/IOUwhui+kEegfWvZmCGu
   g==;
X-CSE-ConnectionGUID: T/h4AVUhQbSvLtWbZGwq/g==
X-CSE-MsgGUID: B0eL3L2CQmyFviQ22HiSfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="90790796"
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="90790796"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2025 10:07:09 -0800
X-CSE-ConnectionGUID: WP0nr9XES6adBiNQhg7zCA==
X-CSE-MsgGUID: Tm3q0vueRI+3dgnUcZvHlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,161,1763452800"; 
   d="scan'208";a="203329324"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Dec 2025 10:07:07 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWesb-000000003pp-060y;
	Fri, 19 Dec 2025 18:07:05 +0000
Date: Sat, 20 Dec 2025 02:06:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 43/43]
 fs/smb/client/smb2pdu.c:105 smb2_hdr_assemble() warn: variable dereferenced
 before check 'server' (see line 95)
Message-ID: <202512200250.hKAvJxbz-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   d13a7e3b3e0f1ca9e8faea93fbebfed911c2588d
commit: 0f7339056893f270e391c23d2438871a79deec86 [43/43] send channel sequence number in SMB3 requests after reconnects
:::::: branch date: 32 hours ago
:::::: commit date: 2 years, 3 months ago
config: i386-randconfig-141-20251217 (https://download.01.org/0day-ci/archive/20251220/202512200250.hKAvJxbz-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512200250.hKAvJxbz-lkp@intel.com/

New smatch warnings:
fs/smb/client/smb2pdu.c:105 smb2_hdr_assemble() warn: variable dereferenced before check 'server' (see line 95)

Old smatch warnings:
fs/smb/client/smb2pdu.c:4999 SMB2_query_directory_init() error: __builtin_memcpy() 'bufptr' too small (1 vs 2)

vim +/server +105 fs/smb/client/smb2pdu.c

ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27   85  
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27   86  static void
0d35e382e4e96a fs/cifs/smb2pdu.c       Ronnie Sahlberg 2021-11-05   87  smb2_hdr_assemble(struct smb2_hdr *shdr, __le16 smb2_cmd,
352d96f3acc6e0 fs/cifs/smb2pdu.c       Aurelien Aptel  2020-05-31   88  		  const struct cifs_tcon *tcon,
352d96f3acc6e0 fs/cifs/smb2pdu.c       Aurelien Aptel  2020-05-31   89  		  struct TCP_Server_Info *server)
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27   90  {
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24   91  	struct smb3_hdr_req *smb3_hdr;
31473fc4f9653b fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24   92  	shdr->ProtocolId = SMB2_PROTO_NUMBER;
31473fc4f9653b fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24   93  	shdr->StructureSize = cpu_to_le16(64);
31473fc4f9653b fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24   94  	shdr->Command = smb2_cmd;
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24  @95  	if (server->dialect >= SMB30_PROT_ID) {
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24   96  		/* After reconnect SMB3 must set ChannelSequence on subsequent reqs */
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24   97  		smb3_hdr = (struct smb3_hdr_req *)shdr;
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24   98  		/* if primary channel is not set yet, use default channel for chan sequence num */
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24   99  		if (CIFS_SERVER_IS_CHAN(server))
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24  100  			smb3_hdr->ChannelSequence =
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24  101  				cpu_to_le16(server->primary_server->channel_sequence_num);
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24  102  		else
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24  103  			smb3_hdr->ChannelSequence = cpu_to_le16(server->channel_sequence_num);
0f7339056893f2 fs/smb/client/smb2pdu.c Steve French    2023-08-24  104  	}
352d96f3acc6e0 fs/cifs/smb2pdu.c       Aurelien Aptel  2020-05-31 @105  	if (server) {
7d414f396c91a3 fs/cifs/smb2pdu.c       Ross Lagerwall  2016-09-20  106  		spin_lock(&server->req_lock);
69dc4b181710d0 fs/cifs/smb2pdu.c       Steve French    2019-03-05  107  		/* Request up to 10 credits but don't go over the limit. */
141891f4727c08 fs/cifs/smb2pdu.c       Steve French    2016-09-23  108  		if (server->credits >= server->max_credits)
31473fc4f9653b fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  109  			shdr->CreditRequest = cpu_to_le16(0);
7d414f396c91a3 fs/cifs/smb2pdu.c       Ross Lagerwall  2016-09-20  110  		else
31473fc4f9653b fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  111  			shdr->CreditRequest = cpu_to_le16(
141891f4727c08 fs/cifs/smb2pdu.c       Steve French    2016-09-23  112  				min_t(int, server->max_credits -
69dc4b181710d0 fs/cifs/smb2pdu.c       Steve French    2019-03-05  113  						server->credits, 10));
7d414f396c91a3 fs/cifs/smb2pdu.c       Ross Lagerwall  2016-09-20  114  		spin_unlock(&server->req_lock);
7d414f396c91a3 fs/cifs/smb2pdu.c       Ross Lagerwall  2016-09-20  115  	} else {
31473fc4f9653b fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  116  		shdr->CreditRequest = cpu_to_le16(2);
7d414f396c91a3 fs/cifs/smb2pdu.c       Ross Lagerwall  2016-09-20  117  	}
0d35e382e4e96a fs/cifs/smb2pdu.c       Ronnie Sahlberg 2021-11-05  118  	shdr->Id.SyncId.ProcessId = cpu_to_le32((__u16)current->tgid);
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  119  
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  120  	if (!tcon)
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  121  		goto out;
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  122  
2b80d049eb6dd0 fs/cifs/smb2pdu.c       Steve French    2013-06-23  123  	/* GLOBAL_CAP_LARGE_MTU will only be set if dialect > SMB2.02 */
2b80d049eb6dd0 fs/cifs/smb2pdu.c       Steve French    2013-06-23  124  	/* See sections 2.2.4 and 3.2.4.1.5 of MS-SMB2 */
352d96f3acc6e0 fs/cifs/smb2pdu.c       Aurelien Aptel  2020-05-31  125  	if (server && (server->capabilities & SMB2_GLOBAL_CAP_LARGE_MTU))
31473fc4f9653b fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  126  		shdr->CreditCharge = cpu_to_le16(1);
2b80d049eb6dd0 fs/cifs/smb2pdu.c       Steve French    2013-06-23  127  	/* else CreditCharge MBZ */
2b80d049eb6dd0 fs/cifs/smb2pdu.c       Steve French    2013-06-23  128  
0d35e382e4e96a fs/cifs/smb2pdu.c       Ronnie Sahlberg 2021-11-05  129  	shdr->Id.SyncId.TreeId = cpu_to_le32(tcon->tid);
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  130  	/* Uid is not converted */
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  131  	if (tcon->ses)
0d35e382e4e96a fs/cifs/smb2pdu.c       Ronnie Sahlberg 2021-11-05  132  		shdr->SessionId = cpu_to_le64(tcon->ses->Suid);
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  133  
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  134  	/*
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  135  	 * If we would set SMB2_FLAGS_DFS_OPERATIONS on open we also would have
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  136  	 * to pass the path on the Open SMB prefixed by \\server\share.
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  137  	 * Not sure when we would need to do the augmented path (if ever) and
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  138  	 * setting this flag breaks the SMB2 open operation since it is
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  139  	 * illegal to send an empty path name (without \\server\share prefix)
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  140  	 * when the DFS flag is set in the SMB open header. We could
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  141  	 * consider setting the flag on all operations other than open
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  142  	 * but it is safer to net set it for now.
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  143  	 */
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  144  /*	if (tcon->share_flags & SHI1005_FLAGS_DFS)
31473fc4f9653b fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  145  		shdr->Flags |= SMB2_FLAGS_DFS_OPERATIONS; */
f87ab88b4065a9 fs/cifs/smb2pdu.c       Steve French    2013-06-26  146  
352d96f3acc6e0 fs/cifs/smb2pdu.c       Aurelien Aptel  2020-05-31  147  	if (server && server->sign && !smb3_encryption_required(tcon))
31473fc4f9653b fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  148  		shdr->Flags |= SMB2_FLAGS_SIGNED;
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  149  out:
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  150  	return;
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  151  }
ec2e4523fdba88 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  152  

:::::: The code at line 105 was first introduced by commit
:::::: 352d96f3acc6e02099f58a24d5cabce7f8ee061f cifs: multichannel: move channel selection above transport layer

:::::: TO: Aurelien Aptel <aaptel@suse.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
