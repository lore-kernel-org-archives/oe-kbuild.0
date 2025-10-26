Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF46E189BB6
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Oct 2025 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761486984; cv=none; b=Yy/GJHXSvv/HVfzzzSDp8mzFjNZ+NHKUROizMJTtpNyqrw0GX+qYeRFKM7bnO8sAIQWgHZTOCK729O160V5AlyimAArvCXHvk1OgBlFoHIIJi5UO5Zh/ZRAvKi2bhWMWuYqUUeVBnu3XogeAk/p9PtxM0rhA6VrcemSGGZXOZ4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761486984; c=relaxed/simple;
	bh=tv+JB3zjzu57PyMm14y8e8NPHP9d90xVhrdRVvyg0R4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cINty6LEiYCoiL0JLBKHfKCteCQJwvHLvVZ7EwDKMzeXpgvD4RN2NlDpnvkm9N6/MqxrA+pyzH8934oywL6Lm8nrwQyywvDLsUS+6tj6QRrje72EKYQ8BnVkXC0RsWfTWB6739g89WoFG8zYwwTzKBVObQNjnZ+Q1DeKc0ugDpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oHr+jpyJ; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oHr+jpyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761486983; x=1793022983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tv+JB3zjzu57PyMm14y8e8NPHP9d90xVhrdRVvyg0R4=;
  b=oHr+jpyJJofuQ/IsVRtfgDinKaL+Fb8ep12wmXZ71GZjD/N6FfstozoS
   xeTH8qOvHIxLyLw5mRTuE6PDSrGunGTl59cPn6yyBewnvJPhC3CaYdGkt
   a3qmWl6dxCeXf3VBMo5eYiRrR7vh9DUnWalJA6F0z7nVGXdkVHmBxlX6F
   QO29Ax/J3qvrioLYOA2UUhRWkpxjn/0FL5G1Blxa9wqPHPGdARyLh30yS
   AXRuRkWZeZ8mF5QRsK/gQetx4nR+ck2B1rR99aKPLEfJOV+I9u1Oj4w2j
   3561xXeqpCj+Xkq46uR0J78KBdvw390rZqKoQsHfeFpkFJyTlb0zN2PRN
   A==;
X-CSE-ConnectionGUID: m+y6KoJCSk68PiplZc+xVA==
X-CSE-MsgGUID: vVE5JEjFRKKgc+2kUXs9OA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63290072"
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="63290072"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2025 06:56:22 -0700
X-CSE-ConnectionGUID: WhKw/auCQPmU1LgPABXHyg==
X-CSE-MsgGUID: oERvWiAUSvCGp2upg+sbaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,256,1754982000"; 
   d="scan'208";a="185585049"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Oct 2025 06:56:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vD1EB-000G8j-1W;
	Sun, 26 Oct 2025 13:56:12 +0000
Date: Sun, 26 Oct 2025 21:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] selftests: harness: Support KCOV.
Message-ID: <202510262116.jwyrgplV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251017084022.3721950-1-kuniyu@google.com>
References: <20251017084022.3721950-1-kuniyu@google.com>
TO: Kuniyuki Iwashima <kuniyu@google.com>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: Kuniyuki Iwashima <kuniyu@google.com>
CC: linux-kselftest@vger.kernel.org

Hi Kuniyuki,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shuah-kselftest/next]
[also build test WARNING on shuah-kselftest/fixes kees/for-next/seccomp linus/master v6.18-rc2 next-20251024]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kuniyuki-Iwashima/selftests-harness-Support-KCOV/20251017-164507
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git next
patch link:    https://lore.kernel.org/r/20251017084022.3721950-1-kuniyu%40google.com
patch subject: [PATCH] selftests: harness: Support KCOV.
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251026/202510262116.jwyrgplV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251026/202510262116.jwyrgplV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510262116.jwyrgplV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from listmount_test.c:14:
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   listmount_test.c:23:1: note: in expansion of macro 'TEST'
      23 | TEST(listmount_forward)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_listmount_forward_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   listmount_test.c:23:1: note: in expansion of macro 'TEST'
      23 | TEST(listmount_forward)
         | ^~~~
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   listmount_test.c:45:1: note: in expansion of macro 'TEST'
      45 | TEST(listmount_backward)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_listmount_backward_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   listmount_test.c:45:1: note: in expansion of macro 'TEST'
      45 | TEST(listmount_backward)
         | ^~~~
>> ../../kselftest_harness.h:1251:13: warning: 'disable_kcov' defined but not used [-Wunused-function]
    1251 | static void disable_kcov(struct __test_metadata *t, char *test_name)
         |             ^~~~~~~~~~~~
>> ../../kselftest_harness.h:1204:13: warning: 'enable_kcov' defined but not used [-Wunused-function]
    1204 | static void enable_kcov(struct __test_metadata *t)
         |             ^~~~~~~~~~~
--
   In file included from futex_wait_timeout.c:22:
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_timeout.c:82:1: note: in expansion of macro 'TEST'
      82 | TEST(wait_bitset)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_wait_bitset_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_timeout.c:82:1: note: in expansion of macro 'TEST'
      82 | TEST(wait_bitset)
         | ^~~~
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_timeout.c:108:1: note: in expansion of macro 'TEST'
     108 | TEST(requeue_pi)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_requeue_pi_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_timeout.c:108:1: note: in expansion of macro 'TEST'
     108 | TEST(requeue_pi)
         | ^~~~
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_timeout.c:128:1: note: in expansion of macro 'TEST'
     128 | TEST(lock_pi)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_lock_pi_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_timeout.c:128:1: note: in expansion of macro 'TEST'
     128 | TEST(lock_pi)
         | ^~~~
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_timeout.c:162:1: note: in expansion of macro 'TEST'
     162 | TEST(waitv)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_waitv_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_timeout.c:162:1: note: in expansion of macro 'TEST'
     162 | TEST(waitv)
         | ^~~~
>> ../../kselftest_harness.h:1251:13: warning: 'disable_kcov' defined but not used [-Wunused-function]
    1251 | static void disable_kcov(struct __test_metadata *t, char *test_name)
         |             ^~~~~~~~~~~~
>> ../../kselftest_harness.h:1204:13: warning: 'enable_kcov' defined but not used [-Wunused-function]
    1204 | static void enable_kcov(struct __test_metadata *t)
         |             ^~~~~~~~~~~
--
   In file included from futex_wait_wouldblock.c:27:
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_wouldblock.c:31:1: note: in expansion of macro 'TEST'
      31 | TEST(futex_wait_wouldblock)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_futex_wait_wouldblock_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_wouldblock.c:31:1: note: in expansion of macro 'TEST'
      31 | TEST(futex_wait_wouldblock)
         | ^~~~
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_wouldblock.c:48:1: note: in expansion of macro 'TEST'
      48 | TEST(futex_waitv_wouldblock)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_futex_waitv_wouldblock_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_wouldblock.c:48:1: note: in expansion of macro 'TEST'
      48 | TEST(futex_waitv_wouldblock)
         | ^~~~
>> ../../kselftest_harness.h:1251:13: warning: 'disable_kcov' defined but not used [-Wunused-function]
    1251 | static void disable_kcov(struct __test_metadata *t, char *test_name)
         |             ^~~~~~~~~~~~
>> ../../kselftest_harness.h:1204:13: warning: 'enable_kcov' defined but not used [-Wunused-function]
    1204 | static void enable_kcov(struct __test_metadata *t)
         |             ^~~~~~~~~~~
--
   In file included from futex_requeue_pi_signal_restart.c:30:
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_requeue_pi_signal_restart.c:98:1: note: in expansion of macro 'TEST'
      98 | TEST(futex_requeue_pi_signal_restart)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_futex_requeue_pi_signal_restart_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_requeue_pi_signal_restart.c:98:1: note: in expansion of macro 'TEST'
      98 | TEST(futex_requeue_pi_signal_restart)
         | ^~~~
>> ../../kselftest_harness.h:1251:13: warning: 'disable_kcov' defined but not used [-Wunused-function]
    1251 | static void disable_kcov(struct __test_metadata *t, char *test_name)
         |             ^~~~~~~~~~~~
>> ../../kselftest_harness.h:1204:13: warning: 'enable_kcov' defined but not used [-Wunused-function]
    1204 | static void enable_kcov(struct __test_metadata *t)
         |             ^~~~~~~~~~~
--
   In file included from futex_requeue_pi_mismatched_ops.c:28:
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_requeue_pi_mismatched_ops.c:44:1: note: in expansion of macro 'TEST'
      44 | TEST(requeue_pi_mismatched_ops)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_requeue_pi_mismatched_ops_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_requeue_pi_mismatched_ops.c:44:1: note: in expansion of macro 'TEST'
      44 | TEST(requeue_pi_mismatched_ops)
         | ^~~~
>> ../../kselftest_harness.h:1251:13: warning: 'disable_kcov' defined but not used [-Wunused-function]
    1251 | static void disable_kcov(struct __test_metadata *t, char *test_name)
         |             ^~~~~~~~~~~~
>> ../../kselftest_harness.h:1204:13: warning: 'enable_kcov' defined but not used [-Wunused-function]
    1204 | static void enable_kcov(struct __test_metadata *t)
         |             ^~~~~~~~~~~
--
   In file included from futex_wait_uninitialized_heap.c:33:
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_uninitialized_heap.c:56:1: note: in expansion of macro 'TEST'
      56 | TEST(futex_wait_uninitialized_heap)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_futex_wait_uninitialized_heap_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_uninitialized_heap.c:56:1: note: in expansion of macro 'TEST'
      56 | TEST(futex_wait_uninitialized_heap)
         | ^~~~
>> ../../kselftest_harness.h:1251:13: warning: 'disable_kcov' defined but not used [-Wunused-function]
    1251 | static void disable_kcov(struct __test_metadata *t, char *test_name)
         |             ^~~~~~~~~~~~
>> ../../kselftest_harness.h:1204:13: warning: 'enable_kcov' defined but not used [-Wunused-function]
    1204 | static void enable_kcov(struct __test_metadata *t)
         |             ^~~~~~~~~~~
--
   In file included from futex_wait_private_mapped_file.c:31:
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_private_mapped_file.c:59:1: note: in expansion of macro 'TEST'
      59 | TEST(wait_private_mapped_file)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_wait_private_mapped_file_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait_private_mapped_file.c:59:1: note: in expansion of macro 'TEST'
      59 | TEST(wait_private_mapped_file)
         | ^~~~
>> ../../kselftest_harness.h:1251:13: warning: 'disable_kcov' defined but not used [-Wunused-function]
    1251 | static void disable_kcov(struct __test_metadata *t, char *test_name)
         |             ^~~~~~~~~~~~
>> ../../kselftest_harness.h:1204:13: warning: 'enable_kcov' defined but not used [-Wunused-function]
    1204 | static void enable_kcov(struct __test_metadata *t)
         |             ^~~~~~~~~~~
--
   In file included from futex_wait.c:14:
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait.c:39:1: note: in expansion of macro 'TEST'
      39 | TEST(private_futex)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_private_futex_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait.c:39:1: note: in expansion of macro 'TEST'
      39 | TEST(private_futex)
         | ^~~~
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait.c:65:1: note: in expansion of macro 'TEST'
      65 | TEST(anon_page)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_anon_page_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait.c:65:1: note: in expansion of macro 'TEST'
      65 | TEST(anon_page)
         | ^~~~
   ../../kselftest_harness.h:188:25: error: initialization of 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *, char *)' from incompatible pointer type 'void (*)(struct __test_metadata *, struct __fixture_variant_metadata *)' [-Wincompatible-pointer-types]
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait.c:101:1: note: in expansion of macro 'TEST'
     101 | TEST(file_backed)
         | ^~~~
   ../../kselftest_harness.h:188:25: note: (near initialization for '_file_backed_object.fn')
     188 |                   .fn = &wrapper_##test_name, \
         |                         ^
   ../../kselftest_harness.h:157:25: note: in expansion of macro '__TEST_IMPL'
     157 | #define TEST(test_name) __TEST_IMPL(test_name, -1)
         |                         ^~~~~~~~~~~
   futex_wait.c:101:1: note: in expansion of macro 'TEST'
     101 | TEST(file_backed)
         | ^~~~
>> ../../kselftest_harness.h:1251:13: warning: 'disable_kcov' defined but not used [-Wunused-function]
    1251 | static void disable_kcov(struct __test_metadata *t, char *test_name)
         |             ^~~~~~~~~~~~
>> ../../kselftest_harness.h:1204:13: warning: 'enable_kcov' defined but not used [-Wunused-function]
    1204 | static void enable_kcov(struct __test_metadata *t)
         |             ^~~~~~~~~~~
..

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
