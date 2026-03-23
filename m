Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 339213B9600
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Mar 2026 16:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774281912; cv=none; b=unDh2PMRFBPw9U2u9SaciXjENCjK3+KxB31QWoV1VX5Ji4xFuR0tIdFEHMxluu2aefJG2FtNHCyf7JevcCF+hUddK+ggnhU2w2b1QfUoaFdN45KWSNYjGvKr0XX4HkgWjH0ntxIyZHSHxE93mUadRxsUt6FjAf9QRTd2Vsk04eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774281912; c=relaxed/simple;
	bh=k3f7dknfcPbQPzUx5kjGzqHrelB3nYL2e8CegJsreEc=;
	h=Date:From:To:Subject:Message-ID; b=ikrgRPnv9RWml7YTLiJgo9hghQqbobk7Jaa0XIVqMrpnKyb2HbHfR5gMXTxtEoHHXjYaINEHcJtNRJrhAZopce6oM77bWDRxk3zOfS7rB9vZFvQPSJP/TTMcnGViqUakfSsaV13m5ep+FDJMvTw8IjiEnktFQLIXIYzNiTs6kqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nMRIEgBe; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nMRIEgBe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774281911; x=1805817911;
  h=date:from:to:subject:message-id;
  bh=k3f7dknfcPbQPzUx5kjGzqHrelB3nYL2e8CegJsreEc=;
  b=nMRIEgBeEWY68ELRKGmBZqF35lG4Q/Ttyqcf4aXd5QVX7tlL5XfDmfw5
   y/EMiJZ+h4H4tsbycQXWAH5H0cElWX38ost1ptrx6S+WK7v9pM2XphgdK
   d2S5lx77N6+rTCfav5OibQzUts4cL2gvZCp1Nl7TiuDCPQzwjrxDC0HXI
   sNethE9duK/Miy9yK5OF/c5Ue0el+n/45KrVhGpC0Bt+4n7R9n4COfTXv
   MeHkt3fp66jxEHnWUdZAy8FJhQAoFe3oifQCJyshhgWbmItOmbVRA342z
   ciz1z/8loNbRk1Qg8IKmekMVVswU+CjJ+QecYBcNhNGgBSwoPN0jHZWOA
   Q==;
X-CSE-ConnectionGUID: UDFC35dnT8Gb3RAGmaoXpQ==
X-CSE-MsgGUID: yqzETi4hTS+oL+LAtOmliQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86651787"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="86651787"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 09:05:09 -0700
X-CSE-ConnectionGUID: //zON8RfSx+Pmojbk8z9Fg==
X-CSE-MsgGUID: p0dD+IXATkGDBA6oJqxBTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="228548304"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Mar 2026 09:05:09 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4hm6-000000006gb-1rlD
	for oe-kbuild@lists.linux.dev;
	Mon, 23 Mar 2026 16:05:06 +0000
Date: Mon, 23 Mar 2026 17:04:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [dhowells-fs:ceph-iter 74/77] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202603231651.gZyWI71x-lkp@intel.com>
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
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git ceph-iter
head:   05d546a07e9a570d280344cff29c354b67fda562
commit: 045dd7c08942b9ba4e72814e537009de8d5d49ff [74/77] libceph: Remove CEPH_OS_DATA_TYPE_PAGES and its attendant helpers
:::::: branch date: 17 hours ago
:::::: commit date: 18 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260323/202603231651.gZyWI71x-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#58: FILE: fs/ceph/addr.c:466:
+	struct bvecq *bvecq;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
