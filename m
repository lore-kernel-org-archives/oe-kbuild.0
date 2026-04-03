Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4A8346E5D
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Apr 2026 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205963; cv=none; b=aeXbplTRuobFpV97eytqKCftXmatNn8s8hCcBLNevDNxc5gE0wlWjbxFU5a+PP6dCZcjbcwxkfz6TD2tdC+WHfqqORESdEf61a+XNphcAeLTH7rc2DaQ5IkAca8oavdBgrWrkeWg1j1Qrla1opXxkwJB0oOcwSAxWYTvHJ+/MlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205963; c=relaxed/simple;
	bh=3oLMlUU3hUCdKPoNCJxKyHYnpyPTj4f4U1rL8u0EoUE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rE4JbKuiKOSuTocBBGqOq0f5BQsHS7dWyq+Hjrt3pvitufj1cEJNIFlWW0ZPikUIW0qbLxq11WqekDdzdUzLm054QD1MhkBcBGDCsdy7iLnVF3NcS9iPUJqJG0+N93bkOp9ckU6kbNsbvA9ovCbgyBI+QHE14AlTEO07FU8vbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lZI4CtuW; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lZI4CtuW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205962; x=1806741962;
  h=date:from:to:cc:subject:message-id;
  bh=3oLMlUU3hUCdKPoNCJxKyHYnpyPTj4f4U1rL8u0EoUE=;
  b=lZI4CtuWJXnxmwlZ1Oh/pnMonOVrYaV9+fvRPGPKGP73dw6mvlui4U1C
   xaGjNmskhk7DrXi8L3SWUMcTtGq9YyCF1YuIaRRurl6hWQy1I1ZpJ+gnY
   i5HDatgrjUzX7FQyrSP4oGDfkPCxnRKmr8zGKTPi0JlmGs4lIGB7si2Dg
   2s1ldPyMMorl0XR9QF7Jlv0TwDp/moaTDoFo3zoq7wtr9s9pttrPs2MjC
   JNq/kTqFAy23xptkiwPMtlM8BfSmiENWiawUOwyBIf5oMDoSvmhfke2Jw
   BPD49hlcF4bBjDk+yMxEnTIl8PgkYSrRLpHeU6YYiRf2orZ0VOGBG1/4a
   g==;
X-CSE-ConnectionGUID: x6X3Wx8uRaWcB7zdcpb5Kg==
X-CSE-MsgGUID: 813LRyX2QEKd/Xa1xc7Bpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="86889028"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="86889028"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:46:00 -0700
X-CSE-ConnectionGUID: tcdqDZaCRoScRxGCPdE56g==
X-CSE-MsgGUID: KdL1sLgsT96osMDXPUVejQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="226368998"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Apr 2026 01:45:59 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8aA8-00000000165-28Uy;
	Fri, 03 Apr 2026 08:45:56 +0000
Date: Fri, 03 Apr 2026 16:45:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-6.1 8/8]
 fs/smb/client/smb2pdu.c:105 smb2_hdr_assemble() warn: variable dereferenced
 before check 'server' (see line 95)
Message-ID: <202604031018.6Y8lB1IJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   b5e515a3e6a73395e13127a3a8172e77da3d9b30
commit: 0f7339056893f270e391c23d2438871a79deec86 [8/8] send channel sequence number in SMB3 requests after reconnects
:::::: branch date: 29 hours ago
:::::: commit date: 2 years, 6 months ago
config: x86_64-randconfig-161-20260402 (https://download.01.org/0day-ci/archive/20260403/202604031018.6Y8lB1IJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604031018.6Y8lB1IJ-lkp@intel.com/

New smatch warnings:
fs/smb/client/smb2pdu.c:105 smb2_hdr_assemble() warn: variable dereferenced before check 'server' (see line 95)

Old smatch warnings:
fs/smb/client/smb2pdu.c:4999 SMB2_query_directory_init() error: __memcpy() 'bufptr' too small (1 vs 2)

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
