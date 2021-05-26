Content-Type: multipart/mixed; boundary="===============2183540421335661409=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next v6 3/3] net: ethernet: rmnet: Add support for MAPv5 egress packets
Date: Thu, 27 May 2021 01:20:29 +0800
Message-ID: <202105270144.LHN9VB3i-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2183540421335661409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1622040882-27526-4-git-send-email-sharathv@codeaurora.org>
References: <1622040882-27526-4-git-send-email-sharathv@codeaurora.org>
TO: Sharath Chandra Vurukala <sharathv@codeaurora.org>
TO: davem(a)davemloft.net
TO: kuba(a)kernel.org
TO: elder(a)kernel.org
TO: cpratapa(a)codeaurora.org
TO: netdev(a)vger.kernel.org
TO: linux-kernel(a)vger.kernel.org
CC: Sharath Chandra Vurukala <sharathv@codeaurora.org>

Hi Sharath,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Sharath-Chandra-Vurukala/n=
et-qualcomm-rmnet-Enable-Mapv5/20210526-225721
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
e4e92ee78702b13ad55118d8b66f06e1aef62586
:::::: branch date: 2 hours ago
:::::: commit date: 2 hours ago
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c: linux/bitfield.h i=
s included more than once.

Please review and possibly fold the followup patch.

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2183540421335661409==--

