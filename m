Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE6DC1F176
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jan 2024 07:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706255621; cv=none; b=RakRhNiIgDjo/WHhoyW37BZcCdl6GnRJlRpam0o+xyBllysazhgXlXnD8jW3ZJNP5+/ziDli4ODuBX+xNhbFZadTi4mRmILUqCkqSOjt3mtiUvk+WhMWfEDRle31t+sxQti4rqplL0ltT9AgN9/0TR6wo0vBuBPsgQIK1fpKbjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706255621; c=relaxed/simple;
	bh=XDDFc7ewZtv/oMOHPvLKRImDA2kchFB/LdFNob9cCik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k1JKacW6dUV/4mtqBRd93KXHeg8NyevTQ+DL5i0TsJ0tnQrdby9kHkm87WzHe1/QZNsEjYV82Ur1cKArIoaLYWxtxTGiluGY5m3GKsk3WZsGTJJ9DwzHBaqIcsaOFl/AWfiY+fssZ24SrEJnYktygXVbhc3Vkol8BolKzQHpePU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSlg5dGI; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSlg5dGI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706255620; x=1737791620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XDDFc7ewZtv/oMOHPvLKRImDA2kchFB/LdFNob9cCik=;
  b=TSlg5dGIHxSpC3VVVi1xasy3ntHvUIoAnAurtBxdjo5XQe5A7MBPNdKw
   /1CSMHWZlNMIkKZIy8YaB3ERoTdGVAxC2GkCwOwNcf8bYDTQ3GIf+g294
   l/5AZBVy9gevsm+CJP7m5BzMYXIb09ITSp6w0ihWsTts2GBtGKLx3ytEC
   buUTduUnE4VSNGLxuqok5crQe0pC3S1j7AaiRNY12QR0zkgw0Vae21B0q
   SZ0M8FH5qHQEGjG/wsJ03Ha5hkgTk1BgHx7u2LHxEBtA+0fSMlfD9wn+J
   QBh60i2Ld69MO8hw5IZAjmIisttqnT9L6UvY/9K+WVIOL5kKFJlUNYN82
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="20956593"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="20956593"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 23:53:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="857330140"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="857330140"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 25 Jan 2024 23:53:36 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTH1r-0000pI-1V;
	Fri, 26 Jan 2024 07:53:35 +0000
Date: Fri, 26 Jan 2024 15:52:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [linux-next:master 1705/1892] kernel/bpf/token.c:50:6-27: WARNING:
 atomic_dec_and_test variation before object free at line 54.
Message-ID: <202401261514.lFsUk3Ky-lkp@intel.com>
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
TO: Andrii Nakryiko <andrii@kernel.org>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   01af33cc9894b4489fb68fa35c40e9fe85df63dc
commit: 5263a65a6ac2c65d7733f978b7f9fd4d937f4983 [1705/1892] bpf: Introduce BPF token object
:::::: branch date: 28 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-101-20240126 (https://download.01.org/0day-ci/archive/20240126/202401261514.lFsUk3Ky-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401261514.lFsUk3Ky-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/bpf/token.c:50:6-27: WARNING: atomic_dec_and_test variation before object free at line 54.

vim +50 kernel/bpf/token.c

5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  44  
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  45  void bpf_token_put(struct bpf_token *token)
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  46  {
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  47  	if (!token)
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  48  		return;
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  49  
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23 @50  	if (!atomic64_dec_and_test(&token->refcnt))
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  51  		return;
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  52  
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  53  	INIT_WORK(&token->work, bpf_token_put_deferred);
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23 @54  	schedule_work(&token->work);
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  55  }
5263a65a6ac2c6 Andrii Nakryiko 2024-01-23  56  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
