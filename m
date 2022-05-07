Content-Type: multipart/mixed; boundary="===============3159472823382162134=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ptp/ptp_ocp.c:1780:16: warning: Signed integer overflow for expression '0xffff<<(16-shift)'. [integerOverflow]
Date: Sat, 07 May 2022 23:02:59 +0800
Message-ID: <202205072207.WZjLDboz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3159472823382162134==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Lemon <jonathan.lemon@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b97bac0756a81cda5afd45417a99b5bccdcff67
commit: a509a7c61e3b7a16054dafdc5ae804e9a859a0a9 ptp: ocp: Add support for =
selectable SMA directions.
date:   8 weeks ago
:::::: branch date: 17 hours ago
:::::: commit date: 8 weeks ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a509a7c61e3b7a16054dafdc5ae804e9a859a0a9
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/ptp/ptp_ocp.c:1659:26: warning: Either the condition 'default_id=
x>=3D0' is redundant or the array 'ptp_ocp_sma_in[8]' is accessed at index =
8, which is out of bounds. [arrayIndexOutOfBoundsCond]
              ptp_ocp_sma_in[default_idx].name);
                            ^
   drivers/ptp/ptp_ocp.c:1657:26: note: Assuming that condition 'default_id=
x>=3D0' is not redundant
    if (!val && default_idx >=3D 0)
                            ^
   drivers/ptp/ptp_ocp.c:1659:26: note: Array index out of bounds
              ptp_ocp_sma_in[default_idx].name);
                            ^
   drivers/ptp/ptp_ocp.c:1356:18: warning: Boolean result is used in bitwis=
e operation. Clarify expression with parentheses. [clarifyCondition]
     if ((!!old_map ^ !!bp->pps_req_map) =3D=3D 0)
                    ^
>> drivers/ptp/ptp_ocp.c:1780:16: warning: Signed integer overflow for expr=
ession '0xffff<<(16-shift)'. [integerOverflow]
    mask =3D 0xffff << (16 - shift);
                  ^
   drivers/ptp/ptp_ocp.c:1778:21: note: Assignment 'shift=3Dsma_nr&1?0:16',=
 assigned value is 0
    shift =3D sma_nr & 1 ? 0 : 16;
                       ^
   drivers/ptp/ptp_ocp.c:1780:16: note: Integer overflow
    mask =3D 0xffff << (16 - shift);
                  ^
   drivers/ptp/ptp_ocp.c:1804:16: warning: Signed integer overflow for expr=
ession '0xffff<<(16-shift)'. [integerOverflow]
    mask =3D 0xffff << (16 - shift);
                  ^
   drivers/ptp/ptp_ocp.c:1802:21: note: Assignment 'shift=3Dsma_nr&1?0:16',=
 assigned value is 0
    shift =3D sma_nr & 1 ? 0 : 16;
                       ^
   drivers/ptp/ptp_ocp.c:1804:16: note: Integer overflow
    mask =3D 0xffff << (16 - shift);
                  ^

vim +1780 drivers/ptp/ptp_ocp.c

e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1769  =

e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1770  static void
a509a7c61e3b7a Jonathan Lemon 2022-03-10  1771  ptp_ocp_sma_store_output(st=
ruct ptp_ocp *bp, int sma_nr, u32 val)
e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1772  {
a509a7c61e3b7a Jonathan Lemon 2022-03-10  1773  	u32 reg, mask, shift;
e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1774  	unsigned long flags;
a509a7c61e3b7a Jonathan Lemon 2022-03-10  1775  	u32 __iomem *gpio;
a509a7c61e3b7a Jonathan Lemon 2022-03-10  1776  =

a509a7c61e3b7a Jonathan Lemon 2022-03-10  1777  	gpio =3D sma_nr > 2 ? &bp-=
>sma_map1->gpio2 : &bp->sma_map2->gpio2;
a509a7c61e3b7a Jonathan Lemon 2022-03-10  1778  	shift =3D sma_nr & 1 ? 0 :=
 16;
e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1779  =

e1daf0ec73b2e9 Jonathan Lemon 2021-09-14 @1780  	mask =3D 0xffff << (16 - s=
hift);
e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1781  =

e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1782  	spin_lock_irqsave(&bp->loc=
k, flags);
e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1783  =

a509a7c61e3b7a Jonathan Lemon 2022-03-10  1784  	reg =3D ioread32(gpio);
a509a7c61e3b7a Jonathan Lemon 2022-03-10  1785  	reg =3D (reg & mask) | (va=
l << shift);
6baf2925424a83 Jonathan Lemon 2021-09-14  1786  =

a509a7c61e3b7a Jonathan Lemon 2022-03-10  1787  	__handle_signal_outputs(bp=
, reg);
6baf2925424a83 Jonathan Lemon 2021-09-14  1788  =

a509a7c61e3b7a Jonathan Lemon 2022-03-10  1789  	iowrite32(reg, gpio);
e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1790  =

e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1791  	spin_unlock_irqrestore(&bp=
->lock, flags);
e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1792  }
e1daf0ec73b2e9 Jonathan Lemon 2021-09-14  1793  =


:::::: The code at line 1780 was first introduced by commit
:::::: e1daf0ec73b2e9170d7df1e5cda409de3535bac2 ptp: ocp: Add SMA selector =
and controls

:::::: TO: Jonathan Lemon <jonathan.lemon@gmail.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3159472823382162134==--

