Content-Type: multipart/mixed; boundary="===============8067046503389008945=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 2421/2766] drivers/net/ethernet/intel/iavf/iavf_adminq.c:554:18-26: Unneeded variable: "ret_code". Return "0" on line 562
Date: Thu, 16 Apr 2020 22:29:27 +0800
Message-ID: <202004162215.Wa0ud2Cl%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8067046503389008945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   a3ca59b9af21e68069555ffff1ad89bd2a7c40fc
commit: df823a8208c434eee6e4e9aa016c956d0968e2e2 [2421/2766] media: cec: re=
name CEC platform drivers config options
:::::: branch date: 10 hours ago
:::::: commit date: 28 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


coccinelle warnings: (new ones prefixed by >>)

>> drivers/net/ethernet/intel/iavf/iavf_adminq.c:554:18-26: Unneeded variab=
le: "ret_code". Return "0" on line 562

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8067046503389008945==--

