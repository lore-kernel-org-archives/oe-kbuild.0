Content-Type: multipart/mixed; boundary="===============8123455569570288722=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-5.10 84/98] net/sunrpc/xprt.c:1638:18-28: ERROR: function xprt_dynamic_alloc_slot called on line 1676 inside lock on line 1670 but uses GFP_KERNEL
Date: Sun, 10 Apr 2022 06:28:49 +0800
Message-ID: <202204100613.X39TrqbE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8123455569570288722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-5.10
head:   9008a65557dbcc00c1a0874eae6fd0601dece970
commit: ab3f07e5a52e2eeeede7ecb0f35092f496bc6120 [84/98] SUNRPC/xprt: async=
 tasks mustn't block waiting for memory
:::::: branch date: 6 hours ago
:::::: commit date: 8 hours ago
config: x86_64-randconfig-c022 (https://download.01.org/0day-ci/archive/202=
20410/202204100613.X39TrqbE-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> net/sunrpc/xprt.c:1638:18-28: ERROR: function xprt_dynamic_alloc_slot ca=
lled on line 1676 inside lock on line 1670 but uses GFP_KERNEL

Please review and possibly fold the followup patch.

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8123455569570288722==--

