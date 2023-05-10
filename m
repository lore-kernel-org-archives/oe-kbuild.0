Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674F14A81
	for <oe-kbuild@lists.linux.dev>; Wed, 10 May 2023 17:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683739302; x=1715275302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AViKzLIk0R7UxZLLYh2IZXS3Wf+ldAkiEvd8RmM93OY=;
  b=mKX7Rt4a7tfBF/pDkZAEvxlAjn2LAso1hJSGQWmfNk17e8VdWNQe3ckZ
   ewJcBQQ9wZwo6bLfF6KfWrewpxZJn9EgCsIKCxYi8xyohG9hUrdmaxuwm
   dFDB4UshCybgFBYN8vRqke9TQnF5L4bwGYk+Tgchh85PU70M9ZL6TIwsO
   iG7Jd+HuUai+ebhp2yTIplMimCHW2qtFB8W5eMiAHypwUTvJaQtin7i7N
   0HDritgpw1P2Jl9k18aVp/OtwaflkVKDGxmuzvFWVohodpWIwH5hHcauu
   vQMju/Eu4MRYKlMb15ur7ohbMt3t7o+hyUgwp9+yOj8btdCvLtrBxrNx1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="330633080"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="330633080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 10:21:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="730018077"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; 
   d="scan'208";a="730018077"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 10 May 2023 10:21:40 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwnVU-0003Sk-0C;
	Wed, 10 May 2023 17:21:40 +0000
Date: Thu, 11 May 2023 01:21:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: lib/crypto/blake2s-selftest.c:564 blake2s_digest_test() warn:
 comparing different units: 'i < (8192 / 32 + (0))' 'byte < array_size'
Message-ID: <202305110117.wVzZP0cd-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   16a8829130ca22666ac6236178a6233208d425c3
commit: e20d5a22bd241c5084184bcf69dfb6eddc35417f crypto: lib/blake2s - Split up test function to halve stack usage
date:   4 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 4 months ago
config: openrisc-randconfig-m031-20230509 (https://download.01.org/0day-ci/archive/20230511/202305110117.wVzZP0cd-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305110117.wVzZP0cd-lkp@intel.com/

smatch warnings:
lib/crypto/blake2s-selftest.c:564 blake2s_digest_test() warn: comparing different units: 'i < (8192 / 32 + (0))' 'byte < array_size'
lib/crypto/blake2s-selftest.c:564 blake2s_digest_test() warn: comparing different units: 'i < (8192 / 32 + (0))' 'byte < array_size'

vim +564 lib/crypto/blake2s-selftest.c

66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  547  
e20d5a22bd241c Herbert Xu         2022-12-21  548  static bool __init noinline_for_stack blake2s_digest_test(void)
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  549  {
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  550  	u8 key[BLAKE2S_KEY_SIZE];
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  551  	u8 buf[ARRAY_SIZE(blake2s_testvecs)];
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  552  	u8 hash[BLAKE2S_HASH_SIZE];
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  553  	struct blake2s_state state;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  554  	bool success = true;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  555  	int i, l;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  556  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  557  	key[0] = key[1] = 1;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  558  	for (i = 2; i < sizeof(key); ++i)
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  559  		key[i] = key[i - 2] + key[i - 1];
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  560  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  561  	for (i = 0; i < sizeof(buf); ++i)
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  562  		buf[i] = (u8)i;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  563  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08 @564  	for (i = l = 0; i < ARRAY_SIZE(blake2s_testvecs); l = (l + 37) % ++i) {
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  565  		int outlen = 1 + i % BLAKE2S_HASH_SIZE;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  566  		int keylen = (13 * i) % (BLAKE2S_KEY_SIZE + 1);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  567  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  568  		blake2s(hash, buf, key + BLAKE2S_KEY_SIZE - keylen, outlen, i,
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  569  			keylen);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  570  		if (memcmp(hash, blake2s_testvecs[i], outlen)) {
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  571  			pr_err("blake2s self-test %d: FAIL\n", i + 1);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  572  			success = false;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  573  		}
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  574  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  575  		if (!keylen)
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  576  			blake2s_init(&state, outlen);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  577  		else
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  578  			blake2s_init_key(&state, outlen,
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  579  					 key + BLAKE2S_KEY_SIZE - keylen,
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  580  					 keylen);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  581  
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  582  		blake2s_update(&state, buf, l);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  583  		blake2s_update(&state, buf + l, i - l);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  584  		blake2s_final(&state, hash);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  585  		if (memcmp(hash, blake2s_testvecs[i], outlen)) {
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  586  			pr_err("blake2s init/update/final self-test %d: FAIL\n",
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  587  			       i + 1);
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  588  			success = false;
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  589  		}
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  590  	}
66d7fb94e4ffe5 Jason A. Donenfeld 2019-11-08  591  
e20d5a22bd241c Herbert Xu         2022-12-21  592  	return success;
e20d5a22bd241c Herbert Xu         2022-12-21  593  }
e20d5a22bd241c Herbert Xu         2022-12-21  594  

:::::: The code at line 564 was first introduced by commit
:::::: 66d7fb94e4ffe5acc589e0b2b4710aecc1f07a28 crypto: blake2s - generic C library implementation and selftest

:::::: TO: Jason A. Donenfeld <Jason@zx2c4.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
