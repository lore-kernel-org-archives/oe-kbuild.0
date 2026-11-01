Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793515205;
	b=iVGC4Ctlwppxu2+0HsHMrR9i03ylhhJe0NQoEeAmQiEHfQIc7kBZOHLhFRyfk1aZ2t7C
	 1pCVh25C4WZwI2FIOEAUg/pNgDbkHU+qFHTtfUyacZuL7OF99HWbU34rSEBOdLynuDOTq
	 cjZDHhfSrZyysKyZc3BZsUktrsgFPk6oN4uTcj04DzkVPT+m+LIWKpGVJl+ZuUw888uFk
	 t7teI5fgGDDitjSRd+V5CaTl4u4aC8IuztEWn/EDWlaTIOzlvROk2VShC8OCHcK0qaQ8P
	 FPxiBFGFhB7LM4KDQgUS8/XzMEED3qq0PeaLonqvAxfgh5kjyrWiBdzznCkk8QlP/6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793515205;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/lrSSke/4Bo3C95KHoPiTwYnnzWyjL+3T8DKwBTXABw=;
	b=15d9I4AoX7EAdwJXkdAbr6sQQtg9uzQdalKWdHN1I/RVEylmCXgaxS1xuvTaAazfxCkc
	 Us6vcoLFi0inwE7gLGaG5nxf6tjIvs7rpKyhBz0PCljfPowfi+hWyfUcZ9LKgqini0npa
	 ucpc7zTPVpW8f9DpCMqd4InJtseYI5G7najVbIA9Cs1L5RrhptdW4HxEhOzNPZd6HWQ+6
	 ASFBZDbCpVsu7aBEXtWVOpblnB0n88XsZgXA1Co6WynmQQ6wypW77BBHnh8XXgwTXWXye
	 a4IDGF3na6NLTP9vQ2bIftkBQL4XOwSwjdfxEkG4AMcucYqxvVmvvOk33Fluk+L+Vug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nWhPn436;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB9F606A324
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Nov 2026 06:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DB9F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nWhPn436
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793515203; x=1825051203;
  h=date:from:to:cc:subject:message-id;
  bh=xZPso3Lp6sOQq94iPggwJJrmPmwALhcNddg/TJ8DF8w=;
  b=nWhPn436SDzIFvaflTHSjVNiqrgJV+WOG7YugNiVZ9YE0+zXwiv7gNW4
   m4eREIWwbveGSyTa3Rf7dyV99mgHzhUPSKXg/RwIbJ+bLL+04aZ41aLMl
   a4HeqviQ67KK1oA/9H5FqYIqCylhANqRnNos+49nIoXLPeme3CWBjJXKH
   yTj3dAIi/7OJ4AidC4l47gTiMFpSnDd5H1/wRQeL0CGXI3jD+79mDhPBb
   aRX/ShuU/5J0H7A3kUs/KJBBGayfsNaACWkH5pBxWGFcLwHDt/XjIstO2
   580FEr8TCiTWZBR0QFQHZKXv7PgkO5ZmQjZPLpoOcJm/cbMGPraS//pGC
   Q==;
X-CSE-ConnectionGUID: mG7jGQz0TZq4vfN8+OvTIw==
X-CSE-MsgGUID: T9dFlKJiTD+Onxkwsp3ABg==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2118242"
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="2118242"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 23:40:02 -0700
X-CSE-ConnectionGUID: ATnaHOFIQzGbLFjqa+KCFg==
X-CSE-MsgGUID: Ag7kUWnjQ5yE0pHI+6BHAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,189,1787036400"; 
   d="scan'208";a="5818918"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 31 Oct 2026 23:40:01 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNPEU-000000006NX-2yO5;
	Sun, 01 Nov 2026 06:39:58 +0000
Date: Sun, 01 Nov 2026 07:39:27 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-unstable 38/63] mm/kasan/kasan_test_c.c:1119
 __kmem_cache_double_free_rcu() error: double free of 'p' (line 1118)
Message-ID: <202611010733.isrDohhx-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Kuniyuki Iwashima <kuniyu@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Alexander Potapenko <glider@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   b61fa14ce6bcbba2cb9a96feea31b760226d6b43
commit: 7e64861da3df9286c10691a8c240ff05db94b597 [38/63] mm/kasan/kunit: add double-free tests involving kfree_rcu_sheaf()
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: s390-randconfig-r2200-20261101 (https://download.01.org/0day-ci/archive/20261101/202611010733.isrDohhx-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611010733.isrDohhx-lkp@intel.com/

smatch warnings:
mm/kasan/kasan_test_c.c:1119 __kmem_cache_double_free_rcu() error: double free of 'p' (line 1118)
mm/kasan/kasan_test_c.c:1145 __kmem_cache_double_free_rcu() warn: passing freed memory 'p' (line 1113)

vim +/p +1119 mm/kasan/kasan_test_c.c

86b15969831bde mm/kasan/kasan_test.c   Andrey Konovalov  2023-12-19  1073  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1074  #ifndef MODULE
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1075  static void __kmem_cache_double_free_rcu(struct kunit *test, int mode)
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1076  {
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1077  	struct kasan_rcu_info *p, *victim = NULL, **objs;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1078  	struct kmem_cache *cache;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1079  	int i, n = 0;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1080  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1081  	KASAN_TEST_NEEDS_CONFIG_ON(test, CONFIG_KASAN_GENERIC);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1082  	KASAN_TEST_NEEDS_CONFIG_OFF(test, CONFIG_PREEMPT_RT);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1083  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1084  	cache = kmem_cache_create("test_cache", sizeof(*p), 0, SLAB_NO_MERGE,
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1085  				  NULL);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1086  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cache);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1087  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1088  	if (!cache->sheaf_capacity) {
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1089  		kmem_cache_destroy(cache);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1090  		kunit_skip(test, "Test requires sheaves");
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1091  	}
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1092  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1093  	objs = kunit_kcalloc(test, cache->sheaf_capacity * 2, sizeof(*objs),
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1094  			     GFP_KERNEL);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1095  	if (!objs) {
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1096  		kunit_err(test, "Allocation failed: %s\n", __func__);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1097  		goto out;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1098  	}
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1099  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1100  	migrate_disable();
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1101  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1102  	p = kmem_cache_alloc(cache, GFP_KERNEL);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1103  	if (!p) {
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1104  		migrate_enable();
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1105  		kunit_err(test, "Allocation failed: %s\n", __func__);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1106  		goto out;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1107  	}
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1108  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1109  	switch (mode) {
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1110  	case 1:
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1111  		kmem_cache_free(cache, p);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1112  		/* p is already in quarantine. */
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28 @1113  		KUNIT_EXPECT_KASAN_FAIL(test, kfree_rcu(p, rcu));
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1114  		migrate_enable();
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1115  		break;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1116  	case 2:
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1117  		/* The actual free order is inverse. */
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28 @1118  		kfree_rcu(p, rcu);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28 @1119  		KUNIT_EXPECT_KASAN_FAIL(test, kmem_cache_free(cache, p));
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1120  		migrate_enable();
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1121  		break;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1122  	case 3:
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1123  		kfree_rcu(p, rcu);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1124  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1125  		for (i = 0; i < cache->sheaf_capacity - 1; i++) {
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1126  			objs[i] = kmem_cache_alloc(cache, GFP_KERNEL);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1127  			kfree_rcu(objs[i], rcu);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1128  		}
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1129  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1130  		KUNIT_EXPECT_KASAN_FAIL(test, kfree_rcu(p, rcu));
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1131  		migrate_enable();
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1132  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1133  		/*
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1134  		 * Move the 1st full sheaf to quarantine, keeping the
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1135  		 * 2nd in pcs->rcu_free.
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1136  		 */
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1137  		rcu_barrier();
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1138  		break;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1139  	}
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1140  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1141  	/*
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1142  	 * Move p to quarantine if not poisoned yet (case 2,
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1143  	 * or fallback in case 3).
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1144  	 */
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28 @1145  	if (kasan_byte_accessible(p))
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1146  		kvfree_rcu_barrier_on_cache(cache);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1147  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1148  	/*
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1149  	 * Evict p from quarantine and reallocate it as a live victim object
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1150  	 * before the RCU sheaf is flushed.
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1151  	 */
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1152  	kasan_quarantine_remove_cache(cache);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1153  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1154  	for (i = 0; i < cache->sheaf_capacity * 2; i++) {
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1155  		objs[n] = kmem_cache_alloc(cache, GFP_KERNEL);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1156  		if (!objs[n])
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1157  			break;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1158  		if (objs[n] == p) {
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1159  			victim = objs[n];
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1160  			break;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1161  		}
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1162  		n++;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1163  	}
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1164  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1165  	for (i = 0; i < n; i++)
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1166  		kmem_cache_free(cache, objs[i]);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1167  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1168  	KUNIT_EXPECT_PTR_EQ(test, victim, p);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1169  	if (victim != p)
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1170  		goto out;
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1171  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1172  	WRITE_ONCE(victim->i, 42);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1173  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1174  	/*
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1175  	 * If kfree_rcu() failed to reject the double-free above,
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1176  	 * flushing the RCU sheaf will silently poison the live
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1177  	 * victim and cause a false-positive UAF on victim->i.
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1178  	 */
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1179  	kvfree_rcu_barrier_on_cache(cache);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1180  	KUNIT_EXPECT_EQ(test, READ_ONCE(victim->i), 42);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1181  
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1182  	if (!READ_ONCE(test_status.report_found))
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1183  		kmem_cache_free(cache, victim);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1184  out:
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1185  	kmem_cache_destroy(cache);
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1186  }
7e64861da3df92 mm/kasan/kasan_test_c.c Kuniyuki Iwashima 2026-10-28  1187  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
