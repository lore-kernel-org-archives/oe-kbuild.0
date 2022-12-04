Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605997C
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Dec 2022 02:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1670119622; x=1701655622;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SrpyvQjTfH/ci+82CneEqbP3rX9l/aYZR/zuFUQWj44=;
  b=RAXQVHSWkKiyo5VHDCq1rBnWztpU973EtyfUMVfqZsXFO57wBRYzkgBf
   6YgRF68ly2I3odTgfWH9lqh9GQpvgK3H2h4xAsvMocHcxzSzFAEKtXpUD
   EM6xDWRfkdJTO+JnEheyDBHSmWMGGBOnyr+Y1qCaUJ/6IvekKWUMDStsJ
   xrPdAgqVjJHWEjCoQVrPhZ5yHeMuz6ae7OEqJeokGQwRUM2X9JuEtj/59
   2X0nEryATtZseqy0obTDpbSnaw32n9bdh4ggPKBkunp/goI/X+2HDLwAt
   HrsK8sTvY7o9g6rOm6ahcNU8HMAoJWyM0czuu0Rt+tIjknwV7+xffDi8/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10550"; a="303773381"
X-IronPort-AV: E=Sophos;i="5.96,216,1665471600"; 
   d="scan'208";a="303773381"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2022 18:07:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10550"; a="734203207"
X-IronPort-AV: E=Sophos;i="5.96,216,1665471600"; 
   d="scan'208";a="734203207"
Received: from lkp-server01.sh.intel.com (HELO 4d912534d779) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Dec 2022 18:06:59 -0800
Received: from kbuild by 4d912534d779 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1p1ePC-0000Ub-38;
	Sun, 04 Dec 2022 02:06:58 +0000
Date: Sun, 4 Dec 2022 10:06:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 6715/12617]
 drivers/hid/bpf/entrypoints/entrypoints.lskel.h:508:79: sparse: sparse:
 string too long (30572 bytes, 8191 bytes max)
Message-ID: <202212041019.dFJVQlJz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="HWmUydCSCUNB5659"
Content-Disposition: inline


--HWmUydCSCUNB5659
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/hid/bpf/entrypoints/entrypoints.lskel.h:508:79: sparse: sparse: string too long (30572 bytes, 8191 bytes max)"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Benjamin Tissoires <benjamin.tissoires@redhat.com>
CC: Jiri Kosina <jkosina@suse.cz>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   5be860bfc73408bc1a8af9167955e480ecebba84
commit: f5c27da4e3c8a2e42fb4f41a0c685debcb9af294 [6715/12617] HID: initial BPF implementation
:::::: branch date: 2 days ago
:::::: commit date: 3 weeks ago
config: arc-randconfig-s042-20221204
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=f5c27da4e3c8a2e42fb4f41a0c685debcb9af294
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout f5c27da4e3c8a2e42fb4f41a0c685debcb9af294
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arc SHELL=/bin/bash drivers/hid/ fs// io_uring// kernel/ mm//

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/hid/bpf/hid_bpf_dispatch.c: note: in included file:
>> drivers/hid/bpf/entrypoints/entrypoints.lskel.h:508:79: sparse: sparse: string too long (30572 bytes, 8191 bytes max)
   drivers/hid/bpf/entrypoints/entrypoints.lskel.h:113:29: sparse: sparse: unknown escape sequence: '--
   drivers/hid/bpf/hid_bpf_jmp_table.c: note: in included file:
>> drivers/hid/bpf/entrypoints/entrypoints.lskel.h:508:79: sparse: sparse: string too long (30572 bytes, 8191 bytes max)
   drivers/hid/bpf/entrypoints/entrypoints.lskel.h:113:29: sparse: sparse: unknown escape sequence: '4-drivers/hid/bpf/hid_bpf_jmp_table.c:464:52: sparse: sparse: non size-preserving integer to pointer cast

vim +508 drivers/hid/bpf/entrypoints/entrypoints.lskel.h

f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  104  
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  105  static inline int
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  106  entrypoints_bpf__load(struct entrypoints_bpf *skel)
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  107  {
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  108  	struct bpf_load_and_run_opts opts = {};
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  109  	int err;
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  110  
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  111  	opts.ctx = (struct bpf_loader_ctx *)skel;
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  112  	opts.data_sz = 10624;
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  113  	opts.data = (void *)"\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  114  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  115  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  116  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  117  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  118  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  119  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  120  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  121  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  122  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  123  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  124  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  125  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  126  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  127  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  128  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  129  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  130  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  131  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  132  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  133  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  134  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  135  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  136  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  137  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  138  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  139  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  140  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  141  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  142  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  143  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  144  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  145  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  146  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x9f\xeb\x01\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  147  \x18\0\0\0\0\0\0\0\xf0\x11\0\0\xf0\x11\0\0\x0e\x0c\0\0\0\0\0\0\0\0\0\x02\x03\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  148  \0\0\x01\0\0\0\0\0\0\x01\x04\0\0\0\x20\0\0\x01\0\0\0\0\0\0\0\x03\0\0\0\0\x02\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  149  \0\0\x04\0\0\0\x03\0\0\0\x05\0\0\0\0\0\0\x01\x04\0\0\0\x20\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  150  \x02\x06\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x02\0\0\0\x04\0\0\0\0\x04\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  151  \0\0\0\x02\x08\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x02\0\0\0\x04\0\0\0\x04\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  152  \0\0\0\x04\0\0\x04\x20\0\0\0\x19\0\0\0\x01\0\0\0\0\0\0\0\x1e\0\0\0\x05\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  153  \x40\0\0\0\x2a\0\0\0\x07\0\0\0\x80\0\0\0\x33\0\0\0\x07\0\0\0\xc0\0\0\0\x3e\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  154  \0\0\0\0\x0e\x09\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\x02\x0c\0\0\0\0\0\0\0\0\0\0\x03\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  155  \0\0\0\0\x02\0\0\0\x04\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\x02\x0e\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  156  \0\x03\0\0\0\0\x02\0\0\0\x04\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\x02\x10\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  157  \0\0\0\0\x02\0\0\0\0\0\0\0\0\0\0\0\x02\x12\0\0\0\x4c\0\0\0\0\0\0\x08\x13\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  158  \x51\0\0\0\0\0\0\x01\x01\0\0\0\x08\0\0\0\0\0\0\0\x04\0\0\x04\x20\0\0\0\x19\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  159  \0\x0b\0\0\0\0\0\0\0\x1e\0\0\0\x0d\0\0\0\x40\0\0\0\x5f\0\0\0\x0f\0\0\0\x80\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  160  \0\x63\0\0\0\x11\0\0\0\xc0\0\0\0\x69\0\0\0\0\0\0\x0e\x14\0\0\0\x01\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  161  \0\0\0\0\x02\x17\0\0\0\x73\0\0\0\0\0\0\x01\x08\0\0\0\x40\0\0\0\0\0\0\0\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  162  \x0d\x02\0\0\0\x86\0\0\0\x16\0\0\0\x8a\0\0\0\x01\0\0\x0c\x18\0\0\0\x30\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  163  \x05\0\0\x04\x20\0\0\0\x3c\x01\0\0\x1b\0\0\0\0\0\0\0\x42\x01\0\0\x1d\0\0\0\x40\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  164  \0\0\0\x46\x01\0\0\x1b\0\0\0\x80\0\0\0\x55\x01\0\0\x1f\0\0\0\xa0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  165  \x20\0\0\0\xc0\0\0\0\x61\x01\0\0\0\0\0\x08\x1c\0\0\0\x67\x01\0\0\0\0\0\x01\x04\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  166  \0\0\0\x20\0\0\0\0\0\0\0\0\0\0\x02\x1e\0\0\0\0\0\0\0\0\0\0\x0a\xa9\0\0\0\x74\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  167  \x01\0\0\x04\0\0\x06\x04\0\0\0\x84\x01\0\0\0\0\0\0\x95\x01\0\0\x01\0\0\0\xa7\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  168  \x01\0\0\x02\0\0\0\xba\x01\0\0\x03\0\0\0\0\0\0\0\x02\0\0\x05\x04\0\0\0\xcb\x01\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  169  \0\0\x21\0\0\0\0\0\0\0\xd2\x01\0\0\x21\0\0\0\0\0\0\0\xd7\x01\0\0\0\0\0\x08\x02\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  170  \0\0\0\0\0\0\0\x01\0\0\x0d\x02\0\0\0\x86\0\0\0\x16\0\0\0\x13\x02\0\0\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  171  \x0c\x22\0\0\0\x82\x02\0\0\x14\0\0\x04\xe8\0\0\0\0\0\0\0\x25\0\0\0\0\0\0\0\x87\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  172  \x02\0\0\x2c\0\0\0\x80\0\0\0\x8e\x02\0\0\x2f\0\0\0\0\x01\0\0\x96\x02\0\0\x30\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  173  \0\0\x40\x01\0\0\x9b\x02\0\0\x32\0\0\0\x80\x01\0\0\xa2\x02\0\0\x41\0\0\0\xc0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  174  \x01\0\0\xaa\x02\0\0\x1c\0\0\0\0\x02\0\0\xb2\x02\0\0\x47\0\0\0\x20\x02\0\0\xb9\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  175  \x02\0\0\x48\0\0\0\x40\x02\0\0\xc4\x02\0\0\x4d\0\0\0\x40\x03\0\0\xca\x02\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  176  \x4f\0\0\0\x80\x03\0\0\xd2\x02\0\0\x5d\0\0\0\x80\x04\0\0\xd9\x02\0\0\x5f\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  177  \xc0\x04\0\0\xde\x02\0\0\x61\0\0\0\xc0\x05\0\0\xe8\x02\0\0\x10\0\0\0\0\x06\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  178  \xf3\x02\0\0\x10\0\0\0\x40\x06\0\0\0\x03\0\0\x63\0\0\0\x80\x06\0\0\x05\x03\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  179  \x64\0\0\0\xc0\x06\0\0\x0f\x03\0\0\x65\0\0\0\0\x07\0\0\x18\x03\0\0\x65\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  180  \x20\x07\0\0\0\0\0\0\x03\0\0\x05\x10\0\0\0\x21\x03\0\0\x26\0\0\0\0\0\0\0\x29\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  181  \x03\0\0\x28\0\0\0\0\0\0\0\x33\x03\0\0\x1c\0\0\0\0\0\0\0\x40\x03\0\0\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  182  \x04\x08\0\0\0\x4b\x03\0\0\x27\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x02\x26\0\0\0\x50\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  183  \x03\0\0\x02\0\0\x04\x10\0\0\0\x4b\x03\0\0\x29\0\0\0\0\0\0\0\x5e\x03\0\0\x2a\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  184  \0\0\x40\0\0\0\0\0\0\0\0\0\0\x02\x28\0\0\0\0\0\0\0\0\0\0\x02\x2b\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  185  \x01\0\0\x0d\0\0\0\0\0\0\0\0\x29\0\0\0\x63\x03\0\0\x02\0\0\x04\x10\0\0\0\x68\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  186  \x03\0\0\x2d\0\0\0\0\0\0\0\x6c\x03\0\0\x2e\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\x02\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  187  \xb0\0\0\0\0\0\0\0\0\0\0\x02\xa3\0\0\0\0\0\0\0\0\0\0\x02\x6d\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  188  \0\x02\x31\0\0\0\0\0\0\0\0\0\0\x0a\xa5\0\0\0\x73\x03\0\0\0\0\0\x08\x33\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  189  \x7e\x03\0\0\x01\0\0\x04\x04\0\0\0\0\0\0\0\x34\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  190  \x05\x04\0\0\0\x87\x03\0\0\x35\0\0\0\0\0\0\0\x8d\x03\0\0\x01\0\0\x04\x04\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  191  \x9a\x03\0\0\x36\0\0\0\0\0\0\0\xa3\x03\0\0\0\0\0\x08\x37\0\0\0\xb3\x03\0\0\x01\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  192  \0\0\x04\x04\0\0\0\0\0\0\0\x38\0\0\0\0\0\0\0\0\0\0\0\x03\0\0\x05\x04\0\0\0\xbd\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  193  \x03\0\0\x39\0\0\0\0\0\0\0\0\0\0\0\x3b\0\0\0\0\0\0\0\0\0\0\0\x3d\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  194  \xc1\x03\0\0\0\0\0\x08\x3a\0\0\0\0\0\0\0\x01\0\0\x04\x04\0\0\0\xca\x03\0\0\x02\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  195  \0\0\0\0\0\0\0\0\0\0\0\x02\0\0\x04\x02\0\0\0\xd2\x03\0\0\x3c\0\0\0\0\0\0\0\xd9\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  196  \x03\0\0\x3c\0\0\0\x08\0\0\0\xe1\x03\0\0\0\0\0\x08\x12\0\0\0\0\0\0\0\x02\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  197  \x04\x04\0\0\0\xe4\x03\0\0\x3e\0\0\0\0\0\0\0\xf3\x03\0\0\x3e\0\0\0\x10\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  198  \xf8\x03\0\0\0\0\0\x08\x3f\0\0\0\xfc\x03\0\0\0\0\0\x08\x40\0\0\0\x02\x04\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  199  \0\0\x01\x02\0\0\0\x10\0\0\0\x11\x04\0\0\0\0\0\x08\x42\0\0\0\x1f\x04\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  200  \x08\x43\0\0\0\0\0\0\0\x01\0\0\x04\x08\0\0\0\xca\x03\0\0\x44\0\0\0\0\0\0\0\x2a\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  201  \x04\0\0\0\0\0\x08\x45\0\0\0\x2e\x04\0\0\0\0\0\x08\x46\0\0\0\x34\x04\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  202  \x01\x08\0\0\0\x40\0\0\x01\x3e\x04\0\0\0\0\0\x08\x1c\0\0\0\x46\x04\0\0\x04\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  203  \x04\x20\0\0\0\x4c\x04\0\0\x41\0\0\0\0\0\0\0\x52\x04\0\0\x49\0\0\0\x40\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  204  \x5c\x04\0\0\x4a\0\0\0\x60\0\0\0\x60\x04\0\0\x4b\0\0\0\x80\0\0\0\x6a\x04\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  205  \0\0\x08\x35\0\0\0\x79\x04\0\0\x01\0\0\x04\x04\0\0\0\xf3\x03\0\0\x39\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  206  \0\0\x8f\x04\0\0\x02\0\0\x04\x10\0\0\0\x4b\x03\0\0\x4c\0\0\0\0\0\0\0\x99\x04\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  207  \0\x4c\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\x02\x4b\0\0\0\x9e\x04\0\0\0\0\0\x08\x4e\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  208  \0\0\xa5\x04\0\0\0\0\0\x08\x46\0\0\0\xb5\x04\0\0\x06\0\0\x04\x20\0\0\0\xc1\x04\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  209  \0\0\x50\0\0\0\0\0\0\0\xc6\x04\0\0\x57\0\0\0\x40\0\0\0\xca\x04\0\0\x58\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  210  \x80\0\0\0\xd3\x04\0\0\x59\0\0\0\xa0\0\0\0\xd7\x04\0\0\x59\0\0\0\xc0\0\0\0\xdc\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  211  \x04\0\0\x02\0\0\0\xe0\0\0\0\xe3\x04\0\0\0\0\0\x08\x51\0\0\0\0\0\0\0\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  212  \x04\x08\0\0\0\x9a\x03\0\0\x52\0\0\0\0\0\0\0\xec\x04\0\0\0\0\0\x08\x53\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  213  \xfa\x04\0\0\x02\0\0\x04\x08\0\0\0\0\0\0\0\x54\0\0\0\0\0\0\0\x52\x04\0\0\x36\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  214  \0\0\x20\0\0\0\0\0\0\0\x02\0\0\x05\x04\0\0\0\x02\x05\0\0\x39\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  215  \0\0\x55\0\0\0\0\0\0\0\0\0\0\0\x02\0\0\x04\x04\0\0\0\x07\x05\0\0\x3c\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  216  \0\0\x0f\x05\0\0\x56\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x3c\0\0\0\x04\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  217  \0\0\x03\0\0\0\0\0\0\0\0\0\0\x02\xab\0\0\0\xca\x04\0\0\x05\0\0\x06\x04\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  218  \x18\x05\0\0\0\0\0\0\x24\x05\0\0\x01\0\0\0\x31\x05\0\0\x02\0\0\0\x3e\x05\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  219  \x03\0\0\0\x4a\x05\0\0\x04\0\0\0\x56\x05\0\0\0\0\0\x08\x5a\0\0\0\0\0\0\0\x01\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  220  \0\x04\x04\0\0\0\xbd\x03\0\0\x5b\0\0\0\0\0\0\0\x5d\x05\0\0\0\0\0\x08\x5c\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  221  \x63\x05\0\0\0\0\0\x08\x1c\0\0\0\0\0\0\0\0\0\0\x02\x5e\0\0\0\0\0\0\0\0\0\0\x0a\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  222  \xa2\0\0\0\x74\x05\0\0\x06\0\0\x04\x20\0\0\0\x82\x05\0\0\x60\0\0\0\0\0\0\0\xd2\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  223  \x01\0\0\x1c\0\0\0\x40\0\0\0\x88\x05\0\0\x1c\0\0\0\x60\0\0\0\x93\x05\0\0\x1c\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  224  \0\0\x80\0\0\0\x9c\x05\0\0\x1c\0\0\0\xa0\0\0\0\xa6\x05\0\0\x4d\0\0\0\xc0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  225  \xaf\x05\0\0\0\0\0\x01\x08\0\0\0\x40\0\0\0\xbd\x05\0\0\0\0\0\x08\x62\0\0\0\xc1\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  226  \x05\0\0\0\0\0\x08\x17\0\0\0\0\0\0\0\0\0\0\x02\x85\0\0\0\0\0\0\0\0\0\0\x02\x8a\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  227  \0\0\0\xc7\x05\0\0\0\0\0\x08\x66\0\0\0\xd0\x05\0\0\0\0\0\x08\x1b\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  228  \x02\0\0\x0d\x68\0\0\0\x03\x0c\0\0\x61\0\0\0\x03\x0c\0\0\x02\0\0\0\x94\x06\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  229  \0\0\0\x08\x69\0\0\0\x99\x06\0\0\0\0\0\x01\x01\0\0\0\x08\0\0\x04\x9f\x06\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  230  \x01\0\0\x0c\x67\0\0\0\0\0\0\0\x01\0\0\x0d\x02\0\0\0\x86\0\0\0\x16\0\0\0\xb9\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  231  \x06\0\0\x01\0\0\x0c\x6b\0\0\0\x0f\x07\0\0\x36\0\0\x04\x78\x02\0\0\x15\x07\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  232  \x6e\0\0\0\0\0\0\0\x1c\x07\0\0\x40\0\0\0\x10\0\0\0\x26\x07\0\0\x59\0\0\0\x20\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  233  \0\0\x2c\x07\0\0\x6f\0\0\0\x40\0\0\0\x32\x07\0\0\x1c\0\0\0\x60\0\0\0\x3a\x07\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  234  \0\x73\0\0\0\x80\0\0\0\x40\x07\0\0\x73\0\0\0\xc0\0\0\0\x4e\x07\0\0\x74\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  235  \x01\0\0\x53\x07\0\0\x76\0\0\0\x40\x01\0\0\x58\x07\0\0\x64\0\0\0\x80\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  236  \x62\x07\0\0\x10\0\0\0\xc0\x01\0\0\x6d\x07\0\0\x60\0\0\0\0\x02\0\0\0\0\0\0\x77\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  237  \0\0\0\x40\x02\0\0\x73\x07\0\0\x79\0\0\0\x60\x02\0\0\x7a\x07\0\0\x4d\0\0\0\x80\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  238  \x02\0\0\x81\x07\0\0\x7b\0\0\0\xc0\x02\0\0\x89\x07\0\0\x7b\0\0\0\x40\x03\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  239  \x91\x07\0\0\x7b\0\0\0\xc0\x03\0\0\x99\x07\0\0\x32\0\0\0\x40\x04\0\0\xa0\x07\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  240  \0\x40\0\0\0\x60\x04\0\0\xa8\x07\0\0\x3c\0\0\0\x70\x04\0\0\xb2\x07\0\0\x3c\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  241  \0\x78\x04\0\0\xbf\x07\0\0\x7e\0\0\0\x80\x04\0\0\xc8\x07\0\0\x60\0\0\0\xc0\x04\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  242  \0\0\xd0\x07\0\0\x7f\0\0\0\0\x05\0\0\xd8\x07\0\0\x60\0\0\0\x40\x06\0\0\xe5\x07\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  243  \0\0\x60\0\0\0\x80\x06\0\0\xf7\x07\0\0\x80\0\0\0\xc0\x06\0\0\xfe\x07\0\0\x4b\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  244  \0\0\x40\x07\0\0\x08\x08\0\0\x83\0\0\0\xc0\x07\0\0\x0d\x08\0\0\x02\0\0\0\0\x08\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  245  \0\0\x1d\x08\0\0\x3e\0\0\0\x20\x08\0\0\x2f\x08\0\0\x3e\0\0\0\x30\x08\0\0\x40\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  246  \x08\0\0\x4b\0\0\0\x40\x08\0\0\x46\x08\0\0\x4b\0\0\0\xc0\x08\0\0\x50\x08\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  247  \x4b\0\0\0\x40\x09\0\0\0\0\0\0\x84\0\0\0\xc0\x09\0\0\x5a\x08\0\0\x42\0\0\0\x40\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  248  \x0a\0\0\x64\x08\0\0\x42\0\0\0\x80\x0a\0\0\x6f\x08\0\0\x39\0\0\0\xc0\x0a\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  249  \x77\x08\0\0\x39\0\0\0\xe0\x0a\0\0\x83\x08\0\0\x39\0\0\0\0\x0b\0\0\x90\x08\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  250  \x39\0\0\0\x20\x0b\0\0\0\0\0\0\x86\0\0\0\x40\x0b\0\0\x9c\x08\0\0\x89\0\0\0\x80\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  251  \x0b\0\0\xa4\x08\0\0\x8a\0\0\0\xc0\x0b\0\0\xab\x08\0\0\x4b\0\0\0\xc0\x11\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  252  \0\0\0\x92\0\0\0\x40\x12\0\0\xb5\x08\0\0\x1b\0\0\0\x80\x12\0\0\xc2\x08\0\0\x1b\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  253  \0\0\0\xa0\x12\0\0\xd2\x08\0\0\x97\0\0\0\xc0\x12\0\0\xe3\x08\0\0\x98\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  254  \x13\0\0\xf0\x08\0\0\x99\0\0\0\x40\x13\0\0\xfe\x08\0\0\x10\0\0\0\x80\x13\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  255  \x08\x09\0\0\0\0\0\x08\x40\0\0\0\x10\x09\0\0\0\0\0\x08\x70\0\0\0\0\0\0\0\x01\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  256  \0\x04\x04\0\0\0\xbd\x03\0\0\x71\0\0\0\0\0\0\0\x17\x09\0\0\0\0\0\x08\x72\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  257  \x1d\x09\0\0\0\0\0\x08\x1c\0\0\0\0\0\0\0\0\0\0\x02\xad\0\0\0\0\0\0\0\0\0\0\x02\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  258  \x75\0\0\0\0\0\0\0\0\0\0\x0a\xaa\0\0\0\0\0\0\0\0\0\0\x02\xaf\0\0\0\0\0\0\0\x02\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  259  \0\0\x05\x04\0\0\0\x2e\x09\0\0\x78\0\0\0\0\0\0\0\x36\x09\0\0\x1c\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  260  \0\0\0\0\0\0\0\x0a\x1c\0\0\0\x40\x09\0\0\0\0\0\x08\x7a\0\0\0\x46\x09\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  261  \x08\x66\0\0\0\x55\x09\0\0\x02\0\0\x04\x10\0\0\0\x60\x09\0\0\x7c\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  262  \x67\x09\0\0\x7d\0\0\0\x40\0\0\0\x6f\x09\0\0\0\0\0\x08\x45\0\0\0\x78\x09\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  263  \0\0\x01\x08\0\0\0\x40\0\0\x01\x7d\x09\0\0\0\0\0\x08\x61\0\0\0\x86\x09\0\0\x05\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  264  \0\0\x04\x28\0\0\0\x93\x09\0\0\x41\0\0\0\0\0\0\0\x4c\x04\0\0\x41\0\0\0\x40\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  265  \0\x5c\x04\0\0\x4a\0\0\0\x80\0\0\0\x52\x04\0\0\x49\0\0\0\xa0\0\0\0\x60\x04\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  266  \x4b\0\0\0\xc0\0\0\0\x99\x09\0\0\x02\0\0\x04\x10\0\0\0\x4b\x03\0\0\x81\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  267  \0\0\0\xa4\x09\0\0\x82\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\x02\x80\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  268  \0\x02\x81\0\0\0\0\0\0\0\0\0\0\x02\xa0\0\0\0\0\0\0\0\x02\0\0\x05\x10\0\0\0\xaa\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  269  \x09\0\0\x85\0\0\0\0\0\0\0\xb3\x09\0\0\x28\0\0\0\0\0\0\0\xb9\x09\0\0\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  270  \x04\x08\0\0\0\xc4\x09\0\0\x81\0\0\0\0\0\0\0\0\0\0\0\x02\0\0\x05\x08\0\0\0\xca\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  271  \x09\0\0\x30\0\0\0\0\0\0\0\xd0\x09\0\0\x87\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x02\x88\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  272  \0\0\0\0\0\0\0\x01\0\0\x0d\0\0\0\0\0\0\0\0\x2f\0\0\0\0\0\0\0\0\0\0\x02\xa4\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  273  \0\xdb\x09\0\0\x0f\0\0\x04\xc0\0\0\0\xe9\x09\0\0\x2f\0\0\0\0\0\0\0\xee\x09\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  274  \x8b\0\0\0\x40\0\0\0\xf6\x09\0\0\x7f\0\0\0\xc0\0\0\0\x06\x0a\0\0\x8c\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  275  \x02\0\0\x0f\x0a\0\0\x39\0\0\0\x20\x02\0\0\x1f\x0a\0\0\x8d\0\0\0\x40\x02\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  276  \x26\x0a\0\0\x7f\0\0\0\xc0\x02\0\0\x33\x0a\0\0\x60\0\0\0\0\x04\0\0\x3b\x0a\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  277  \x60\0\0\0\x40\x04\0\0\x4b\x0a\0\0\x90\0\0\0\x80\x04\0\0\x51\x0a\0\0\x60\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  278  \xc0\x04\0\0\x57\x0a\0\0\x65\0\0\0\0\x05\0\0\x5e\x0a\0\0\x32\0\0\0\x20\x05\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  279  \x6b\x0a\0\0\x4b\0\0\0\x40\x05\0\0\xf3\x02\0\0\x10\0\0\0\xc0\x05\0\0\x78\x0a\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  280  \0\x03\0\0\x04\x10\0\0\0\x7f\x0a\0\0\x32\0\0\0\0\0\0\0\x87\x0a\0\0\x8c\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  281  \x20\0\0\0\x90\x0a\0\0\x10\0\0\0\x40\0\0\0\x98\x0a\0\0\0\0\0\x08\x1c\0\0\0\x9e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  282  \x0a\0\0\x02\0\0\x04\x10\0\0\0\xad\x0a\0\0\x8e\0\0\0\0\0\0\0\xb5\x0a\0\0\x8f\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  283  \0\0\x40\0\0\0\xad\x0a\0\0\x01\0\0\x04\x08\0\0\0\xc1\x0a\0\0\x8f\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  284  \0\0\0\0\0\0\0\x02\xae\0\0\0\0\0\0\0\0\0\0\x02\x91\0\0\0\0\0\0\0\0\0\0\x0a\x9f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  285  \0\0\0\0\0\0\0\x04\0\0\x05\x08\0\0\0\xc9\x0a\0\0\x93\0\0\0\0\0\0\0\xd0\x0a\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  286  \x94\0\0\0\0\0\0\0\xd7\x0a\0\0\x95\0\0\0\0\0\0\0\xde\x0a\0\0\x1c\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  287  \0\0\0\0\0\0\0\x02\xac\0\0\0\0\0\0\0\0\0\0\x02\xa1\0\0\0\0\0\0\0\0\0\0\x02\x96\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  288  \0\0\0\xe8\x0a\0\0\0\0\0\x01\x01\0\0\0\x08\0\0\x01\0\0\0\0\0\0\0\x02\xa7\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  289  \0\0\0\0\0\0\0\x02\xa6\0\0\0\0\0\0\0\0\0\0\x02\xa8\0\0\0\0\0\0\0\0\0\0\x03\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  290  \0\0\x96\0\0\0\x04\0\0\0\x04\0\0\0\x15\x0b\0\0\0\0\0\x0e\x9a\0\0\0\x01\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  291  \x1d\x0b\0\0\x01\0\0\x0f\x04\0\0\0\xb1\0\0\0\0\0\0\0\x04\0\0\0\x24\x0b\0\0\x02\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  292  \0\0\x0f\x40\0\0\0\x0a\0\0\0\0\0\0\0\x20\0\0\0\x15\0\0\0\x20\0\0\0\x20\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  293  \x2a\x0b\0\0\x01\0\0\x0f\x04\0\0\0\x9b\0\0\0\0\0\0\0\x04\0\0\0\x32\x0b\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  294  \0\x07\0\0\0\0\x4b\x0b\0\0\0\0\0\x07\0\0\0\0\x59\x0b\0\0\0\0\0\x07\0\0\0\0\x5e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  295  \x0b\0\0\0\0\0\x07\0\0\0\0\x6c\x03\0\0\0\0\0\x07\0\0\0\0\x63\x0b\0\0\0\0\0\x07\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  296  \0\0\0\0\x75\x0b\0\0\0\0\0\x07\0\0\0\0\x85\x0b\0\0\0\0\0\x07\0\0\0\0\x92\x0b\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  297  \0\0\0\0\x07\0\0\0\0\xaa\x0b\0\0\0\0\0\x07\0\0\0\0\xb8\x0b\0\0\0\0\0\x07\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  298  \0\xc3\x0b\0\0\0\0\0\x07\0\0\0\0\xc6\x04\0\0\0\0\0\x07\0\0\0\0\xd4\x0b\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  299  \0\x07\0\0\0\0\xe4\x0b\0\0\0\0\0\x07\0\0\0\0\xc1\x0a\0\0\0\0\0\x07\0\0\0\0\xee\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  300  \x0b\0\0\0\0\0\x07\0\0\0\0\xfa\x0b\0\0\0\0\0\x07\0\0\0\0\x03\x0c\0\0\0\0\0\x0e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  301  \x02\0\0\0\x01\0\0\0\0\x69\x6e\x74\0\x5f\x5f\x41\x52\x52\x41\x59\x5f\x53\x49\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  302  \x5a\x45\x5f\x54\x59\x50\x45\x5f\x5f\0\x74\x79\x70\x65\0\x6d\x61\x78\x5f\x65\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  303  \x6e\x74\x72\x69\x65\x73\0\x6b\x65\x79\x5f\x73\x69\x7a\x65\0\x76\x61\x6c\x75\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  304  \x65\x5f\x73\x69\x7a\x65\0\x68\x69\x64\x5f\x6a\x6d\x70\x5f\x74\x61\x62\x6c\x65\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  305  \0\x5f\x5f\x75\x38\0\x75\x6e\x73\x69\x67\x6e\x65\x64\x20\x63\x68\x61\x72\0\x6b\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  306  \x65\x79\0\x76\x61\x6c\x75\x65\0\x70\x72\x6f\x67\x73\x5f\x6d\x61\x70\0\x75\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  307  \x73\x69\x67\x6e\x65\x64\x20\x6c\x6f\x6e\x67\x20\x6c\x6f\x6e\x67\0\x63\x74\x78\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  308  \0\x68\x69\x64\x5f\x74\x61\x69\x6c\x5f\x63\x61\x6c\x6c\0\x66\x6d\x6f\x64\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  309  \x72\x65\x74\x2f\x5f\x5f\x68\x69\x64\x5f\x62\x70\x66\x5f\x74\x61\x69\x6c\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  310  \x63\x61\x6c\x6c\0\x2f\x68\x6f\x6d\x65\x2f\x62\x74\x69\x73\x73\x6f\x69\x72\x2f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  311  \x53\x72\x63\x2f\x68\x69\x64\x2f\x64\x72\x69\x76\x65\x72\x73\x2f\x68\x69\x64\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  312  \x2f\x62\x70\x66\x2f\x65\x6e\x74\x72\x79\x70\x6f\x69\x6e\x74\x73\x2f\x65\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  313  \x74\x72\x79\x70\x6f\x69\x6e\x74\x73\x2e\x62\x70\x66\x2e\x63\0\x69\x6e\x74\x20\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  314  \x42\x50\x46\x5f\x50\x52\x4f\x47\x28\x68\x69\x64\x5f\x74\x61\x69\x6c\x5f\x63\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  315  \x61\x6c\x6c\x2c\x20\x73\x74\x72\x75\x63\x74\x20\x68\x69\x64\x5f\x62\x70\x66\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  316  \x5f\x63\x74\x78\x20\x2a\x68\x63\x74\x78\x29\0\x68\x69\x64\x5f\x62\x70\x66\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  317  \x63\x74\x78\0\x69\x6e\x64\x65\x78\0\x68\x69\x64\0\x61\x6c\x6c\x6f\x63\x61\x74\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  318  \x65\x64\x5f\x73\x69\x7a\x65\0\x72\x65\x70\x6f\x72\x74\x5f\x74\x79\x70\x65\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  319  \x5f\x5f\x75\x33\x32\0\x75\x6e\x73\x69\x67\x6e\x65\x64\x20\x69\x6e\x74\0\x68\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  320  \x69\x64\x5f\x72\x65\x70\x6f\x72\x74\x5f\x74\x79\x70\x65\0\x48\x49\x44\x5f\x49\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  321  \x4e\x50\x55\x54\x5f\x52\x45\x50\x4f\x52\x54\0\x48\x49\x44\x5f\x4f\x55\x54\x50\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  322  \x55\x54\x5f\x52\x45\x50\x4f\x52\x54\0\x48\x49\x44\x5f\x46\x45\x41\x54\x55\x52\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  323  \x45\x5f\x52\x45\x50\x4f\x52\x54\0\x48\x49\x44\x5f\x52\x45\x50\x4f\x52\x54\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  324  \x54\x59\x50\x45\x53\0\x72\x65\x74\x76\x61\x6c\0\x73\x69\x7a\x65\0\x5f\x5f\x73\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  325  \x33\x32\0\x30\x3a\x30\0\x09\x62\x70\x66\x5f\x74\x61\x69\x6c\x5f\x63\x61\x6c\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  326  \x6c\x28\x63\x74\x78\x2c\x20\x26\x68\x69\x64\x5f\x6a\x6d\x70\x5f\x74\x61\x62\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  327  \x6c\x65\x2c\x20\x68\x63\x74\x78\x2d\x3e\x69\x6e\x64\x65\x78\x29\x3b\0\x68\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  328  \x64\x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\x73\x65\0\x66\x65\x78\x69\x74\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  329  \x2f\x62\x70\x66\x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\x73\x65\0\x69\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  330  \x74\x20\x42\x50\x46\x5f\x50\x52\x4f\x47\x28\x68\x69\x64\x5f\x70\x72\x6f\x67\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  331  \x5f\x72\x65\x6c\x65\x61\x73\x65\x2c\x20\x73\x74\x72\x75\x63\x74\x20\x69\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  332  \x6f\x64\x65\x20\x2a\x69\x6e\x6f\x64\x65\x2c\x20\x73\x74\x72\x75\x63\x74\x20\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  333  \x66\x69\x6c\x65\x20\x2a\x66\x69\x6c\x70\x29\0\x66\x69\x6c\x65\0\x66\x5f\x70\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  334  \x61\x74\x68\0\x66\x5f\x69\x6e\x6f\x64\x65\0\x66\x5f\x6f\x70\0\x66\x5f\x6c\x6f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  335  \x63\x6b\0\x66\x5f\x63\x6f\x75\x6e\x74\0\x66\x5f\x66\x6c\x61\x67\x73\0\x66\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  336  \x6d\x6f\x64\x65\0\x66\x5f\x70\x6f\x73\x5f\x6c\x6f\x63\x6b\0\x66\x5f\x70\x6f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  337  \x73\0\x66\x5f\x6f\x77\x6e\x65\x72\0\x66\x5f\x63\x72\x65\x64\0\x66\x5f\x72\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  338  \0\x66\x5f\x76\x65\x72\x73\x69\x6f\x6e\0\x66\x5f\x73\x65\x63\x75\x72\x69\x74\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  339  \x79\0\x70\x72\x69\x76\x61\x74\x65\x5f\x64\x61\x74\x61\0\x66\x5f\x65\x70\0\x66\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  340  \x5f\x6d\x61\x70\x70\x69\x6e\x67\0\x66\x5f\x77\x62\x5f\x65\x72\x72\0\x66\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  341  \x73\x62\x5f\x65\x72\x72\0\x66\x5f\x6c\x6c\x69\x73\x74\0\x66\x5f\x72\x63\x75\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  342  \x68\x65\x61\x64\0\x66\x5f\x69\x6f\x63\x62\x5f\x66\x6c\x61\x67\x73\0\x6c\x6c\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  343  \x69\x73\x74\x5f\x6e\x6f\x64\x65\0\x6e\x65\x78\x74\0\x63\x61\x6c\x6c\x62\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  344  \x63\x6b\x5f\x68\x65\x61\x64\0\x66\x75\x6e\x63\0\x70\x61\x74\x68\0\x6d\x6e\x74\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  345  \0\x64\x65\x6e\x74\x72\x79\0\x73\x70\x69\x6e\x6c\x6f\x63\x6b\x5f\x74\0\x73\x70\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  346  \x69\x6e\x6c\x6f\x63\x6b\0\x72\x6c\x6f\x63\x6b\0\x72\x61\x77\x5f\x73\x70\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  347  \x6e\x6c\x6f\x63\x6b\0\x72\x61\x77\x5f\x6c\x6f\x63\x6b\0\x61\x72\x63\x68\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  348  \x73\x70\x69\x6e\x6c\x6f\x63\x6b\x5f\x74\0\x71\x73\x70\x69\x6e\x6c\x6f\x63\x6b\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  349  \0\x76\x61\x6c\0\x61\x74\x6f\x6d\x69\x63\x5f\x74\0\x63\x6f\x75\x6e\x74\x65\x72\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  350  \0\x6c\x6f\x63\x6b\x65\x64\0\x70\x65\x6e\x64\x69\x6e\x67\0\x75\x38\0\x6c\x6f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  351  \x63\x6b\x65\x64\x5f\x70\x65\x6e\x64\x69\x6e\x67\0\x74\x61\x69\x6c\0\x75\x31\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  352  \x36\0\x5f\x5f\x75\x31\x36\0\x75\x6e\x73\x69\x67\x6e\x65\x64\x20\x73\x68\x6f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  353  \x72\x74\0\x61\x74\x6f\x6d\x69\x63\x5f\x6c\x6f\x6e\x67\x5f\x74\0\x61\x74\x6f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  354  \x6d\x69\x63\x36\x34\x5f\x74\0\x73\x36\x34\0\x5f\x5f\x73\x36\x34\0\x6c\x6f\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  355  \x67\x20\x6c\x6f\x6e\x67\0\x66\x6d\x6f\x64\x65\x5f\x74\0\x6d\x75\x74\x65\x78\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  356  \x6f\x77\x6e\x65\x72\0\x77\x61\x69\x74\x5f\x6c\x6f\x63\x6b\0\x6f\x73\x71\0\x77\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  357  \x61\x69\x74\x5f\x6c\x69\x73\x74\0\x72\x61\x77\x5f\x73\x70\x69\x6e\x6c\x6f\x63\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  358  \x6b\x5f\x74\0\x6f\x70\x74\x69\x6d\x69\x73\x74\x69\x63\x5f\x73\x70\x69\x6e\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  359  \x71\x75\x65\x75\x65\0\x6c\x69\x73\x74\x5f\x68\x65\x61\x64\0\x70\x72\x65\x76\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  360  \x6c\x6f\x66\x66\x5f\x74\0\x5f\x5f\x6b\x65\x72\x6e\x65\x6c\x5f\x6c\x6f\x66\x66\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  361  \x5f\x74\0\x66\x6f\x77\x6e\x5f\x73\x74\x72\x75\x63\x74\0\x6c\x6f\x63\x6b\0\x70\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  362  \x69\x64\0\x70\x69\x64\x5f\x74\x79\x70\x65\0\x75\x69\x64\0\x65\x75\x69\x64\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  363  \x73\x69\x67\x6e\x75\x6d\0\x72\x77\x6c\x6f\x63\x6b\x5f\x74\0\x61\x72\x63\x68\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  364  \x5f\x72\x77\x6c\x6f\x63\x6b\x5f\x74\0\x71\x72\x77\x6c\x6f\x63\x6b\0\x63\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  365  \x74\x73\0\x77\x6c\x6f\x63\x6b\x65\x64\0\x5f\x5f\x6c\x73\x74\x61\x74\x65\0\x50\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  366  \x49\x44\x54\x59\x50\x45\x5f\x50\x49\x44\0\x50\x49\x44\x54\x59\x50\x45\x5f\x54\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  367  \x47\x49\x44\0\x50\x49\x44\x54\x59\x50\x45\x5f\x50\x47\x49\x44\0\x50\x49\x44\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  368  \x54\x59\x50\x45\x5f\x53\x49\x44\0\x50\x49\x44\x54\x59\x50\x45\x5f\x4d\x41\x58\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  369  \0\x6b\x75\x69\x64\x5f\x74\0\x75\x69\x64\x5f\x74\0\x5f\x5f\x6b\x65\x72\x6e\x65\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  370  \x6c\x5f\x75\x69\x64\x33\x32\x5f\x74\0\x66\x69\x6c\x65\x5f\x72\x61\x5f\x73\x74\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  371  \x61\x74\x65\0\x73\x74\x61\x72\x74\0\x61\x73\x79\x6e\x63\x5f\x73\x69\x7a\x65\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  372  \x72\x61\x5f\x70\x61\x67\x65\x73\0\x6d\x6d\x61\x70\x5f\x6d\x69\x73\x73\0\x70\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  373  \x72\x65\x76\x5f\x70\x6f\x73\0\x75\x6e\x73\x69\x67\x6e\x65\x64\x20\x6c\x6f\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  374  \x67\0\x75\x36\x34\0\x5f\x5f\x75\x36\x34\0\x65\x72\x72\x73\x65\x71\x5f\x74\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  375  \x75\x33\x32\0\x30\x3a\x31\x35\0\x09\x75\x36\x34\x20\x70\x72\x6f\x67\x20\x3d\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  376  \x20\x28\x75\x36\x34\x29\x66\x69\x6c\x70\x2d\x3e\x70\x72\x69\x76\x61\x74\x65\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  377  \x5f\x64\x61\x74\x61\x3b\0\x09\x76\x61\x6c\x75\x65\x20\x3d\x20\x62\x70\x66\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  378  \x6d\x61\x70\x5f\x6c\x6f\x6f\x6b\x75\x70\x5f\x65\x6c\x65\x6d\x28\x26\x70\x72\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  379  \x6f\x67\x73\x5f\x6d\x61\x70\x2c\x20\x26\x70\x72\x6f\x67\x29\x3b\0\x09\x69\x66\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  380  \x20\x28\x21\x76\x61\x6c\x75\x65\x29\0\x09\x69\x66\x20\x28\x63\x61\x6c\x6c\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  381  \x68\x69\x64\x5f\x62\x70\x66\x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\x73\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  382  \x65\x28\x70\x72\x6f\x67\x2c\x20\x2a\x76\x61\x6c\x75\x65\x29\x29\0\x09\x09\x62\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  383  \x70\x66\x5f\x6d\x61\x70\x5f\x64\x65\x6c\x65\x74\x65\x5f\x65\x6c\x65\x6d\x28\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  384  \x26\x70\x72\x6f\x67\x73\x5f\x6d\x61\x70\x2c\x20\x26\x70\x72\x6f\x67\x29\x3b\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  385  \x62\x6f\x6f\x6c\0\x5f\x42\x6f\x6f\x6c\0\x63\x61\x6c\x6c\x5f\x68\x69\x64\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  386  \x62\x70\x66\x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\x73\x65\0\x68\x69\x64\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  387  \x5f\x66\x72\x65\x65\x5f\x69\x6e\x6f\x64\x65\0\x66\x65\x78\x69\x74\x2f\x62\x70\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  388  \x66\x5f\x66\x72\x65\x65\x5f\x69\x6e\x6f\x64\x65\0\x69\x6e\x74\x20\x42\x50\x46\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  389  \x5f\x50\x52\x4f\x47\x28\x68\x69\x64\x5f\x66\x72\x65\x65\x5f\x69\x6e\x6f\x64\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  390  \x65\x2c\x20\x73\x74\x72\x75\x63\x74\x20\x69\x6e\x6f\x64\x65\x20\x2a\x69\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  391  \x6f\x64\x65\x29\0\x69\x6e\x6f\x64\x65\0\x69\x5f\x6d\x6f\x64\x65\0\x69\x5f\x6f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  392  \x70\x66\x6c\x61\x67\x73\0\x69\x5f\x75\x69\x64\0\x69\x5f\x67\x69\x64\0\x69\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  393  \x66\x6c\x61\x67\x73\0\x69\x5f\x61\x63\x6c\0\x69\x5f\x64\x65\x66\x61\x75\x6c\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  394  \x74\x5f\x61\x63\x6c\0\x69\x5f\x6f\x70\0\x69\x5f\x73\x62\0\x69\x5f\x6d\x61\x70\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  395  \x70\x69\x6e\x67\0\x69\x5f\x73\x65\x63\x75\x72\x69\x74\x79\0\x69\x5f\x69\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  396  \x6f\0\x69\x5f\x72\x64\x65\x76\0\x69\x5f\x73\x69\x7a\x65\0\x69\x5f\x61\x74\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  397  \x6d\x65\0\x69\x5f\x6d\x74\x69\x6d\x65\0\x69\x5f\x63\x74\x69\x6d\x65\0\x69\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  398  \x6c\x6f\x63\x6b\0\x69\x5f\x62\x79\x74\x65\x73\0\x69\x5f\x62\x6c\x6b\x62\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  399  \x74\x73\0\x69\x5f\x77\x72\x69\x74\x65\x5f\x68\x69\x6e\x74\0\x69\x5f\x62\x6c\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  400  \x6f\x63\x6b\x73\0\x69\x5f\x73\x74\x61\x74\x65\0\x69\x5f\x72\x77\x73\x65\x6d\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  401  \x64\x69\x72\x74\x69\x65\x64\x5f\x77\x68\x65\x6e\0\x64\x69\x72\x74\x69\x65\x64\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  402  \x5f\x74\x69\x6d\x65\x5f\x77\x68\x65\x6e\0\x69\x5f\x68\x61\x73\x68\0\x69\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  403  \x69\x6f\x5f\x6c\x69\x73\x74\0\x69\x5f\x77\x62\0\x69\x5f\x77\x62\x5f\x66\x72\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  404  \x6e\x5f\x77\x69\x6e\x6e\x65\x72\0\x69\x5f\x77\x62\x5f\x66\x72\x6e\x5f\x61\x76\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  405  \x67\x5f\x74\x69\x6d\x65\0\x69\x5f\x77\x62\x5f\x66\x72\x6e\x5f\x68\x69\x73\x74\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  406  \x6f\x72\x79\0\x69\x5f\x6c\x72\x75\0\x69\x5f\x73\x62\x5f\x6c\x69\x73\x74\0\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  407  \x5f\x77\x62\x5f\x6c\x69\x73\x74\0\x69\x5f\x76\x65\x72\x73\x69\x6f\x6e\0\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  408  \x5f\x73\x65\x71\x75\x65\x6e\x63\x65\0\x69\x5f\x63\x6f\x75\x6e\x74\0\x69\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  409  \x64\x69\x6f\x5f\x63\x6f\x75\x6e\x74\0\x69\x5f\x77\x72\x69\x74\x65\x63\x6f\x75\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  410  \x6e\x74\0\x69\x5f\x72\x65\x61\x64\x63\x6f\x75\x6e\x74\0\x69\x5f\x66\x6c\x63\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  411  \x74\x78\0\x69\x5f\x64\x61\x74\x61\0\x69\x5f\x64\x65\x76\x69\x63\x65\x73\0\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  412  \x5f\x67\x65\x6e\x65\x72\x61\x74\x69\x6f\x6e\0\x69\x5f\x66\x73\x6e\x6f\x74\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  413  \x66\x79\x5f\x6d\x61\x73\x6b\0\x69\x5f\x66\x73\x6e\x6f\x74\x69\x66\x79\x5f\x6d\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  414  \x61\x72\x6b\x73\0\x69\x5f\x63\x72\x79\x70\x74\x5f\x69\x6e\x66\x6f\0\x69\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  415  \x76\x65\x72\x69\x74\x79\x5f\x69\x6e\x66\x6f\0\x69\x5f\x70\x72\x69\x76\x61\x74\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  416  \x65\0\x75\x6d\x6f\x64\x65\x5f\x74\0\x6b\x67\x69\x64\x5f\x74\0\x67\x69\x64\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  417  \x74\0\x5f\x5f\x6b\x65\x72\x6e\x65\x6c\x5f\x67\x69\x64\x33\x32\x5f\x74\0\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  418  \x5f\x6e\x6c\x69\x6e\x6b\0\x5f\x5f\x69\x5f\x6e\x6c\x69\x6e\x6b\0\x64\x65\x76\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  419  \x5f\x74\0\x5f\x5f\x6b\x65\x72\x6e\x65\x6c\x5f\x64\x65\x76\x5f\x74\0\x74\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  420  \x6d\x65\x73\x70\x65\x63\x36\x34\0\x74\x76\x5f\x73\x65\x63\0\x74\x76\x5f\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  421  \x73\x65\x63\0\x74\x69\x6d\x65\x36\x34\x5f\x74\0\x6c\x6f\x6e\x67\0\x62\x6c\x6b\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  422  \x63\x6e\x74\x5f\x74\0\x72\x77\x5f\x73\x65\x6d\x61\x70\x68\x6f\x72\x65\0\x63\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  423  \x6f\x75\x6e\x74\0\x68\x6c\x69\x73\x74\x5f\x6e\x6f\x64\x65\0\x70\x70\x72\x65\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  424  \x76\0\x69\x5f\x64\x65\x6e\x74\x72\x79\0\x69\x5f\x72\x63\x75\0\x68\x6c\x69\x73\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  425  \x74\x5f\x68\x65\x61\x64\0\x66\x69\x72\x73\x74\0\x69\x5f\x66\x6f\x70\0\x66\x72\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  426  \x65\x65\x5f\x69\x6e\x6f\x64\x65\0\x61\x64\x64\x72\x65\x73\x73\x5f\x73\x70\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  427  \x63\x65\0\x68\x6f\x73\x74\0\x69\x5f\x70\x61\x67\x65\x73\0\x69\x6e\x76\x61\x6c\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  428  \x69\x64\x61\x74\x65\x5f\x6c\x6f\x63\x6b\0\x67\x66\x70\x5f\x6d\x61\x73\x6b\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  429  \x69\x5f\x6d\x6d\x61\x70\x5f\x77\x72\x69\x74\x61\x62\x6c\x65\0\x69\x5f\x6d\x6d\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  430  \x61\x70\0\x69\x5f\x6d\x6d\x61\x70\x5f\x72\x77\x73\x65\x6d\0\x6e\x72\x70\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  431  \x67\x65\x73\0\x77\x72\x69\x74\x65\x62\x61\x63\x6b\x5f\x69\x6e\x64\x65\x78\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  432  \x61\x5f\x6f\x70\x73\0\x66\x6c\x61\x67\x73\0\x77\x62\x5f\x65\x72\x72\0\x70\x72\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  433  \x69\x76\x61\x74\x65\x5f\x6c\x6f\x63\x6b\0\x70\x72\x69\x76\x61\x74\x65\x5f\x6c\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  434  \x69\x73\x74\0\x78\x61\x72\x72\x61\x79\0\x78\x61\x5f\x6c\x6f\x63\x6b\0\x78\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  435  \x5f\x66\x6c\x61\x67\x73\0\x78\x61\x5f\x68\x65\x61\x64\0\x67\x66\x70\x5f\x74\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  436  \x72\x62\x5f\x72\x6f\x6f\x74\x5f\x63\x61\x63\x68\x65\x64\0\x72\x62\x5f\x72\x6f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  437  \x6f\x74\0\x72\x62\x5f\x6c\x65\x66\x74\x6d\x6f\x73\x74\0\x72\x62\x5f\x6e\x6f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  438  \x64\x65\0\x69\x5f\x70\x69\x70\x65\0\x69\x5f\x63\x64\x65\x76\0\x69\x5f\x6c\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  439  \x6e\x6b\0\x69\x5f\x64\x69\x72\x5f\x73\x65\x71\0\x63\x68\x61\x72\0\x30\x3a\x35\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  440  \x33\0\x09\x75\x36\x34\x20\x70\x72\x6f\x67\x20\x3d\x20\x28\x75\x36\x34\x29\x69\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  441  \x6e\x6f\x64\x65\x2d\x3e\x69\x5f\x70\x72\x69\x76\x61\x74\x65\x3b\0\x4c\x49\x43\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  442  \x45\x4e\x53\x45\0\x2e\x6b\x73\x79\x6d\x73\0\x2e\x6d\x61\x70\x73\0\x6c\x69\x63\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  443  \x65\x6e\x73\x65\0\x61\x64\x64\x72\x65\x73\x73\x5f\x73\x70\x61\x63\x65\x5f\x6f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  444  \x70\x65\x72\x61\x74\x69\x6f\x6e\x73\0\x62\x64\x69\x5f\x77\x72\x69\x74\x65\x62\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  445  \x61\x63\x6b\0\x63\x64\x65\x76\0\x63\x72\x65\x64\0\x66\x69\x6c\x65\x5f\x6c\x6f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  446  \x63\x6b\x5f\x63\x6f\x6e\x74\x65\x78\x74\0\x66\x69\x6c\x65\x5f\x6f\x70\x65\x72\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  447  \x61\x74\x69\x6f\x6e\x73\0\x66\x73\x63\x72\x79\x70\x74\x5f\x69\x6e\x66\x6f\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  448  \x66\x73\x6e\x6f\x74\x69\x66\x79\x5f\x6d\x61\x72\x6b\x5f\x63\x6f\x6e\x6e\x65\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  449  \x63\x74\x6f\x72\0\x66\x73\x76\x65\x72\x69\x74\x79\x5f\x69\x6e\x66\x6f\0\x68\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  450  \x69\x64\x5f\x64\x65\x76\x69\x63\x65\0\x69\x6e\x6f\x64\x65\x5f\x6f\x70\x65\x72\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  451  \x61\x74\x69\x6f\x6e\x73\0\x70\x69\x70\x65\x5f\x69\x6e\x6f\x64\x65\x5f\x69\x6e\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  452  \x66\x6f\0\x70\x6f\x73\x69\x78\x5f\x61\x63\x6c\0\x73\x75\x70\x65\x72\x5f\x62\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  453  \x6c\x6f\x63\x6b\0\x76\x66\x73\x6d\x6f\x75\x6e\x74\0\x64\x75\x6d\x6d\x79\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  454  \x6b\x73\x79\x6d\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x16\x1e\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  455  \0\0\0\0\0\0\x03\0\0\0\x04\0\0\0\x04\0\0\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  456  \x68\x69\x64\x5f\x6a\x6d\x70\x5f\x74\x61\x62\x6c\x65\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  457  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\x08\0\0\0\x01\0\0\0\0\x08\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  458  \0\0\0\0\0\0\0\0\0\0\0\x70\x72\x6f\x67\x73\x5f\x6d\x61\x70\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  459  \0\0\0\0\0\x10\0\0\0\x12\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x47\x50\x4c\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  460  \x79\x12\0\0\0\0\0\0\x61\x23\0\0\0\0\0\0\x18\x52\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  461  \x85\0\0\0\x0c\0\0\0\xb7\0\0\0\0\0\0\0\x95\0\0\0\0\0\0\0\0\0\0\0\x19\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  462  \0\0\xb5\0\0\0\xfa\0\0\0\x05\x6c\0\0\x01\0\0\0\xb5\0\0\0\xe1\x01\0\0\x02\x74\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  463  \0\x05\0\0\0\xb5\0\0\0\xfa\0\0\0\x05\x6c\0\0\x08\0\0\0\x1a\0\0\0\xdd\x01\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  464  \0\0\0\x1a\0\0\0\x07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  465  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\x68\x69\x64\x5f\x74\x61\x69\x6c\x5f\x63\x61\x6c\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  466  \x6c\0\0\0\0\0\0\0\x1a\0\0\0\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\x10\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  467  \0\0\0\0\0\0\0\0\0\0\x03\0\0\0\x01\0\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  468  \0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x5f\x5f\x68\x69\x64\x5f\x62\x70\x66\x5f\x74\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  469  \x69\x6c\x5f\x63\x61\x6c\x6c\0\0\0\0\0\x47\x50\x4c\0\0\0\0\0\x79\x11\x08\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  470  \0\0\x79\x11\xc8\0\0\0\0\0\x7b\x1a\xf8\xff\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  471  \0\0\xf8\xff\xff\xff\x18\x51\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  472  \x15\0\x09\0\0\0\0\0\x71\x02\0\0\0\0\0\0\x79\xa1\xf8\xff\0\0\0\0\x85\x20\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  473  \0\0\0\x15\0\x05\0\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\xf8\xff\xff\xff\x18\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  474  \x51\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\x85\0\0\0\x03\0\0\0\xb7\0\0\0\0\0\0\0\x95\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  475  \0\0\0\0\0\0\0\0\0\0\x23\0\0\0\0\0\0\0\xb5\0\0\0\x3b\x02\0\0\x05\xbc\0\0\x01\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  476  \0\0\xb5\0\0\0\xd9\x05\0\0\x18\xc4\0\0\x04\0\0\0\xb5\0\0\0\0\0\0\0\0\0\0\0\x05\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  477  \0\0\0\xb5\0\0\0\xfe\x05\0\0\x0a\x98\0\0\x08\0\0\0\xb5\0\0\0\x2f\x06\0\0\x06\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  478  \x9c\0\0\x09\0\0\0\xb5\0\0\0\x3c\x06\0\0\x26\xa8\0\0\x0a\0\0\0\xb5\0\0\0\x3c\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  479  \x06\0\0\x20\xa8\0\0\x0b\0\0\0\xb5\0\0\0\x3c\x06\0\0\x06\xa8\0\0\x0c\0\0\0\xb5\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  480  \0\0\0\x3c\x06\0\0\x06\xa8\0\0\x0e\0\0\0\xb5\0\0\0\0\0\0\0\0\0\0\0\x0f\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  481  \xb5\0\0\0\x6a\x06\0\0\x03\xac\0\0\x12\0\0\0\xb5\0\0\0\x3b\x02\0\0\x05\xbc\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  482  \x08\0\0\0\x24\0\0\0\xd4\x05\0\0\0\0\0\0\x1a\0\0\0\x14\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  483  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x68\x69\x64\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  484  \x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\x73\0\0\0\0\0\x19\0\0\0\0\0\0\0\x08\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  485  \0\0\0\0\0\0\0\0\0\0\x01\0\0\0\x10\0\0\0\0\0\0\0\0\0\0\0\x0c\0\0\0\x01\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  486  \0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x62\x70\x66\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  487  \x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\x73\x65\0\0\0\0\0\0\0\0\x63\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  488  \x6c\x6c\x5f\x68\x69\x64\x5f\x62\x70\x66\x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  489  \x65\x61\x73\x65\0\0\0\0\0\0\0\x47\x50\x4c\0\0\0\0\0\x79\x11\0\0\0\0\0\0\x79\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  490  \x11\x70\x02\0\0\0\0\x7b\x1a\xf8\xff\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  491  \xf8\xff\xff\xff\x18\x51\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\x85\0\0\0\x01\0\0\0\x15\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  492  \0\x09\0\0\0\0\0\x71\x02\0\0\0\0\0\0\x79\xa1\xf8\xff\0\0\0\0\x85\x20\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  493  \0\x15\0\x05\0\0\0\0\0\xbf\xa2\0\0\0\0\0\0\x07\x02\0\0\xf8\xff\xff\xff\x18\x51\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  494  \0\0\x01\0\0\0\0\0\0\0\0\0\0\0\x85\0\0\0\x03\0\0\0\xb7\0\0\0\0\0\0\0\x95\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  495  \0\0\0\0\0\0\0\0\x6c\0\0\0\0\0\0\0\xb5\0\0\0\xdd\x06\0\0\x05\xe4\0\0\x01\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  496  \xb5\0\0\0\xf2\x0a\0\0\x19\xec\0\0\x04\0\0\0\xb5\0\0\0\0\0\0\0\0\0\0\0\x05\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  497  \0\xb5\0\0\0\xfe\x05\0\0\x0a\x98\0\0\x08\0\0\0\xb5\0\0\0\x2f\x06\0\0\x06\x9c\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  498  \0\x09\0\0\0\xb5\0\0\0\x3c\x06\0\0\x26\xa8\0\0\x0a\0\0\0\xb5\0\0\0\x3c\x06\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  499  \x20\xa8\0\0\x0b\0\0\0\xb5\0\0\0\x3c\x06\0\0\x06\xa8\0\0\x0c\0\0\0\xb5\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  500  \x3c\x06\0\0\x06\xa8\0\0\x0e\0\0\0\xb5\0\0\0\0\0\0\0\0\0\0\0\x0f\0\0\0\xb5\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  501  \0\x6a\x06\0\0\x03\xac\0\0\x12\0\0\0\xb5\0\0\0\xdd\x06\0\0\x05\xe4\0\0\x08\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  502  \0\x6d\0\0\0\xed\x0a\0\0\0\0\0\0\x1a\0\0\0\x14\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  503  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x68\x69\x64\x5f\x66\x72\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  504  \x65\x65\x5f\x69\x6e\x6f\x64\x65\0\0\0\0\0\0\x19\0\0\0\0\0\0\0\x08\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  505  \0\0\0\0\0\x01\0\0\0\x10\0\0\0\0\0\0\0\0\0\0\0\x0c\0\0\0\x01\0\0\0\0\0\0\0\x01\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  506  \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x62\x70\x66\x5f\x66\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  507  \x72\x65\x65\x5f\x69\x6e\x6f\x64\x65\0\0\x63\x61\x6c\x6c\x5f\x68\x69\x64\x5f\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03 @508  \x62\x70\x66\x5f\x70\x72\x6f\x67\x5f\x72\x65\x6c\x65\x61\x73\x65\0\0\0\0\0\0\0";
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  509  	opts.insns_sz = 3152;
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  510  	opts.insns = (void *)"\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  511  \xbf\x16\0\0\0\0\0\0\xbf\xa1\0\0\0\0\0\0\x07\x01\0\0\x78\xff\xff\xff\xb7\x02\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  512  \0\x88\0\0\0\xb7\x03\0\0\0\0\0\0\x85\0\0\0\x71\0\0\0\x05\0\x1d\0\0\0\0\0\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  513  \xa1\x78\xff\0\0\0\0\xd5\x01\x01\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\x61\xa1\x7c\xff\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  514  \0\0\0\0\xd5\x01\x01\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\x61\xa1\x80\xff\0\0\0\0\xd5\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  515  \x01\x01\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\x61\xa1\x84\xff\0\0\0\0\xd5\x01\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  516  \0\0\0\x85\0\0\0\xa8\0\0\0\x61\xa1\x88\xff\0\0\0\0\xd5\x01\x01\0\0\0\0\0\x85\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  517  \0\0\xa8\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x61\x01\0\0\0\0\0\0\xd5\x01\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  518  \x02\0\0\0\0\0\xbf\x19\0\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\x18\x60\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  519  \0\0\x04\0\0\0\x61\x01\0\0\0\0\0\0\xd5\x01\x02\0\0\0\0\0\xbf\x19\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  520  \x85\0\0\0\xa8\0\0\0\xbf\x70\0\0\0\0\0\0\x95\0\0\0\0\0\0\0\x61\x60\x08\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  521  \0\x18\x61\0\0\0\0\0\0\0\0\0\0\x30\x23\0\0\x63\x01\0\0\0\0\0\0\x61\x60\x0c\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  522  \0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x2c\x23\0\0\x63\x01\0\0\0\0\0\0\x79\x60\x10\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  523  \0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x20\x23\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  524  \0\0\0\0\0\0\0\0\0\0\0\x05\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x18\x23\0\0\x7b\x01\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  525  \0\0\0\0\0\0\xb7\x01\0\0\x12\0\0\0\x18\x62\0\0\0\0\0\0\0\0\0\0\x18\x23\0\0\xb7\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  526  \x03\0\0\x1c\0\0\0\x85\0\0\0\xa6\0\0\0\xbf\x07\0\0\0\0\0\0\xc5\x07\xcb\xff\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  527  \0\0\x63\x7a\x78\xff\0\0\0\0\x61\x60\x1c\0\0\0\0\0\x15\0\x03\0\0\0\0\0\x18\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  528  \0\0\0\0\0\0\0\0\0\0\x44\x23\0\0\x63\x01\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x18\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  529  \x62\0\0\0\0\0\0\0\0\0\0\x38\x23\0\0\xb7\x03\0\0\x48\0\0\0\x85\0\0\0\xa6\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  530  \xbf\x07\0\0\0\0\0\0\xc5\x07\xbe\xff\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  531  \0\x63\x71\0\0\0\0\0\0\x61\xa0\x78\xff\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xb0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  532  \x23\0\0\x63\x01\0\0\0\0\0\0\x61\x60\x2c\0\0\0\0\0\x15\0\x03\0\0\0\0\0\x18\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  533  \0\0\0\0\0\0\0\0\0\0\x8c\x23\0\0\x63\x01\0\0\0\0\0\0\xb7\x01\0\0\0\0\0\0\x18\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  534  \x62\0\0\0\0\0\0\0\0\0\0\x80\x23\0\0\xb7\x03\0\0\x48\0\0\0\x85\0\0\0\xa6\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  535  \xbf\x07\0\0\0\0\0\0\xc5\x07\xab\xff\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x04\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  536  \0\0\x63\x71\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xc8\x23\0\0\x18\x61\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  537  \0\0\0\0\0\0\0\x60\x24\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xd0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  538  \x23\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x58\x24\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  539  \0\0\0\0\0\0\0\0\0\x08\x24\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xa0\x24\0\0\x7b\x01\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  540  \0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x10\x24\0\0\x18\x61\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  541  \0\xb0\x24\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x40\x24\0\0\x18\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  542  \x61\0\0\0\0\0\0\0\0\0\0\xd0\x24\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  543  \0\0\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xc8\x24\0\0\x7b\x01\0\0\0\0\0\0\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  544  \x60\x08\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x68\x24\0\0\x63\x01\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  545  \x61\x60\x0c\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x6c\x24\0\0\x63\x01\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  546  \0\0\x79\x60\x10\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x70\x24\0\0\x7b\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  547  \0\0\0\0\x61\xa0\x78\xff\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x98\x24\0\0\x63\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  548  \x01\0\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xe0\x24\0\0\xb7\x02\0\0\x14\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  549  \xb7\x03\0\0\x0c\0\0\0\xb7\x04\0\0\0\0\0\0\x85\0\0\0\xa7\0\0\0\xbf\x07\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  550  \0\0\xc5\x07\x72\xff\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x50\x24\0\0\x63\x70\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  551  \x6c\0\0\0\0\0\x77\x07\0\0\x20\0\0\0\x63\x70\x70\0\0\0\0\0\xb7\x01\0\0\x05\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  552  \0\x18\x62\0\0\0\0\0\0\0\0\0\0\x50\x24\0\0\xb7\x03\0\0\x8c\0\0\0\x85\0\0\0\xa6\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  553  \0\0\0\xbf\x07\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xc0\x24\0\0\x61\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  554  \0\0\0\0\xd5\x01\x02\0\0\0\0\0\xbf\x19\0\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\xc5\x07\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  555  \x60\xff\0\0\0\0\x63\x7a\x80\xff\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xf8\x24\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  556  \0\x18\x61\0\0\0\0\0\0\0\0\0\0\x88\x26\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  557  \0\0\0\0\0\0\0\x25\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x80\x26\0\0\x7b\x01\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  558  \0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xa0\x25\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xc8\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  559  \x26\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xa8\x25\0\0\x18\x61\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  560  \0\0\0\0\0\0\0\0\0\xd8\x26\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  561  \x68\x26\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xf8\x26\0\0\x7b\x01\0\0\0\0\0\0\x18\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  562  \x60\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xf0\x26\0\0\x7b\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  563  \x01\0\0\0\0\0\0\x61\x60\x08\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x90\x26\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  564  \x63\x01\0\0\0\0\0\0\x61\x60\x0c\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x94\x26\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  565  \0\0\x63\x01\0\0\0\0\0\0\x79\x60\x10\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x98\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  566  \x26\0\0\x7b\x01\0\0\0\0\0\0\x61\xa0\x78\xff\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  567  \0\xc0\x26\0\0\x63\x01\0\0\0\0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x08\x27\0\0\xb7\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  568  \x02\0\0\x11\0\0\0\xb7\x03\0\0\x0c\0\0\0\xb7\x04\0\0\0\0\0\0\x85\0\0\0\xa7\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  569  \0\xbf\x07\0\0\0\0\0\0\xc5\x07\x29\xff\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x78\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  570  \x26\0\0\x63\x70\x6c\0\0\0\0\0\x77\x07\0\0\x20\0\0\0\x63\x70\x70\0\0\0\0\0\x18\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  571  \x68\0\0\0\0\0\0\0\0\0\0\x58\x25\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x20\x27\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  572  \xb7\x02\0\0\x1a\0\0\0\xb7\x03\0\0\x0c\0\0\0\xb7\x04\0\0\0\0\0\0\x85\0\0\0\xa7\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  573  \0\0\0\xbf\x07\0\0\0\0\0\0\xc5\x07\x1a\xff\0\0\0\0\x75\x07\x03\0\0\0\0\0\x62\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  574  \x08\x04\0\0\0\0\0\x6a\x08\x02\0\0\0\0\0\x05\0\x0a\0\0\0\0\0\x63\x78\x04\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  575  \0\0\xbf\x79\0\0\0\0\0\0\x77\x09\0\0\x20\0\0\0\x55\x09\x02\0\0\0\0\0\x6a\x08\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  576  \x02\0\0\0\0\0\x05\0\x04\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\x63\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  577  \x90\0\0\0\0\0\0\x6a\x08\x02\0\x40\0\0\0\xb7\x01\0\0\x05\0\0\0\x18\x62\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  578  \0\0\0\0\0\0\x78\x26\0\0\xb7\x03\0\0\x8c\0\0\0\x85\0\0\0\xa6\0\0\0\xbf\x07\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  579  \0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\x61\x01\0\0\0\0\0\0\xd5\x01\x02\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  580  \0\0\0\0\0\xbf\x19\0\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  581  \xe8\x26\0\0\x61\x01\0\0\0\0\0\0\xd5\x01\x02\0\0\0\0\0\xbf\x19\0\0\0\0\0\0\x85\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  582  \0\0\0\xa8\0\0\0\xc5\x07\xf9\xfe\0\0\0\0\x63\x7a\x84\xff\0\0\0\0\x18\x60\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  583  \0\0\0\0\0\0\0\x40\x27\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\xd0\x28\0\0\x7b\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  584  \0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\x48\x27\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  585  \xc8\x28\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\xe8\x27\0\0\x18\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  586  \x61\0\0\0\0\0\0\0\0\0\0\x10\x29\0\0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  587  \0\0\0\xf0\x27\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x20\x29\0\0\x7b\x01\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  588  \x18\x60\0\0\0\0\0\0\0\0\0\0\xb0\x28\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x40\x29\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  589  \0\x7b\x01\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x18\x61\0\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  590  \0\0\0\0\x38\x29\0\0\x7b\x01\0\0\0\0\0\0\x61\x60\x08\0\0\0\0\0\x18\x61\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  591  \0\0\0\0\0\0\xd8\x28\0\0\x63\x01\0\0\0\0\0\0\x61\x60\x0c\0\0\0\0\0\x18\x61\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  592  \0\0\0\0\0\0\0\0\xdc\x28\0\0\x63\x01\0\0\0\0\0\0\x79\x60\x10\0\0\0\0\0\x18\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  593  \0\0\0\0\0\0\0\0\0\0\xe0\x28\0\0\x7b\x01\0\0\0\0\0\0\x61\xa0\x78\xff\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  594  \x18\x61\0\0\0\0\0\0\0\0\0\0\x08\x29\0\0\x63\x01\0\0\0\0\0\0\x18\x61\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  595  \0\0\0\0\0\x50\x29\0\0\xb7\x02\0\0\x0f\0\0\0\xb7\x03\0\0\x0c\0\0\0\xb7\x04\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  596  \0\0\0\0\x85\0\0\0\xa7\0\0\0\xbf\x07\0\0\0\0\0\0\xc5\x07\xc2\xfe\0\0\0\0\x18\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  597  \x60\0\0\0\0\0\0\0\0\0\0\xc0\x28\0\0\x63\x70\x6c\0\0\0\0\0\x77\x07\0\0\x20\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  598  \0\x63\x70\x70\0\0\0\0\0\x18\x68\0\0\0\0\0\0\0\0\0\0\xa0\x27\0\0\x18\x61\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  599  \0\0\0\0\0\0\0\x60\x29\0\0\xb7\x02\0\0\x1a\0\0\0\xb7\x03\0\0\x0c\0\0\0\xb7\x04\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  600  \0\0\0\0\0\0\x85\0\0\0\xa7\0\0\0\xbf\x07\0\0\0\0\0\0\xc5\x07\xb3\xfe\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  601  \x75\x07\x03\0\0\0\0\0\x62\x08\x04\0\0\0\0\0\x6a\x08\x02\0\0\0\0\0\x05\0\x0a\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  602  \0\0\0\0\x63\x78\x04\0\0\0\0\0\xbf\x79\0\0\0\0\0\0\x77\x09\0\0\x20\0\0\0\x55\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  603  \x09\x02\0\0\0\0\0\x6a\x08\x02\0\0\0\0\0\x05\0\x04\0\0\0\0\0\x18\x60\0\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  604  \0\0\0\0\0\0\x01\0\0\x63\x90\0\0\0\0\0\0\x6a\x08\x02\0\x40\0\0\0\xb7\x01\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  605  \x05\0\0\0\x18\x62\0\0\0\0\0\0\0\0\0\0\xc0\x28\0\0\xb7\x03\0\0\x8c\0\0\0\x85\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  606  \0\0\xa6\0\0\0\xbf\x07\0\0\0\0\0\0\x18\x60\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\x61\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  607  \x01\0\0\0\0\0\0\xd5\x01\x02\0\0\0\0\0\xbf\x19\0\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  608  \x18\x60\0\0\0\0\0\0\0\0\0\0\x30\x29\0\0\x61\x01\0\0\0\0\0\0\xd5\x01\x02\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  609  \0\0\xbf\x19\0\0\0\0\0\0\x85\0\0\0\xa8\0\0\0\xc5\x07\x92\xfe\0\0\0\0\x63\x7a\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  610  \x88\xff\0\0\0\0\x61\xa1\x78\xff\0\0\0\0\xd5\x01\x02\0\0\0\0\0\xbf\x19\0\0\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  611  \0\0\x85\0\0\0\xa8\0\0\0\x61\xa0\x80\xff\0\0\0\0\x63\x06\x38\0\0\0\0\0\x61\xa0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  612  \x84\xff\0\0\0\0\x63\x06\x3c\0\0\0\0\0\x61\xa0\x88\xff\0\0\0\0\x63\x06\x40\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  613  \0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x61\x10\0\0\0\0\0\0\x63\x06\x18\0\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  614  \0\0\0\x18\x61\0\0\0\0\0\0\0\0\0\0\x04\0\0\0\x61\x10\0\0\0\0\0\0\x63\x06\x28\0\
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  615  \0\0\0\0\xb7\0\0\0\0\0\0\0\x95\0\0\0\0\0\0\0";
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  616  	err = bpf_load_and_run(&opts);
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  617  	if (err < 0)
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  618  		return err;
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  619  	return 0;
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  620  }
f5c27da4e3c8a2 Benjamin Tissoires 2022-11-03  621  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

--HWmUydCSCUNB5659
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=config

#
# Automatically generated file; DO NOT EDIT.
# Linux/arc 6.1.0-rc4 Kernel Configuration
#
CONFIG_CC_VERSION_TEXT="arc-elf-gcc (GCC) 12.1.0"
CONFIG_CC_IS_GCC=y
CONFIG_GCC_VERSION=120100
CONFIG_CLANG_VERSION=0
CONFIG_AS_IS_GNU=y
CONFIG_AS_VERSION=23800
CONFIG_LD_IS_BFD=y
CONFIG_LD_VERSION=23800
CONFIG_LLD_VERSION=0
CONFIG_CC_HAS_ASM_GOTO_OUTPUT=y
CONFIG_CC_HAS_ASM_INLINE=y
CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=y
CONFIG_PAHOLE_VERSION=123
CONFIG_IRQ_WORK=y
CONFIG_BUILDTIME_TABLE_SORT=y

#
# General setup
#
CONFIG_INIT_ENV_ARG_LIMIT=32
CONFIG_COMPILE_TEST=y
# CONFIG_WERROR is not set
CONFIG_LOCALVERSION=""
CONFIG_BUILD_SALT=""
CONFIG_HAVE_KERNEL_GZIP=y
CONFIG_HAVE_KERNEL_LZMA=y
CONFIG_KERNEL_GZIP=y
# CONFIG_KERNEL_LZMA is not set
CONFIG_DEFAULT_INIT=""
CONFIG_DEFAULT_HOSTNAME="(none)"
# CONFIG_SYSVIPC is not set
# CONFIG_WATCH_QUEUE is not set
CONFIG_CROSS_MEMORY_ATTACH=y
CONFIG_USELIB=y

#
# IRQ subsystem
#
CONFIG_GENERIC_IRQ_SHOW=y
CONFIG_GENERIC_PENDING_IRQ=y
CONFIG_GENERIC_IRQ_INJECTION=y
CONFIG_GENERIC_IRQ_CHIP=y
CONFIG_IRQ_DOMAIN=y
CONFIG_IRQ_SIM=y
CONFIG_IRQ_DOMAIN_HIERARCHY=y
CONFIG_GENERIC_IRQ_DEBUGFS=y
# end of IRQ subsystem

CONFIG_GENERIC_CLOCKEVENTS=y
CONFIG_TIME_KUNIT_TEST=y
CONFIG_CONTEXT_TRACKING=y
CONFIG_CONTEXT_TRACKING_IDLE=y

#
# Timers subsystem
#
CONFIG_HZ_PERIODIC=y
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ=y
# CONFIG_HIGH_RES_TIMERS is not set
# end of Timers subsystem

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
# CONFIG_BSD_PROCESS_ACCT is not set
CONFIG_PSI=y
# CONFIG_PSI_DEFAULT_DISABLED is not set
# end of CPU/Task time and stats accounting

CONFIG_CPU_ISOLATION=y

#
# RCU Subsystem
#
CONFIG_TREE_RCU=y
# CONFIG_RCU_EXPERT is not set
CONFIG_SRCU=y
CONFIG_TREE_SRCU=y
CONFIG_TASKS_RCU_GENERIC=y
CONFIG_TASKS_TRACE_RCU=y
CONFIG_RCU_STALL_COMMON=y
CONFIG_RCU_NEED_SEGCBLIST=y
# end of RCU Subsystem

CONFIG_IKCONFIG=y
# CONFIG_IKHEADERS is not set
CONFIG_LOG_BUF_SHIFT=17
CONFIG_LOG_CPU_MAX_BUF_SHIFT=12
CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=13
# CONFIG_PRINTK_INDEX is not set
CONFIG_GENERIC_SCHED_CLOCK=y

#
# Scheduler features
#
# end of Scheduler features

CONFIG_CC_IMPLICIT_FALLTHROUGH="-Wimplicit-fallthrough=5"
CONFIG_GCC12_NO_ARRAY_BOUNDS=y
CONFIG_CC_NO_ARRAY_BOUNDS=y
CONFIG_CGROUPS=y
# CONFIG_CGROUP_FAVOR_DYNMODS is not set
# CONFIG_MEMCG is not set
# CONFIG_CGROUP_SCHED is not set
# CONFIG_CGROUP_PIDS is not set
CONFIG_CGROUP_RDMA=y
# CONFIG_CGROUP_FREEZER is not set
CONFIG_CPUSETS=y
CONFIG_PROC_PID_CPUSET=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_PERF=y
CONFIG_CGROUP_BPF=y
# CONFIG_CGROUP_MISC is not set
CONFIG_CGROUP_DEBUG=y
CONFIG_SOCK_CGROUP_DATA=y
# CONFIG_NAMESPACES is not set
# CONFIG_SCHED_AUTOGROUP is not set
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
CONFIG_RELAY=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""
# CONFIG_RD_GZIP is not set
# CONFIG_RD_BZIP2 is not set
# CONFIG_RD_LZMA is not set
CONFIG_RD_XZ=y
# CONFIG_RD_LZO is not set
# CONFIG_RD_LZ4 is not set
CONFIG_RD_ZSTD=y
CONFIG_BOOT_CONFIG=y
CONFIG_BOOT_CONFIG_EMBED=y
CONFIG_BOOT_CONFIG_EMBED_FILE=""
# CONFIG_INITRAMFS_PRESERVE_MTIME is not set
# CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
CONFIG_CC_OPTIMIZE_FOR_SIZE=y
CONFIG_SYSCTL_ARCH_UNALIGN_NO_WARN=y
CONFIG_SYSCTL_ARCH_UNALIGN_ALLOW=y
CONFIG_EXPERT=y
CONFIG_MULTIUSER=y
# CONFIG_SGETMASK_SYSCALL is not set
CONFIG_SYSFS_SYSCALL=y
CONFIG_FHANDLE=y
# CONFIG_POSIX_TIMERS is not set
CONFIG_PRINTK=y
CONFIG_BUG=y
# CONFIG_BASE_FULL is not set
CONFIG_FUTEX=y
CONFIG_FUTEX_PI=y
CONFIG_EPOLL=y
CONFIG_SIGNALFD=y
CONFIG_TIMERFD=y
CONFIG_EVENTFD=y
CONFIG_SHMEM=y
CONFIG_AIO=y
CONFIG_IO_URING=y
# CONFIG_ADVISE_SYSCALLS is not set
# CONFIG_MEMBARRIER is not set
CONFIG_KALLSYMS=y
# CONFIG_KALLSYMS_ALL is not set
CONFIG_KALLSYMS_BASE_RELATIVE=y
CONFIG_KCMP=y
CONFIG_EMBEDDED=y
CONFIG_HAVE_PERF_EVENTS=y
CONFIG_PERF_USE_VMALLOC=y
CONFIG_PC104=y

#
# Kernel Performance Events And Counters
#
CONFIG_PERF_EVENTS=y
CONFIG_DEBUG_PERF_USE_VMALLOC=y
# end of Kernel Performance Events And Counters

CONFIG_PROFILING=y
# end of General setup

CONFIG_ARC=y
CONFIG_LOCKDEP_SUPPORT=y
CONFIG_SCHED_OMIT_FRAME_POINTER=y
CONFIG_GENERIC_CSUM=y
CONFIG_ARCH_FLATMEM_ENABLE=y
CONFIG_MMU=y
CONFIG_NO_IOPORT_MAP=y
CONFIG_GENERIC_CALIBRATE_DELAY=y
CONFIG_GENERIC_HWEIGHT=y
CONFIG_STACKTRACE_SUPPORT=y

#
# ARC Architecture Configuration
#

#
# ARC Platform/SoC/Board
#
CONFIG_ARC_PLAT_TB10X=y
CONFIG_ARC_PLAT_AXS10X=y
CONFIG_AXS101=y
# end of ARC Platform/SoC/Board

CONFIG_ISA_ARCOMPACT=y
# CONFIG_ISA_ARCV2 is not set

#
# ARC CPU Configuration
#
CONFIG_ARC_CPU_770=y
CONFIG_ARC_TUNE_MCPU=""
# CONFIG_CPU_BIG_ENDIAN is not set
CONFIG_SMP=y
CONFIG_NR_CPUS=4
# CONFIG_ARC_SMP_HALT_ON_RESET is not set
# CONFIG_ARC_CACHE is not set
# CONFIG_ARC_HAS_ICCM is not set
# CONFIG_ARC_HAS_DCCM is not set
CONFIG_ARC_MMU_V3=y
CONFIG_ARC_PAGE_SIZE_8K=y
# CONFIG_ARC_PAGE_SIZE_16K is not set
# CONFIG_ARC_PAGE_SIZE_4K is not set
CONFIG_PGTABLE_LEVELS=2
# CONFIG_ARC_FPU_SAVE_RESTORE is not set
CONFIG_ARC_HAS_LLSC=y
CONFIG_ARC_HAS_SWAPE=y
# end of ARC CPU Configuration

CONFIG_LINUX_LINK_BASE=0x80000000
CONFIG_LINUX_RAM_BASE=0x80000000
CONFIG_HIGHMEM=y
CONFIG_ARC_KVADDR_SIZE=256
CONFIG_ARC_CURR_IN_REG=y
CONFIG_ARC_EMUL_UNALIGNED=y
CONFIG_HZ=100
# CONFIG_ARC_METAWARE_HLINK is not set
CONFIG_ARC_DBG=y
CONFIG_ARC_DW2_UNWIND=y
CONFIG_ARC_BUILTIN_DTB_NAME=""
# end of ARC Architecture Configuration

CONFIG_ARCH_FORCE_MAX_ORDER=11
CONFIG_PM=y
CONFIG_PM_DEBUG=y
# CONFIG_PM_ADVANCED_DEBUG is not set
# CONFIG_DPM_WATCHDOG is not set
CONFIG_PM_CLK=y
CONFIG_PM_GENERIC_DOMAINS=y
# CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
CONFIG_PM_GENERIC_DOMAINS_OF=y

#
# General architecture-dependent options
#
CONFIG_HAVE_IOREMAP_PROT=y
CONFIG_HAVE_KPROBES=y
CONFIG_HAVE_KRETPROBES=y
CONFIG_TRACE_IRQFLAGS_SUPPORT=y
CONFIG_HAVE_ARCH_TRACEHOOK=y
CONFIG_GENERIC_SMP_IDLE_THREAD=y
CONFIG_ARCH_32BIT_OFF_T=y
CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=y
CONFIG_LTO_NONE=y
CONFIG_HAVE_MOD_ARCH_SPECIFIC=y
CONFIG_MODULES_USE_ELF_RELA=y
CONFIG_PAGE_SIZE_LESS_THAN_64KB=y
CONFIG_PAGE_SIZE_LESS_THAN_256KB=y
CONFIG_CLONE_BACKWARDS=y
# CONFIG_COMPAT_32BIT_TIME is not set
CONFIG_CPU_NO_EFFICIENT_FFS=y
CONFIG_LOCK_EVENT_COUNTS=y
CONFIG_HAVE_ARCH_PFN_VALID=y

#
# GCOV-based kernel profiling
#
# CONFIG_GCOV_KERNEL is not set
# end of GCOV-based kernel profiling
# end of General architecture-dependent options

CONFIG_RT_MUTEXES=y
CONFIG_BASE_SMALL=1
# CONFIG_MODULES is not set
# CONFIG_BLOCK is not set
CONFIG_PADATA=y
CONFIG_ASN1=y
CONFIG_INLINE_SPIN_UNLOCK_IRQ=y
CONFIG_INLINE_READ_UNLOCK=y
CONFIG_INLINE_READ_UNLOCK_IRQ=y
CONFIG_INLINE_WRITE_UNLOCK=y
CONFIG_INLINE_WRITE_UNLOCK_IRQ=y
CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=y
CONFIG_MUTEX_SPIN_ON_OWNER=y
CONFIG_RWSEM_SPIN_ON_OWNER=y
CONFIG_LOCK_SPIN_ON_OWNER=y

#
# Executable file formats
#
# CONFIG_BINFMT_ELF is not set
CONFIG_BINFMT_SCRIPT=y
# CONFIG_BINFMT_MISC is not set
# CONFIG_COREDUMP is not set
# end of Executable file formats

#
# Memory Management options
#

#
# SLAB allocator options
#
CONFIG_SLAB=y
# CONFIG_SLUB is not set
# CONFIG_SLOB is not set
# CONFIG_SLAB_MERGE_DEFAULT is not set
CONFIG_SLAB_FREELIST_RANDOM=y
CONFIG_SLAB_FREELIST_HARDENED=y
# end of SLAB allocator options

# CONFIG_SHUFFLE_PAGE_ALLOCATOR is not set
# CONFIG_COMPAT_BRK is not set
CONFIG_FLATMEM=y
CONFIG_MEMORY_ISOLATION=y
CONFIG_EXCLUSIVE_SYSTEM_RAM=y
CONFIG_SPLIT_PTLOCK_CPUS=4
CONFIG_COMPACTION=y
CONFIG_COMPACT_UNEVICTABLE_DEFAULT=1
# CONFIG_PAGE_REPORTING is not set
CONFIG_MIGRATION=y
CONFIG_CONTIG_ALLOC=y
CONFIG_KSM=y
CONFIG_DEFAULT_MMAP_MIN_ADDR=4096
CONFIG_CMA=y
# CONFIG_CMA_DEBUG is not set
# CONFIG_CMA_DEBUGFS is not set
# CONFIG_CMA_SYSFS is not set
CONFIG_CMA_AREAS=7
# CONFIG_IDLE_PAGE_TRACKING is not set
CONFIG_ARCH_HAS_CACHE_LINE_SIZE=y
# CONFIG_VM_EVENT_COUNTERS is not set
# CONFIG_PERCPU_STATS is not set
CONFIG_GUP_TEST=y
CONFIG_ARCH_HAS_PTE_SPECIAL=y
CONFIG_KMAP_LOCAL=y
CONFIG_USERFAULTFD=y
# CONFIG_LRU_GEN is not set

#
# Data Access Monitoring
#
# CONFIG_DAMON is not set
# end of Data Access Monitoring
# end of Memory Management options

# CONFIG_NET is not set

#
# Device Drivers
#
CONFIG_HAVE_PCI=y
# CONFIG_PCI is not set
CONFIG_PCCARD=y
CONFIG_PCMCIA=y
# CONFIG_PCMCIA_LOAD_CIS is not set

#
# PC-card bridges
#

#
# Generic Driver Options
#
CONFIG_AUXILIARY_BUS=y
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
CONFIG_FW_LOADER=y
CONFIG_FW_LOADER_PAGED_BUF=y
CONFIG_FW_LOADER_SYSFS=y
CONFIG_EXTRA_FIRMWARE=""
CONFIG_FW_LOADER_USER_HELPER=y
# CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
# CONFIG_FW_LOADER_COMPRESS is not set
CONFIG_FW_UPLOAD=y
# end of Firmware loader

CONFIG_WANT_DEV_COREDUMP=y
# CONFIG_ALLOW_DEV_COREDUMP is not set
CONFIG_DEBUG_DRIVER=y
# CONFIG_DEBUG_DEVRES is not set
# CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
CONFIG_PM_QOS_KUNIT_TEST=y
CONFIG_DRIVER_PE_KUNIT_TEST=y
CONFIG_REGMAP=y
CONFIG_REGMAP_I2C=y
CONFIG_REGMAP_SLIMBUS=y
CONFIG_REGMAP_MMIO=y
CONFIG_REGMAP_IRQ=y
CONFIG_DMA_SHARED_BUFFER=y
CONFIG_DMA_FENCE_TRACE=y
# end of Generic Driver Options

#
# Bus devices
#
# CONFIG_ARM_INTEGRATOR_LM is not set
# CONFIG_BT1_APB is not set
# CONFIG_BT1_AXI is not set
# CONFIG_HISILICON_LPC is not set
# CONFIG_INTEL_IXP4XX_EB is not set
# CONFIG_QCOM_EBI2 is not set
# CONFIG_MHI_BUS is not set
# CONFIG_MHI_BUS_EP is not set
# end of Bus devices

#
# Firmware Drivers
#

#
# ARM System Control and Management Interface Protocol
#
# CONFIG_ARM_SCMI_PROTOCOL is not set
CONFIG_ARM_SCMI_POWER_DOMAIN=y
# CONFIG_ARM_SCMI_POWER_CONTROL is not set
# end of ARM System Control and Management Interface Protocol

CONFIG_ARM_SCPI_POWER_DOMAIN=y
CONFIG_FIRMWARE_MEMMAP=y
# CONFIG_BCM47XX_NVRAM is not set
CONFIG_GOOGLE_FIRMWARE=y
# CONFIG_GOOGLE_COREBOOT_TABLE is not set

#
# Tegra firmware driver
#
# end of Tegra firmware driver
# end of Firmware Drivers

CONFIG_GNSS=y
CONFIG_GNSS_SERIAL=y
CONFIG_GNSS_MTK_SERIAL=y
CONFIG_GNSS_SIRF_SERIAL=y
CONFIG_GNSS_UBX_SERIAL=y
CONFIG_GNSS_USB=y
# CONFIG_MTD is not set
CONFIG_DTC=y
CONFIG_OF=y
CONFIG_OF_UNITTEST=y
# CONFIG_OF_ALL_DTBS is not set
CONFIG_OF_FLATTREE=y
CONFIG_OF_EARLY_FLATTREE=y
CONFIG_OF_KOBJ=y
CONFIG_OF_DYNAMIC=y
CONFIG_OF_ADDRESS=y
CONFIG_OF_IRQ=y
CONFIG_OF_RESERVED_MEM=y
CONFIG_OF_RESOLVE=y
CONFIG_OF_OVERLAY=y
CONFIG_PARPORT=y
CONFIG_PARPORT_AX88796=y
# CONFIG_PARPORT_1284 is not set
CONFIG_PARPORT_NOT_PC=y

#
# NVME Support
#
# end of NVME Support

#
# Misc devices
#
CONFIG_SENSORS_LIS3LV02D=y
CONFIG_AD525X_DPOT=y
# CONFIG_AD525X_DPOT_I2C is not set
CONFIG_DUMMY_IRQ=y
CONFIG_ICS932S401=y
# CONFIG_ATMEL_SSC is not set
CONFIG_ENCLOSURE_SERVICES=y
# CONFIG_QCOM_COINCELL is not set
# CONFIG_QCOM_FASTRPC is not set
CONFIG_APDS9802ALS=y
CONFIG_ISL29003=y
# CONFIG_ISL29020 is not set
CONFIG_SENSORS_TSL2550=y
# CONFIG_SENSORS_BH1770 is not set
# CONFIG_SENSORS_APDS990X is not set
# CONFIG_HMC6352 is not set
CONFIG_DS1682=y
# CONFIG_SRAM is not set
CONFIG_XILINX_SDFEC=y
CONFIG_MISC_RTSX=y
CONFIG_HISI_HIKEY_USB=y
# CONFIG_OPEN_DICE is not set
CONFIG_VCPU_STALL_DETECTOR=y
CONFIG_C2PORT=y

#
# EEPROM support
#
CONFIG_EEPROM_AT24=y
CONFIG_EEPROM_LEGACY=y
CONFIG_EEPROM_MAX6875=y
# CONFIG_EEPROM_93CX6 is not set
# CONFIG_EEPROM_IDT_89HPESX is not set
CONFIG_EEPROM_EE1004=y
# end of EEPROM support

#
# Texas Instruments shared transport line discipline
#
# end of Texas Instruments shared transport line discipline

CONFIG_SENSORS_LIS3_I2C=y
CONFIG_ALTERA_STAPL=y
CONFIG_ECHO=y
CONFIG_MISC_RTSX_USB=y
CONFIG_PVPANIC=y
CONFIG_PVPANIC_MMIO=y
# end of Misc devices

#
# SCSI device support
#
# end of SCSI device support

#
# IEEE 1394 (FireWire) support
#
# CONFIG_FIREWIRE is not set
# end of IEEE 1394 (FireWire) support

#
# Input device support
#
CONFIG_INPUT=y
# CONFIG_INPUT_LEDS is not set
CONFIG_INPUT_FF_MEMLESS=y
# CONFIG_INPUT_SPARSEKMAP is not set
CONFIG_INPUT_MATRIXKMAP=y

#
# Userland interfaces
#
CONFIG_INPUT_MOUSEDEV=y
# CONFIG_INPUT_MOUSEDEV_PSAUX is not set
CONFIG_INPUT_MOUSEDEV_SCREEN_X=1024
CONFIG_INPUT_MOUSEDEV_SCREEN_Y=768
CONFIG_INPUT_JOYDEV=y
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_EVBUG=y

#
# Input Device Drivers
#
# CONFIG_INPUT_KEYBOARD is not set
CONFIG_INPUT_MOUSE=y
# CONFIG_MOUSE_PS2 is not set
CONFIG_MOUSE_SERIAL=y
CONFIG_MOUSE_APPLETOUCH=y
# CONFIG_MOUSE_BCM5974 is not set
CONFIG_MOUSE_CYAPA=y
# CONFIG_MOUSE_ELAN_I2C is not set
CONFIG_MOUSE_VSXXXAA=y
# CONFIG_MOUSE_GPIO is not set
CONFIG_MOUSE_SYNAPTICS_I2C=y
# CONFIG_MOUSE_SYNAPTICS_USB is not set
CONFIG_INPUT_JOYSTICK=y
# CONFIG_JOYSTICK_ANALOG is not set
# CONFIG_JOYSTICK_A3D is not set
CONFIG_JOYSTICK_ADI=y
# CONFIG_JOYSTICK_COBRA is not set
CONFIG_JOYSTICK_GF2K=y
# CONFIG_JOYSTICK_GRIP is not set
CONFIG_JOYSTICK_GRIP_MP=y
CONFIG_JOYSTICK_GUILLEMOT=y
# CONFIG_JOYSTICK_INTERACT is not set
# CONFIG_JOYSTICK_SIDEWINDER is not set
CONFIG_JOYSTICK_TMDC=y
CONFIG_JOYSTICK_IFORCE=y
# CONFIG_JOYSTICK_IFORCE_USB is not set
CONFIG_JOYSTICK_IFORCE_232=y
CONFIG_JOYSTICK_WARRIOR=y
CONFIG_JOYSTICK_MAGELLAN=y
CONFIG_JOYSTICK_SPACEORB=y
CONFIG_JOYSTICK_SPACEBALL=y
CONFIG_JOYSTICK_STINGER=y
# CONFIG_JOYSTICK_TWIDJOY is not set
# CONFIG_JOYSTICK_ZHENHUA is not set
CONFIG_JOYSTICK_DB9=y
# CONFIG_JOYSTICK_GAMECON is not set
# CONFIG_JOYSTICK_TURBOGRAFX is not set
CONFIG_JOYSTICK_AS5011=y
# CONFIG_JOYSTICK_JOYDUMP is not set
CONFIG_JOYSTICK_XPAD=y
CONFIG_JOYSTICK_XPAD_FF=y
CONFIG_JOYSTICK_XPAD_LEDS=y
CONFIG_JOYSTICK_PXRC=y
CONFIG_JOYSTICK_QWIIC=y
CONFIG_JOYSTICK_FSIA6B=y
CONFIG_JOYSTICK_SENSEHAT=y
# CONFIG_INPUT_TABLET is not set
# CONFIG_INPUT_TOUCHSCREEN is not set
CONFIG_INPUT_MISC=y
CONFIG_INPUT_AD714X=y
# CONFIG_INPUT_AD714X_I2C is not set
# CONFIG_INPUT_ATMEL_CAPTOUCH is not set
CONFIG_INPUT_BMA150=y
CONFIG_INPUT_E3X0_BUTTON=y
CONFIG_INPUT_MAX77693_HAPTIC=y
# CONFIG_INPUT_MAX8997_HAPTIC is not set
CONFIG_INPUT_MC13783_PWRBUTTON=y
CONFIG_INPUT_MMA8450=y
# CONFIG_INPUT_GPIO_BEEPER is not set
CONFIG_INPUT_GPIO_DECODER=y
# CONFIG_INPUT_GPIO_VIBRA is not set
# CONFIG_INPUT_ATI_REMOTE2 is not set
CONFIG_INPUT_KEYSPAN_REMOTE=y
CONFIG_INPUT_KXTJ9=y
CONFIG_INPUT_POWERMATE=y
CONFIG_INPUT_YEALINK=y
# CONFIG_INPUT_CM109 is not set
CONFIG_INPUT_REGULATOR_HAPTIC=y
# CONFIG_INPUT_RETU_PWRBUTTON is not set
CONFIG_INPUT_TPS65218_PWRBUTTON=y
# CONFIG_INPUT_AXP20X_PEK is not set
# CONFIG_INPUT_TWL4030_PWRBUTTON is not set
CONFIG_INPUT_TWL4030_VIBRA=y
CONFIG_INPUT_TWL6040_VIBRA=y
CONFIG_INPUT_UINPUT=y
# CONFIG_INPUT_PCF50633_PMU is not set
CONFIG_INPUT_PCF8574=y
CONFIG_INPUT_PWM_BEEPER=y
# CONFIG_INPUT_PWM_VIBRA is not set
CONFIG_INPUT_RK805_PWRKEY=y
# CONFIG_INPUT_GPIO_ROTARY_ENCODER is not set
CONFIG_INPUT_DA7280_HAPTICS=y
CONFIG_INPUT_DA9055_ONKEY=y
CONFIG_INPUT_DA9063_ONKEY=y
CONFIG_INPUT_ADXL34X=y
CONFIG_INPUT_ADXL34X_I2C=y
# CONFIG_INPUT_IBM_PANEL is not set
# CONFIG_INPUT_IMS_PCU is not set
# CONFIG_INPUT_IQS269A is not set
CONFIG_INPUT_IQS626A=y
CONFIG_INPUT_IQS7222=y
CONFIG_INPUT_CMA3000=y
CONFIG_INPUT_CMA3000_I2C=y
CONFIG_INPUT_DRV260X_HAPTICS=y
CONFIG_INPUT_DRV2665_HAPTICS=y
CONFIG_INPUT_DRV2667_HAPTICS=y
# CONFIG_INPUT_HISI_POWERKEY is not set
CONFIG_INPUT_RAVE_SP_PWRBUTTON=y
# CONFIG_INPUT_SC27XX_VIBRA is not set
# CONFIG_INPUT_RT5120_PWRKEY is not set
# CONFIG_INPUT_STPMIC1_ONKEY is not set
CONFIG_RMI4_CORE=y
CONFIG_RMI4_I2C=y
CONFIG_RMI4_SMB=y
CONFIG_RMI4_F03=y
CONFIG_RMI4_F03_SERIO=y
CONFIG_RMI4_2D_SENSOR=y
CONFIG_RMI4_F11=y
CONFIG_RMI4_F12=y
CONFIG_RMI4_F30=y
CONFIG_RMI4_F34=y
CONFIG_RMI4_F3A=y
CONFIG_RMI4_F55=y

#
# Hardware I/O ports
#
CONFIG_SERIO=y
CONFIG_SERIO_SERPORT=y
# CONFIG_SERIO_PARKBD is not set
CONFIG_SERIO_LIBPS2=y
CONFIG_SERIO_RAW=y
# CONFIG_SERIO_ALTERA_PS2 is not set
CONFIG_SERIO_PS2MULT=y
CONFIG_SERIO_ARC_PS2=y
# CONFIG_SERIO_APBPS2 is not set
# CONFIG_SERIO_OLPC_APSP is not set
# CONFIG_SERIO_SUN4I_PS2 is not set
CONFIG_SERIO_GPIO_PS2=y
CONFIG_USERIO=y
CONFIG_GAMEPORT=y
CONFIG_GAMEPORT_NS558=y
# CONFIG_GAMEPORT_L4 is not set
# end of Hardware I/O ports
# end of Input device support

#
# Character devices
#
CONFIG_TTY=y
# CONFIG_VT is not set
CONFIG_UNIX98_PTYS=y
CONFIG_LEGACY_PTYS=y
CONFIG_LEGACY_PTY_COUNT=256
CONFIG_LDISC_AUTOLOAD=y

#
# Serial drivers
#
CONFIG_SERIAL_EARLYCON=y
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_DEPRECATED_OPTIONS=y
CONFIG_SERIAL_8250_16550A_VARIANTS=y
CONFIG_SERIAL_8250_FINTEK=y
# CONFIG_SERIAL_8250_CONSOLE is not set
# CONFIG_SERIAL_8250_DMA is not set
CONFIG_SERIAL_8250_CS=y
CONFIG_SERIAL_8250_NR_UARTS=4
CONFIG_SERIAL_8250_RUNTIME_UARTS=4
# CONFIG_SERIAL_8250_EXTENDED is not set
# CONFIG_SERIAL_8250_ASPEED_VUART is not set
# CONFIG_SERIAL_8250_DW is not set
# CONFIG_SERIAL_8250_EM is not set
# CONFIG_SERIAL_8250_IOC3 is not set
CONFIG_SERIAL_8250_RT288X=y
# CONFIG_SERIAL_8250_OMAP is not set
# CONFIG_SERIAL_8250_LPC18XX is not set
# CONFIG_SERIAL_8250_MT6577 is not set
# CONFIG_SERIAL_8250_UNIPHIER is not set
# CONFIG_SERIAL_8250_INGENIC is not set
# CONFIG_SERIAL_8250_PXA is not set
CONFIG_SERIAL_8250_TEGRA=y
# CONFIG_SERIAL_8250_BCM7271 is not set
# CONFIG_SERIAL_OF_PLATFORM is not set

#
# Non-8250 serial port support
#
# CONFIG_SERIAL_AMBA_PL010 is not set
# CONFIG_SERIAL_ATMEL is not set
# CONFIG_SERIAL_MESON is not set
# CONFIG_SERIAL_CLPS711X is not set
# CONFIG_SERIAL_SAMSUNG is not set
# CONFIG_SERIAL_TEGRA is not set
# CONFIG_SERIAL_IMX is not set
# CONFIG_SERIAL_IMX_EARLYCON is not set
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
CONFIG_SERIAL_UARTLITE_NR_UARTS=1
# CONFIG_SERIAL_SH_SCI is not set
# CONFIG_SERIAL_HS_LPC32XX is not set
CONFIG_SERIAL_CORE=y
CONFIG_SERIAL_CORE_CONSOLE=y
# CONFIG_SERIAL_MSM is not set
# CONFIG_SERIAL_VT8500 is not set
# CONFIG_SERIAL_OMAP is not set
CONFIG_SERIAL_SIFIVE=y
CONFIG_SERIAL_SIFIVE_CONSOLE=y
# CONFIG_SERIAL_LANTIQ is not set
CONFIG_SERIAL_SCCNXP=y
# CONFIG_SERIAL_SCCNXP_CONSOLE is not set
# CONFIG_SERIAL_SC16IS7XX is not set
# CONFIG_SERIAL_TIMBERDALE is not set
# CONFIG_SERIAL_BCM63XX is not set
CONFIG_SERIAL_ALTERA_JTAGUART=y
# CONFIG_SERIAL_ALTERA_JTAGUART_CONSOLE is not set
CONFIG_SERIAL_ALTERA_UART=y
CONFIG_SERIAL_ALTERA_UART_MAXPORTS=4
CONFIG_SERIAL_ALTERA_UART_BAUDRATE=115200
# CONFIG_SERIAL_ALTERA_UART_CONSOLE is not set
# CONFIG_SERIAL_MXS_AUART is not set
# CONFIG_SERIAL_XILINX_PS_UART is not set
# CONFIG_SERIAL_MPS2_UART is not set
# CONFIG_SERIAL_ARC is not set
CONFIG_SERIAL_FSL_LPUART=y
CONFIG_SERIAL_FSL_LPUART_CONSOLE=y
CONFIG_SERIAL_FSL_LINFLEXUART=y
# CONFIG_SERIAL_FSL_LINFLEXUART_CONSOLE is not set
CONFIG_SERIAL_CONEXANT_DIGICOLOR=y
CONFIG_SERIAL_CONEXANT_DIGICOLOR_CONSOLE=y
# CONFIG_SERIAL_ST_ASC is not set
CONFIG_SERIAL_SPRD=y
# CONFIG_SERIAL_SPRD_CONSOLE is not set
# CONFIG_SERIAL_STM32 is not set
# CONFIG_SERIAL_MVEBU_UART is not set
# CONFIG_SERIAL_OWL is not set
# CONFIG_SERIAL_RDA is not set
# CONFIG_SERIAL_MILBEAUT_USIO is not set
# CONFIG_SERIAL_LITEUART is not set
# CONFIG_SERIAL_SUNPLUS is not set
# end of Serial drivers

CONFIG_SERIAL_MCTRL_GPIO=y
CONFIG_SERIAL_NONSTANDARD=y
CONFIG_N_HDLC=y
CONFIG_NULL_TTY=y
CONFIG_RPMSG_TTY=y
CONFIG_SERIAL_DEV_BUS=y
# CONFIG_SERIAL_DEV_CTRL_TTYPORT is not set
CONFIG_TTY_PRINTK=y
CONFIG_TTY_PRINTK_LEVEL=6
# CONFIG_PRINTER is not set
CONFIG_PPDEV=y
# CONFIG_VIRTIO_CONSOLE is not set
CONFIG_IPMI_HANDLER=y
CONFIG_IPMI_PANIC_EVENT=y
# CONFIG_IPMI_PANIC_STRING is not set
CONFIG_IPMI_DEVICE_INTERFACE=y
# CONFIG_IPMI_SI is not set
CONFIG_IPMI_SSIF=y
CONFIG_IPMI_IPMB=y
# CONFIG_IPMI_WATCHDOG is not set
CONFIG_IPMI_POWEROFF=y
# CONFIG_ASPEED_KCS_IPMI_BMC is not set
# CONFIG_NPCM7XX_KCS_IPMI_BMC is not set
# CONFIG_ASPEED_BT_IPMI_BMC is not set
# CONFIG_IPMB_DEVICE_INTERFACE is not set
CONFIG_HW_RANDOM=y
CONFIG_HW_RANDOM_TIMERIOMEM=y
CONFIG_HW_RANDOM_ATMEL=y
# CONFIG_HW_RANDOM_BA431 is not set
CONFIG_HW_RANDOM_BCM2835=y
CONFIG_HW_RANDOM_IPROC_RNG200=y
CONFIG_HW_RANDOM_IXP4XX=y
CONFIG_HW_RANDOM_OMAP=y
CONFIG_HW_RANDOM_OMAP3_ROM=y
CONFIG_HW_RANDOM_VIRTIO=y
CONFIG_HW_RANDOM_IMX_RNGC=y
CONFIG_HW_RANDOM_NOMADIK=y
CONFIG_HW_RANDOM_STM32=y
CONFIG_HW_RANDOM_MESON=y
CONFIG_HW_RANDOM_MTK=y
CONFIG_HW_RANDOM_EXYNOS=y
CONFIG_HW_RANDOM_NPCM=y
CONFIG_HW_RANDOM_KEYSTONE=y
CONFIG_HW_RANDOM_CCTRNG=y
# CONFIG_HW_RANDOM_XIPHERA is not set

#
# PCMCIA character devices
#
CONFIG_SYNCLINK_CS=y
CONFIG_CARDMAN_4000=y
CONFIG_CARDMAN_4040=y
CONFIG_SCR24X=y
# end of PCMCIA character devices

# CONFIG_DEVMEM is not set
CONFIG_TCG_TPM=y
CONFIG_HW_RANDOM_TPM=y
CONFIG_TCG_TIS_CORE=y
CONFIG_TCG_TIS=y
CONFIG_TCG_TIS_I2C=y
# CONFIG_TCG_TIS_SYNQUACER is not set
CONFIG_TCG_TIS_I2C_CR50=y
# CONFIG_TCG_TIS_I2C_ATMEL is not set
CONFIG_TCG_TIS_I2C_INFINEON=y
# CONFIG_TCG_TIS_I2C_NUVOTON is not set
CONFIG_TCG_VTPM_PROXY=y
# CONFIG_TCG_TIS_ST33ZP24_I2C is not set
CONFIG_XILLYBUS_CLASS=y
CONFIG_XILLYBUS=y
CONFIG_XILLYBUS_OF=y
# CONFIG_XILLYUSB is not set
CONFIG_RANDOM_TRUST_CPU=y
CONFIG_RANDOM_TRUST_BOOTLOADER=y
# end of Character devices

#
# I2C support
#
CONFIG_I2C=y
CONFIG_I2C_BOARDINFO=y
CONFIG_I2C_COMPAT=y
CONFIG_I2C_CHARDEV=y
CONFIG_I2C_MUX=y

#
# Multiplexer I2C Chip support
#
CONFIG_I2C_ARB_GPIO_CHALLENGE=y
CONFIG_I2C_MUX_GPIO=y
CONFIG_I2C_MUX_GPMUX=y
CONFIG_I2C_MUX_LTC4306=y
# CONFIG_I2C_MUX_PCA9541 is not set
# CONFIG_I2C_MUX_PCA954x is not set
CONFIG_I2C_MUX_PINCTRL=y
# CONFIG_I2C_MUX_REG is not set
CONFIG_I2C_DEMUX_PINCTRL=y
# CONFIG_I2C_MUX_MLXCPLD is not set
# end of Multiplexer I2C Chip support

CONFIG_I2C_HELPER_AUTO=y
CONFIG_I2C_SMBUS=y
CONFIG_I2C_ALGOBIT=y

#
# I2C Hardware Bus support
#
# CONFIG_I2C_HIX5HD2 is not set

#
# I2C system bus drivers (mostly embedded / system-on-chip)
#
# CONFIG_I2C_ALTERA is not set
# CONFIG_I2C_ASPEED is not set
# CONFIG_I2C_AT91 is not set
# CONFIG_I2C_AXXIA is not set
# CONFIG_I2C_BCM2835 is not set
# CONFIG_I2C_BCM_IPROC is not set
# CONFIG_I2C_BCM_KONA is not set
CONFIG_I2C_BRCMSTB=y
# CONFIG_I2C_CADENCE is not set
CONFIG_I2C_CBUS_GPIO=y
# CONFIG_I2C_DAVINCI is not set
CONFIG_I2C_DESIGNWARE_CORE=y
# CONFIG_I2C_DESIGNWARE_SLAVE is not set
CONFIG_I2C_DESIGNWARE_PLATFORM=y
# CONFIG_I2C_DIGICOLOR is not set
CONFIG_I2C_EMEV2=y
# CONFIG_I2C_EXYNOS5 is not set
CONFIG_I2C_GPIO=y
# CONFIG_I2C_GPIO_FAULT_INJECTOR is not set
# CONFIG_I2C_HIGHLANDER is not set
# CONFIG_I2C_HISI is not set
# CONFIG_I2C_IMG is not set
# CONFIG_I2C_IMX is not set
# CONFIG_I2C_IMX_LPI2C is not set
# CONFIG_I2C_IOP3XX is not set
# CONFIG_I2C_JZ4780 is not set
# CONFIG_I2C_LPC2K is not set
# CONFIG_I2C_MESON is not set
# CONFIG_I2C_MICROCHIP_CORE is not set
# CONFIG_I2C_MT65XX is not set
# CONFIG_I2C_MT7621 is not set
# CONFIG_I2C_MV64XXX is not set
# CONFIG_I2C_MXS is not set
# CONFIG_I2C_NPCM is not set
CONFIG_I2C_OCORES=y
# CONFIG_I2C_OMAP is not set
# CONFIG_I2C_OWL is not set
# CONFIG_I2C_APPLE is not set
# CONFIG_I2C_PCA_PLATFORM is not set
# CONFIG_I2C_PNX is not set
# CONFIG_I2C_PXA is not set
# CONFIG_I2C_QCOM_CCI is not set
# CONFIG_I2C_QUP is not set
# CONFIG_I2C_RIIC is not set
# CONFIG_I2C_RK3X is not set
# CONFIG_I2C_RZV2M is not set
# CONFIG_I2C_S3C2410 is not set
# CONFIG_I2C_SH_MOBILE is not set
CONFIG_I2C_SIMTEC=y
# CONFIG_I2C_SPRD is not set
# CONFIG_I2C_ST is not set
# CONFIG_I2C_STM32F4 is not set
# CONFIG_I2C_STM32F7 is not set
# CONFIG_I2C_SUN6I_P2WI is not set
# CONFIG_I2C_SYNQUACER is not set
# CONFIG_I2C_TEGRA is not set
# CONFIG_I2C_TEGRA_BPMP is not set
# CONFIG_I2C_UNIPHIER is not set
# CONFIG_I2C_UNIPHIER_F is not set
# CONFIG_I2C_VERSATILE is not set
# CONFIG_I2C_WMT is not set
CONFIG_I2C_XILINX=y
# CONFIG_I2C_XLP9XX is not set
# CONFIG_I2C_RCAR is not set

#
# External I2C/SMBus adapter drivers
#
CONFIG_I2C_DIOLAN_U2C=y
# CONFIG_I2C_DLN2 is not set
# CONFIG_I2C_CP2615 is not set
# CONFIG_I2C_PARPORT is not set
CONFIG_I2C_ROBOTFUZZ_OSIF=y
CONFIG_I2C_TAOS_EVM=y
CONFIG_I2C_TINY_USB=y
# CONFIG_I2C_VIPERBOARD is not set

#
# Other I2C/SMBus bus drivers
#
# CONFIG_I2C_MLXCPLD is not set
CONFIG_I2C_FSI=y
CONFIG_I2C_VIRTIO=y
# end of I2C Hardware Bus support

CONFIG_I2C_SLAVE=y
CONFIG_I2C_SLAVE_EEPROM=y
CONFIG_I2C_SLAVE_TESTUNIT=y
# CONFIG_I2C_DEBUG_CORE is not set
CONFIG_I2C_DEBUG_ALGO=y
CONFIG_I2C_DEBUG_BUS=y
# end of I2C support

CONFIG_I3C=y
# CONFIG_CDNS_I3C_MASTER is not set
CONFIG_DW_I3C_MASTER=y
CONFIG_SVC_I3C_MASTER=y
# CONFIG_MIPI_I3C_HCI is not set
# CONFIG_SPI is not set
# CONFIG_SPMI is not set
# CONFIG_HSI is not set
CONFIG_PPS=y
# CONFIG_PPS_DEBUG is not set
# CONFIG_NTP_PPS is not set

#
# PPS clients support
#
CONFIG_PPS_CLIENT_KTIMER=y
# CONFIG_PPS_CLIENT_LDISC is not set
CONFIG_PPS_CLIENT_PARPORT=y
CONFIG_PPS_CLIENT_GPIO=y

#
# PPS generators support
#

#
# PTP clock support
#
CONFIG_PTP_1588_CLOCK_OPTIONAL=y

#
# Enable PHYLIB and NETWORK_PHY_TIMESTAMPING to see the additional clocks.
#
# end of PTP clock support

CONFIG_PINCTRL=y
CONFIG_GENERIC_PINCTRL_GROUPS=y
CONFIG_PINMUX=y
CONFIG_GENERIC_PINMUX_FUNCTIONS=y
CONFIG_PINCONF=y
CONFIG_GENERIC_PINCONF=y
CONFIG_DEBUG_PINCTRL=y
# CONFIG_PINCTRL_AMD is not set
# CONFIG_PINCTRL_AT91PIO4 is not set
# CONFIG_PINCTRL_AXP209 is not set
# CONFIG_PINCTRL_BM1880 is not set
CONFIG_PINCTRL_CY8C95X0=y
# CONFIG_PINCTRL_DA850_PUPD is not set
CONFIG_PINCTRL_DA9062=y
# CONFIG_PINCTRL_EQUILIBRIUM is not set
# CONFIG_PINCTRL_INGENIC is not set
# CONFIG_PINCTRL_LPC18XX is not set
# CONFIG_PINCTRL_MAX77620 is not set
CONFIG_PINCTRL_MCP23S08_I2C=y
CONFIG_PINCTRL_MCP23S08=y
CONFIG_PINCTRL_MICROCHIP_SGPIO=y
CONFIG_PINCTRL_OCELOT=y
# CONFIG_PINCTRL_PISTACHIO is not set
CONFIG_PINCTRL_RK805=y
# CONFIG_PINCTRL_ROCKCHIP is not set
# CONFIG_PINCTRL_SINGLE is not set
CONFIG_PINCTRL_STMFX=y
# CONFIG_PINCTRL_SX150X is not set
CONFIG_PINCTRL_TB10X=y
# CONFIG_PINCTRL_OWL is not set
# CONFIG_PINCTRL_ASPEED_G4 is not set
# CONFIG_PINCTRL_ASPEED_G5 is not set
# CONFIG_PINCTRL_ASPEED_G6 is not set
# CONFIG_PINCTRL_BCM281XX is not set
# CONFIG_PINCTRL_BCM2835 is not set
# CONFIG_PINCTRL_BCM4908 is not set
# CONFIG_PINCTRL_BCM6318 is not set
# CONFIG_PINCTRL_BCM6328 is not set
# CONFIG_PINCTRL_BCM6358 is not set
# CONFIG_PINCTRL_BCM6362 is not set
# CONFIG_PINCTRL_BCM6368 is not set
# CONFIG_PINCTRL_BCM63268 is not set
# CONFIG_PINCTRL_IPROC_GPIO is not set
# CONFIG_PINCTRL_CYGNUS_MUX is not set
# CONFIG_PINCTRL_NS is not set
# CONFIG_PINCTRL_NSP_GPIO is not set
# CONFIG_PINCTRL_NS2_MUX is not set
# CONFIG_PINCTRL_NSP_MUX is not set
# CONFIG_PINCTRL_AS370 is not set
# CONFIG_PINCTRL_BERLIN_BG4CT is not set
# CONFIG_PINCTRL_LOCHNAGAR is not set
CONFIG_PINCTRL_MADERA=y
CONFIG_PINCTRL_CS47L15=y
CONFIG_PINCTRL_CS47L35=y
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
CONFIG_EINT_MTK=y
CONFIG_PINCTRL_MTK=y
# CONFIG_PINCTRL_MT2701 is not set
# CONFIG_PINCTRL_MT7623 is not set
# CONFIG_PINCTRL_MT7629 is not set
# CONFIG_PINCTRL_MT8135 is not set
# CONFIG_PINCTRL_MT8127 is not set
# CONFIG_PINCTRL_MT2712 is not set
# CONFIG_PINCTRL_MT6765 is not set
# CONFIG_PINCTRL_MT6779 is not set
# CONFIG_PINCTRL_MT6795 is not set
# CONFIG_PINCTRL_MT6797 is not set
# CONFIG_PINCTRL_MT7622 is not set
# CONFIG_PINCTRL_MT7986 is not set
# CONFIG_PINCTRL_MT8167 is not set
# CONFIG_PINCTRL_MT8173 is not set
# CONFIG_PINCTRL_MT8183 is not set
# CONFIG_PINCTRL_MT8186 is not set
# CONFIG_PINCTRL_MT8188 is not set
# CONFIG_PINCTRL_MT8192 is not set
# CONFIG_PINCTRL_MT8195 is not set
# CONFIG_PINCTRL_MT8365 is not set
# CONFIG_PINCTRL_MT8516 is not set
CONFIG_PINCTRL_MT6397=y
# end of MediaTek pinctrl drivers

CONFIG_PINCTRL_MESON=y
# CONFIG_PINCTRL_WPCM450 is not set
# CONFIG_PINCTRL_NPCM7XX is not set
# CONFIG_PINCTRL_PXA25X is not set
# CONFIG_PINCTRL_PXA27X is not set
# CONFIG_PINCTRL_MSM is not set
# CONFIG_PINCTRL_QCOM_SSBI_PMIC is not set
# CONFIG_PINCTRL_LPASS_LPI is not set

#
# Renesas pinctrl drivers
#
# CONFIG_PINCTRL_RENESAS is not set
# CONFIG_PINCTRL_PFC_EMEV2 is not set
# CONFIG_PINCTRL_PFC_R8A77995 is not set
# CONFIG_PINCTRL_PFC_R8A7794 is not set
# CONFIG_PINCTRL_PFC_R8A77990 is not set
# CONFIG_PINCTRL_PFC_R8A7779 is not set
# CONFIG_PINCTRL_PFC_R8A7790 is not set
# CONFIG_PINCTRL_PFC_R8A77950 is not set
# CONFIG_PINCTRL_PFC_R8A77951 is not set
# CONFIG_PINCTRL_PFC_R8A7778 is not set
# CONFIG_PINCTRL_PFC_R8A7793 is not set
# CONFIG_PINCTRL_PFC_R8A7791 is not set
# CONFIG_PINCTRL_PFC_R8A77965 is not set
# CONFIG_PINCTRL_PFC_R8A77960 is not set
# CONFIG_PINCTRL_PFC_R8A77961 is not set
# CONFIG_PINCTRL_PFC_R8A779F0 is not set
# CONFIG_PINCTRL_PFC_R8A7792 is not set
# CONFIG_PINCTRL_PFC_R8A77980 is not set
# CONFIG_PINCTRL_PFC_R8A77970 is not set
# CONFIG_PINCTRL_PFC_R8A779A0 is not set
# CONFIG_PINCTRL_PFC_R8A779G0 is not set
# CONFIG_PINCTRL_PFC_R8A7740 is not set
# CONFIG_PINCTRL_PFC_R8A73A4 is not set
# CONFIG_PINCTRL_RZA1 is not set
# CONFIG_PINCTRL_RZA2 is not set
# CONFIG_PINCTRL_RZG2L is not set
# CONFIG_PINCTRL_PFC_R8A77470 is not set
# CONFIG_PINCTRL_PFC_R8A7745 is not set
# CONFIG_PINCTRL_PFC_R8A7742 is not set
# CONFIG_PINCTRL_PFC_R8A7743 is not set
# CONFIG_PINCTRL_PFC_R8A7744 is not set
# CONFIG_PINCTRL_PFC_R8A774C0 is not set
# CONFIG_PINCTRL_PFC_R8A774E1 is not set
# CONFIG_PINCTRL_PFC_R8A774A1 is not set
# CONFIG_PINCTRL_PFC_R8A774B1 is not set
# CONFIG_PINCTRL_RZN1 is not set
# CONFIG_PINCTRL_RZV2M is not set
# CONFIG_PINCTRL_PFC_SH7203 is not set
# CONFIG_PINCTRL_PFC_SH7264 is not set
# CONFIG_PINCTRL_PFC_SH7269 is not set
# CONFIG_PINCTRL_PFC_SH7720 is not set
# CONFIG_PINCTRL_PFC_SH7722 is not set
# CONFIG_PINCTRL_PFC_SH7734 is not set
# CONFIG_PINCTRL_PFC_SH7757 is not set
# CONFIG_PINCTRL_PFC_SH7785 is not set
# CONFIG_PINCTRL_PFC_SH7786 is not set
# CONFIG_PINCTRL_PFC_SH73A0 is not set
# CONFIG_PINCTRL_PFC_SH7723 is not set
# CONFIG_PINCTRL_PFC_SH7724 is not set
# CONFIG_PINCTRL_PFC_SHX3 is not set
# end of Renesas pinctrl drivers

# CONFIG_PINCTRL_EXYNOS is not set
# CONFIG_PINCTRL_S3C24XX is not set
# CONFIG_PINCTRL_S3C64XX is not set
# CONFIG_PINCTRL_SPRD_SC9860 is not set
# CONFIG_PINCTRL_STARFIVE_JH7100 is not set
# CONFIG_PINCTRL_STM32F429 is not set
# CONFIG_PINCTRL_STM32F469 is not set
# CONFIG_PINCTRL_STM32F746 is not set
# CONFIG_PINCTRL_STM32F769 is not set
# CONFIG_PINCTRL_STM32H743 is not set
# CONFIG_PINCTRL_STM32MP135 is not set
# CONFIG_PINCTRL_STM32MP157 is not set
# CONFIG_PINCTRL_TI_IODELAY is not set
CONFIG_PINCTRL_UNIPHIER=y
# CONFIG_PINCTRL_UNIPHIER_LD4 is not set
# CONFIG_PINCTRL_UNIPHIER_PRO4 is not set
# CONFIG_PINCTRL_UNIPHIER_SLD8 is not set
# CONFIG_PINCTRL_UNIPHIER_PRO5 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS2 is not set
# CONFIG_PINCTRL_UNIPHIER_LD6B is not set
# CONFIG_PINCTRL_UNIPHIER_LD11 is not set
# CONFIG_PINCTRL_UNIPHIER_LD20 is not set
# CONFIG_PINCTRL_UNIPHIER_PXS3 is not set
# CONFIG_PINCTRL_UNIPHIER_NX1 is not set
# CONFIG_PINCTRL_TMPV7700 is not set
CONFIG_GPIOLIB=y
CONFIG_GPIOLIB_FASTPATH_LIMIT=512
CONFIG_OF_GPIO=y
CONFIG_GPIOLIB_IRQCHIP=y
# CONFIG_DEBUG_GPIO is not set
# CONFIG_GPIO_SYSFS is not set
CONFIG_GPIO_CDEV=y
CONFIG_GPIO_CDEV_V1=y
CONFIG_GPIO_GENERIC=y
CONFIG_GPIO_MAX730X=y

#
# Memory mapped GPIO drivers
#
CONFIG_GPIO_74XX_MMIO=y
CONFIG_GPIO_ALTERA=y
# CONFIG_GPIO_ASPEED is not set
# CONFIG_GPIO_ASPEED_SGPIO is not set
# CONFIG_GPIO_ATH79 is not set
# CONFIG_GPIO_RASPBERRYPI_EXP is not set
# CONFIG_GPIO_BCM_KONA is not set
# CONFIG_GPIO_BCM_XGS_IPROC is not set
# CONFIG_GPIO_BRCMSTB is not set
CONFIG_GPIO_CADENCE=y
# CONFIG_GPIO_CLPS711X is not set
CONFIG_GPIO_DWAPB=y
# CONFIG_GPIO_EIC_SPRD is not set
# CONFIG_GPIO_EM is not set
CONFIG_GPIO_FTGPIO010=y
CONFIG_GPIO_GENERIC_PLATFORM=y
CONFIG_GPIO_GRGPIO=y
# CONFIG_GPIO_HISI is not set
# CONFIG_GPIO_HLWD is not set
# CONFIG_GPIO_IOP is not set
CONFIG_GPIO_LOGICVC=y
# CONFIG_GPIO_LPC18XX is not set
# CONFIG_GPIO_LPC32XX is not set
CONFIG_GPIO_MB86S7X=y
# CONFIG_GPIO_MPC8XXX is not set
# CONFIG_GPIO_MT7621 is not set
# CONFIG_GPIO_MXC is not set
# CONFIG_GPIO_MXS is not set
# CONFIG_GPIO_PMIC_EIC_SPRD is not set
# CONFIG_GPIO_PXA is not set
# CONFIG_GPIO_RCAR is not set
# CONFIG_GPIO_RDA is not set
# CONFIG_GPIO_ROCKCHIP is not set
# CONFIG_GPIO_SAMA5D2_PIOBU is not set
# CONFIG_GPIO_SIFIVE is not set
CONFIG_GPIO_SIOX=y
CONFIG_GPIO_SNPS_CREG=y
# CONFIG_GPIO_SPRD is not set
# CONFIG_GPIO_STP_XWAY is not set
CONFIG_GPIO_SYSCON=y
CONFIG_GPIO_TB10X=y
# CONFIG_GPIO_TEGRA is not set
# CONFIG_GPIO_TEGRA186 is not set
# CONFIG_GPIO_TS4800 is not set
# CONFIG_GPIO_UNIPHIER is not set
# CONFIG_GPIO_VISCONTI is not set
# CONFIG_GPIO_WCD934X is not set
# CONFIG_GPIO_XGENE_SB is not set
# CONFIG_GPIO_XILINX is not set
# CONFIG_GPIO_XLP is not set
CONFIG_GPIO_AMD_FCH=y
# CONFIG_GPIO_IDT3243X is not set
# end of Memory mapped GPIO drivers

#
# I2C GPIO expanders
#
CONFIG_GPIO_ADNP=y
CONFIG_GPIO_GW_PLD=y
CONFIG_GPIO_MAX7300=y
CONFIG_GPIO_MAX732X=y
CONFIG_GPIO_MAX732X_IRQ=y
CONFIG_GPIO_PCA953X=y
CONFIG_GPIO_PCA953X_IRQ=y
# CONFIG_GPIO_PCA9570 is not set
CONFIG_GPIO_PCF857X=y
# CONFIG_GPIO_TPIC2810 is not set
# CONFIG_GPIO_TS4900 is not set
# end of I2C GPIO expanders

#
# MFD GPIO expanders
#
CONFIG_GPIO_ADP5520=y
# CONFIG_GPIO_BD9571MWV is not set
CONFIG_GPIO_DA9055=y
# CONFIG_GPIO_DLN2 is not set
CONFIG_GPIO_LP3943=y
CONFIG_GPIO_MADERA=y
# CONFIG_GPIO_MAX77620 is not set
# CONFIG_GPIO_SL28CPLD is not set
# CONFIG_GPIO_STMPE is not set
# CONFIG_GPIO_TPS65086 is not set
CONFIG_GPIO_TPS6586X=y
# CONFIG_GPIO_TPS65912 is not set
CONFIG_GPIO_TWL4030=y
# CONFIG_GPIO_TWL6040 is not set
CONFIG_GPIO_WM8350=y
# CONFIG_GPIO_WM8994 is not set
# end of MFD GPIO expanders

#
# USB GPIO expanders
#
CONFIG_GPIO_VIPERBOARD=y
# end of USB GPIO expanders

#
# Virtual GPIO drivers
#
# CONFIG_GPIO_AGGREGATOR is not set
CONFIG_GPIO_MOCKUP=y
CONFIG_GPIO_VIRTIO=y
CONFIG_GPIO_SIM=y
# end of Virtual GPIO drivers

CONFIG_W1=y

#
# 1-wire Bus Masters
#
CONFIG_W1_MASTER_DS2490=y
CONFIG_W1_MASTER_DS2482=y
# CONFIG_W1_MASTER_MXC is not set
CONFIG_W1_MASTER_DS1WM=y
CONFIG_W1_MASTER_GPIO=y
CONFIG_W1_MASTER_SGI=y
# end of 1-wire Bus Masters

#
# 1-wire Slaves
#
CONFIG_W1_SLAVE_THERM=y
CONFIG_W1_SLAVE_SMEM=y
CONFIG_W1_SLAVE_DS2405=y
CONFIG_W1_SLAVE_DS2408=y
# CONFIG_W1_SLAVE_DS2408_READBACK is not set
CONFIG_W1_SLAVE_DS2413=y
CONFIG_W1_SLAVE_DS2406=y
CONFIG_W1_SLAVE_DS2423=y
CONFIG_W1_SLAVE_DS2805=y
# CONFIG_W1_SLAVE_DS2430 is not set
CONFIG_W1_SLAVE_DS2431=y
# CONFIG_W1_SLAVE_DS2433 is not set
CONFIG_W1_SLAVE_DS2438=y
CONFIG_W1_SLAVE_DS250X=y
CONFIG_W1_SLAVE_DS2780=y
CONFIG_W1_SLAVE_DS2781=y
CONFIG_W1_SLAVE_DS28E04=y
# CONFIG_W1_SLAVE_DS28E17 is not set
# end of 1-wire Slaves

CONFIG_POWER_RESET=y
# CONFIG_POWER_RESET_BRCMKONA is not set
# CONFIG_POWER_RESET_BRCMSTB is not set
# CONFIG_POWER_RESET_GEMINI_POWEROFF is not set
CONFIG_POWER_RESET_GPIO=y
# CONFIG_POWER_RESET_GPIO_RESTART is not set
# CONFIG_POWER_RESET_OCELOT_RESET is not set
CONFIG_POWER_RESET_LTC2952=y
CONFIG_POWER_RESET_MT6323=y
CONFIG_POWER_RESET_REGULATOR=y
# CONFIG_POWER_RESET_RESTART is not set
CONFIG_POWER_RESET_TPS65086=y
# CONFIG_POWER_RESET_KEYSTONE is not set
CONFIG_POWER_RESET_SYSCON=y
CONFIG_POWER_RESET_SYSCON_POWEROFF=y
# CONFIG_POWER_RESET_RMOBILE is not set
CONFIG_REBOOT_MODE=y
CONFIG_SYSCON_REBOOT_MODE=y
# CONFIG_POWER_RESET_SC27XX is not set
CONFIG_NVMEM_REBOOT_MODE=y
CONFIG_POWER_SUPPLY=y
# CONFIG_POWER_SUPPLY_DEBUG is not set
# CONFIG_PDA_POWER is not set
# CONFIG_IP5XXX_POWER is not set
# CONFIG_WM8350_POWER is not set
CONFIG_TEST_POWER=y
CONFIG_CHARGER_ADP5061=y
CONFIG_BATTERY_ACT8945A=y
# CONFIG_BATTERY_CW2015 is not set
CONFIG_BATTERY_DS2760=y
CONFIG_BATTERY_DS2780=y
# CONFIG_BATTERY_DS2781 is not set
# CONFIG_BATTERY_DS2782 is not set
CONFIG_BATTERY_SAMSUNG_SDI=y
CONFIG_BATTERY_SBS=y
CONFIG_CHARGER_SBS=y
CONFIG_MANAGER_SBS=y
CONFIG_BATTERY_BQ27XXX=y
# CONFIG_BATTERY_BQ27XXX_I2C is not set
# CONFIG_BATTERY_BQ27XXX_HDQ is not set
CONFIG_BATTERY_MAX17040=y
# CONFIG_BATTERY_MAX17042 is not set
# CONFIG_BATTERY_MAX1721X is not set
# CONFIG_CHARGER_PCF50633 is not set
CONFIG_CHARGER_ISP1704=y
# CONFIG_CHARGER_MAX8903 is not set
CONFIG_CHARGER_LP8727=y
CONFIG_CHARGER_GPIO=y
CONFIG_CHARGER_MANAGER=y
CONFIG_CHARGER_LT3651=y
CONFIG_CHARGER_LTC4162L=y
CONFIG_CHARGER_DETECTOR_MAX14656=y
# CONFIG_CHARGER_MAX77693 is not set
CONFIG_CHARGER_MAX77976=y
CONFIG_CHARGER_MAX8997=y
CONFIG_CHARGER_MAX8998=y
CONFIG_CHARGER_MT6360=y
# CONFIG_CHARGER_QCOM_SMBB is not set
CONFIG_CHARGER_BQ2415X=y
CONFIG_CHARGER_BQ24190=y
CONFIG_CHARGER_BQ24257=y
CONFIG_CHARGER_BQ24735=y
CONFIG_CHARGER_BQ2515X=y
CONFIG_CHARGER_BQ25890=y
CONFIG_CHARGER_BQ25980=y
# CONFIG_CHARGER_BQ256XX is not set
# CONFIG_CHARGER_RK817 is not set
CONFIG_CHARGER_SMB347=y
CONFIG_CHARGER_TPS65217=y
# CONFIG_BATTERY_GAUGE_LTC2941 is not set
CONFIG_BATTERY_GOLDFISH=y
CONFIG_BATTERY_RT5033=y
CONFIG_CHARGER_RT9455=y
# CONFIG_CHARGER_SC2731 is not set
CONFIG_CHARGER_UCS1002=y
CONFIG_CHARGER_BD99954=y
CONFIG_BATTERY_UG3105=y
# CONFIG_HWMON is not set
CONFIG_THERMAL=y
CONFIG_THERMAL_STATISTICS=y
CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=0
# CONFIG_THERMAL_OF is not set
CONFIG_THERMAL_WRITABLE_TRIPS=y
CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=y
# CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
# CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
# CONFIG_THERMAL_GOV_FAIR_SHARE is not set
CONFIG_THERMAL_GOV_STEP_WISE=y
CONFIG_THERMAL_GOV_BANG_BANG=y
# CONFIG_THERMAL_GOV_USER_SPACE is not set
# CONFIG_DEVFREQ_THERMAL is not set
# CONFIG_THERMAL_EMULATION is not set
# CONFIG_THERMAL_MMIO is not set
CONFIG_HISI_THERMAL=y
# CONFIG_IMX_THERMAL is not set
# CONFIG_IMX8MM_THERMAL is not set
# CONFIG_K3_THERMAL is not set
CONFIG_MAX77620_THERMAL=y
# CONFIG_SPEAR_THERMAL is not set
# CONFIG_SUN8I_THERMAL is not set
# CONFIG_ROCKCHIP_THERMAL is not set
# CONFIG_RCAR_THERMAL is not set
# CONFIG_RCAR_GEN3_THERMAL is not set
# CONFIG_RZG2L_THERMAL is not set
# CONFIG_KIRKWOOD_THERMAL is not set
# CONFIG_DOVE_THERMAL is not set
# CONFIG_ARMADA_THERMAL is not set
CONFIG_DA9062_THERMAL=y
CONFIG_MTK_THERMAL=y

#
# Intel thermal drivers
#

#
# ACPI INT340X thermal drivers
#
# end of ACPI INT340X thermal drivers
# end of Intel thermal drivers

#
# Broadcom thermal drivers
#
# CONFIG_BRCMSTB_THERMAL is not set
# CONFIG_BCM_NS_THERMAL is not set
# CONFIG_BCM_SR_THERMAL is not set
# end of Broadcom thermal drivers

#
# Texas Instruments thermal drivers
#
# CONFIG_TI_SOC_THERMAL is not set
# end of Texas Instruments thermal drivers

#
# Samsung thermal drivers
#
# end of Samsung thermal drivers

#
# NVIDIA Tegra thermal drivers
#
# CONFIG_TEGRA_SOCTHERM is not set
# CONFIG_TEGRA_BPMP_THERMAL is not set
# CONFIG_TEGRA30_TSENSOR is not set
# end of NVIDIA Tegra thermal drivers

#
# Qualcomm thermal drivers
#
# end of Qualcomm thermal drivers

# CONFIG_SPRD_THERMAL is not set
# CONFIG_WATCHDOG is not set
CONFIG_SSB_POSSIBLE=y
CONFIG_SSB=y
CONFIG_SSB_PCMCIAHOST_POSSIBLE=y
# CONFIG_SSB_PCMCIAHOST is not set
CONFIG_SSB_DRIVER_GPIO=y
CONFIG_BCMA_POSSIBLE=y
CONFIG_BCMA=y
# CONFIG_BCMA_HOST_SOC is not set
# CONFIG_BCMA_DRIVER_MIPS is not set
# CONFIG_BCMA_DRIVER_GMAC_CMN is not set
CONFIG_BCMA_DRIVER_GPIO=y
CONFIG_BCMA_DEBUG=y

#
# Multifunction device drivers
#
CONFIG_MFD_CORE=y
CONFIG_MFD_ACT8945A=y
# CONFIG_MFD_SUN4I_GPADC is not set
# CONFIG_MFD_AS3711 is not set
# CONFIG_MFD_AS3722 is not set
CONFIG_PMIC_ADP5520=y
# CONFIG_MFD_AAT2870_CORE is not set
# CONFIG_MFD_AT91_USART is not set
# CONFIG_MFD_ATMEL_FLEXCOM is not set
# CONFIG_MFD_ATMEL_HLCDC is not set
CONFIG_MFD_BCM590XX=y
CONFIG_MFD_BD9571MWV=y
CONFIG_MFD_AXP20X=y
CONFIG_MFD_AXP20X_I2C=y
CONFIG_MFD_MADERA=y
CONFIG_MFD_MADERA_I2C=y
CONFIG_MFD_CS47L15=y
CONFIG_MFD_CS47L35=y
CONFIG_MFD_CS47L85=y
CONFIG_MFD_CS47L90=y
CONFIG_MFD_CS47L92=y
# CONFIG_MFD_ASIC3 is not set
# CONFIG_PMIC_DA903X is not set
# CONFIG_MFD_DA9052_I2C is not set
CONFIG_MFD_DA9055=y
CONFIG_MFD_DA9062=y
# CONFIG_MFD_DA9063 is not set
# CONFIG_MFD_DA9150 is not set
CONFIG_MFD_DLN2=y
# CONFIG_MFD_ENE_KB3930 is not set
# CONFIG_MFD_EXYNOS_LPASS is not set
# CONFIG_MFD_GATEWORKS_GSC is not set
CONFIG_MFD_MC13XXX=y
CONFIG_MFD_MC13XXX_I2C=y
CONFIG_MFD_MP2629=y
# CONFIG_MFD_MXS_LRADC is not set
# CONFIG_MFD_MX25_TSADC is not set
# CONFIG_MFD_HI6421_PMIC is not set
# CONFIG_MFD_HI655X_PMIC is not set
CONFIG_HTC_PASIC3=y
# CONFIG_HTC_I2CPLD is not set
# CONFIG_INTEL_SOC_PMIC is not set
# CONFIG_MFD_IQS62X is not set
# CONFIG_MFD_KEMPLD is not set
# CONFIG_MFD_88PM800 is not set
CONFIG_MFD_88PM805=y
# CONFIG_MFD_88PM860X is not set
# CONFIG_MFD_MAX14577 is not set
CONFIG_MFD_MAX77620=y
# CONFIG_MFD_MAX77650 is not set
CONFIG_MFD_MAX77686=y
CONFIG_MFD_MAX77693=y
CONFIG_MFD_MAX77714=y
# CONFIG_MFD_MAX77843 is not set
# CONFIG_MFD_MAX8907 is not set
# CONFIG_MFD_MAX8925 is not set
CONFIG_MFD_MAX8997=y
CONFIG_MFD_MAX8998=y
CONFIG_MFD_MT6360=y
CONFIG_MFD_MT6370=y
CONFIG_MFD_MT6397=y
CONFIG_MFD_MENF21BMC=y
CONFIG_MFD_VIPERBOARD=y
# CONFIG_MFD_NTXEC is not set
CONFIG_MFD_RETU=y
CONFIG_MFD_PCF50633=y
# CONFIG_PCF50633_ADC is not set
CONFIG_PCF50633_GPIO=y
# CONFIG_MFD_PM8XXX is not set
CONFIG_MFD_SY7636A=y
CONFIG_MFD_RT4831=y
# CONFIG_MFD_RT5033 is not set
# CONFIG_MFD_RT5120 is not set
# CONFIG_MFD_RC5T583 is not set
CONFIG_MFD_RK808=y
# CONFIG_MFD_RN5T618 is not set
CONFIG_MFD_SEC_CORE=y
CONFIG_MFD_SI476X_CORE=y
CONFIG_MFD_SIMPLE_MFD_I2C=y
# CONFIG_MFD_SL28CPLD is not set
CONFIG_MFD_SM501=y
CONFIG_MFD_SM501_GPIO=y
# CONFIG_MFD_SKY81452 is not set
# CONFIG_ABX500_CORE is not set
CONFIG_MFD_STMPE=y

#
# STMicroelectronics STMPE Interface Drivers
#
# CONFIG_STMPE_I2C is not set
# end of STMicroelectronics STMPE Interface Drivers

# CONFIG_MFD_SUN6I_PRCM is not set
CONFIG_MFD_SYSCON=y
CONFIG_MFD_TI_AM335X_TSCADC=y
CONFIG_MFD_LP3943=y
CONFIG_MFD_LP8788=y
CONFIG_MFD_TI_LMU=y
CONFIG_MFD_OMAP_USB_HOST=y
# CONFIG_MFD_PALMAS is not set
CONFIG_TPS6105X=y
# CONFIG_TPS65010 is not set
CONFIG_TPS6507X=y
CONFIG_MFD_TPS65086=y
# CONFIG_MFD_TPS65090 is not set
CONFIG_MFD_TPS65217=y
# CONFIG_MFD_TI_LP873X is not set
# CONFIG_MFD_TI_LP87565 is not set
# CONFIG_MFD_TPS65218 is not set
CONFIG_MFD_TPS6586X=y
# CONFIG_MFD_TPS65910 is not set
CONFIG_MFD_TPS65912=y
CONFIG_MFD_TPS65912_I2C=y
CONFIG_TWL4030_CORE=y
CONFIG_MFD_TWL4030_AUDIO=y
CONFIG_TWL6040_CORE=y
CONFIG_MFD_WL1273_CORE=y
CONFIG_MFD_LM3533=y
# CONFIG_MFD_TC3589X is not set
CONFIG_MFD_TQMX86=y
CONFIG_MFD_LOCHNAGAR=y
# CONFIG_MFD_ARIZONA_I2C is not set
CONFIG_MFD_WM8400=y
# CONFIG_MFD_WM831X_I2C is not set
CONFIG_MFD_WM8350=y
CONFIG_MFD_WM8350_I2C=y
CONFIG_MFD_WM8994=y
# CONFIG_MFD_STW481X is not set
# CONFIG_MFD_ROHM_BD718XX is not set
# CONFIG_MFD_ROHM_BD71828 is not set
CONFIG_MFD_ROHM_BD957XMUF=y
# CONFIG_MFD_STM32_LPTIMER is not set
# CONFIG_MFD_STM32_TIMERS is not set
CONFIG_MFD_STPMIC1=y
CONFIG_MFD_STMFX=y
CONFIG_MFD_WCD934X=y
# CONFIG_MFD_ATC260X_I2C is not set
# CONFIG_MFD_KHADAS_MCU is not set
# CONFIG_MFD_ACER_A500_EC is not set
CONFIG_MFD_QCOM_PM8008=y
CONFIG_RAVE_SP_CORE=y
CONFIG_MFD_RSMU_I2C=y
# end of Multifunction device drivers

CONFIG_REGULATOR=y
# CONFIG_REGULATOR_DEBUG is not set
CONFIG_REGULATOR_FIXED_VOLTAGE=y
# CONFIG_REGULATOR_VIRTUAL_CONSUMER is not set
# CONFIG_REGULATOR_USERSPACE_CONSUMER is not set
# CONFIG_REGULATOR_88PG86X is not set
# CONFIG_REGULATOR_ACT8865 is not set
# CONFIG_REGULATOR_ACT8945A is not set
CONFIG_REGULATOR_AD5398=y
# CONFIG_REGULATOR_ANATOP is not set
# CONFIG_REGULATOR_AXP20X is not set
# CONFIG_REGULATOR_BCM590XX is not set
CONFIG_REGULATOR_BD9571MWV=y
CONFIG_REGULATOR_BD957XMUF=y
CONFIG_REGULATOR_DA9055=y
CONFIG_REGULATOR_DA9062=y
CONFIG_REGULATOR_DA9121=y
# CONFIG_REGULATOR_DA9210 is not set
CONFIG_REGULATOR_DA9211=y
# CONFIG_REGULATOR_FAN53555 is not set
# CONFIG_REGULATOR_FAN53880 is not set
# CONFIG_REGULATOR_GPIO is not set
CONFIG_REGULATOR_ISL9305=y
# CONFIG_REGULATOR_ISL6271A is not set
# CONFIG_REGULATOR_LM363X is not set
CONFIG_REGULATOR_LOCHNAGAR=y
CONFIG_REGULATOR_LP3971=y
CONFIG_REGULATOR_LP3972=y
CONFIG_REGULATOR_LP872X=y
CONFIG_REGULATOR_LP8755=y
CONFIG_REGULATOR_LP8788=y
CONFIG_REGULATOR_LTC3589=y
# CONFIG_REGULATOR_LTC3676 is not set
CONFIG_REGULATOR_MAX1586=y
# CONFIG_REGULATOR_MAX77620 is not set
# CONFIG_REGULATOR_MAX77650 is not set
CONFIG_REGULATOR_MAX8649=y
CONFIG_REGULATOR_MAX8660=y
CONFIG_REGULATOR_MAX8893=y
# CONFIG_REGULATOR_MAX8907 is not set
CONFIG_REGULATOR_MAX8952=y
CONFIG_REGULATOR_MAX8997=y
CONFIG_REGULATOR_MAX8998=y
CONFIG_REGULATOR_MAX20086=y
# CONFIG_REGULATOR_MAX77686 is not set
CONFIG_REGULATOR_MAX77693=y
# CONFIG_REGULATOR_MAX77802 is not set
# CONFIG_REGULATOR_MAX77826 is not set
CONFIG_REGULATOR_MC13XXX_CORE=y
CONFIG_REGULATOR_MC13783=y
CONFIG_REGULATOR_MC13892=y
# CONFIG_REGULATOR_MCP16502 is not set
CONFIG_REGULATOR_MP5416=y
# CONFIG_REGULATOR_MP8859 is not set
CONFIG_REGULATOR_MP886X=y
# CONFIG_REGULATOR_MPQ7920 is not set
CONFIG_REGULATOR_MT6311=y
CONFIG_REGULATOR_MT6323=y
CONFIG_REGULATOR_MT6331=y
CONFIG_REGULATOR_MT6332=y
CONFIG_REGULATOR_MT6358=y
CONFIG_REGULATOR_MT6359=y
CONFIG_REGULATOR_MT6360=y
# CONFIG_REGULATOR_MT6370 is not set
# CONFIG_REGULATOR_MT6397 is not set
# CONFIG_REGULATOR_PBIAS is not set
CONFIG_REGULATOR_PCA9450=y
# CONFIG_REGULATOR_PCF50633 is not set
# CONFIG_REGULATOR_PF8X00 is not set
# CONFIG_REGULATOR_PFUZE100 is not set
CONFIG_REGULATOR_PV88060=y
# CONFIG_REGULATOR_PV88080 is not set
# CONFIG_REGULATOR_PV88090 is not set
# CONFIG_REGULATOR_PWM is not set
# CONFIG_REGULATOR_QCOM_RPMH is not set
# CONFIG_REGULATOR_QCOM_SPMI is not set
# CONFIG_REGULATOR_QCOM_USB_VBUS is not set
CONFIG_REGULATOR_RASPBERRYPI_TOUCHSCREEN_ATTINY=y
CONFIG_REGULATOR_RK808=y
CONFIG_REGULATOR_RT4801=y
CONFIG_REGULATOR_RT4831=y
CONFIG_REGULATOR_RT5190A=y
CONFIG_REGULATOR_RT5759=y
CONFIG_REGULATOR_RT6160=y
CONFIG_REGULATOR_RT6245=y
CONFIG_REGULATOR_RTQ2134=y
CONFIG_REGULATOR_RTMV20=y
CONFIG_REGULATOR_RTQ6752=y
CONFIG_REGULATOR_S2MPA01=y
CONFIG_REGULATOR_S2MPS11=y
CONFIG_REGULATOR_S5M8767=y
# CONFIG_REGULATOR_SC2731 is not set
CONFIG_REGULATOR_SLG51000=y
# CONFIG_REGULATOR_STM32_BOOSTER is not set
# CONFIG_REGULATOR_STM32_VREFBUF is not set
# CONFIG_REGULATOR_STM32_PWR is not set
CONFIG_REGULATOR_STPMIC1=y
# CONFIG_REGULATOR_TI_ABB is not set
# CONFIG_REGULATOR_STW481X_VMMC is not set
# CONFIG_REGULATOR_SY7636A is not set
CONFIG_REGULATOR_SY8106A=y
CONFIG_REGULATOR_SY8824X=y
# CONFIG_REGULATOR_SY8827N is not set
CONFIG_REGULATOR_TPS51632=y
# CONFIG_REGULATOR_TPS6105X is not set
CONFIG_REGULATOR_TPS62360=y
# CONFIG_REGULATOR_TPS6286X is not set
CONFIG_REGULATOR_TPS65023=y
CONFIG_REGULATOR_TPS6507X=y
CONFIG_REGULATOR_TPS65086=y
CONFIG_REGULATOR_TPS65132=y
CONFIG_REGULATOR_TPS65217=y
# CONFIG_REGULATOR_TPS6586X is not set
CONFIG_REGULATOR_TPS65912=y
# CONFIG_REGULATOR_TPS68470 is not set
CONFIG_REGULATOR_TWL4030=y
# CONFIG_REGULATOR_UNIPHIER is not set
# CONFIG_REGULATOR_VCTRL is not set
# CONFIG_REGULATOR_WM8350 is not set
# CONFIG_REGULATOR_WM8400 is not set
# CONFIG_REGULATOR_WM8994 is not set
# CONFIG_REGULATOR_QCOM_LABIBB is not set
CONFIG_RC_CORE=y
# CONFIG_LIRC is not set
# CONFIG_RC_MAP is not set
# CONFIG_RC_DECODERS is not set
CONFIG_RC_DEVICES=y
# CONFIG_IR_ENE is not set
# CONFIG_IR_FINTEK is not set
# CONFIG_IR_GPIO_CIR is not set
# CONFIG_IR_HIX5HD2 is not set
# CONFIG_IR_IGORPLUGUSB is not set
CONFIG_IR_IGUANA=y
CONFIG_IR_IMON=y
# CONFIG_IR_IMON_RAW is not set
# CONFIG_IR_ITE_CIR is not set
# CONFIG_IR_MCEUSB is not set
# CONFIG_IR_MESON is not set
# CONFIG_IR_MESON_TX is not set
# CONFIG_IR_MTK is not set
# CONFIG_IR_NUVOTON is not set
CONFIG_IR_REDRAT3=y
# CONFIG_IR_RX51 is not set
CONFIG_IR_SERIAL=y
# CONFIG_IR_SERIAL_TRANSMITTER is not set
CONFIG_IR_STREAMZAP=y
# CONFIG_IR_SUNXI is not set
CONFIG_IR_TOY=y
# CONFIG_IR_TTUSBIR is not set
# CONFIG_IR_WINBOND_CIR is not set
CONFIG_RC_ATI_REMOTE=y
CONFIG_RC_LOOPBACK=y
# CONFIG_RC_ST is not set
# CONFIG_RC_XBOX_DVD is not set
# CONFIG_IR_IMG is not set
CONFIG_CEC_CORE=y
CONFIG_CEC_NOTIFIER=y

#
# CEC support
#
# CONFIG_MEDIA_CEC_RC is not set
CONFIG_MEDIA_CEC_SUPPORT=y
CONFIG_CEC_CH7322=y
# CONFIG_CEC_MESON_AO is not set
# CONFIG_CEC_MESON_G12A_AO is not set
# CONFIG_CEC_GPIO is not set
# CONFIG_CEC_SAMSUNG_S5P is not set
# CONFIG_CEC_STI is not set
# CONFIG_CEC_STM32 is not set
# CONFIG_CEC_TEGRA is not set
# CONFIG_USB_PULSE8_CEC is not set
CONFIG_USB_RAINSHADOW_CEC=y
# end of CEC support

CONFIG_MEDIA_SUPPORT=y
# CONFIG_MEDIA_SUPPORT_FILTER is not set
CONFIG_MEDIA_SUBDRV_AUTOSELECT=y

#
# Media device types
#
CONFIG_MEDIA_CAMERA_SUPPORT=y
CONFIG_MEDIA_ANALOG_TV_SUPPORT=y
CONFIG_MEDIA_DIGITAL_TV_SUPPORT=y
CONFIG_MEDIA_RADIO_SUPPORT=y
CONFIG_MEDIA_SDR_SUPPORT=y
CONFIG_MEDIA_PLATFORM_SUPPORT=y
CONFIG_MEDIA_TEST_SUPPORT=y
# end of Media device types

#
# Media core support
#
# CONFIG_VIDEO_DEV is not set
# CONFIG_MEDIA_CONTROLLER is not set
CONFIG_DVB_CORE=y
# end of Media core support

#
# Digital TV options
#
CONFIG_DVB_MAX_ADAPTERS=16
CONFIG_DVB_DYNAMIC_MINORS=y
# CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
# CONFIG_DVB_ULE_DEBUG is not set
# end of Digital TV options

#
# Media drivers
#

#
# Media drivers
#
# CONFIG_MEDIA_USB_SUPPORT is not set
CONFIG_MEDIA_PLATFORM_DRIVERS=y
# CONFIG_V4L_PLATFORM_DRIVERS is not set
# CONFIG_SDR_PLATFORM_DRIVERS is not set
CONFIG_DVB_PLATFORM_DRIVERS=y

#
# Allegro DVT media platform drivers
#

#
# Amlogic media platform drivers
#

#
# Amphion drivers
#

#
# Aspeed media platform drivers
#

#
# Atmel media platform drivers
#

#
# Cadence media platform drivers
#

#
# Chips&Media media platform drivers
#

#
# Intel media platform drivers
#

#
# Marvell media platform drivers
#

#
# Mediatek media platform drivers
#

#
# NVidia media platform drivers
#

#
# NXP media platform drivers
#

#
# Qualcomm media platform drivers
#

#
# Renesas media platform drivers
#

#
# Rockchip media platform drivers
#

#
# Samsung media platform drivers
#

#
# STMicroelectronics media platform drivers
#
# CONFIG_DVB_C8SECTPFE is not set

#
# Sunxi media platform drivers
#

#
# Texas Instruments drivers
#

#
# Verisilicon media platform drivers
#

#
# VIA media platform drivers
#

#
# Xilinx media platform drivers
#
# CONFIG_DVB_TEST_DRIVERS is not set
# end of Media drivers

#
# Media ancillary drivers
#
CONFIG_MEDIA_TUNER=y

#
# Customize TV tuners
#
CONFIG_MEDIA_TUNER_FC0011=y
CONFIG_MEDIA_TUNER_FC0012=y
CONFIG_MEDIA_TUNER_FC0013=y
CONFIG_MEDIA_TUNER_IT913X=y
# CONFIG_MEDIA_TUNER_M88RS6000T is not set
CONFIG_MEDIA_TUNER_MAX2165=y
CONFIG_MEDIA_TUNER_MC44S803=y
# CONFIG_MEDIA_TUNER_MT2060 is not set
CONFIG_MEDIA_TUNER_MT2063=y
CONFIG_MEDIA_TUNER_MT20XX=y
CONFIG_MEDIA_TUNER_MT2131=y
CONFIG_MEDIA_TUNER_MT2266=y
CONFIG_MEDIA_TUNER_MXL301RF=y
# CONFIG_MEDIA_TUNER_MXL5005S is not set
CONFIG_MEDIA_TUNER_MXL5007T=y
# CONFIG_MEDIA_TUNER_QM1D1B0004 is not set
CONFIG_MEDIA_TUNER_QM1D1C0042=y
CONFIG_MEDIA_TUNER_QT1010=y
CONFIG_MEDIA_TUNER_R820T=y
CONFIG_MEDIA_TUNER_SI2157=y
CONFIG_MEDIA_TUNER_SIMPLE=y
CONFIG_MEDIA_TUNER_TDA18212=y
CONFIG_MEDIA_TUNER_TDA18218=y
# CONFIG_MEDIA_TUNER_TDA18250 is not set
CONFIG_MEDIA_TUNER_TDA18271=y
CONFIG_MEDIA_TUNER_TDA827X=y
CONFIG_MEDIA_TUNER_TDA8290=y
CONFIG_MEDIA_TUNER_TDA9887=y
CONFIG_MEDIA_TUNER_TEA5761=y
CONFIG_MEDIA_TUNER_TEA5767=y
# CONFIG_MEDIA_TUNER_TUA9001 is not set
CONFIG_MEDIA_TUNER_XC2028=y
CONFIG_MEDIA_TUNER_XC4000=y
CONFIG_MEDIA_TUNER_XC5000=y
# end of Customize TV tuners

#
# Customise DVB Frontends
#

#
# Multistandard (satellite) frontends
#
CONFIG_DVB_M88DS3103=y
# CONFIG_DVB_MXL5XX is not set
CONFIG_DVB_STB0899=y
# CONFIG_DVB_STB6100 is not set
# CONFIG_DVB_STV090x is not set
CONFIG_DVB_STV0910=y
# CONFIG_DVB_STV6110x is not set
CONFIG_DVB_STV6111=y

#
# Multistandard (cable + terrestrial) frontends
#
CONFIG_DVB_DRXK=y
# CONFIG_DVB_MN88472 is not set
# CONFIG_DVB_MN88473 is not set
# CONFIG_DVB_SI2165 is not set
CONFIG_DVB_TDA18271C2DD=y

#
# DVB-S (satellite) frontends
#
CONFIG_DVB_CX24110=y
CONFIG_DVB_CX24116=y
CONFIG_DVB_CX24117=y
# CONFIG_DVB_CX24120 is not set
CONFIG_DVB_CX24123=y
CONFIG_DVB_DS3000=y
# CONFIG_DVB_MB86A16 is not set
CONFIG_DVB_MT312=y
CONFIG_DVB_S5H1420=y
# CONFIG_DVB_SI21XX is not set
CONFIG_DVB_STB6000=y
# CONFIG_DVB_STV0288 is not set
CONFIG_DVB_STV0299=y
# CONFIG_DVB_STV0900 is not set
CONFIG_DVB_STV6110=y
CONFIG_DVB_TDA10071=y
CONFIG_DVB_TDA10086=y
# CONFIG_DVB_TDA8083 is not set
# CONFIG_DVB_TDA8261 is not set
CONFIG_DVB_TDA826X=y
# CONFIG_DVB_TS2020 is not set
CONFIG_DVB_TUA6100=y
# CONFIG_DVB_TUNER_CX24113 is not set
CONFIG_DVB_TUNER_ITD1000=y
# CONFIG_DVB_VES1X93 is not set
CONFIG_DVB_ZL10036=y
CONFIG_DVB_ZL10039=y

#
# DVB-T (terrestrial) frontends
#
CONFIG_DVB_AF9013=y
CONFIG_DVB_CX22700=y
# CONFIG_DVB_CX22702 is not set
CONFIG_DVB_CXD2820R=y
CONFIG_DVB_CXD2841ER=y
CONFIG_DVB_DIB3000MB=y
# CONFIG_DVB_DIB3000MC is not set
CONFIG_DVB_DIB7000M=y
CONFIG_DVB_DIB7000P=y
CONFIG_DVB_DIB9000=y
CONFIG_DVB_DRXD=y
CONFIG_DVB_EC100=y
CONFIG_DVB_L64781=y
CONFIG_DVB_MT352=y
CONFIG_DVB_NXT6000=y
CONFIG_DVB_RTL2830=y
# CONFIG_DVB_RTL2832 is not set
CONFIG_DVB_S5H1432=y
CONFIG_DVB_SI2168=y
CONFIG_DVB_SP887X=y
CONFIG_DVB_STV0367=y
# CONFIG_DVB_TDA10048 is not set
# CONFIG_DVB_TDA1004X is not set
CONFIG_DVB_ZD1301_DEMOD=y
CONFIG_DVB_ZL10353=y

#
# DVB-C (cable) frontends
#
# CONFIG_DVB_STV0297 is not set
# CONFIG_DVB_TDA10021 is not set
CONFIG_DVB_TDA10023=y
CONFIG_DVB_VES1820=y

#
# ATSC (North American/Korean Terrestrial/Cable DTV) frontends
#
CONFIG_DVB_AU8522=y
CONFIG_DVB_AU8522_DTV=y
CONFIG_DVB_BCM3510=y
# CONFIG_DVB_LG2160 is not set
CONFIG_DVB_LGDT3305=y
CONFIG_DVB_LGDT3306A=y
# CONFIG_DVB_LGDT330X is not set
CONFIG_DVB_MXL692=y
# CONFIG_DVB_NXT200X is not set
# CONFIG_DVB_OR51132 is not set
# CONFIG_DVB_OR51211 is not set
# CONFIG_DVB_S5H1409 is not set
# CONFIG_DVB_S5H1411 is not set

#
# ISDB-T (terrestrial) frontends
#
# CONFIG_DVB_DIB8000 is not set
# CONFIG_DVB_MB86A20S is not set
CONFIG_DVB_S921=y

#
# ISDB-S (satellite) & ISDB-T (terrestrial) frontends
#
CONFIG_DVB_MN88443X=y
# CONFIG_DVB_TC90522 is not set

#
# Digital terrestrial only tuners/PLL
#
# CONFIG_DVB_PLL is not set
CONFIG_DVB_TUNER_DIB0070=y
# CONFIG_DVB_TUNER_DIB0090 is not set

#
# SEC control devices for DVB-S
#
# CONFIG_DVB_A8293 is not set
CONFIG_DVB_AF9033=y
# CONFIG_DVB_ASCOT2E is not set
# CONFIG_DVB_ATBM8830 is not set
CONFIG_DVB_HELENE=y
# CONFIG_DVB_HORUS3A is not set
CONFIG_DVB_ISL6405=y
CONFIG_DVB_ISL6421=y
# CONFIG_DVB_ISL6423 is not set
CONFIG_DVB_IX2505V=y
# CONFIG_DVB_LGS8GL5 is not set
# CONFIG_DVB_LGS8GXX is not set
# CONFIG_DVB_LNBH25 is not set
# CONFIG_DVB_LNBH29 is not set
CONFIG_DVB_LNBP21=y
# CONFIG_DVB_LNBP22 is not set
CONFIG_DVB_M88RS2000=y
# CONFIG_DVB_TDA665x is not set
CONFIG_DVB_DRX39XYJ=y

#
# Common Interface (EN50221) controller drivers
#
# CONFIG_DVB_CXD2099 is not set
CONFIG_DVB_SP2=y
# end of Customise DVB Frontends

#
# Tools to develop new frontends
#
# CONFIG_DVB_DUMMY_FE is not set
# end of Media ancillary drivers

#
# Graphics support
#
# CONFIG_IMX_IPUV3_CORE is not set
CONFIG_DRM=y
CONFIG_DRM_MIPI_DSI=y
CONFIG_DRM_DEBUG_MM=y
CONFIG_DRM_KUNIT_TEST=y
CONFIG_DRM_KMS_HELPER=y
CONFIG_DRM_DEBUG_DP_MST_TOPOLOGY_REFS=y
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
# CONFIG_DRM_FBDEV_EMULATION is not set
CONFIG_DRM_LOAD_EDID_FIRMWARE=y
CONFIG_DRM_DP_AUX_BUS=y
CONFIG_DRM_DISPLAY_HELPER=y
CONFIG_DRM_DISPLAY_DP_HELPER=y
CONFIG_DRM_DISPLAY_HDCP_HELPER=y
CONFIG_DRM_DP_AUX_CHARDEV=y
# CONFIG_DRM_DP_CEC is not set
CONFIG_DRM_BUDDY=y
CONFIG_DRM_GEM_DMA_HELPER=y
CONFIG_DRM_GEM_SHMEM_HELPER=y
CONFIG_DRM_SCHED=y

#
# I2C encoder or helper chips
#
CONFIG_DRM_I2C_CH7006=y
CONFIG_DRM_I2C_SIL164=y
CONFIG_DRM_I2C_NXP_TDA998X=y
CONFIG_DRM_I2C_NXP_TDA9950=y
# end of I2C encoder or helper chips

#
# ARM devices
#
# CONFIG_DRM_HDLCD is not set
# CONFIG_DRM_MALI_DISPLAY is not set
# CONFIG_DRM_KOMEDA is not set
# end of ARM devices

# CONFIG_DRM_KMB_DISPLAY is not set
CONFIG_DRM_VGEM=y
CONFIG_DRM_VKMS=y
# CONFIG_DRM_EXYNOS is not set
CONFIG_DRM_UDL=y
# CONFIG_DRM_RCAR_DW_HDMI is not set
CONFIG_DRM_RCAR_USE_LVDS=y
# CONFIG_DRM_RCAR_USE_MIPI_DSI is not set
# CONFIG_DRM_SUN4I is not set
CONFIG_DRM_PANEL=y

#
# Display Panels
#
CONFIG_DRM_PANEL_ARM_VERSATILE=y
CONFIG_DRM_PANEL_ASUS_Z00T_TM5P5_NT35596=y
CONFIG_DRM_PANEL_BOE_BF060Y8M_AJ0=y
CONFIG_DRM_PANEL_BOE_HIMAX8279D=y
CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=y
CONFIG_DRM_PANEL_DSI_CM=y
CONFIG_DRM_PANEL_LVDS=y
# CONFIG_DRM_PANEL_SIMPLE is not set
CONFIG_DRM_PANEL_EDP=y
CONFIG_DRM_PANEL_EBBG_FT8719=y
# CONFIG_DRM_PANEL_ELIDA_KD35T133 is not set
CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02=y
CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D=y
CONFIG_DRM_PANEL_ILITEK_ILI9881C=y
# CONFIG_DRM_PANEL_INNOLUX_P079ZCA is not set
CONFIG_DRM_PANEL_JDI_LT070ME05000=y
# CONFIG_DRM_PANEL_JDI_R63452 is not set
CONFIG_DRM_PANEL_KHADAS_TS050=y
# CONFIG_DRM_PANEL_KINGDISPLAY_KD097D04 is not set
# CONFIG_DRM_PANEL_LEADTEK_LTK050H3146W is not set
# CONFIG_DRM_PANEL_LEADTEK_LTK500HD1829 is not set
CONFIG_DRM_PANEL_NOVATEK_NT35510=y
CONFIG_DRM_PANEL_NOVATEK_NT35560=y
CONFIG_DRM_PANEL_NOVATEK_NT35950=y
# CONFIG_DRM_PANEL_NOVATEK_NT36672A is not set
CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=y
CONFIG_DRM_PANEL_OLIMEX_LCD_OLINUXINO=y
CONFIG_DRM_PANEL_ORISETECH_OTM8009A=y
# CONFIG_DRM_PANEL_OSD_OSD101T2587_53TS is not set
# CONFIG_DRM_PANEL_PANASONIC_VVX10F034N00 is not set
CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN=y
CONFIG_DRM_PANEL_RAYDIUM_RM67191=y
CONFIG_DRM_PANEL_RAYDIUM_RM68200=y
CONFIG_DRM_PANEL_RONBO_RB070D30=y
CONFIG_DRM_PANEL_SAMSUNG_ATNA33XC20=y
CONFIG_DRM_PANEL_SAMSUNG_S6D16D0=y
# CONFIG_DRM_PANEL_SAMSUNG_S6E3HA2 is not set
# CONFIG_DRM_PANEL_SAMSUNG_S6E63J0X03 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0=y
CONFIG_DRM_PANEL_SAMSUNG_S6E63M0_DSI=y
# CONFIG_DRM_PANEL_SAMSUNG_S6E88A0_AMS452EF01 is not set
CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
CONFIG_DRM_PANEL_SAMSUNG_SOFEF00=y
CONFIG_DRM_PANEL_SEIKO_43WVF1G=y
# CONFIG_DRM_PANEL_SHARP_LQ101R1SX01 is not set
CONFIG_DRM_PANEL_SHARP_LS037V7DW01=y
CONFIG_DRM_PANEL_SHARP_LS043T1LE01=y
# CONFIG_DRM_PANEL_SHARP_LS060T1SX01 is not set
CONFIG_DRM_PANEL_SITRONIX_ST7701=y
# CONFIG_DRM_PANEL_SITRONIX_ST7703 is not set
CONFIG_DRM_PANEL_SONY_TULIP_TRULY_NT35521=y
CONFIG_DRM_PANEL_TDO_TL070WSH30=y
# CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA is not set
CONFIG_DRM_PANEL_VISIONOX_RM69299=y
CONFIG_DRM_PANEL_XINPENG_XPP055C272=y
# end of Display Panels

CONFIG_DRM_BRIDGE=y
CONFIG_DRM_PANEL_BRIDGE=y

#
# Display Interface Bridges
#
CONFIG_DRM_CDNS_DSI=y
CONFIG_DRM_CHIPONE_ICN6211=y
CONFIG_DRM_CHRONTEL_CH7033=y
# CONFIG_DRM_CROS_EC_ANX7688 is not set
# CONFIG_DRM_DISPLAY_CONNECTOR is not set
# CONFIG_DRM_FSL_LDB is not set
CONFIG_DRM_ITE_IT6505=y
CONFIG_DRM_LONTIUM_LT8912B=y
CONFIG_DRM_LONTIUM_LT9211=y
CONFIG_DRM_LONTIUM_LT9611=y
CONFIG_DRM_LONTIUM_LT9611UXC=y
CONFIG_DRM_ITE_IT66121=y
CONFIG_DRM_LVDS_CODEC=y
# CONFIG_DRM_MEGACHIPS_STDPXXXX_GE_B850V3_FW is not set
CONFIG_DRM_NWL_MIPI_DSI=y
# CONFIG_DRM_NXP_PTN3460 is not set
# CONFIG_DRM_PARADE_PS8622 is not set
# CONFIG_DRM_PARADE_PS8640 is not set
CONFIG_DRM_SIL_SII8620=y
# CONFIG_DRM_SII902X is not set
CONFIG_DRM_SII9234=y
CONFIG_DRM_SIMPLE_BRIDGE=y
# CONFIG_DRM_THINE_THC63LVD1024 is not set
CONFIG_DRM_TOSHIBA_TC358762=y
CONFIG_DRM_TOSHIBA_TC358764=y
CONFIG_DRM_TOSHIBA_TC358767=y
# CONFIG_DRM_TOSHIBA_TC358768 is not set
CONFIG_DRM_TOSHIBA_TC358775=y
# CONFIG_DRM_TI_DLPC3433 is not set
# CONFIG_DRM_TI_TFP410 is not set
CONFIG_DRM_TI_SN65DSI83=y
# CONFIG_DRM_TI_SN65DSI86 is not set
# CONFIG_DRM_TI_TPD12S015 is not set
CONFIG_DRM_ANALOGIX_ANX6345=y
CONFIG_DRM_ANALOGIX_ANX78XX=y
CONFIG_DRM_ANALOGIX_DP=y
# CONFIG_DRM_ANALOGIX_ANX7625 is not set
CONFIG_DRM_I2C_ADV7511=y
# CONFIG_DRM_I2C_ADV7511_CEC is not set
# CONFIG_DRM_CDNS_MHDP8546 is not set
# CONFIG_DRM_IMX8QM_LDB is not set
# CONFIG_DRM_IMX8QXP_LDB is not set
# CONFIG_DRM_IMX8QXP_PIXEL_COMBINER is not set
# CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI is not set
# end of Display Interface Bridges

# CONFIG_DRM_INGENIC is not set
# CONFIG_DRM_V3D is not set
CONFIG_DRM_ETNAVIV=y
# CONFIG_DRM_ETNAVIV_THERMAL is not set
# CONFIG_DRM_LOGICVC is not set
# CONFIG_DRM_MXSFB is not set
# CONFIG_DRM_IMX_LCDIF is not set
CONFIG_DRM_ARCPGU=y
# CONFIG_DRM_GM12U320 is not set
# CONFIG_DRM_SIMPLEDRM is not set
# CONFIG_DRM_PL111 is not set
# CONFIG_DRM_TVE200 is not set
# CONFIG_DRM_LIMA is not set
# CONFIG_DRM_ASPEED_GFX is not set
# CONFIG_DRM_MCDE is not set
# CONFIG_DRM_TIDSS is not set
# CONFIG_DRM_GUD is not set
# CONFIG_DRM_SSD130X is not set
# CONFIG_DRM_SPRD is not set
CONFIG_DRM_LEGACY=y
CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=y
CONFIG_DRM_NOMODESET=y
CONFIG_DRM_LIB_RANDOM=y

#
# Frame buffer Devices
#
CONFIG_FB_CMDLINE=y
CONFIG_FB_NOTIFY=y
CONFIG_FB=y
CONFIG_FIRMWARE_EDID=y
CONFIG_FB_CFB_FILLRECT=y
CONFIG_FB_CFB_COPYAREA=y
CONFIG_FB_CFB_IMAGEBLIT=y
CONFIG_FB_SYS_FILLRECT=y
CONFIG_FB_SYS_COPYAREA=y
CONFIG_FB_SYS_IMAGEBLIT=y
# CONFIG_FB_FOREIGN_ENDIAN is not set
CONFIG_FB_SYS_FOPS=y
CONFIG_FB_DEFERRED_IO=y
CONFIG_FB_BACKLIGHT=y
CONFIG_FB_MODE_HELPERS=y
# CONFIG_FB_TILEBLITTING is not set

#
# Frame buffer hardware drivers
#
# CONFIG_FB_CLPS711X is not set
# CONFIG_FB_IMX is not set
# CONFIG_FB_ARC is not set
# CONFIG_FB_CONTROL is not set
# CONFIG_FB_GBE is not set
# CONFIG_FB_PVR2 is not set
CONFIG_FB_OPENCORES=y
CONFIG_FB_S1D13XXX=y
# CONFIG_FB_ATMEL is not set
# CONFIG_FB_WM8505 is not set
# CONFIG_FB_PXA168 is not set
# CONFIG_FB_W100 is not set
# CONFIG_FB_SH_MOBILE_LCDC is not set
# CONFIG_FB_TMIO is not set
# CONFIG_FB_S3C is not set
CONFIG_FB_SM501=y
CONFIG_FB_SMSCUFX=y
CONFIG_FB_UDL=y
CONFIG_FB_IBM_GXT4500=y
# CONFIG_FB_GOLDFISH is not set
# CONFIG_FB_DA8XX is not set
CONFIG_FB_VIRTUAL=y
# CONFIG_FB_METRONOME is not set
# CONFIG_FB_BROADSHEET is not set
# CONFIG_FB_SIMPLE is not set
CONFIG_FB_SSD1307=y
# CONFIG_FB_OMAP2 is not set
# CONFIG_MMP_DISP is not set
# end of Frame buffer Devices

#
# Backlight & LCD device support
#
# CONFIG_LCD_CLASS_DEVICE is not set
CONFIG_BACKLIGHT_CLASS_DEVICE=y
# CONFIG_BACKLIGHT_KTD253 is not set
CONFIG_BACKLIGHT_LM3533=y
# CONFIG_BACKLIGHT_OMAP1 is not set
CONFIG_BACKLIGHT_PWM=y
CONFIG_BACKLIGHT_MT6370=y
# CONFIG_BACKLIGHT_QCOM_WLED is not set
# CONFIG_BACKLIGHT_RT4831 is not set
# CONFIG_BACKLIGHT_ADP5520 is not set
CONFIG_BACKLIGHT_ADP8860=y
# CONFIG_BACKLIGHT_ADP8870 is not set
# CONFIG_BACKLIGHT_PCF50633 is not set
CONFIG_BACKLIGHT_LM3630A=y
CONFIG_BACKLIGHT_LM3639=y
CONFIG_BACKLIGHT_LP855X=y
# CONFIG_BACKLIGHT_LP8788 is not set
# CONFIG_BACKLIGHT_PANDORA is not set
# CONFIG_BACKLIGHT_TPS65217 is not set
# CONFIG_BACKLIGHT_GPIO is not set
# CONFIG_BACKLIGHT_LV5207LP is not set
CONFIG_BACKLIGHT_BD6107=y
# CONFIG_BACKLIGHT_ARCXCNN is not set
CONFIG_BACKLIGHT_RAVE_SP=y
# CONFIG_BACKLIGHT_LED is not set
# end of Backlight & LCD device support

CONFIG_VIDEOMODE_HELPERS=y
CONFIG_HDMI=y
CONFIG_LOGO=y
# CONFIG_LOGO_LINUX_MONO is not set
# CONFIG_LOGO_LINUX_VGA16 is not set
# CONFIG_LOGO_LINUX_CLUT224 is not set
# end of Graphics support

CONFIG_SOUND=y
CONFIG_SND=y
CONFIG_SND_TIMER=y
CONFIG_SND_PCM=y
CONFIG_SND_HWDEP=y
CONFIG_SND_SEQ_DEVICE=y
CONFIG_SND_RAWMIDI=y
CONFIG_SND_JACK=y
CONFIG_SND_JACK_INPUT_DEV=y
# CONFIG_SND_OSSEMUL is not set
CONFIG_SND_PCM_TIMER=y
CONFIG_SND_DYNAMIC_MINORS=y
CONFIG_SND_MAX_CARDS=32
CONFIG_SND_SUPPORT_OLD_API=y
CONFIG_SND_VERBOSE_PRINTK=y
# CONFIG_SND_CTL_FAST_LOOKUP is not set
CONFIG_SND_DEBUG=y
CONFIG_SND_DEBUG_VERBOSE=y
# CONFIG_SND_CTL_INPUT_VALIDATION is not set
CONFIG_SND_CTL_DEBUG=y
CONFIG_SND_JACK_INJECTION_DEBUG=y
CONFIG_SND_VMASTER=y
CONFIG_SND_SEQUENCER=y
CONFIG_SND_SEQ_DUMMY=y
CONFIG_SND_SEQ_MIDI_EVENT=y
CONFIG_SND_SEQ_MIDI=y
CONFIG_SND_SEQ_VIRMIDI=y
CONFIG_SND_DRIVERS=y
# CONFIG_SND_DUMMY is not set
# CONFIG_SND_ALOOP is not set
CONFIG_SND_VIRMIDI=y
CONFIG_SND_MTPAV=y
# CONFIG_SND_MTS64 is not set
CONFIG_SND_SERIAL_U16550=y
CONFIG_SND_SERIAL_GENERIC=y
# CONFIG_SND_MPU401 is not set
CONFIG_SND_PORTMAN2X4=y

#
# HD-Audio
#
# end of HD-Audio

CONFIG_SND_HDA_PREALLOC_SIZE=64
CONFIG_SND_USB=y
# CONFIG_SND_USB_AUDIO is not set
CONFIG_SND_USB_UA101=y
CONFIG_SND_USB_CAIAQ=y
# CONFIG_SND_USB_CAIAQ_INPUT is not set
# CONFIG_SND_USB_US122L is not set
CONFIG_SND_USB_6FIRE=y
CONFIG_SND_USB_HIFACE=y
# CONFIG_SND_BCD2000 is not set
CONFIG_SND_USB_LINE6=y
CONFIG_SND_USB_POD=y
# CONFIG_SND_USB_PODHD is not set
CONFIG_SND_USB_TONEPORT=y
# CONFIG_SND_USB_VARIAX is not set
# CONFIG_SND_PCMCIA is not set
# CONFIG_SND_SOC is not set
CONFIG_SND_VIRTIO=y
CONFIG_HID_SUPPORT=y
CONFIG_HID=y
CONFIG_HID_BATTERY_STRENGTH=y
CONFIG_HIDRAW=y
CONFIG_UHID=y
# CONFIG_HID_GENERIC is not set

#
# Special HID drivers
#
CONFIG_HID_A4TECH=y
CONFIG_HID_ACRUX=y
CONFIG_HID_ACRUX_FF=y
# CONFIG_HID_APPLE is not set
# CONFIG_HID_AUREAL is not set
CONFIG_HID_BELKIN=y
CONFIG_HID_CHERRY=y
CONFIG_HID_COUGAR=y
CONFIG_HID_MACALLY=y
CONFIG_HID_CMEDIA=y
CONFIG_HID_CYPRESS=y
CONFIG_HID_DRAGONRISE=y
# CONFIG_DRAGONRISE_FF is not set
CONFIG_HID_EMS_FF=y
CONFIG_HID_ELECOM=y
CONFIG_HID_EZKEY=y
# CONFIG_HID_GEMBIRD is not set
CONFIG_HID_GFRM=y
CONFIG_HID_GLORIOUS=y
# CONFIG_HID_VIVALDI is not set
# CONFIG_HID_KEYTOUCH is not set
# CONFIG_HID_KYE is not set
# CONFIG_HID_WALTOP is not set
CONFIG_HID_VIEWSONIC=y
# CONFIG_HID_VRC2 is not set
# CONFIG_HID_XIAOMI is not set
CONFIG_HID_GYRATION=y
# CONFIG_HID_ICADE is not set
CONFIG_HID_ITE=y
CONFIG_HID_JABRA=y
# CONFIG_HID_TWINHAN is not set
CONFIG_HID_KENSINGTON=y
# CONFIG_HID_LCPOWER is not set
# CONFIG_HID_LED is not set
CONFIG_HID_LENOVO=y
CONFIG_HID_MAGICMOUSE=y
CONFIG_HID_MALTRON=y
# CONFIG_HID_MAYFLASH is not set
CONFIG_HID_REDRAGON=y
CONFIG_HID_MICROSOFT=y
CONFIG_HID_MONTEREY=y
CONFIG_HID_MULTITOUCH=y
CONFIG_HID_NINTENDO=y
# CONFIG_NINTENDO_FF is not set
# CONFIG_HID_NTI is not set
# CONFIG_HID_ORTEK is not set
CONFIG_HID_PANTHERLORD=y
CONFIG_PANTHERLORD_FF=y
CONFIG_HID_PETALYNX=y
CONFIG_HID_PICOLCD=y
# CONFIG_HID_PICOLCD_FB is not set
CONFIG_HID_PICOLCD_BACKLIGHT=y
# CONFIG_HID_PICOLCD_LEDS is not set
CONFIG_HID_PICOLCD_CIR=y
CONFIG_HID_PLANTRONICS=y
CONFIG_HID_PLAYSTATION=y
# CONFIG_PLAYSTATION_FF is not set
# CONFIG_HID_PXRC is not set
CONFIG_HID_RAZER=y
CONFIG_HID_PRIMAX=y
# CONFIG_HID_SAITEK is not set
CONFIG_HID_SEMITEK=y
# CONFIG_HID_SPEEDLINK is not set
CONFIG_HID_STEAM=y
# CONFIG_HID_STEELSERIES is not set
CONFIG_HID_SUNPLUS=y
CONFIG_HID_RMI=y
# CONFIG_HID_GREENASIA is not set
CONFIG_HID_SMARTJOYPLUS=y
CONFIG_SMARTJOYPLUS_FF=y
CONFIG_HID_TIVO=y
CONFIG_HID_TOPSEED=y
CONFIG_HID_TOPRE=y
# CONFIG_HID_THINGM is not set
CONFIG_HID_UDRAW_PS3=y
# CONFIG_HID_WIIMOTE is not set
CONFIG_HID_XINMO=y
CONFIG_HID_ZEROPLUS=y
# CONFIG_ZEROPLUS_FF is not set
CONFIG_HID_ZYDACRON=y
# CONFIG_HID_SENSOR_HUB is not set
CONFIG_HID_ALPS=y
# end of Special HID drivers

#
# HID-BPF support
#
CONFIG_HID_BPF=y
# end of HID-BPF support

#
# USB HID support
#
# CONFIG_USB_HID is not set
CONFIG_HID_PID=y

#
# USB HID Boot Protocol drivers
#
CONFIG_USB_KBD=y
CONFIG_USB_MOUSE=y
# end of USB HID Boot Protocol drivers
# end of USB HID support

#
# I2C HID support
#
# CONFIG_I2C_HID_OF is not set
# CONFIG_I2C_HID_OF_ELAN is not set
# CONFIG_I2C_HID_OF_GOODIX is not set
# end of I2C HID support

CONFIG_USB_OHCI_LITTLE_ENDIAN=y
CONFIG_USB_SUPPORT=y
CONFIG_USB_COMMON=y
# CONFIG_USB_LED_TRIG is not set
CONFIG_USB_ULPI_BUS=y
# CONFIG_USB_CONN_GPIO is not set
CONFIG_USB_ARCH_HAS_HCD=y
CONFIG_USB=y
# CONFIG_USB_ANNOUNCE_NEW_DEVICES is not set

#
# Miscellaneous USB options
#
CONFIG_USB_DEFAULT_PERSIST=y
CONFIG_USB_FEW_INIT_RETRIES=y
CONFIG_USB_DYNAMIC_MINORS=y
CONFIG_USB_OTG=y
# CONFIG_USB_OTG_PRODUCTLIST is not set
CONFIG_USB_OTG_DISABLE_EXTERNAL_HUB=y
# CONFIG_USB_OTG_FSM is not set
CONFIG_USB_LEDS_TRIGGER_USBPORT=y
CONFIG_USB_AUTOSUSPEND_DELAY=2
# CONFIG_USB_MON is not set

#
# USB Host Controller Drivers
#
CONFIG_USB_C67X00_HCD=y
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_XHCI_DBGCAP=y
# CONFIG_USB_XHCI_PCI_RENESAS is not set
CONFIG_USB_XHCI_PLATFORM=y
# CONFIG_USB_XHCI_HISTB is not set
# CONFIG_USB_XHCI_MTK is not set
# CONFIG_USB_XHCI_MVEBU is not set
# CONFIG_USB_XHCI_RCAR is not set
# CONFIG_USB_BRCMSTB is not set
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_EHCI_ROOT_HUB_TT=y
# CONFIG_USB_EHCI_TT_NEWSCHED is not set
# CONFIG_USB_EHCI_FSL is not set
# CONFIG_USB_EHCI_HCD_NPCM7XX is not set
CONFIG_USB_EHCI_HCD_OMAP=y
# CONFIG_USB_EHCI_HCD_ORION is not set
# CONFIG_USB_EHCI_HCD_SPEAR is not set
# CONFIG_USB_EHCI_HCD_STI is not set
# CONFIG_USB_EHCI_HCD_AT91 is not set
# CONFIG_USB_EHCI_SH is not set
# CONFIG_USB_EHCI_EXYNOS is not set
# CONFIG_USB_EHCI_MV is not set
# CONFIG_USB_CNS3XXX_EHCI is not set
CONFIG_USB_EHCI_HCD_PLATFORM=y
CONFIG_USB_OXU210HP_HCD=y
CONFIG_USB_ISP116X_HCD=y
# CONFIG_USB_ISP1362_HCD is not set
# CONFIG_USB_FOTG210_HCD is not set
CONFIG_USB_OHCI_HCD=y
# CONFIG_USB_OHCI_HCD_SPEAR is not set
# CONFIG_USB_OHCI_HCD_STI is not set
# CONFIG_USB_OHCI_HCD_S3C2410 is not set
CONFIG_USB_OHCI_HCD_LPC32XX=y
# CONFIG_USB_OHCI_HCD_AT91 is not set
# CONFIG_USB_OHCI_HCD_OMAP3 is not set
# CONFIG_USB_OHCI_HCD_DAVINCI is not set
CONFIG_USB_OHCI_HCD_SSB=y
# CONFIG_USB_OHCI_SH is not set
# CONFIG_USB_OHCI_EXYNOS is not set
# CONFIG_USB_CNS3XXX_OHCI is not set
CONFIG_USB_OHCI_HCD_PLATFORM=y
CONFIG_USB_U132_HCD=y
CONFIG_USB_SL811_HCD=y
CONFIG_USB_SL811_HCD_ISO=y
# CONFIG_USB_SL811_CS is not set
CONFIG_USB_R8A66597_HCD=y
CONFIG_USB_HCD_BCMA=y
CONFIG_USB_HCD_SSB=y
CONFIG_USB_HCD_TEST_MODE=y
# CONFIG_USB_RENESAS_USBHS is not set

#
# USB Device Class drivers
#
CONFIG_USB_ACM=y
CONFIG_USB_PRINTER=y
CONFIG_USB_WDM=y
CONFIG_USB_TMC=y

#
# NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
#

#
# also be needed; see USB_STORAGE Help for more info
#

#
# USB Imaging devices
#
CONFIG_USB_MDC800=y
# CONFIG_USB_CDNS_SUPPORT is not set
# CONFIG_USB_MTU3 is not set
# CONFIG_USB_MUSB_HDRC is not set
# CONFIG_USB_DWC3 is not set
CONFIG_USB_DWC2=y
# CONFIG_USB_DWC2_HOST is not set

#
# Gadget/Dual-role mode requires USB Gadget support to be enabled
#
CONFIG_USB_DWC2_PERIPHERAL=y
# CONFIG_USB_DWC2_DUAL_ROLE is not set
# CONFIG_USB_DWC2_DEBUG is not set
CONFIG_USB_DWC2_TRACK_MISSED_SOFS=y
CONFIG_USB_CHIPIDEA=y
CONFIG_USB_CHIPIDEA_UDC=y
# CONFIG_USB_CHIPIDEA_HOST is not set
CONFIG_USB_CHIPIDEA_MSM=y
CONFIG_USB_CHIPIDEA_IMX=y
CONFIG_USB_CHIPIDEA_GENERIC=y
# CONFIG_USB_CHIPIDEA_TEGRA is not set
# CONFIG_USB_ISP1760 is not set

#
# USB port drivers
#
CONFIG_USB_USS720=y
CONFIG_USB_SERIAL=y
CONFIG_USB_SERIAL_CONSOLE=y
# CONFIG_USB_SERIAL_GENERIC is not set
CONFIG_USB_SERIAL_SIMPLE=y
CONFIG_USB_SERIAL_AIRCABLE=y
# CONFIG_USB_SERIAL_ARK3116 is not set
CONFIG_USB_SERIAL_BELKIN=y
CONFIG_USB_SERIAL_CH341=y
# CONFIG_USB_SERIAL_WHITEHEAT is not set
# CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
# CONFIG_USB_SERIAL_CP210X is not set
# CONFIG_USB_SERIAL_CYPRESS_M8 is not set
# CONFIG_USB_SERIAL_EMPEG is not set
# CONFIG_USB_SERIAL_FTDI_SIO is not set
CONFIG_USB_SERIAL_VISOR=y
# CONFIG_USB_SERIAL_IPAQ is not set
CONFIG_USB_SERIAL_IR=y
# CONFIG_USB_SERIAL_EDGEPORT is not set
CONFIG_USB_SERIAL_EDGEPORT_TI=y
# CONFIG_USB_SERIAL_F81232 is not set
CONFIG_USB_SERIAL_F8153X=y
# CONFIG_USB_SERIAL_GARMIN is not set
CONFIG_USB_SERIAL_IPW=y
# CONFIG_USB_SERIAL_IUU is not set
CONFIG_USB_SERIAL_KEYSPAN_PDA=y
CONFIG_USB_SERIAL_KEYSPAN=y
CONFIG_USB_SERIAL_KLSI=y
CONFIG_USB_SERIAL_KOBIL_SCT=y
CONFIG_USB_SERIAL_MCT_U232=y
CONFIG_USB_SERIAL_METRO=y
CONFIG_USB_SERIAL_MOS7720=y
# CONFIG_USB_SERIAL_MOS7715_PARPORT is not set
CONFIG_USB_SERIAL_MOS7840=y
CONFIG_USB_SERIAL_MXUPORT=y
# CONFIG_USB_SERIAL_NAVMAN is not set
CONFIG_USB_SERIAL_PL2303=y
CONFIG_USB_SERIAL_OTI6858=y
CONFIG_USB_SERIAL_QCAUX=y
CONFIG_USB_SERIAL_QUALCOMM=y
CONFIG_USB_SERIAL_SPCP8X5=y
CONFIG_USB_SERIAL_SAFE=y
CONFIG_USB_SERIAL_SAFE_PADDED=y
# CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
CONFIG_USB_SERIAL_SYMBOL=y
CONFIG_USB_SERIAL_TI=y
# CONFIG_USB_SERIAL_CYBERJACK is not set
CONFIG_USB_SERIAL_WWAN=y
CONFIG_USB_SERIAL_OPTION=y
# CONFIG_USB_SERIAL_OMNINET is not set
# CONFIG_USB_SERIAL_OPTICON is not set
CONFIG_USB_SERIAL_XSENS_MT=y
CONFIG_USB_SERIAL_WISHBONE=y
CONFIG_USB_SERIAL_SSU100=y
CONFIG_USB_SERIAL_QT2=y
# CONFIG_USB_SERIAL_UPD78F0730 is not set
# CONFIG_USB_SERIAL_XR is not set
CONFIG_USB_SERIAL_DEBUG=y

#
# USB Miscellaneous drivers
#
CONFIG_USB_EMI62=y
# CONFIG_USB_EMI26 is not set
CONFIG_USB_ADUTUX=y
# CONFIG_USB_SEVSEG is not set
CONFIG_USB_LEGOTOWER=y
CONFIG_USB_LCD=y
CONFIG_USB_CYPRESS_CY7C63=y
CONFIG_USB_CYTHERM=y
CONFIG_USB_IDMOUSE=y
CONFIG_USB_FTDI_ELAN=y
CONFIG_USB_APPLEDISPLAY=y
# CONFIG_USB_QCOM_EUD is not set
CONFIG_APPLE_MFI_FASTCHARGE=y
CONFIG_USB_SISUSBVGA=y
CONFIG_USB_LD=y
CONFIG_USB_TRANCEVIBRATOR=y
CONFIG_USB_IOWARRIOR=y
CONFIG_USB_TEST=y
# CONFIG_USB_EHSET_TEST_FIXTURE is not set
CONFIG_USB_ISIGHTFW=y
CONFIG_USB_YUREX=y
CONFIG_USB_EZUSB_FX2=y
# CONFIG_USB_HUB_USB251XB is not set
CONFIG_USB_HSIC_USB3503=y
CONFIG_USB_HSIC_USB4604=y
# CONFIG_USB_LINK_LAYER_TEST is not set
CONFIG_USB_CHAOSKEY=y
# CONFIG_BRCM_USB_PINMAP is not set
CONFIG_USB_ONBOARD_HUB=y

#
# USB Physical Layer drivers
#
CONFIG_USB_PHY=y
# CONFIG_KEYSTONE_USB_PHY is not set
CONFIG_NOP_USB_XCEIV=y
# CONFIG_AM335X_PHY_USB is not set
CONFIG_USB_GPIO_VBUS=y
CONFIG_TAHVO_USB=y
CONFIG_TAHVO_USB_HOST_BY_DEFAULT=y
CONFIG_USB_ISP1301=y
# CONFIG_USB_TEGRA_PHY is not set
# CONFIG_USB_ULPI is not set
# CONFIG_JZ4770_PHY is not set
# end of USB Physical Layer drivers

CONFIG_USB_GADGET=y
# CONFIG_USB_GADGET_DEBUG is not set
CONFIG_USB_GADGET_DEBUG_FS=y
CONFIG_USB_GADGET_VBUS_DRAW=2
CONFIG_USB_GADGET_STORAGE_NUM_BUFFERS=2
CONFIG_U_SERIAL_CONSOLE=y

#
# USB Peripheral Controller
#
# CONFIG_USB_LPC32XX is not set
# CONFIG_USB_FUSB300 is not set
# CONFIG_USB_FOTG210_UDC is not set
# CONFIG_USB_GR_UDC is not set
# CONFIG_USB_R8A66597 is not set
# CONFIG_USB_RENESAS_USB3 is not set
CONFIG_USB_PXA27X=y
# CONFIG_USB_MV_UDC is not set
CONFIG_USB_MV_U3D=y
CONFIG_USB_SNP_CORE=y
CONFIG_USB_SNP_UDC_PLAT=y
# CONFIG_USB_M66592 is not set
CONFIG_USB_BDC_UDC=y
CONFIG_USB_NET2272=y
CONFIG_USB_NET2272_DMA=y
# CONFIG_USB_GADGET_XILINX is not set
# CONFIG_USB_ASPEED_UDC is not set
# CONFIG_USB_ASPEED_VHUB is not set
CONFIG_USB_DUMMY_HCD=y
# end of USB Peripheral Controller

CONFIG_USB_LIBCOMPOSITE=y
CONFIG_USB_F_ACM=y
CONFIG_USB_F_SS_LB=y
CONFIG_USB_U_SERIAL=y
CONFIG_USB_U_AUDIO=y
CONFIG_USB_F_SERIAL=y
CONFIG_USB_F_OBEX=y
CONFIG_USB_F_FS=y
CONFIG_USB_F_UAC1=y
CONFIG_USB_F_UAC1_LEGACY=y
CONFIG_USB_F_UAC2=y
CONFIG_USB_F_MIDI=y
CONFIG_USB_F_HID=y
CONFIG_USB_F_PRINTER=y
CONFIG_USB_CONFIGFS=y
# CONFIG_USB_CONFIGFS_SERIAL is not set
# CONFIG_USB_CONFIGFS_ACM is not set
CONFIG_USB_CONFIGFS_OBEX=y
# CONFIG_USB_CONFIGFS_F_LB_SS is not set
CONFIG_USB_CONFIGFS_F_FS=y
CONFIG_USB_CONFIGFS_F_UAC1=y
CONFIG_USB_CONFIGFS_F_UAC1_LEGACY=y
CONFIG_USB_CONFIGFS_F_UAC2=y
CONFIG_USB_CONFIGFS_F_MIDI=y
CONFIG_USB_CONFIGFS_F_HID=y
# CONFIG_USB_CONFIGFS_F_PRINTER is not set

#
# USB Gadget precomposed configurations
#
CONFIG_USB_ZERO=y
CONFIG_USB_ZERO_HNPTEST=y
CONFIG_USB_AUDIO=y
# CONFIG_GADGET_UAC1 is not set
CONFIG_USB_GADGETFS=y
CONFIG_USB_FUNCTIONFS=y
CONFIG_USB_FUNCTIONFS_GENERIC=y
CONFIG_USB_G_SERIAL=y
CONFIG_USB_MIDI_GADGET=y
CONFIG_USB_G_PRINTER=y
# CONFIG_USB_G_HID is not set
CONFIG_USB_G_DBGP=y
CONFIG_USB_G_DBGP_PRINTK=y
# CONFIG_USB_G_DBGP_SERIAL is not set
# CONFIG_USB_RAW_GADGET is not set
# end of USB Gadget precomposed configurations

CONFIG_TYPEC=y
# CONFIG_TYPEC_TCPM is not set
# CONFIG_TYPEC_UCSI is not set
# CONFIG_TYPEC_TPS6598X is not set
CONFIG_TYPEC_ANX7411=y
CONFIG_TYPEC_RT1719=y
# CONFIG_TYPEC_HD3SS3220 is not set
# CONFIG_TYPEC_STUSB160X is not set
# CONFIG_TYPEC_QCOM_PMIC is not set
# CONFIG_TYPEC_WUSB3801 is not set

#
# USB Type-C Multiplexer/DeMultiplexer Switch support
#
CONFIG_TYPEC_MUX_FSA4480=y
CONFIG_TYPEC_MUX_PI3USB30532=y
# end of USB Type-C Multiplexer/DeMultiplexer Switch support

#
# USB Type-C Alternate Mode drivers
#
CONFIG_TYPEC_DP_ALTMODE=y
CONFIG_TYPEC_NVIDIA_ALTMODE=y
# end of USB Type-C Alternate Mode drivers

CONFIG_USB_ROLE_SWITCH=y
# CONFIG_MMC is not set
# CONFIG_MEMSTICK is not set
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_LEDS_CLASS_FLASH=y
CONFIG_LEDS_CLASS_MULTICOLOR=y
# CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set

#
# LED drivers
#
CONFIG_LEDS_AN30259A=y
# CONFIG_LEDS_ARIEL is not set
# CONFIG_LEDS_AW2013 is not set
CONFIG_LEDS_BCM6328=y
# CONFIG_LEDS_BCM6358 is not set
# CONFIG_LEDS_TURRIS_OMNIA is not set
# CONFIG_LEDS_LM3530 is not set
CONFIG_LEDS_LM3532=y
CONFIG_LEDS_LM3533=y
CONFIG_LEDS_LM3642=y
CONFIG_LEDS_LM3692X=y
CONFIG_LEDS_MT6323=y
# CONFIG_LEDS_S3C24XX is not set
# CONFIG_LEDS_COBALT_QUBE is not set
# CONFIG_LEDS_COBALT_RAQ is not set
CONFIG_LEDS_PCA9532=y
# CONFIG_LEDS_PCA9532_GPIO is not set
CONFIG_LEDS_GPIO=y
# CONFIG_LEDS_LP3944 is not set
CONFIG_LEDS_LP3952=y
CONFIG_LEDS_LP50XX=y
CONFIG_LEDS_LP55XX_COMMON=y
CONFIG_LEDS_LP5521=y
CONFIG_LEDS_LP5523=y
CONFIG_LEDS_LP5562=y
CONFIG_LEDS_LP8501=y
CONFIG_LEDS_LP8788=y
# CONFIG_LEDS_LP8860 is not set
CONFIG_LEDS_PCA955X=y
CONFIG_LEDS_PCA955X_GPIO=y
CONFIG_LEDS_PCA963X=y
CONFIG_LEDS_WM8350=y
CONFIG_LEDS_PWM=y
CONFIG_LEDS_REGULATOR=y
# CONFIG_LEDS_BD2802 is not set
CONFIG_LEDS_LT3593=y
# CONFIG_LEDS_ADP5520 is not set
# CONFIG_LEDS_MC13783 is not set
CONFIG_LEDS_NS2=y
CONFIG_LEDS_NETXBIG=y
CONFIG_LEDS_TCA6507=y
# CONFIG_LEDS_TLC591XX is not set
CONFIG_LEDS_MAX8997=y
CONFIG_LEDS_LM355x=y
# CONFIG_LEDS_OT200 is not set
# CONFIG_LEDS_MENF21BMC is not set
CONFIG_LEDS_IS31FL319X=y
CONFIG_LEDS_IS31FL32XX=y

#
# LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_THINGM)
#
CONFIG_LEDS_BLINKM=y
# CONFIG_LEDS_SYSCON is not set
# CONFIG_LEDS_MLXREG is not set
CONFIG_LEDS_USER=y
CONFIG_LEDS_TI_LMU_COMMON=y
CONFIG_LEDS_LM3697=y
CONFIG_LEDS_LM36274=y
CONFIG_LEDS_TPS6105X=y
# CONFIG_LEDS_IP30 is not set
# CONFIG_LEDS_BCM63138 is not set
# CONFIG_LEDS_LGM is not set

#
# Flash and Torch LED drivers
#
# CONFIG_LEDS_AAT1290 is not set
CONFIG_LEDS_AS3645A=y
# CONFIG_LEDS_KTD2692 is not set
CONFIG_LEDS_LM3601X=y
# CONFIG_LEDS_MAX77693 is not set
# CONFIG_LEDS_MT6360 is not set
# CONFIG_LEDS_RT4505 is not set
CONFIG_LEDS_RT8515=y
CONFIG_LEDS_SGM3140=y

#
# RGB LED drivers
#
# CONFIG_LEDS_PWM_MULTICOLOR is not set

#
# LED Triggers
#
CONFIG_LEDS_TRIGGERS=y
CONFIG_LEDS_TRIGGER_TIMER=y
CONFIG_LEDS_TRIGGER_ONESHOT=y
CONFIG_LEDS_TRIGGER_HEARTBEAT=y
# CONFIG_LEDS_TRIGGER_BACKLIGHT is not set
CONFIG_LEDS_TRIGGER_CPU=y
CONFIG_LEDS_TRIGGER_ACTIVITY=y
# CONFIG_LEDS_TRIGGER_GPIO is not set
CONFIG_LEDS_TRIGGER_DEFAULT_ON=y

#
# iptables trigger is under Netfilter config (LED target)
#
CONFIG_LEDS_TRIGGER_TRANSIENT=y
# CONFIG_LEDS_TRIGGER_CAMERA is not set
CONFIG_LEDS_TRIGGER_PANIC=y
CONFIG_LEDS_TRIGGER_PATTERN=y
CONFIG_LEDS_TRIGGER_AUDIO=y
CONFIG_LEDS_TRIGGER_TTY=y

#
# Simple LED drivers
#
# CONFIG_ACCESSIBILITY is not set
# CONFIG_RTC_CLASS is not set
CONFIG_DMADEVICES=y
# CONFIG_DMADEVICES_DEBUG is not set

#
# DMA Devices
#
CONFIG_DMA_ENGINE=y
CONFIG_DMA_VIRTUAL_CHANNELS=y
CONFIG_DMA_OF=y
CONFIG_ALTERA_MSGDMA=y
# CONFIG_APPLE_ADMAC is not set
# CONFIG_AXI_DMAC is not set
# CONFIG_DMA_JZ4780 is not set
# CONFIG_DMA_SA11X0 is not set
# CONFIG_DMA_SUN6I is not set
CONFIG_DW_AXI_DMAC=y
# CONFIG_EP93XX_DMA is not set
CONFIG_FSL_EDMA=y
# CONFIG_IMG_MDC_DMA is not set
CONFIG_INTEL_IDMA64=y
# CONFIG_INTEL_IOP_ADMA is not set
# CONFIG_K3_DMA is not set
# CONFIG_MCF_EDMA is not set
# CONFIG_MILBEAUT_HDMAC is not set
# CONFIG_MILBEAUT_XDMAC is not set
# CONFIG_MMP_PDMA is not set
# CONFIG_MMP_TDMA is not set
# CONFIG_MV_XOR is not set
# CONFIG_MXS_DMA is not set
# CONFIG_NBPFAXI_DMA is not set
# CONFIG_STM32_DMA is not set
# CONFIG_STM32_DMAMUX is not set
# CONFIG_STM32_MDMA is not set
# CONFIG_SPRD_DMA is not set
# CONFIG_S3C24XX_DMAC is not set
# CONFIG_TEGRA20_APB_DMA is not set
# CONFIG_TEGRA210_ADMA is not set
# CONFIG_TIMB_DMA is not set
# CONFIG_UNIPHIER_MDMAC is not set
# CONFIG_UNIPHIER_XDMAC is not set
# CONFIG_XGENE_DMA is not set
# CONFIG_XILINX_ZYNQMP_DMA is not set
CONFIG_XILINX_ZYNQMP_DPDMA=y
# CONFIG_MTK_HSDMA is not set
# CONFIG_MTK_CQDMA is not set
# CONFIG_QCOM_ADM is not set
# CONFIG_QCOM_HIDMA_MGMT is not set
CONFIG_QCOM_HIDMA=y
# CONFIG_DW_DMAC is not set
# CONFIG_SF_PDMA is not set
CONFIG_RENESAS_DMA=y
CONFIG_SH_DMAE_BASE=y
# CONFIG_SH_DMAE is not set
# CONFIG_RCAR_DMAC is not set
# CONFIG_RENESAS_USB_DMAC is not set
# CONFIG_RZ_DMAC is not set
CONFIG_TI_EDMA=y
CONFIG_DMA_OMAP=y
CONFIG_TI_DMA_CROSSBAR=y
# CONFIG_INTEL_LDMA is not set

#
# DMA Clients
#
CONFIG_ASYNC_TX_DMA=y
# CONFIG_DMATEST is not set

#
# DMABUF options
#
CONFIG_SYNC_FILE=y
# CONFIG_SW_SYNC is not set
CONFIG_UDMABUF=y
# CONFIG_DMABUF_MOVE_NOTIFY is not set
CONFIG_DMABUF_DEBUG=y
CONFIG_DMABUF_SELFTESTS=y
CONFIG_DMABUF_HEAPS=y
# CONFIG_DMABUF_SYSFS_STATS is not set
# CONFIG_DMABUF_HEAPS_SYSTEM is not set
# end of DMABUF options

CONFIG_AUXDISPLAY=y
CONFIG_CHARLCD=y
CONFIG_LINEDISP=y
CONFIG_HD44780_COMMON=y
# CONFIG_HD44780 is not set
CONFIG_IMG_ASCII_LCD=y
CONFIG_HT16K33=y
CONFIG_LCD2S=y
CONFIG_PARPORT_PANEL=y
CONFIG_PANEL_PARPORT=0
CONFIG_PANEL_PROFILE=5
# CONFIG_PANEL_CHANGE_MESSAGE is not set
CONFIG_CHARLCD_BL_OFF=y
# CONFIG_CHARLCD_BL_ON is not set
# CONFIG_CHARLCD_BL_FLASH is not set
CONFIG_PANEL=y
CONFIG_UIO=y
CONFIG_UIO_PDRV_GENIRQ=y
# CONFIG_UIO_DMEM_GENIRQ is not set
CONFIG_UIO_PRUSS=y
# CONFIG_VFIO is not set
# CONFIG_VIRT_DRIVERS is not set
CONFIG_VIRTIO_ANCHOR=y
CONFIG_VIRTIO=y
# CONFIG_VIRTIO_MENU is not set
CONFIG_VHOST_MENU=y
# CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set

#
# Microsoft Hyper-V guest support
#
# end of Microsoft Hyper-V guest support

CONFIG_GREYBUS=y
CONFIG_GREYBUS_ES2=y
# CONFIG_COMEDI is not set
# CONFIG_STAGING is not set
# CONFIG_GOLDFISH is not set
# CONFIG_CHROME_PLATFORMS is not set
# CONFIG_MELLANOX_PLATFORM is not set
# CONFIG_OLPC_XO175 is not set
CONFIG_SURFACE_PLATFORMS=y
CONFIG_HAVE_CLK=y
CONFIG_HAVE_CLK_PREPARE=y
CONFIG_COMMON_CLK=y

#
# Clock driver for ARM Reference designs
#
# CONFIG_CLK_ICST is not set
# CONFIG_CLK_SP810 is not set
# end of Clock driver for ARM Reference designs

# CONFIG_CLK_HSDK is not set
# CONFIG_COMMON_CLK_APPLE_NCO is not set
CONFIG_COMMON_CLK_MAX77686=y
CONFIG_COMMON_CLK_MAX9485=y
CONFIG_COMMON_CLK_RK808=y
# CONFIG_COMMON_CLK_HI655X is not set
# CONFIG_COMMON_CLK_SCMI is not set
# CONFIG_COMMON_CLK_SCPI is not set
# CONFIG_COMMON_CLK_SI5341 is not set
CONFIG_COMMON_CLK_SI5351=y
CONFIG_COMMON_CLK_SI514=y
CONFIG_COMMON_CLK_SI544=y
CONFIG_COMMON_CLK_SI570=y
# CONFIG_COMMON_CLK_BM1880 is not set
CONFIG_COMMON_CLK_CDCE706=y
# CONFIG_COMMON_CLK_TPS68470 is not set
CONFIG_COMMON_CLK_CDCE925=y
# CONFIG_COMMON_CLK_CS2000_CP is not set
# CONFIG_COMMON_CLK_EN7523 is not set
# CONFIG_COMMON_CLK_FSL_FLEXSPI is not set
# CONFIG_COMMON_CLK_FSL_SAI is not set
# CONFIG_COMMON_CLK_GEMINI is not set
# CONFIG_COMMON_CLK_LAN966X is not set
# CONFIG_COMMON_CLK_ASPEED is not set
CONFIG_COMMON_CLK_S2MPS11=y
# CONFIG_CLK_TWL6040 is not set
CONFIG_COMMON_CLK_AXI_CLKGEN=y
# CONFIG_CLK_QORIQ is not set
# CONFIG_CLK_LS1028A_PLLDIG is not set
# CONFIG_COMMON_CLK_XGENE is not set
CONFIG_COMMON_CLK_LOCHNAGAR=y
CONFIG_COMMON_CLK_PWM=y
# CONFIG_COMMON_CLK_OXNAS is not set
# CONFIG_COMMON_CLK_RS9_PCIE is not set
CONFIG_COMMON_CLK_VC5=y
CONFIG_COMMON_CLK_VC7=y
# CONFIG_COMMON_CLK_MMP2_AUDIO is not set
CONFIG_COMMON_CLK_FIXED_MMIO=y
# CONFIG_CLK_ACTIONS is not set
# CONFIG_CLK_BAIKAL_T1 is not set
# CONFIG_CLK_BCM2711_DVP is not set
# CONFIG_CLK_BCM2835 is not set
# CONFIG_CLK_BCM_63XX is not set
# CONFIG_CLK_BCM_63XX_GATE is not set
# CONFIG_CLK_BCM_KONA is not set
# CONFIG_CLK_BCM_CYGNUS is not set
# CONFIG_CLK_BCM_HR2 is not set
# CONFIG_CLK_BCM_NSP is not set
# CONFIG_CLK_BCM_NS2 is not set
# CONFIG_CLK_BCM_SR is not set
# CONFIG_CLK_RASPBERRYPI is not set
# CONFIG_COMMON_CLK_HI3516CV300 is not set
# CONFIG_COMMON_CLK_HI3519 is not set
# CONFIG_COMMON_CLK_HI3559A is not set
# CONFIG_COMMON_CLK_HI3660 is not set
# CONFIG_COMMON_CLK_HI3670 is not set
# CONFIG_COMMON_CLK_HI3798CV200 is not set
# CONFIG_COMMON_CLK_HI6220 is not set
# CONFIG_RESET_HISI is not set
# CONFIG_COMMON_CLK_BOSTON is not set
# CONFIG_MXC_CLK is not set
# CONFIG_CLK_IMX8MM is not set
# CONFIG_CLK_IMX8MN is not set
# CONFIG_CLK_IMX8MP is not set
# CONFIG_CLK_IMX8MQ is not set
# CONFIG_CLK_IMX8ULP is not set
# CONFIG_CLK_IMX93 is not set

#
# Ingenic SoCs drivers
#
# CONFIG_INGENIC_CGU_JZ4740 is not set
# CONFIG_INGENIC_CGU_JZ4725B is not set
# CONFIG_INGENIC_CGU_JZ4760 is not set
# CONFIG_INGENIC_CGU_JZ4770 is not set
# CONFIG_INGENIC_CGU_JZ4780 is not set
# CONFIG_INGENIC_CGU_X1000 is not set
# CONFIG_INGENIC_CGU_X1830 is not set
# CONFIG_INGENIC_TCU_CLK is not set
# end of Ingenic SoCs drivers

# CONFIG_COMMON_CLK_KEYSTONE is not set
# CONFIG_TI_SYSCON_CLK is not set

#
# Clock driver for MediaTek SoC
#
# CONFIG_COMMON_CLK_MT2701 is not set
# CONFIG_COMMON_CLK_MT2712 is not set
# CONFIG_COMMON_CLK_MT6765 is not set
# CONFIG_COMMON_CLK_MT6779 is not set
# CONFIG_COMMON_CLK_MT6795 is not set
# CONFIG_COMMON_CLK_MT6797 is not set
# CONFIG_COMMON_CLK_MT7622 is not set
# CONFIG_COMMON_CLK_MT7629 is not set
# CONFIG_COMMON_CLK_MT7986 is not set
# CONFIG_COMMON_CLK_MT8135 is not set
# CONFIG_COMMON_CLK_MT8167 is not set
# CONFIG_COMMON_CLK_MT8173 is not set
# CONFIG_COMMON_CLK_MT8183 is not set
# CONFIG_COMMON_CLK_MT8186 is not set
# CONFIG_COMMON_CLK_MT8192 is not set
# CONFIG_COMMON_CLK_MT8195 is not set
# CONFIG_COMMON_CLK_MT8365 is not set
# CONFIG_COMMON_CLK_MT8516 is not set
# end of Clock driver for MediaTek SoC

#
# Clock support for Amlogic platforms
#
# end of Clock support for Amlogic platforms

# CONFIG_MSTAR_MSC313_MPLL is not set
# CONFIG_MCHP_CLK_MPFS is not set
# CONFIG_COMMON_CLK_PISTACHIO is not set
# CONFIG_COMMON_CLK_QCOM is not set
# CONFIG_CLK_MT7621 is not set
# CONFIG_CLK_RENESAS is not set
# CONFIG_COMMON_CLK_SAMSUNG is not set
# CONFIG_S3C2410_COMMON_CLK is not set
# CONFIG_S3C2412_COMMON_CLK is not set
# CONFIG_S3C2443_COMMON_CLK is not set
# CONFIG_CLK_SIFIVE is not set
# CONFIG_CLK_INTEL_SOCFPGA is not set
# CONFIG_SPRD_COMMON_CLK is not set
# CONFIG_CLK_STARFIVE_JH7100 is not set
CONFIG_CLK_SUNXI=y
CONFIG_CLK_SUNXI_CLOCKS=y
CONFIG_CLK_SUNXI_PRCM_SUN6I=y
CONFIG_CLK_SUNXI_PRCM_SUN8I=y
CONFIG_CLK_SUNXI_PRCM_SUN9I=y
# CONFIG_SUNXI_CCU is not set
# CONFIG_COMMON_CLK_TI_ADPLL is not set
# CONFIG_CLK_UNIPHIER is not set
# CONFIG_COMMON_CLK_VISCONTI is not set
# CONFIG_CLK_LGM_CGU is not set
CONFIG_XILINX_VCU=y
CONFIG_COMMON_CLK_XLNX_CLKWZRD=y
# CONFIG_COMMON_CLK_ZYNQMP is not set
CONFIG_CLK_KUNIT_TEST=y
CONFIG_CLK_GATE_KUNIT_TEST=y
# CONFIG_HWSPINLOCK is not set

#
# Clock Source drivers
#
CONFIG_TIMER_OF=y
CONFIG_TIMER_PROBE=y
# CONFIG_BCM2835_TIMER is not set
# CONFIG_BCM_KONA_TIMER is not set
# CONFIG_DAVINCI_TIMER is not set
# CONFIG_DIGICOLOR_TIMER is not set
# CONFIG_OMAP_DM_TIMER is not set
# CONFIG_DW_APB_TIMER is not set
# CONFIG_FTTMR010_TIMER is not set
# CONFIG_IXP4XX_TIMER is not set
# CONFIG_MESON6_TIMER is not set
# CONFIG_OWL_TIMER is not set
# CONFIG_RDA_TIMER is not set
# CONFIG_SUN4I_TIMER is not set
# CONFIG_SUN5I_HSTIMER is not set
# CONFIG_TEGRA_TIMER is not set
# CONFIG_VT8500_TIMER is not set
# CONFIG_NPCM7XX_TIMER is not set
# CONFIG_CADENCE_TTC_TIMER is not set
# CONFIG_ASM9260_TIMER is not set
# CONFIG_CLKSRC_DBX500_PRCMU is not set
# CONFIG_CLPS711X_TIMER is not set
# CONFIG_MXS_TIMER is not set
# CONFIG_NSPIRE_TIMER is not set
# CONFIG_INTEGRATOR_AP_TIMER is not set
# CONFIG_CLKSRC_PISTACHIO is not set
# CONFIG_CLKSRC_TI_32K is not set
# CONFIG_CLKSRC_STM32_LP is not set
# CONFIG_CLKSRC_MPS2 is not set
CONFIG_ARC_TIMERS=y
# CONFIG_ARC_TIMERS_64BIT is not set
# CONFIG_ARM_TIMER_SP804 is not set
# CONFIG_ARMV7M_SYSTICK is not set
# CONFIG_ATMEL_PIT is not set
# CONFIG_ATMEL_ST is not set
# CONFIG_CLKSRC_SAMSUNG_PWM is not set
# CONFIG_FSL_FTM_TIMER is not set
# CONFIG_OXNAS_RPS_TIMER is not set
# CONFIG_MTK_TIMER is not set
# CONFIG_SPRD_TIMER is not set
# CONFIG_CLKSRC_JCORE_PIT is not set
# CONFIG_SH_TIMER_CMT is not set
# CONFIG_SH_TIMER_MTU2 is not set
# CONFIG_RENESAS_OSTM is not set
# CONFIG_SH_TIMER_TMU is not set
# CONFIG_EM_TIMER_STI is not set
# CONFIG_CLKSRC_VERSATILE is not set
# CONFIG_CLKSRC_PXA is not set
# CONFIG_TIMER_IMX_SYS_CTR is not set
# CONFIG_CLKSRC_ST_LPC is not set
# CONFIG_GXP_TIMER is not set
# CONFIG_MSC313E_TIMER is not set
# CONFIG_INGENIC_TIMER is not set
# CONFIG_INGENIC_SYSOST is not set
# CONFIG_INGENIC_OST is not set
CONFIG_MICROCHIP_PIT64B=y
# end of Clock Source drivers

# CONFIG_MAILBOX is not set
# CONFIG_IOMMU_SUPPORT is not set

#
# Remoteproc drivers
#
# CONFIG_REMOTEPROC is not set
# end of Remoteproc drivers

#
# Rpmsg drivers
#
CONFIG_RPMSG=y
CONFIG_RPMSG_CTRL=y
CONFIG_RPMSG_NS=y
CONFIG_RPMSG_VIRTIO=y
# end of Rpmsg drivers

# CONFIG_SOUNDWIRE is not set

#
# SOC (System On Chip) specific Drivers
#
# CONFIG_OWL_PM_DOMAINS is not set

#
# Amlogic SoC drivers
#
# CONFIG_MESON_CANVAS is not set
# CONFIG_MESON_CLK_MEASURE is not set
# CONFIG_MESON_GX_SOCINFO is not set
# CONFIG_MESON_GX_PM_DOMAINS is not set
# CONFIG_MESON_EE_PM_DOMAINS is not set
# CONFIG_MESON_MX_SOCINFO is not set
# end of Amlogic SoC drivers

#
# Apple SoC drivers
#
# CONFIG_APPLE_PMGR_PWRSTATE is not set
# CONFIG_APPLE_SART is not set
# end of Apple SoC drivers

#
# ASPEED SoC drivers
#
# CONFIG_ASPEED_LPC_CTRL is not set
# CONFIG_ASPEED_LPC_SNOOP is not set
# CONFIG_ASPEED_UART_ROUTING is not set
# CONFIG_ASPEED_P2A_CTRL is not set
# CONFIG_ASPEED_SOCINFO is not set
# end of ASPEED SoC drivers

# CONFIG_AT91_SOC_ID is not set
# CONFIG_AT91_SOC_SFR is not set

#
# Broadcom SoC drivers
#
# CONFIG_BCM2835_POWER is not set
# CONFIG_SOC_BCM63XX is not set
# CONFIG_SOC_BRCMSTB is not set
# CONFIG_BCM_PMB is not set
# end of Broadcom SoC drivers

#
# NXP/Freescale QorIQ SoC drivers
#
# CONFIG_QUICC_ENGINE is not set
CONFIG_DPAA2_CONSOLE=y
# end of NXP/Freescale QorIQ SoC drivers

#
# fujitsu SoC drivers
#
# end of fujitsu SoC drivers

#
# i.MX SoC drivers
#
# CONFIG_IMX_GPCV2_PM_DOMAINS is not set
# CONFIG_SOC_IMX8M is not set
# CONFIG_SOC_IMX9 is not set
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
# CONFIG_MTK_INFRACFG is not set
# CONFIG_MTK_PMIC_WRAP is not set
# CONFIG_MTK_SCPSYS is not set
# CONFIG_MTK_SCPSYS_PM_DOMAINS is not set
# CONFIG_MTK_MMSYS is not set
# end of MediaTek SoC drivers

#
# Qualcomm SoC drivers
#
# CONFIG_QCOM_COMMAND_DB is not set
# CONFIG_QCOM_GENI_SE is not set
# CONFIG_QCOM_GSBI is not set
# CONFIG_QCOM_LLCC is not set
# CONFIG_QCOM_RPMH is not set
# CONFIG_QCOM_SMD_RPM is not set
# CONFIG_QCOM_SPM is not set
# CONFIG_QCOM_WCNSS_CTRL is not set
# CONFIG_QCOM_ICC_BWMON is not set
# end of Qualcomm SoC drivers

# CONFIG_SOC_RENESAS is not set
# CONFIG_ROCKCHIP_GRF is not set
# CONFIG_ROCKCHIP_IODOMAIN is not set
# CONFIG_ROCKCHIP_PM_DOMAINS is not set
# CONFIG_SOC_SAMSUNG is not set
# CONFIG_SOC_TEGRA20_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TEGRA30_VOLTAGE_COUPLER is not set
# CONFIG_SOC_TI is not set
# CONFIG_UX500_SOC_ID is not set

#
# Xilinx SoC drivers
#
# end of Xilinx SoC drivers
# end of SOC (System On Chip) specific Drivers

CONFIG_PM_DEVFREQ=y

#
# DEVFREQ Governors
#
CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
# CONFIG_DEVFREQ_GOV_PERFORMANCE is not set
CONFIG_DEVFREQ_GOV_POWERSAVE=y
CONFIG_DEVFREQ_GOV_USERSPACE=y
# CONFIG_DEVFREQ_GOV_PASSIVE is not set

#
# DEVFREQ Drivers
#
# CONFIG_ARM_EXYNOS_BUS_DEVFREQ is not set
# CONFIG_ARM_IMX_BUS_DEVFREQ is not set
# CONFIG_ARM_TEGRA_DEVFREQ is not set
# CONFIG_ARM_MEDIATEK_CCI_DEVFREQ is not set
# CONFIG_ARM_SUN8I_A33_MBUS_DEVFREQ is not set
CONFIG_PM_DEVFREQ_EVENT=y
# CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP is not set
# CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU is not set
# CONFIG_DEVFREQ_EVENT_ROCKCHIP_DFI is not set
CONFIG_EXTCON=y

#
# Extcon Device Drivers
#
CONFIG_EXTCON_FSA9480=y
# CONFIG_EXTCON_GPIO is not set
# CONFIG_EXTCON_MAX3355 is not set
CONFIG_EXTCON_MAX77693=y
CONFIG_EXTCON_MAX8997=y
CONFIG_EXTCON_PTN5150=y
# CONFIG_EXTCON_QCOM_SPMI_MISC is not set
CONFIG_EXTCON_RT8973A=y
# CONFIG_EXTCON_SM5502 is not set
CONFIG_EXTCON_USB_GPIO=y
CONFIG_EXTCON_USBC_TUSB320=y
# CONFIG_MEMORY is not set
# CONFIG_IIO is not set
CONFIG_PWM=y
CONFIG_PWM_SYSFS=y
CONFIG_PWM_DEBUG=y
# CONFIG_PWM_ATMEL is not set
CONFIG_PWM_ATMEL_TCB=y
# CONFIG_PWM_BCM_IPROC is not set
# CONFIG_PWM_BCM_KONA is not set
# CONFIG_PWM_BCM2835 is not set
# CONFIG_PWM_BERLIN is not set
# CONFIG_PWM_BRCMSTB is not set
CONFIG_PWM_CLK=y
# CONFIG_PWM_CLPS711X is not set
# CONFIG_PWM_EP93XX is not set
CONFIG_PWM_FSL_FTM=y
# CONFIG_PWM_HIBVT is not set
# CONFIG_PWM_IMG is not set
# CONFIG_PWM_IMX1 is not set
# CONFIG_PWM_IMX27 is not set
# CONFIG_PWM_IMX_TPM is not set
# CONFIG_PWM_INTEL_LGM is not set
# CONFIG_PWM_IQS620A is not set
# CONFIG_PWM_JZ4740 is not set
# CONFIG_PWM_KEEMBAY is not set
CONFIG_PWM_LP3943=y
# CONFIG_PWM_LPC18XX_SCT is not set
# CONFIG_PWM_LPC32XX is not set
# CONFIG_PWM_LPSS_PLATFORM is not set
# CONFIG_PWM_MESON is not set
# CONFIG_PWM_MTK_DISP is not set
# CONFIG_PWM_MEDIATEK is not set
# CONFIG_PWM_MXS is not set
# CONFIG_PWM_OMAP_DMTIMER is not set
CONFIG_PWM_PCA9685=y
# CONFIG_PWM_PXA is not set
# CONFIG_PWM_RASPBERRYPI_POE is not set
# CONFIG_PWM_RCAR is not set
# CONFIG_PWM_RENESAS_TPU is not set
# CONFIG_PWM_ROCKCHIP is not set
# CONFIG_PWM_SAMSUNG is not set
# CONFIG_PWM_SIFIVE is not set
# CONFIG_PWM_SL28CPLD is not set
# CONFIG_PWM_SPEAR is not set
# CONFIG_PWM_SPRD is not set
# CONFIG_PWM_STI is not set
# CONFIG_PWM_STM32 is not set
# CONFIG_PWM_STM32_LP is not set
CONFIG_PWM_STMPE=y
# CONFIG_PWM_SUN4I is not set
# CONFIG_PWM_SUNPLUS is not set
# CONFIG_PWM_TEGRA is not set
# CONFIG_PWM_TIECAP is not set
# CONFIG_PWM_TIEHRPWM is not set
# CONFIG_PWM_TWL is not set
CONFIG_PWM_TWL_LED=y
# CONFIG_PWM_VISCONTI is not set
# CONFIG_PWM_VT8500 is not set
CONFIG_PWM_XILINX=y

#
# IRQ chip support
#
CONFIG_IRQCHIP=y
CONFIG_AL_FIC=y
CONFIG_DW_APB_ICTL=y
CONFIG_MADERA_IRQ=y
# CONFIG_JCORE_AIC is not set
# CONFIG_RENESAS_INTC_IRQPIN is not set
# CONFIG_RENESAS_IRQC is not set
# CONFIG_RENESAS_RZA1_IRQC is not set
# CONFIG_RENESAS_RZG2L_IRQC is not set
# CONFIG_SL28CPLD_INTC is not set
CONFIG_TB10X_IRQC=y
# CONFIG_TS4800_IRQ is not set
CONFIG_XILINX_INTC=y
# CONFIG_INGENIC_TCU_IRQ is not set
# CONFIG_IRQ_UNIPHIER_AIDET is not set
# CONFIG_MESON_IRQ_GPIO is not set
# CONFIG_IMX_IRQSTEER is not set
# CONFIG_IMX_INTMUX is not set
# CONFIG_IMX_MU_MSI is not set
# CONFIG_EXYNOS_IRQ_COMBINER is not set
# CONFIG_MST_IRQ is not set
# CONFIG_MCHP_EIC is not set
# CONFIG_SUNPLUS_SP7021_INTC is not set
# end of IRQ chip support

CONFIG_IPACK_BUS=y
# CONFIG_SERIAL_IPOCTAL is not set
CONFIG_RESET_CONTROLLER=y
# CONFIG_RESET_A10SR is not set
# CONFIG_RESET_ATH79 is not set
CONFIG_RESET_AXS10X=y
# CONFIG_RESET_BCM6345 is not set
# CONFIG_RESET_BERLIN is not set
# CONFIG_RESET_BRCMSTB is not set
# CONFIG_RESET_BRCMSTB_RESCAL is not set
# CONFIG_RESET_HSDK is not set
# CONFIG_RESET_IMX7 is not set
# CONFIG_RESET_INTEL_GW is not set
# CONFIG_RESET_K210 is not set
# CONFIG_RESET_LANTIQ is not set
# CONFIG_RESET_LPC18XX is not set
# CONFIG_RESET_MCHP_SPARX5 is not set
# CONFIG_RESET_MESON is not set
# CONFIG_RESET_MESON_AUDIO_ARB is not set
# CONFIG_RESET_NPCM is not set
# CONFIG_RESET_PISTACHIO is not set
# CONFIG_RESET_QCOM_AOSS is not set
# CONFIG_RESET_QCOM_PDC is not set
# CONFIG_RESET_RASPBERRYPI is not set
# CONFIG_RESET_RZG2L_USBPHY_CTRL is not set
# CONFIG_RESET_SCMI is not set
# CONFIG_RESET_SIMPLE is not set
# CONFIG_RESET_SOCFPGA is not set
# CONFIG_RESET_STARFIVE_JH7100 is not set
# CONFIG_RESET_SUNPLUS is not set
# CONFIG_RESET_SUNXI is not set
# CONFIG_RESET_TI_SCI is not set
# CONFIG_RESET_TI_SYSCON is not set
CONFIG_RESET_TI_TPS380X=y
# CONFIG_RESET_TN48M_CPLD is not set
# CONFIG_RESET_UNIPHIER is not set
# CONFIG_RESET_UNIPHIER_GLUE is not set
# CONFIG_RESET_ZYNQ is not set
# CONFIG_COMMON_RESET_HI3660 is not set
# CONFIG_COMMON_RESET_HI6220 is not set

#
# PHY Subsystem
#
CONFIG_GENERIC_PHY=y
CONFIG_GENERIC_PHY_MIPI_DPHY=y
# CONFIG_PHY_LPC18XX_USB_OTG is not set
# CONFIG_PHY_PISTACHIO_USB is not set
# CONFIG_PHY_XGENE is not set
# CONFIG_USB_LGM_PHY is not set
CONFIG_PHY_CAN_TRANSCEIVER=y
# CONFIG_PHY_SUN4I_USB is not set
# CONFIG_PHY_SUN6I_MIPI_DPHY is not set
# CONFIG_PHY_SUN9I_USB is not set
# CONFIG_PHY_SUN50I_USB3 is not set
# CONFIG_PHY_MESON8_HDMI_TX is not set
# CONFIG_PHY_MESON8B_USB2 is not set
# CONFIG_PHY_MESON_GXL_USB2 is not set
# CONFIG_PHY_MESON_G12A_MIPI_DPHY_ANALOG is not set
# CONFIG_PHY_MESON_G12A_USB2 is not set
# CONFIG_PHY_MESON_G12A_USB3_PCIE is not set
# CONFIG_PHY_MESON_AXG_PCIE is not set
# CONFIG_PHY_MESON_AXG_MIPI_PCIE_ANALOG is not set
# CONFIG_PHY_MESON_AXG_MIPI_DPHY is not set

#
# PHY drivers for Broadcom platforms
#
# CONFIG_PHY_BCM63XX_USBH is not set
# CONFIG_PHY_CYGNUS_PCIE is not set
# CONFIG_PHY_BCM_SR_USB is not set
CONFIG_BCM_KONA_USB2_PHY=y
# CONFIG_PHY_BCM_NS_USB2 is not set
# CONFIG_PHY_NS2_USB_DRD is not set
# CONFIG_PHY_BRCM_SATA is not set
# CONFIG_PHY_BRCM_USB is not set
# CONFIG_PHY_BCM_SR_PCIE is not set
# end of PHY drivers for Broadcom platforms

# CONFIG_PHY_CADENCE_TORRENT is not set
# CONFIG_PHY_CADENCE_DPHY is not set
# CONFIG_PHY_CADENCE_DPHY_RX is not set
CONFIG_PHY_CADENCE_SIERRA=y
CONFIG_PHY_CADENCE_SALVO=y
# CONFIG_PHY_FSL_IMX8MQ_USB is not set
# CONFIG_PHY_MIXEL_LVDS_PHY is not set
# CONFIG_PHY_MIXEL_MIPI_DPHY is not set
# CONFIG_PHY_FSL_IMX8M_PCIE is not set
# CONFIG_PHY_FSL_LYNX_28G is not set
# CONFIG_PHY_HI6220_USB is not set
# CONFIG_PHY_HI3660_USB is not set
# CONFIG_PHY_HI3670_USB is not set
# CONFIG_PHY_HI3670_PCIE is not set
# CONFIG_PHY_HISTB_COMBPHY is not set
# CONFIG_PHY_HISI_INNO_USB2 is not set
# CONFIG_PHY_INGENIC_USB is not set
# CONFIG_PHY_LANTIQ_VRX200_PCIE is not set
# CONFIG_PHY_LANTIQ_RCU_USB2 is not set
# CONFIG_ARMADA375_USBCLUSTER_PHY is not set
# CONFIG_PHY_BERLIN_SATA is not set
# CONFIG_PHY_BERLIN_USB is not set
CONFIG_PHY_MVEBU_A3700_UTMI=y
# CONFIG_PHY_MVEBU_A38X_COMPHY is not set
# CONFIG_PHY_MVEBU_CP110_UTMI is not set
CONFIG_PHY_PXA_28NM_HSIC=y
# CONFIG_PHY_PXA_28NM_USB2 is not set
# CONFIG_PHY_PXA_USB is not set
# CONFIG_PHY_MMP3_USB is not set
# CONFIG_PHY_MMP3_HSIC is not set
# CONFIG_PHY_MTK_PCIE is not set
# CONFIG_PHY_MTK_TPHY is not set
# CONFIG_PHY_MTK_UFS is not set
# CONFIG_PHY_MTK_XSPHY is not set
# CONFIG_PHY_MTK_HDMI is not set
# CONFIG_PHY_MTK_MIPI_DSI is not set
# CONFIG_PHY_MTK_DP is not set
# CONFIG_PHY_SPARX5_SERDES is not set
CONFIG_PHY_LAN966X_SERDES=y
CONFIG_PHY_MAPPHONE_MDM6600=y
# CONFIG_PHY_OCELOT_SERDES is not set
CONFIG_PHY_ATH79_USB=y
# CONFIG_PHY_QCOM_EDP is not set
# CONFIG_PHY_QCOM_IPQ4019_USB is not set
# CONFIG_PHY_QCOM_PCIE2 is not set
# CONFIG_PHY_QCOM_QMP is not set
# CONFIG_PHY_QCOM_QUSB2 is not set
CONFIG_PHY_QCOM_USB_HS=y
# CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2 is not set
# CONFIG_PHY_QCOM_USB_HSIC is not set
# CONFIG_PHY_QCOM_USB_HS_28NM is not set
# CONFIG_PHY_QCOM_USB_SS is not set
# CONFIG_PHY_QCOM_IPQ806X_USB is not set
# CONFIG_PHY_MT7621_PCI is not set
# CONFIG_PHY_RALINK_USB is not set
# CONFIG_PHY_RCAR_GEN3_USB3 is not set
# CONFIG_PHY_ROCKCHIP_DPHY_RX0 is not set
# CONFIG_PHY_ROCKCHIP_INNO_HDMI is not set
# CONFIG_PHY_ROCKCHIP_INNO_USB2 is not set
# CONFIG_PHY_ROCKCHIP_INNO_CSIDPHY is not set
# CONFIG_PHY_ROCKCHIP_INNO_DSIDPHY is not set
# CONFIG_PHY_ROCKCHIP_PCIE is not set
# CONFIG_PHY_ROCKCHIP_SNPS_PCIE3 is not set
# CONFIG_PHY_ROCKCHIP_TYPEC is not set
# CONFIG_PHY_EXYNOS_DP_VIDEO is not set
# CONFIG_PHY_EXYNOS_MIPI_VIDEO is not set
# CONFIG_PHY_EXYNOS_PCIE is not set
# CONFIG_PHY_SAMSUNG_UFS is not set
CONFIG_PHY_SAMSUNG_USB2=y
# CONFIG_PHY_S5PV210_USB2 is not set
# CONFIG_PHY_UNIPHIER_USB2 is not set
# CONFIG_PHY_UNIPHIER_USB3 is not set
# CONFIG_PHY_UNIPHIER_PCIE is not set
# CONFIG_PHY_UNIPHIER_AHCI is not set
# CONFIG_PHY_ST_SPEAR1310_MIPHY is not set
# CONFIG_PHY_ST_SPEAR1340_MIPHY is not set
# CONFIG_PHY_STIH407_USB is not set
# CONFIG_PHY_STM32_USBPHYC is not set
# CONFIG_PHY_SUNPLUS_USB is not set
# CONFIG_PHY_TEGRA194_P2U is not set
# CONFIG_PHY_DA8XX_USB is not set
# CONFIG_PHY_DM816X_USB is not set
# CONFIG_PHY_AM654_SERDES is not set
# CONFIG_PHY_J721E_WIZ is not set
# CONFIG_OMAP_CONTROL_PHY is not set
# CONFIG_TI_PIPE3 is not set
# CONFIG_PHY_TUSB1210 is not set
# CONFIG_PHY_INTEL_KEEMBAY_EMMC is not set
# CONFIG_PHY_INTEL_KEEMBAY_USB is not set
# CONFIG_PHY_INTEL_LGM_COMBO is not set
# CONFIG_PHY_INTEL_LGM_EMMC is not set
# CONFIG_PHY_INTEL_THUNDERBAY_EMMC is not set
# CONFIG_PHY_XILINX_ZYNQMP is not set
# end of PHY Subsystem

CONFIG_POWERCAP=y
# CONFIG_DTPM is not set
# CONFIG_MCB is not set

#
# Performance monitor support
#
# CONFIG_ARM_CCN is not set
# CONFIG_ARM_CMN is not set
# CONFIG_FSL_IMX8_DDR_PMU is not set
# CONFIG_ARM_DMC620_PMU is not set
# CONFIG_ALIBABA_UNCORE_DRW_PMU is not set
# end of Performance monitor support

# CONFIG_RAS is not set

#
# Android
#
# CONFIG_ANDROID_BINDER_IPC is not set
# end of Android

CONFIG_DAX=y
CONFIG_NVMEM=y
CONFIG_NVMEM_SYSFS=y
# CONFIG_NVMEM_APPLE_EFUSES is not set
# CONFIG_NVMEM_BCM_OCOTP is not set
# CONFIG_NVMEM_BRCM_NVRAM is not set
# CONFIG_NVMEM_IMX_IIM is not set
# CONFIG_NVMEM_IMX_OCOTP is not set
# CONFIG_NVMEM_JZ4780_EFUSE is not set
# CONFIG_NVMEM_LAN9662_OTPC is not set
# CONFIG_NVMEM_LAYERSCAPE_SFP is not set
# CONFIG_NVMEM_LPC18XX_EEPROM is not set
# CONFIG_NVMEM_LPC18XX_OTP is not set
# CONFIG_NVMEM_MESON_MX_EFUSE is not set
# CONFIG_NVMEM_MICROCHIP_OTPC is not set
# CONFIG_NVMEM_MTK_EFUSE is not set
# CONFIG_NVMEM_MXS_OCOTP is not set
# CONFIG_NVMEM_NINTENDO_OTP is not set
# CONFIG_NVMEM_QCOM_QFPROM is not set
CONFIG_NVMEM_RAVE_SP_EEPROM=y
CONFIG_NVMEM_RMEM=y
# CONFIG_NVMEM_ROCKCHIP_EFUSE is not set
# CONFIG_NVMEM_ROCKCHIP_OTP is not set
# CONFIG_NVMEM_SC27XX_EFUSE is not set
# CONFIG_NVMEM_SNVS_LPGPR is not set
# CONFIG_NVMEM_SPRD_EFUSE is not set
# CONFIG_NVMEM_STM32_ROMEM is not set
# CONFIG_NVMEM_SUNPLUS_OCOTP is not set
# CONFIG_NVMEM_UNIPHIER_EFUSE is not set
# CONFIG_NVMEM_VF610_OCOTP is not set

#
# HW tracing support
#
CONFIG_STM=y
CONFIG_STM_PROTO_BASIC=y
# CONFIG_STM_PROTO_SYS_T is not set
# CONFIG_STM_DUMMY is not set
# CONFIG_STM_SOURCE_CONSOLE is not set
CONFIG_STM_SOURCE_HEARTBEAT=y
CONFIG_INTEL_TH=y
# CONFIG_INTEL_TH_GTH is not set
# CONFIG_INTEL_TH_STH is not set
CONFIG_INTEL_TH_MSU=y
# CONFIG_INTEL_TH_PTI is not set
CONFIG_INTEL_TH_DEBUG=y
# end of HW tracing support

CONFIG_FPGA=y
# CONFIG_FPGA_MGR_SOCFPGA is not set
# CONFIG_FPGA_MGR_SOCFPGA_A10 is not set
# CONFIG_ALTERA_PR_IP_CORE is not set
# CONFIG_FPGA_MGR_ZYNQ_FPGA is not set
CONFIG_FPGA_BRIDGE=y
CONFIG_ALTERA_FREEZE_BRIDGE=y
# CONFIG_XILINX_PR_DECOUPLER is not set
CONFIG_FPGA_REGION=y
# CONFIG_OF_FPGA_REGION is not set
# CONFIG_FPGA_DFL is not set
# CONFIG_FPGA_MGR_ZYNQMP_FPGA is not set
# CONFIG_FPGA_MGR_VERSAL_FPGA is not set
CONFIG_FSI=y
# CONFIG_FSI_NEW_DEV_NODE is not set
CONFIG_FSI_MASTER_GPIO=y
CONFIG_FSI_MASTER_HUB=y
# CONFIG_FSI_MASTER_ASPEED is not set
# CONFIG_FSI_SCOM is not set
CONFIG_FSI_SBEFIFO=y
# CONFIG_FSI_OCC is not set
# CONFIG_TEE is not set
CONFIG_MULTIPLEXER=y

#
# Multiplexer drivers
#
CONFIG_MUX_ADG792A=y
# CONFIG_MUX_GPIO is not set
CONFIG_MUX_MMIO=y
# end of Multiplexer drivers

CONFIG_PM_OPP=y
CONFIG_SIOX=y
CONFIG_SIOX_BUS_GPIO=y
CONFIG_SLIMBUS=y
CONFIG_SLIM_QCOM_CTRL=y
# CONFIG_INTERCONNECT is not set
CONFIG_COUNTER=y
# CONFIG_104_QUAD_8 is not set
CONFIG_INTERRUPT_CNT=y
# CONFIG_STM32_TIMER_CNT is not set
# CONFIG_STM32_LPTIMER_CNT is not set
# CONFIG_TI_EQEP is not set
CONFIG_FTM_QUADDEC=y
CONFIG_MICROCHIP_TCB_CAPTURE=y
# CONFIG_TI_ECAP_CAPTURE is not set
# CONFIG_MOST is not set
CONFIG_PECI=y
CONFIG_PECI_CPU=y
# CONFIG_PECI_ASPEED is not set
# CONFIG_HTE is not set
# end of Device Drivers

#
# File systems
#
# CONFIG_VALIDATE_FS_PARSER is not set
CONFIG_FS_POSIX_ACL=y
CONFIG_EXPORTFS=y
# CONFIG_EXPORTFS_BLOCK_OPS is not set
CONFIG_FILE_LOCKING=y
CONFIG_FS_ENCRYPTION=y
# CONFIG_FS_VERITY is not set
CONFIG_FSNOTIFY=y
CONFIG_DNOTIFY=y
CONFIG_INOTIFY_USER=y
CONFIG_FANOTIFY=y
# CONFIG_FANOTIFY_ACCESS_PERMISSIONS is not set
CONFIG_QUOTA=y
CONFIG_PRINT_QUOTA_WARNING=y
CONFIG_QUOTA_DEBUG=y
CONFIG_QUOTA_TREE=y
CONFIG_QFMT_V1=y
CONFIG_QFMT_V2=y
CONFIG_QUOTACTL=y
# CONFIG_AUTOFS4_FS is not set
CONFIG_AUTOFS_FS=y
# CONFIG_FUSE_FS is not set
CONFIG_OVERLAY_FS=y
CONFIG_OVERLAY_FS_REDIRECT_DIR=y
CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW=y
# CONFIG_OVERLAY_FS_INDEX is not set
CONFIG_OVERLAY_FS_METACOPY=y

#
# Caches
#
CONFIG_NETFS_SUPPORT=y
CONFIG_FSCACHE=y
# CONFIG_FSCACHE_DEBUG is not set
# end of Caches

#
# Pseudo filesystems
#
# CONFIG_PROC_FS is not set
CONFIG_KERNFS=y
CONFIG_SYSFS=y
CONFIG_TMPFS=y
CONFIG_TMPFS_POSIX_ACL=y
CONFIG_TMPFS_XATTR=y
CONFIG_MEMFD_CREATE=y
CONFIG_CONFIGFS_FS=y
# end of Pseudo filesystems

CONFIG_MISC_FILESYSTEMS=y
# CONFIG_ORANGEFS_FS is not set
CONFIG_ECRYPT_FS=y
CONFIG_ECRYPT_FS_MESSAGING=y
# CONFIG_CRAMFS is not set
CONFIG_PSTORE=y
CONFIG_PSTORE_DEFAULT_KMSG_BYTES=10240
CONFIG_PSTORE_DEFLATE_COMPRESS=y
CONFIG_PSTORE_LZO_COMPRESS=y
# CONFIG_PSTORE_LZ4_COMPRESS is not set
CONFIG_PSTORE_LZ4HC_COMPRESS=y
CONFIG_PSTORE_842_COMPRESS=y
# CONFIG_PSTORE_ZSTD_COMPRESS is not set
CONFIG_PSTORE_COMPRESS=y
# CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_LZO_COMPRESS_DEFAULT=y
# CONFIG_PSTORE_LZ4HC_COMPRESS_DEFAULT is not set
# CONFIG_PSTORE_842_COMPRESS_DEFAULT is not set
CONFIG_PSTORE_COMPRESS_DEFAULT="lzo"
# CONFIG_PSTORE_CONSOLE is not set
CONFIG_PSTORE_PMSG=y
CONFIG_PSTORE_RAM=y
CONFIG_NLS=y
CONFIG_NLS_DEFAULT="iso8859-1"
CONFIG_NLS_CODEPAGE_437=y
# CONFIG_NLS_CODEPAGE_737 is not set
CONFIG_NLS_CODEPAGE_775=y
# CONFIG_NLS_CODEPAGE_850 is not set
CONFIG_NLS_CODEPAGE_852=y
CONFIG_NLS_CODEPAGE_855=y
# CONFIG_NLS_CODEPAGE_857 is not set
CONFIG_NLS_CODEPAGE_860=y
# CONFIG_NLS_CODEPAGE_861 is not set
CONFIG_NLS_CODEPAGE_862=y
CONFIG_NLS_CODEPAGE_863=y
# CONFIG_NLS_CODEPAGE_864 is not set
CONFIG_NLS_CODEPAGE_865=y
# CONFIG_NLS_CODEPAGE_866 is not set
# CONFIG_NLS_CODEPAGE_869 is not set
CONFIG_NLS_CODEPAGE_936=y
# CONFIG_NLS_CODEPAGE_950 is not set
# CONFIG_NLS_CODEPAGE_932 is not set
CONFIG_NLS_CODEPAGE_949=y
CONFIG_NLS_CODEPAGE_874=y
CONFIG_NLS_ISO8859_8=y
CONFIG_NLS_CODEPAGE_1250=y
CONFIG_NLS_CODEPAGE_1251=y
# CONFIG_NLS_ASCII is not set
CONFIG_NLS_ISO8859_1=y
# CONFIG_NLS_ISO8859_2 is not set
CONFIG_NLS_ISO8859_3=y
CONFIG_NLS_ISO8859_4=y
CONFIG_NLS_ISO8859_5=y
CONFIG_NLS_ISO8859_6=y
CONFIG_NLS_ISO8859_7=y
CONFIG_NLS_ISO8859_9=y
CONFIG_NLS_ISO8859_13=y
CONFIG_NLS_ISO8859_14=y
CONFIG_NLS_ISO8859_15=y
# CONFIG_NLS_KOI8_R is not set
CONFIG_NLS_KOI8_U=y
CONFIG_NLS_MAC_ROMAN=y
# CONFIG_NLS_MAC_CELTIC is not set
# CONFIG_NLS_MAC_CENTEURO is not set
CONFIG_NLS_MAC_CROATIAN=y
CONFIG_NLS_MAC_CYRILLIC=y
CONFIG_NLS_MAC_GAELIC=y
CONFIG_NLS_MAC_GREEK=y
# CONFIG_NLS_MAC_ICELAND is not set
# CONFIG_NLS_MAC_INUIT is not set
# CONFIG_NLS_MAC_ROMANIAN is not set
# CONFIG_NLS_MAC_TURKISH is not set
CONFIG_NLS_UTF8=y
CONFIG_UNICODE=y
# CONFIG_UNICODE_NORMALIZATION_SELFTEST is not set
CONFIG_IO_WQ=y
# end of File systems

#
# Security options
#
CONFIG_KEYS=y
CONFIG_KEYS_REQUEST_CACHE=y
# CONFIG_PERSISTENT_KEYRINGS is not set
# CONFIG_TRUSTED_KEYS is not set
CONFIG_ENCRYPTED_KEYS=y
CONFIG_USER_DECRYPTED_DATA=y
# CONFIG_KEY_DH_OPERATIONS is not set
CONFIG_SECURITY_DMESG_RESTRICT=y
CONFIG_SECURITY=y
# CONFIG_SECURITYFS is not set
# CONFIG_SECURITY_NETWORK is not set
CONFIG_SECURITY_PATH=y
CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=y
# CONFIG_HARDENED_USERCOPY is not set
# CONFIG_STATIC_USERMODEHELPER is not set
# CONFIG_SECURITY_YAMA is not set
# CONFIG_SECURITY_SAFESETID is not set
CONFIG_SECURITY_LOCKDOWN_LSM=y
CONFIG_SECURITY_LOCKDOWN_LSM_EARLY=y
CONFIG_LOCK_DOWN_KERNEL_FORCE_NONE=y
# CONFIG_LOCK_DOWN_KERNEL_FORCE_INTEGRITY is not set
# CONFIG_LOCK_DOWN_KERNEL_FORCE_CONFIDENTIALITY is not set
CONFIG_SECURITY_LANDLOCK=y
CONFIG_INTEGRITY=y
CONFIG_INTEGRITY_SIGNATURE=y
# CONFIG_INTEGRITY_ASYMMETRIC_KEYS is not set
# CONFIG_IMA is not set
CONFIG_EVM=y
CONFIG_EVM_ATTR_FSUUID=y
# CONFIG_EVM_ADD_XATTRS is not set
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
# CONFIG_INIT_STACK_NONE is not set
# CONFIG_INIT_STACK_ALL_PATTERN is not set
CONFIG_INIT_STACK_ALL_ZERO=y
# CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
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
CONFIG_CRYPTO_FIPS_CUSTOM_VERSION=y
CONFIG_CRYPTO_FIPS_VERSION="(none)"
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
# CONFIG_CRYPTO_MANAGER_DISABLE_TESTS is not set
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y
CONFIG_CRYPTO_GF128MUL=y
CONFIG_CRYPTO_NULL=y
CONFIG_CRYPTO_NULL2=y
CONFIG_CRYPTO_PCRYPT=y
CONFIG_CRYPTO_CRYPTD=y
CONFIG_CRYPTO_AUTHENC=y
CONFIG_CRYPTO_TEST=y
CONFIG_CRYPTO_ENGINE=y
# end of Crypto core or helper

#
# Public-key cryptography
#
CONFIG_CRYPTO_RSA=y
CONFIG_CRYPTO_DH=y
# CONFIG_CRYPTO_DH_RFC7919_GROUPS is not set
CONFIG_CRYPTO_ECC=y
CONFIG_CRYPTO_ECDH=y
# CONFIG_CRYPTO_ECDSA is not set
CONFIG_CRYPTO_ECRDSA=y
# CONFIG_CRYPTO_SM2 is not set
CONFIG_CRYPTO_CURVE25519=y
# end of Public-key cryptography

#
# Block ciphers
#
CONFIG_CRYPTO_AES=y
CONFIG_CRYPTO_AES_TI=y
CONFIG_CRYPTO_ARIA=y
CONFIG_CRYPTO_BLOWFISH=y
CONFIG_CRYPTO_BLOWFISH_COMMON=y
CONFIG_CRYPTO_CAMELLIA=y
CONFIG_CRYPTO_CAST_COMMON=y
# CONFIG_CRYPTO_CAST5 is not set
CONFIG_CRYPTO_CAST6=y
CONFIG_CRYPTO_DES=y
# CONFIG_CRYPTO_FCRYPT is not set
CONFIG_CRYPTO_SERPENT=y
# CONFIG_CRYPTO_SM4_GENERIC is not set
CONFIG_CRYPTO_TWOFISH=y
CONFIG_CRYPTO_TWOFISH_COMMON=y
# end of Block ciphers

#
# Length-preserving ciphers and modes
#
# CONFIG_CRYPTO_ADIANTUM is not set
CONFIG_CRYPTO_CHACHA20=y
CONFIG_CRYPTO_CBC=y
CONFIG_CRYPTO_CFB=y
CONFIG_CRYPTO_CTR=y
CONFIG_CRYPTO_CTS=y
CONFIG_CRYPTO_ECB=y
CONFIG_CRYPTO_HCTR2=y
CONFIG_CRYPTO_KEYWRAP=y
CONFIG_CRYPTO_LRW=y
CONFIG_CRYPTO_OFB=y
CONFIG_CRYPTO_PCBC=y
CONFIG_CRYPTO_XCTR=y
CONFIG_CRYPTO_XTS=y
# end of Length-preserving ciphers and modes

#
# AEAD (authenticated encryption with associated data) ciphers
#
# CONFIG_CRYPTO_AEGIS128 is not set
# CONFIG_CRYPTO_CHACHA20POLY1305 is not set
# CONFIG_CRYPTO_CCM is not set
# CONFIG_CRYPTO_GCM is not set
CONFIG_CRYPTO_SEQIV=y
# CONFIG_CRYPTO_ECHAINIV is not set
CONFIG_CRYPTO_ESSIV=y
# end of AEAD (authenticated encryption with associated data) ciphers

#
# Hashes, digests, and MACs
#
# CONFIG_CRYPTO_BLAKE2B is not set
# CONFIG_CRYPTO_CMAC is not set
CONFIG_CRYPTO_GHASH=y
CONFIG_CRYPTO_HMAC=y
CONFIG_CRYPTO_MD4=y
CONFIG_CRYPTO_MD5=y
CONFIG_CRYPTO_MICHAEL_MIC=y
CONFIG_CRYPTO_POLYVAL=y
CONFIG_CRYPTO_POLY1305=y
CONFIG_CRYPTO_RMD160=y
CONFIG_CRYPTO_SHA1=y
CONFIG_CRYPTO_SHA256=y
CONFIG_CRYPTO_SHA512=y
# CONFIG_CRYPTO_SHA3 is not set
CONFIG_CRYPTO_SM3=y
CONFIG_CRYPTO_SM3_GENERIC=y
CONFIG_CRYPTO_STREEBOG=y
CONFIG_CRYPTO_VMAC=y
CONFIG_CRYPTO_WP512=y
CONFIG_CRYPTO_XCBC=y
# CONFIG_CRYPTO_XXHASH is not set
# end of Hashes, digests, and MACs

#
# CRCs (cyclic redundancy checks)
#
CONFIG_CRYPTO_CRC32C=y
CONFIG_CRYPTO_CRC32=y
CONFIG_CRYPTO_CRCT10DIF=y
CONFIG_CRYPTO_CRC64_ROCKSOFT=y
# end of CRCs (cyclic redundancy checks)

#
# Compression
#
CONFIG_CRYPTO_DEFLATE=y
CONFIG_CRYPTO_LZO=y
CONFIG_CRYPTO_842=y
CONFIG_CRYPTO_LZ4=y
CONFIG_CRYPTO_LZ4HC=y
# CONFIG_CRYPTO_ZSTD is not set
# end of Compression

#
# Random number generation
#
# CONFIG_CRYPTO_ANSI_CPRNG is not set
CONFIG_CRYPTO_DRBG_MENU=y
CONFIG_CRYPTO_DRBG_HMAC=y
# CONFIG_CRYPTO_DRBG_HASH is not set
CONFIG_CRYPTO_DRBG_CTR=y
CONFIG_CRYPTO_DRBG=y
CONFIG_CRYPTO_JITTERENTROPY=y
# end of Random number generation

#
# Userspace interface
#
# end of Userspace interface

CONFIG_CRYPTO_HASH_INFO=y
CONFIG_CRYPTO_HW=y
# CONFIG_CRYPTO_DEV_ALLWINNER is not set
# CONFIG_CRYPTO_DEV_SL3516 is not set
# CONFIG_CRYPTO_DEV_EXYNOS_RNG is not set
# CONFIG_CRYPTO_DEV_S5P is not set
# CONFIG_CRYPTO_DEV_ATMEL_AES is not set
# CONFIG_CRYPTO_DEV_ATMEL_TDES is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA is not set
# CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
# CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
# CONFIG_CRYPTO_DEV_QCE is not set
# CONFIG_CRYPTO_DEV_QCOM_RNG is not set
# CONFIG_CRYPTO_DEV_IMGTEC_HASH is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_AES is not set
# CONFIG_CRYPTO_DEV_ZYNQMP_SHA3 is not set
CONFIG_CRYPTO_DEV_VIRTIO=y
# CONFIG_CRYPTO_DEV_SAFEXCEL is not set
# CONFIG_CRYPTO_DEV_CCREE is not set
# CONFIG_CRYPTO_DEV_HISI_SEC is not set
CONFIG_CRYPTO_DEV_AMLOGIC_GXL=y
CONFIG_CRYPTO_DEV_AMLOGIC_GXL_DEBUG=y
# CONFIG_CRYPTO_DEV_SA2UL is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_AES_SM4 is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_ECC is not set
# CONFIG_CRYPTO_DEV_KEEMBAY_OCS_HCU is not set
# CONFIG_CRYPTO_DEV_ASPEED is not set
CONFIG_ASYMMETRIC_KEY_TYPE=y
CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=y
CONFIG_X509_CERTIFICATE_PARSER=y
CONFIG_PKCS8_PRIVATE_KEY_PARSER=y
# CONFIG_PKCS7_MESSAGE_PARSER is not set

#
# Certificates for signature checking
#
# CONFIG_SYSTEM_TRUSTED_KEYRING is not set
CONFIG_SYSTEM_BLACKLIST_KEYRING=y
CONFIG_SYSTEM_BLACKLIST_HASH_LIST=""
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
CONFIG_CORDIC=y
CONFIG_PRIME_NUMBERS=y
CONFIG_RATIONAL=y
CONFIG_GENERIC_PCI_IOMAP=y

#
# Crypto library routines
#
CONFIG_CRYPTO_LIB_UTILS=y
CONFIG_CRYPTO_LIB_AES=y
CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA_GENERIC=y
CONFIG_CRYPTO_LIB_CHACHA=y
CONFIG_CRYPTO_LIB_CURVE25519_GENERIC=y
CONFIG_CRYPTO_LIB_CURVE25519=y
CONFIG_CRYPTO_LIB_DES=y
CONFIG_CRYPTO_LIB_POLY1305_RSIZE=1
CONFIG_CRYPTO_LIB_POLY1305_GENERIC=y
# CONFIG_CRYPTO_LIB_POLY1305 is not set
# CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
CONFIG_CRYPTO_LIB_SHA1=y
CONFIG_CRYPTO_LIB_SHA256=y
# end of Crypto library routines

CONFIG_CRC_CCITT=y
CONFIG_CRC16=y
CONFIG_CRC_T10DIF=y
CONFIG_CRC64_ROCKSOFT=y
CONFIG_CRC_ITU_T=y
CONFIG_CRC32=y
# CONFIG_CRC32_SELFTEST is not set
# CONFIG_CRC32_SLICEBY8 is not set
# CONFIG_CRC32_SLICEBY4 is not set
# CONFIG_CRC32_SARWATE is not set
CONFIG_CRC32_BIT=y
CONFIG_CRC64=y
CONFIG_CRC4=y
CONFIG_CRC7=y
CONFIG_LIBCRC32C=y
CONFIG_CRC8=y
CONFIG_XXHASH=y
# CONFIG_RANDOM32_SELFTEST is not set
CONFIG_842_COMPRESS=y
CONFIG_842_DECOMPRESS=y
CONFIG_ZLIB_INFLATE=y
CONFIG_ZLIB_DEFLATE=y
CONFIG_LZO_COMPRESS=y
CONFIG_LZO_DECOMPRESS=y
CONFIG_LZ4_COMPRESS=y
CONFIG_LZ4HC_COMPRESS=y
CONFIG_LZ4_DECOMPRESS=y
CONFIG_ZSTD_COMMON=y
CONFIG_ZSTD_DECOMPRESS=y
CONFIG_XZ_DEC=y
# CONFIG_XZ_DEC_X86 is not set
CONFIG_XZ_DEC_POWERPC=y
CONFIG_XZ_DEC_IA64=y
CONFIG_XZ_DEC_ARM=y
# CONFIG_XZ_DEC_ARMTHUMB is not set
CONFIG_XZ_DEC_SPARC=y
# CONFIG_XZ_DEC_MICROLZMA is not set
CONFIG_XZ_DEC_BCJ=y
CONFIG_XZ_DEC_TEST=y
CONFIG_DECOMPRESS_XZ=y
CONFIG_DECOMPRESS_ZSTD=y
CONFIG_GENERIC_ALLOCATOR=y
CONFIG_REED_SOLOMON=y
CONFIG_REED_SOLOMON_ENC8=y
CONFIG_REED_SOLOMON_DEC8=y
CONFIG_ASSOCIATIVE_ARRAY=y
CONFIG_HAS_IOMEM=y
CONFIG_HAS_DMA=y
CONFIG_NEED_DMA_MAP_STATE=y
CONFIG_DMA_DECLARE_COHERENT=y
CONFIG_ARCH_HAS_SETUP_DMA_OPS=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE=y
CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU=y
CONFIG_ARCH_HAS_DMA_PREP_COHERENT=y
CONFIG_DMA_NONCOHERENT_MMAP=y
CONFIG_DMA_COHERENT_POOL=y
CONFIG_DMA_DIRECT_REMAP=y
CONFIG_DMA_API_DEBUG=y
CONFIG_DMA_API_DEBUG_SG=y
# CONFIG_DMA_MAP_BENCHMARK is not set
CONFIG_SGL_ALLOC=y
# CONFIG_CPUMASK_OFFSTACK is not set
# CONFIG_FORCE_NR_CPUS is not set
CONFIG_GLOB=y
CONFIG_GLOB_SELFTEST=y
CONFIG_GENERIC_ATOMIC64=y
CONFIG_CLZ_TAB=y
# CONFIG_IRQ_POLL is not set
CONFIG_MPILIB=y
CONFIG_SIGNATURE=y
CONFIG_LIBFDT=y
CONFIG_OID_REGISTRY=y
CONFIG_STACKDEPOT=y
# CONFIG_PARMAN is not set
# CONFIG_OBJAGG is not set
# end of Library routines

#
# Kernel hacking
#

#
# printk and dmesg options
#
CONFIG_PRINTK_TIME=y
CONFIG_PRINTK_CALLER=y
CONFIG_STACKTRACE_BUILD_ID=y
CONFIG_CONSOLE_LOGLEVEL_DEFAULT=7
CONFIG_CONSOLE_LOGLEVEL_QUIET=4
CONFIG_MESSAGE_LOGLEVEL_DEFAULT=4
# CONFIG_BOOT_PRINTK_DELAY is not set
# CONFIG_DYNAMIC_DEBUG is not set
# CONFIG_DYNAMIC_DEBUG_CORE is not set
# CONFIG_SYMBOLIC_ERRNAME is not set
# end of printk and dmesg options

CONFIG_DEBUG_KERNEL=y
CONFIG_DEBUG_MISC=y

#
# Compile-time checks and compiler options
#
CONFIG_DEBUG_INFO=y
CONFIG_AS_HAS_NON_CONST_LEB128=y
# CONFIG_DEBUG_INFO_NONE is not set
# CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
# CONFIG_DEBUG_INFO_DWARF4 is not set
CONFIG_DEBUG_INFO_DWARF5=y
# CONFIG_DEBUG_INFO_REDUCED is not set
# CONFIG_DEBUG_INFO_COMPRESSED is not set
# CONFIG_DEBUG_INFO_SPLIT is not set
CONFIG_DEBUG_INFO_BTF=y
CONFIG_PAHOLE_HAS_SPLIT_BTF=y
# CONFIG_GDB_SCRIPTS is not set
CONFIG_FRAME_WARN=1024
CONFIG_STRIP_ASM_SYMS=y
# CONFIG_READABLE_ASM is not set
CONFIG_HEADERS_INSTALL=y
CONFIG_DEBUG_SECTION_MISMATCH=y
CONFIG_SECTION_MISMATCH_WARN_ONLY=y
# CONFIG_DEBUG_FORCE_FUNCTION_ALIGN_64B is not set
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
CONFIG_DEBUG_FS_DISALLOW_MOUNT=y
# CONFIG_DEBUG_FS_ALLOW_NONE is not set
CONFIG_HAVE_ARCH_KGDB=y
CONFIG_KGDB=y
CONFIG_KGDB_TESTS=y
# CONFIG_KGDB_TESTS_ON_BOOT is not set
CONFIG_KGDB_KDB=y
CONFIG_KDB_DEFAULT_ENABLE=0x1
CONFIG_KDB_CONTINUE_CATASTROPHIC=0
# CONFIG_UBSAN is not set
CONFIG_HAVE_KCSAN_COMPILER=y
# end of Generic Kernel Debugging Instruments

#
# Networking Debugging
#
# end of Networking Debugging

#
# Memory Debugging
#
CONFIG_PAGE_EXTENSION=y
CONFIG_DEBUG_PAGEALLOC=y
CONFIG_DEBUG_PAGEALLOC_ENABLE_DEFAULT=y
# CONFIG_DEBUG_SLAB is not set
# CONFIG_PAGE_OWNER is not set
CONFIG_PAGE_POISONING=y
# CONFIG_DEBUG_OBJECTS is not set
CONFIG_SHRINKER_DEBUG=y
CONFIG_HAVE_DEBUG_KMEMLEAK=y
# CONFIG_DEBUG_KMEMLEAK is not set
# CONFIG_DEBUG_STACK_USAGE is not set
# CONFIG_SCHED_STACK_END_CHECK is not set
CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VM_IRQSOFF=y
CONFIG_DEBUG_VM=y
# CONFIG_DEBUG_VM_MAPLE_TREE is not set
# CONFIG_DEBUG_VM_RB is not set
# CONFIG_DEBUG_VM_PGFLAGS is not set
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_MEMORY_INIT=y
CONFIG_DEBUG_PER_CPU_MAPS=y
CONFIG_DEBUG_KMAP_LOCAL=y
# CONFIG_DEBUG_HIGHMEM is not set
CONFIG_HAVE_DEBUG_STACKOVERFLOW=y
CONFIG_DEBUG_STACKOVERFLOW=y
CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=y
# end of Memory Debugging

CONFIG_DEBUG_SHIRQ=y

#
# Debug Oops, Lockups and Hangs
#
# CONFIG_PANIC_ON_OOPS is not set
CONFIG_PANIC_ON_OOPS_VALUE=0
CONFIG_PANIC_TIMEOUT=0
CONFIG_LOCKUP_DETECTOR=y
CONFIG_SOFTLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
# CONFIG_DETECT_HUNG_TASK is not set
CONFIG_WQ_WATCHDOG=y
# end of Debug Oops, Lockups and Hangs

#
# Scheduler Debugging
#
# end of Scheduler Debugging

CONFIG_DEBUG_TIMEKEEPING=y

#
# Lock Debugging (spinlocks, mutexes, etc...)
#
CONFIG_LOCK_DEBUGGING_SUPPORT=y
# CONFIG_PROVE_LOCKING is not set
# CONFIG_LOCK_STAT is not set
CONFIG_DEBUG_RT_MUTEXES=y
# CONFIG_DEBUG_SPINLOCK is not set
# CONFIG_DEBUG_MUTEXES is not set
# CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
# CONFIG_DEBUG_RWSEMS is not set
# CONFIG_DEBUG_LOCK_ALLOC is not set
CONFIG_DEBUG_ATOMIC_SLEEP=y
# CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
CONFIG_LOCK_TORTURE_TEST=y
CONFIG_WW_MUTEX_SELFTEST=y
CONFIG_SCF_TORTURE_TEST=y
# end of Lock Debugging (spinlocks, mutexes, etc...)

# CONFIG_DEBUG_IRQFLAGS is not set
CONFIG_STACKTRACE=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_KOBJECT=y

#
# Debug kernel data structures
#
CONFIG_DEBUG_LIST=y
CONFIG_DEBUG_PLIST=y
CONFIG_DEBUG_SG=y
# CONFIG_DEBUG_NOTIFIERS is not set
CONFIG_BUG_ON_DATA_CORRUPTION=y
CONFIG_DEBUG_MAPLE_TREE=y
# end of Debug kernel data structures

CONFIG_DEBUG_CREDENTIALS=y

#
# RCU Debugging
#
CONFIG_TORTURE_TEST=y
CONFIG_RCU_SCALE_TEST=y
CONFIG_RCU_TORTURE_TEST=y
CONFIG_RCU_REF_SCALE_TEST=y
CONFIG_RCU_CPU_STALL_TIMEOUT=21
CONFIG_RCU_EXP_CPU_STALL_TIMEOUT=0
CONFIG_RCU_TRACE=y
# CONFIG_RCU_EQS_DEBUG is not set
# end of RCU Debugging

CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
CONFIG_TRACE_CLOCK=y
CONFIG_TRACING_SUPPORT=y
# CONFIG_FTRACE is not set
# CONFIG_SAMPLES is not set

#
# arc Debugging
#
CONFIG_16KSTACKS=y
# end of arc Debugging

#
# Kernel Testing and Coverage
#
CONFIG_KUNIT=y
CONFIG_KUNIT_DEBUGFS=y
CONFIG_KUNIT_TEST=y
CONFIG_KUNIT_EXAMPLE_TEST=y
CONFIG_KUNIT_ALL_TESTS=y
CONFIG_KUNIT_DEFAULT_ENABLED=y
CONFIG_NOTIFIER_ERROR_INJECTION=y
# CONFIG_PM_NOTIFIER_ERROR_INJECT is not set
# CONFIG_OF_RECONFIG_NOTIFIER_ERROR_INJECT is not set
# CONFIG_FAULT_INJECTION is not set
CONFIG_CC_HAS_SANCOV_TRACE_PC=y
# CONFIG_RUNTIME_TESTING_MENU is not set
# end of Kernel Testing and Coverage

#
# Rust hacking
#
# end of Rust hacking

# CONFIG_WARN_MISSING_DOCUMENTS is not set
# CONFIG_WARN_ABI_ERRORS is not set
# end of Kernel hacking

--HWmUydCSCUNB5659--
