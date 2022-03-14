Content-Type: multipart/mixed; boundary="===============1038026776481252642=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [trondmy-nfs-2.6:linux-next 59/66] net/sunrpc/xprt.c:1690:18-28: ERROR: function xprt_dynamic_alloc_slot called on line 1728 inside lock on line 1722 but uses GFP_KERNEL
Date: Mon, 14 Mar 2022 11:41:33 +0800
Message-ID: <202203141129.Lt2sd2kq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1038026776481252642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: NeilBrown <neilb@suse.de>
CC: Trond Myklebust <trond.myklebust@hammerspace.com>

tree:   git://git.linux-nfs.org/projects/trondmy/nfs-2.6.git linux-next
head:   693486d5f8951780a9bb31f7fe935171a80010e4
commit: a721035477fb5fb8abc738fbe410b07c12af3dc5 [59/66] SUNRPC/xprt: async=
 tasks mustn't block waiting for memory
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/2022031=
4/202203141129.Lt2sd2kq-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> net/sunrpc/xprt.c:1690:18-28: ERROR: function xprt_dynamic_alloc_slot ca=
lled on line 1728 inside lock on line 1722 but uses GFP_KERNEL

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1038026776481252642==--

