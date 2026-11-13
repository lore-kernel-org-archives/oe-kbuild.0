Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555218;
	b=zJIleuFOqF4PoqRpHp+6SxX5lFJ1snqKf95DW4Q1wfqOz9DboDlHP5/l4sOYq7wGR+NK
	 ju37douIgwl+w1ElLklMhz49hBPGvle8i+U3r92ZdfWFZfC3xIdLoGY6TSDieoje3WXvk
	 CL6avN15eZtavdC4SST6U1Dz6hwoVic+Nmlfz2obEXgnY0TX522eJPlVBfCZvWYLYhtvX
	 e3x3nmFovBLyDx6Bq5eoPDNDQpckm7mY3GHBqHn3XHyYU5rUBBKk0MqSjApP80pUC7pBE
	 z4RsQi3BSJv321UQzzlZvTN4lnpPF9QOmZbv15TAahnkyIPhDKv+7Ek33NXeyG9Lwlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555218;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=DC3GPgch89+9b4uqUEPXixNWcFkV12G1mRb3xmWKD3Y=;
	b=KZ/RfEMEsZjDGn/efU6EyjZ8JX1Q79YB0nhIs5JjUEKpMI7wa0a1XUxzQeZ5+2eP4KDO
	 sp6JinAdraClW2xSTnQF5N6ik/BsQ8E89ELuxAwvhg/aRc1A8kMs8QNC6xmooJeaBqz/c
	 PVJpm/dQj+9dunCzQwaQZslKJbTIND/BxWyaV9wMTS5c+LEXo+Of1tFEzTX+vcPxtWzLj
	 GVG8ctzTLGklLg95xLFVK0GK+Tut+CUObbjbZOI4OJnq42wzJNnpxEuEoTujn6M0Pf/pC
	 Rxzpjid/8Vp5Prtmdh0j83uIF/vsx9SdX2lOlQmyM/zZusKcBvn0NT3vksb+vfHeogg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BGm5ZSWB;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B757A606A323
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Nov 2026 07:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B757A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BGm5ZSWB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794555217; x=1826091217;
  h=date:from:to:cc:subject:message-id;
  bh=PCD2MjGoJhc6xOVgKXYSFYnDP7wike3mSlqUkQitdNs=;
  b=BGm5ZSWBtbylF/+CKAkHkp81tnpTJMkodP3ZQwtInNxJvvYg7R2HKpBu
   Ln2j+t7pDSkCAZTKk023sf/OKfdnE9NEQ0mipkcXnW6ARGhKabOu6zhJj
   7BmHw2Vn6omA1XP2p08w/o89muRhhYVSHlfn7bXs9zp0F9cXdww1iVL4u
   mbLHRksUm5KlUnpL5mI9PPxCcK4c+ul/q2g2ULju2Afhm194xQwdxUTWS
   nYnslYK2qK3GaGRfndBBYtq9hsneyP3uk997XLX5/GZMSV+NK+MtueoS7
   7WYI1mOR3sVf4s2fvotRNTJnN21W2hjqjK9V1ueuBeny0v1GZ2plyd2X8
   Q==;
X-CSE-ConnectionGUID: EpVcCJteSdytB4Wd8Jte/g==
X-CSE-MsgGUID: WSdM7JoaTxOC5MDY2nJMFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3214787"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3214787"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2026 23:33:35 -0800
X-CSE-ConnectionGUID: TFsssT/pSzqov9aZpZMVPA==
X-CSE-MsgGUID: fjdgVOeNRJKMDiUcRcFPUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8942307"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 12 Nov 2026 23:33:35 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRlmv-000000001B1-07MK;
	Fri, 13 Nov 2026 07:33:33 +0000
Date: Fri, 13 Nov 2026 08:32:59 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:pu 22/50] fs/ext4/indirect-test.c:367
 ind_blk_ptrs() error: dereferencing freed memory 'bh' (line 366)
Message-ID: <202611130855.6s6Vd9xj-lkp@intel.com>
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
CC: linux-ext4@vger.kernel.org
TO: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git pu
head:   246d715a48c25a74ac372dda5e10d8f69f89b50a
commit: 48863669b6edb59dd8ee12f6c3a4e5af6370835f [22/50] ext4: add KUnit tests for fs/ext4/indirect.c
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc-randconfig-2200-20261112 (https://download.01.org/0day-ci/archive/20261113/202611130855.6s6Vd9xj-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8621950157210c1fa68f20f0614cb51310ec9dff)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611130855.6s6Vd9xj-lkp@intel.com/

smatch warnings:
fs/ext4/indirect-test.c:367 ind_blk_ptrs() error: dereferencing freed memory 'bh' (line 366)
fs/ext4/indirect-test.c:578 ind_test_init() error: dereferencing freed memory 'sbh' (line 576)

vim +/bh +367 fs/ext4/indirect-test.c

48863669b6edb5 Theodore Ts'o 2026-11-11  358  
48863669b6edb5 Theodore Ts'o 2026-11-11  359  static __le32 *ind_blk_ptrs(struct kunit *test, ext4_fsblk_t blk)
48863669b6edb5 Theodore Ts'o 2026-11-11  360  {
48863669b6edb5 Theodore Ts'o 2026-11-11  361  	struct ind_test_ctx *ctx = test->priv;
48863669b6edb5 Theodore Ts'o 2026-11-11  362  	struct buffer_head *bh;
48863669b6edb5 Theodore Ts'o 2026-11-11  363  
48863669b6edb5 Theodore Ts'o 2026-11-11  364  	bh = ind_get_or_create_bh(ctx, blk);
48863669b6edb5 Theodore Ts'o 2026-11-11  365  	KUNIT_ASSERT_NOT_NULL(test, bh);
48863669b6edb5 Theodore Ts'o 2026-11-11 @366  	brelse(bh);
48863669b6edb5 Theodore Ts'o 2026-11-11 @367  	return (__le32 *)bh->b_data;
48863669b6edb5 Theodore Ts'o 2026-11-11  368  }
48863669b6edb5 Theodore Ts'o 2026-11-11  369  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
