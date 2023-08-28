Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDA711CA3
	for <oe-kbuild@lists.linux.dev>; Mon, 28 Aug 2023 12:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693225129; x=1724761129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SJC6B2OI7U8xg71uZJ0IYvPVZMN5KRTjSCt3BHQoggk=;
  b=ZecL6fJSZJIRs5lBx2lgoWXSgoXadqGUraxVEidvadzJbiuFIicul4yF
   JzaZ5YmKOL1Okyovwt+NN4rKhk3BPk+oNv4M8v/CDIHzROuEN1X1JjS+r
   pbluq7FUqfNg+vTMC30nBi3ApCAWeuhqfB/JIr49mKJqxEKfGqCWe4ps+
   IIfEP4xmOjmkpDtGqlhwkK6O4eEbtrcQ9XAjL74KjK/mPJMFY/Rg9XcPr
   XUMNAxeY8Z4/zcMlDVdo3bqefgg/my4Ntb+5bTrbvsDPVxbMZv9PPk3nd
   3LisGI2dZGBwcyYnArml2Knsh/V1wkpkycCpxvqDeICxzbBWtE0hSFQAI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="365289422"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="365289422"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 05:18:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10816"; a="803676004"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="803676004"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 28 Aug 2023 05:18:45 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qabCe-0007pn-2t;
	Mon, 28 Aug 2023 12:18:44 +0000
Date: Mon, 28 Aug 2023 20:17:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12549/13109] fs/smb/client/smb2pdu.c:105
 smb2_hdr_assemble() warn: variable dereferenced before check 'server' (see
 line 95)
Message-ID: <202308282011.FHAVZIqG-lkp@intel.com>
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
TO: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ee82481c392eec06a7ef28df61b7f0d8e45be2e
commit: 09ee7a3bf866c0fa5ee1914d2c65958559eb5b4c [12549/13109] [SMB3] send channel sequence number in SMB3 requests after reconnects
:::::: branch date: 7 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20230828 (https://download.01.org/0day-ci/archive/20230828/202308282011.FHAVZIqG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230828/202308282011.FHAVZIqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308282011.FHAVZIqG-lkp@intel.com/

smatch warnings:
fs/smb/client/smb2pdu.c:105 smb2_hdr_assemble() warn: variable dereferenced before check 'server' (see line 95)

vim +/server +105 fs/smb/client/smb2pdu.c

ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27   85  
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27   86  static void
0d35e382e4e96a4 fs/cifs/smb2pdu.c       Ronnie Sahlberg 2021-11-05   87  smb2_hdr_assemble(struct smb2_hdr *shdr, __le16 smb2_cmd,
352d96f3acc6e02 fs/cifs/smb2pdu.c       Aurelien Aptel  2020-05-31   88  		  const struct cifs_tcon *tcon,
352d96f3acc6e02 fs/cifs/smb2pdu.c       Aurelien Aptel  2020-05-31   89  		  struct TCP_Server_Info *server)
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27   90  {
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24   91  	struct smb3_hdr_req *smb3_hdr;
31473fc4f9653b7 fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24   92  	shdr->ProtocolId = SMB2_PROTO_NUMBER;
31473fc4f9653b7 fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24   93  	shdr->StructureSize = cpu_to_le16(64);
31473fc4f9653b7 fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24   94  	shdr->Command = smb2_cmd;
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24  @95  	if (server->dialect >= SMB30_PROT_ID) {
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24   96  		/* After reconnect SMB3 must set ChannelSequence on subsequent reqs */
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24   97  		smb3_hdr = (struct smb3_hdr_req *)shdr;
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24   98  		/* if primary channel is not set yet, use default channel for chan sequence num */
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24   99  		if (CIFS_SERVER_IS_CHAN(server))
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24  100  			smb3_hdr->ChannelSequence =
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24  101  				cpu_to_le16(server->primary_server->channel_sequence_num);
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24  102  		else
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24  103  			smb3_hdr->ChannelSequence = cpu_to_le16(server->channel_sequence_num);
09ee7a3bf866c0f fs/smb/client/smb2pdu.c Steve French    2023-08-24  104  	}
352d96f3acc6e02 fs/cifs/smb2pdu.c       Aurelien Aptel  2020-05-31 @105  	if (server) {
7d414f396c91a33 fs/cifs/smb2pdu.c       Ross Lagerwall  2016-09-20  106  		spin_lock(&server->req_lock);
69dc4b181710d0a fs/cifs/smb2pdu.c       Steve French    2019-03-05  107  		/* Request up to 10 credits but don't go over the limit. */
141891f4727c088 fs/cifs/smb2pdu.c       Steve French    2016-09-23  108  		if (server->credits >= server->max_credits)
31473fc4f9653b7 fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  109  			shdr->CreditRequest = cpu_to_le16(0);
7d414f396c91a33 fs/cifs/smb2pdu.c       Ross Lagerwall  2016-09-20  110  		else
31473fc4f9653b7 fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  111  			shdr->CreditRequest = cpu_to_le16(
141891f4727c088 fs/cifs/smb2pdu.c       Steve French    2016-09-23  112  				min_t(int, server->max_credits -
69dc4b181710d0a fs/cifs/smb2pdu.c       Steve French    2019-03-05  113  						server->credits, 10));
7d414f396c91a33 fs/cifs/smb2pdu.c       Ross Lagerwall  2016-09-20  114  		spin_unlock(&server->req_lock);
7d414f396c91a33 fs/cifs/smb2pdu.c       Ross Lagerwall  2016-09-20  115  	} else {
31473fc4f9653b7 fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  116  		shdr->CreditRequest = cpu_to_le16(2);
7d414f396c91a33 fs/cifs/smb2pdu.c       Ross Lagerwall  2016-09-20  117  	}
0d35e382e4e96a4 fs/cifs/smb2pdu.c       Ronnie Sahlberg 2021-11-05  118  	shdr->Id.SyncId.ProcessId = cpu_to_le32((__u16)current->tgid);
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  119  
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  120  	if (!tcon)
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  121  		goto out;
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  122  
2b80d049eb6dd08 fs/cifs/smb2pdu.c       Steve French    2013-06-23  123  	/* GLOBAL_CAP_LARGE_MTU will only be set if dialect > SMB2.02 */
2b80d049eb6dd08 fs/cifs/smb2pdu.c       Steve French    2013-06-23  124  	/* See sections 2.2.4 and 3.2.4.1.5 of MS-SMB2 */
352d96f3acc6e02 fs/cifs/smb2pdu.c       Aurelien Aptel  2020-05-31  125  	if (server && (server->capabilities & SMB2_GLOBAL_CAP_LARGE_MTU))
31473fc4f9653b7 fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  126  		shdr->CreditCharge = cpu_to_le16(1);
2b80d049eb6dd08 fs/cifs/smb2pdu.c       Steve French    2013-06-23  127  	/* else CreditCharge MBZ */
2b80d049eb6dd08 fs/cifs/smb2pdu.c       Steve French    2013-06-23  128  
0d35e382e4e96a4 fs/cifs/smb2pdu.c       Ronnie Sahlberg 2021-11-05  129  	shdr->Id.SyncId.TreeId = cpu_to_le32(tcon->tid);
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  130  	/* Uid is not converted */
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  131  	if (tcon->ses)
0d35e382e4e96a4 fs/cifs/smb2pdu.c       Ronnie Sahlberg 2021-11-05  132  		shdr->SessionId = cpu_to_le64(tcon->ses->Suid);
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  133  
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  134  	/*
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  135  	 * If we would set SMB2_FLAGS_DFS_OPERATIONS on open we also would have
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  136  	 * to pass the path on the Open SMB prefixed by \\server\share.
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  137  	 * Not sure when we would need to do the augmented path (if ever) and
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  138  	 * setting this flag breaks the SMB2 open operation since it is
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  139  	 * illegal to send an empty path name (without \\server\share prefix)
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  140  	 * when the DFS flag is set in the SMB open header. We could
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  141  	 * consider setting the flag on all operations other than open
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  142  	 * but it is safer to net set it for now.
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  143  	 */
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  144  /*	if (tcon->share_flags & SHI1005_FLAGS_DFS)
31473fc4f9653b7 fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  145  		shdr->Flags |= SMB2_FLAGS_DFS_OPERATIONS; */
f87ab88b4065a9e fs/cifs/smb2pdu.c       Steve French    2013-06-26  146  
352d96f3acc6e02 fs/cifs/smb2pdu.c       Aurelien Aptel  2020-05-31  147  	if (server && server->sign && !smb3_encryption_required(tcon))
31473fc4f9653b7 fs/cifs/smb2pdu.c       Pavel Shilovsky 2016-10-24  148  		shdr->Flags |= SMB2_FLAGS_SIGNED;
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  149  out:
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  150  	return;
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  151  }
ec2e4523fdba883 fs/cifs/smb2pdu.c       Pavel Shilovsky 2011-12-27  152  

:::::: The code at line 105 was first introduced by commit
:::::: 352d96f3acc6e02099f58a24d5cabce7f8ee061f cifs: multichannel: move channel selection above transport layer

:::::: TO: Aurelien Aptel <aaptel@suse.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
