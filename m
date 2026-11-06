Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793970006;
	b=wtHyN/ypYM/OGsPHq7fjcvq0+lWXAlO9Y5c8JWvbtijCNQm2/bMilil4JArjm7t/ZUl2
	 f2W2Qb14DJKb24hWBQXBvlOvYyf6OEbiuS7uHyFGboW41Bl6XLBbhxm8NLdI1WWyfjRtD
	 yPMao4V2rPMauDPYlfFTsaDlLPwjRENuBQM4m2PJO9/VeftWWqnvPhx+HVpWblKBaHRD2
	 t15CAxm2v4pAqFZwMhhbM5Szq2fzeaPas6/hLCqlIrVJyDXlBLnswIqYgzIFn6kuJz60f
	 /yZnWclfvZiWu1LPJVWk1/WtJB5LQ/474yxV+FAydB6Foju3LGO1dsRAbc/pcwkTWEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793970006;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=wI4z+KbAvDradsqOQaVDaQX/qeM3tdiXf5RUv32co/E=;
	b=xbk9UciHvYbW9ZEdSmXrbP3I0FIOwjExBqen8ECDJwAXgkjoOPrJUA6WqKQtN5OdzlAg
	 w7il6zvh7sq1xgo5szvwisLljl6r9F7gO5k3ievcStDdwzx3h45THXTwgMH46YJ3R41/+
	 SpA5XO/jZ+j/4h4jWZswwa1qRYLqvygcv65tLfxIjgCNzQm4AhJ0seflDe+GFX910QyUX
	 9QeEDAvRes8s6VpAQS+RYCyYyPwiLQLi32mXLfBf3bQzxJ/UJNE9sodfwbNE6ThGKVwpw
	 AUySa8TGD1ZNaNVsKsY9rNrwK0NnbFhzuNAWVuySzfSZ2PefpLloBVf6DZkQ1jkgKnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I+WjSdiM;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA466606A32D
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 13:00:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA466606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I+WjSdiM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793970006; x=1825506006;
  h=date:from:to:cc:subject:message-id;
  bh=Kwru4g1T3K802wMxr/2DzZXSnsn5rVxtKxQNpXRqAv0=;
  b=I+WjSdiMSqu5UWersW3OE4O6uI88joDR3g1Yv33S1avc2zHEOWe8jV+S
   TgKVqxPkfZyNJ9+0sUcuMYNL+DHnCKj3x7RUR53H7PzQ8xtyCKYGX2Xti
   zPrcOb9wbKVEC2wQur+MWAk0WLwEOYR5U2Hh+4SIwIILIcKwlWtGpE6uz
   qJb65u+YnibtnA4I78pPvsQ3GlrP7GWEePX0jHrg1ss3hWR8qmkTNNBLX
   k5b8xMPIszqtlsdQqB7pcUL+TGcH76C0Z21FOiXKztbO56gcNL4XM6HIg
   8CvArb0rtQcjLl9GWT9EuKj3wbr+qslEZ8P9EADJ+zAvqwi2nPLswpAIy
   Q==;
X-CSE-ConnectionGUID: qQqH5NkWTE6S8YXWOMYDQg==
X-CSE-MsgGUID: TCtAbTNDSU2NW6nLFT3S2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2680005"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2680005"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 05:00:06 -0800
X-CSE-ConnectionGUID: hVQHvQBNRSqWhPlyXeJdLg==
X-CSE-MsgGUID: Z5u4cRuYT1+zg45Yzz3S7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7385446"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 06 Nov 2026 05:00:04 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPJY1-00000000AFv-2kx7;
	Fri, 06 Nov 2026 13:00:01 +0000
Date: Fri, 06 Nov 2026 13:59:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android14-kiwi-6.1 390/390]
 fs/smb/client/smb2pdu.c:105 smb2_hdr_assemble() warn: variable dereferenced
 before check 'server' (see line 95)
Message-ID: <202611061340.DxdG2uZh-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   900d46d1c904d34d7c3eeb0ef2119cffc5a8ab3d
commit: 0f7339056893f270e391c23d2438871a79deec86 [390/390] send channel sequence number in SMB3 requests after reconnects
:::::: branch date: 2 days ago
:::::: commit date: 3 years, 2 months ago
config: i386-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611061340.DxdG2uZh-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611061340.DxdG2uZh-lkp@intel.com/

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
