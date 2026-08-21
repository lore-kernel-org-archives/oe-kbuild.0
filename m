Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C50C358389
	for <oe-kbuild@lists.linux.dev>; Fri, 21 Aug 2026 18:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787336043; cv=none; b=SywcvwyucmZVw/st1MFBxzKbXX7zFonhzV2+pgG/Vm9OB9RZWPynw6vs2RuqrN8tJq87MnqxIuYnkUQXBt4mCT+CBNqiifB9jYC9FNF7cmASBsGlxYiUZQ1KLprpW85TPc31OjPhVKDtM+6vI4Hq5ixpBMMopzPIRNBc1kziw0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787336043; c=relaxed/simple;
	bh=QJvI7a/9wljk80dlAdO44KVZiS1Gz0o4JIa8ivpQENw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TcM/E0jCdzTcbsDKsaZKwXnVkzAMWwbYkN8w26zjR21Xz1RXAR9mAdfnsFB8IfbImkamc2WJgs6OharQVnTey6ag1HTjrDqKoZnFW5bujR/lENk3G1k1URhrsAKQwlC3NeaPSVPQ/hrwVmyaF2w+h4RD17QEWKc4CIzIYOuozJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pw5zWfxI; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pw5zWfxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787336041; x=1818872041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QJvI7a/9wljk80dlAdO44KVZiS1Gz0o4JIa8ivpQENw=;
  b=Pw5zWfxIueviHXXbRYPAJIDC/vFa3O+Ua/47k5qrSg72u/nOgzWG2uo6
   ONXtsCBUa0/nKiivhM3HyWHdAjIVpiE9wQhMs36BrkodwSvSQo8w7+pQV
   lCMEUEcODzAQRmq+zCYG2vQ5HoX/fhlJpB1wvjiIKu2HSPjP/r0fJLvat
   4jFbSg/QuqYKrumTkZdU4mp8YVQRslTOnSywtdirD4buHRMgfFrFOS+Nu
   MRrWB7l8GWoHo2zF/82fZSjSMmm4pepsfpe3hZZyD0+qbPzLrii6rW3Vr
   CLqGl8p3N3+NReW/K6dAwkFVIuBlay7ZPRBwnv1SBeZ4yvrhS30BtzM6I
   g==;
X-CSE-ConnectionGUID: r1LFW4GbRnm65AGUoEqHzQ==
X-CSE-MsgGUID: hTINQEQtT6651zTuhukkgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="99413298"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="99413298"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 11:14:00 -0700
X-CSE-ConnectionGUID: ky4hVmSjSJmV4eIHInSM6A==
X-CSE-MsgGUID: o6zFga+uSAWLEUHBsyhPyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="266471062"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Aug 2026 11:14:00 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxTkb-00000000qJF-1uWP;
	Fri, 21 Aug 2026 18:13:57 +0000
Date: Sat, 22 Aug 2026 02:13:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] Bluetooth: hci-core: fix "declaration does not declare
 anything" error
Message-ID: <202608220235.5cPUFtSW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260814051032.261320-1-dmarlin@redhat.com>
References: <20260814051032.261320-1-dmarlin@redhat.com>
TO: David Marlin <dmarlin@redhat.com>
TO: linux-bluetooth@vger.kernel.org
TO: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: "Gustavo A . R . Silva" <gustavoars@kernel.org>
CC: David Marlin <dmarlin@redhat.com>
CC: Bastien Nocera <hadess@hadess.net>

Hi David,

kernel test robot noticed the following build errors:

[auto build test ERROR on bluetooth-next/master]
[also build test ERROR on bluetooth/master linus/master v7.2 next-20260820]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Marlin/Bluetooth-hci-core-fix-declaration-does-not-declare-anything-error/20260814-001012
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git master
patch link:    https://lore.kernel.org/r/20260814051032.261320-1-dmarlin%40redhat.com
patch subject: [PATCH] Bluetooth: hci-core: fix "declaration does not declare anything" error
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260822/202608220235.5cPUFtSW-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220235.5cPUFtSW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608220235.5cPUFtSW-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/bluetooth/hci_codec.c: In function 'hci_read_supported_codecs':
>> net/bluetooth/hci_codec.c:151:9: error: aggregate value used where an integer was expected
     151 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |         ^~
   In file included from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:26,
                    from net/bluetooth/hci_codec.c:5:
>> include/linux/overflow.h:420:25: error: invalid operands to binary * (have 'struct hci_std_codecs_hdr' and 'unsigned int')
     420 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                 ~~~~~~~ ^
   net/bluetooth/hci_codec.c:151:24: note: in expansion of macro 'flex_array_size'
     151 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |                        ^~~~~~~~~~~~~~~
>> net/bluetooth/hci_codec.c:151:69: error: incompatible type for argument 1 of 'size_mul'
     151 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |                                                           ~~~~~~~~~~^~~~~
         |                                                                     |
         |                                                                     struct hci_std_codecs_hdr
   include/linux/overflow.h:421:26: note: in definition of macro 'flex_array_size'
     421 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^~~~~
   include/linux/overflow.h:330:60: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct hci_std_codecs_hdr'
     330 | static __always_inline size_t __must_check size_mul(size_t factor1, size_t factor2)
         |                                                     ~~~~~~~^~~~~~~
>> net/bluetooth/hci_codec.c:157:23: error: invalid operands to binary < (have 'int' and 'struct hci_std_codecs_hdr')
     157 |         for (i = 0; i < std_codecs->num; i++) {
         |                       ^ ~~~~~~~~~~~~~~~
         |                                   |
         |                                   struct hci_std_codecs_hdr
   net/bluetooth/hci_codec.c:164:9: error: aggregate value used where an integer was expected
     164 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |         ^~~~~~~~
   In file included from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:26,
                    from net/bluetooth/hci_codec.c:5:
>> include/linux/overflow.h:420:25: error: invalid operands to binary * (have 'struct hci_std_codecs_hdr' and 'unsigned int')
     420 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                 ~~~~~~~ ^
   net/bluetooth/hci_codec.c:164:23: note: in expansion of macro 'flex_array_size'
     164 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |                       ^~~~~~~~~~~~~~~
   net/bluetooth/hci_codec.c:164:68: error: incompatible type for argument 1 of 'size_mul'
     164 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |                                                          ~~~~~~~~~~^~~~~
         |                                                                    |
         |                                                                    struct hci_std_codecs_hdr
   include/linux/overflow.h:421:26: note: in definition of macro 'flex_array_size'
     421 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^~~~~
   include/linux/overflow.h:330:60: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct hci_std_codecs_hdr'
     330 | static __always_inline size_t __must_check size_mul(size_t factor1, size_t factor2)
         |                                                     ~~~~~~~^~~~~~~
   net/bluetooth/hci_codec.c: In function 'hci_read_supported_codecs_v2':
   net/bluetooth/hci_codec.c:220:9: error: aggregate value used where an integer was expected
     220 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |         ^~
   In file included from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:26,
                    from net/bluetooth/hci_codec.c:5:
>> include/linux/overflow.h:420:25: error: invalid operands to binary * (have 'struct hci_std_codecs_v2_hdr' and 'unsigned int')
     420 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                 ~~~~~~~ ^
   net/bluetooth/hci_codec.c:220:24: note: in expansion of macro 'flex_array_size'
     220 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |                        ^~~~~~~~~~~~~~~
   net/bluetooth/hci_codec.c:220:69: error: incompatible type for argument 1 of 'size_mul'
     220 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |                                                           ~~~~~~~~~~^~~~~
         |                                                                     |
         |                                                                     struct hci_std_codecs_v2_hdr
   include/linux/overflow.h:421:26: note: in definition of macro 'flex_array_size'
     421 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^~~~~
   include/linux/overflow.h:330:60: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct hci_std_codecs_v2_hdr'
     330 | static __always_inline size_t __must_check size_mul(size_t factor1, size_t factor2)
         |                                                     ~~~~~~~^~~~~~~
>> net/bluetooth/hci_codec.c:226:23: error: invalid operands to binary < (have 'int' and 'struct hci_std_codecs_v2_hdr')
     226 |         for (i = 0; i < std_codecs->num; i++) {
         |                       ^ ~~~~~~~~~~~~~~~
         |                                   |
         |                                   struct hci_std_codecs_v2_hdr
   net/bluetooth/hci_codec.c:232:9: error: aggregate value used where an integer was expected
     232 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |         ^~~~~~~~
   In file included from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from ./arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:26,
                    from net/bluetooth/hci_codec.c:5:
>> include/linux/overflow.h:420:25: error: invalid operands to binary * (have 'struct hci_std_codecs_v2_hdr' and 'unsigned int')
     420 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                 ~~~~~~~ ^
   net/bluetooth/hci_codec.c:232:23: note: in expansion of macro 'flex_array_size'
     232 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |                       ^~~~~~~~~~~~~~~
   net/bluetooth/hci_codec.c:232:68: error: incompatible type for argument 1 of 'size_mul'
     232 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |                                                          ~~~~~~~~~~^~~~~
         |                                                                    |
         |                                                                    struct hci_std_codecs_v2_hdr
   include/linux/overflow.h:421:26: note: in definition of macro 'flex_array_size'
     421 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^~~~~
   include/linux/overflow.h:330:60: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct hci_std_codecs_v2_hdr'
     330 | static __always_inline size_t __must_check size_mul(size_t factor1, size_t factor2)
         |                                                     ~~~~~~~^~~~~~~
--
   hci_codec.c: In function 'hci_read_supported_codecs':
   hci_codec.c:151:9: error: aggregate value used where an integer was expected
     151 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |         ^~
   In file included from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:26,
                    from hci_codec.c:5:
>> include/linux/overflow.h:420:25: error: invalid operands to binary * (have 'struct hci_std_codecs_hdr' and 'unsigned int')
     420 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                 ~~~~~~~ ^
   hci_codec.c:151:24: note: in expansion of macro 'flex_array_size'
     151 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |                        ^~~~~~~~~~~~~~~
   hci_codec.c:151:69: error: incompatible type for argument 1 of 'size_mul'
     151 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |                                                           ~~~~~~~~~~^~~~~
         |                                                                     |
         |                                                                     struct hci_std_codecs_hdr
   include/linux/overflow.h:421:26: note: in definition of macro 'flex_array_size'
     421 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^~~~~
   include/linux/overflow.h:330:60: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct hci_std_codecs_hdr'
     330 | static __always_inline size_t __must_check size_mul(size_t factor1, size_t factor2)
         |                                                     ~~~~~~~^~~~~~~
   hci_codec.c:157:23: error: invalid operands to binary < (have 'int' and 'struct hci_std_codecs_hdr')
     157 |         for (i = 0; i < std_codecs->num; i++) {
         |                       ^ ~~~~~~~~~~~~~~~
         |                                   |
         |                                   struct hci_std_codecs_hdr
   hci_codec.c:164:9: error: aggregate value used where an integer was expected
     164 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |         ^~~~~~~~
   In file included from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:26,
                    from hci_codec.c:5:
>> include/linux/overflow.h:420:25: error: invalid operands to binary * (have 'struct hci_std_codecs_hdr' and 'unsigned int')
     420 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                 ~~~~~~~ ^
   hci_codec.c:164:23: note: in expansion of macro 'flex_array_size'
     164 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |                       ^~~~~~~~~~~~~~~
   hci_codec.c:164:68: error: incompatible type for argument 1 of 'size_mul'
     164 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |                                                          ~~~~~~~~~~^~~~~
         |                                                                    |
         |                                                                    struct hci_std_codecs_hdr
   include/linux/overflow.h:421:26: note: in definition of macro 'flex_array_size'
     421 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^~~~~
   include/linux/overflow.h:330:60: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct hci_std_codecs_hdr'
     330 | static __always_inline size_t __must_check size_mul(size_t factor1, size_t factor2)
         |                                                     ~~~~~~~^~~~~~~
   hci_codec.c: In function 'hci_read_supported_codecs_v2':
   hci_codec.c:220:9: error: aggregate value used where an integer was expected
     220 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |         ^~
   In file included from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:26,
                    from hci_codec.c:5:
>> include/linux/overflow.h:420:25: error: invalid operands to binary * (have 'struct hci_std_codecs_v2_hdr' and 'unsigned int')
     420 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                 ~~~~~~~ ^
   hci_codec.c:220:24: note: in expansion of macro 'flex_array_size'
     220 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |                        ^~~~~~~~~~~~~~~
   hci_codec.c:220:69: error: incompatible type for argument 1 of 'size_mul'
     220 |         if (skb->len < flex_array_size(std_codecs, codec, std_codecs->num)
         |                                                           ~~~~~~~~~~^~~~~
         |                                                                     |
         |                                                                     struct hci_std_codecs_v2_hdr
   include/linux/overflow.h:421:26: note: in definition of macro 'flex_array_size'
     421 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^~~~~
   include/linux/overflow.h:330:60: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct hci_std_codecs_v2_hdr'
     330 | static __always_inline size_t __must_check size_mul(size_t factor1, size_t factor2)
         |                                                     ~~~~~~~^~~~~~~
   hci_codec.c:226:23: error: invalid operands to binary < (have 'int' and 'struct hci_std_codecs_v2_hdr')
     226 |         for (i = 0; i < std_codecs->num; i++) {
         |                       ^ ~~~~~~~~~~~~~~~
         |                                   |
         |                                   struct hci_std_codecs_v2_hdr
   hci_codec.c:232:9: error: aggregate value used where an integer was expected
     232 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |         ^~~~~~~~
   In file included from include/linux/bits.h:32,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/printk.h:9,
                    from include/asm-generic/bug.h:31,
                    from arch/nios2/include/generated/asm/bug.h:1,
                    from include/linux/ktime.h:24,
                    from include/linux/poll.h:7,
                    from include/net/bluetooth/bluetooth.h:26,
                    from hci_codec.c:5:
>> include/linux/overflow.h:420:25: error: invalid operands to binary * (have 'struct hci_std_codecs_v2_hdr' and 'unsigned int')
     420 |                 (count) * sizeof(*(p)->member) + __must_be_array((p)->member),  \
         |                 ~~~~~~~ ^
   hci_codec.c:232:23: note: in expansion of macro 'flex_array_size'
     232 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |                       ^~~~~~~~~~~~~~~
   hci_codec.c:232:68: error: incompatible type for argument 1 of 'size_mul'
     232 |         skb_pull(skb, flex_array_size(std_codecs, codec, std_codecs->num)
         |                                                          ~~~~~~~~~~^~~~~
         |                                                                    |
         |                                                                    struct hci_std_codecs_v2_hdr
   include/linux/overflow.h:421:26: note: in definition of macro 'flex_array_size'
     421 |                 size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
         |                          ^~~~~
   include/linux/overflow.h:330:60: note: expected 'size_t' {aka 'unsigned int'} but argument is of type 'struct hci_std_codecs_v2_hdr'
     330 | static __always_inline size_t __must_check size_mul(size_t factor1, size_t factor2)
         |                                                     ~~~~~~~^~~~~~~


vim +420 include/linux/overflow.h

610b15c50e86eb Kees Cook           2018-05-07  405  
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  406  /**
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  407   * flex_array_size() - Calculate size of a flexible array member
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  408   *                     within an enclosing structure.
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  409   * @p: Pointer to the structure.
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  410   * @member: Name of the flexible array member.
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  411   * @count: Number of elements in the array.
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  412   *
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  413   * Calculates size of a flexible array of @count number of @member
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  414   * elements, at the end of structure @p.
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  415   *
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  416   * Return: number of bytes needed or SIZE_MAX on overflow.
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  417   */
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  418  #define flex_array_size(p, member, count)				\
230f6fa2c1db6a Kees Cook           2022-02-09  419  	__builtin_choose_expr(__is_constexpr(count),			\
230f6fa2c1db6a Kees Cook           2022-02-09 @420  		(count) * sizeof(*(p)->member) + __must_be_array((p)->member),	\
230f6fa2c1db6a Kees Cook           2022-02-09  421  		size_mul(count, sizeof(*(p)->member) + __must_be_array((p)->member)))
b19d57d0f3cc6f Gustavo A. R. Silva 2020-06-08  422  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
