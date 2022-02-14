Content-Type: multipart/mixed; boundary="===============3215668150522236728=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next] net: prestera: acl: add multi-chain support offload
Date: Tue, 15 Feb 2022 06:36:11 +0800
Message-ID: <202202150603.kEIYS5g4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3215668150522236728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1644826807-15770-1-git-send-email-volodymyr.mytnyk@plvision=
.eu>
References: <1644826807-15770-1-git-send-email-volodymyr.mytnyk@plvision.=
eu>
TO: Volodymyr Mytnyk <volodymyr.mytnyk@plvision.eu>

Hi Volodymyr,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/0day-ci/linux/commits/Volodymyr-Mytnyk/net-prest=
era-acl-add-multi-chain-support-offload/20220214-162249
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
867b1db874c93ceb86f9e10ef021e70c38cc4b4d
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: m68k-randconfig-m031-20220213 (https://download.01.org/0day-ci/arch=
ive/20220215/202202150603.kEIYS5g4-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/ethernet/marvell/prestera/prestera_acl.c:103 prestera_acl_chain=
_to_client() error: buffer overflow 'client_map' 3 <=3D 3

vim +/client_map +103 drivers/net/ethernet/marvell/prestera/prestera_acl.c

47327e198d42c77 Volodymyr Mytnyk 2021-11-30   91  =

4ae36a7c976197f Volodymyr Mytnyk 2022-02-14   92  int prestera_acl_chain_to=
_client(u32 chain_index, u32 *client)
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14   93  {
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14   94  	u32 client_map[] =3D {
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14   95  		PRESTERA_HW_COUNTER_CLI=
ENT_LOOKUP_0,
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14   96  		PRESTERA_HW_COUNTER_CLI=
ENT_LOOKUP_1,
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14   97  		PRESTERA_HW_COUNTER_CLI=
ENT_LOOKUP_2
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14   98  	};
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14   99  =

4ae36a7c976197f Volodymyr Mytnyk 2022-02-14  100  	if (chain_index > ARRAY_=
SIZE(client_map))
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14  101  		return -EINVAL;
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14  102  =

4ae36a7c976197f Volodymyr Mytnyk 2022-02-14 @103  	*client =3D client_map[c=
hain_index];
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14  104  	return 0;
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14  105  }
4ae36a7c976197f Volodymyr Mytnyk 2022-02-14  106  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3215668150522236728==--

