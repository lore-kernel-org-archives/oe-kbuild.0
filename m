Content-Type: multipart/mixed; boundary="===============6073412689853081974=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/realtek/rtw89/debug.c:2123:29-32: ERROR: reference preceded by free on line 2116
Date: Sat, 18 Jun 2022 01:06:44 +0800
Message-ID: <202206180110.VYlYibNO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6073412689853081974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Ping-Ke Shih" <pkshih@realtek.com>
CC: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79fe0f863f920c5fcf9dea61676742f813f0b7a6
commit: e3ec7017f6a20d12ddd9fe23d345ebb7b8c104dd rtw89: add Realtek 802.11a=
x driver
date:   8 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 months ago
config: m68k-randconfig-c024-20220617 (https://download.01.org/0day-ci/arch=
ive/20220618/202206180110.VYlYibNO-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/realtek/rtw89/debug.c:2123:29-32: ERROR: reference =
preceded by free on line 2116
--
>> drivers/net/wireless/realtek/rtw89/pci.c:211:5-8: Unneeded variable: "cn=
t". Return "1" on line 273

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6073412689853081974==--

