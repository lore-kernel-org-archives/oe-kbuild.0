Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAE42FE56A
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 08:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779266178; cv=none; b=luuRRGKdVqXpD+DXKZCeCSshwJEWafC84ZN6thEqnj/xL2bM52/uNi1ynoK9A4m3tgZ63daUoLPNl+n2wdl68kciZiMvJM3JAmNnnvJrYsU2PBrmA8s++6Ap+T1Knc626ozn0fE9dZ7KfBHsgMaMyj40/4bWwa4Vhv2+YCnNPiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779266178; c=relaxed/simple;
	bh=2inXXUkbzKB2HQKHqxMEfaGnObO5AyMJl2UDoW42HI4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Kv1pazQUF0cs5MJ6CjwxUvgyP1HcqhvHbceAMLDX2qasSAfAy0jg9FXoH4OGRJooFiIHLnz6d9i9UrB4lE3PIF2uRoxQS3As/gevMbkUcggp23JY2oZyg9eC2eqf+KkV8dsljnFS7Q8jhg66kBqphmhhsDYtGGnLTnJnjSAUFZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6BNyJod; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6BNyJod"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779266177; x=1810802177;
  h=date:from:to:cc:subject:message-id;
  bh=2inXXUkbzKB2HQKHqxMEfaGnObO5AyMJl2UDoW42HI4=;
  b=m6BNyJod1+9wDl4OOkWlC2LMxjU10g0U7IiIfSyGLz1rp/pJvPX7Lqey
   wqhrv5t7p3d3iQENs6hBXgFn7bGJZ1d8qaz6tHf6yMYySGBSeORu9S6FB
   jHQcBywHE3Y3mG0TLcu2Fwq4jj/wNh4Dd9u3I6zjtVk3UgY2ImVDOryZw
   OOen9y9uObXgLpe/RCVlwYqMACutCSfbK0RfqC8a1gdFJ5+zCEg2RDHTU
   jTZVI1J3KMrEvEmnVfspSJd0CaQYS9zcGwTS/kTahn/+gz3KPRKki5nzW
   GAJ/mheCNfVbVUBVVNef6QS0HDI21ftk8wbdpezWEW2Z3EkxMffVpjfrk
   Q==;
X-CSE-ConnectionGUID: yyOWHyQUQbO9AL4eYEqznQ==
X-CSE-MsgGUID: QoWTF6CSQ/2QeRthfHqgBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="83774865"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="83774865"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 01:36:16 -0700
X-CSE-ConnectionGUID: eBV2nI97R/2d2HLVw7dFNQ==
X-CSE-MsgGUID: z/AFv3DrSbCvwwCDMPYAAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="237478985"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 20 May 2026 01:36:14 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPcOd-000000002p5-1IKf;
	Wed, 20 May 2026 08:35:42 +0000
Date: Wed, 20 May 2026 16:32:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [dhowells-fs:netfs-crypt 34/34] fs/netfs/direct_write.c:53
 netfs_rmw_read_one() warn: signedness bug returning '(-12)'
Message-ID: <202605201613.76Hj6Ulj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-crypt
head:   13cee75c8b683f7c4382573f8c27adfbd49ffc47
commit: 13cee75c8b683f7c4382573f8c27adfbd49ffc47 [34/34] netfs: Support encryption on Unbuffered/DIO write
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: microblaze-randconfig-r072-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201613.76Hj6Ulj-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605201613.76Hj6Ulj-lkp@intel.com/

smatch warnings:
fs/netfs/direct_write.c:53 netfs_rmw_read_one() warn: signedness bug returning '(-12)'

vim +53 fs/netfs/direct_write.c

153a9961b55110 David Howells 2022-02-21  11  
13cee75c8b683f David Howells 2026-05-16  12  /*
13cee75c8b683f David Howells 2026-05-16  13   * Perform a read to a buffer from the server, slicing up the region to be read
13cee75c8b683f David Howells 2026-05-16  14   * according to the network rsize.
13cee75c8b683f David Howells 2026-05-16  15   */
13cee75c8b683f David Howells 2026-05-16  16  static bool netfs_rmw_read_one(struct netfs_io_request *rreq, struct bvecq *bq)
13cee75c8b683f David Howells 2026-05-16  17  {
13cee75c8b683f David Howells 2026-05-16  18  	struct netfs_io_stream *stream = &rreq->io_streams[0];
13cee75c8b683f David Howells 2026-05-16  19  	size_t len = 0;
13cee75c8b683f David Howells 2026-05-16  20  	int ret = 0;
13cee75c8b683f David Howells 2026-05-16  21  
13cee75c8b683f David Howells 2026-05-16  22  	for (int i = 0; i < bq->nr_slots; i++)
13cee75c8b683f David Howells 2026-05-16  23  		len += bq->bv[i].bv_len;
13cee75c8b683f David Howells 2026-05-16  24  
13cee75c8b683f David Howells 2026-05-16  25  	rreq->start		= bq->fpos;
13cee75c8b683f David Howells 2026-05-16  26  	rreq->len		= len;
13cee75c8b683f David Howells 2026-05-16  27  	stream->issue_from	= bq->fpos;
13cee75c8b683f David Howells 2026-05-16  28  	stream->buffered	= len;
13cee75c8b683f David Howells 2026-05-16  29  
13cee75c8b683f David Howells 2026-05-16  30  	do {
13cee75c8b683f David Howells 2026-05-16  31  		struct netfs_io_subrequest *subreq;
13cee75c8b683f David Howells 2026-05-16  32  
13cee75c8b683f David Howells 2026-05-16  33  		subreq = netfs_alloc_subrequest(rreq, NETFS_DOWNLOAD_FROM_SERVER);
13cee75c8b683f David Howells 2026-05-16  34  		if (!subreq) {
13cee75c8b683f David Howells 2026-05-16  35  			ret = -ENOMEM;
13cee75c8b683f David Howells 2026-05-16  36  			break;
13cee75c8b683f David Howells 2026-05-16  37  		}
13cee75c8b683f David Howells 2026-05-16  38  
13cee75c8b683f David Howells 2026-05-16  39  		subreq->start	= stream->issue_from;
13cee75c8b683f David Howells 2026-05-16  40  		subreq->len	= stream->buffered;
13cee75c8b683f David Howells 2026-05-16  41  
13cee75c8b683f David Howells 2026-05-16  42  		spin_lock(&rreq->lock);
13cee75c8b683f David Howells 2026-05-16  43  		list_add_tail(&subreq->rreq_link, &stream->subrequests);
13cee75c8b683f David Howells 2026-05-16  44  		trace_netfs_sreq(subreq, netfs_sreq_trace_added);
13cee75c8b683f David Howells 2026-05-16  45  		spin_unlock(&rreq->lock);
13cee75c8b683f David Howells 2026-05-16  46  
13cee75c8b683f David Howells 2026-05-16  47  		netfs_stat(&netfs_n_rh_download);
13cee75c8b683f David Howells 2026-05-16  48  		rreq->netfs_ops->issue_read(subreq);
13cee75c8b683f David Howells 2026-05-16  49  
13cee75c8b683f David Howells 2026-05-16  50  		cond_resched();
13cee75c8b683f David Howells 2026-05-16  51  	} while (stream->buffered > 0);
13cee75c8b683f David Howells 2026-05-16  52  
13cee75c8b683f David Howells 2026-05-16 @53  	return ret;
13cee75c8b683f David Howells 2026-05-16  54  }
13cee75c8b683f David Howells 2026-05-16  55  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
