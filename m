Content-Type: multipart/mixed; boundary="===============0041627191431546855=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [jpirko-mlxsw:combined_queue 1/79] net/netlink/af_netlink.c:164:19: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour. See condition at line 162. [shiftTooManyBitsSigned]
Date: Mon, 14 Mar 2022 08:57:19 +0800
Message-ID: <202203140822.KLiAoEl9-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0041627191431546855==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Petr Machata <petrm@nvidia.com>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   a0b1c3a5cea0369e9eeb4307b520ced5440f7b13
commit: f28a2bcf94c86fa4686e72a37d467b6f5311a69d [1/79] af_netlink: Fix shi=
ft out of bounds in group mask calculation
:::::: branch date: 7 hours ago
:::::: commit date: 13 hours ago
compiler: xtensa-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   net/netlink/af_netlink.c:1387:2: warning: Non-boolean value returned fro=
m function returning bool [returnNonBoolInBooleanFunction]
    return nlk->flags & NETLINK_F_STRICT_CHK;
    ^
>> net/netlink/af_netlink.c:164:19: warning: Shifting signed 32-bit value b=
y 31 bits is undefined behaviour. See condition at line 162. [shiftTooManyB=
itsSigned]
    return group ? 1 << (group - 1) : 0;
                     ^
   net/netlink/af_netlink.c:162:12: note: Assuming that condition 'group>32=
' is not redundant
    if (group > 32)
              ^
   net/netlink/af_netlink.c:164:19: note: Shift
    return group ? 1 << (group - 1) : 0;
                     ^

vim +164 net/netlink/af_netlink.c

7e3ce05e7f6503 Marcelo Ricardo Leitner 2021-02-03  159  =

b57ef81ff8ffb8 stephen hemminger       2011-12-22  160  static inline u32 n=
etlink_group_mask(u32 group)
d629b836d151d4 Patrick McHardy         2005-08-14  161  {
f28a2bcf94c86f Petr Machata            2022-03-11 @162  	if (group > 32)
f28a2bcf94c86f Petr Machata            2022-03-11  163  		return 0;
d629b836d151d4 Patrick McHardy         2005-08-14 @164  	return group ? 1 <=
< (group - 1) : 0;
d629b836d151d4 Patrick McHardy         2005-08-14  165  }
d629b836d151d4 Patrick McHardy         2005-08-14  166  =


:::::: The code@line 164 was first introduced by commit
:::::: d629b836d151d43332492651dd841d32e57ebe3b [NETLINK]: Use group number=
s instead of bitmasks internally

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

---
0-DAY CI Kernel Test Service
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0041627191431546855==--

