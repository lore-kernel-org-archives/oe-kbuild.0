Content-Type: multipart/mixed; boundary="===============8389611795213430660=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ptp/ptp_ocp.c:915:3: warning: %d in format string (no. 1) requires 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sint]
Date: Tue, 14 Jun 2022 19:26:30 +0800
Message-ID: <202206141948.JFnOvH0c-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8389611795213430660==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: drivers/p=
tp/ptp_ocp.c:915:3: warning: %d in format string (no. 1) requires 'int' but=
 the argument type is 'unsigned int'. [invalidPrintfArgType_sint]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Jonathan Lemon <jonathan.lemon@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 1aa66a3a135a25bd8ce25165b4e550159a3dc849 ptp: ocp: Program the sign=
al generators via PTP_CLK_REQ_PEROUT
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
compiler: hppa-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 1aa66a3a135a25bd8ce25165b4e550159a3dc849
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/ptp/ptp_ocp.c:1618:18: warning: Boolean result is used in bitwis=
e operation. Clarify expression with parentheses. [clarifyCondition]
     if ((!!old_map ^ !!bp->pps_req_map) =3D=3D 0)
                    ^
>> drivers/ptp/ptp_ocp.c:915:3: warning: %d in format string (no. 1) requir=
es 'int' but the argument type is 'unsigned int'. [invalidPrintfArgType_sin=
t]
     sprintf(buf, "OUT: GEN%d", chan);
     ^
   drivers/ptp/ptp_ocp.c:2103:16: warning: Signed integer overflow for expr=
ession '0xffff<<(16-shift)'. [integerOverflow]
    mask =3D 0xffff << (16 - shift);
                  ^
   drivers/ptp/ptp_ocp.c:2101:21: note: Assignment 'shift=3Dsma_nr&1?0:16',=
 assigned value is 0
    shift =3D sma_nr & 1 ? 0 : 16;
                       ^
   drivers/ptp/ptp_ocp.c:2103:16: note: Integer overflow
    mask =3D 0xffff << (16 - shift);
                  ^
   drivers/ptp/ptp_ocp.c:2127:16: warning: Signed integer overflow for expr=
ession '0xffff<<(16-shift)'. [integerOverflow]
    mask =3D 0xffff << (16 - shift);
                  ^
   drivers/ptp/ptp_ocp.c:2125:21: note: Assignment 'shift=3Dsma_nr&1?0:16',=
 assigned value is 0
    shift =3D sma_nr & 1 ? 0 : 16;
                       ^
   drivers/ptp/ptp_ocp.c:2127:16: note: Integer overflow
    mask =3D 0xffff << (16 - shift);
                  ^

vim +915 drivers/ptp/ptp_ocp.c

773bda96492153 Jonathan Lemon 2021-08-03  903  =

1aa66a3a135a25 Jonathan Lemon 2022-03-10  904  static int
1aa66a3a135a25 Jonathan Lemon 2022-03-10  905  ptp_ocp_verify(struct ptp_cl=
ock_info *ptp_info, unsigned pin,
1aa66a3a135a25 Jonathan Lemon 2022-03-10  906  	       enum ptp_pin_functio=
n func, unsigned chan)
1aa66a3a135a25 Jonathan Lemon 2022-03-10  907  {
1aa66a3a135a25 Jonathan Lemon 2022-03-10  908  	struct ptp_ocp *bp =3D cont=
ainer_of(ptp_info, struct ptp_ocp, ptp_info);
1aa66a3a135a25 Jonathan Lemon 2022-03-10  909  	char buf[16];
1aa66a3a135a25 Jonathan Lemon 2022-03-10  910  =

1aa66a3a135a25 Jonathan Lemon 2022-03-10  911  	if (func !=3D PTP_PF_PEROUT)
1aa66a3a135a25 Jonathan Lemon 2022-03-10  912  		return -EOPNOTSUPP;
1aa66a3a135a25 Jonathan Lemon 2022-03-10  913  =

1aa66a3a135a25 Jonathan Lemon 2022-03-10  914  	if (chan)
1aa66a3a135a25 Jonathan Lemon 2022-03-10 @915  		sprintf(buf, "OUT: GEN%d",=
 chan);
1aa66a3a135a25 Jonathan Lemon 2022-03-10  916  	else
1aa66a3a135a25 Jonathan Lemon 2022-03-10  917  		sprintf(buf, "OUT: PHC");
1aa66a3a135a25 Jonathan Lemon 2022-03-10  918  =

1aa66a3a135a25 Jonathan Lemon 2022-03-10  919  	return ptp_ocp_sma_store(bp=
, buf, pin + 1);
1aa66a3a135a25 Jonathan Lemon 2022-03-10  920  }
1aa66a3a135a25 Jonathan Lemon 2022-03-10  921  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8389611795213430660==--

