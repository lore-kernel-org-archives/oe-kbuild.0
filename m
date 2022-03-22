Content-Type: multipart/mixed; boundary="===============0517026489710640749=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [net:master 11/20] net/netlink/af_netlink.c:164:19: warning: Shifting signed 32-bit value by 31 bits is undefined behaviour. See condition at line 162. [shiftTooManyBitsSigned]
Date: Wed, 23 Mar 2022 06:11:57 +0800
Message-ID: <202203230601.2uPnqatg-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0517026489710640749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: netdev(a)vger.kernel.org
TO: Petr Machata <petrm@nvidia.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Ido Schimmel <idosch@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git master
head:   6a7d8cff4a3301087dd139293e9bddcf63827282
commit: 0caf6d9922192dd1afa8dc2131abfb4df1443b9f [11/20] af_netlink: Fix sh=
ift out of bounds in group mask calculation
:::::: branch date: 12 hours ago
:::::: commit date: 4 days ago
compiler: h8300-linux-gcc (GCC) 11.2.0

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

7e3ce05e7f65037 Marcelo Ricardo Leitner 2021-02-03  159  =

b57ef81ff8ffb83 stephen hemminger       2011-12-22  160  static inline u32 =
netlink_group_mask(u32 group)
d629b836d151d43 Patrick McHardy         2005-08-14  161  {
0caf6d9922192dd Petr Machata            2022-03-17 @162  	if (group > 32)
0caf6d9922192dd Petr Machata            2022-03-17  163  		return 0;
d629b836d151d43 Patrick McHardy         2005-08-14 @164  	return group ? 1 =
<< (group - 1) : 0;
d629b836d151d43 Patrick McHardy         2005-08-14  165  }
d629b836d151d43 Patrick McHardy         2005-08-14  166  =


:::::: The code@line 164 was first introduced by commit
:::::: d629b836d151d43332492651dd841d32e57ebe3b [NETLINK]: Use group number=
s instead of bitmasks internally

:::::: TO: Patrick McHardy <kaber@trash.net>
:::::: CC: David S. Miller <davem@sunset.davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0517026489710640749==--

