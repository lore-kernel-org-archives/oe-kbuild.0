Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65D723C0
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Oct 2022 10:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667037809; x=1698573809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VyaLuWZF45LphyEtLCGZfDnl/RCeD+XI0PkLAOahh+s=;
  b=BVc4Np/rmHnbQq3uyVgNT+L27bB3cKsVSTZmU38JuaIvRt8BYtINkyxf
   /KZiLLwUOXqywh7RZ9D8oZi2bbauPTsVV6zLtr95z8JarMTKoUQXXwhE5
   ET2/1ii+2dY4KunioLTOFkZ23MnOHYs7kAQgzjbc8oaAaqb27Z6sBY7D8
   6HE0Y+63wRZB1JiqoxvY1jhsX22f+zrqYDY4lPrKWB9xljJ8ONgqFsVwy
   KZ2U/n8v7kxdxoWSMkah79hMUpoUDKNEOjXObsLESGxYHDQFbwsmKK2Bl
   p7Apoo6/HQwmi96Kkn7RdDzPQBLvdDx1fESNoBhnXY5UFZ7B7Brseb8iM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="289047713"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="289047713"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2022 03:03:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10514"; a="702014625"
X-IronPort-AV: E=Sophos;i="5.95,223,1661842800"; 
   d="scan'208";a="702014625"
Received: from lkp-server02.sh.intel.com (HELO b6d29c1a0365) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 29 Oct 2022 03:03:27 -0700
Received: from kbuild by b6d29c1a0365 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ooigY-000AuS-1g;
	Sat, 29 Oct 2022 10:03:26 +0000
Date: Sat, 29 Oct 2022 18:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH hid v11 02/14] HID: initial BPF implementation
Message-ID: <202210291755.BlnKEqm7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="q6gMsH+Lt4YGyYg8"
Content-Disposition: inline


--q6gMsH+Lt4YGyYg8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hid/bpf/entrypoints/entrypoints.lskel.h:542:39: sparse: sparse: string too long (33166 bytes, 8191 bytes max)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20221025093458.457089-3-benjamin.tissoires@redhat.com>
References: <20221025093458.457089-3-benjamin.tissoires@redhat.com>
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>

Hi Benjamin,

I love your patch! Perhaps something to improve:

[auto build test WARNING on hid/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Benjamin-Tissoires/Introduce-eBPF-support-for-HID-devices/20221025-173852
base:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git master
patch link:    https://lore.kernel.org/r/20221025093458.457089-3-benjamin.tissoires%40redhat.com
patch subject: [PATCH hid v11 02/14] HID: initial BPF implementation
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: m68k-randconfig-s043-20221028
compiler: m68k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/786f2c352364ef32299dcaca3fe0f9ceade7d92a
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Benjamin-Tissoires/Introduce-eBPF-support-for-HID-devices/20221025-173852
        git checkout 786f2c352364ef32299dcaca3fe0f9ceade7d92a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=m68k SHELL=/bin/bash drivers/hid/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/hid/bpf/hid_bpf_dispatch.c: note: in included file:
>> drivers/hid/bpf/entrypoints/entrypoints.lskel.h:542:39: sparse: sparse: string too long (33166 bytes, 8191 bytes max)
>> drivers/hid/bpf/entrypoints/entrypoints.lskel.h:113:29: sparse: sparse: unknown escape sequence: '--
   drivers/hid/bpf/hid_bpf_jmp_table.c: note: in included file:
>> drivers/hid/bpf/entrypoints/entrypoints.lskel.h:542:39: sparse: sparse: string too long (33166 bytes, 8191 bytes max)
>> drivers/hid/bpf/entrypoints/entrypoints.lskel.h:113:29: sparse: sparse: unknown escape sequence: '4-drivers/hid/bpf/hid_bpf_jmp_table.c:464:52: sparse: sparse: non size-preserving integer to pointer cast

vim +542 drivers/hid/bpf/entrypoints/entrypoints.lskel.h

786f2c352364ef Benjamin Tissoires 2022-10-25  104  
786f2c352364ef Benjamin Tissoires 2022-10-25  105  static inline int
786f2c352364ef Benjamin Tissoires 2022-10-25  106  entrypoints_bpf__load(struct entrypoints_bpf *skel)
786f2c352364ef Benjamin Tissoires 2022-10-25  107  {
786f2c352364ef Benjamin Tissoires 2022-10-25  108  	struct bpf_load_and_run_opts opts = {};
786f2c352364ef Benjamin Tissoires 2022-10-25  109  	int err;
786f2c352364ef Benjamin Tissoires 2022-10-25  110  
786f2c352364ef Benjamin Tissoires 2022-10-25  111  	opts.ctx = (struct bpf_loader_ctx *)skel;
786f2c352364ef Benjamin Tissoires 2022-10-25  112  	opts.data_sz = 11504;
786f2c352364ef Benjamin Tissoires 2022-10-25  113  	opts.data = (void *)"\
786f2c352364ef Benjamin Tissoires 2022-10-25  114  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  115  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  116  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  117  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  118  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  119  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  120  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  121  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  122  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  123  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  124  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  125  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  126  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  127  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  128  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  129  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  130  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  131  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  132  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  133  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  134  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  135  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  136  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  137  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  138  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  139  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  140  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  141  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  142  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  143  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  144  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  145  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  146  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x9f\xeb\x01\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  147  \x18\0\0\0\0\0\0\0\x78\x14\0\0\x78\x14\0\0\xf4\x0c\0\0\0\0\0\0\0\0\0\x02\x03\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  148  \0\0\x01\0\0\0\0\0\0\x01\x04\0\0\0\x20\0\0\x01\0\0\0\0\0\0\0\x03\0\0\0\0\x02\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  149  \0\0\x04\0\0\0\x03\0\0\0\x05\0\0\0\0\0\0\x01\x04\0\0\0\x20\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  150  \x02\x06\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x02\0\0\0\x04\0\0\0\0\x04\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  151  \0\0\0\x02\x08\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x02\0\0\0\x04\0\0\0\x04\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  152  \0\0\0\x04\0\0\x04\x20\0\0\0\x19\0\0\0\x01\0\0\0\0\0\0\0\x1e\0\0\0\x05\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  153  \x40\0\0\0\x2a\0\0\0\x07\0\0\0\x80\0\0\0\x33\0\0\0\x07\0\0\0\xc0\0\0\0\x3e\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  154  \0\0\0\0\x0e\x09\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\x02\x0c\0\0\0\0\0\0\0\0\0\0\x03\
786f2c352364ef Benjamin Tissoires 2022-10-25  155  \0\0\0\0\x02\0\0\0\x04\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\x02\x0e\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  156  \0\x03\0\0\0\0\x02\0\0\0\x04\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\x02\x10\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  157  \0\0\0\0\x02\0\0\0\0\0\0\0\0\0\0\0\x02\x12\0\0\0\x4c\0\0\0\0\0\0\x08\x13\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  158  \x51\0\0\0\0\0\0\x01\x01\0\0\0\x08\0\0\0\0\0\0\0\x04\0\0\x04\x20\0\0\0\x19\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  159  \0\x0b\0\0\0\0\0\0\0\x1e\0\0\0\x0d\0\0\0\x40\0\0\0\x5f\0\0\0\x0f\0\0\0\x80\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  160  \0\x63\0\0\0\x11\0\0\0\xc0\0\0\0\x69\0\0\0\0\0\0\x0e\x14\0\0\0\x01\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  161  \0\0\0\0\x02\x17\0\0\0\x73\0\0\0\0\0\0\x01\x08\0\0\0\x40\0\0\0\0\0\0\0\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  162  \x0d\x02\0\0\0\x86\0\0\0\x16\0\0\0\x8a\0\0\0\x01\0\0\x0c\x18\0\0\0\x30\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  163  \x05\0\0\x04\x20\0\0\0\x3c\x01\0\0\x1b\0\0\0\0\0\0\0\x42\x01\0\0\x1d\0\0\0\x40\
786f2c352364ef Benjamin Tissoires 2022-10-25  164  \0\0\0\x46\x01\0\0\x1b\0\0\0\x80\0\0\0\x55\x01\0\0\x1f\0\0\0\xa0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  165  \x20\0\0\0\xc0\0\0\0\x61\x01\0\0\0\0\0\x08\x1c\0\0\0\x67\x01\0\0\0\0\0\x01\x04\
786f2c352364ef Benjamin Tissoires 2022-10-25  166  \0\0\0\x20\0\0\0\0\0\0\0\0\0\0\x02\x1e\0\0\0\0\0\0\0\0\0\0\x0a\xb5\0\0\0\x74\
786f2c352364ef Benjamin Tissoires 2022-10-25  167  \x01\0\0\x04\0\0\x06\x04\0\0\0\x84\x01\0\0\0\0\0\0\x95\x01\0\0\x01\0\0\0\xa7\
786f2c352364ef Benjamin Tissoires 2022-10-25  168  \x01\0\0\x02\0\0\0\xba\x01\0\0\x03\0\0\0\0\0\0\0\x02\0\0\x05\x04\0\0\0\xcb\x01\
786f2c352364ef Benjamin Tissoires 2022-10-25  169  \0\0\x21\0\0\0\0\0\0\0\xd2\x01\0\0\x21\0\0\0\0\0\0\0\xd7\x01\0\0\0\0\0\x08\x02\
786f2c352364ef Benjamin Tissoires 2022-10-25  170  \0\0\0\0\0\0\0\x01\0\0\x0d\x02\0\0\0\x86\0\0\0\x16\0\0\0\x13\x02\0\0\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  171  \x0c\x22\0\0\0\x82\x02\0\0\x14\0\0\x04\xc8\x01\0\0\x87\x02\0\0\x25\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  172  \0\x8b\x02\0\0\x2c\0\0\0\x80\0\0\0\x92\x02\0\0\x2f\0\0\0\0\x01\0\0\x9a\x02\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  173  \x30\0\0\0\x40\x01\0\0\x9f\x02\0\0\x32\0\0\0\x80\x01\0\0\xa6\x02\0\0\x59\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  174  \x80\x03\0\0\xae\x02\0\0\x1c\0\0\0\xc0\x03\0\0\xb6\x02\0\0\x5f\0\0\0\xe0\x03\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  175  \0\xbd\x02\0\0\x60\0\0\0\0\x04\0\0\xc8\x02\0\0\x63\0\0\0\x80\x08\0\0\xce\x02\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  176  \0\x65\0\0\0\xc0\x08\0\0\xd6\x02\0\0\x73\0\0\0\x80\x0b\0\0\xdd\x02\0\0\x75\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  177  \0\xc0\x0b\0\0\xe2\x02\0\0\x76\0\0\0\xc0\x0c\0\0\xec\x02\0\0\x10\0\0\0\0\x0d\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  178  \0\xf7\x02\0\0\x10\0\0\0\x40\x0d\0\0\x04\x03\0\0\x78\0\0\0\x80\x0d\0\0\x09\x03\
786f2c352364ef Benjamin Tissoires 2022-10-25  179  \0\0\x79\0\0\0\xc0\x0d\0\0\x13\x03\0\0\x7a\0\0\0\0\x0e\0\0\x1c\x03\0\0\x7a\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  180  \0\x20\x0e\0\0\0\0\0\0\x02\0\0\x05\x10\0\0\0\x25\x03\0\0\x26\0\0\0\0\0\0\0\x2e\
786f2c352364ef Benjamin Tissoires 2022-10-25  181  \x03\0\0\x28\0\0\0\0\0\0\0\x39\x03\0\0\x01\0\0\x04\x08\0\0\0\x44\x03\0\0\x27\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  182  \0\0\0\0\0\0\0\0\0\0\0\0\0\x02\x26\0\0\0\x49\x03\0\0\x02\0\0\x04\x10\0\0\0\x44\
786f2c352364ef Benjamin Tissoires 2022-10-25  183  \x03\0\0\x29\0\0\0\0\0\0\0\x57\x03\0\0\x2a\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\x02\
786f2c352364ef Benjamin Tissoires 2022-10-25  184  \x28\0\0\0\0\0\0\0\0\0\0\x02\x2b\0\0\0\0\0\0\0\x01\0\0\x0d\0\0\0\0\0\0\0\0\x29\
786f2c352364ef Benjamin Tissoires 2022-10-25  185  \0\0\0\x5c\x03\0\0\x02\0\0\x04\x10\0\0\0\x61\x03\0\0\x2d\0\0\0\0\0\0\0\x65\x03\
786f2c352364ef Benjamin Tissoires 2022-10-25  186  \0\0\x2e\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\x02\xbe\0\0\0\0\0\0\0\0\0\0\x02\xb1\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  187  \0\0\0\0\0\0\0\0\x02\x81\0\0\0\0\0\0\0\0\0\0\x02\x31\0\0\0\0\0\0\0\0\0\0\x0a\
786f2c352364ef Benjamin Tissoires 2022-10-25  188  \xb3\0\0\0\x6c\x03\0\0\0\0\0\x08\x33\0\0\0\x77\x03\0\0\x01\0\0\x04\x40\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  189  \0\0\0\x34\0\0\0\0\0\0\0\0\0\0\0\x02\0\0\x05\x40\0\0\0\x80\x03\0\0\x35\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  190  \0\0\0\0\0\0\0\x57\0\0\0\0\0\0\0\x86\x03\0\0\x05\0\0\x04\x40\0\0\0\x93\x03\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  191  \x36\0\0\0\0\0\0\0\x9c\x03\0\0\x1c\0\0\0\x20\0\0\0\xa2\x03\0\0\x1c\0\0\0\x40\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  192  \0\0\xac\x03\0\0\x10\0\0\0\x80\0\0\0\xb2\x03\0\0\x41\0\0\0\xc0\0\0\0\xba\x03\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  193  \0\0\0\0\x08\x37\0\0\0\xca\x03\0\0\x01\0\0\x04\x04\0\0\0\0\0\0\0\x38\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  194  \0\0\0\0\0\0\x03\0\0\x05\x04\0\0\0\xd4\x03\0\0\x39\0\0\0\0\0\0\0\0\0\0\0\x3b\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  195  \0\0\0\0\0\0\0\0\0\0\x3d\0\0\0\0\0\0\0\xd8\x03\0\0\0\0\0\x08\x3a\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  196  \x01\0\0\x04\x04\0\0\0\xe1\x03\0\0\x02\0\0\0\0\0\0\0\0\0\0\0\x02\0\0\x04\x02\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  197  \0\0\xe9\x03\0\0\x3c\0\0\0\0\0\0\0\xf0\x03\0\0\x3c\0\0\0\x08\0\0\0\xf8\x03\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  198  \0\0\0\x08\x12\0\0\0\0\0\0\0\x02\0\0\x04\x04\0\0\0\xfb\x03\0\0\x3e\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  199  \0\x0a\x04\0\0\x3e\0\0\0\x10\0\0\0\x0f\x04\0\0\0\0\0\x08\x3f\0\0\0\x13\x04\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  200  \0\0\0\x08\x40\0\0\0\x19\x04\0\0\0\0\0\x01\x02\0\0\0\x10\0\0\0\x28\x04\0\0\x06\
786f2c352364ef Benjamin Tissoires 2022-10-25  201  \0\0\x04\x28\0\0\0\x5f\0\0\0\x42\0\0\0\0\0\0\0\x34\x04\0\0\x56\0\0\0\x40\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  202  \x40\x04\0\0\x53\0\0\0\xc0\0\0\0\x45\x04\0\0\x3c\0\0\0\0\x01\0\0\x55\x04\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  203  \x3c\0\0\0\x08\x01\0\0\x65\x04\0\0\x3c\0\0\0\x10\x01\0\0\0\0\0\0\0\0\0\x02\xb7\
786f2c352364ef Benjamin Tissoires 2022-10-25  204  \0\0\0\0\0\0\0\0\0\0\x02\x44\0\0\0\x6f\x04\0\0\x0e\0\0\x04\xc0\0\0\0\x7a\x04\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  205  \0\x45\0\0\0\0\0\0\0\x85\x04\0\0\x48\0\0\0\x80\0\0\0\x90\x04\0\0\x48\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  206  \x01\0\0\x9c\x04\0\0\x48\0\0\0\x80\x01\0\0\x5f\0\0\0\x4a\0\0\0\0\x02\0\0\xa9\
786f2c352364ef Benjamin Tissoires 2022-10-25  207  \x04\0\0\x1c\0\0\0\x40\x02\0\0\xb2\x04\0\0\x1c\0\0\0\x60\x02\0\0\xbd\x04\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  208  \x4c\0\0\0\x80\x02\0\0\xc8\x04\0\0\x52\0\0\0\xc0\x02\0\0\xd5\x04\0\0\x02\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  209  \x40\x05\0\0\x40\x04\0\0\x53\0\0\0\x80\x05\0\0\x55\x04\0\0\x3c\0\0\0\xc0\x05\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  210  \0\x45\x04\0\0\x3c\0\0\0\xc8\x05\0\0\x65\x04\0\0\x3c\0\0\0\xd0\x05\0\0\xe2\x04\
786f2c352364ef Benjamin Tissoires 2022-10-25  211  \0\0\x02\0\0\x04\x10\0\0\0\x44\x03\0\0\x46\0\0\0\0\0\0\0\xed\x04\0\0\x47\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  212  \x40\0\0\0\0\0\0\0\0\0\0\x02\x45\0\0\0\0\0\0\0\0\0\0\x02\x46\0\0\0\xf3\x04\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  213  \x02\0\0\x04\x10\0\0\0\x44\x03\0\0\x49\0\0\0\0\0\0\0\xfd\x04\0\0\x49\0\0\0\x40\
786f2c352364ef Benjamin Tissoires 2022-10-25  214  \0\0\0\0\0\0\0\0\0\0\x02\x48\0\0\0\0\0\0\0\0\0\0\x02\x4b\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  215  \x0a\xb8\0\0\0\x02\x05\0\0\0\0\0\x01\x08\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\x02\x4e\
786f2c352364ef Benjamin Tissoires 2022-10-25  216  \0\0\0\0\0\0\0\0\0\0\x0a\x4f\0\0\0\x10\x05\0\0\x04\0\0\x04\x18\0\0\0\x7a\x04\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  217  \0\x45\0\0\0\0\0\0\0\x1b\x05\0\0\x50\0\0\0\x80\0\0\0\x20\x05\0\0\x50\0\0\0\xa0\
786f2c352364ef Benjamin Tissoires 2022-10-25  218  \0\0\0\x2b\x05\0\0\x51\0\0\0\xc0\0\0\0\x33\x05\0\0\0\0\0\x08\x1b\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  219  \0\0\0\x03\0\0\0\0\x4c\0\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x4d\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  220  \0\0\x04\0\0\0\x0a\0\0\0\0\0\0\0\0\0\0\x02\x54\0\0\0\0\0\0\0\0\0\0\x0a\x55\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  221  \0\x37\x05\0\0\0\0\0\x01\x01\0\0\0\x08\0\0\x01\0\0\0\0\0\0\0\x03\0\0\0\0\x43\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  222  \0\0\x04\0\0\0\x02\0\0\0\0\0\0\0\x02\0\0\x04\x40\0\0\0\x3c\x05\0\0\x58\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  223  \0\0\0\xb2\x03\0\0\x41\0\0\0\xc0\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x3c\0\0\0\x04\
786f2c352364ef Benjamin Tissoires 2022-10-25  224  \0\0\0\x18\0\0\0\x46\x05\0\0\0\0\0\x08\x5a\0\0\0\x54\x05\0\0\0\0\0\x08\x5b\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  225  \0\0\0\0\0\x01\0\0\x04\x08\0\0\0\xe1\x03\0\0\x5c\0\0\0\0\0\0\0\x5f\x05\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  226  \0\x08\x5d\0\0\0\x63\x05\0\0\0\0\0\x08\x5e\0\0\0\x69\x05\0\0\0\0\0\x01\x08\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  227  \0\x40\0\0\x01\x73\x05\0\0\0\0\0\x08\x1c\0\0\0\x7b\x05\0\0\x06\0\0\x04\x90\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  228  \0\xac\x03\0\0\x59\0\0\0\0\0\0\0\x81\x05\0\0\x61\0\0\0\x40\0\0\0\x8b\x05\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  229  \x62\0\0\0\x40\x02\0\0\x8f\x05\0\0\x48\0\0\0\x80\x02\0\0\x9c\x03\0\0\x10\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  230  \0\x03\0\0\xb2\x03\0\0\x41\0\0\0\x40\x03\0\0\x99\x05\0\0\0\0\0\x08\x35\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  231  \xa8\x05\0\0\x01\0\0\x04\x04\0\0\0\x0a\x04\0\0\x39\0\0\0\0\0\0\0\xbe\x05\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  232  \0\0\x08\x64\0\0\0\xc5\x05\0\0\0\0\0\x08\x5e\0\0\0\xd5\x05\0\0\x06\0\0\x04\x58\
786f2c352364ef Benjamin Tissoires 2022-10-25  233  \0\0\0\xe1\x05\0\0\x66\0\0\0\0\0\0\0\xe6\x05\0\0\x6d\0\0\0\0\x02\0\0\xea\x05\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  234  \0\x6e\0\0\0\x40\x02\0\0\xf3\x05\0\0\x6f\0\0\0\x60\x02\0\0\xf7\x05\0\0\x6f\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  235  \0\x80\x02\0\0\xfc\x05\0\0\x02\0\0\0\xa0\x02\0\0\x03\x06\0\0\0\0\0\x08\x67\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  236  \0\0\0\0\0\x05\0\0\x04\x40\0\0\0\x93\x03\0\0\x68\0\0\0\0\0\0\0\x9c\x03\0\0\x1c\
786f2c352364ef Benjamin Tissoires 2022-10-25  237  \0\0\0\x40\0\0\0\xa2\x03\0\0\x1c\0\0\0\x60\0\0\0\xac\x03\0\0\x10\0\0\0\x80\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  238  \0\xb2\x03\0\0\x41\0\0\0\xc0\0\0\0\x0c\x06\0\0\0\0\0\x08\x69\0\0\0\x1a\x06\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  239  \x02\0\0\x04\x08\0\0\0\0\0\0\0\x6a\0\0\0\0\0\0\0\x81\x05\0\0\x36\0\0\0\x20\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  240  \0\0\0\0\0\x02\0\0\x05\x04\0\0\0\x22\x06\0\0\x39\0\0\0\0\0\0\0\0\0\0\0\x6b\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  241  \0\0\0\0\0\0\0\0\0\x02\0\0\x04\x04\0\0\0\x27\x06\0\0\x3c\0\0\0\0\0\0\0\x2f\x06\
786f2c352364ef Benjamin Tissoires 2022-10-25  242  \0\0\x6c\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x3c\0\0\0\x04\0\0\0\x03\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  243  \0\0\0\0\0\0\0\0\x02\xb9\0\0\0\xea\x05\0\0\x05\0\0\x06\x04\0\0\0\x38\x06\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  244  \0\0\0\x44\x06\0\0\x01\0\0\0\x51\x06\0\0\x02\0\0\0\x5e\x06\0\0\x03\0\0\0\x6a\
786f2c352364ef Benjamin Tissoires 2022-10-25  245  \x06\0\0\x04\0\0\0\x76\x06\0\0\0\0\0\x08\x70\0\0\0\0\0\0\0\x01\0\0\x04\x04\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  246  \0\xd4\x03\0\0\x71\0\0\0\0\0\0\0\x7d\x06\0\0\0\0\0\x08\x72\0\0\0\x83\x06\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  247  \0\0\x08\x1c\0\0\0\0\0\0\0\0\0\0\x02\x74\0\0\0\0\0\0\0\0\0\0\x0a\xb0\0\0\0\x94\
786f2c352364ef Benjamin Tissoires 2022-10-25  248  \x06\0\0\x06\0\0\x04\x20\0\0\0\xa2\x06\0\0\x4c\0\0\0\0\0\0\0\xd2\x01\0\0\x1c\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  249  \0\0\x40\0\0\0\xa8\x06\0\0\x1c\0\0\0\x60\0\0\0\xb3\x06\0\0\x1c\0\0\0\x80\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  250  \xbc\x06\0\0\x1c\0\0\0\xa0\0\0\0\xc6\x06\0\0\x63\0\0\0\xc0\0\0\0\xcf\x06\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  251  \0\0\x08\x77\0\0\0\xd3\x06\0\0\0\0\0\x08\x17\0\0\0\0\0\0\0\0\0\0\x02\x96\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  252  \0\0\0\0\0\0\0\x02\x9b\0\0\0\xd9\x06\0\0\0\0\0\x08\x50\0\0\0\0\0\0\0\x02\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  253  \x0d\x7c\0\0\0\xe9\x0c\0\0\x76\0\0\0\xe9\x0c\0\0\x02\0\0\0\xa2\x07\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  254  \x08\x7d\0\0\0\xa7\x07\0\0\0\0\0\x01\x01\0\0\0\x08\0\0\x04\xad\x07\0\0\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  255  \x0c\x7b\0\0\0\0\0\0\0\x01\0\0\x0d\x02\0\0\0\x86\0\0\0\x16\0\0\0\xc7\x07\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  256  \x01\0\0\x0c\x7f\0\0\0\x1d\x08\0\0\x34\0\0\x04\x78\x04\0\0\x23\x08\0\0\x82\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  257  \0\0\0\0\0\x2a\x08\0\0\x40\0\0\0\x10\0\0\0\x34\x08\0\0\x6f\0\0\0\x20\0\0\0\x3a\
786f2c352364ef Benjamin Tissoires 2022-10-25  258  \x08\0\0\x83\0\0\0\x40\0\0\0\x40\x08\0\0\x1c\0\0\0\x60\0\0\0\x48\x08\0\0\x87\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  259  \0\0\x80\0\0\0\x4e\x08\0\0\x87\0\0\0\xc0\0\0\0\x5c\x08\0\0\x88\0\0\0\0\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  260  \x61\x08\0\0\x8a\0\0\0\x40\x01\0\0\x66\x08\0\0\x79\0\0\0\x80\x01\0\0\x70\x08\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  261  \0\x10\0\0\0\xc0\x01\0\0\x7b\x08\0\0\x4c\0\0\0\0\x02\0\0\0\0\0\0\x8b\0\0\0\x40\
786f2c352364ef Benjamin Tissoires 2022-10-25  262  \x02\0\0\x81\x08\0\0\x8d\0\0\0\x60\x02\0\0\x88\x08\0\0\x63\0\0\0\x80\x02\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  263  \x8f\x08\0\0\x8f\0\0\0\xc0\x02\0\0\x97\x08\0\0\x8f\0\0\0\x40\x03\0\0\x9f\x08\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  264  \0\x8f\0\0\0\xc0\x03\0\0\xa7\x08\0\0\x32\0\0\0\x40\x04\0\0\xae\x08\0\0\x40\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  265  \0\x40\x06\0\0\xb6\x08\0\0\x3c\0\0\0\x50\x06\0\0\xc0\x08\0\0\x3c\0\0\0\x58\x06\
786f2c352364ef Benjamin Tissoires 2022-10-25  266  \0\0\xcd\x08\0\0\x92\0\0\0\x80\x06\0\0\xd6\x08\0\0\x4c\0\0\0\xc0\x06\0\0\xde\
786f2c352364ef Benjamin Tissoires 2022-10-25  267  \x08\0\0\x93\0\0\0\0\x07\0\0\xe6\x08\0\0\x4c\0\0\0\xc0\x0b\0\0\xf3\x08\0\0\x4c\
786f2c352364ef Benjamin Tissoires 2022-10-25  268  \0\0\0\0\x0c\0\0\x05\x09\0\0\x45\0\0\0\x40\x0c\0\0\x0c\x09\0\0\x48\0\0\0\xc0\
786f2c352364ef Benjamin Tissoires 2022-10-25  269  \x0c\0\0\x16\x09\0\0\x94\0\0\0\x40\x0d\0\0\x1b\x09\0\0\x02\0\0\0\x80\x0d\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  270  \x2b\x09\0\0\x3e\0\0\0\xa0\x0d\0\0\x3d\x09\0\0\x3e\0\0\0\xb0\x0d\0\0\x4e\x09\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  271  \0\x48\0\0\0\xc0\x0d\0\0\x54\x09\0\0\x48\0\0\0\x40\x0e\0\0\x5e\x09\0\0\x48\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  272  \0\xc0\x0e\0\0\0\0\0\0\x95\0\0\0\x40\x0f\0\0\x68\x09\0\0\x5a\0\0\0\xc0\x0f\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  273  \x72\x09\0\0\x5a\0\0\0\0\x10\0\0\x7d\x09\0\0\x39\0\0\0\x40\x10\0\0\x85\x09\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  274  \x39\0\0\0\x60\x10\0\0\x91\x09\0\0\x39\0\0\0\x80\x10\0\0\x9e\x09\0\0\x39\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  275  \xa0\x10\0\0\0\0\0\0\x97\0\0\0\xc0\x10\0\0\xaa\x09\0\0\x9a\0\0\0\0\x11\0\0\xb2\
786f2c352364ef Benjamin Tissoires 2022-10-25  276  \x09\0\0\x9b\0\0\0\x40\x11\0\0\xb9\x09\0\0\x48\0\0\0\x40\x22\0\0\0\0\0\0\xa3\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  277  \0\0\xc0\x22\0\0\xc3\x09\0\0\x1b\0\0\0\0\x23\0\0\xd0\x09\0\0\x1b\0\0\0\x20\x23\
786f2c352364ef Benjamin Tissoires 2022-10-25  278  \0\0\xe0\x09\0\0\xa7\0\0\0\x40\x23\0\0\xf1\x09\0\0\x10\0\0\0\x80\x23\0\0\xfb\
786f2c352364ef Benjamin Tissoires 2022-10-25  279  \x09\0\0\0\0\0\x08\x40\0\0\0\x03\x0a\0\0\0\0\0\x08\x84\0\0\0\0\0\0\0\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  280  \x04\x04\0\0\0\xd4\x03\0\0\x85\0\0\0\0\0\0\0\x0a\x0a\0\0\0\0\0\x08\x86\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  281  \x10\x0a\0\0\0\0\0\x08\x1c\0\0\0\0\0\0\0\0\0\0\x02\xbb\0\0\0\0\0\0\0\0\0\0\x02\
786f2c352364ef Benjamin Tissoires 2022-10-25  282  \x89\0\0\0\0\0\0\0\0\0\0\x0a\xb6\0\0\0\0\0\0\0\0\0\0\x02\xbd\0\0\0\0\0\0\0\x02\
786f2c352364ef Benjamin Tissoires 2022-10-25  283  \0\0\x05\x04\0\0\0\x21\x0a\0\0\x8c\0\0\0\0\0\0\0\x29\x0a\0\0\x1c\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  284  \0\0\0\0\0\0\0\x0a\x1c\0\0\0\x33\x0a\0\0\0\0\0\x08\x8e\0\0\0\x39\x0a\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  285  \x08\x50\0\0\0\x48\x0a\0\0\x02\0\0\x04\x10\0\0\0\x53\x0a\0\0\x90\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  286  \x5a\x0a\0\0\x91\0\0\0\x40\0\0\0\x62\x0a\0\0\0\0\0\x08\x5d\0\0\0\x6b\x0a\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  287  \0\0\x01\x08\0\0\0\x40\0\0\x01\x70\x0a\0\0\0\0\0\x08\x76\0\0\0\x79\x0a\0\0\x07\
786f2c352364ef Benjamin Tissoires 2022-10-25  288  \0\0\x04\x98\0\0\0\x86\x0a\0\0\x59\0\0\0\0\0\0\0\xac\x03\0\0\x59\0\0\0\x40\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  289  \0\x8b\x05\0\0\x62\0\0\0\x80\0\0\0\x81\x05\0\0\x61\0\0\0\xc0\0\0\0\x8f\x05\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  290  \x48\0\0\0\xc0\x02\0\0\x9c\x03\0\0\x10\0\0\0\x40\x03\0\0\xb2\x03\0\0\x41\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  291  \x80\x03\0\0\0\0\0\0\0\0\0\x02\xae\0\0\0\0\0\0\0\x02\0\0\x05\x10\0\0\0\x8c\x0a\
786f2c352364ef Benjamin Tissoires 2022-10-25  292  \0\0\x96\0\0\0\0\0\0\0\x95\x0a\0\0\x28\0\0\0\0\0\0\0\x9b\x0a\0\0\x01\0\0\x04\
786f2c352364ef Benjamin Tissoires 2022-10-25  293  \x08\0\0\0\xa6\x0a\0\0\x46\0\0\0\0\0\0\0\0\0\0\0\x02\0\0\x05\x08\0\0\0\xac\x0a\
786f2c352364ef Benjamin Tissoires 2022-10-25  294  \0\0\x30\0\0\0\0\0\0\0\xb2\x0a\0\0\x98\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x02\x99\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  295  \0\0\0\0\0\x01\0\0\x0d\0\0\0\0\0\0\0\0\x2f\0\0\0\0\0\0\0\0\0\0\x02\xb2\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  296  \xbd\x0a\0\0\x0f\0\0\x04\x20\x02\0\0\xcb\x0a\0\0\x2f\0\0\0\0\0\0\0\xd0\x0a\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  297  \x9c\0\0\0\x40\0\0\0\xd8\x0a\0\0\x93\0\0\0\xc0\x02\0\0\xe8\x0a\0\0\x9d\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  298  \x80\x07\0\0\xf1\x0a\0\0\x39\0\0\0\xa0\x07\0\0\x01\x0b\0\0\x9e\0\0\0\xc0\x07\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  299  \0\x08\x0b\0\0\x93\0\0\0\x40\x08\0\0\x15\x0b\0\0\x4c\0\0\0\0\x0d\0\0\x1d\x0b\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  300  \0\x4c\0\0\0\x40\x0d\0\0\x2d\x0b\0\0\xa1\0\0\0\x80\x0d\0\0\x33\x0b\0\0\x4c\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  301  \0\xc0\x0d\0\0\x39\x0b\0\0\x7a\0\0\0\0\x0e\0\0\x40\x0b\0\0\x32\0\0\0\x40\x0e\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  302  \0\x4d\x0b\0\0\x48\0\0\0\x40\x10\0\0\xf7\x02\0\0\x10\0\0\0\xc0\x10\0\0\x5a\x0b\
786f2c352364ef Benjamin Tissoires 2022-10-25  303  \0\0\x03\0\0\x04\x50\0\0\0\x61\x0b\0\0\x32\0\0\0\0\0\0\0\x69\x0b\0\0\x9d\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  304  \0\x02\0\0\x72\x0b\0\0\x10\0\0\0\x40\x02\0\0\x7a\x0b\0\0\0\0\0\x08\x1c\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  305  \x80\x0b\0\0\x02\0\0\x04\x10\0\0\0\x8f\x0b\0\0\x9f\0\0\0\0\0\0\0\x97\x0b\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  306  \xa0\0\0\0\x40\0\0\0\x8f\x0b\0\0\x01\0\0\x04\x08\0\0\0\xa3\x0b\0\0\xa0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  307  \0\0\0\0\0\0\0\0\0\0\x02\xbc\0\0\0\0\0\0\0\0\0\0\x02\xa2\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  308  \x0a\xad\0\0\0\0\0\0\0\x04\0\0\x05\x08\0\0\0\xab\x0b\0\0\xa4\0\0\0\0\0\0\0\xb2\
786f2c352364ef Benjamin Tissoires 2022-10-25  309  \x0b\0\0\xa5\0\0\0\0\0\0\0\xb9\x0b\0\0\xa6\0\0\0\0\0\0\0\xc0\x0b\0\0\x1c\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  310  \0\0\0\0\0\0\0\0\0\0\0\x02\xba\0\0\0\0\0\0\0\0\0\0\x02\xaf\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  311  \x02\x55\0\0\0\0\0\0\0\0\0\0\x02\xb4\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x55\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  312  \x04\0\0\0\x04\0\0\0\xf2\x0b\0\0\0\0\0\x0e\xa8\0\0\0\x01\0\0\0\xfa\x0b\0\0\x01\
786f2c352364ef Benjamin Tissoires 2022-10-25  313  \0\0\x0f\x04\0\0\0\xbf\0\0\0\0\0\0\0\x04\0\0\0\x01\x0c\0\0\x02\0\0\x0f\x40\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  314  \0\x0a\0\0\0\0\0\0\0\x20\0\0\0\x15\0\0\0\x20\0\0\0\x20\0\0\0\x07\x0c\0\0\x01\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  315  \0\x0f\x04\0\0\0\xa9\0\0\0\0\0\0\0\x04\0\0\0\x0f\x0c\0\0\0\0\0\x07\0\0\0\0\x28\
786f2c352364ef Benjamin Tissoires 2022-10-25  316  \x0c\0\0\0\0\0\x07\0\0\0\0\x36\x0c\0\0\0\0\0\x07\0\0\0\0\x3b\x0c\0\0\0\0\0\x07\
786f2c352364ef Benjamin Tissoires 2022-10-25  317  \0\0\0\0\x65\x03\0\0\0\0\0\x07\0\0\0\0\x40\x0c\0\0\0\0\0\x07\0\0\0\0\x52\x0c\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  318  \0\0\0\0\x07\0\0\0\0\x62\x0c\0\0\0\0\0\x07\0\0\0\0\x7a\x0c\0\0\0\0\0\x07\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  319  \0\x85\x0c\0\0\0\0\0\x07\0\0\0\0\x96\x0c\0\0\0\0\0\x07\0\0\0\0\xa5\x0c\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  320  \0\x07\0\0\0\0\xe6\x05\0\0\0\0\0\x07\0\0\0\0\xba\x0c\0\0\0\0\0\x07\0\0\0\0\xca\
786f2c352364ef Benjamin Tissoires 2022-10-25  321  \x0c\0\0\0\0\0\x07\0\0\0\0\xa3\x0b\0\0\0\0\0\x07\0\0\0\0\xd4\x0c\0\0\0\0\0\x07\
786f2c352364ef Benjamin Tissoires 2022-10-25  322  \0\0\0\0\xe0\x0c\0\0\0\0\0\x07\0\0\0\0\xe9\x0c\0\0\0\0\0\x0e\x02\0\0\0\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  323  \0\0\x69\x6e\x74\0\x5f\x5f\x41\x52\x52\x41\x59\x5f\x53\x49\x5a\x45\x5f\x54\x59\
786f2c352364ef Benjamin Tissoires 2022-10-25  324  \x50\x45\x5f\x5f\0\x74\x79\x70\x65\0\x6d\x61\x78\x5f\x65\x6e\x74\x72\x69\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  325  \x73\0\x6b\x65\x79\x5f\x73\x69\x7a\x65\0\x76\x61\x6c\x75\x65\x5f\x73\x69\x7a\
786f2c352364ef Benjamin Tissoires 2022-10-25  326  \x65\0\x68\x69\x64\x5f\x6a\x6d\x70\x5f\x74\x61\x62\x6c\x65\0\x5f\x5f\x75\x38\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  327  \x75\x6e\x73\x69\x67\x6e\x65\x64\x20\x63\x68\x61\x72\0\x6b\x65\x79\0\x76\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  328  \x6c\x75\x65\0\x70\x72\x6f\x67\x73\x5f\x6d\x61\x70\0\x75\x6e\x73\x69\x67\x6e\
786f2c352364ef Benjamin Tissoires 2022-10-25  329  \x65\x64\x20\x6c\x6f\x6e\x67\x20\x6c\x6f\x6e\x67\0\x63\x74\x78\0\x68\x69\x64\
786f2c352364ef Benjamin Tissoires 2022-10-25  330  \x5f\x74\x61\x69\x6c\x5f\x63\x61\x6c\x6c\0\x66\x6d\x6f\x64\x5f\x72\x65\x74\x2f\
786f2c352364ef Benjamin Tissoires 2022-10-25  331  \x5f\x5f\x68\x69\x64\x5f\x62\x70\x66\x5f\x74\x61\x69\x6c\x5f\x63\x61\x6c\x6c\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  332  \x2f\x68\x6f\x6d\x65\x2f\x62\x74\x69\x73\x73\x6f\x69\x72\x2f\x53\x72\x63\x2f\
786f2c352364ef Benjamin Tissoires 2022-10-25  333  \x68\x69\x64\x2f\x64\x72\x69\x76\x65\x72\x73\x2f\x68\x69\x64\x2f\x62\x70\x66\
786f2c352364ef Benjamin Tissoires 2022-10-25  334  \x2f\x65\x6e\x74\x72\x79\x70\x6f\x69\x6e\x74\x73\x2f\x65\x6e\x74\x72\x79\x70\
786f2c352364ef Benjamin Tissoires 2022-10-25  335  \x6f\x69\x6e\x74\x73\x2e\x62\x70\x66\x2e\x63\0\x69\x6e\x74\x20\x42\x50\x46\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  336  \x50\x52\x4f\x47\x28\x68\x69\x64\x5f\x74\x61\x69\x6c\x5f\x63\x61\x6c\x6c\x2c\
786f2c352364ef Benjamin Tissoires 2022-10-25  337  \x20\x73\x74\x72\x75\x63\x74\x20\x68\x69\x64\x5f\x62\x70\x66\x5f\x63\x74\x78\
786f2c352364ef Benjamin Tissoires 2022-10-25  338  \x20\x2a\x68\x63\x74\x78\x29\0\x68\x69\x64\x5f\x62\x70\x66\x5f\x63\x74\x78\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  339  \x69\x6e\x64\x65\x78\0\x68\x69\x64\0\x61\x6c\x6c\x6f\x63\x61\x74\x65\x64\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  340  \x73\x69\x7a\x65\0\x72\x65\x70\x6f\x72\x74\x5f\x74\x79\x70\x65\0\x5f\x5f\x75\
786f2c352364ef Benjamin Tissoires 2022-10-25  341  \x33\x32\0\x75\x6e\x73\x69\x67\x6e\x65\x64\x20\x69\x6e\x74\0\x68\x69\x64\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  342  \x72\x65\x70\x6f\x72\x74\x5f\x74\x79\x70\x65\0\x48\x49\x44\x5f\x49\x4e\x50\x55\
786f2c352364ef Benjamin Tissoires 2022-10-25  343  \x54\x5f\x52\x45\x50\x4f\x52\x54\0\x48\x49\x44\x5f\x4f\x55\x54\x50\x55\x54\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  344  \x52\x45\x50\x4f\x52\x54\0\x48\x49\x44\x5f\x46\x45\x41\x54\x55\x52\x45\x5f\x52\
786f2c352364ef Benjamin Tissoires 2022-10-25  345  \x45\x50\x4f\x52\x54\0\x48\x49\x44\x5f\x52\x45\x50\x4f\x52\x54\x5f\x54\x59\x50\
786f2c352364ef Benjamin Tissoires 2022-10-25  346  \x45\x53\0\x72\x65\x74\x76\x61\x6c\0\x73\x69\x7a\x65\0\x5f\x5f\x73\x33\x32\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  347  \x30\x3a\x30\0\x09\x62\x70\x66\x5f\x74\x61\x69\x6c\x5f\x63\x61\x6c\x6c\x28\x63\
786f2c352364ef Benjamin Tissoires 2022-10-25  348  \x74\x78\x2c\x20\x26\x68\x69\x64\x5f\x6a\x6d\x70\x5f\x74\x61\x62\x6c\x65\x2c\
786f2c352364ef Benjamin Tissoires 2022-10-25  349  \x20\x68\x63\x74\x78\x2d\x3e\x69\x6e\x64\x65\x78\x29\x3b\0\x68\x69\x64\x5f\x70\
786f2c352364ef Benjamin Tissoires 2022-10-25  350  \x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\x73\x65\0\x66\x65\x78\x69\x74\x2f\x62\x70\
786f2c352364ef Benjamin Tissoires 2022-10-25  351  \x66\x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\x73\x65\0\x69\x6e\x74\x20\x42\
786f2c352364ef Benjamin Tissoires 2022-10-25  352  \x50\x46\x5f\x50\x52\x4f\x47\x28\x68\x69\x64\x5f\x70\x72\x6f\x67\x5f\x72\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  353  \x6c\x65\x61\x73\x65\x2c\x20\x73\x74\x72\x75\x63\x74\x20\x69\x6e\x6f\x64\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  354  \x20\x2a\x69\x6e\x6f\x64\x65\x2c\x20\x73\x74\x72\x75\x63\x74\x20\x66\x69\x6c\
786f2c352364ef Benjamin Tissoires 2022-10-25  355  \x65\x20\x2a\x66\x69\x6c\x70\x29\0\x66\x69\x6c\x65\0\x66\x5f\x75\0\x66\x5f\x70\
786f2c352364ef Benjamin Tissoires 2022-10-25  356  \x61\x74\x68\0\x66\x5f\x69\x6e\x6f\x64\x65\0\x66\x5f\x6f\x70\0\x66\x5f\x6c\x6f\
786f2c352364ef Benjamin Tissoires 2022-10-25  357  \x63\x6b\0\x66\x5f\x63\x6f\x75\x6e\x74\0\x66\x5f\x66\x6c\x61\x67\x73\0\x66\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  358  \x6d\x6f\x64\x65\0\x66\x5f\x70\x6f\x73\x5f\x6c\x6f\x63\x6b\0\x66\x5f\x70\x6f\
786f2c352364ef Benjamin Tissoires 2022-10-25  359  \x73\0\x66\x5f\x6f\x77\x6e\x65\x72\0\x66\x5f\x63\x72\x65\x64\0\x66\x5f\x72\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  360  \0\x66\x5f\x76\x65\x72\x73\x69\x6f\x6e\0\x66\x5f\x73\x65\x63\x75\x72\x69\x74\
786f2c352364ef Benjamin Tissoires 2022-10-25  361  \x79\0\x70\x72\x69\x76\x61\x74\x65\x5f\x64\x61\x74\x61\0\x66\x5f\x65\x70\0\x66\
786f2c352364ef Benjamin Tissoires 2022-10-25  362  \x5f\x6d\x61\x70\x70\x69\x6e\x67\0\x66\x5f\x77\x62\x5f\x65\x72\x72\0\x66\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  363  \x73\x62\x5f\x65\x72\x72\0\x66\x75\x5f\x6c\x6c\x69\x73\x74\0\x66\x75\x5f\x72\
786f2c352364ef Benjamin Tissoires 2022-10-25  364  \x63\x75\x68\x65\x61\x64\0\x6c\x6c\x69\x73\x74\x5f\x6e\x6f\x64\x65\0\x6e\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  365  \x78\x74\0\x63\x61\x6c\x6c\x62\x61\x63\x6b\x5f\x68\x65\x61\x64\0\x66\x75\x6e\
786f2c352364ef Benjamin Tissoires 2022-10-25  366  \x63\0\x70\x61\x74\x68\0\x6d\x6e\x74\0\x64\x65\x6e\x74\x72\x79\0\x73\x70\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  367  \x6e\x6c\x6f\x63\x6b\x5f\x74\0\x73\x70\x69\x6e\x6c\x6f\x63\x6b\0\x72\x6c\x6f\
786f2c352364ef Benjamin Tissoires 2022-10-25  368  \x63\x6b\0\x72\x61\x77\x5f\x73\x70\x69\x6e\x6c\x6f\x63\x6b\0\x72\x61\x77\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  369  \x6c\x6f\x63\x6b\0\x6d\x61\x67\x69\x63\0\x6f\x77\x6e\x65\x72\x5f\x63\x70\x75\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  370  \x6f\x77\x6e\x65\x72\0\x64\x65\x70\x5f\x6d\x61\x70\0\x61\x72\x63\x68\x5f\x73\
786f2c352364ef Benjamin Tissoires 2022-10-25  371  \x70\x69\x6e\x6c\x6f\x63\x6b\x5f\x74\0\x71\x73\x70\x69\x6e\x6c\x6f\x63\x6b\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  372  \x76\x61\x6c\0\x61\x74\x6f\x6d\x69\x63\x5f\x74\0\x63\x6f\x75\x6e\x74\x65\x72\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  373  \x6c\x6f\x63\x6b\x65\x64\0\x70\x65\x6e\x64\x69\x6e\x67\0\x75\x38\0\x6c\x6f\x63\
786f2c352364ef Benjamin Tissoires 2022-10-25  374  \x6b\x65\x64\x5f\x70\x65\x6e\x64\x69\x6e\x67\0\x74\x61\x69\x6c\0\x75\x31\x36\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  375  \x5f\x5f\x75\x31\x36\0\x75\x6e\x73\x69\x67\x6e\x65\x64\x20\x73\x68\x6f\x72\x74\
786f2c352364ef Benjamin Tissoires 2022-10-25  376  \0\x6c\x6f\x63\x6b\x64\x65\x70\x5f\x6d\x61\x70\0\x63\x6c\x61\x73\x73\x5f\x63\
786f2c352364ef Benjamin Tissoires 2022-10-25  377  \x61\x63\x68\x65\0\x6e\x61\x6d\x65\0\x77\x61\x69\x74\x5f\x74\x79\x70\x65\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  378  \x6f\x75\x74\x65\x72\0\x77\x61\x69\x74\x5f\x74\x79\x70\x65\x5f\x69\x6e\x6e\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  379  \x72\0\x6c\x6f\x63\x6b\x5f\x74\x79\x70\x65\0\x6c\x6f\x63\x6b\x5f\x63\x6c\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  380  \x73\x73\0\x68\x61\x73\x68\x5f\x65\x6e\x74\x72\x79\0\x6c\x6f\x63\x6b\x5f\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  381  \x6e\x74\x72\x79\0\x6c\x6f\x63\x6b\x73\x5f\x61\x66\x74\x65\x72\0\x6c\x6f\x63\
786f2c352364ef Benjamin Tissoires 2022-10-25  382  \x6b\x73\x5f\x62\x65\x66\x6f\x72\x65\0\x73\x75\x62\x63\x6c\x61\x73\x73\0\x64\
786f2c352364ef Benjamin Tissoires 2022-10-25  383  \x65\x70\x5f\x67\x65\x6e\x5f\x69\x64\0\x75\x73\x61\x67\x65\x5f\x6d\x61\x73\x6b\
786f2c352364ef Benjamin Tissoires 2022-10-25  384  \0\x75\x73\x61\x67\x65\x5f\x74\x72\x61\x63\x65\x73\0\x6e\x61\x6d\x65\x5f\x76\
786f2c352364ef Benjamin Tissoires 2022-10-25  385  \x65\x72\x73\x69\x6f\x6e\0\x68\x6c\x69\x73\x74\x5f\x6e\x6f\x64\x65\0\x70\x70\
786f2c352364ef Benjamin Tissoires 2022-10-25  386  \x72\x65\x76\0\x6c\x69\x73\x74\x5f\x68\x65\x61\x64\0\x70\x72\x65\x76\0\x75\x6e\
786f2c352364ef Benjamin Tissoires 2022-10-25  387  \x73\x69\x67\x6e\x65\x64\x20\x6c\x6f\x6e\x67\0\x6c\x6f\x63\x6b\x5f\x74\x72\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  388  \x63\x65\0\x68\x61\x73\x68\0\x6e\x72\x5f\x65\x6e\x74\x72\x69\x65\x73\0\x65\x6e\
786f2c352364ef Benjamin Tissoires 2022-10-25  389  \x74\x72\x69\x65\x73\0\x75\x33\x32\0\x63\x68\x61\x72\0\x5f\x5f\x70\x61\x64\x64\
786f2c352364ef Benjamin Tissoires 2022-10-25  390  \x69\x6e\x67\0\x61\x74\x6f\x6d\x69\x63\x5f\x6c\x6f\x6e\x67\x5f\x74\0\x61\x74\
786f2c352364ef Benjamin Tissoires 2022-10-25  391  \x6f\x6d\x69\x63\x36\x34\x5f\x74\0\x73\x36\x34\0\x5f\x5f\x73\x36\x34\0\x6c\x6f\
786f2c352364ef Benjamin Tissoires 2022-10-25  392  \x6e\x67\x20\x6c\x6f\x6e\x67\0\x66\x6d\x6f\x64\x65\x5f\x74\0\x6d\x75\x74\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  393  \x78\0\x77\x61\x69\x74\x5f\x6c\x6f\x63\x6b\0\x6f\x73\x71\0\x77\x61\x69\x74\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  394  \x6c\x69\x73\x74\0\x72\x61\x77\x5f\x73\x70\x69\x6e\x6c\x6f\x63\x6b\x5f\x74\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  395  \x6f\x70\x74\x69\x6d\x69\x73\x74\x69\x63\x5f\x73\x70\x69\x6e\x5f\x71\x75\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  396  \x75\x65\0\x6c\x6f\x66\x66\x5f\x74\0\x5f\x5f\x6b\x65\x72\x6e\x65\x6c\x5f\x6c\
786f2c352364ef Benjamin Tissoires 2022-10-25  397  \x6f\x66\x66\x5f\x74\0\x66\x6f\x77\x6e\x5f\x73\x74\x72\x75\x63\x74\0\x6c\x6f\
786f2c352364ef Benjamin Tissoires 2022-10-25  398  \x63\x6b\0\x70\x69\x64\0\x70\x69\x64\x5f\x74\x79\x70\x65\0\x75\x69\x64\0\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  399  \x75\x69\x64\0\x73\x69\x67\x6e\x75\x6d\0\x72\x77\x6c\x6f\x63\x6b\x5f\x74\0\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  400  \x72\x63\x68\x5f\x72\x77\x6c\x6f\x63\x6b\x5f\x74\0\x71\x72\x77\x6c\x6f\x63\x6b\
786f2c352364ef Benjamin Tissoires 2022-10-25  401  \0\x63\x6e\x74\x73\0\x77\x6c\x6f\x63\x6b\x65\x64\0\x5f\x5f\x6c\x73\x74\x61\x74\
786f2c352364ef Benjamin Tissoires 2022-10-25  402  \x65\0\x50\x49\x44\x54\x59\x50\x45\x5f\x50\x49\x44\0\x50\x49\x44\x54\x59\x50\
786f2c352364ef Benjamin Tissoires 2022-10-25  403  \x45\x5f\x54\x47\x49\x44\0\x50\x49\x44\x54\x59\x50\x45\x5f\x50\x47\x49\x44\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  404  \x50\x49\x44\x54\x59\x50\x45\x5f\x53\x49\x44\0\x50\x49\x44\x54\x59\x50\x45\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  405  \x4d\x41\x58\0\x6b\x75\x69\x64\x5f\x74\0\x75\x69\x64\x5f\x74\0\x5f\x5f\x6b\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  406  \x72\x6e\x65\x6c\x5f\x75\x69\x64\x33\x32\x5f\x74\0\x66\x69\x6c\x65\x5f\x72\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  407  \x5f\x73\x74\x61\x74\x65\0\x73\x74\x61\x72\x74\0\x61\x73\x79\x6e\x63\x5f\x73\
786f2c352364ef Benjamin Tissoires 2022-10-25  408  \x69\x7a\x65\0\x72\x61\x5f\x70\x61\x67\x65\x73\0\x6d\x6d\x61\x70\x5f\x6d\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  409  \x73\x73\0\x70\x72\x65\x76\x5f\x70\x6f\x73\0\x75\x36\x34\0\x5f\x5f\x75\x36\x34\
786f2c352364ef Benjamin Tissoires 2022-10-25  410  \0\x65\x72\x72\x73\x65\x71\x5f\x74\0\x30\x3a\x31\x35\0\x09\x75\x36\x34\x20\x70\
786f2c352364ef Benjamin Tissoires 2022-10-25  411  \x72\x6f\x67\x20\x3d\x20\x28\x75\x36\x34\x29\x66\x69\x6c\x70\x2d\x3e\x70\x72\
786f2c352364ef Benjamin Tissoires 2022-10-25  412  \x69\x76\x61\x74\x65\x5f\x64\x61\x74\x61\x3b\0\x09\x76\x61\x6c\x75\x65\x20\x3d\
786f2c352364ef Benjamin Tissoires 2022-10-25  413  \x20\x62\x70\x66\x5f\x6d\x61\x70\x5f\x6c\x6f\x6f\x6b\x75\x70\x5f\x65\x6c\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  414  \x6d\x28\x26\x70\x72\x6f\x67\x73\x5f\x6d\x61\x70\x2c\x20\x26\x70\x72\x6f\x67\
786f2c352364ef Benjamin Tissoires 2022-10-25  415  \x29\x3b\0\x09\x69\x66\x20\x28\x21\x76\x61\x6c\x75\x65\x29\0\x09\x69\x66\x20\
786f2c352364ef Benjamin Tissoires 2022-10-25  416  \x28\x63\x61\x6c\x6c\x5f\x68\x69\x64\x5f\x62\x70\x66\x5f\x70\x72\x6f\x67\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  417  \x72\x65\x6c\x65\x61\x73\x65\x28\x70\x72\x6f\x67\x2c\x20\x2a\x76\x61\x6c\x75\
786f2c352364ef Benjamin Tissoires 2022-10-25  418  \x65\x29\x29\0\x09\x09\x62\x70\x66\x5f\x6d\x61\x70\x5f\x64\x65\x6c\x65\x74\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  419  \x5f\x65\x6c\x65\x6d\x28\x26\x70\x72\x6f\x67\x73\x5f\x6d\x61\x70\x2c\x20\x26\
786f2c352364ef Benjamin Tissoires 2022-10-25  420  \x70\x72\x6f\x67\x29\x3b\0\x62\x6f\x6f\x6c\0\x5f\x42\x6f\x6f\x6c\0\x63\x61\x6c\
786f2c352364ef Benjamin Tissoires 2022-10-25  421  \x6c\x5f\x68\x69\x64\x5f\x62\x70\x66\x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  422  \x61\x73\x65\0\x68\x69\x64\x5f\x66\x72\x65\x65\x5f\x69\x6e\x6f\x64\x65\0\x66\
786f2c352364ef Benjamin Tissoires 2022-10-25  423  \x65\x78\x69\x74\x2f\x62\x70\x66\x5f\x66\x72\x65\x65\x5f\x69\x6e\x6f\x64\x65\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  424  \x69\x6e\x74\x20\x42\x50\x46\x5f\x50\x52\x4f\x47\x28\x68\x69\x64\x5f\x66\x72\
786f2c352364ef Benjamin Tissoires 2022-10-25  425  \x65\x65\x5f\x69\x6e\x6f\x64\x65\x2c\x20\x73\x74\x72\x75\x63\x74\x20\x69\x6e\
786f2c352364ef Benjamin Tissoires 2022-10-25  426  \x6f\x64\x65\x20\x2a\x69\x6e\x6f\x64\x65\x29\0\x69\x6e\x6f\x64\x65\0\x69\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  427  \x6d\x6f\x64\x65\0\x69\x5f\x6f\x70\x66\x6c\x61\x67\x73\0\x69\x5f\x75\x69\x64\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  428  \x69\x5f\x67\x69\x64\0\x69\x5f\x66\x6c\x61\x67\x73\0\x69\x5f\x61\x63\x6c\0\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  429  \x5f\x64\x65\x66\x61\x75\x6c\x74\x5f\x61\x63\x6c\0\x69\x5f\x6f\x70\0\x69\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  430  \x73\x62\0\x69\x5f\x6d\x61\x70\x70\x69\x6e\x67\0\x69\x5f\x73\x65\x63\x75\x72\
786f2c352364ef Benjamin Tissoires 2022-10-25  431  \x69\x74\x79\0\x69\x5f\x69\x6e\x6f\0\x69\x5f\x72\x64\x65\x76\0\x69\x5f\x73\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  432  \x7a\x65\0\x69\x5f\x61\x74\x69\x6d\x65\0\x69\x5f\x6d\x74\x69\x6d\x65\0\x69\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  433  \x63\x74\x69\x6d\x65\0\x69\x5f\x6c\x6f\x63\x6b\0\x69\x5f\x62\x79\x74\x65\x73\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  434  \x69\x5f\x62\x6c\x6b\x62\x69\x74\x73\0\x69\x5f\x77\x72\x69\x74\x65\x5f\x68\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  435  \x6e\x74\0\x69\x5f\x62\x6c\x6f\x63\x6b\x73\0\x69\x5f\x73\x74\x61\x74\x65\0\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  436  \x5f\x72\x77\x73\x65\x6d\0\x64\x69\x72\x74\x69\x65\x64\x5f\x77\x68\x65\x6e\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  437  \x64\x69\x72\x74\x69\x65\x64\x5f\x74\x69\x6d\x65\x5f\x77\x68\x65\x6e\0\x69\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  438  \x68\x61\x73\x68\0\x69\x5f\x69\x6f\x5f\x6c\x69\x73\x74\0\x69\x5f\x77\x62\0\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  439  \x5f\x77\x62\x5f\x66\x72\x6e\x5f\x77\x69\x6e\x6e\x65\x72\0\x69\x5f\x77\x62\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  440  \x66\x72\x6e\x5f\x61\x76\x67\x5f\x74\x69\x6d\x65\0\x69\x5f\x77\x62\x5f\x66\x72\
786f2c352364ef Benjamin Tissoires 2022-10-25  441  \x6e\x5f\x68\x69\x73\x74\x6f\x72\x79\0\x69\x5f\x6c\x72\x75\0\x69\x5f\x73\x62\
786f2c352364ef Benjamin Tissoires 2022-10-25  442  \x5f\x6c\x69\x73\x74\0\x69\x5f\x77\x62\x5f\x6c\x69\x73\x74\0\x69\x5f\x76\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  443  \x72\x73\x69\x6f\x6e\0\x69\x5f\x73\x65\x71\x75\x65\x6e\x63\x65\0\x69\x5f\x63\
786f2c352364ef Benjamin Tissoires 2022-10-25  444  \x6f\x75\x6e\x74\0\x69\x5f\x64\x69\x6f\x5f\x63\x6f\x75\x6e\x74\0\x69\x5f\x77\
786f2c352364ef Benjamin Tissoires 2022-10-25  445  \x72\x69\x74\x65\x63\x6f\x75\x6e\x74\0\x69\x5f\x72\x65\x61\x64\x63\x6f\x75\x6e\
786f2c352364ef Benjamin Tissoires 2022-10-25  446  \x74\0\x69\x5f\x66\x6c\x63\x74\x78\0\x69\x5f\x64\x61\x74\x61\0\x69\x5f\x64\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  447  \x76\x69\x63\x65\x73\0\x69\x5f\x67\x65\x6e\x65\x72\x61\x74\x69\x6f\x6e\0\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  448  \x5f\x66\x73\x6e\x6f\x74\x69\x66\x79\x5f\x6d\x61\x73\x6b\0\x69\x5f\x66\x73\x6e\
786f2c352364ef Benjamin Tissoires 2022-10-25  449  \x6f\x74\x69\x66\x79\x5f\x6d\x61\x72\x6b\x73\0\x69\x5f\x70\x72\x69\x76\x61\x74\
786f2c352364ef Benjamin Tissoires 2022-10-25  450  \x65\0\x75\x6d\x6f\x64\x65\x5f\x74\0\x6b\x67\x69\x64\x5f\x74\0\x67\x69\x64\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  451  \x74\0\x5f\x5f\x6b\x65\x72\x6e\x65\x6c\x5f\x67\x69\x64\x33\x32\x5f\x74\0\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  452  \x5f\x6e\x6c\x69\x6e\x6b\0\x5f\x5f\x69\x5f\x6e\x6c\x69\x6e\x6b\0\x64\x65\x76\
786f2c352364ef Benjamin Tissoires 2022-10-25  453  \x5f\x74\0\x5f\x5f\x6b\x65\x72\x6e\x65\x6c\x5f\x64\x65\x76\x5f\x74\0\x74\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  454  \x6d\x65\x73\x70\x65\x63\x36\x34\0\x74\x76\x5f\x73\x65\x63\0\x74\x76\x5f\x6e\
786f2c352364ef Benjamin Tissoires 2022-10-25  455  \x73\x65\x63\0\x74\x69\x6d\x65\x36\x34\x5f\x74\0\x6c\x6f\x6e\x67\0\x62\x6c\x6b\
786f2c352364ef Benjamin Tissoires 2022-10-25  456  \x63\x6e\x74\x5f\x74\0\x72\x77\x5f\x73\x65\x6d\x61\x70\x68\x6f\x72\x65\0\x63\
786f2c352364ef Benjamin Tissoires 2022-10-25  457  \x6f\x75\x6e\x74\0\x69\x5f\x64\x65\x6e\x74\x72\x79\0\x69\x5f\x72\x63\x75\0\x68\
786f2c352364ef Benjamin Tissoires 2022-10-25  458  \x6c\x69\x73\x74\x5f\x68\x65\x61\x64\0\x66\x69\x72\x73\x74\0\x69\x5f\x66\x6f\
786f2c352364ef Benjamin Tissoires 2022-10-25  459  \x70\0\x66\x72\x65\x65\x5f\x69\x6e\x6f\x64\x65\0\x61\x64\x64\x72\x65\x73\x73\
786f2c352364ef Benjamin Tissoires 2022-10-25  460  \x5f\x73\x70\x61\x63\x65\0\x68\x6f\x73\x74\0\x69\x5f\x70\x61\x67\x65\x73\0\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  461  \x6e\x76\x61\x6c\x69\x64\x61\x74\x65\x5f\x6c\x6f\x63\x6b\0\x67\x66\x70\x5f\x6d\
786f2c352364ef Benjamin Tissoires 2022-10-25  462  \x61\x73\x6b\0\x69\x5f\x6d\x6d\x61\x70\x5f\x77\x72\x69\x74\x61\x62\x6c\x65\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  463  \x69\x5f\x6d\x6d\x61\x70\0\x69\x5f\x6d\x6d\x61\x70\x5f\x72\x77\x73\x65\x6d\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  464  \x6e\x72\x70\x61\x67\x65\x73\0\x77\x72\x69\x74\x65\x62\x61\x63\x6b\x5f\x69\x6e\
786f2c352364ef Benjamin Tissoires 2022-10-25  465  \x64\x65\x78\0\x61\x5f\x6f\x70\x73\0\x66\x6c\x61\x67\x73\0\x77\x62\x5f\x65\x72\
786f2c352364ef Benjamin Tissoires 2022-10-25  466  \x72\0\x70\x72\x69\x76\x61\x74\x65\x5f\x6c\x6f\x63\x6b\0\x70\x72\x69\x76\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  467  \x74\x65\x5f\x6c\x69\x73\x74\0\x78\x61\x72\x72\x61\x79\0\x78\x61\x5f\x6c\x6f\
786f2c352364ef Benjamin Tissoires 2022-10-25  468  \x63\x6b\0\x78\x61\x5f\x66\x6c\x61\x67\x73\0\x78\x61\x5f\x68\x65\x61\x64\0\x67\
786f2c352364ef Benjamin Tissoires 2022-10-25  469  \x66\x70\x5f\x74\0\x72\x62\x5f\x72\x6f\x6f\x74\x5f\x63\x61\x63\x68\x65\x64\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  470  \x72\x62\x5f\x72\x6f\x6f\x74\0\x72\x62\x5f\x6c\x65\x66\x74\x6d\x6f\x73\x74\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  471  \x72\x62\x5f\x6e\x6f\x64\x65\0\x69\x5f\x70\x69\x70\x65\0\x69\x5f\x63\x64\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  472  \x76\0\x69\x5f\x6c\x69\x6e\x6b\0\x69\x5f\x64\x69\x72\x5f\x73\x65\x71\0\x30\x3a\
786f2c352364ef Benjamin Tissoires 2022-10-25  473  \x35\x31\0\x09\x75\x36\x34\x20\x70\x72\x6f\x67\x20\x3d\x20\x28\x75\x36\x34\x29\
786f2c352364ef Benjamin Tissoires 2022-10-25  474  \x69\x6e\x6f\x64\x65\x2d\x3e\x69\x5f\x70\x72\x69\x76\x61\x74\x65\x3b\0\x4c\x49\
786f2c352364ef Benjamin Tissoires 2022-10-25  475  \x43\x45\x4e\x53\x45\0\x2e\x6b\x73\x79\x6d\x73\0\x2e\x6d\x61\x70\x73\0\x6c\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  476  \x63\x65\x6e\x73\x65\0\x61\x64\x64\x72\x65\x73\x73\x5f\x73\x70\x61\x63\x65\x5f\
786f2c352364ef Benjamin Tissoires 2022-10-25  477  \x6f\x70\x65\x72\x61\x74\x69\x6f\x6e\x73\0\x62\x64\x69\x5f\x77\x72\x69\x74\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  478  \x62\x61\x63\x6b\0\x63\x64\x65\x76\0\x63\x72\x65\x64\0\x66\x69\x6c\x65\x5f\x6c\
786f2c352364ef Benjamin Tissoires 2022-10-25  479  \x6f\x63\x6b\x5f\x63\x6f\x6e\x74\x65\x78\x74\0\x66\x69\x6c\x65\x5f\x6f\x70\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  480  \x72\x61\x74\x69\x6f\x6e\x73\0\x66\x73\x6e\x6f\x74\x69\x66\x79\x5f\x6d\x61\x72\
786f2c352364ef Benjamin Tissoires 2022-10-25  481  \x6b\x5f\x63\x6f\x6e\x6e\x65\x63\x74\x6f\x72\0\x68\x69\x64\x5f\x64\x65\x76\x69\
786f2c352364ef Benjamin Tissoires 2022-10-25  482  \x63\x65\0\x69\x6e\x6f\x64\x65\x5f\x6f\x70\x65\x72\x61\x74\x69\x6f\x6e\x73\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  483  \x6c\x6f\x63\x6b\x5f\x63\x6c\x61\x73\x73\x5f\x6b\x65\x79\0\x6c\x6f\x63\x6b\x64\
786f2c352364ef Benjamin Tissoires 2022-10-25  484  \x65\x70\x5f\x73\x75\x62\x63\x6c\x61\x73\x73\x5f\x6b\x65\x79\0\x70\x69\x70\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  485  \x5f\x69\x6e\x6f\x64\x65\x5f\x69\x6e\x66\x6f\0\x70\x6f\x73\x69\x78\x5f\x61\x63\
786f2c352364ef Benjamin Tissoires 2022-10-25  486  \x6c\0\x73\x75\x70\x65\x72\x5f\x62\x6c\x6f\x63\x6b\0\x76\x66\x73\x6d\x6f\x75\
786f2c352364ef Benjamin Tissoires 2022-10-25  487  \x6e\x74\0\x64\x75\x6d\x6d\x79\x5f\x6b\x73\x79\x6d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  488  \0\0\0\0\0\0\0\x84\x21\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\x04\0\0\0\x04\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  489  \0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x68\x69\x64\x5f\x6a\x6d\x70\x5f\x74\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  490  \x62\x6c\x65\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\
786f2c352364ef Benjamin Tissoires 2022-10-25  491  \0\0\0\x08\0\0\0\x01\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x70\x72\x6f\x67\
786f2c352364ef Benjamin Tissoires 2022-10-25  492  \x73\x5f\x6d\x61\x70\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x10\0\0\0\x12\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  493  \0\0\0\0\0\0\0\0\x47\x50\x4c\0\0\0\0\0\x79\x12\0\0\0\0\0\0\x61\x23\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  494  \x18\x52\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x85\0\0\0\x0c\0\0\0\xb7\0\0\0\0\0\0\0\x95\
786f2c352364ef Benjamin Tissoires 2022-10-25  495  \0\0\0\0\0\0\0\0\0\0\0\x19\0\0\0\0\0\0\0\xb5\0\0\0\xfa\0\0\0\x05\x6c\0\0\x01\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  496  \0\0\xb5\0\0\0\xe1\x01\0\0\x02\x74\0\0\x05\0\0\0\xb5\0\0\0\xfa\0\0\0\x05\x6c\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  497  \0\x08\0\0\0\x1a\0\0\0\xdd\x01\0\0\0\0\0\0\x1a\0\0\0\x07\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  498  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x68\x69\x64\
786f2c352364ef Benjamin Tissoires 2022-10-25  499  \x5f\x74\x61\x69\x6c\x5f\x63\x61\x6c\x6c\0\0\0\0\0\0\0\x1a\0\0\0\0\0\0\0\x08\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  500  \0\0\0\0\0\0\0\0\0\0\x01\0\0\0\x10\0\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\x01\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  501  \0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x5f\x5f\x68\
786f2c352364ef Benjamin Tissoires 2022-10-25  502  \x69\x64\x5f\x62\x70\x66\x5f\x74\x61\x69\x6c\x5f\x63\x61\x6c\x6c\0\0\0\0\0\x47\
786f2c352364ef Benjamin Tissoires 2022-10-25  503  \x50\x4c\0\0\0\0\0\x79\x11\x08\0\0\0\0\0\x79\x11\xa8\x01\0\0\0\0\x7b\x1a\xf8\
786f2c352364ef Benjamin Tissoires 2022-10-25  504  \xff\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\xf8\xff\xff\xff\x18\x51\0\0\x01\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  505  \0\0\0\0\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\x15\0\x09\0\0\0\0\0\x71\x02\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  506  \0\x79\xa1\xf8\xff\0\0\0\0\x85\x20\0\0\0\0\0\0\x15\0\x05\0\0\0\0\0\xbf\xa2\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  507  \0\0\0\0\x07\x02\0\0\xf8\xff\xff\xff\x18\x51\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\x85\
786f2c352364ef Benjamin Tissoires 2022-10-25  508  \0\0\0\x03\0\0\0\xb7\0\0\0\0\0\0\0\x95\0\0\0\0\0\0\0\0\0\0\0\x23\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  509  \xb5\0\0\0\x3b\x02\0\0\x05\xbc\0\0\x01\0\0\0\xb5\0\0\0\xe7\x06\0\0\x18\xc4\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  510  \x04\0\0\0\xb5\0\0\0\0\0\0\0\0\0\0\0\x05\0\0\0\xb5\0\0\0\x0c\x07\0\0\x0a\x98\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  511  \0\x08\0\0\0\xb5\0\0\0\x3d\x07\0\0\x06\x9c\0\0\x09\0\0\0\xb5\0\0\0\x4a\x07\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  512  \x26\xa8\0\0\x0a\0\0\0\xb5\0\0\0\x4a\x07\0\0\x20\xa8\0\0\x0b\0\0\0\xb5\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  513  \x4a\x07\0\0\x06\xa8\0\0\x0c\0\0\0\xb5\0\0\0\x4a\x07\0\0\x06\xa8\0\0\x0e\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  514  \xb5\0\0\0\0\0\0\0\0\0\0\0\x0f\0\0\0\xb5\0\0\0\x78\x07\0\0\x03\xac\0\0\x12\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  515  \0\xb5\0\0\0\x3b\x02\0\0\x05\xbc\0\0\x08\0\0\0\x24\0\0\0\xe2\x06\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  516  \x1a\0\0\0\x14\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  517  \0\0\0\0\0\0\0\0\0\0\0\x68\x69\x64\x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  518  \x73\0\0\0\0\0\x19\0\0\0\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\x10\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  519  \0\0\0\0\0\0\0\0\x0c\0\0\0\x01\0\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  520  \0\0\0\0\x10\0\0\0\0\0\0\0\x62\x70\x66\x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\
786f2c352364ef Benjamin Tissoires 2022-10-25  521  \x61\x73\x65\0\0\0\0\0\0\0\0\x63\x61\x6c\x6c\x5f\x68\x69\x64\x5f\x62\x70\x66\
786f2c352364ef Benjamin Tissoires 2022-10-25  522  \x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\x73\x65\0\0\0\0\0\0\0\x47\x50\x4c\
786f2c352364ef Benjamin Tissoires 2022-10-25  523  \0\0\0\0\0\x79\x11\0\0\0\0\0\0\x79\x11\x70\x04\0\0\0\0\x7b\x1a\xf8\xff\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  524  \xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\xf8\xff\xff\xff\x18\x51\0\0\x01\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  525  \0\0\0\0\x85\0\0\0\x01\0\0\0\x15\0\x09\0\0\0\0\0\x71\x02\0\0\0\0\0\0\x79\xa1\
786f2c352364ef Benjamin Tissoires 2022-10-25  526  \xf8\xff\0\0\0\0\x85\x20\0\0\0\0\0\0\x15\0\x05\0\0\0\0\0\xbf\xa2\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  527  \x07\x02\0\0\xf8\xff\xff\xff\x18\x51\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\x85\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  528  \x03\0\0\0\xb7\0\0\0\0\0\0\0\x95\0\0\0\0\0\0\0\0\0\0\0\x80\0\0\0\0\0\0\0\xb5\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  529  \0\0\xeb\x07\0\0\x05\xe4\0\0\x01\0\0\0\xb5\0\0\0\xcf\x0b\0\0\x19\xec\0\0\x04\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  530  \0\0\xb5\0\0\0\0\0\0\0\0\0\0\0\x05\0\0\0\xb5\0\0\0\x0c\x07\0\0\x0a\x98\0\0\x08\
786f2c352364ef Benjamin Tissoires 2022-10-25  531  \0\0\0\xb5\0\0\0\x3d\x07\0\0\x06\x9c\0\0\x09\0\0\0\xb5\0\0\0\x4a\x07\0\0\x26\
786f2c352364ef Benjamin Tissoires 2022-10-25  532  \xa8\0\0\x0a\0\0\0\xb5\0\0\0\x4a\x07\0\0\x20\xa8\0\0\x0b\0\0\0\xb5\0\0\0\x4a\
786f2c352364ef Benjamin Tissoires 2022-10-25  533  \x07\0\0\x06\xa8\0\0\x0c\0\0\0\xb5\0\0\0\x4a\x07\0\0\x06\xa8\0\0\x0e\0\0\0\xb5\
786f2c352364ef Benjamin Tissoires 2022-10-25  534  \0\0\0\0\0\0\0\0\0\0\0\x0f\0\0\0\xb5\0\0\0\x78\x07\0\0\x03\xac\0\0\x12\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  535  \xb5\0\0\0\xeb\x07\0\0\x05\xe4\0\0\x08\0\0\0\x81\0\0\0\xca\x0b\0\0\0\0\0\0\x1a\
786f2c352364ef Benjamin Tissoires 2022-10-25  536  \0\0\0\x14\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  537  \0\0\0\0\0\0\0\0\0\x68\x69\x64\x5f\x66\x72\x65\x65\x5f\x69\x6e\x6f\x64\x65\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  538  \0\0\0\0\x19\0\0\0\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\x10\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  539  \0\0\0\0\0\x0c\0\0\0\x01\0\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  540  \0\x10\0\0\0\0\0\0\0\x62\x70\x66\x5f\x66\x72\x65\x65\x5f\x69\x6e\x6f\x64\x65\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  541  \0\x63\x61\x6c\x6c\x5f\x68\x69\x64\x5f\x62\x70\x66\x5f\x70\x72\x6f\x67\x5f\x72\
786f2c352364ef Benjamin Tissoires 2022-10-25 @542  \x65\x6c\x65\x61\x73\x65\0\0\0\0\0\0\0";
786f2c352364ef Benjamin Tissoires 2022-10-25  543  	opts.insns_sz = 3152;
786f2c352364ef Benjamin Tissoires 2022-10-25  544  	opts.insns = (void *)"\
786f2c352364ef Benjamin Tissoires 2022-10-25  545  \xbf\x16\0\0\0\0\0\0\xbf\xa1\0\0\0\0\0\0\x07\x01\0\0\x78\xff\xff\xff\xb7\x02\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  546  \0\x88\0\0\0\xb7\x03\0\0\0\0\0\0\x85\0\0\0\x71\0\0\0\x05\0\x1d\0\0\0\0\0\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  547  \xa1\x78\xff\0\0\0\0\xd5\x01\x01\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\x61\xa1\x7c\xff\
786f2c352364ef Benjamin Tissoires 2022-10-25  548  \0\0\0\0\xd5\x01\x01\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\x61\xa1\x80\xff\0\0\0\0\xd5\
786f2c352364ef Benjamin Tissoires 2022-10-25  549  \x01\x01\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\x61\xa1\x84\xff\0\0\0\0\xd5\x01\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  550  \0\0\0\x85\0\0\0\xa8\0\0\0\x61\xa1\x88\xff\0\0\0\0\xd5\x01\x01\0\0\0\0\0\x85\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  551  \0\0\xa8\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x61\x01\0\0\0\0\0\0\xd5\x01\
786f2c352364ef Benjamin Tissoires 2022-10-25  552  \x02\0\0\0\0\0\xbf\x19\0\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\x18\x60\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  553  \0\0\x04\0\0\0\x61\x01\0\0\0\0\0\0\xd5\x01\x02\0\0\0\0\0\xbf\x19\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  554  \x85\0\0\0\xa8\0\0\0\xbf\x70\0\0\0\0\0\0\x95\0\0\0\0\0\0\0\x61\x60\x08\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  555  \0\x18\x61\0\0\0\0\0\0\0\0\0\0\xa0\x26\0\0\x63\x01\0\0\0\0\0\0\x61\x60\x0c\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  556  \0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x9c\x26\0\0\x63\x01\0\0\0\0\0\0\x79\x60\x10\
786f2c352364ef Benjamin Tissoires 2022-10-25  557  \0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x90\x26\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\
786f2c352364ef Benjamin Tissoires 2022-10-25  558  \0\0\0\0\0\0\0\0\0\0\0\x05\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x88\x26\0\0\x7b\x01\
786f2c352364ef Benjamin Tissoires 2022-10-25  559  \0\0\0\0\0\0\xb7\x01\0\0\x12\0\0\0\x18\x62\0\0\0\0\0\0\0\0\0\0\x88\x26\0\0\xb7\
786f2c352364ef Benjamin Tissoires 2022-10-25  560  \x03\0\0\x1c\0\0\0\x85\0\0\0\xa6\0\0\0\xbf\x07\0\0\0\0\0\0\xc5\x07\xcb\xff\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  561  \0\0\x63\x7a\x78\xff\0\0\0\0\x61\x60\x1c\0\0\0\0\0\x15\0\x03\0\0\0\0\0\x18\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  562  \0\0\0\0\0\0\0\0\0\0\xb4\x26\0\0\x63\x01\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x18\
786f2c352364ef Benjamin Tissoires 2022-10-25  563  \x62\0\0\0\0\0\0\0\0\0\0\xa8\x26\0\0\xb7\x03\0\0\x48\0\0\0\x85\0\0\0\xa6\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  564  \xbf\x07\0\0\0\0\0\0\xc5\x07\xbe\xff\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  565  \0\x63\x71\0\0\0\0\0\0\x61\xa0\x78\xff\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x20\
786f2c352364ef Benjamin Tissoires 2022-10-25  566  \x27\0\0\x63\x01\0\0\0\0\0\0\x61\x60\x2c\0\0\0\0\0\x15\0\x03\0\0\0\0\0\x18\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  567  \0\0\0\0\0\0\0\0\0\0\xfc\x26\0\0\x63\x01\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x18\
786f2c352364ef Benjamin Tissoires 2022-10-25  568  \x62\0\0\0\0\0\0\0\0\0\0\xf0\x26\0\0\xb7\x03\0\0\x48\0\0\0\x85\0\0\0\xa6\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  569  \xbf\x07\0\0\0\0\0\0\xc5\x07\xab\xff\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x04\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  570  \0\0\x63\x71\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x38\x27\0\0\x18\x61\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  571  \0\0\0\0\0\0\0\xd0\x27\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x40\
786f2c352364ef Benjamin Tissoires 2022-10-25  572  \x27\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xc8\x27\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  573  \0\0\0\0\0\0\0\0\0\x78\x27\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x10\x28\0\0\x7b\x01\
786f2c352364ef Benjamin Tissoires 2022-10-25  574  \0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x80\x27\0\0\x18\x61\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  575  \0\x20\x28\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xb0\x27\0\0\x18\
786f2c352364ef Benjamin Tissoires 2022-10-25  576  \x61\0\0\0\0\0\0\0\0\0\0\x40\x28\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  577  \0\0\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x38\x28\0\0\x7b\x01\0\0\0\0\0\0\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  578  \x60\x08\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xd8\x27\0\0\x63\x01\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  579  \x61\x60\x0c\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xdc\x27\0\0\x63\x01\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  580  \0\0\x79\x60\x10\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xe0\x27\0\0\x7b\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  581  \0\0\0\0\x61\xa0\x78\xff\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x08\x28\0\0\x63\
786f2c352364ef Benjamin Tissoires 2022-10-25  582  \x01\0\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x50\x28\0\0\xb7\x02\0\0\x14\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  583  \xb7\x03\0\0\x0c\0\0\0\xb7\x04\0\0\0\0\0\0\x85\0\0\0\xa7\0\0\0\xbf\x07\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  584  \0\0\xc5\x07\x72\xff\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xc0\x27\0\0\x63\x70\
786f2c352364ef Benjamin Tissoires 2022-10-25  585  \x6c\0\0\0\0\0\x77\x07\0\0\x20\0\0\0\x63\x70\x70\0\0\0\0\0\xb7\x01\0\0\x05\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  586  \0\x18\x62\0\0\0\0\0\0\0\0\0\0\xc0\x27\0\0\xb7\x03\0\0\x8c\0\0\0\x85\0\0\0\xa6\
786f2c352364ef Benjamin Tissoires 2022-10-25  587  \0\0\0\xbf\x07\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x30\x28\0\0\x61\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  588  \0\0\0\0\xd5\x01\x02\0\0\0\0\0\xbf\x19\0\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\xc5\x07\
786f2c352364ef Benjamin Tissoires 2022-10-25  589  \x60\xff\0\0\0\0\x63\x7a\x80\xff\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x68\x28\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  590  \0\x18\x61\0\0\0\0\0\0\0\0\0\0\xf8\x29\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  591  \0\0\0\0\0\0\x70\x28\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xf0\x29\0\0\x7b\x01\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  592  \0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x10\x29\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x38\
786f2c352364ef Benjamin Tissoires 2022-10-25  593  \x2a\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x18\x29\0\0\x18\x61\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  594  \0\0\0\0\0\0\0\0\0\x48\x2a\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  595  \xd8\x29\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x68\x2a\0\0\x7b\x01\0\0\0\0\0\0\x18\
786f2c352364ef Benjamin Tissoires 2022-10-25  596  \x60\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x60\x2a\0\0\x7b\
786f2c352364ef Benjamin Tissoires 2022-10-25  597  \x01\0\0\0\0\0\0\x61\x60\x08\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\0\x2a\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  598  \x63\x01\0\0\0\0\0\0\x61\x60\x0c\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x04\x2a\
786f2c352364ef Benjamin Tissoires 2022-10-25  599  \0\0\x63\x01\0\0\0\0\0\0\x79\x60\x10\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x08\
786f2c352364ef Benjamin Tissoires 2022-10-25  600  \x2a\0\0\x7b\x01\0\0\0\0\0\0\x61\xa0\x78\xff\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  601  \0\x30\x2a\0\0\x63\x01\0\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x78\x2a\0\0\xb7\
786f2c352364ef Benjamin Tissoires 2022-10-25  602  \x02\0\0\x11\0\0\0\xb7\x03\0\0\x0c\0\0\0\xb7\x04\0\0\0\0\0\0\x85\0\0\0\xa7\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  603  \0\xbf\x07\0\0\0\0\0\0\xc5\x07\x29\xff\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xe8\
786f2c352364ef Benjamin Tissoires 2022-10-25  604  \x29\0\0\x63\x70\x6c\0\0\0\0\0\x77\x07\0\0\x20\0\0\0\x63\x70\x70\0\0\0\0\0\x18\
786f2c352364ef Benjamin Tissoires 2022-10-25  605  \x68\0\0\0\0\0\0\0\0\0\0\xc8\x28\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x90\x2a\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  606  \xb7\x02\0\0\x1a\0\0\0\xb7\x03\0\0\x0c\0\0\0\xb7\x04\0\0\0\0\0\0\x85\0\0\0\xa7\
786f2c352364ef Benjamin Tissoires 2022-10-25  607  \0\0\0\xbf\x07\0\0\0\0\0\0\xc5\x07\x1a\xff\0\0\0\0\x75\x07\x03\0\0\0\0\0\x62\
786f2c352364ef Benjamin Tissoires 2022-10-25  608  \x08\x04\0\0\0\0\0\x6a\x08\x02\0\0\0\0\0\x05\0\x0a\0\0\0\0\0\x63\x78\x04\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  609  \0\0\xbf\x79\0\0\0\0\0\0\x77\x09\0\0\x20\0\0\0\x55\x09\x02\0\0\0\0\0\x6a\x08\
786f2c352364ef Benjamin Tissoires 2022-10-25  610  \x02\0\0\0\0\0\x05\0\x04\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\x63\
786f2c352364ef Benjamin Tissoires 2022-10-25  611  \x90\0\0\0\0\0\0\x6a\x08\x02\0\x40\0\0\0\xb7\x01\0\0\x05\0\0\0\x18\x62\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  612  \0\0\0\0\0\0\xe8\x29\0\0\xb7\x03\0\0\x8c\0\0\0\x85\0\0\0\xa6\0\0\0\xbf\x07\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  613  \0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\x61\x01\0\0\0\0\0\0\xd5\x01\x02\
786f2c352364ef Benjamin Tissoires 2022-10-25  614  \0\0\0\0\0\xbf\x19\0\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  615  \x58\x2a\0\0\x61\x01\0\0\0\0\0\0\xd5\x01\x02\0\0\0\0\0\xbf\x19\0\0\0\0\0\0\x85\
786f2c352364ef Benjamin Tissoires 2022-10-25  616  \0\0\0\xa8\0\0\0\xc5\x07\xf9\xfe\0\0\0\0\x63\x7a\x84\xff\0\0\0\0\x18\x60\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  617  \0\0\0\0\0\0\0\xb0\x2a\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x40\x2c\0\0\x7b\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  618  \0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xb8\x2a\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  619  \x38\x2c\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x58\x2b\0\0\x18\
786f2c352364ef Benjamin Tissoires 2022-10-25  620  \x61\0\0\0\0\0\0\0\0\0\0\x80\x2c\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  621  \0\0\0\x60\x2b\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x90\x2c\0\0\x7b\x01\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  622  \x18\x60\0\0\0\0\0\0\0\0\0\0\x20\x2c\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xb0\x2c\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  623  \0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x18\x61\0\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  624  \0\0\0\0\xa8\x2c\0\0\x7b\x01\0\0\0\0\0\0\x61\x60\x08\0\0\0\0\0\x18\x61\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  625  \0\0\0\0\0\0\x48\x2c\0\0\x63\x01\0\0\0\0\0\0\x61\x60\x0c\0\0\0\0\0\x18\x61\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  626  \0\0\0\0\0\0\0\0\x4c\x2c\0\0\x63\x01\0\0\0\0\0\0\x79\x60\x10\0\0\0\0\0\x18\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  627  \0\0\0\0\0\0\0\0\0\0\x50\x2c\0\0\x7b\x01\0\0\0\0\0\0\x61\xa0\x78\xff\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  628  \x18\x61\0\0\0\0\0\0\0\0\0\0\x78\x2c\0\0\x63\x01\0\0\0\0\0\0\x18\x61\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  629  \0\0\0\0\0\xc0\x2c\0\0\xb7\x02\0\0\x0f\0\0\0\xb7\x03\0\0\x0c\0\0\0\xb7\x04\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  630  \0\0\0\0\x85\0\0\0\xa7\0\0\0\xbf\x07\0\0\0\0\0\0\xc5\x07\xc2\xfe\0\0\0\0\x18\
786f2c352364ef Benjamin Tissoires 2022-10-25  631  \x60\0\0\0\0\0\0\0\0\0\0\x30\x2c\0\0\x63\x70\x6c\0\0\0\0\0\x77\x07\0\0\x20\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  632  \0\x63\x70\x70\0\0\0\0\0\x18\x68\0\0\0\0\0\0\0\0\0\0\x10\x2b\0\0\x18\x61\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  633  \0\0\0\0\0\0\0\xd0\x2c\0\0\xb7\x02\0\0\x1a\0\0\0\xb7\x03\0\0\x0c\0\0\0\xb7\x04\
786f2c352364ef Benjamin Tissoires 2022-10-25  634  \0\0\0\0\0\0\x85\0\0\0\xa7\0\0\0\xbf\x07\0\0\0\0\0\0\xc5\x07\xb3\xfe\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  635  \x75\x07\x03\0\0\0\0\0\x62\x08\x04\0\0\0\0\0\x6a\x08\x02\0\0\0\0\0\x05\0\x0a\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  636  \0\0\0\0\x63\x78\x04\0\0\0\0\0\xbf\x79\0\0\0\0\0\0\x77\x09\0\0\x20\0\0\0\x55\
786f2c352364ef Benjamin Tissoires 2022-10-25  637  \x09\x02\0\0\0\0\0\x6a\x08\x02\0\0\0\0\0\x05\0\x04\0\0\0\0\0\x18\x60\0\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  638  \0\0\0\0\0\0\x01\0\0\x63\x90\0\0\0\0\0\0\x6a\x08\x02\0\x40\0\0\0\xb7\x01\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  639  \x05\0\0\0\x18\x62\0\0\0\0\0\0\0\0\0\0\x30\x2c\0\0\xb7\x03\0\0\x8c\0\0\0\x85\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  640  \0\0\xa6\0\0\0\xbf\x07\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\x61\
786f2c352364ef Benjamin Tissoires 2022-10-25  641  \x01\0\0\0\0\0\0\xd5\x01\x02\0\0\0\0\0\xbf\x19\0\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  642  \x18\x60\0\0\0\0\0\0\0\0\0\0\xa0\x2c\0\0\x61\x01\0\0\0\0\0\0\xd5\x01\x02\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  643  \0\0\xbf\x19\0\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\xc5\x07\x92\xfe\0\0\0\0\x63\x7a\
786f2c352364ef Benjamin Tissoires 2022-10-25  644  \x88\xff\0\0\0\0\x61\xa1\x78\xff\0\0\0\0\xd5\x01\x02\0\0\0\0\0\xbf\x19\0\0\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  645  \0\0\x85\0\0\0\xa8\0\0\0\x61\xa0\x80\xff\0\0\0\0\x63\x06\x38\0\0\0\0\0\x61\xa0\
786f2c352364ef Benjamin Tissoires 2022-10-25  646  \x84\xff\0\0\0\0\x63\x06\x3c\0\0\0\0\0\x61\xa0\x88\xff\0\0\0\0\x63\x06\x40\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  647  \0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x61\x10\0\0\0\0\0\0\x63\x06\x18\0\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  648  \0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x04\0\0\0\x61\x10\0\0\0\0\0\0\x63\x06\x28\0\
786f2c352364ef Benjamin Tissoires 2022-10-25  649  \0\0\0\0\xb7\0\0\0\0\0\0\0\x95\0\0\0\0\0\0\0";
786f2c352364ef Benjamin Tissoires 2022-10-25  650  	err = bpf_load_and_run(&opts);
786f2c352364ef Benjamin Tissoires 2022-10-25  651  	if (err < 0)
786f2c352364ef Benjamin Tissoires 2022-10-25  652  		return err;
786f2c352364ef Benjamin Tissoires 2022-10-25  653  	return 0;
786f2c352364ef Benjamin Tissoires 2022-10-25  654  }
786f2c352364ef Benjamin Tissoires 2022-10-25  655  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--q6gMsH+Lt4YGyYg8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/m68k 6.1.0-rc1 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="m68k-linux-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_CONSTRUCTORS=y
CONFIG_IRQ_WORK=y

#
# General setup
#
CONFIG_BROKEN_ON_SMP=y
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
CONFIG_SYSVIPC=y
CONFIG_SYSVIPC_SYSCTL=y
CONFIG_POSIX_MQUEUE=y
CONFIG_POSIX_MQUEUE_SYSCTL=y
# CONFIG_WATCH_QUEUE is not set
# CONFIG_USELIB is not set
# CONFIG_AUDIT is not set

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_LEGACY_TIMER_TICK=y
CONFIG_BPF=y

#
# BPF subsystem
#
CONFIG_BPF_SYSCALL=y
CONFIG_BPF_UNPRIV_DEFAULT_OFF=y
# end of BPF subsystem

CONFIG_PREEMPT_NONE_BUILD=y
CONFIG_PREEMPT_NONE=y
# CONFIG_PREEMPT_VOLUNTARY is not set
# CONFIG_PREEMPT is not set
CONFIG_PREEMPT_COUNT=y

#
# CPU/Task time and stats accounting
#
CONFIG_TICK_CPU_ACCOUNTING=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
# CONFIG_TASKSTATS is not set
# CONFIG_PSI is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TINY_RCU=y
CONFIG_RCU_EXPERT=y
CONFIG_SRCU=y
CONFIG_TINY_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_FORCE_TASKS_RCU=y
CONFIG_TASKS_RCU=y
CONFIG_FORCE_TASKS_RUDE_RCU=y
CONFIG_TASKS_RUDE_RCU=y
CONFIG_FORCE_TASKS_TRACE_RCU=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_NEED_SEGCBLIST=y
# CONFIG_TASKS_TRACE_RCU_READ_MB is not set
# end of RCU Subsystem

# CONFIG_IKCONFIG is not set
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
CONFIG_PAGE_COUNTER=y
CONFIG_CGROUP_FAVOR_DYNMODS=y
CONFIG_MEMCG=y
CONFIG_CGROUP_SCHED=y
CONFIG_FAIR_GROUP_SCHED=y
# CONFIG_CFS_BANDWIDTH is not set
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_PIDS=y
# CONFIG_CGROUP_RDMA is not set
CONFIG_CGROUP_FREEZER=y
# CONFIG_CGROUP_DEVICE is not set
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_BPF=y
CONFIG_CGROUP_MISC=y
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
CONFIG_NAMESPACES=y
CONFIG_UTS_NS=y
CONFIG_IPC_NS=y
# CONFIG_USER_NS is not set
CONFIG_PID_NS=y
# CONFIG_NET_NS is not set
# CONFIG_CHECKPOINT_RESTORE is not set
CONFIG_SCHED_AUTOGROUP=y
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
# CONFIG_RD_BZIP2 is not set
CONFIG_RD_LZMA=y
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
CONFIG_RD_LZ4=y
# CONFIG_RD_ZSTD is not set
CONFIG_BOOT_CONFIG=y
# CONFIG_BOOT_CONFIG_EMBED is not set
CONFIG_INITRAMFS_PRESERVE_MTIME=y
CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=y
# CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
CONFIG_SYSCTL=y
CONFIG_HAVE_UID16=y
CONFIG_EXPERT=y
CONFIG_UID16=y
CONFIG_MULTIUSER=y
CONFIG_SGETMASK_SYSCALL=y
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
CONFIG_POSIX_TIMERS=y
CONFIG_PRINTK=y
CONFIG_BUG=y
# CONFIG_ELF_CORE is not set
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
# CONFIG_SIGNALFD is not set
# CONFIG_TIMERFD is not set
CONFIG_EVENTFD=y
CONFIG_AIO=y
# CONFIG_IO_URING is not set
CONFIG_ADVISE_SYSCALLS=y
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_ALL is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_KCMP=y
# CONFIG_EMBEDDED is not set
# CONFIG_PC104 is not set

#
# Kernel Performance Events And Counters
#
# end of Kernel Performance Events And Counters

CONFIG_SYSTEM_DATA_VERIFICATION=y
CONFIG_PROFILING=y
# end of General setup

CONFIG_M68K=y
CONFIG_CPU_BIG_ENDIAN=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_GENERIC_CSUM=y
CONFIG_TIME_LOW_RES=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_HZ=100
CONFIG_PGTABLE_LEVELS=2
# CONFIG_MMU is not set

#
# Platform setup
#

#
# Processor Type
#
# CONFIG_M68KCLASSIC is not set
CONFIG_COLDFIRE=y
# CONFIG_M5206 is not set
CONFIG_M5206e=y
# CONFIG_M520x is not set
# CONFIG_M523x is not set
# CONFIG_M5249 is not set
# CONFIG_M525x is not set
# CONFIG_M5271 is not set
# CONFIG_M5272 is not set
# CONFIG_M5275 is not set
# CONFIG_M528x is not set
# CONFIG_M5307 is not set
# CONFIG_M532x is not set
# CONFIG_M537x is not set
# CONFIG_M5407 is not set
# CONFIG_M547x is not set
# CONFIG_M548x is not set
# CONFIG_M5441x is not set
CONFIG_COLDFIRE_TIMERS=y

#
# Processor Specific Options
#
CONFIG_ARCH_FORCE_MAX_ORDER=11
CONFIG_CPU_HAS_NO_BITFIELDS=y
CONFIG_CPU_HAS_NO_CAS=y
CONFIG_CPU_HAS_NO_MULDIV64=y
CONFIG_COLDFIRE_SW_A7=y
CONFIG_HAVE_MBAR=y
CONFIG_CLOCK_FREQ=54000000

#
# Machine Types
#
CONFIG_M5206eC3=y
CONFIG_ELITE=y
# CONFIG_NETtel is not set

#
# Machine Options
#
# CONFIG_UBOOT is not set
CONFIG_4KSTACKS=y

#
# RAM configuration
#
CONFIG_RAMBASE=0
CONFIG_RAMSIZE=0x400000
CONFIG_VECTORBASE=0
CONFIG_MBAR=0x10000000
CONFIG_KERNELBASE=0x400

#
# ROM configuration
#
# CONFIG_ROM is not set
CONFIG_RAMKERNEL=y
# end of Platform setup

#
# Kernel Features
#
# end of Kernel Features

#
# Power management options
#
CONFIG_PM=y
# end of Power management options

#
# General architecture-dependent options
#
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_ASM_MODVERSIONS=y
CONFIG_ARCH_WANT_IPC_PARSE_VERSION=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_MODULES_USE_ELF_REL=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_ISA_BUS_API=y
CONFIG_OLD_SIGSUSPEND3=y
CONFIG_OLD_SIGACTION=y
CONFIG_COMPAT_32BIT_TIME=y
CONFIG_CPU_NO_EFFICIENT_FFS=y
CONFIG_LOCK_EVENT_COUNTS=y

#
# GCOV-based kernel profiling
#
CONFIG_GCOV_KERNEL=y
# end of GCOV-based kernel profiling
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
CONFIG_MODULE_SIG_FORMAT=y
CONFIG_MODULES=y
CONFIG_MODULE_FORCE_LOAD=y
# CONFIG_MODULE_UNLOAD is not set
CONFIG_MODVERSIONS=y
CONFIG_ASM_MODVERSIONS=y
CONFIG_MODULE_SRCVERSION_ALL=y
CONFIG_MODULE_SIG=y
# CONFIG_MODULE_SIG_FORCE is not set
CONFIG_MODULE_SIG_ALL=y
# CONFIG_MODULE_SIG_SHA1 is not set
# CONFIG_MODULE_SIG_SHA224 is not set
# CONFIG_MODULE_SIG_SHA256 is not set
CONFIG_MODULE_SIG_SHA384=y
# CONFIG_MODULE_SIG_SHA512 is not set
CONFIG_MODULE_SIG_HASH="sha384"
CONFIG_MODULE_COMPRESS_NONE=y
# CONFIG_MODULE_COMPRESS_GZIP is not set
# CONFIG_MODULE_COMPRESS_XZ is not set
# CONFIG_MODULE_COMPRESS_ZSTD is not set
CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS=y
CONFIG_MODPROBE_PATH="/sbin/modprobe"
# CONFIG_BLOCK is not set
CONFIG_ASN1=y
CONFIG_UNINLINE_SPIN_UNLOCK=y
CONFIG_FREEZER=y

#
# Executable file formats
#
CONFIG_BINFMT_ELF_FDPIC=y
CONFIG_ELFCORE=y
CONFIG_BINFMT_SCRIPT=m
CONFIG_ARCH_HAS_BINFMT_FLAT=y
# CONFIG_BINFMT_FLAT is not set
CONFIG_BINFMT_FLAT_ARGVP_ENVP_ON_STACK=y
CONFIG_BINFMT_MISC=y
CONFIG_COREDUMP=y
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
# CONFIG_SLAB is not set
# CONFIG_SLUB is not set
CONFIG_SLOB=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
CONFIG_COMPAT_BRK=y
CONFIG_MMAP_ALLOW_UNINITIALIZED=y
CONFIG_FLATMEM=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=999999
CONFIG_MEMORY_BALLOON=y
CONFIG_PAGE_REPORTING=y
CONFIG_NOMMU_INITIAL_TRIM_EXCESS=1
CONFIG_NEED_PER_CPU_KM=y
CONFIG_ARCH_HAS_CURRENT_STACK_POINTER=y
CONFIG_ZONE_DMA=y
CONFIG_VM_EVENT_COUNTERS=y
# CONFIG_PERCPU_STATS is not set
# CONFIG_GUP_TEST is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

CONFIG_NET=y
CONFIG_NET_INGRESS=y
CONFIG_NET_EGRESS=y
CONFIG_NET_REDIRECT=y
CONFIG_SKB_EXTENSIONS=y

#
# Networking options
#
# CONFIG_PACKET is not set
CONFIG_UNIX=m
CONFIG_UNIX_SCM=y
CONFIG_AF_UNIX_OOB=y
# CONFIG_UNIX_DIAG is not set
CONFIG_TLS=m
# CONFIG_TLS_DEVICE is not set
# CONFIG_TLS_TOE is not set
CONFIG_XFRM=y
CONFIG_XFRM_OFFLOAD=y
CONFIG_XFRM_ALGO=y
# CONFIG_XFRM_USER is not set
CONFIG_XFRM_INTERFACE=y
# CONFIG_XFRM_SUB_POLICY is not set
CONFIG_XFRM_MIGRATE=y
CONFIG_XFRM_STATISTICS=y
CONFIG_XFRM_AH=y
CONFIG_XFRM_ESP=m
CONFIG_XFRM_IPCOMP=y
# CONFIG_NET_KEY is not set
# CONFIG_SMC is not set
CONFIG_XDP_SOCKETS=y
CONFIG_XDP_SOCKETS_DIAG=m
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
# CONFIG_IP_FIB_TRIE_STATS is not set
# CONFIG_IP_MULTIPLE_TABLES is not set
CONFIG_IP_ROUTE_MULTIPATH=y
# CONFIG_IP_ROUTE_VERBOSE is not set
CONFIG_IP_ROUTE_CLASSID=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_DHCP=y
# CONFIG_IP_PNP_BOOTP is not set
CONFIG_IP_PNP_RARP=y
# CONFIG_NET_IPIP is not set
# CONFIG_NET_IPGRE_DEMUX is not set
CONFIG_NET_IP_TUNNEL=y
CONFIG_IP_MROUTE_COMMON=y
CONFIG_IP_MROUTE=y
CONFIG_IP_MROUTE_MULTIPLE_TABLES=y
CONFIG_IP_PIMSM_V1=y
# CONFIG_IP_PIMSM_V2 is not set
CONFIG_SYN_COOKIES=y
# CONFIG_NET_IPVTI is not set
CONFIG_NET_UDP_TUNNEL=y
CONFIG_NET_FOU=m
# CONFIG_NET_FOU_IP_TUNNELS is not set
CONFIG_INET_AH=y
# CONFIG_INET_ESP is not set
CONFIG_INET_IPCOMP=y
CONFIG_INET_XFRM_TUNNEL=y
CONFIG_INET_TUNNEL=y
# CONFIG_INET_DIAG is not set
# CONFIG_TCP_CONG_ADVANCED is not set
CONFIG_TCP_CONG_CUBIC=y
CONFIG_DEFAULT_TCP_CONG="cubic"
CONFIG_TCP_MD5SIG=y
CONFIG_IPV6=y
CONFIG_IPV6_ROUTER_PREF=y
# CONFIG_IPV6_ROUTE_INFO is not set
CONFIG_IPV6_OPTIMISTIC_DAD=y
# CONFIG_INET6_AH is not set
CONFIG_INET6_ESP=m
CONFIG_INET6_ESP_OFFLOAD=m
# CONFIG_INET6_ESPINTCP is not set
CONFIG_INET6_IPCOMP=y
CONFIG_IPV6_MIP6=m
CONFIG_IPV6_ILA=y
CONFIG_INET6_XFRM_TUNNEL=y
CONFIG_INET6_TUNNEL=y
CONFIG_IPV6_VTI=m
CONFIG_IPV6_SIT=m
# CONFIG_IPV6_SIT_6RD is not set
CONFIG_IPV6_NDISC_NODETYPE=y
CONFIG_IPV6_TUNNEL=y
CONFIG_IPV6_FOU=m
CONFIG_IPV6_MULTIPLE_TABLES=y
CONFIG_IPV6_SUBTREES=y
CONFIG_IPV6_MROUTE=y
# CONFIG_IPV6_MROUTE_MULTIPLE_TABLES is not set
# CONFIG_IPV6_PIMSM_V2 is not set
# CONFIG_IPV6_SEG6_LWTUNNEL is not set
CONFIG_IPV6_SEG6_HMAC=y
CONFIG_IPV6_RPL_LWTUNNEL=y
# CONFIG_IPV6_IOAM6_LWTUNNEL is not set
# CONFIG_MPTCP is not set
# CONFIG_NETWORK_SECMARK is not set
CONFIG_NET_PTP_CLASSIFY=y
CONFIG_NETWORK_PHY_TIMESTAMPING=y
CONFIG_NETFILTER=y
CONFIG_NETFILTER_ADVANCED=y
# CONFIG_BRIDGE_NETFILTER is not set

#
# Core Netfilter Configuration
#
CONFIG_NETFILTER_INGRESS=y
CONFIG_NETFILTER_EGRESS=y
CONFIG_NETFILTER_SKIP_EGRESS=y
CONFIG_NETFILTER_NETLINK=y
CONFIG_NETFILTER_FAMILY_BRIDGE=y
CONFIG_NETFILTER_FAMILY_ARP=y
# CONFIG_NETFILTER_NETLINK_HOOK is not set
# CONFIG_NETFILTER_NETLINK_ACCT is not set
CONFIG_NETFILTER_NETLINK_QUEUE=y
CONFIG_NETFILTER_NETLINK_LOG=y
CONFIG_NETFILTER_NETLINK_OSF=y
CONFIG_NF_CONNTRACK=m
CONFIG_NF_LOG_SYSLOG=y
CONFIG_NETFILTER_CONNCOUNT=m
CONFIG_NF_CONNTRACK_MARK=y
CONFIG_NF_CONNTRACK_ZONES=y
CONFIG_NF_CONNTRACK_PROCFS=y
CONFIG_NF_CONNTRACK_EVENTS=y
# CONFIG_NF_CONNTRACK_TIMEOUT is not set
# CONFIG_NF_CONNTRACK_TIMESTAMP is not set
CONFIG_NF_CONNTRACK_LABELS=y
CONFIG_NF_CT_PROTO_DCCP=y
# CONFIG_NF_CT_PROTO_SCTP is not set
# CONFIG_NF_CT_PROTO_UDPLITE is not set
# CONFIG_NF_CONNTRACK_AMANDA is not set
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_BROADCAST=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_SNMP=m
# CONFIG_NF_CONNTRACK_PPTP is not set
# CONFIG_NF_CONNTRACK_SANE is not set
CONFIG_NF_CONNTRACK_SIP=m
# CONFIG_NF_CONNTRACK_TFTP is not set
CONFIG_NF_CT_NETLINK=m
CONFIG_NF_CT_NETLINK_HELPER=m
CONFIG_NETFILTER_NETLINK_GLUE_CT=y
CONFIG_NF_NAT=m
CONFIG_NF_NAT_FTP=m
CONFIG_NF_NAT_IRC=m
CONFIG_NF_NAT_SIP=m
CONFIG_NF_NAT_MASQUERADE=y
CONFIG_NETFILTER_SYNPROXY=m
CONFIG_NF_TABLES=y
# CONFIG_NF_TABLES_INET is not set
CONFIG_NF_TABLES_NETDEV=y
CONFIG_NFT_NUMGEN=m
CONFIG_NFT_CT=m
# CONFIG_NFT_FLOW_OFFLOAD is not set
# CONFIG_NFT_CONNLIMIT is not set
CONFIG_NFT_LOG=m
CONFIG_NFT_LIMIT=m
CONFIG_NFT_MASQ=m
# CONFIG_NFT_REDIR is not set
CONFIG_NFT_NAT=m
CONFIG_NFT_TUNNEL=m
# CONFIG_NFT_OBJREF is not set
# CONFIG_NFT_QUEUE is not set
# CONFIG_NFT_QUOTA is not set
CONFIG_NFT_REJECT=m
CONFIG_NFT_COMPAT=m
# CONFIG_NFT_HASH is not set
# CONFIG_NFT_XFRM is not set
CONFIG_NFT_SOCKET=m
CONFIG_NFT_OSF=y
CONFIG_NFT_TPROXY=y
CONFIG_NFT_SYNPROXY=m
CONFIG_NF_DUP_NETDEV=y
CONFIG_NFT_DUP_NETDEV=y
CONFIG_NFT_FWD_NETDEV=m
CONFIG_NF_FLOW_TABLE_INET=m
CONFIG_NF_FLOW_TABLE=m
CONFIG_NF_FLOW_TABLE_PROCFS=y
CONFIG_NETFILTER_XTABLES=y

#
# Xtables combined modules
#
CONFIG_NETFILTER_XT_MARK=y
CONFIG_NETFILTER_XT_CONNMARK=m
CONFIG_NETFILTER_XT_SET=m

#
# Xtables targets
#
CONFIG_NETFILTER_XT_TARGET_CHECKSUM=m
# CONFIG_NETFILTER_XT_TARGET_CLASSIFY is not set
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_CT=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_HL=m
CONFIG_NETFILTER_XT_TARGET_HMARK=m
CONFIG_NETFILTER_XT_TARGET_IDLETIMER=y
CONFIG_NETFILTER_XT_TARGET_LOG=m
# CONFIG_NETFILTER_XT_TARGET_MARK is not set
CONFIG_NETFILTER_XT_NAT=m
# CONFIG_NETFILTER_XT_TARGET_NETMAP is not set
CONFIG_NETFILTER_XT_TARGET_NFLOG=y
# CONFIG_NETFILTER_XT_TARGET_NFQUEUE is not set
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_RATEEST=m
# CONFIG_NETFILTER_XT_TARGET_REDIRECT is not set
CONFIG_NETFILTER_XT_TARGET_MASQUERADE=m
CONFIG_NETFILTER_XT_TARGET_TEE=m
CONFIG_NETFILTER_XT_TARGET_TRACE=y
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
# CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP is not set

#
# Xtables matches
#
CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y
CONFIG_NETFILTER_XT_MATCH_BPF=y
# CONFIG_NETFILTER_XT_MATCH_CGROUP is not set
# CONFIG_NETFILTER_XT_MATCH_CLUSTER is not set
# CONFIG_NETFILTER_XT_MATCH_COMMENT is not set
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
# CONFIG_NETFILTER_XT_MATCH_CONNLABEL is not set
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
# CONFIG_NETFILTER_XT_MATCH_CONNMARK is not set
# CONFIG_NETFILTER_XT_MATCH_CONNTRACK is not set
# CONFIG_NETFILTER_XT_MATCH_CPU is not set
# CONFIG_NETFILTER_XT_MATCH_DCCP is not set
CONFIG_NETFILTER_XT_MATCH_DEVGROUP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=y
CONFIG_NETFILTER_XT_MATCH_ECN=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_HL=y
CONFIG_NETFILTER_XT_MATCH_IPCOMP=m
CONFIG_NETFILTER_XT_MATCH_IPRANGE=y
CONFIG_NETFILTER_XT_MATCH_IPVS=m
CONFIG_NETFILTER_XT_MATCH_L2TP=y
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
# CONFIG_NETFILTER_XT_MATCH_LIMIT is not set
CONFIG_NETFILTER_XT_MATCH_MAC=m
# CONFIG_NETFILTER_XT_MATCH_MARK is not set
# CONFIG_NETFILTER_XT_MATCH_MULTIPORT is not set
# CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
CONFIG_NETFILTER_XT_MATCH_OSF=m
CONFIG_NETFILTER_XT_MATCH_OWNER=m
# CONFIG_NETFILTER_XT_MATCH_POLICY is not set
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
# CONFIG_NETFILTER_XT_MATCH_QUOTA is not set
CONFIG_NETFILTER_XT_MATCH_RATEEST=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_RECENT=y
CONFIG_NETFILTER_XT_MATCH_SCTP=y
# CONFIG_NETFILTER_XT_MATCH_SOCKET is not set
# CONFIG_NETFILTER_XT_MATCH_STATE is not set
CONFIG_NETFILTER_XT_MATCH_STATISTIC=y
# CONFIG_NETFILTER_XT_MATCH_STRING is not set
CONFIG_NETFILTER_XT_MATCH_TCPMSS=y
# CONFIG_NETFILTER_XT_MATCH_TIME is not set
CONFIG_NETFILTER_XT_MATCH_U32=m
# end of Core Netfilter Configuration

CONFIG_IP_SET=m
CONFIG_IP_SET_MAX=256
CONFIG_IP_SET_BITMAP_IP=m
CONFIG_IP_SET_BITMAP_IPMAC=m
CONFIG_IP_SET_BITMAP_PORT=m
# CONFIG_IP_SET_HASH_IP is not set
# CONFIG_IP_SET_HASH_IPMARK is not set
CONFIG_IP_SET_HASH_IPPORT=m
# CONFIG_IP_SET_HASH_IPPORTIP is not set
CONFIG_IP_SET_HASH_IPPORTNET=m
CONFIG_IP_SET_HASH_IPMAC=m
# CONFIG_IP_SET_HASH_MAC is not set
CONFIG_IP_SET_HASH_NETPORTNET=m
CONFIG_IP_SET_HASH_NET=m
CONFIG_IP_SET_HASH_NETNET=m
CONFIG_IP_SET_HASH_NETPORT=m
CONFIG_IP_SET_HASH_NETIFACE=m
CONFIG_IP_SET_LIST_SET=m
CONFIG_IP_VS=m
CONFIG_IP_VS_IPV6=y
# CONFIG_IP_VS_DEBUG is not set
CONFIG_IP_VS_TAB_BITS=12

#
# IPVS transport protocol load balancing support
#
# CONFIG_IP_VS_PROTO_TCP is not set
# CONFIG_IP_VS_PROTO_UDP is not set
CONFIG_IP_VS_PROTO_AH_ESP=y
# CONFIG_IP_VS_PROTO_ESP is not set
CONFIG_IP_VS_PROTO_AH=y
CONFIG_IP_VS_PROTO_SCTP=y

#
# IPVS scheduler
#
# CONFIG_IP_VS_RR is not set
CONFIG_IP_VS_WRR=m
CONFIG_IP_VS_LC=m
CONFIG_IP_VS_WLC=m
CONFIG_IP_VS_FO=m
CONFIG_IP_VS_OVF=m
# CONFIG_IP_VS_LBLC is not set
CONFIG_IP_VS_LBLCR=m
# CONFIG_IP_VS_DH is not set
CONFIG_IP_VS_SH=m
# CONFIG_IP_VS_MH is not set
CONFIG_IP_VS_SED=m
# CONFIG_IP_VS_NQ is not set
CONFIG_IP_VS_TWOS=m

#
# IPVS SH scheduler
#
CONFIG_IP_VS_SH_TAB_BITS=8

#
# IPVS MH scheduler
#
CONFIG_IP_VS_MH_TAB_INDEX=12

#
# IPVS application helper
#
CONFIG_IP_VS_NFCT=y

#
# IP: Netfilter Configuration
#
CONFIG_NF_DEFRAG_IPV4=y
CONFIG_NF_SOCKET_IPV4=y
CONFIG_NF_TPROXY_IPV4=y
# CONFIG_NF_TABLES_IPV4 is not set
# CONFIG_NF_TABLES_ARP is not set
CONFIG_NF_DUP_IPV4=m
CONFIG_NF_LOG_ARP=y
# CONFIG_NF_LOG_IPV4 is not set
# CONFIG_NF_REJECT_IPV4 is not set
CONFIG_NF_NAT_SNMP_BASIC=m
CONFIG_NF_NAT_H323=m
# CONFIG_IP_NF_IPTABLES is not set
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
# CONFIG_IP_NF_ARP_MANGLE is not set
# end of IP: Netfilter Configuration

#
# IPv6: Netfilter Configuration
#
CONFIG_NF_SOCKET_IPV6=m
CONFIG_NF_TPROXY_IPV6=y
CONFIG_NF_TABLES_IPV6=y
CONFIG_NFT_REJECT_IPV6=m
CONFIG_NFT_DUP_IPV6=m
# CONFIG_NFT_FIB_IPV6 is not set
CONFIG_NF_DUP_IPV6=m
CONFIG_NF_REJECT_IPV6=m
CONFIG_NF_LOG_IPV6=y
CONFIG_IP6_NF_IPTABLES=y
CONFIG_IP6_NF_MATCH_AH=y
# CONFIG_IP6_NF_MATCH_EUI64 is not set
# CONFIG_IP6_NF_MATCH_FRAG is not set
CONFIG_IP6_NF_MATCH_OPTS=m
# CONFIG_IP6_NF_MATCH_HL is not set
CONFIG_IP6_NF_MATCH_IPV6HEADER=y
CONFIG_IP6_NF_MATCH_MH=y
CONFIG_IP6_NF_MATCH_RPFILTER=y
# CONFIG_IP6_NF_MATCH_RT is not set
CONFIG_IP6_NF_MATCH_SRH=y
# CONFIG_IP6_NF_TARGET_HL is not set
CONFIG_IP6_NF_FILTER=y
# CONFIG_IP6_NF_TARGET_REJECT is not set
# CONFIG_IP6_NF_TARGET_SYNPROXY is not set
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=y
CONFIG_IP6_NF_NAT=m
CONFIG_IP6_NF_TARGET_MASQUERADE=m
CONFIG_IP6_NF_TARGET_NPT=m
# end of IPv6: Netfilter Configuration

CONFIG_NF_DEFRAG_IPV6=y
CONFIG_NF_TABLES_BRIDGE=y
# CONFIG_NFT_BRIDGE_META is not set
CONFIG_NF_CONNTRACK_BRIDGE=m
# CONFIG_BRIDGE_NF_EBTABLES is not set
# CONFIG_BPFILTER is not set
# CONFIG_IP_DCCP is not set
CONFIG_IP_SCTP=m
CONFIG_SCTP_DBG_OBJCNT=y
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
# CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1 is not set
CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE=y
# CONFIG_SCTP_COOKIE_HMAC_MD5 is not set
# CONFIG_SCTP_COOKIE_HMAC_SHA1 is not set
CONFIG_RDS=m
# CONFIG_RDS_RDMA is not set
# CONFIG_RDS_TCP is not set
# CONFIG_RDS_DEBUG is not set
CONFIG_TIPC=y
# CONFIG_TIPC_MEDIA_UDP is not set
# CONFIG_TIPC_CRYPTO is not set
CONFIG_TIPC_DIAG=y
CONFIG_ATM=m
CONFIG_ATM_CLIP=m
# CONFIG_ATM_CLIP_NO_ICMP is not set
# CONFIG_ATM_LANE is not set
CONFIG_ATM_BR2684=m
CONFIG_ATM_BR2684_IPFILTER=y
# CONFIG_L2TP is not set
CONFIG_STP=y
CONFIG_BRIDGE=y
# CONFIG_BRIDGE_IGMP_SNOOPING is not set
# CONFIG_BRIDGE_MRP is not set
CONFIG_BRIDGE_CFM=y
CONFIG_NET_DSA=m
CONFIG_NET_DSA_TAG_AR9331=m
CONFIG_NET_DSA_TAG_BRCM_COMMON=m
# CONFIG_NET_DSA_TAG_BRCM is not set
# CONFIG_NET_DSA_TAG_BRCM_LEGACY is not set
CONFIG_NET_DSA_TAG_BRCM_PREPEND=m
# CONFIG_NET_DSA_TAG_HELLCREEK is not set
CONFIG_NET_DSA_TAG_GSWIP=m
CONFIG_NET_DSA_TAG_DSA_COMMON=m
CONFIG_NET_DSA_TAG_DSA=m
CONFIG_NET_DSA_TAG_EDSA=m
CONFIG_NET_DSA_TAG_MTK=m
CONFIG_NET_DSA_TAG_KSZ=m
CONFIG_NET_DSA_TAG_OCELOT=m
CONFIG_NET_DSA_TAG_OCELOT_8021Q=m
CONFIG_NET_DSA_TAG_QCA=m
CONFIG_NET_DSA_TAG_RTL4_A=m
CONFIG_NET_DSA_TAG_RTL8_4=m
# CONFIG_NET_DSA_TAG_RZN1_A5PSW is not set
CONFIG_NET_DSA_TAG_LAN9303=m
# CONFIG_NET_DSA_TAG_SJA1105 is not set
CONFIG_NET_DSA_TAG_TRAILER=m
CONFIG_NET_DSA_TAG_XRS700X=m
# CONFIG_VLAN_8021Q is not set
CONFIG_LLC=y
CONFIG_LLC2=m
CONFIG_ATALK=m
CONFIG_DEV_APPLETALK=m
CONFIG_IPDDP=m
# CONFIG_IPDDP_ENCAP is not set
# CONFIG_X25 is not set
CONFIG_LAPB=y
CONFIG_PHONET=m
# CONFIG_6LOWPAN is not set
CONFIG_IEEE802154=y
# CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
CONFIG_IEEE802154_SOCKET=y
CONFIG_MAC802154=y
# CONFIG_NET_SCHED is not set
CONFIG_DCB=y
# CONFIG_DNS_RESOLVER is not set
# CONFIG_BATMAN_ADV is not set
CONFIG_OPENVSWITCH=m
CONFIG_VSOCKETS=y
CONFIG_VSOCKETS_DIAG=y
# CONFIG_VSOCKETS_LOOPBACK is not set
# CONFIG_VIRTIO_VSOCKETS is not set
CONFIG_VIRTIO_VSOCKETS_COMMON=m
CONFIG_NETLINK_DIAG=m
CONFIG_MPLS=y
CONFIG_NET_MPLS_GSO=y
CONFIG_MPLS_ROUTING=m
# CONFIG_MPLS_IPTUNNEL is not set
CONFIG_NET_NSH=m
CONFIG_HSR=m
CONFIG_NET_SWITCHDEV=y
CONFIG_NET_L3_MASTER_DEV=y
# CONFIG_QRTR is not set
CONFIG_NET_NCSI=y
# CONFIG_NCSI_OEM_CMD_GET_MAC is not set
# CONFIG_NCSI_OEM_CMD_KEEP_PHY is not set
CONFIG_CGROUP_NET_PRIO=y
CONFIG_CGROUP_NET_CLASSID=y
CONFIG_NET_RX_BUSY_POLL=y
CONFIG_BQL=y
# CONFIG_BPF_STREAM_PARSER is not set

#
# Network testing
#
# CONFIG_NET_PKTGEN is not set
# end of Network testing
# end of Networking options

# CONFIG_HAMRADIO is not set
CONFIG_CAN=m
# CONFIG_CAN_RAW is not set
# CONFIG_CAN_BCM is not set
# CONFIG_CAN_GW is not set
# CONFIG_CAN_J1939 is not set
CONFIG_CAN_ISOTP=m
CONFIG_BT=m
CONFIG_BT_BREDR=y
CONFIG_BT_RFCOMM=m
CONFIG_BT_BNEP=y
CONFIG_BT_BNEP_MC_FILTER=y
# CONFIG_BT_BNEP_PROTO_FILTER is not set
CONFIG_BT_CMTP=y
CONFIG_BT_HIDP=y
# CONFIG_BT_HS is not set
CONFIG_BT_LE=y
# CONFIG_BT_MSFTEXT is not set
CONFIG_BT_AOSPEXT=y
CONFIG_BT_DEBUGFS=y
CONFIG_BT_SELFTEST=y
# CONFIG_BT_SELFTEST_ECDH is not set
# CONFIG_BT_SELFTEST_SMP is not set

#
# Bluetooth device drivers
#
CONFIG_BT_QCA=m
CONFIG_BT_MTK=m
CONFIG_BT_HCIBTSDIO=m
# CONFIG_BT_HCIDTL1 is not set
CONFIG_BT_HCIBT3C=m
CONFIG_BT_HCIBLUECARD=m
CONFIG_BT_HCIVHCI=m
# CONFIG_BT_MRVL is not set
CONFIG_BT_MTKSDIO=m
CONFIG_BT_MTKUART=m
CONFIG_BT_QCOMSMD=m
CONFIG_BT_HCIRSI=m
CONFIG_BT_VIRTIO=m
# end of Bluetooth device drivers

CONFIG_AF_RXRPC=y
# CONFIG_AF_RXRPC_IPV6 is not set
# CONFIG_AF_RXRPC_INJECT_LOSS is not set
CONFIG_AF_RXRPC_DEBUG=y
# CONFIG_RXKAD is not set
CONFIG_AF_KCM=y
CONFIG_STREAM_PARSER=y
CONFIG_MCTP=y
CONFIG_MCTP_FLOWS=y
CONFIG_FIB_RULES=y
CONFIG_WIRELESS=y
CONFIG_WIRELESS_EXT=y
CONFIG_WEXT_CORE=y
CONFIG_WEXT_PROC=y
CONFIG_WEXT_SPY=y
CONFIG_WEXT_PRIV=y
CONFIG_CFG80211=m
CONFIG_NL80211_TESTMODE=y
CONFIG_CFG80211_DEVELOPER_WARNINGS=y
CONFIG_CFG80211_CERTIFICATION_ONUS=y
# CONFIG_CFG80211_REQUIRE_SIGNED_REGDB is not set
# CONFIG_CFG80211_REG_CELLULAR_HINTS is not set
CONFIG_CFG80211_REG_RELAX_NO_IR=y
CONFIG_CFG80211_DEFAULT_PS=y
# CONFIG_CFG80211_DEBUGFS is not set
CONFIG_CFG80211_CRDA_SUPPORT=y
# CONFIG_CFG80211_WEXT is not set
CONFIG_MAC80211=m
CONFIG_MAC80211_HAS_RC=y
CONFIG_MAC80211_RC_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT_MINSTREL=y
CONFIG_MAC80211_RC_DEFAULT="minstrel_ht"
# CONFIG_MAC80211_MESH is not set
CONFIG_MAC80211_DEBUGFS=y
CONFIG_MAC80211_MESSAGE_TRACING=y
CONFIG_MAC80211_DEBUG_MENU=y
# CONFIG_MAC80211_NOINLINE is not set
# CONFIG_MAC80211_VERBOSE_DEBUG is not set
# CONFIG_MAC80211_MLME_DEBUG is not set
# CONFIG_MAC80211_STA_DEBUG is not set
CONFIG_MAC80211_HT_DEBUG=y
CONFIG_MAC80211_OCB_DEBUG=y
CONFIG_MAC80211_IBSS_DEBUG=y
# CONFIG_MAC80211_PS_DEBUG is not set
CONFIG_MAC80211_TDLS_DEBUG=y
CONFIG_MAC80211_DEBUG_COUNTERS=y
CONFIG_MAC80211_STA_HASH_MAX_SIZE=0
CONFIG_RFKILL=m
# CONFIG_RFKILL_INPUT is not set
CONFIG_RFKILL_GPIO=m
CONFIG_NET_9P=m
CONFIG_NET_9P_FD=m
CONFIG_NET_9P_VIRTIO=m
# CONFIG_NET_9P_RDMA is not set
CONFIG_NET_9P_DEBUG=y
CONFIG_CAIF=y
# CONFIG_CAIF_DEBUG is not set
CONFIG_CAIF_NETDEV=m
CONFIG_CAIF_USB=m
CONFIG_CEPH_LIB=y
CONFIG_CEPH_LIB_PRETTYDEBUG=y
# CONFIG_CEPH_LIB_USE_DNS_RESOLVER is not set
CONFIG_NFC=m
CONFIG_NFC_DIGITAL=m
# CONFIG_NFC_NCI is not set
CONFIG_NFC_HCI=m
CONFIG_NFC_SHDLC=y

#
# Near Field Communication (NFC) devices
#
# CONFIG_NFC_SIM is not set
CONFIG_NFC_PN544=m
CONFIG_NFC_PN544_I2C=m
CONFIG_NFC_PN533=m
# CONFIG_NFC_PN533_I2C is not set
CONFIG_NFC_PN532_UART=m
CONFIG_NFC_MICROREAD=m
CONFIG_NFC_MICROREAD_I2C=m
# CONFIG_NFC_ST21NFCA_I2C is not set
# end of Near Field Communication (NFC) devices

# CONFIG_PSAMPLE is not set
# CONFIG_NET_IFE is not set
CONFIG_LWTUNNEL=y
# CONFIG_LWTUNNEL_BPF is not set
CONFIG_DST_CACHE=y
CONFIG_GRO_CELLS=y
CONFIG_NET_SELFTESTS=y
CONFIG_NET_SOCK_MSG=y
CONFIG_NET_DEVLINK=y
CONFIG_PAGE_POOL=y
# CONFIG_PAGE_POOL_STATS is not set
CONFIG_FAILOVER=y
# CONFIG_ETHTOOL_NETLINK is not set

#
# Device Drivers
#
CONFIG_PCCARD=m
CONFIG_PCMCIA=m
CONFIG_PCMCIA_LOAD_CIS=y

#
# PC-card bridges
#

#
# Generic Driver Options
#
CONFIG_UEVENT_HELPER=y
CONFIG_UEVENT_HELPER_PATH=""
CONFIG_DEVTMPFS=y
# CONFIG_DEVTMPFS_MOUNT is not set
CONFIG_DEVTMPFS_SAFE=y
# CONFIG_STANDALONE is not set
CONFIG_PREVENT_FIRMWARE_BUILD=y

#
# Firmware loader
#
CONFIG_FW_LOADER=m
CONFIG_EXTRA_FIRMWARE=""
# CONFIG_FW_LOADER_USER_HELPER is not set
# CONFIG_FW_LOADER_COMPRESS is not set
# CONFIG_FW_UPLOAD is not set
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
# CONFIG_ALLOW_DEV_COREDUMP is not set
CONFIG_DEBUG_DRIVER=y
CONFIG_DEBUG_DEVRES=y
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_TEST_ASYNC_DRIVER_PROBE=m
CONFIG_GENERIC_CPU_DEVICES=y
CONFIG_SOC_BUS=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=m
CONFIG_REGMAP_W1=m
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
CONFIG_BT1_APB=y
CONFIG_BT1_AXI=y
CONFIG_HISILICON_LPC=y
CONFIG_INTEL_IXP4XX_EB=y
CONFIG_QCOM_EBI2=y
CONFIG_MHI_BUS=m
CONFIG_MHI_BUS_DEBUG=y
CONFIG_MHI_BUS_EP=y
# end of Bus devices

CONFIG_CONNECTOR=y
CONFIG_PROC_EVENTS=y

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
CONFIG_ARM_SCMI_PROTOCOL=m
CONFIG_ARM_SCMI_HAVE_TRANSPORT=y
CONFIG_ARM_SCMI_HAVE_SHMEM=y
CONFIG_ARM_SCMI_HAVE_MSG=y
CONFIG_ARM_SCMI_TRANSPORT_MAILBOX=y
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO=y
# CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_VERSION1_COMPLIANCE is not set
CONFIG_ARM_SCMI_TRANSPORT_VIRTIO_ATOMIC_ENABLE=y
CONFIG_ARM_SCMI_POWER_DOMAIN=m
# CONFIG_ARM_SCMI_POWER_CONTROL is not set
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_PROTOCOL=y
CONFIG_ARM_SCPI_POWER_DOMAIN=m
# CONFIG_FIRMWARE_MEMMAP is not set
CONFIG_MTK_ADSP_IPC=m
CONFIG_QCOM_SCM=y
# CONFIG_QCOM_SCM_DOWNLOAD_MODE_DEFAULT is not set
CONFIG_BCM47XX_NVRAM=y
CONFIG_BCM47XX_SPROM=y
# CONFIG_GOOGLE_FIRMWARE is not set
CONFIG_IMX_DSP=m
CONFIG_IMX_SCU=y
CONFIG_IMX_SCU_PD=y

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=m
CONFIG_GNSS_MTK_SERIAL=m
CONFIG_GNSS_SIRF_SERIAL=m
# CONFIG_GNSS_UBX_SERIAL is not set
CONFIG_MTD=y
CONFIG_MTD_TESTS=m

#
# Partition parsers
#
CONFIG_MTD_AR7_PARTS=y
CONFIG_MTD_BCM63XX_PARTS=y
# CONFIG_MTD_BRCM_U_BOOT is not set
# CONFIG_MTD_CMDLINE_PARTS is not set
CONFIG_MTD_PARSER_IMAGETAG=y
# CONFIG_MTD_PARSER_TRX is not set
CONFIG_MTD_SHARPSL_PARTS=y
CONFIG_MTD_REDBOOT_PARTS=m
CONFIG_MTD_REDBOOT_DIRECTORY_BLOCK=-1
# CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED is not set
CONFIG_MTD_REDBOOT_PARTS_READONLY=y
# end of Partition parsers

#
# User Modules And Translation Layers
#
CONFIG_MTD_OOPS=m
CONFIG_MTD_PARTITIONED_MASTER=y

#
# RAM/ROM/Flash chip drivers
#
# CONFIG_MTD_CFI is not set
CONFIG_MTD_JEDECPROBE=m
CONFIG_MTD_GEN_PROBE=m
# CONFIG_MTD_CFI_ADV_OPTIONS is not set
CONFIG_MTD_MAP_BANK_WIDTH_1=y
CONFIG_MTD_MAP_BANK_WIDTH_2=y
CONFIG_MTD_MAP_BANK_WIDTH_4=y
CONFIG_MTD_CFI_I1=y
CONFIG_MTD_CFI_I2=y
# CONFIG_MTD_CFI_INTELEXT is not set
CONFIG_MTD_CFI_AMDSTD=m
CONFIG_MTD_CFI_STAA=m
CONFIG_MTD_CFI_UTIL=m
# CONFIG_MTD_RAM is not set
# CONFIG_MTD_ROM is not set
CONFIG_MTD_ABSENT=y
# end of RAM/ROM/Flash chip drivers

#
# Mapping drivers for chip access
#
# CONFIG_MTD_COMPLEX_MAPPINGS is not set
CONFIG_MTD_PHYSMAP=m
# CONFIG_MTD_PHYSMAP_COMPAT is not set
CONFIG_MTD_TS5500=m
# CONFIG_MTD_PLATRAM is not set
# end of Mapping drivers for chip access

#
# Self-contained MTD device drivers
#
CONFIG_MTD_SPEAR_SMI=m
CONFIG_MTD_SLRAM=m
CONFIG_MTD_PHRAM=y
CONFIG_MTD_MTDRAM=m
CONFIG_MTDRAM_TOTAL_SIZE=4096
CONFIG_MTDRAM_ERASE_SIZE=128

#
# Disk-On-Chip Device Drivers
#
CONFIG_MTD_DOCG3=m
CONFIG_BCH_CONST_M=14
CONFIG_BCH_CONST_T=4
# end of Self-contained MTD device drivers

#
# NAND
#
CONFIG_MTD_NAND_CORE=y
CONFIG_MTD_ONENAND=m
CONFIG_MTD_ONENAND_VERIFY_WRITE=y
# CONFIG_MTD_ONENAND_GENERIC is not set
CONFIG_MTD_ONENAND_SAMSUNG=m
# CONFIG_MTD_ONENAND_OTP is not set
CONFIG_MTD_ONENAND_2X_PROGRAM=y
# CONFIG_MTD_RAW_NAND is not set

#
# ECC engine support
#
CONFIG_MTD_NAND_ECC=y
CONFIG_MTD_NAND_ECC_SW_HAMMING=y
# CONFIG_MTD_NAND_ECC_SW_HAMMING_SMC is not set
# CONFIG_MTD_NAND_ECC_SW_BCH is not set
CONFIG_MTD_NAND_ECC_MXIC=y
# CONFIG_MTD_NAND_ECC_MEDIATEK is not set
# end of ECC engine support
# end of NAND

#
# LPDDR & LPDDR2 PCM memory drivers
#
CONFIG_MTD_LPDDR=m
CONFIG_MTD_QINFO_PROBE=m
# end of LPDDR & LPDDR2 PCM memory drivers

# CONFIG_MTD_UBI is not set
# CONFIG_MTD_HYPERBUS is not set
# CONFIG_OF is not set
CONFIG_PARPORT=y
CONFIG_PARPORT_AX88796=m
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_AD525X_DPOT=y
CONFIG_AD525X_DPOT_I2C=y
CONFIG_DUMMY_IRQ=y
CONFIG_ICS932S401=m
CONFIG_ATMEL_SSC=y
CONFIG_ENCLOSURE_SERVICES=m
# CONFIG_QCOM_COINCELL is not set
CONFIG_QCOM_FASTRPC=y
CONFIG_APDS9802ALS=m
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=m
CONFIG_SENSORS_BH1770=y
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
# CONFIG_DS1682 is not set
CONFIG_SRAM=y
CONFIG_XILINX_SDFEC=m
CONFIG_C2PORT=y

#
# EEPROM support
#
# CONFIG_EEPROM_AT24 is not set
CONFIG_EEPROM_LEGACY=m
# CONFIG_EEPROM_MAX6875 is not set
CONFIG_EEPROM_93CX6=m
CONFIG_EEPROM_IDT_89HPESX=y
# CONFIG_EEPROM_EE1004 is not set
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

# CONFIG_SENSORS_LIS3_I2C is not set
# CONFIG_ALTERA_STAPL is not set
CONFIG_ECHO=m
# CONFIG_PVPANIC is not set
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

#
# IEEE 1394 (FireWire) support
#
CONFIG_FIREWIRE=m
CONFIG_FIREWIRE_NET=m
# end of IEEE 1394 (FireWire) support

CONFIG_NETDEVICES=y
CONFIG_NET_CORE=y
CONFIG_BONDING=m
# CONFIG_DUMMY is not set
CONFIG_WIREGUARD=y
# CONFIG_WIREGUARD_DEBUG is not set
CONFIG_EQUALIZER=m
CONFIG_IFB=m
CONFIG_NET_TEAM=m
# CONFIG_NET_TEAM_MODE_BROADCAST is not set
CONFIG_NET_TEAM_MODE_ROUNDROBIN=m
CONFIG_NET_TEAM_MODE_RANDOM=m
CONFIG_NET_TEAM_MODE_ACTIVEBACKUP=m
CONFIG_NET_TEAM_MODE_LOADBALANCE=m
CONFIG_MACVLAN=y
CONFIG_MACVTAP=m
CONFIG_IPVLAN_L3S=y
CONFIG_IPVLAN=y
# CONFIG_IPVTAP is not set
# CONFIG_VXLAN is not set
# CONFIG_GENEVE is not set
CONFIG_BAREUDP=y
CONFIG_GTP=m
# CONFIG_AMT is not set
# CONFIG_MACSEC is not set
# CONFIG_NETCONSOLE is not set
CONFIG_TUN=y
CONFIG_TAP=m
# CONFIG_TUN_VNET_CROSS_LE is not set
# CONFIG_VETH is not set
CONFIG_VIRTIO_NET=m
CONFIG_NLMON=m
CONFIG_VSOCKMON=m
# CONFIG_MHI_NET is not set
# CONFIG_ARCNET is not set
# CONFIG_ATM_DRIVERS is not set
# CONFIG_CAIF_DRIVERS is not set

#
# Distributed Switch Architecture drivers
#
# CONFIG_B53 is not set
# CONFIG_NET_DSA_BCM_SF2 is not set
CONFIG_NET_DSA_LOOP=m
CONFIG_NET_DSA_LANTIQ_GSWIP=m
CONFIG_NET_DSA_MT7530=m
# CONFIG_NET_DSA_MV88E6060 is not set
# CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON is not set
CONFIG_NET_DSA_MV88E6XXX=m
# CONFIG_NET_DSA_MV88E6XXX_PTP is not set
# CONFIG_NET_DSA_AR9331 is not set
# CONFIG_NET_DSA_QCA8K is not set
CONFIG_NET_DSA_XRS700X=m
CONFIG_NET_DSA_XRS700X_I2C=m
CONFIG_NET_DSA_XRS700X_MDIO=m
# CONFIG_NET_DSA_REALTEK is not set
CONFIG_NET_DSA_SMSC_LAN9303=m
CONFIG_NET_DSA_SMSC_LAN9303_I2C=m
# CONFIG_NET_DSA_SMSC_LAN9303_MDIO is not set
CONFIG_NET_DSA_VITESSE_VSC73XX=m
CONFIG_NET_DSA_VITESSE_VSC73XX_PLATFORM=m
# end of Distributed Switch Architecture drivers

# CONFIG_ETHERNET is not set
CONFIG_PHYLINK=m
CONFIG_PHYLIB=y
CONFIG_SWPHY=y
CONFIG_FIXED_PHY=y
CONFIG_SFP=m

#
# MII PHY device drivers
#
CONFIG_AMD_PHY=m
CONFIG_MESON_GXL_PHY=y
CONFIG_ADIN_PHY=y
# CONFIG_ADIN1100_PHY is not set
CONFIG_AQUANTIA_PHY=y
# CONFIG_AX88796B_PHY is not set
CONFIG_BROADCOM_PHY=y
CONFIG_BCM54140_PHY=m
CONFIG_BCM63XX_PHY=y
# CONFIG_BCM7XXX_PHY is not set
CONFIG_BCM84881_PHY=m
CONFIG_BCM87XX_PHY=y
CONFIG_BCM_NET_PHYLIB=y
CONFIG_BCM_NET_PHYPTP=y
# CONFIG_CICADA_PHY is not set
CONFIG_CORTINA_PHY=y
# CONFIG_DAVICOM_PHY is not set
CONFIG_ICPLUS_PHY=m
CONFIG_LXT_PHY=m
# CONFIG_INTEL_XWAY_PHY is not set
CONFIG_LSI_ET1011C_PHY=m
CONFIG_MARVELL_PHY=y
CONFIG_MARVELL_10G_PHY=y
# CONFIG_MARVELL_88X2222_PHY is not set
CONFIG_MAXLINEAR_GPHY=m
CONFIG_MEDIATEK_GE_PHY=m
# CONFIG_MICREL_PHY is not set
CONFIG_MICROCHIP_PHY=y
CONFIG_MICROCHIP_T1_PHY=m
# CONFIG_MICROSEMI_PHY is not set
CONFIG_MOTORCOMM_PHY=y
CONFIG_NATIONAL_PHY=y
CONFIG_NXP_C45_TJA11XX_PHY=m
CONFIG_NXP_TJA11XX_PHY=m
CONFIG_AT803X_PHY=y
# CONFIG_QSEMI_PHY is not set
CONFIG_REALTEK_PHY=m
# CONFIG_RENESAS_PHY is not set
CONFIG_ROCKCHIP_PHY=m
CONFIG_SMSC_PHY=m
CONFIG_STE10XP=y
# CONFIG_TERANETICS_PHY is not set
# CONFIG_DP83822_PHY is not set
# CONFIG_DP83TC811_PHY is not set
CONFIG_DP83848_PHY=y
CONFIG_DP83867_PHY=m
# CONFIG_DP83869_PHY is not set
CONFIG_DP83TD510_PHY=y
CONFIG_VITESSE_PHY=m
# CONFIG_XILINX_GMII2RGMII is not set
CONFIG_PSE_CONTROLLER=y
# CONFIG_PSE_REGULATOR is not set
CONFIG_CAN_DEV=m
CONFIG_CAN_VCAN=m
# CONFIG_CAN_VXCAN is not set
CONFIG_CAN_NETLINK=y
# CONFIG_CAN_CALC_BITTIMING is not set
CONFIG_CAN_RX_OFFLOAD=y
# CONFIG_CAN_AT91 is not set
CONFIG_CAN_FLEXCAN=m
CONFIG_CAN_SUN4I=m
CONFIG_CAN_C_CAN=m
CONFIG_CAN_C_CAN_PLATFORM=m
# CONFIG_CAN_CC770 is not set
CONFIG_CAN_CTUCANFD=m
CONFIG_CAN_CTUCANFD_PLATFORM=m
# CONFIG_CAN_IFI_CANFD is not set
# CONFIG_CAN_M_CAN is not set
CONFIG_CAN_RCAR=m
CONFIG_CAN_RCAR_CANFD=m
# CONFIG_CAN_SJA1000 is not set
# CONFIG_CAN_SOFTING is not set
CONFIG_CAN_DEBUG_DEVICES=y

#
# MCTP Device Drivers
#
CONFIG_MCTP_TRANSPORT_I2C=y
# end of MCTP Device Drivers

CONFIG_MDIO_DEVICE=y
CONFIG_MDIO_BUS=y
CONFIG_FWNODE_MDIO=y
CONFIG_MDIO_DEVRES=y
CONFIG_MDIO_SUN4I=m
CONFIG_MDIO_XGENE=y
CONFIG_MDIO_BITBANG=y
# CONFIG_MDIO_BCM_UNIMAC is not set
CONFIG_MDIO_GPIO=y
CONFIG_MDIO_I2C=m
CONFIG_MDIO_MSCC_MIIM=y
CONFIG_MDIO_MOXART=m
# CONFIG_MDIO_OCTEON is not set

#
# MDIO Multiplexers
#

#
# PCS device drivers
#
# end of PCS device drivers

# CONFIG_PLIP is not set
CONFIG_PPP=y
CONFIG_PPP_BSDCOMP=y
# CONFIG_PPP_DEFLATE is not set
# CONFIG_PPP_FILTER is not set
CONFIG_PPP_MPPE=m
# CONFIG_PPP_MULTILINK is not set
CONFIG_PPPOATM=m
CONFIG_PPPOE=y
CONFIG_SLHC=y

#
# Host-side USB support is needed for USB Network Adapter support
#
CONFIG_WLAN=y
CONFIG_WLAN_VENDOR_ADMTEK=y
# CONFIG_WLAN_VENDOR_ATH is not set
CONFIG_WLAN_VENDOR_ATMEL=y
# CONFIG_ATMEL is not set
CONFIG_WLAN_VENDOR_BROADCOM=y
CONFIG_B43=m
CONFIG_B43_SSB=y
# CONFIG_B43_BUSES_BCMA_AND_SSB is not set
# CONFIG_B43_BUSES_BCMA is not set
CONFIG_B43_BUSES_SSB=y
CONFIG_B43_SDIO=y
CONFIG_B43_PIO=y
CONFIG_B43_PHY_G=y
# CONFIG_B43_PHY_N is not set
# CONFIG_B43_PHY_LP is not set
CONFIG_B43_HWRNG=y
CONFIG_B43_DEBUG=y
CONFIG_B43LEGACY=m
CONFIG_B43LEGACY_HWRNG=y
# CONFIG_B43LEGACY_DEBUG is not set
CONFIG_B43LEGACY_DMA=y
# CONFIG_B43LEGACY_DMA_AND_PIO_MODE is not set
CONFIG_B43LEGACY_DMA_MODE=y
# CONFIG_B43LEGACY_PIO_MODE is not set
CONFIG_BRCMUTIL=m
CONFIG_BRCMSMAC=m
CONFIG_BRCMFMAC=m
# CONFIG_BRCMFMAC_SDIO is not set
# CONFIG_BRCM_TRACING is not set
CONFIG_BRCMDBG=y
# CONFIG_WLAN_VENDOR_CISCO is not set
# CONFIG_WLAN_VENDOR_INTEL is not set
# CONFIG_WLAN_VENDOR_INTERSIL is not set
# CONFIG_WLAN_VENDOR_MARVELL is not set
# CONFIG_WLAN_VENDOR_MEDIATEK is not set
CONFIG_WLAN_VENDOR_MICROCHIP=y
# CONFIG_WILC1000_SDIO is not set
CONFIG_WLAN_VENDOR_PURELIFI=y
CONFIG_WLAN_VENDOR_RALINK=y
CONFIG_RT2X00=m
CONFIG_WLAN_VENDOR_REALTEK=y
# CONFIG_RTW88 is not set
CONFIG_RTW89=m
CONFIG_WLAN_VENDOR_RSI=y
CONFIG_RSI_91X=m
# CONFIG_RSI_DEBUGFS is not set
# CONFIG_RSI_SDIO is not set
CONFIG_RSI_COEX=y
CONFIG_WLAN_VENDOR_SILABS=y
CONFIG_WFX=m
CONFIG_WLAN_VENDOR_ST=y
CONFIG_CW1200=m
# CONFIG_CW1200_WLAN_SDIO is not set
# CONFIG_WLAN_VENDOR_TI is not set
# CONFIG_WLAN_VENDOR_ZYDAS is not set
# CONFIG_WLAN_VENDOR_QUANTENNA is not set
CONFIG_PCMCIA_RAYCS=m
CONFIG_PCMCIA_WL3501=m
# CONFIG_MAC80211_HWSIM is not set
CONFIG_VIRT_WIFI=m
CONFIG_WAN=y
CONFIG_HDLC=m
CONFIG_HDLC_RAW=m
CONFIG_HDLC_RAW_ETH=m
# CONFIG_HDLC_CISCO is not set
CONFIG_HDLC_FR=m
CONFIG_HDLC_PPP=m
CONFIG_HDLC_X25=m
CONFIG_IEEE802154_DRIVERS=y
CONFIG_IEEE802154_FAKELB=y
CONFIG_IEEE802154_HWSIM=m

#
# Wireless WAN
#
# CONFIG_WWAN is not set
# end of Wireless WAN

CONFIG_NETDEVSIM=m
CONFIG_NET_FAILOVER=y
CONFIG_ISDN=y
CONFIG_ISDN_CAPI=y
CONFIG_CAPI_TRACE=y
# CONFIG_MISDN is not set

#
# Input device support
#
CONFIG_INPUT=y
CONFIG_INPUT_FF_MEMLESS=y
CONFIG_INPUT_SPARSEKMAP=y
CONFIG_INPUT_MATRIXKMAP=m
CONFIG_INPUT_VIVALDIFMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
CONFIG_INPUT_MOUSEDEV_PSAUX=y
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
# CONFIG_INPUT_JOYDEV is not set
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=m

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
CONFIG_INPUT_MOUSE=y
CONFIG_MOUSE_PS2=m
# CONFIG_MOUSE_PS2_ALPS is not set
CONFIG_MOUSE_PS2_BYD=y
CONFIG_MOUSE_PS2_LOGIPS2PP=y
# CONFIG_MOUSE_PS2_SYNAPTICS is not set
CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=y
# CONFIG_MOUSE_PS2_CYPRESS is not set
# CONFIG_MOUSE_PS2_TRACKPOINT is not set
CONFIG_MOUSE_PS2_ELANTECH=y
CONFIG_MOUSE_PS2_ELANTECH_SMBUS=y
# CONFIG_MOUSE_PS2_SENTELIC is not set
CONFIG_MOUSE_PS2_TOUCHKIT=y
CONFIG_MOUSE_PS2_FOCALTECH=y
CONFIG_MOUSE_PS2_SMBUS=y
CONFIG_MOUSE_SERIAL=y
CONFIG_MOUSE_CYAPA=y
CONFIG_MOUSE_ELAN_I2C=m
CONFIG_MOUSE_ELAN_I2C_I2C=y
# CONFIG_MOUSE_ELAN_I2C_SMBUS is not set
# CONFIG_MOUSE_VSXXXAA is not set
CONFIG_MOUSE_GPIO=y
# CONFIG_MOUSE_SYNAPTICS_I2C is not set
# CONFIG_INPUT_JOYSTICK is not set
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
# CONFIG_INPUT_MISC is not set
CONFIG_RMI4_CORE=m
# CONFIG_RMI4_I2C is not set
CONFIG_RMI4_SMB=m
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=m
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
# CONFIG_RMI4_F3A is not set
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
# CONFIG_SERIO_PARKBD is not set
CONFIG_SERIO_LIBPS2=m
# CONFIG_SERIO_RAW is not set
CONFIG_SERIO_ALTERA_PS2=m
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_OLPC_APSP is not set
CONFIG_SERIO_SUN4I_PS2=y
CONFIG_SERIO_GPIO_PS2=m
CONFIG_USERIO=y
CONFIG_GAMEPORT=m
CONFIG_GAMEPORT_NS558=m
CONFIG_GAMEPORT_L4=m
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
# CONFIG_TTY is not set
CONFIG_SERIAL_DEV_BUS=m
CONFIG_PRINTER=y
CONFIG_LP_CONSOLE=y
CONFIG_PPDEV=y
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PLAT_DATA=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
CONFIG_IPMI_DEVICE_INTERFACE=m
CONFIG_IPMI_SI=y
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_IPMB=m
CONFIG_IPMI_WATCHDOG=y
# CONFIG_IPMI_POWEROFF is not set
CONFIG_IPMI_KCS_BMC=m
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
CONFIG_NPCM7XX_KCS_IPMI_BMC=m
CONFIG_IPMI_KCS_BMC_CDEV_IPMI=m
# CONFIG_IPMI_KCS_BMC_SERIO is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
CONFIG_IPMB_DEVICE_INTERFACE=m
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
# CONFIG_HW_RANDOM_BA431 is not set
# CONFIG_HW_RANDOM_BCM2835 is not set
CONFIG_HW_RANDOM_IPROC_RNG200=y
CONFIG_HW_RANDOM_IXP4XX=y
CONFIG_HW_RANDOM_OMAP=m
# CONFIG_HW_RANDOM_OMAP3_ROM is not set
CONFIG_HW_RANDOM_VIRTIO=y
# CONFIG_HW_RANDOM_IMX_RNGC is not set
CONFIG_HW_RANDOM_NOMADIK=y
CONFIG_HW_RANDOM_STM32=y
# CONFIG_HW_RANDOM_MESON is not set
CONFIG_HW_RANDOM_MTK=m
CONFIG_HW_RANDOM_EXYNOS=m
CONFIG_HW_RANDOM_NPCM=m
CONFIG_HW_RANDOM_XIPHERA=y

#
# PCMCIA character devices
#
CONFIG_CARDMAN_4000=m
CONFIG_CARDMAN_4040=m
CONFIG_SCR24X=m
# end of PCMCIA character devices

# CONFIG_DEVMEM is not set
CONFIG_TCG_TPM=y
# CONFIG_HW_RANDOM_TPM is not set
CONFIG_TCG_TIS_CORE=m
CONFIG_TCG_TIS_I2C=m
# CONFIG_TCG_TIS_SYNQUACER is not set
CONFIG_TCG_TIS_I2C_CR50=m
CONFIG_TCG_TIS_I2C_ATMEL=y
# CONFIG_TCG_TIS_I2C_INFINEON is not set
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
# CONFIG_TCG_VTPM_PROXY is not set
CONFIG_TCG_TIS_ST33ZP24=y
CONFIG_TCG_TIS_ST33ZP24_I2C=y
CONFIG_RANDOM_TRUST_CPU=y
# CONFIG_RANDOM_TRUST_BOOTLOADER is not set
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
# CONFIG_I2C_CHARDEV is not set
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_MUX_GPIO=m
CONFIG_I2C_MUX_LTC4306=y
CONFIG_I2C_MUX_PCA9541=y
CONFIG_I2C_MUX_PCA954x=y
CONFIG_I2C_MUX_REG=y
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

# CONFIG_I2C_HELPER_AUTO is not set
CONFIG_I2C_SMBUS=y

#
# I2C Algorithms
#
CONFIG_I2C_ALGOBIT=y
CONFIG_I2C_ALGOPCF=m
CONFIG_I2C_ALGOPCA=m
# end of I2C Algorithms

#
# I2C Hardware Bus support
#
CONFIG_I2C_HIX5HD2=y

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ASPEED is not set
CONFIG_I2C_AT91=y
CONFIG_I2C_AT91_SLAVE_EXPERIMENTAL=y
CONFIG_I2C_AXXIA=y
CONFIG_I2C_BCM_IPROC=m
CONFIG_I2C_BCM_KONA=m
CONFIG_I2C_BRCMSTB=y
CONFIG_I2C_CADENCE=y
# CONFIG_I2C_CBUS_GPIO is not set
CONFIG_I2C_DAVINCI=y
CONFIG_I2C_DESIGNWARE_CORE=y
CONFIG_I2C_DESIGNWARE_SLAVE=y
CONFIG_I2C_DESIGNWARE_PLATFORM=y
CONFIG_I2C_DIGICOLOR=y
CONFIG_I2C_EMEV2=y
CONFIG_I2C_GPIO=y
CONFIG_I2C_GPIO_FAULT_INJECTOR=y
# CONFIG_I2C_HIGHLANDER is not set
# CONFIG_I2C_HISI is not set
CONFIG_I2C_IMG=m
CONFIG_I2C_IMX=m
CONFIG_I2C_IMX_LPI2C=m
CONFIG_I2C_IOP3XX=m
CONFIG_I2C_JZ4780=y
CONFIG_I2C_KEMPLD=m
# CONFIG_I2C_MT65XX is not set
# CONFIG_I2C_MT7621 is not set
# CONFIG_I2C_MV64XXX is not set
# CONFIG_I2C_MXS is not set
# CONFIG_I2C_NPCM is not set
# CONFIG_I2C_OCORES is not set
# CONFIG_I2C_OMAP is not set
CONFIG_I2C_OWL=y
# CONFIG_I2C_APPLE is not set
CONFIG_I2C_PCA_PLATFORM=m
CONFIG_I2C_PNX=m
CONFIG_I2C_PXA=y
# CONFIG_I2C_PXA_SLAVE is not set
CONFIG_I2C_QCOM_CCI=m
CONFIG_I2C_QCOM_GENI=m
CONFIG_I2C_QUP=m
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_RZV2M is not set
CONFIG_I2C_S3C2410=y
CONFIG_I2C_SH_MOBILE=m
CONFIG_I2C_SIMTEC=m
# CONFIG_I2C_ST is not set
CONFIG_I2C_STM32F4=m
CONFIG_I2C_STM32F7=m
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_SYNQUACER is not set
CONFIG_I2C_TEGRA=m
CONFIG_I2C_TEGRA_BPMP=m
CONFIG_I2C_UNIPHIER=y
CONFIG_I2C_UNIPHIER_F=m
CONFIG_I2C_VERSATILE=y
# CONFIG_I2C_WMT is not set
# CONFIG_I2C_XILINX is not set
# CONFIG_I2C_XLP9XX is not set
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
# CONFIG_I2C_PARPORT is not set

#
# Other I2C/SMBus bus drivers
#
CONFIG_I2C_MLXCPLD=m
CONFIG_I2C_CROS_EC_TUNNEL=m
CONFIG_I2C_VIRTIO=m
# end of I2C Hardware Bus support

CONFIG_I2C_STUB=m
CONFIG_I2C_SLAVE=y
# CONFIG_I2C_SLAVE_EEPROM is not set
# CONFIG_I2C_SLAVE_TESTUNIT is not set
# CONFIG_I2C_DEBUG_CORE is not set
CONFIG_I2C_DEBUG_ALGO=y
# CONFIG_I2C_DEBUG_BUS is not set
# end of I2C support

# CONFIG_I3C is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
CONFIG_PPS_DEBUG=y
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=m
CONFIG_PPS_CLIENT_PARPORT=y
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK=y
CONFIG_PTP_1588_CLOCK_OPTIONAL=y
CONFIG_PTP_1588_CLOCK_DTE=m
CONFIG_PTP_1588_CLOCK_QORIQ=m
# CONFIG_DP83640_PHY is not set
# CONFIG_PTP_1588_CLOCK_INES is not set
CONFIG_PTP_1588_CLOCK_IDT82P33=m
CONFIG_PTP_1588_CLOCK_IDTCM=y
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
CONFIG_PINCTRL_AMD=y
CONFIG_PINCTRL_CY8C95X0=y
CONFIG_PINCTRL_DA9062=y
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08=y
CONFIG_PINCTRL_SX150X=y
CONFIG_PINCTRL_MADERA=m
CONFIG_PINCTRL_CS47L85=y
CONFIG_PINCTRL_CS47L90=y
CONFIG_PINCTRL_CS47L92=y

#
# Intel pinctrl drivers
#
# end of Intel pinctrl drivers

#
# MediaTek pinctrl drivers
#
# CONFIG_EINT_MTK is not set
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_PXA=y
CONFIG_PINCTRL_PXA25X=m
# CONFIG_PINCTRL_PXA27X is not set
# CONFIG_PINCTRL_MSM is not set
# CONFIG_PINCTRL_SC7280_LPASS_LPI is not set
CONFIG_PINCTRL_SM8250_LPASS_LPI=m
CONFIG_PINCTRL_SM8450_LPASS_LPI=m
CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
CONFIG_PINCTRL_LPASS_LPI=m

#
# Renesas pinctrl drivers
#
CONFIG_PINCTRL_RENESAS=y
CONFIG_PINCTRL_SH_PFC=y
CONFIG_PINCTRL_SH_PFC_GPIO=y
CONFIG_PINCTRL_SH_FUNC_GPIO=y
CONFIG_PINCTRL_PFC_EMEV2=y
CONFIG_PINCTRL_PFC_R8A77995=y
# CONFIG_PINCTRL_PFC_R8A7794 is not set
CONFIG_PINCTRL_PFC_R8A77990=y
# CONFIG_PINCTRL_PFC_R8A7779 is not set
CONFIG_PINCTRL_PFC_R8A7790=y
# CONFIG_PINCTRL_PFC_R8A77950 is not set
# CONFIG_PINCTRL_PFC_R8A77951 is not set
CONFIG_PINCTRL_PFC_R8A7778=y
CONFIG_PINCTRL_PFC_R8A7793=y
# CONFIG_PINCTRL_PFC_R8A7791 is not set
CONFIG_PINCTRL_PFC_R8A77965=y
# CONFIG_PINCTRL_PFC_R8A77960 is not set
# CONFIG_PINCTRL_PFC_R8A77961 is not set
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
# CONFIG_PINCTRL_PFC_R8A7792 is not set
CONFIG_PINCTRL_PFC_R8A77980=y
CONFIG_PINCTRL_PFC_R8A77970=y
CONFIG_PINCTRL_PFC_R8A779A0=y
CONFIG_PINCTRL_PFC_R8A779G0=y
# CONFIG_PINCTRL_PFC_R8A7740 is not set
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
CONFIG_PINCTRL_PFC_R8A77470=y
# CONFIG_PINCTRL_PFC_R8A7745 is not set
CONFIG_PINCTRL_PFC_R8A7742=y
# CONFIG_PINCTRL_PFC_R8A7743 is not set
CONFIG_PINCTRL_PFC_R8A7744=y
# CONFIG_PINCTRL_PFC_R8A774C0 is not set
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
CONFIG_PINCTRL_PFC_R8A774A1=y
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
CONFIG_PINCTRL_PFC_SH7203=y
CONFIG_PINCTRL_PFC_SH7264=y
# CONFIG_PINCTRL_PFC_SH7269 is not set
CONFIG_PINCTRL_PFC_SH7720=y
CONFIG_PINCTRL_PFC_SH7722=y
# CONFIG_PINCTRL_PFC_SH7734 is not set
# CONFIG_PINCTRL_PFC_SH7757 is not set
CONFIG_PINCTRL_PFC_SH7785=y
# CONFIG_PINCTRL_PFC_SH7786 is not set
# CONFIG_PINCTRL_PFC_SH73A0 is not set
# CONFIG_PINCTRL_PFC_SH7723 is not set
CONFIG_PINCTRL_PFC_SH7724=y
CONFIG_PINCTRL_PFC_SHX3=y
# end of Renesas pinctrl drivers

CONFIG_ARCH_HAVE_CUSTOM_GPIO_H=y
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_REGMAP=y

#
# Memory mapped GPIO drivers
#
# CONFIG_GPIO_ATH79 is not set
# CONFIG_GPIO_CLPS711X is not set
CONFIG_GPIO_DWAPB=y
CONFIG_GPIO_GENERIC_PLATFORM=m
CONFIG_GPIO_HISI=y
CONFIG_GPIO_IMX_SCU=y
CONFIG_GPIO_IOP=y
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_MENZ127 is not set
CONFIG_GPIO_MPC8XXX=y
CONFIG_GPIO_MXC=m
CONFIG_GPIO_MXS=y
CONFIG_GPIO_PXA=y
# CONFIG_GPIO_RCAR is not set
CONFIG_GPIO_ROCKCHIP=m
# CONFIG_GPIO_SIOX is not set
CONFIG_GPIO_XGENE_SB=m
CONFIG_GPIO_XLP=y
CONFIG_GPIO_AMD_FCH=y
CONFIG_GPIO_IDT3243X=m
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
# CONFIG_GPIO_MAX7300 is not set
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
CONFIG_GPIO_PCA9570=y
CONFIG_GPIO_PCF857X=y
CONFIG_GPIO_TPIC2810=m
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
CONFIG_GPIO_ARIZONA=m
CONFIG_GPIO_DA9055=m
CONFIG_GPIO_KEMPLD=m
CONFIG_GPIO_LP3943=m
CONFIG_GPIO_LP873X=m
# CONFIG_GPIO_MADERA is not set
# CONFIG_GPIO_MAX77620 is not set
# CONFIG_GPIO_MAX77650 is not set
# CONFIG_GPIO_RC5T583 is not set
CONFIG_GPIO_SL28CPLD=y
CONFIG_GPIO_TPS65086=m
# CONFIG_GPIO_TPS6586X is not set
# CONFIG_GPIO_TPS65910 is not set
CONFIG_GPIO_TWL4030=m
CONFIG_GPIO_TWL6040=m
CONFIG_GPIO_WM831X=m
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_MOCKUP=y
# CONFIG_GPIO_VIRTIO is not set
# CONFIG_GPIO_SIM is not set
# end of Virtual GPIO drivers

CONFIG_W1=m
CONFIG_W1_CON=y

#
# 1-wire Bus Masters
#
# CONFIG_W1_MASTER_DS2482 is not set
# CONFIG_W1_MASTER_MXC is not set
CONFIG_W1_MASTER_DS1WM=m
CONFIG_W1_MASTER_GPIO=m
CONFIG_W1_MASTER_SGI=m
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=m
CONFIG_W1_SLAVE_SMEM=m
CONFIG_W1_SLAVE_DS2405=m
CONFIG_W1_SLAVE_DS2408=m
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
# CONFIG_W1_SLAVE_DS2413 is not set
# CONFIG_W1_SLAVE_DS2406 is not set
CONFIG_W1_SLAVE_DS2423=m
CONFIG_W1_SLAVE_DS2805=m
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=m
# CONFIG_W1_SLAVE_DS2433 is not set
CONFIG_W1_SLAVE_DS2438=m
# CONFIG_W1_SLAVE_DS250X is not set
# CONFIG_W1_SLAVE_DS2780 is not set
# CONFIG_W1_SLAVE_DS2781 is not set
CONFIG_W1_SLAVE_DS28E04=m
CONFIG_W1_SLAVE_DS28E17=m
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
CONFIG_POWER_RESET_ATC260X=m
CONFIG_POWER_RESET_BRCMKONA=y
# CONFIG_POWER_RESET_BRCMSTB is not set
CONFIG_POWER_RESET_OCELOT_RESET=y
CONFIG_POWER_RESET_MT6323=y
CONFIG_POWER_RESET_RESTART=y
# CONFIG_POWER_RESET_TPS65086 is not set
# CONFIG_POWER_RESET_KEYSTONE is not set
# CONFIG_POWER_RESET_RMOBILE is not set
# CONFIG_POWER_RESET_SC27XX is not set
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_PDA_POWER is not set
# CONFIG_GENERIC_ADC_BATTERY is not set
CONFIG_IP5XXX_POWER=m
CONFIG_WM831X_BACKUP=y
CONFIG_WM831X_POWER=y
CONFIG_TEST_POWER=m
CONFIG_BATTERY_88PM860X=y
# CONFIG_CHARGER_ADP5061 is not set
CONFIG_BATTERY_ACT8945A=m
CONFIG_BATTERY_CW2015=m
# CONFIG_BATTERY_DS2760 is not set
# CONFIG_BATTERY_DS2780 is not set
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
# CONFIG_BATTERY_SAMSUNG_SDI is not set
CONFIG_BATTERY_INGENIC=m
CONFIG_BATTERY_SBS=m
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
CONFIG_BATTERY_BQ27XXX_I2C=m
CONFIG_BATTERY_BQ27XXX_HDQ=m
# CONFIG_BATTERY_BQ27XXX_DT_UPDATES_NVM is not set
CONFIG_BATTERY_DA9030=m
CONFIG_BATTERY_DA9150=m
# CONFIG_CHARGER_AXP20X is not set
CONFIG_BATTERY_AXP20X=m
CONFIG_AXP20X_POWER=m
# CONFIG_BATTERY_MAX17040 is not set
CONFIG_BATTERY_MAX17042=m
CONFIG_BATTERY_MAX1721X=m
# CONFIG_CHARGER_88PM860X is not set
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_CHARGER_MAX8903=m
# CONFIG_CHARGER_TWL4030 is not set
# CONFIG_CHARGER_LP8727 is not set
CONFIG_CHARGER_GPIO=m
# CONFIG_CHARGER_MANAGER is not set
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=m
CONFIG_CHARGER_MAX14577=y
CONFIG_CHARGER_MAX77650=m
CONFIG_CHARGER_MAX77693=m
CONFIG_CHARGER_MAX77976=m
CONFIG_CHARGER_BQ2415X=m
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=m
CONFIG_CHARGER_BQ24735=y
# CONFIG_CHARGER_BQ2515X is not set
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=m
# CONFIG_CHARGER_BQ256XX is not set
CONFIG_CHARGER_SMB347=m
CONFIG_CHARGER_TPS65090=y
CONFIG_BATTERY_GAUGE_LTC2941=y
CONFIG_BATTERY_GOLDFISH=m
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=m
CONFIG_CHARGER_CROS_USBPD=m
CONFIG_CHARGER_CROS_PCHG=m
# CONFIG_CHARGER_SC2731 is not set
CONFIG_FUEL_GAUGE_SC27XX=m
# CONFIG_CHARGER_BD99954 is not set
# CONFIG_BATTERY_ACER_A500 is not set
CONFIG_BATTERY_UG3105=y
CONFIG_HWMON=m
CONFIG_HWMON_VID=m
CONFIG_HWMON_DEBUG_CHIP=y

#
# Native drivers
#
# CONFIG_SENSORS_AD7414 is not set
CONFIG_SENSORS_AD7418=m
CONFIG_SENSORS_ADM1021=m
CONFIG_SENSORS_ADM1025=m
# CONFIG_SENSORS_ADM1026 is not set
# CONFIG_SENSORS_ADM1029 is not set
CONFIG_SENSORS_ADM1031=m
# CONFIG_SENSORS_ADM1177 is not set
CONFIG_SENSORS_ADM9240=m
# CONFIG_SENSORS_ADT7410 is not set
# CONFIG_SENSORS_ADT7411 is not set
CONFIG_SENSORS_ADT7462=m
CONFIG_SENSORS_ADT7470=m
CONFIG_SENSORS_ADT7475=m
CONFIG_SENSORS_AHT10=m
# CONFIG_SENSORS_AS370 is not set
# CONFIG_SENSORS_ASC7621 is not set
CONFIG_SENSORS_AXI_FAN_CONTROL=m
CONFIG_SENSORS_ARM_SCMI=m
# CONFIG_SENSORS_ARM_SCPI is not set
# CONFIG_SENSORS_ASB100 is not set
CONFIG_SENSORS_ASPEED=m
# CONFIG_SENSORS_ATXP1 is not set
CONFIG_SENSORS_BT1_PVT=m
# CONFIG_SENSORS_BT1_PVT_ALARMS is not set
# CONFIG_SENSORS_CORSAIR_CPRO is not set
CONFIG_SENSORS_CORSAIR_PSU=m
# CONFIG_SENSORS_DS620 is not set
# CONFIG_SENSORS_DS1621 is not set
CONFIG_SENSORS_DA9055=m
# CONFIG_SENSORS_SPARX5 is not set
CONFIG_SENSORS_F71805F=m
CONFIG_SENSORS_F71882FG=m
# CONFIG_SENSORS_F75375S is not set
# CONFIG_SENSORS_MC13783_ADC is not set
CONFIG_SENSORS_FSCHMD=m
CONFIG_SENSORS_FTSTEUTATES=m
# CONFIG_SENSORS_GL518SM is not set
CONFIG_SENSORS_GL520SM=m
CONFIG_SENSORS_G760A=m
CONFIG_SENSORS_G762=m
CONFIG_SENSORS_HIH6130=m
CONFIG_SENSORS_IBMAEM=m
CONFIG_SENSORS_IBMPEX=m
CONFIG_SENSORS_IIO_HWMON=m
# CONFIG_SENSORS_IT87 is not set
CONFIG_SENSORS_JC42=m
CONFIG_SENSORS_POWR1220=m
CONFIG_SENSORS_LAN966X=m
CONFIG_SENSORS_LINEAGE=m
# CONFIG_SENSORS_LTC2945 is not set
CONFIG_SENSORS_LTC2947=m
CONFIG_SENSORS_LTC2947_I2C=m
CONFIG_SENSORS_LTC2990=m
# CONFIG_SENSORS_LTC2992 is not set
CONFIG_SENSORS_LTC4151=m
CONFIG_SENSORS_LTC4215=m
CONFIG_SENSORS_LTC4222=m
# CONFIG_SENSORS_LTC4245 is not set
CONFIG_SENSORS_LTC4260=m
# CONFIG_SENSORS_LTC4261 is not set
# CONFIG_SENSORS_MAX127 is not set
CONFIG_SENSORS_MAX16065=m
CONFIG_SENSORS_MAX1619=m
# CONFIG_SENSORS_MAX1668 is not set
CONFIG_SENSORS_MAX197=m
CONFIG_SENSORS_MAX31730=m
CONFIG_SENSORS_MAX31760=m
# CONFIG_SENSORS_MAX6620 is not set
CONFIG_SENSORS_MAX6621=m
# CONFIG_SENSORS_MAX6639 is not set
# CONFIG_SENSORS_MAX6642 is not set
# CONFIG_SENSORS_MAX6650 is not set
# CONFIG_SENSORS_MAX6697 is not set
CONFIG_SENSORS_MAX31790=m
CONFIG_SENSORS_MCP3021=m
CONFIG_SENSORS_TC654=m
CONFIG_SENSORS_TPS23861=m
CONFIG_SENSORS_MR75203=m
CONFIG_SENSORS_LM63=m
CONFIG_SENSORS_LM73=m
CONFIG_SENSORS_LM75=m
# CONFIG_SENSORS_LM77 is not set
CONFIG_SENSORS_LM78=m
# CONFIG_SENSORS_LM80 is not set
CONFIG_SENSORS_LM83=m
# CONFIG_SENSORS_LM85 is not set
CONFIG_SENSORS_LM87=m
# CONFIG_SENSORS_LM90 is not set
CONFIG_SENSORS_LM92=m
# CONFIG_SENSORS_LM93 is not set
CONFIG_SENSORS_LM95234=m
CONFIG_SENSORS_LM95241=m
CONFIG_SENSORS_LM95245=m
CONFIG_SENSORS_PC87360=m
# CONFIG_SENSORS_PC87427 is not set
CONFIG_SENSORS_NTC_THERMISTOR=m
# CONFIG_SENSORS_NCT6683 is not set
# CONFIG_SENSORS_NCT6775 is not set
# CONFIG_SENSORS_NCT6775_I2C is not set
CONFIG_SENSORS_NCT7802=m
CONFIG_SENSORS_NCT7904=m
CONFIG_SENSORS_NPCM7XX=m
CONFIG_SENSORS_OCC_P8_I2C=m
CONFIG_SENSORS_OCC=m
CONFIG_SENSORS_PCF8591=m
CONFIG_PMBUS=m
# CONFIG_SENSORS_PMBUS is not set
CONFIG_SENSORS_ADM1266=m
CONFIG_SENSORS_ADM1275=m
CONFIG_SENSORS_BEL_PFE=m
CONFIG_SENSORS_BPA_RS600=m
CONFIG_SENSORS_DELTA_AHE50DC_FAN=m
# CONFIG_SENSORS_FSP_3Y is not set
CONFIG_SENSORS_DPS920AB=m
CONFIG_SENSORS_INSPUR_IPSPS=m
CONFIG_SENSORS_IR35221=m
CONFIG_SENSORS_IR36021=m
# CONFIG_SENSORS_IR38064 is not set
CONFIG_SENSORS_IRPS5401=m
# CONFIG_SENSORS_ISL68137 is not set
# CONFIG_SENSORS_LM25066 is not set
CONFIG_SENSORS_LT7182S=m
CONFIG_SENSORS_LTC2978=m
CONFIG_SENSORS_LTC2978_REGULATOR=y
CONFIG_SENSORS_LTC3815=m
# CONFIG_SENSORS_MAX15301 is not set
# CONFIG_SENSORS_MAX16064 is not set
# CONFIG_SENSORS_MAX16601 is not set
CONFIG_SENSORS_MAX20730=m
CONFIG_SENSORS_MAX20751=m
# CONFIG_SENSORS_MAX31785 is not set
CONFIG_SENSORS_MAX34440=m
CONFIG_SENSORS_MAX8688=m
# CONFIG_SENSORS_MP2888 is not set
CONFIG_SENSORS_MP2975=m
# CONFIG_SENSORS_MP5023 is not set
# CONFIG_SENSORS_PIM4328 is not set
CONFIG_SENSORS_PLI1209BC=m
# CONFIG_SENSORS_PLI1209BC_REGULATOR is not set
CONFIG_SENSORS_PM6764TR=m
CONFIG_SENSORS_PXE1610=m
# CONFIG_SENSORS_Q54SJ108A2 is not set
# CONFIG_SENSORS_STPDDC60 is not set
# CONFIG_SENSORS_TPS40422 is not set
CONFIG_SENSORS_TPS53679=m
CONFIG_SENSORS_TPS546D24=m
# CONFIG_SENSORS_UCD9000 is not set
CONFIG_SENSORS_UCD9200=m
CONFIG_SENSORS_XDPE152=m
CONFIG_SENSORS_XDPE122=m
CONFIG_SENSORS_XDPE122_REGULATOR=y
CONFIG_SENSORS_ZL6100=m
CONFIG_SENSORS_PWM_FAN=m
CONFIG_SENSORS_RASPBERRYPI_HWMON=m
CONFIG_SENSORS_SL28CPLD=m
CONFIG_SENSORS_SBTSI=m
# CONFIG_SENSORS_SBRMI is not set
# CONFIG_SENSORS_SHT15 is not set
CONFIG_SENSORS_SHT21=m
CONFIG_SENSORS_SHT3x=m
# CONFIG_SENSORS_SHT4x is not set
# CONFIG_SENSORS_SHTC1 is not set
CONFIG_SENSORS_SY7636A=m
CONFIG_SENSORS_DME1737=m
CONFIG_SENSORS_EMC1403=m
# CONFIG_SENSORS_EMC2103 is not set
CONFIG_SENSORS_EMC2305=m
# CONFIG_SENSORS_EMC6W201 is not set
CONFIG_SENSORS_SMSC47M1=m
CONFIG_SENSORS_SMSC47M192=m
# CONFIG_SENSORS_SMSC47B397 is not set
# CONFIG_SENSORS_SCH5627 is not set
# CONFIG_SENSORS_SCH5636 is not set
CONFIG_SENSORS_STTS751=m
CONFIG_SENSORS_SMM665=m
CONFIG_SENSORS_ADC128D818=m
# CONFIG_SENSORS_ADS7828 is not set
# CONFIG_SENSORS_AMC6821 is not set
# CONFIG_SENSORS_INA209 is not set
CONFIG_SENSORS_INA2XX=m
CONFIG_SENSORS_INA238=m
CONFIG_SENSORS_INA3221=m
CONFIG_SENSORS_TC74=m
# CONFIG_SENSORS_THMC50 is not set
CONFIG_SENSORS_TMP102=m
CONFIG_SENSORS_TMP103=m
CONFIG_SENSORS_TMP108=m
CONFIG_SENSORS_TMP401=m
CONFIG_SENSORS_TMP421=m
CONFIG_SENSORS_TMP464=m
CONFIG_SENSORS_TMP513=m
CONFIG_SENSORS_VT1211=m
CONFIG_SENSORS_W83773G=m
CONFIG_SENSORS_W83781D=m
CONFIG_SENSORS_W83791D=m
CONFIG_SENSORS_W83792D=m
# CONFIG_SENSORS_W83793 is not set
CONFIG_SENSORS_W83795=m
# CONFIG_SENSORS_W83795_FANCTRL is not set
CONFIG_SENSORS_W83L785TS=m
CONFIG_SENSORS_W83L786NG=m
CONFIG_SENSORS_W83627HF=m
CONFIG_SENSORS_W83627EHF=m
CONFIG_SENSORS_WM831X=m
# CONFIG_THERMAL is not set
CONFIG_WATCHDOG=y
CONFIG_WATCHDOG_CORE=y
# CONFIG_WATCHDOG_NOWAYOUT is not set
CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=y
CONFIG_WATCHDOG_OPEN_TIMEOUT=0
CONFIG_WATCHDOG_SYSFS=y
# CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set

#
# Watchdog Pretimeout Governors
#
# CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set

#
# Watchdog Device Drivers
#
# CONFIG_SOFT_WATCHDOG is not set
# CONFIG_DA9052_WATCHDOG is not set
CONFIG_DA9055_WATCHDOG=m
CONFIG_DA9063_WATCHDOG=m
# CONFIG_DA9062_WATCHDOG is not set
# CONFIG_MENF21BMC_WATCHDOG is not set
# CONFIG_MENZ069_WATCHDOG is not set
CONFIG_WM831X_WATCHDOG=m
CONFIG_XILINX_WATCHDOG=m
CONFIG_ZIIRAVE_WATCHDOG=y
# CONFIG_SL28CPLD_WATCHDOG is not set
CONFIG_ARMADA_37XX_WATCHDOG=m
CONFIG_AT91RM9200_WATCHDOG=y
CONFIG_AT91SAM9X_WATCHDOG=y
CONFIG_SAMA5D4_WATCHDOG=m
CONFIG_CADENCE_WATCHDOG=m
# CONFIG_FTWDT010_WATCHDOG is not set
CONFIG_S3C2410_WATCHDOG=m
CONFIG_DW_WATCHDOG=y
CONFIG_EP93XX_WATCHDOG=m
# CONFIG_OMAP_WATCHDOG is not set
CONFIG_PNX4008_WATCHDOG=y
CONFIG_DAVINCI_WATCHDOG=m
CONFIG_K3_RTI_WATCHDOG=m
CONFIG_RN5T618_WATCHDOG=m
CONFIG_SUNXI_WATCHDOG=m
CONFIG_NPCM7XX_WATCHDOG=m
CONFIG_TWL4030_WATCHDOG=m
# CONFIG_STMP3XXX_RTC_WATCHDOG is not set
# CONFIG_TS72XX_WATCHDOG is not set
# CONFIG_MAX63XX_WATCHDOG is not set
CONFIG_MAX77620_WATCHDOG=m
CONFIG_IMX2_WDT=m
# CONFIG_IMX7ULP_WDT is not set
CONFIG_MOXART_WDT=y
CONFIG_TEGRA_WATCHDOG=m
CONFIG_QCOM_WDT=m
# CONFIG_MESON_GXBB_WATCHDOG is not set
CONFIG_MESON_WATCHDOG=y
# CONFIG_MEDIATEK_WATCHDOG is not set
CONFIG_DIGICOLOR_WATCHDOG=y
# CONFIG_LPC18XX_WATCHDOG is not set
CONFIG_RENESAS_WDT=m
# CONFIG_RENESAS_RZAWDT is not set
CONFIG_RENESAS_RZN1WDT=m
CONFIG_RENESAS_RZG2LWDT=m
CONFIG_ASPEED_WATCHDOG=m
CONFIG_SPRD_WATCHDOG=y
CONFIG_VISCONTI_WATCHDOG=m
# CONFIG_MSC313E_WATCHDOG is not set
CONFIG_APPLE_WATCHDOG=m
CONFIG_SUNPLUS_WATCHDOG=m
# CONFIG_SC520_WDT is not set
CONFIG_KEMPLD_WDT=m
# CONFIG_BCM47XX_WDT is not set
# CONFIG_BCM_KONA_WDT is not set
CONFIG_BCM7038_WDT=m
CONFIG_IMGPDC_WDT=m
CONFIG_MPC5200_WDT=y
CONFIG_MEN_A21_WDT=m
CONFIG_UML_WATCHDOG=y
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=m
CONFIG_SSB_SPROM=y
CONFIG_SSB_BLOCKIO=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
CONFIG_SSB_PCMCIAHOST=y
CONFIG_SSB_SDIOHOST_POSSIBLE=y
CONFIG_SSB_SDIOHOST=y
# CONFIG_SSB_HOST_SOC is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=m
# CONFIG_BCMA_HOST_SOC is not set
CONFIG_BCMA_DRIVER_MIPS=y
CONFIG_BCMA_PFLASH=y
CONFIG_BCMA_NFLASH=y
CONFIG_BCMA_DRIVER_GMAC_CMN=y
# CONFIG_BCMA_DRIVER_GPIO is not set
# CONFIG_BCMA_DEBUG is not set

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_SUN4I_GPADC=y
CONFIG_MFD_AS3711=y
CONFIG_PMIC_ADP5520=y
# CONFIG_MFD_AAT2870_CORE is not set
CONFIG_MFD_AT91_USART=m
CONFIG_MFD_BCM590XX=y
# CONFIG_MFD_BD9571MWV is not set
CONFIG_MFD_AXP20X=m
CONFIG_MFD_AXP20X_I2C=m
CONFIG_MFD_CROS_EC_DEV=m
CONFIG_MFD_MADERA=m
# CONFIG_MFD_MADERA_I2C is not set
# CONFIG_MFD_CS47L15 is not set
# CONFIG_MFD_CS47L35 is not set
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
CONFIG_MFD_CS47L92=y
CONFIG_MFD_ASIC3=y
CONFIG_PMIC_DA903X=y
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
CONFIG_MFD_DA9063=m
CONFIG_MFD_DA9150=y
# CONFIG_MFD_ENE_KB3930 is not set
CONFIG_MFD_EXYNOS_LPASS=y
CONFIG_MFD_MC13XXX=m
CONFIG_MFD_MC13XXX_I2C=m
CONFIG_MFD_MP2629=y
# CONFIG_MFD_MXS_LRADC is not set
CONFIG_MFD_MX25_TSADC=m
CONFIG_HTC_PASIC3=m
CONFIG_HTC_I2CPLD=y
CONFIG_MFD_IQS62X=m
CONFIG_MFD_KEMPLD=m
CONFIG_MFD_88PM800=y
CONFIG_MFD_88PM805=m
CONFIG_MFD_88PM860X=y
CONFIG_MFD_MAX14577=y
CONFIG_MFD_MAX77620=y
CONFIG_MFD_MAX77650=m
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=m
CONFIG_MFD_MAX77714=m
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
# CONFIG_MFD_MAX8997 is not set
# CONFIG_MFD_MAX8998 is not set
# CONFIG_MFD_MT6360 is not set
# CONFIG_MFD_MT6370 is not set
CONFIG_MFD_MT6397=m
# CONFIG_MFD_MENF21BMC is not set
# CONFIG_MFD_NTXEC is not set
# CONFIG_MFD_RETU is not set
CONFIG_MFD_PCF50633=y
CONFIG_PCF50633_ADC=m
CONFIG_PCF50633_GPIO=y
CONFIG_MFD_PM8XXX=y
CONFIG_MFD_SY7636A=m
# CONFIG_MFD_RT4831 is not set
CONFIG_MFD_RT5033=y
CONFIG_MFD_RT5120=y
CONFIG_MFD_RC5T583=y
CONFIG_MFD_SEC_CORE=m
CONFIG_MFD_SI476X_CORE=m
CONFIG_MFD_SIMPLE_MFD_I2C=m
# CONFIG_MFD_SL28CPLD is not set
CONFIG_MFD_SM501=m
# CONFIG_MFD_SM501_GPIO is not set
CONFIG_MFD_SKY81452=m
CONFIG_ABX500_CORE=y
# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
# CONFIG_MFD_TI_AM335X_TSCADC is not set
CONFIG_MFD_LP3943=y
# CONFIG_MFD_LP8788 is not set
# CONFIG_MFD_TI_LMU is not set
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=m
CONFIG_TPS65010=y
CONFIG_TPS6507X=m
CONFIG_MFD_TPS65086=y
CONFIG_MFD_TPS65090=y
CONFIG_MFD_TI_LP873X=y
CONFIG_MFD_TPS6586X=y
CONFIG_MFD_TPS65910=y
# CONFIG_MFD_TPS65912_I2C is not set
CONFIG_TWL4030_CORE=y
# CONFIG_MFD_TWL4030_AUDIO is not set
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=m
CONFIG_MFD_LM3533=m
# CONFIG_MFD_TQMX86 is not set
CONFIG_MFD_ARIZONA=y
CONFIG_MFD_ARIZONA_I2C=y
CONFIG_MFD_CS47L24=y
CONFIG_MFD_WM5102=y
CONFIG_MFD_WM5110=y
# CONFIG_MFD_WM8997 is not set
# CONFIG_MFD_WM8998 is not set
# CONFIG_MFD_WM8400 is not set
CONFIG_MFD_WM831X=y
CONFIG_MFD_WM831X_I2C=y
# CONFIG_MFD_WM8350_I2C is not set
CONFIG_MFD_WM8994=y
# CONFIG_MFD_STW481X is not set
CONFIG_MFD_STM32_LPTIMER=m
CONFIG_MFD_STM32_TIMERS=y
# CONFIG_MFD_STMFX is not set
CONFIG_MFD_WCD934X=m
CONFIG_MFD_ATC260X=m
CONFIG_MFD_ATC260X_I2C=m
CONFIG_MFD_KHADAS_MCU=y
CONFIG_MFD_ACER_A500_EC=m
# CONFIG_RAVE_SP_CORE is not set
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=m
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
CONFIG_REGULATOR_USERSPACE_CONSUMER=y
CONFIG_REGULATOR_88PG86X=m
CONFIG_REGULATOR_88PM800=m
# CONFIG_REGULATOR_88PM8607 is not set
# CONFIG_REGULATOR_ACT8865 is not set
CONFIG_REGULATOR_AD5398=m
CONFIG_REGULATOR_ANATOP=y
# CONFIG_REGULATOR_AS3711 is not set
# CONFIG_REGULATOR_ATC260X is not set
CONFIG_REGULATOR_AXP20X=m
CONFIG_REGULATOR_BCM590XX=m
# CONFIG_REGULATOR_DA903X is not set
CONFIG_REGULATOR_DA9055=m
CONFIG_REGULATOR_DA9062=y
CONFIG_REGULATOR_DA9210=y
CONFIG_REGULATOR_DA9211=y
CONFIG_REGULATOR_FAN53555=m
CONFIG_REGULATOR_FAN53880=m
CONFIG_REGULATOR_GPIO=m
CONFIG_REGULATOR_ISL9305=m
# CONFIG_REGULATOR_ISL6271A is not set
CONFIG_REGULATOR_LP3971=m
CONFIG_REGULATOR_LP3972=m
# CONFIG_REGULATOR_LP872X is not set
# CONFIG_REGULATOR_LP8755 is not set
CONFIG_REGULATOR_LTC3589=y
CONFIG_REGULATOR_LTC3676=m
# CONFIG_REGULATOR_MAX14577 is not set
CONFIG_REGULATOR_MAX1586=y
# CONFIG_REGULATOR_MAX77620 is not set
CONFIG_REGULATOR_MAX77650=y
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=m
CONFIG_REGULATOR_MAX8893=y
# CONFIG_REGULATOR_MAX8907 is not set
CONFIG_REGULATOR_MAX8952=y
# CONFIG_REGULATOR_MAX20086 is not set
CONFIG_REGULATOR_MAX77686=y
# CONFIG_REGULATOR_MAX77693 is not set
CONFIG_REGULATOR_MAX77802=m
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MC13XXX_CORE=m
CONFIG_REGULATOR_MC13783=m
# CONFIG_REGULATOR_MC13892 is not set
CONFIG_REGULATOR_MP8859=m
CONFIG_REGULATOR_MP886X=m
# CONFIG_REGULATOR_MT6311 is not set
# CONFIG_REGULATOR_MT6323 is not set
CONFIG_REGULATOR_MT6331=m
CONFIG_REGULATOR_MT6332=m
# CONFIG_REGULATOR_MT6358 is not set
# CONFIG_REGULATOR_MT6359 is not set
CONFIG_REGULATOR_MT6397=m
CONFIG_REGULATOR_PBIAS=m
CONFIG_REGULATOR_PCA9450=y
CONFIG_REGULATOR_PCF50633=m
CONFIG_REGULATOR_PV88060=m
CONFIG_REGULATOR_PV88080=y
CONFIG_REGULATOR_PV88090=y
CONFIG_REGULATOR_QCOM_RPMH=m
CONFIG_REGULATOR_QCOM_SPMI=y
CONFIG_REGULATOR_QCOM_USB_VBUS=y
CONFIG_REGULATOR_RC5T583=m
CONFIG_REGULATOR_RT4801=m
CONFIG_REGULATOR_RT5033=m
CONFIG_REGULATOR_RT5120=m
CONFIG_REGULATOR_RT5190A=m
# CONFIG_REGULATOR_RT5759 is not set
CONFIG_REGULATOR_RT6160=y
CONFIG_REGULATOR_RT6245=m
CONFIG_REGULATOR_RTQ2134=m
CONFIG_REGULATOR_RTMV20=y
CONFIG_REGULATOR_RTQ6752=y
CONFIG_REGULATOR_S2MPA01=m
CONFIG_REGULATOR_S2MPS11=m
CONFIG_REGULATOR_S5M8767=m
CONFIG_REGULATOR_SC2731=m
CONFIG_REGULATOR_SKY81452=m
CONFIG_REGULATOR_SLG51000=y
CONFIG_REGULATOR_STM32_BOOSTER=y
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STM32_PWR is not set
# CONFIG_REGULATOR_TI_ABB is not set
# CONFIG_REGULATOR_STW481X_VMMC is not set
CONFIG_REGULATOR_SY7636A=m
# CONFIG_REGULATOR_SY8106A is not set
CONFIG_REGULATOR_SY8824X=m
# CONFIG_REGULATOR_SY8827N is not set
# CONFIG_REGULATOR_TPS51632 is not set
# CONFIG_REGULATOR_TPS6105X is not set
CONFIG_REGULATOR_TPS62360=y
CONFIG_REGULATOR_TPS65023=m
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=m
# CONFIG_REGULATOR_TPS65090 is not set
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS6586X=y
CONFIG_REGULATOR_TPS65910=m
CONFIG_REGULATOR_TPS68470=m
CONFIG_REGULATOR_TWL4030=y
# CONFIG_REGULATOR_WM831X is not set
CONFIG_REGULATOR_WM8994=y
# CONFIG_REGULATOR_QCOM_LABIBB is not set
# CONFIG_RC_CORE is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y
CONFIG_CEC_PIN=y

#
# CEC support
#
# CONFIG_CEC_PIN_ERROR_INJ is not set
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
# CONFIG_CEC_CROS_EC is not set
CONFIG_CEC_MESON_AO=y
CONFIG_CEC_GPIO=y
CONFIG_CEC_SAMSUNG_S5P=y
# CONFIG_CEC_STI is not set
CONFIG_CEC_STM32=m
CONFIG_CEC_TEGRA=y
# end of CEC support

# CONFIG_MEDIA_SUPPORT is not set

#
# Graphics support
#
CONFIG_IMX_IPUV3_CORE=y
CONFIG_DRM=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_GEM_DMA_HELPER=y

#
# I2C encoder or helper chips
#
# CONFIG_DRM_I2C_CH7006 is not set
CONFIG_DRM_I2C_SIL164=m
CONFIG_DRM_I2C_NXP_TDA998X=m
CONFIG_DRM_I2C_NXP_TDA9950=m
# end of I2C encoder or helper chips

#
# ARM devices
#
# end of ARM devices

# CONFIG_DRM_KMB_DISPLAY is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
# CONFIG_DRM_ANALOGIX_ANX78XX is not set
# end of Display Interface Bridges

CONFIG_DRM_IMX=y
# CONFIG_DRM_IMX_PARALLEL_DISPLAY is not set
CONFIG_DRM_LOGICVC=m
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
# CONFIG_FB is not set
CONFIG_FB_OMAP_LCD_H3=y
CONFIG_MMP_DISP=m
CONFIG_MMP_DISP_CONTROLLER=y
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
# CONFIG_BACKLIGHT_CLASS_DEVICE is not set
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
# end of Graphics support

# CONFIG_SOUND is not set
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
# CONFIG_HIDRAW is not set
CONFIG_UHID=m
CONFIG_HID_GENERIC=m

#
# Special HID drivers
#
# CONFIG_HID_A4TECH is not set
CONFIG_HID_ACRUX=y
# CONFIG_HID_ACRUX_FF is not set
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=m
CONFIG_HID_CHERRY=m
# CONFIG_HID_COUGAR is not set
CONFIG_HID_MACALLY=y
CONFIG_HID_CMEDIA=m
CONFIG_HID_CYPRESS=y
# CONFIG_HID_DRAGONRISE is not set
CONFIG_HID_EMS_FF=y
CONFIG_HID_ELECOM=m
CONFIG_HID_EZKEY=m
CONFIG_HID_GEMBIRD=m
# CONFIG_HID_GFRM is not set
# CONFIG_HID_GLORIOUS is not set
CONFIG_HID_VIVALDI_COMMON=y
CONFIG_HID_VIVALDI=y
CONFIG_HID_KEYTOUCH=m
CONFIG_HID_KYE=m
# CONFIG_HID_WALTOP is not set
# CONFIG_HID_VIEWSONIC is not set
# CONFIG_HID_VRC2 is not set
CONFIG_HID_XIAOMI=m
CONFIG_HID_GYRATION=y
CONFIG_HID_ICADE=y
CONFIG_HID_ITE=m
# CONFIG_HID_JABRA is not set
CONFIG_HID_TWINHAN=y
# CONFIG_HID_KENSINGTON is not set
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LENOVO is not set
CONFIG_HID_MAGICMOUSE=m
CONFIG_HID_MALTRON=y
CONFIG_HID_MAYFLASH=y
# CONFIG_HID_REDRAGON is not set
CONFIG_HID_MICROSOFT=m
CONFIG_HID_MONTEREY=m
CONFIG_HID_MULTITOUCH=y
# CONFIG_HID_NTI is not set
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=m
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PXRC=m
CONFIG_HID_RAZER=y
# CONFIG_HID_PRIMAX is not set
CONFIG_HID_SAITEK=y
# CONFIG_HID_SEMITEK is not set
CONFIG_HID_SPEEDLINK=y
CONFIG_HID_STEAM=y
CONFIG_HID_STEELSERIES=y
CONFIG_HID_SUNPLUS=m
CONFIG_HID_RMI=m
# CONFIG_HID_GREENASIA is not set
CONFIG_HID_SMARTJOYPLUS=m
# CONFIG_SMARTJOYPLUS_FF is not set
# CONFIG_HID_TIVO is not set
CONFIG_HID_TOPSEED=y
CONFIG_HID_TOPRE=y
CONFIG_HID_UDRAW_PS3=y
CONFIG_HID_XINMO=m
CONFIG_HID_ZEROPLUS=m
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=y
CONFIG_HID_SENSOR_HUB=y
CONFIG_HID_SENSOR_CUSTOM_SENSOR=y
CONFIG_HID_ALPS=y
# end of Special HID drivers

#
# HID-BPF support
#
CONFIG_HID_BPF=y
# end of HID-BPF support

#
# I2C HID support
#
# end of I2C HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
# CONFIG_USB_SUPPORT is not set
CONFIG_MMC=y
CONFIG_MMC_TEST=y

#
# MMC/SD/SDIO Host Controller Drivers
#
# CONFIG_MMC_DEBUG is not set
CONFIG_MMC_SDHCI=m
CONFIG_MMC_SDHCI_IO_ACCESSORS=y
CONFIG_MMC_SDHCI_PLTFM=m
# CONFIG_MMC_SDHCI_OF_ESDHC is not set
CONFIG_MMC_SDHCI_OF_SPARX5=m
CONFIG_MMC_SDHCI_CNS3XXX=m
CONFIG_MMC_SDHCI_DOVE=m
CONFIG_MMC_SDHCI_TEGRA=m
CONFIG_MMC_SDHCI_S3C=m
# CONFIG_MMC_SDHCI_PXAV3 is not set
CONFIG_MMC_SDHCI_PXAV2=m
# CONFIG_MMC_SDHCI_S3C_DMA is not set
# CONFIG_MMC_SDHCI_BCM_KONA is not set
CONFIG_MMC_MOXART=m
# CONFIG_MMC_SDHCI_ST is not set
CONFIG_MMC_OMAP_HS=y
CONFIG_MMC_SDHCI_MSM=m
# CONFIG_MMC_DAVINCI is not set
# CONFIG_MMC_S3C is not set
# CONFIG_MMC_SDHCI_SPRD is not set
CONFIG_MMC_TMIO_CORE=y
CONFIG_MMC_TMIO=y
CONFIG_MMC_SDHI=m
# CONFIG_MMC_SDHI_SYS_DMAC is not set
CONFIG_MMC_SDHI_INTERNAL_DMAC=m
CONFIG_MMC_DW=y
CONFIG_MMC_DW_PLTFM=y
CONFIG_MMC_DW_BLUEFIELD=y
# CONFIG_MMC_DW_EXYNOS is not set
CONFIG_MMC_DW_HI3798CV200=m
# CONFIG_MMC_DW_K3 is not set
CONFIG_MMC_SH_MMCIF=y
CONFIG_MMC_USDHI6ROL0=y
CONFIG_MMC_CQHCI=m
CONFIG_MMC_HSQ=y
CONFIG_MMC_BCM2835=y
CONFIG_MMC_SDHCI_XENON=m
# CONFIG_MMC_OWL is not set
# CONFIG_MMC_LITEX is not set
CONFIG_MEMSTICK=y
# CONFIG_MEMSTICK_DEBUG is not set

#
# MemoryStick drivers
#
# CONFIG_MEMSTICK_UNSAFE_RESUME is not set

#
# MemoryStick Host Controller Drivers
#
# CONFIG_NEW_LEDS is not set
CONFIG_ACCESSIBILITY=y

#
# Speakup console speech
#
# end of Speakup console speech

CONFIG_INFINIBAND=y
# CONFIG_INFINIBAND_USER_MAD is not set
CONFIG_INFINIBAND_ADDR_TRANS=y
CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=y
CONFIG_INFINIBAND_VIRT_DMA=y
CONFIG_RDMA_SIW=m
# CONFIG_INFINIBAND_IPOIB is not set
CONFIG_INFINIBAND_RTRS=y
# CONFIG_INFINIBAND_RTRS_CLIENT is not set
CONFIG_INFINIBAND_RTRS_SERVER=y
CONFIG_RTC_LIB=y
CONFIG_RTC_CLASS=y
CONFIG_RTC_HCTOSYS=y
CONFIG_RTC_HCTOSYS_DEVICE="rtc0"
CONFIG_RTC_SYSTOHC=y
CONFIG_RTC_SYSTOHC_DEVICE="rtc0"
# CONFIG_RTC_DEBUG is not set
# CONFIG_RTC_NVMEM is not set

#
# RTC interfaces
#
# CONFIG_RTC_INTF_SYSFS is not set
# CONFIG_RTC_INTF_PROC is not set
# CONFIG_RTC_INTF_DEV is not set
# CONFIG_RTC_DRV_TEST is not set

#
# I2C RTC drivers
#
# CONFIG_RTC_DRV_88PM860X is not set
# CONFIG_RTC_DRV_88PM80X is not set
CONFIG_RTC_DRV_ABB5ZES3=m
CONFIG_RTC_DRV_ABEOZ9=y
CONFIG_RTC_DRV_ABX80X=m
CONFIG_RTC_DRV_BRCMSTB=y
# CONFIG_RTC_DRV_DS1307 is not set
CONFIG_RTC_DRV_DS1374=y
CONFIG_RTC_DRV_DS1374_WDT=y
CONFIG_RTC_DRV_DS1672=y
CONFIG_RTC_DRV_MAX6900=m
CONFIG_RTC_DRV_MAX8907=m
CONFIG_RTC_DRV_MAX77686=y
CONFIG_RTC_DRV_RS5C372=m
# CONFIG_RTC_DRV_ISL1208 is not set
CONFIG_RTC_DRV_ISL12022=y
# CONFIG_RTC_DRV_ISL12026 is not set
CONFIG_RTC_DRV_X1205=m
CONFIG_RTC_DRV_PCF8523=m
CONFIG_RTC_DRV_PCF85063=m
CONFIG_RTC_DRV_PCF85363=y
# CONFIG_RTC_DRV_PCF8563 is not set
CONFIG_RTC_DRV_PCF8583=y
CONFIG_RTC_DRV_M41T80=y
# CONFIG_RTC_DRV_M41T80_WDT is not set
CONFIG_RTC_DRV_BQ32K=m
# CONFIG_RTC_DRV_TPS6586X is not set
CONFIG_RTC_DRV_TPS65910=y
# CONFIG_RTC_DRV_RC5T583 is not set
# CONFIG_RTC_DRV_S35390A is not set
# CONFIG_RTC_DRV_FM3130 is not set
CONFIG_RTC_DRV_RX8010=y
# CONFIG_RTC_DRV_RX8581 is not set
CONFIG_RTC_DRV_RX8025=y
CONFIG_RTC_DRV_EM3027=y
CONFIG_RTC_DRV_RV3028=y
# CONFIG_RTC_DRV_RV3032 is not set
CONFIG_RTC_DRV_RV8803=m
CONFIG_RTC_DRV_S5M=m
CONFIG_RTC_DRV_SD3078=m

#
# SPI RTC drivers
#
CONFIG_RTC_I2C_AND_SPI=y

#
# SPI and I2C RTC drivers
#
# CONFIG_RTC_DRV_DS3232 is not set
# CONFIG_RTC_DRV_PCF2127 is not set
# CONFIG_RTC_DRV_RV3029C2 is not set
CONFIG_RTC_DRV_RX6110=y

#
# Platform RTC drivers
#
CONFIG_RTC_DRV_DS1286=y
# CONFIG_RTC_DRV_DS1511 is not set
# CONFIG_RTC_DRV_DS1553 is not set
CONFIG_RTC_DRV_DS1685_FAMILY=y
# CONFIG_RTC_DRV_DS1685 is not set
# CONFIG_RTC_DRV_DS1689 is not set
CONFIG_RTC_DRV_DS17285=y
# CONFIG_RTC_DRV_DS17485 is not set
# CONFIG_RTC_DRV_DS17885 is not set
CONFIG_RTC_DRV_DS1742=m
CONFIG_RTC_DRV_DS2404=y
CONFIG_RTC_DRV_DA9055=y
CONFIG_RTC_DRV_DA9063=y
CONFIG_RTC_DRV_STK17TA8=y
CONFIG_RTC_DRV_M48T86=y
CONFIG_RTC_DRV_M48T35=m
CONFIG_RTC_DRV_M48T59=y
CONFIG_RTC_DRV_MSM6242=m
CONFIG_RTC_DRV_BQ4802=y
# CONFIG_RTC_DRV_RP5C01 is not set
CONFIG_RTC_DRV_V3020=y
# CONFIG_RTC_DRV_GAMECUBE is not set
CONFIG_RTC_DRV_WM831X=m
CONFIG_RTC_DRV_SC27XX=m
CONFIG_RTC_DRV_SPEAR=y
CONFIG_RTC_DRV_PCF50633=y
CONFIG_RTC_DRV_CROS_EC=m

#
# on-CPU RTC drivers
#
# CONFIG_RTC_DRV_ASM9260 is not set
CONFIG_RTC_DRV_DAVINCI=m
CONFIG_RTC_DRV_DIGICOLOR=y
CONFIG_RTC_DRV_FSL_FTM_ALARM=m
CONFIG_RTC_DRV_MESON=m
# CONFIG_RTC_DRV_MESON_VRTC is not set
CONFIG_RTC_DRV_S3C=y
CONFIG_RTC_DRV_EP93XX=y
# CONFIG_RTC_DRV_GENERIC is not set
CONFIG_RTC_DRV_VT8500=m
CONFIG_RTC_DRV_SUNXI=y
# CONFIG_RTC_DRV_MV is not set
# CONFIG_RTC_DRV_FTRTC010 is not set
CONFIG_RTC_DRV_STMP=y
# CONFIG_RTC_DRV_MC13XXX is not set
CONFIG_RTC_DRV_LPC32XX=y
CONFIG_RTC_DRV_PM8XXX=m
CONFIG_RTC_DRV_TEGRA=y
CONFIG_RTC_DRV_MOXART=y
# CONFIG_RTC_DRV_MT2712 is not set
CONFIG_RTC_DRV_MT6397=m
CONFIG_RTC_DRV_MT7622=m
CONFIG_RTC_DRV_XGENE=m
CONFIG_RTC_DRV_STM32=y
# CONFIG_RTC_DRV_RTD119X is not set
# CONFIG_RTC_DRV_TI_K3 is not set

#
# HID Sensor RTC drivers
#
# CONFIG_RTC_DRV_GOLDFISH is not set
CONFIG_RTC_DRV_MSC313=y
CONFIG_DMADEVICES=y
CONFIG_DMADEVICES_DEBUG=y
# CONFIG_DMADEVICES_VDEBUG is not set

#
# DMA Devices
#
CONFIG_ASYNC_TX_ENABLE_CHANNEL_SWITCH=y
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_ALTERA_MSGDMA=m
# CONFIG_APPLE_ADMAC is not set
CONFIG_AXI_DMAC=m
CONFIG_DMA_JZ4780=y
# CONFIG_DMA_SA11X0 is not set
CONFIG_DMA_SUN6I=m
CONFIG_EP93XX_DMA=y
# CONFIG_IMG_MDC_DMA is not set
CONFIG_INTEL_IDMA64=m
# CONFIG_INTEL_IOP_ADMA is not set
CONFIG_K3_DMA=y
# CONFIG_MCF_EDMA is not set
# CONFIG_MMP_PDMA is not set
# CONFIG_MMP_TDMA is not set
CONFIG_MV_XOR=y
# CONFIG_MXS_DMA is not set
CONFIG_NBPFAXI_DMA=y
CONFIG_STM32_DMA=y
# CONFIG_STM32_DMAMUX is not set
CONFIG_SPRD_DMA=m
# CONFIG_S3C24XX_DMAC is not set
# CONFIG_TEGRA20_APB_DMA is not set
# CONFIG_TEGRA210_ADMA is not set
CONFIG_TIMB_DMA=m
# CONFIG_XGENE_DMA is not set
# CONFIG_XILINX_ZYNQMP_DMA is not set
CONFIG_MTK_HSDMA=y
CONFIG_MTK_CQDMA=y
CONFIG_QCOM_ADM=y
CONFIG_QCOM_HIDMA_MGMT=y
# CONFIG_QCOM_HIDMA is not set
# CONFIG_DW_DMAC is not set
CONFIG_SF_PDMA=y
CONFIG_RENESAS_DMA=y
# CONFIG_SH_DMAE_BASE is not set
CONFIG_RCAR_DMAC=y
CONFIG_RENESAS_USB_DMAC=m
CONFIG_RZ_DMAC=m
# CONFIG_TI_EDMA is not set
CONFIG_DMA_OMAP=y
CONFIG_TI_DMA_CROSSBAR=y
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
CONFIG_DMATEST=y
CONFIG_DMA_ENGINE_RAID=y

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
CONFIG_SW_SYNC=y
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
# CONFIG_DMABUF_DEBUG is not set
CONFIG_DMABUF_SELFTESTS=m
CONFIG_DMABUF_HEAPS=y
CONFIG_DMABUF_SYSFS_STATS=y
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# end of DMABUF options

# CONFIG_AUXDISPLAY is not set
# CONFIG_PANEL is not set
# CONFIG_VFIO is not set
CONFIG_IRQ_BYPASS_MANAGER=m
CONFIG_VIRT_DRIVERS=y
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
CONFIG_VIRTIO_MENU=y
CONFIG_VIRTIO_VDPA=m
CONFIG_VIRTIO_BALLOON=m
# CONFIG_VIRTIO_INPUT is not set
CONFIG_VIRTIO_MMIO=y
# CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES is not set
CONFIG_VDPA=m
CONFIG_VHOST_IOTLB=m
CONFIG_VHOST=m
CONFIG_VHOST_MENU=y
CONFIG_VHOST_NET=m
CONFIG_VHOST_VSOCK=m
CONFIG_VHOST_VDPA=m
CONFIG_VHOST_CROSS_ENDIAN_LEGACY=y

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

# CONFIG_GREYBUS is not set
CONFIG_COMEDI=y
# CONFIG_COMEDI_DEBUG is not set
CONFIG_COMEDI_DEFAULT_BUF_SIZE_KB=2048
CONFIG_COMEDI_DEFAULT_BUF_MAXSIZE_KB=20480
# CONFIG_COMEDI_MISC_DRIVERS is not set
CONFIG_COMEDI_ISA_DRIVERS=y
CONFIG_COMEDI_PCL711=y
CONFIG_COMEDI_PCL724=m
# CONFIG_COMEDI_PCL726 is not set
CONFIG_COMEDI_PCL730=m
CONFIG_COMEDI_PCL812=m
CONFIG_COMEDI_PCL816=m
CONFIG_COMEDI_PCL818=m
CONFIG_COMEDI_PCM3724=y
CONFIG_COMEDI_AMPLC_DIO200_ISA=m
CONFIG_COMEDI_AMPLC_PC236_ISA=y
CONFIG_COMEDI_AMPLC_PC263_ISA=y
CONFIG_COMEDI_RTI800=m
# CONFIG_COMEDI_RTI802 is not set
CONFIG_COMEDI_DAC02=y
CONFIG_COMEDI_DAS16M1=y
CONFIG_COMEDI_DAS08_ISA=y
CONFIG_COMEDI_DAS16=y
CONFIG_COMEDI_DAS800=y
CONFIG_COMEDI_DAS1800=m
# CONFIG_COMEDI_DAS6402 is not set
CONFIG_COMEDI_DT2801=y
CONFIG_COMEDI_DT2811=y
CONFIG_COMEDI_DT2814=m
# CONFIG_COMEDI_DT2815 is not set
# CONFIG_COMEDI_DT2817 is not set
# CONFIG_COMEDI_DT282X is not set
# CONFIG_COMEDI_DMM32AT is not set
# CONFIG_COMEDI_FL512 is not set
# CONFIG_COMEDI_AIO_AIO12_8 is not set
CONFIG_COMEDI_AIO_IIRO_16=m
# CONFIG_COMEDI_II_PCI20KC is not set
CONFIG_COMEDI_C6XDIGIO=y
# CONFIG_COMEDI_MPC624 is not set
CONFIG_COMEDI_ADQ12B=y
CONFIG_COMEDI_NI_AT_A2150=m
# CONFIG_COMEDI_NI_AT_AO is not set
# CONFIG_COMEDI_NI_ATMIO is not set
CONFIG_COMEDI_NI_ATMIO16D=y
CONFIG_COMEDI_NI_LABPC_ISA=m
CONFIG_COMEDI_PCMAD=m
# CONFIG_COMEDI_PCMDA12 is not set
CONFIG_COMEDI_PCMMIO=y
CONFIG_COMEDI_PCMUIO=y
CONFIG_COMEDI_MULTIQ3=y
# CONFIG_COMEDI_S526 is not set
CONFIG_COMEDI_PCMCIA_DRIVERS=m
CONFIG_COMEDI_CB_DAS16_CS=m
CONFIG_COMEDI_DAS08_CS=m
CONFIG_COMEDI_NI_DAQ_700_CS=m
CONFIG_COMEDI_NI_DAQ_DIO24_CS=m
CONFIG_COMEDI_NI_LABPC_CS=m
# CONFIG_COMEDI_NI_MIO_CS is not set
CONFIG_COMEDI_QUATECH_DAQP_CS=m
CONFIG_COMEDI_8254=y
CONFIG_COMEDI_8255=y
CONFIG_COMEDI_8255_SA=m
CONFIG_COMEDI_KCOMEDILIB=y
CONFIG_COMEDI_AMPLC_DIO200=m
CONFIG_COMEDI_AMPLC_PC236=y
CONFIG_COMEDI_DAS08=y
CONFIG_COMEDI_NI_LABPC=m
# CONFIG_COMEDI_TESTS is not set
# CONFIG_STAGING is not set
CONFIG_GOLDFISH=y
CONFIG_GOLDFISH_PIPE=m
CONFIG_CHROME_PLATFORMS=y
CONFIG_CROS_EC=m
CONFIG_CROS_EC_I2C=m
CONFIG_CROS_EC_PROTO=y
CONFIG_CROS_EC_CHARDEV=m
CONFIG_CROS_EC_LIGHTBAR=m
# CONFIG_CROS_EC_DEBUGFS is not set
CONFIG_CROS_EC_SENSORHUB=m
# CONFIG_CROS_EC_SYSFS is not set
CONFIG_CROS_USBPD_LOGGER=m
CONFIG_CROS_USBPD_NOTIFY=m
# CONFIG_MELLANOX_PLATFORM is not set
CONFIG_OLPC_XO175=y
# CONFIG_SURFACE_PLATFORMS is not set
CONFIG_HAVE_CLK=y
CONFIG_HAVE_LEGACY_CLK=y
# CONFIG_HWSPINLOCK is not set
CONFIG_MAILBOX=y
CONFIG_IMX_MBOX=y
# CONFIG_ROCKCHIP_MBOX is not set
CONFIG_ALTERA_MBOX=m
CONFIG_POLARFIRE_SOC_MAILBOX=y
# CONFIG_QCOM_APCS_IPC is not set
CONFIG_BCM_PDC_MBOX=y
# CONFIG_STM32_IPCC is not set
CONFIG_MTK_ADSP_MBOX=m
CONFIG_MTK_CMDQ_MBOX=y
CONFIG_SUN6I_MSGBOX=m
# CONFIG_SPRD_MBOX is not set
CONFIG_QCOM_IPCC=y

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CHAR=m
# CONFIG_RPMSG_CTRL is not set
CONFIG_RPMSG_NS=m
CONFIG_RPMSG_QCOM_GLINK=y
CONFIG_RPMSG_QCOM_GLINK_RPM=y
CONFIG_RPMSG_VIRTIO=m
# end of Rpmsg drivers

#
# SOC (System On Chip) specific Drivers
#
# CONFIG_OWL_PM_DOMAINS is not set

#
# Amlogic SoC drivers
#
# CONFIG_MESON_CANVAS is not set
CONFIG_MESON_CLK_MEASURE=y
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
CONFIG_APPLE_PMGR_PWRSTATE=y
# CONFIG_APPLE_RTKIT is not set
CONFIG_APPLE_SART=y
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
CONFIG_ASPEED_LPC_CTRL=m
CONFIG_ASPEED_LPC_SNOOP=m
# CONFIG_ASPEED_UART_ROUTING is not set
CONFIG_ASPEED_P2A_CTRL=m
CONFIG_ASPEED_SOCINFO=y
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
CONFIG_AT91_SOC_SFR=m

#
# Broadcom SoC drivers
#
# CONFIG_SOC_BCM63XX is not set
CONFIG_SOC_BRCMSTB=y
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# CONFIG_SOC_IMX8M is not set
CONFIG_SOC_IMX9=y
# end of i.MX SoC drivers

#
# IXP4xx SoC drivers
#
# CONFIG_IXP4XX_QMGR is not set
# CONFIG_IXP4XX_NPE is not set
# end of IXP4xx SoC drivers

#
# Enable LiteX SoC Builder specific drivers
#
CONFIG_LITEX=y
CONFIG_LITEX_SOC_CONTROLLER=y
# end of Enable LiteX SoC Builder specific drivers

#
# MediaTek SoC drivers
#
# CONFIG_MTK_CMDQ is not set
# CONFIG_MTK_DEVAPC is not set
CONFIG_MTK_INFRACFG=y
CONFIG_MTK_SCPSYS_PM_DOMAINS=y
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

# CONFIG_POLARFIRE_SOC_SYS_CTRL is not set

#
# Qualcomm SoC drivers
#
CONFIG_QCOM_GENI_SE=m
CONFIG_QCOM_GSBI=y
CONFIG_QCOM_LLCC=m
CONFIG_QCOM_PDR_HELPERS=y
CONFIG_QCOM_QMI_HELPERS=y
CONFIG_QCOM_RPMH=m
# CONFIG_QCOM_SMD_RPM is not set
CONFIG_QCOM_SPM=m
CONFIG_QCOM_WCNSS_CTRL=y
CONFIG_QCOM_APR=y
# CONFIG_QCOM_ICC_BWMON is not set
# end of Qualcomm SoC drivers

CONFIG_SOC_RENESAS=y
# CONFIG_RST_RCAR is not set
CONFIG_SYSC_RCAR=y
CONFIG_SYSC_RCAR_GEN4=y
# CONFIG_SYSC_R8A77995 is not set
# CONFIG_SYSC_R8A7794 is not set
# CONFIG_SYSC_R8A77990 is not set
CONFIG_SYSC_R8A7779=y
# CONFIG_SYSC_R8A7790 is not set
# CONFIG_SYSC_R8A7795 is not set
CONFIG_SYSC_R8A7791=y
CONFIG_SYSC_R8A77965=y
# CONFIG_SYSC_R8A77960 is not set
# CONFIG_SYSC_R8A77961 is not set
CONFIG_SYSC_R8A779F0=y
# CONFIG_SYSC_R8A7792 is not set
CONFIG_SYSC_R8A77980=y
CONFIG_SYSC_R8A77970=y
CONFIG_SYSC_R8A779A0=y
CONFIG_SYSC_R8A779G0=y
# CONFIG_SYSC_RMOBILE is not set
CONFIG_SYSC_R8A77470=y
# CONFIG_SYSC_R8A7745 is not set
# CONFIG_SYSC_R8A7742 is not set
CONFIG_SYSC_R8A7743=y
# CONFIG_SYSC_R8A774C0 is not set
CONFIG_SYSC_R8A774E1=y
CONFIG_SYSC_R8A774A1=y
CONFIG_SYSC_R8A774B1=y
CONFIG_ROCKCHIP_GRF=y
CONFIG_ROCKCHIP_PM_DOMAINS=y
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
CONFIG_SOC_TI=y
CONFIG_UX500_SOC_ID=y

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

# CONFIG_PM_DEVFREQ is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_ADC_JACK=y
CONFIG_EXTCON_FSA9480=m
CONFIG_EXTCON_GPIO=m
# CONFIG_EXTCON_MAX14577 is not set
CONFIG_EXTCON_MAX3355=y
# CONFIG_EXTCON_MAX77693 is not set
# CONFIG_EXTCON_PTN5150 is not set
CONFIG_EXTCON_QCOM_SPMI_MISC=m
CONFIG_EXTCON_RT8973A=m
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=m
# CONFIG_EXTCON_USBC_CROS_EC is not set
# CONFIG_MEMORY is not set
CONFIG_IIO=y
CONFIG_IIO_BUFFER=y
CONFIG_IIO_BUFFER_CB=m
CONFIG_IIO_BUFFER_DMA=m
CONFIG_IIO_BUFFER_DMAENGINE=m
CONFIG_IIO_BUFFER_HW_CONSUMER=m
CONFIG_IIO_KFIFO_BUF=y
CONFIG_IIO_TRIGGERED_BUFFER=y
CONFIG_IIO_CONFIGFS=m
CONFIG_IIO_TRIGGER=y
CONFIG_IIO_CONSUMERS_PER_TRIGGER=2
CONFIG_IIO_SW_DEVICE=m
# CONFIG_IIO_SW_TRIGGER is not set
CONFIG_IIO_TRIGGERED_EVENT=m

#
# Accelerometers
#
CONFIG_ADXL313=m
CONFIG_ADXL313_I2C=m
CONFIG_ADXL345=y
CONFIG_ADXL345_I2C=y
CONFIG_ADXL355=m
CONFIG_ADXL355_I2C=m
# CONFIG_ADXL367_I2C is not set
CONFIG_ADXL372=m
CONFIG_ADXL372_I2C=m
# CONFIG_BMA180 is not set
# CONFIG_BMA400 is not set
CONFIG_BMC150_ACCEL=y
CONFIG_BMC150_ACCEL_I2C=y
# CONFIG_DA280 is not set
CONFIG_DA311=y
# CONFIG_DMARD06 is not set
CONFIG_DMARD09=y
CONFIG_DMARD10=y
CONFIG_FXLS8962AF=y
CONFIG_FXLS8962AF_I2C=y
CONFIG_HID_SENSOR_ACCEL_3D=y
# CONFIG_IIO_CROS_EC_ACCEL_LEGACY is not set
CONFIG_IIO_ST_ACCEL_3AXIS=y
CONFIG_IIO_ST_ACCEL_I2C_3AXIS=m
CONFIG_KXSD9=y
# CONFIG_KXSD9_I2C is not set
# CONFIG_KXCJK1013 is not set
CONFIG_MC3230=y
CONFIG_MMA7455=y
CONFIG_MMA7455_I2C=y
# CONFIG_MMA7660 is not set
# CONFIG_MMA8452 is not set
CONFIG_MMA9551_CORE=y
CONFIG_MMA9551=y
# CONFIG_MMA9553 is not set
# CONFIG_MSA311 is not set
CONFIG_MXC4005=y
CONFIG_MXC6255=m
CONFIG_STK8312=y
# CONFIG_STK8BA50 is not set
# end of Accelerometers

#
# Analog to digital converters
#
CONFIG_AD7091R5=m
CONFIG_AD7291=y
# CONFIG_AD7606_IFACE_PARALLEL is not set
CONFIG_AD799X=y
CONFIG_AT91_SAMA5D2_ADC=m
CONFIG_AXP20X_ADC=m
# CONFIG_AXP288_ADC is not set
# CONFIG_BCM_IPROC_ADC is not set
CONFIG_BERLIN2_ADC=m
CONFIG_CC10001_ADC=y
# CONFIG_DA9150_GPADC is not set
CONFIG_ENVELOPE_DETECTOR=m
CONFIG_FSL_MX25_ADC=m
# CONFIG_HX711 is not set
# CONFIG_INA2XX_ADC is not set
CONFIG_INGENIC_ADC=y
CONFIG_IMX7D_ADC=m
# CONFIG_IMX8QXP_ADC is not set
# CONFIG_LPC18XX_ADC is not set
CONFIG_LPC32XX_ADC=y
# CONFIG_LTC2471 is not set
CONFIG_LTC2485=y
# CONFIG_LTC2497 is not set
# CONFIG_MAX1363 is not set
# CONFIG_MAX9611 is not set
CONFIG_MCP3422=m
# CONFIG_MEDIATEK_MT6577_AUXADC is not set
CONFIG_MEN_Z188_ADC=m
# CONFIG_MP2629_ADC is not set
CONFIG_NAU7802=y
CONFIG_NPCM_ADC=y
CONFIG_QCOM_VADC_COMMON=m
CONFIG_QCOM_PM8XXX_XOADC=m
# CONFIG_RCAR_GYRO_ADC is not set
CONFIG_ROCKCHIP_SARADC=y
CONFIG_RICHTEK_RTQ6056=m
CONFIG_RZG2L_ADC=y
CONFIG_SC27XX_ADC=y
CONFIG_SPEAR_ADC=m
# CONFIG_SD_ADC_MODULATOR is not set
CONFIG_STM32_DFSDM_CORE=y
CONFIG_STM32_DFSDM_ADC=m
CONFIG_SUN4I_GPADC=y
CONFIG_TI_ADC081C=y
CONFIG_TI_ADS1015=m
# CONFIG_TWL4030_MADC is not set
# CONFIG_TWL6030_GPADC is not set
CONFIG_VF610_ADC=m
CONFIG_XILINX_XADC=y
CONFIG_XILINX_AMS=y
# end of Analog to digital converters

#
# Analog to digital and digital to analog converters
#
# end of Analog to digital and digital to analog converters

#
# Analog Front Ends
#
CONFIG_IIO_RESCALE=y
# end of Analog Front Ends

#
# Amplifiers
#
# CONFIG_HMC425 is not set
# end of Amplifiers

#
# Capacitance to digital converters
#
# CONFIG_AD7150 is not set
CONFIG_AD7746=y
# end of Capacitance to digital converters

#
# Chemical Sensors
#
CONFIG_ATLAS_PH_SENSOR=m
CONFIG_ATLAS_EZO_SENSOR=m
CONFIG_BME680=m
CONFIG_BME680_I2C=m
CONFIG_CCS811=m
CONFIG_IAQCORE=m
CONFIG_PMS7003=m
CONFIG_SCD30_CORE=m
CONFIG_SCD30_I2C=m
CONFIG_SCD30_SERIAL=m
CONFIG_SCD4X=m
CONFIG_SENSIRION_SGP30=m
CONFIG_SENSIRION_SGP40=m
CONFIG_SPS30=m
CONFIG_SPS30_I2C=m
CONFIG_SPS30_SERIAL=m
# CONFIG_SENSEAIR_SUNRISE_CO2 is not set
CONFIG_VZ89X=y
# end of Chemical Sensors

CONFIG_IIO_CROS_EC_SENSORS_CORE=m
CONFIG_IIO_CROS_EC_SENSORS=m
# CONFIG_IIO_CROS_EC_SENSORS_LID_ANGLE is not set

#
# Hid Sensor IIO Common
#
CONFIG_HID_SENSOR_IIO_COMMON=y
CONFIG_HID_SENSOR_IIO_TRIGGER=y
# end of Hid Sensor IIO Common

CONFIG_IIO_MS_SENSORS_I2C=y

#
# IIO SCMI Sensors
#
CONFIG_IIO_SCMI=m
# end of IIO SCMI Sensors

#
# SSP Sensor Common
#
# end of SSP Sensor Common

CONFIG_IIO_ST_SENSORS_I2C=m
CONFIG_IIO_ST_SENSORS_CORE=y

#
# Digital to analog converters
#
CONFIG_AD5064=m
CONFIG_AD5380=y
CONFIG_AD5446=m
# CONFIG_AD5593R is not set
CONFIG_AD5686=y
CONFIG_AD5696_I2C=y
CONFIG_DPOT_DAC=m
CONFIG_DS4424=y
CONFIG_LPC18XX_DAC=m
CONFIG_M62332=y
# CONFIG_MAX517 is not set
CONFIG_MAX5821=y
CONFIG_MCP4725=y
CONFIG_STM32_DAC=y
CONFIG_STM32_DAC_CORE=y
# CONFIG_TI_DAC5571 is not set
CONFIG_VF610_DAC=m
# end of Digital to analog converters

#
# IIO dummy driver
#
# CONFIG_IIO_SIMPLE_DUMMY is not set
# end of IIO dummy driver

#
# Filters
#
# end of Filters

#
# Frequency Synthesizers DDS/PLL
#

#
# Clock Generator/Distribution
#
# end of Clock Generator/Distribution

#
# Phase-Locked Loop (PLL) frequency synthesizers
#
# end of Phase-Locked Loop (PLL) frequency synthesizers
# end of Frequency Synthesizers DDS/PLL

#
# Digital gyroscope sensors
#
# CONFIG_BMG160 is not set
CONFIG_FXAS21002C=y
CONFIG_FXAS21002C_I2C=y
# CONFIG_HID_SENSOR_GYRO_3D is not set
CONFIG_MPU3050=y
CONFIG_MPU3050_I2C=y
# CONFIG_IIO_ST_GYRO_3AXIS is not set
CONFIG_ITG3200=m
# end of Digital gyroscope sensors

#
# Health Sensors
#

#
# Heart Rate Monitors
#
CONFIG_AFE4404=m
# CONFIG_MAX30100 is not set
CONFIG_MAX30102=y
# end of Heart Rate Monitors
# end of Health Sensors

#
# Humidity sensors
#
CONFIG_AM2315=m
# CONFIG_DHT11 is not set
CONFIG_HDC100X=y
CONFIG_HDC2010=y
CONFIG_HID_SENSOR_HUMIDITY=y
# CONFIG_HTS221 is not set
CONFIG_HTU21=y
CONFIG_SI7005=y
CONFIG_SI7020=m
# end of Humidity sensors

#
# Inertial measurement units
#
# CONFIG_BMI160_I2C is not set
CONFIG_BOSCH_BNO055=m
CONFIG_BOSCH_BNO055_SERIAL=m
CONFIG_BOSCH_BNO055_I2C=m
# CONFIG_FXOS8700_I2C is not set
CONFIG_KMX61=m
# CONFIG_INV_ICM42600_I2C is not set
CONFIG_INV_MPU6050_IIO=m
CONFIG_INV_MPU6050_I2C=m
CONFIG_IIO_ST_LSM6DSX=y
CONFIG_IIO_ST_LSM6DSX_I2C=y
# CONFIG_IIO_ST_LSM9DS0 is not set
# end of Inertial measurement units

#
# Light sensors
#
CONFIG_ADJD_S311=m
CONFIG_ADUX1020=m
CONFIG_AL3010=y
CONFIG_AL3320A=y
CONFIG_APDS9300=m
CONFIG_APDS9960=m
# CONFIG_AS73211 is not set
CONFIG_BH1750=m
CONFIG_BH1780=m
CONFIG_CM32181=m
CONFIG_CM3232=y
CONFIG_CM3323=m
# CONFIG_CM3605 is not set
CONFIG_CM36651=m
# CONFIG_IIO_CROS_EC_LIGHT_PROX is not set
# CONFIG_GP2AP002 is not set
CONFIG_GP2AP020A00F=m
# CONFIG_IQS621_ALS is not set
CONFIG_SENSORS_ISL29018=y
CONFIG_SENSORS_ISL29028=y
# CONFIG_ISL29125 is not set
# CONFIG_HID_SENSOR_ALS is not set
CONFIG_HID_SENSOR_PROX=y
# CONFIG_JSA1212 is not set
CONFIG_RPR0521=y
CONFIG_SENSORS_LM3533=m
CONFIG_LTR501=y
# CONFIG_LTRF216A is not set
CONFIG_LV0104CS=y
CONFIG_MAX44000=m
CONFIG_MAX44009=y
# CONFIG_NOA1305 is not set
CONFIG_OPT3001=y
CONFIG_PA12203001=y
# CONFIG_SI1133 is not set
CONFIG_SI1145=y
# CONFIG_STK3310 is not set
CONFIG_ST_UVIS25=y
CONFIG_ST_UVIS25_I2C=y
# CONFIG_TCS3414 is not set
# CONFIG_TCS3472 is not set
CONFIG_SENSORS_TSL2563=y
# CONFIG_TSL2583 is not set
# CONFIG_TSL2591 is not set
CONFIG_TSL2772=m
# CONFIG_TSL4531 is not set
CONFIG_US5182D=m
CONFIG_VCNL4000=m
CONFIG_VCNL4035=m
CONFIG_VEML6030=m
CONFIG_VEML6070=m
CONFIG_VL6180=y
# CONFIG_ZOPT2201 is not set
# end of Light sensors

#
# Magnetometer sensors
#
# CONFIG_AK8974 is not set
CONFIG_AK8975=y
CONFIG_AK09911=y
CONFIG_BMC150_MAGN=y
CONFIG_BMC150_MAGN_I2C=y
CONFIG_MAG3110=y
# CONFIG_HID_SENSOR_MAGNETOMETER_3D is not set
CONFIG_MMC35240=m
CONFIG_IIO_ST_MAGN_3AXIS=y
CONFIG_IIO_ST_MAGN_I2C_3AXIS=m
# CONFIG_SENSORS_HMC5843_I2C is not set
CONFIG_SENSORS_RM3100=y
CONFIG_SENSORS_RM3100_I2C=y
CONFIG_YAMAHA_YAS530=y
# end of Magnetometer sensors

#
# Multiplexers
#
# CONFIG_IIO_MUX is not set
# end of Multiplexers

#
# Inclinometer sensors
#
CONFIG_HID_SENSOR_INCLINOMETER_3D=m
CONFIG_HID_SENSOR_DEVICE_ROTATION=m
# end of Inclinometer sensors

#
# Triggers - standalone
#
CONFIG_IIO_INTERRUPT_TRIGGER=y
# CONFIG_IIO_STM32_LPTIMER_TRIGGER is not set
CONFIG_IIO_STM32_TIMER_TRIGGER=y
CONFIG_IIO_SYSFS_TRIGGER=y
# end of Triggers - standalone

#
# Linear and angular position sensors
#
CONFIG_IQS624_POS=y
CONFIG_HID_SENSOR_CUSTOM_INTEL_HINGE=m
# end of Linear and angular position sensors

#
# Digital potentiometers
#
CONFIG_AD5110=m
CONFIG_AD5272=y
# CONFIG_DS1803 is not set
CONFIG_MAX5432=m
CONFIG_MCP4018=m
CONFIG_MCP4531=m
# CONFIG_TPL0102 is not set
# end of Digital potentiometers

#
# Digital potentiostats
#
CONFIG_LMP91000=m
# end of Digital potentiostats

#
# Pressure sensors
#
CONFIG_ABP060MG=m
CONFIG_BMP280=m
CONFIG_BMP280_I2C=m
CONFIG_IIO_CROS_EC_BARO=m
CONFIG_DLHL60D=m
# CONFIG_DPS310 is not set
CONFIG_HID_SENSOR_PRESS=m
CONFIG_HP03=m
# CONFIG_ICP10100 is not set
CONFIG_MPL115=y
CONFIG_MPL115_I2C=y
# CONFIG_MPL3115 is not set
CONFIG_MS5611=m
CONFIG_MS5611_I2C=m
# CONFIG_MS5637 is not set
CONFIG_IIO_ST_PRESS=y
CONFIG_IIO_ST_PRESS_I2C=m
CONFIG_T5403=m
CONFIG_HP206C=m
CONFIG_ZPA2326=m
CONFIG_ZPA2326_I2C=m
# end of Pressure sensors

#
# Lightning sensors
#
# end of Lightning sensors

#
# Proximity and distance sensors
#
CONFIG_CROS_EC_MKBP_PROXIMITY=m
CONFIG_ISL29501=m
# CONFIG_LIDAR_LITE_V2 is not set
CONFIG_MB1232=y
CONFIG_PING=m
CONFIG_RFD77402=y
CONFIG_SRF04=m
CONFIG_SX_COMMON=y
# CONFIG_SX9310 is not set
CONFIG_SX9324=y
CONFIG_SX9360=y
# CONFIG_SX9500 is not set
CONFIG_SRF08=m
# CONFIG_VCNL3020 is not set
CONFIG_VL53L0X_I2C=m
# end of Proximity and distance sensors

#
# Resolver to digital converters
#
# end of Resolver to digital converters

#
# Temperature sensors
#
CONFIG_IQS620AT_TEMP=m
CONFIG_HID_SENSOR_TEMP=m
CONFIG_MLX90614=y
CONFIG_MLX90632=y
CONFIG_TMP006=m
# CONFIG_TMP007 is not set
CONFIG_TMP117=m
CONFIG_TSYS01=m
# CONFIG_TSYS02D is not set
# end of Temperature sensors

# CONFIG_PWM is not set

#
# IRQ chip support
#
CONFIG_AL_FIC=y
CONFIG_MADERA_IRQ=m
CONFIG_RENESAS_INTC_IRQPIN=y
CONFIG_RENESAS_IRQC=y
# CONFIG_RENESAS_RZA1_IRQC is not set
CONFIG_RENESAS_RZG2L_IRQC=y
# CONFIG_SL28CPLD_INTC is not set
# CONFIG_TS4800_IRQ is not set
# CONFIG_INGENIC_TCU_IRQ is not set
CONFIG_IRQ_UNIPHIER_AIDET=y
# CONFIG_MESON_IRQ_GPIO is not set
# CONFIG_IMX_IRQSTEER is not set
# CONFIG_IMX_INTMUX is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
CONFIG_MCHP_EIC=y
CONFIG_SUNPLUS_SP7021_INTC=y
# end of IRQ chip support

# CONFIG_IPACK_BUS is not set
CONFIG_RESET_CONTROLLER=y
CONFIG_RESET_A10SR=y
# CONFIG_RESET_ATH79 is not set
CONFIG_RESET_AXS10X=y
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
CONFIG_RESET_BRCMSTB=m
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_HSDK is not set
CONFIG_RESET_IMX7=m
CONFIG_RESET_LANTIQ=y
CONFIG_RESET_LPC18XX=y
# CONFIG_RESET_MCHP_SPARX5 is not set
CONFIG_RESET_MESON=m
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_NPCM is not set
CONFIG_RESET_PISTACHIO=y
CONFIG_RESET_QCOM_AOSS=m
CONFIG_RESET_QCOM_PDC=y
CONFIG_RESET_RASPBERRYPI=y
CONFIG_RESET_RZG2L_USBPHY_CTRL=m
# CONFIG_RESET_SCMI is not set
CONFIG_RESET_SIMPLE=y
CONFIG_RESET_SOCFPGA=y
CONFIG_RESET_STARFIVE_JH7100=y
CONFIG_RESET_SUNPLUS=y
# CONFIG_RESET_SUNXI is not set
# CONFIG_RESET_TI_SCI is not set
CONFIG_RESET_TI_SYSCON=m
CONFIG_RESET_TI_TPS380X=m
CONFIG_RESET_TN48M_CPLD=m
# CONFIG_RESET_ZYNQ is not set
CONFIG_COMMON_RESET_HI3660=y
CONFIG_COMMON_RESET_HI6220=y

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
CONFIG_PHY_PISTACHIO_USB=m
CONFIG_PHY_CAN_TRANSCEIVER=y

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
CONFIG_BCM_KONA_USB2_PHY=y
CONFIG_PHY_NS2_PCIE=y
# end of PHY drivers for Broadcom platforms

CONFIG_PHY_HI6220_USB=y
CONFIG_PHY_HI3660_USB=m
CONFIG_PHY_HI3670_USB=y
CONFIG_PHY_HI3670_PCIE=m
# CONFIG_PHY_HISTB_COMBPHY is not set
CONFIG_PHY_HISI_INNO_USB2=m
CONFIG_PHY_PXA_28NM_HSIC=m
CONFIG_PHY_PXA_28NM_USB2=m
# CONFIG_PHY_PXA_USB is not set
CONFIG_PHY_MMP3_USB=m
# CONFIG_PHY_MMP3_HSIC is not set
CONFIG_PHY_MT7621_PCI=y
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
CONFIG_PHY_ROCKCHIP_DPHY_RX0=y
CONFIG_PHY_ROCKCHIP_PCIE=m
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
CONFIG_PHY_EXYNOS_MIPI_VIDEO=m
# CONFIG_PHY_SAMSUNG_USB2 is not set
CONFIG_PHY_ST_SPEAR1310_MIPHY=m
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
CONFIG_PHY_STIH407_USB=y
CONFIG_PHY_TEGRA194_P2U=y
# CONFIG_PHY_DA8XX_USB is not set
# CONFIG_OMAP_CONTROL_PHY is not set
# CONFIG_TI_PIPE3 is not set
CONFIG_PHY_INTEL_KEEMBAY_EMMC=y
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
CONFIG_MCB=m
CONFIG_MCB_LPC=m
CONFIG_RAS=y

#
# Android
#
# end of Android

# CONFIG_DAX is not set
# CONFIG_NVMEM is not set

#
# HW tracing support
#
CONFIG_STM=m
CONFIG_STM_PROTO_BASIC=m
# CONFIG_STM_PROTO_SYS_T is not set
CONFIG_STM_DUMMY=m
CONFIG_STM_SOURCE_CONSOLE=m
CONFIG_STM_SOURCE_HEARTBEAT=m
CONFIG_INTEL_TH=y
CONFIG_INTEL_TH_GTH=m
# CONFIG_INTEL_TH_STH is not set
CONFIG_INTEL_TH_MSU=y
CONFIG_INTEL_TH_PTI=y
# CONFIG_INTEL_TH_DEBUG is not set
# end of HW tracing support

CONFIG_FPGA=m
CONFIG_FPGA_MGR_SOCFPGA=m
CONFIG_FPGA_MGR_SOCFPGA_A10=m
CONFIG_ALTERA_PR_IP_CORE=m
CONFIG_FPGA_MGR_ZYNQ_FPGA=m
# CONFIG_FPGA_BRIDGE is not set
# CONFIG_FPGA_DFL is not set
CONFIG_FPGA_MGR_ZYNQMP_FPGA=m
# CONFIG_FPGA_MGR_VERSAL_FPGA is not set
# CONFIG_TEE is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=m
CONFIG_MUX_GPIO=m
CONFIG_MUX_MMIO=m
# end of Multiplexer drivers

CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
CONFIG_SLIMBUS=m
CONFIG_SLIM_QCOM_CTRL=m
# CONFIG_SLIM_QCOM_NGD_CTRL is not set
CONFIG_INTERCONNECT=y
# CONFIG_INTERCONNECT_IMX is not set
CONFIG_INTERCONNECT_QCOM_OSM_L3=m
CONFIG_INTERCONNECT_SAMSUNG=y
CONFIG_INTERCONNECT_EXYNOS=y
CONFIG_COUNTER=m
CONFIG_104_QUAD_8=m
CONFIG_INTERRUPT_CNT=m
CONFIG_STM32_TIMER_CNT=m
CONFIG_STM32_LPTIMER_CNT=m
CONFIG_TI_EQEP=m
CONFIG_TI_ECAP_CAPTURE=m
CONFIG_MOST=m
# CONFIG_MOST_CDEV is not set
# CONFIG_PECI is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
CONFIG_EXPORTFS_BLOCK_OPS=y
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
# CONFIG_DNOTIFY is not set
# CONFIG_INOTIFY_USER is not set
CONFIG_FANOTIFY=y
# CONFIG_QUOTA is not set
CONFIG_AUTOFS4_FS=y
CONFIG_AUTOFS_FS=y
CONFIG_FUSE_FS=y
CONFIG_CUSE=y
CONFIG_VIRTIO_FS=y
CONFIG_OVERLAY_FS=m
# CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
CONFIG_OVERLAY_FS_INDEX=y
# CONFIG_OVERLAY_FS_NFS_EXPORT is not set
# CONFIG_OVERLAY_FS_METACOPY is not set

#
# Caches
#
CONFIG_NETFS_SUPPORT=m
CONFIG_NETFS_STATS=y
CONFIG_FSCACHE=m
# CONFIG_FSCACHE_STATS is not set
# CONFIG_FSCACHE_DEBUG is not set
# end of Caches

#
# Pseudo filesystems
#
CONFIG_PROC_FS=y
CONFIG_PROC_SYSCTL=y
# CONFIG_PROC_CHILDREN is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

# CONFIG_MISC_FILESYSTEMS is not set
# CONFIG_NETWORK_FILESYSTEMS is not set
# CONFIG_NLS is not set
# CONFIG_DLM is not set
CONFIG_UNICODE=m
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
CONFIG_PERSISTENT_KEYRINGS=y
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=m
# CONFIG_USER_DECRYPTED_DATA is not set
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
# CONFIG_SECURITY is not set
CONFIG_SECURITYFS=y
CONFIG_STATIC_USERMODEHELPER=y
CONFIG_STATIC_USERMODEHELPER_PATH="/sbin/usermode-helper"
CONFIG_DEFAULT_SECURITY_DAC=y
CONFIG_LSM="landlock,lockdown,yama,loadpin,safesetid,integrity,bpf"

#
# Kernel hardening options
#

#
# Memory initialization
#
CONFIG_CC_HAS_AUTO_VAR_INIT_PATTERN=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO_BARE=y
CONFIG_CC_HAS_AUTO_VAR_INIT_ZERO=y
CONFIG_INIT_STACK_NONE=y
# CONFIG_INIT_STACK_ALL_PATTERN is not set
# CONFIG_INIT_STACK_ALL_ZERO is not set
CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
CONFIG_INIT_ON_FREE_DEFAULT_ON=y
CONFIG_CC_HAS_ZERO_CALL_USED_REGS=y
CONFIG_ZERO_CALL_USED_REGS=y
# end of Memory initialization

CONFIG_RANDSTRUCT_NONE=y
# end of Kernel hardening options
# end of Security options

CONFIG_CRYPTO=y

#
# Crypto core or helper
#
CONFIG_CRYPTO_FIPS=y
CONFIG_CRYPTO_FIPS_NAME="Linux Kernel Cryptographic API"
# CONFIG_CRYPTO_FIPS_CUSTOM_VERSION is not set
CONFIG_CRYPTO_ALGAPI=y
CONFIG_CRYPTO_ALGAPI2=y
CONFIG_CRYPTO_AEAD=y
CONFIG_CRYPTO_AEAD2=y
CONFIG_CRYPTO_SKCIPHER=y
CONFIG_CRYPTO_SKCIPHER2=y
CONFIG_CRYPTO_HASH=y
CONFIG_CRYPTO_HASH2=y
CONFIG_CRYPTO_RNG=y
CONFIG_CRYPTO_RNG2=y
CONFIG_CRYPTO_RNG_DEFAULT=y
CONFIG_CRYPTO_AKCIPHER2=y
CONFIG_CRYPTO_AKCIPHER=y
CONFIG_CRYPTO_KPP2=y
CONFIG_CRYPTO_KPP=y
CONFIG_CRYPTO_ACOMP2=y
CONFIG_CRYPTO_MANAGER=y
CONFIG_CRYPTO_MANAGER2=y
# CONFIG_CRYPTO_USER is not set
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
# CONFIG_CRYPTO_MANAGER_EXTRA_TESTS is not set
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=m
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=m
CONFIG_CRYPTO_DH_RFC7919_GROUPS=y
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
CONFIG_CRYPTO_ECDSA=y
CONFIG_CRYPTO_ECRDSA=m
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
# CONFIG_CRYPTO_AES_TI is not set
CONFIG_CRYPTO_ANUBIS=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_BLOWFISH_COMMON=m
# CONFIG_CRYPTO_CAMELLIA is not set
CONFIG_CRYPTO_CAST_COMMON=y
CONFIG_CRYPTO_CAST5=y
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_DES=y
CONFIG_CRYPTO_FCRYPT=y
CONFIG_CRYPTO_KHAZAD=m
# CONFIG_CRYPTO_SEED is not set
CONFIG_CRYPTO_SERPENT=m
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TEA=y
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
CONFIG_CRYPTO_ADIANTUM=m
# CONFIG_CRYPTO_ARC4 is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
# CONFIG_CRYPTO_CTS is not set
CONFIG_CRYPTO_ECB=y
# CONFIG_CRYPTO_HCTR2 is not set
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=m
# CONFIG_CRYPTO_PCBC is not set
CONFIG_CRYPTO_XTS=m
CONFIG_CRYPTO_NHPOLY1305=m
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
CONFIG_CRYPTO_CHACHA20POLY1305=y
CONFIG_CRYPTO_CCM=y
CONFIG_CRYPTO_GCM=y
CONFIG_CRYPTO_SEQIV=y
CONFIG_CRYPTO_ECHAINIV=m
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
CONFIG_CRYPTO_BLAKE2B=m
CONFIG_CRYPTO_CMAC=m
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
# CONFIG_CRYPTO_MD4 is not set
CONFIG_CRYPTO_MD5=y
# CONFIG_CRYPTO_MICHAEL_MIC is not set
CONFIG_CRYPTO_POLY1305=y
# CONFIG_CRYPTO_RMD160 is not set
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
CONFIG_CRYPTO_SHA3=y
CONFIG_CRYPTO_SM3=m
CONFIG_CRYPTO_SM3_GENERIC=m
CONFIG_CRYPTO_STREEBOG=m
CONFIG_CRYPTO_VMAC=y
CONFIG_CRYPTO_WP512=y
# CONFIG_CRYPTO_XCBC is not set
CONFIG_CRYPTO_XXHASH=m
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=m
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
# CONFIG_CRYPTO_LZO is not set
CONFIG_CRYPTO_842=m
CONFIG_CRYPTO_LZ4=m
# CONFIG_CRYPTO_LZ4HC is not set
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
CONFIG_CRYPTO_ANSI_CPRNG=m
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
# CONFIG_CRYPTO_DRBG_CTR is not set
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
CONFIG_CRYPTO_USER_API=y
CONFIG_CRYPTO_USER_API_HASH=y
CONFIG_CRYPTO_USER_API_SKCIPHER=m
# CONFIG_CRYPTO_USER_API_RNG is not set
CONFIG_CRYPTO_USER_API_AEAD=y
CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=y
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y
# CONFIG_CRYPTO_HW is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
# CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
CONFIG_PKCS7_MESSAGE_PARSER=y
CONFIG_PKCS7_TEST_KEY=y
CONFIG_SIGNED_PE_FILE_VERIFICATION=y
CONFIG_FIPS_SIGNATURE_SELFTEST=y

#
# Certificates for signature checking
#
CONFIG_MODULE_SIG_KEY="certs/signing_key.pem"
# CONFIG_MODULE_SIG_KEY_TYPE_RSA is not set
CONFIG_MODULE_SIG_KEY_TYPE_ECDSA=y
CONFIG_SYSTEM_TRUSTED_KEYRING=y
CONFIG_SYSTEM_TRUSTED_KEYS=""
# CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
CONFIG_SECONDARY_TRUSTED_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
CONFIG_SYSTEM_REVOCATION_LIST=y
CONFIG_SYSTEM_REVOCATION_KEYS=""
# CONFIG_SYSTEM_BLACKLIST_AUTH_UPDATE is not set
# end of Certificates for signature checking

CONFIG_BINARY_PRINTF=y

#
# Library routines
#
CONFIG_LINEAR_RANGES=y
CONFIG_PACKING=y
CONFIG_BITREVERSE=y
CONFIG_GENERIC_STRNCPY_FROM_USER=y
CONFIG_GENERIC_STRNLEN_USER=y
CONFIG_GENERIC_NET_UTILS=y
CONFIG_CORDIC=m
CONFIG_PRIME_NUMBERS=y
CONFIG_GENERIC_PCI_IOMAP=y
CONFIG_GENERIC_IOMAP=y
CONFIG_STMP_DEVICE=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_ARC4=m
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
CONFIG_CRYPTO_LIB_POLY1305=y
CONFIG_CRYPTO_LIB_CHACHA20POLY1305=y
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=m
# CONFIG_CRC_T10DIF is not set
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
CONFIG_CRC32_SELFTEST=m
# CONFIG_CRC32_SLICEBY8 is not set
CONFIG_CRC32_SLICEBY4=y
# CONFIG_CRC32_SARWATE is not set
# CONFIG_CRC32_BIT is not set
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=m
CONFIG_XXHASH=m
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=m
CONFIG_842_DECOMPRESS=m
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZ4_COMPRESS=m
CONFIG_LZ4_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
# CONFIG_XZ_DEC_POWERPC is not set
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
CONFIG_XZ_DEC_ARMTHUMB=y
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
# CONFIG_XZ_DEC_TEST is not set
CONFIG_DECOMPRESS_LZMA=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_LZ4=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_BCH=m
CONFIG_BCH_CONST_PARAMS=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_DMA=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_DMA_NONCOHERENT_MMAP=y
# CONFIG_DMA_API_DEBUG is not set
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
CONFIG_DQL=y
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_NLATTR=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
CONFIG_IRQ_POLL=y
CONFIG_MPILIB=y
CONFIG_DIMLIB=y
CONFIG_OID_REGISTRY=y
CONFIG_UACCESS_MEMCPY=y
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# end of Library routines

CONFIG_POLYNOMIAL=m

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
# CONFIG_PRINTK_CALLER is not set
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_SYMBOLIC_ERRNAME=y
# CONFIG_DEBUG_BUGVERBOSE is not set
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
# CONFIG_DEBUG_MISC is not set

#
# Compile-time checks and compiler options
#
CONFIG_AS_HAS_NON_CONST_LEB128=y
CONFIG_DEBUG_INFO_NONE=y
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
# CONFIG_DEBUG_INFO_DWARF5 is not set
CONFIG_FRAME_WARN=1024
# CONFIG_STRIP_ASM_SYMS is not set
# CONFIG_READABLE_ASM is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_FRAME_POINTER is not set
# CONFIG_VMLINUX_MAP is not set
# CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
# end of Compile-time checks and compiler options

#
# Generic Kernel Debugging Instruments
#
CONFIG_MAGIC_SYSRQ=y
CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=0x1
# CONFIG_MAGIC_SYSRQ_SERIAL is not set
CONFIG_DEBUG_FS=y
# CONFIG_DEBUG_FS_ALLOW_ALL is not set
# CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
CONFIG_DEBUG_FS_ALLOW_NONE=y
CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_BOUNDS=y
CONFIG_UBSAN_BOUNDS=y
CONFIG_UBSAN_ONLY_BOUNDS=y
CONFIG_UBSAN_SHIFT=y
CONFIG_UBSAN_DIV_ZERO=y
CONFIG_UBSAN_UNREACHABLE=y
# CONFIG_UBSAN_BOOL is not set
CONFIG_UBSAN_ENUM=y
# CONFIG_TEST_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
CONFIG_DEBUG_NET=y
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
# CONFIG_DEBUG_PAGEALLOC is not set
# CONFIG_PAGE_POISONING is not set
CONFIG_DEBUG_OBJECTS=y
# CONFIG_DEBUG_OBJECTS_SELFTEST is not set
CONFIG_DEBUG_OBJECTS_FREE=y
# CONFIG_DEBUG_OBJECTS_TIMERS is not set
CONFIG_DEBUG_OBJECTS_WORK=y
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_DEBUG_OBJECTS_ENABLE_DEFAULT=1
CONFIG_SHRINKER_DEBUG=y
# CONFIG_DEBUG_STACK_USAGE is not set
CONFIG_SCHED_STACK_END_CHECK=y
# CONFIG_DEBUG_VM is not set
# CONFIG_DEBUG_NOMMU_REGIONS is not set
# CONFIG_DEBUG_MEMORY_INIT is not set
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

# CONFIG_DEBUG_SHIRQ is not set

#
# Debug Oops, Lockups and Hangs
#
CONFIG_PANIC_ON_OOPS=y
CONFIG_PANIC_ON_OOPS_VALUE=1
CONFIG_PANIC_TIMEOUT=0
# CONFIG_SOFTLOCKUP_DETECTOR is not set
# CONFIG_DETECT_HUNG_TASK is not set
# CONFIG_WQ_WATCHDOG is not set
CONFIG_TEST_LOCKUP=m
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# CONFIG_SCHED_DEBUG is not set
CONFIG_SCHED_INFO=y
CONFIG_SCHEDSTATS=y
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_DEBUG_RT_MUTEXES=y
CONFIG_DEBUG_SPINLOCK=y
CONFIG_DEBUG_MUTEXES=y
CONFIG_DEBUG_RWSEMS=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
# CONFIG_LOCK_TORTURE_TEST is not set
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_SCF_TORTURE_TEST=m
# end of Lock Debugging (spinlocks, mutexes, etc...)

CONFIG_DEBUG_IRQFLAGS=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_KOBJECT=y
CONFIG_HAVE_DEBUG_BUGVERBOSE=y

#
# Debug kernel data structures
#
# CONFIG_DEBUG_LIST is not set
CONFIG_DEBUG_PLIST=y
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
# CONFIG_BUG_ON_DATA_CORRUPTION is not set
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=m
CONFIG_RCU_TORTURE_TEST=m
CONFIG_RCU_REF_SCALE_TEST=y
# CONFIG_RCU_TRACE is not set
CONFIG_RCU_EQS_DEBUG=y
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
# CONFIG_SAMPLES is not set

#
# m68k Debugging
#
# CONFIG_BOOTPARAM is not set
# CONFIG_FULLDEBUG is not set
CONFIG_HIGHPROFILE=y
CONFIG_NO_KERNEL_MSG=y
CONFIG_BDM_DISABLE=y
# end of m68k Debugging

#
# Kernel Testing and Coverage
#
# CONFIG_KUNIT is not set
CONFIG_NOTIFIER_ERROR_INJECTION=m
# CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
CONFIG_NETDEV_NOTIFIER_ERROR_INJECT=m
# CONFIG_FAULT_INJECTION is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_RUNTIME_TESTING_MENU is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking

CONFIG_WARN_MISSING_DOCUMENTS=y
CONFIG_WARN_ABI_ERRORS=y
# end of Kernel hacking

--q6gMsH+Lt4YGyYg8--
