Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3445372B23
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Feb 2026 17:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771350179; cv=none; b=Pd+bZKQ6aB5tkkR8M5+W+KUuqSt+CtD4gJCFo+kSLsOMwuOyoSdwj5no/GEkeTS5eK+liuRKE6Frz/K2BnzJ/4kfJueFnuOLCLCC8dWvpacw+3nuwvt2XfSndlgceD9tjXo8riwbCuAxLew+xanDkj9sXaDNyahJ+7g4x21tT3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771350179; c=relaxed/simple;
	bh=wv9NuHiSuJIy8b+c5tR0j4L9cgqNN5I7RwcFo4qf9Wk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hS1OYn9SFNWpClTT82cvbF4+tgFstzZ2T8BtWpmAGxwyVEF5+e0Hnlu+XkLwrvbsHw5hHCYa0CFsnrb3MjkbQ5jeKjxqe5Q9Kq9trMLDBmzudEujeXTAgnpWjZcSbTQTgxaBO2RiRK/6lAz0Zv0bnQtsVVaK3Uy7nDZ4rpDQEHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fZHp5e7K; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fZHp5e7K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771350178; x=1802886178;
  h=date:from:to:cc:subject:message-id;
  bh=wv9NuHiSuJIy8b+c5tR0j4L9cgqNN5I7RwcFo4qf9Wk=;
  b=fZHp5e7KpW0rECqglK09ViIa4Jghu4IwD6Zg3fPJSzSOtM9onsybuGxm
   /e7M+Q6VwtKa6qz4P0BspFKVui87lHeb2ghlx+bNlV2HCR9f9llMQVMvG
   yIWKVgKWuFR5mfJ/uM1lJXz65KwUmfOT70muW6L1PsG3dxi1nCwtvFEfm
   qyjsBBE8sYtRLqS69TEnoie/iXop88wuamnxb/KRohaWhjUcwp/nmlJcL
   uj/6Cnv2uLcyK5fAkZY+vcCnzkph9zMo574O1mQJg/84PONlAo468a8ec
   o20IHGxfbQDUFBLYnObfQ6npnGIQxh91Xc2KmBimDggC9uh1BhuwrAZ/f
   g==;
X-CSE-ConnectionGUID: ASllzfAoT++/0rC1/0+1IQ==
X-CSE-MsgGUID: yOLZhpKxSfandX8yEAvZ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72600326"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72600326"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 09:42:58 -0800
X-CSE-ConnectionGUID: O3yrQcz+T3O7pzKPU3djRw==
X-CSE-MsgGUID: Fib4JKP0QWCB0m7csOTCRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="213793860"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Feb 2026 09:42:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsP65-000000011Ey-47ep;
	Tue, 17 Feb 2026 17:42:53 +0000
Date: Wed, 18 Feb 2026 01:42:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: lib/crypto/tests/mldsa_kunit.c:180:24-25: WARNING
 opportunity for swap()
Message-ID: <202602180158.7mCaeTDv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Eric Biggers <ebiggers@kernel.org>
CC: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9702969978695d9a699a1f34771580cdbb153b33
commit: ed894faccb8de55cd755e093c4b0971f190d384d lib/crypto: tests: Add KUnit tests for ML-DSA verification
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: mips-randconfig-r064-20260215 (https://download.01.org/0day-ci/archive/20260218/202602180158.7mCaeTDv-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602180158.7mCaeTDv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> lib/crypto/tests/mldsa_kunit.c:180:24-25: WARNING opportunity for swap()

vim +180 lib/crypto/tests/mldsa_kunit.c

ed894faccb8de5 Eric Biggers 2025-12-14  142  
ed894faccb8de5 Eric Biggers 2025-12-14  143  /* Test that mldsa_verify() rejects malformed hint vectors with -EBADMSG. */
ed894faccb8de5 Eric Biggers 2025-12-14  144  static void test_mldsa_bad_hints(struct kunit *test,
ed894faccb8de5 Eric Biggers 2025-12-14  145  				 const struct mldsa_testvector *tv)
ed894faccb8de5 Eric Biggers 2025-12-14  146  {
ed894faccb8de5 Eric Biggers 2025-12-14  147  	const int omega = params[tv->alg].omega;
ed894faccb8de5 Eric Biggers 2025-12-14  148  	const int k = params[tv->alg].k;
ed894faccb8de5 Eric Biggers 2025-12-14  149  	u8 *sig = kunit_kmemdup_or_fail(test, tv->sig, tv->sig_len);
ed894faccb8de5 Eric Biggers 2025-12-14  150  	/* Pointer to the encoded hint vector in the signature */
ed894faccb8de5 Eric Biggers 2025-12-14  151  	u8 *hintvec = &sig[tv->sig_len - omega - k];
ed894faccb8de5 Eric Biggers 2025-12-14  152  	u8 h;
ed894faccb8de5 Eric Biggers 2025-12-14  153  
ed894faccb8de5 Eric Biggers 2025-12-14  154  	/* Initially the signature is valid. */
ed894faccb8de5 Eric Biggers 2025-12-14  155  	do_mldsa_and_assert_success(test, tv);
ed894faccb8de5 Eric Biggers 2025-12-14  156  
ed894faccb8de5 Eric Biggers 2025-12-14  157  	/* Cumulative hint count exceeds omega */
ed894faccb8de5 Eric Biggers 2025-12-14  158  	memcpy(sig, tv->sig, tv->sig_len);
ed894faccb8de5 Eric Biggers 2025-12-14  159  	hintvec[omega + k - 1] = omega + 1;
ed894faccb8de5 Eric Biggers 2025-12-14  160  	KUNIT_ASSERT_EQ(test, -EBADMSG,
ed894faccb8de5 Eric Biggers 2025-12-14  161  			mldsa_verify(tv->alg, sig, tv->sig_len, tv->msg,
ed894faccb8de5 Eric Biggers 2025-12-14  162  				     tv->msg_len, tv->pk, tv->pk_len));
ed894faccb8de5 Eric Biggers 2025-12-14  163  
ed894faccb8de5 Eric Biggers 2025-12-14  164  	/* Cumulative hint count decreases */
ed894faccb8de5 Eric Biggers 2025-12-14  165  	memcpy(sig, tv->sig, tv->sig_len);
ed894faccb8de5 Eric Biggers 2025-12-14  166  	KUNIT_ASSERT_GE(test, hintvec[omega + k - 2], 1);
ed894faccb8de5 Eric Biggers 2025-12-14  167  	hintvec[omega + k - 1] = hintvec[omega + k - 2] - 1;
ed894faccb8de5 Eric Biggers 2025-12-14  168  	KUNIT_ASSERT_EQ(test, -EBADMSG,
ed894faccb8de5 Eric Biggers 2025-12-14  169  			mldsa_verify(tv->alg, sig, tv->sig_len, tv->msg,
ed894faccb8de5 Eric Biggers 2025-12-14  170  				     tv->msg_len, tv->pk, tv->pk_len));
ed894faccb8de5 Eric Biggers 2025-12-14  171  
ed894faccb8de5 Eric Biggers 2025-12-14  172  	/*
ed894faccb8de5 Eric Biggers 2025-12-14  173  	 * Hint indices out of order.  To test this, swap hintvec[0] and
ed894faccb8de5 Eric Biggers 2025-12-14  174  	 * hintvec[1].  This assumes that the original valid signature had at
ed894faccb8de5 Eric Biggers 2025-12-14  175  	 * least two nonzero hints in the first element (asserted below).
ed894faccb8de5 Eric Biggers 2025-12-14  176  	 */
ed894faccb8de5 Eric Biggers 2025-12-14  177  	memcpy(sig, tv->sig, tv->sig_len);
ed894faccb8de5 Eric Biggers 2025-12-14  178  	KUNIT_ASSERT_GE(test, hintvec[omega], 2);
ed894faccb8de5 Eric Biggers 2025-12-14  179  	h = hintvec[0];
ed894faccb8de5 Eric Biggers 2025-12-14 @180  	hintvec[0] = hintvec[1];
ed894faccb8de5 Eric Biggers 2025-12-14  181  	hintvec[1] = h;
ed894faccb8de5 Eric Biggers 2025-12-14  182  	KUNIT_ASSERT_EQ(test, -EBADMSG,
ed894faccb8de5 Eric Biggers 2025-12-14  183  			mldsa_verify(tv->alg, sig, tv->sig_len, tv->msg,
ed894faccb8de5 Eric Biggers 2025-12-14  184  				     tv->msg_len, tv->pk, tv->pk_len));
ed894faccb8de5 Eric Biggers 2025-12-14  185  
ed894faccb8de5 Eric Biggers 2025-12-14  186  	/*
ed894faccb8de5 Eric Biggers 2025-12-14  187  	 * Extra hint indices given.  For this test to work, the original valid
ed894faccb8de5 Eric Biggers 2025-12-14  188  	 * signature must have fewer than omega nonzero hints (asserted below).
ed894faccb8de5 Eric Biggers 2025-12-14  189  	 */
ed894faccb8de5 Eric Biggers 2025-12-14  190  	memcpy(sig, tv->sig, tv->sig_len);
ed894faccb8de5 Eric Biggers 2025-12-14  191  	KUNIT_ASSERT_LT(test, hintvec[omega + k - 1], omega);
ed894faccb8de5 Eric Biggers 2025-12-14  192  	hintvec[omega - 1] = 0xff;
ed894faccb8de5 Eric Biggers 2025-12-14  193  	KUNIT_ASSERT_EQ(test, -EBADMSG,
ed894faccb8de5 Eric Biggers 2025-12-14  194  			mldsa_verify(tv->alg, sig, tv->sig_len, tv->msg,
ed894faccb8de5 Eric Biggers 2025-12-14  195  				     tv->msg_len, tv->pk, tv->pk_len));
ed894faccb8de5 Eric Biggers 2025-12-14  196  }
ed894faccb8de5 Eric Biggers 2025-12-14  197  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
