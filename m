Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549DE1D9A54
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772680542; cv=none; b=fkkiLIwpGgzgqJjhFshUoYueL6+HPgryc3sQ9AIz53epv3p9AsJ1tUOSia6v5pfc3msL5EJTFTKN1DZHEVfmetXhfl7gH5ZMAC2YBG1UkIJzLu1wZ36awDP9UDb+L2LmrBXOjw6THu1OsMPD9sMRZKxlSZWYTY43DmW8n0GqvMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772680542; c=relaxed/simple;
	bh=6njs+VPQG+lWf+CW2+Jj0tGTYBcImcqEUZ4BbXohhVc=;
	h=Date:From:To:Subject:Message-ID; b=giMsPokpgQwZKDEla4+pj1HsrDURlggxWesSQkCi2+Zjl57kwBfqF8aXHKs2e28xWVLwc+8P7VICsl0k3+/VXJPBlxhviZGE/LwGZEu+btuicSoJOg1LYGuCdWGzjqWpQVdaxfV2BtkkC9xFNHehv3h15z/xT2Ha5F9mGbtBYbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GFLyhPgS; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GFLyhPgS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772680541; x=1804216541;
  h=date:from:to:subject:message-id;
  bh=6njs+VPQG+lWf+CW2+Jj0tGTYBcImcqEUZ4BbXohhVc=;
  b=GFLyhPgS8qmFmGXheRW2S40kaH+Uh1f+SqQ+QBCMbKgyFwUQvzW4oBVA
   t7KHyf7+2U8xuDRgMakx3IbeuZVXjWWJtDUvFOQ2m9cx0VJPmc/8AoKj7
   daYDHiUgOWy+61GlVLYhCpZUpMELBtD1iHxx7IckjwPB/Xd9jkUUXuyae
   RGnZqtz1fxDP3WRiQVT53q9QVy6vX+0oE6Fx/D6CwGhxJh0Xq/8rBRZmZ
   I+3ZTUhu+mhEk/2N91stoIRR0mIlrU088ndBNrEM1o/nmJrIVWAimxwNf
   QuBSHAKrw/GljwouCrEkLB5apa225rhbqN+vIqan/qoBs259onnOd2F6+
   Q==;
X-CSE-ConnectionGUID: xV6BPHbSQCqhn1nKbBjEow==
X-CSE-MsgGUID: I9x+dL2gRKyKvZx1qCSm3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="61330922"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="61330922"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:15:39 -0800
X-CSE-ConnectionGUID: rOiG/KUrQkSbwEHsH5tuMw==
X-CSE-MsgGUID: kn9LtEd1TvKiSCKtP1CqAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="221446084"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Mar 2026 19:15:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxzBZ-000000001uZ-0Pg9
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:15:37 +0000
Date: Thu, 05 Mar 2026 04:15:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 440/467] checkpatch: ERROR:SPACING: space
 required before the open brace '{'
Message-ID: <202603050418.Z80PQY5u-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 77e34844fe549f172d33f188b8f05702f698075a [440/467] net: convert remaining fops to read/write iterators
:::::: branch date: 65 minutes ago
:::::: commit date: 65 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050418.Z80PQY5u-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:SPACING: space required before the open brace '{'
#27: FILE: net/core/skb_fault_injection.c:54:
+static ssize_t devname_write(struct kiocb *iocb, struct iov_iter *from){

ERROR:SPACING: space required before the open brace '{'
#46: FILE: net/core/skb_fault_injection.c:73:
+static ssize_t devname_read(struct kiocb *iocb, struct iov_iter *to){

ERROR:SPACING: space required before the open brace '{'
#75: FILE: net/mac80211/debugfs.c:496:
+static ssize_t hwflags_read(struct kiocb *iocb, struct iov_iter *to){

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
