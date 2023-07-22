Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4C1613A
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Jul 2023 05:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690002401; x=1721538401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o5j1pjn6urar7xfof+wn1Weg2Y261FX5Sni9LiahfcA=;
  b=GQAu3+x0/Yt5kzVID15noe1t2r9uXJahpKr/TwMfeG+47+oNhnmG7/fI
   m1Yojl0ZPhC/e9EXLGIxI04F5DdwsahJa+byjpYjQbsnFHOrFkUlsVNln
   APpFz9Z71qCp3bCfXbKlsk1pw+ZN1tbLyELSEAXaBPs6cslwfX/UZsx0S
   SQAYBTfn/1/6TBzyyqh61+e7tjJRLKktO4lv+l1frhvSmv/hnKWhHwDnn
   hQx1orv1gU1LiwsXhUldoUarM4GDSuyuTmHhuUCllYlDsh03vrcWFw7FY
   zoQFPCtC4BOhIWNC1UQUPhCGI6jf1bLoL3hAhS2dejrf39CyVj5OiL10Q
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="364625123"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="364625123"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 22:06:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="719071157"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="719071157"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 22:06:38 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN4pB-0007zF-1c;
	Sat, 22 Jul 2023 05:06:37 +0000
Date: Sat, 22 Jul 2023 13:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: progs/hid_bpf_helpers.h:9:38: error: declaration of 'struct
 hid_bpf_ctx' will not be visible outside of this function
Message-ID: <202307221250.TO1vcIdj-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC: Jiri Kosina <jkosina@suse.cz>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d192f5382581d972c4ae1b4d72e0b59b34cadeb9
commit: e9d48abbce93e2138e37a695ba5931f3d3c9fdd9 kselftests: hid: fix missing headers_install step
date:   7 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 7 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221250.TO1vcIdj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202307221250.TO1vcIdj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:6:
>> progs/hid_bpf_helpers.h:9:38: error: declaration of 'struct hid_bpf_ctx' will not be visible outside of this function [-Werror,-Wvisibility]
       9 | extern __u8 *hid_bpf_get_data(struct hid_bpf_ctx *ctx,
         |                                      ^
>> progs/hid.c:23:35: error: incompatible pointer types passing 'struct hid_bpf_ctx *' to parameter of type 'struct hid_bpf_ctx *' [-Werror,-Wincompatible-pointer-types]
      23 |         __u8 *rw_data = hid_bpf_get_data(hid_ctx, 0 /* offset */, 3 /* size */);
         |                                          ^~~~~~~
   progs/hid_bpf_helpers.h:9:51: note: passing argument to parameter 'ctx' here
       9 | extern __u8 *hid_bpf_get_data(struct hid_bpf_ctx *ctx,
         |                                                   ^
>> progs/hid.c:32:16: error: incomplete definition of type 'struct hid_bpf_ctx'
      32 |         return hid_ctx->size;
         |                ~~~~~~~^
   progs/hid_bpf_helpers.h:13:15: note: forward declaration of 'struct hid_bpf_ctx'
      13 | extern struct hid_bpf_ctx *hid_bpf_allocate_context(unsigned int hid_id) __ksym;
         |               ^
   progs/hid.c:38:35: error: incompatible pointer types passing 'struct hid_bpf_ctx *' to parameter of type 'struct hid_bpf_ctx *' [-Werror,-Wincompatible-pointer-types]
      38 |         __u8 *rw_data = hid_bpf_get_data(hid_ctx, 0 /* offset */, 3 /* size */);
         |                                          ^~~~~~~
   progs/hid_bpf_helpers.h:9:51: note: passing argument to parameter 'ctx' here
       9 | extern __u8 *hid_bpf_get_data(struct hid_bpf_ctx *ctx,
         |                                                   ^
>> progs/hid.c:53:27: error: use of undeclared identifier 'HID_BPF_FLAG_INSERT_HEAD'
      53 |                                           ctx->insert_head ? HID_BPF_FLAG_INSERT_HEAD :
         |                                                              ^
>> progs/hid.c:54:13: error: use of undeclared identifier 'HID_BPF_FLAG_NONE'
      54 |                                                              HID_BPF_FLAG_NONE);
         |                                                              ^
   progs/hid.c:131:32: error: incompatible pointer types passing 'struct hid_bpf_ctx *' to parameter of type 'struct hid_bpf_ctx *' [-Werror,-Wincompatible-pointer-types]
     131 |         __u8 *data = hid_bpf_get_data(hid_ctx, 0 /* offset */, 4096 /* size */);
         |                                       ^~~~~~~
   progs/hid_bpf_helpers.h:9:51: note: passing argument to parameter 'ctx' here
       9 | extern __u8 *hid_bpf_get_data(struct hid_bpf_ctx *ctx,
         |                                                   ^
   progs/hid.c:150:32: error: incompatible pointer types passing 'struct hid_bpf_ctx *' to parameter of type 'struct hid_bpf_ctx *' [-Werror,-Wincompatible-pointer-types]
     150 |         __u8 *data = hid_bpf_get_data(hid_ctx, 0 /* offset */, 4 /* size */);
         |                                       ^~~~~~~
   progs/hid_bpf_helpers.h:9:51: note: passing argument to parameter 'ctx' here
       9 | extern __u8 *hid_bpf_get_data(struct hid_bpf_ctx *ctx,
         |                                                   ^
   progs/hid.c:167:32: error: incompatible pointer types passing 'struct hid_bpf_ctx *' to parameter of type 'struct hid_bpf_ctx *' [-Werror,-Wincompatible-pointer-types]
     167 |         __u8 *data = hid_bpf_get_data(hid_ctx, 0 /* offset */, 4 /* size */);
         |                                       ^~~~~~~
   progs/hid_bpf_helpers.h:9:51: note: passing argument to parameter 'ctx' here
       9 | extern __u8 *hid_bpf_get_data(struct hid_bpf_ctx *ctx,
         |                                                   ^
   progs/hid.c:184:32: error: incompatible pointer types passing 'struct hid_bpf_ctx *' to parameter of type 'struct hid_bpf_ctx *' [-Werror,-Wincompatible-pointer-types]
     184 |         __u8 *data = hid_bpf_get_data(hid_ctx, 0 /* offset */, 4 /* size */);
         |                                       ^~~~~~~
   progs/hid_bpf_helpers.h:9:51: note: passing argument to parameter 'ctx' here
       9 | extern __u8 *hid_bpf_get_data(struct hid_bpf_ctx *ctx,
         |                                                   ^
   10 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
