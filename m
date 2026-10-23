Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751531;
	b=cVnJ8MhAFbqk9hGpNfEFmMCkJR+BoD/1JGz03o804ij5Rt1eNMAYllGftI9h3+plROi5
	 U0LVawF3i+XCkQgBkQKGlYViYJHc/+EQRFKw1VqHtPA2iWrRELdzVJmtBaTFq3dmDYH2f
	 C4BTlxzExV8lys0cDbjpx/NH0RhnXc+I3JRKOMHgZZHOacnypoeVtcRDwS/3paMfY5JS8
	 EH/TrlYFACm0wL0AasBjuEEnHzc1890PXGVoUzsEKLQxTWNt2QX/TIXKCFmecCnVYCSWo
	 362c3JVbs486gBTpfvVr0YvB+dg9rqMSQm3cHo2HfDMV1oXg4uww++QhRwwn8dtgmEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751531;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=0HTK7HU/fODraDbiMsvh++Z3IIxn955lT1VOT3CGPTU=;
	b=hzuq4GF5Q17Tu60Mf+CKTKgeStbbsulC/k9XpqHjzVDPTDp/Esi+fVrrgBEIIQjYe7KK
	 zPyfMXjW6ng/KLgnW1XfwmClARBuyiroRlblkxJfkBNzYjnOBJpviUzkCroEiQXqkyVYD
	 MkdbiK9GDdRcvKAJ7IlASqKmWziKX9rTCqX9hU2veaN1BLQgWbbMvGG11AZQJAtoGjRWm
	 PnzRtFXVQecfMQx1C3uh2RL4FFKWfblONknOj2tJsKD1zsL3WEvL5/17fbvzm6miyoxO4
	 0nKDKz6AXD4rTozHSTyBwh/6tGANHZuXAN5Qrt/Cn44QgUU7C07WHO+W9dUY2SzdWsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mN+YT+6l;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9808606A31A
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Oct 2026 10:32:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9808606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mN+YT+6l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792751530; x=1824287530;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P7/C3vjDpBHmfcPr2rYldeOMNsBQ3lHoMyHsp/faxYU=;
  b=mN+YT+6lYNc4GGwnVWqwnbHReNm8ZttOQyN6MGa+S/07HUFwNw4fRduM
   1A13qp5R50dq2pV2UU8OmgDVVBiOXB95fRQw901NAwuWlXfxrcpzt0rEV
   rlbRxTzafnY0xueQh8gh0XsZKuwdXgmltp0rIiXL0ZnHIDt4GaH6v51/M
   d5dRn9rbwnPPEjeVQlpkfRkCTat5azvhAsgAn28L+UoXLjsf47ikoOmjz
   9H3ONc1DfluSR7TD2K3EBgFwpn1IcoWxQqwN0qo/qQZE70mr/cZ6P4Uzd
   IA2PQyn6BYmY0rfgsa664CRnWewGVwXqhy9YaxH+4RTDqitfOWLW6DWFc
   g==;
X-CSE-ConnectionGUID: RadTAN0dRvaalx+E/fCSHg==
X-CSE-MsgGUID: taolPeerQvG7hCtJnPARYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1518111"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1518111"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 03:32:09 -0700
X-CSE-ConnectionGUID: TlVADS/zQMa3OHFxd9ey6g==
X-CSE-MsgGUID: f7sBt1nOQB6bqxILghbBng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3603194"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2026 03:32:07 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKCZA-00000000SZe-3iM4;
	Fri, 23 Oct 2026 10:32:04 +0000
Date: Fri, 23 Oct 2026 18:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 3/4] rust: workqueue: add creation of workqueues
Message-ID: <202610231811.kc5jRcmi-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "possibly OOM-killed compiler subprocess, not a real build error"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261020-rust-workqueue-v3-3-ea7c74d02068@google.com>
References: <20261020-rust-workqueue-v3-3-ea7c74d02068@google.com>
TO: Alice Ryhl <aliceryhl@google.com>
TO: Tejun Heo <tj@kernel.org>
TO: Lai Jiangshan <jiangshanlai@gmail.com>
TO: Danilo Krummrich <dakr@kernel.org>
CC: Miguel Ojeda <ojeda@kernel.org>
CC: Boqun Feng <boqun@kernel.org>
CC: Gary Guo <gary@garyguo.net>
CC: "Björn Roy Baron" <bjorn3_gh@protonmail.com>
CC: Benno Lossin <lossin@kernel.org>
CC: Andreas Hindborg <a.hindborg@kernel.org>
CC: Trevor Gross <tmgross@umich.edu>
CC: Daniel Almeida <daniel.almeida@collabora.com>
CC: Tamir Duberstein <tamird@kernel.org>
CC: Alexandre Courbot <acourbot@nvidia.com>
CC: "Onur Özkan" <work@onurozkan.dev>
CC: John Hubbard <jhubbard@nvidia.com>
CC: rust-for-linux@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: driver-core@lists.linux.dev
CC: Alice Ryhl <aliceryhl@google.com>

Hi Alice,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907]

url:    https://github.com/intel-lab-lkp/linux/commits/Alice-Ryhl/rust-workqueue-restrict-delayed-work-to-global-wqs/20261020-125236
base:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
patch link:    https://lore.kernel.org/r/20261020-rust-workqueue-v3-3-ea7c74d02068%40google.com
patch subject: [PATCH v3 3/4] rust: workqueue: add creation of workqueues
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20261023/202610231811.kc5jRcmi-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231811.kc5jRcmi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610231811.kc5jRcmi-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from rust/helpers/helpers.c:107:
>> rust/helpers/workqueue.c:22:9: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 4)' attribute to the declaration of 'rust_helper_alloc_workqueue' [-Wmissing-format-attribute]
      18 | __rust_helper
         | __attribute__((format(printf, 1, 4))) 
      19 | struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
      20 |                                                      int max_active, const void *data)
      21 | {
      22 |         return alloc_workqueue(fmt, flags, max_active, data);
         |                ^
   include/linux/workqueue.h:519:76: note: expanded from macro 'alloc_workqueue'
     519 | #define alloc_workqueue(...)    alloc_hooks(alloc_workqueue_noprof(__VA_ARGS__))
         |                                                                               ^
   include/linux/alloc_tag.h:270:31: note: expanded from macro 'alloc_hooks'
     270 |         alloc_hooks_tag(&_alloc_tag, _do_alloc);                        \
         |                                      ^
   include/linux/alloc_tag.h:256:9: note: expanded from macro 'alloc_hooks_tag'
     256 |         typeof(_do_alloc) _res;                                         \
         |                ^
   rust/helpers/workqueue.c:19:26: note: 'rust_helper_alloc_workqueue' declared here
      19 | struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
         |                          ^
   1 warning generated.
--
>> clang diag: include/linux/workqueue.h:519:76: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 4)' attribute to the declaration of 'rust_helper_alloc_workqueue' [-Wmissing-format-attribute]
--
   In file included from rust/helpers/helpers.c:107:
>> rust/helpers/workqueue.c:22:9: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 4)' attribute to the declaration of 'rust_helper_alloc_workqueue' [-Wmissing-format-attribute]
   In file included from rust/helpers/helpers.c:107:
>> rust/helpers/workqueue.c:22:9: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 4)' attribute to the declaration of 'rust_helper_alloc_workqueue' [-Wmissing-format-attribute]
   18 | __rust_helper
   | __attribute__((format(printf, 1, 4)))
   19 | struct workqueue_struct *rus   t_18he | l_p_erru_satl_lhoecl_pweorr
   kq      u| e__attribute__((format(printf, 1, 4))) ue
   (const char *fmt,    u19n | ssitgrnuecdt  iwnotr kfqluaeguse,_
   struct *r   u20s | t        _        h        e        l        p        e r _ a l lionct_ wmoarxk_qaucetuiev(ec,o ncsotn scth avro i*df m*td,a tuan)s
   i   g21n | e{d
   int flags,
   22 |         r   e20t | u        r        n                 a        l        l o c _ w oirknqtu emuaex(_famctt,i vfel,a gcso,n smta xv_oaicdt i*ved,a dtaata))
   ;
   21       | | {               ^
--
   256 |         typeo   f19( | _sdtor_uacltl owco)r k_qrueesu;e _        s        t        r        u        c\t
   *| r               ^u
   st_helper_alloc_workquerust/helpers/workqueue.cu:e19(:c26o:n snote: t'rust_helper_alloc_workqueue' declared here
   char *fmt, unsigned    i19n | ts tfrluacgts ,w
   o      r| k                         ^qu
   eue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
   |                          ^
>> clang diag: include/linux/workqueue.h:519:76: warning: diagnostic behavior may be improved by adding the 'format(printf, 1, 4)' attribute to the declaration of 'rust_helper_alloc_workqueue' [-Wmissing-format-attribute]
   1 warning generated.
   1 warning generated.


vim +22 rust/helpers/workqueue.c

a20a89e658f005 Alice Ryhl 2026-10-20  17  
a20a89e658f005 Alice Ryhl 2026-10-20  18  __rust_helper
a20a89e658f005 Alice Ryhl 2026-10-20  19  struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
a20a89e658f005 Alice Ryhl 2026-10-20  20  						     int max_active, const void *data)
a20a89e658f005 Alice Ryhl 2026-10-20  21  {
a20a89e658f005 Alice Ryhl 2026-10-20 @22  	return alloc_workqueue(fmt, flags, max_active, data);

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
