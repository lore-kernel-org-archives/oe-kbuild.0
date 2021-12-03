Content-Type: multipart/mixed; boundary="===============1205042694673697682=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/sched/sch_cake.c:1094 cake_tcph_may_drop() warn: masked condition '(((tcph)->words[3]) & (__builtin_bswap32(((255787008))))) != 4096' is always true.
Date: Sat, 04 Dec 2021 03:43:41 +0800
Message-ID: <202112040327.ywgPBpDI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1205042694673697682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5f58da2befa58edf3a70b91ed87ed9bf77f1e70e
commit: d991bb1c8da842a2a0b9dc83b1005e655783f861 include/linux/compiler-gcc=
.h: sparse can do constant folding of __builtin_bswap*()
date:   7 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-m001-20211203 (https://download.01.org/0day-ci/ar=
chive/20211204/202112040327.ywgPBpDI-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/sched/sch_cake.c:1094 cake_tcph_may_drop() warn: masked condition '(((t=
cph)->words[3]) & (__builtin_bswap32(((255787008))))) !=3D 4096' is always =
true.

Old smatch warnings:
net/sched/sch_cake.c:776 cake_hash() error: buffer overflow 'q->flows' 1024=
 <=3D 1030
net/sched/sch_cake.c:788 cake_hash() error: buffer overflow 'q->flows' 1024=
 <=3D 1030
net/sched/sch_cake.c:811 cake_hash() error: buffer overflow 'q->hosts' 1024=
 <=3D 1030
net/sched/sch_cake.c:814 cake_hash() error: buffer overflow 'q->hosts' 1024=
 <=3D 1030
net/sched/sch_cake.c:834 cake_hash() error: buffer overflow 'q->hosts' 1024=
 <=3D 1030
net/sched/sch_cake.c:837 cake_hash() error: buffer overflow 'q->hosts' 1024=
 <=3D 1030
net/sched/sch_cake.c:1353 cake_overhead() warn: should 'off << 16' be a 64 =
bit type?

vim +1094 net/sched/sch_cake.c

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1076  =

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1077  static bo=
ol cake_tcph_may_drop(const struct tcphdr *tcph,
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1078  			      =
 u32 tstamp_new, u32 tsecr_new)
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1079  {
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1080  	/* inspi=
red by tcp_parse_options in tcp_input.c */
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1081  	int leng=
th =3D __tcp_hdrlen(tcph) - sizeof(struct tcphdr);
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1082  	const u8=
 *ptr =3D (const u8 *)(tcph + 1);
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1083  	u32 tsta=
mp, tsecr;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1084  =

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1085  	/* 3 res=
erved flags must be unset to avoid future breakage
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1086  	 * ACK m=
ust be set
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1087  	 * ECE/C=
WR are handled separately
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1088  	 * All o=
ther flags URG/PSH/RST/SYN/FIN must be unset
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1089  	 * 0x0FF=
F0000 =3D all TCP flags (confirm ACK=3D1, others zero)
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1090  	 * 0x00C=
00000 =3D CWR/ECE (handled separately)
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1091  	 * 0x0F3=
F0000 =3D 0x0FFF0000 & ~0x00C00000
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1092  	 */
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1093  	if (((tc=
p_flag_word(tcph) &
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06 @1094  	      cp=
u_to_be32(0x0F3F0000)) !=3D TCP_FLAG_ACK))
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1095  		return =
false;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1096  =

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1097  	while (l=
ength > 0) {
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1098  		int opc=
ode =3D *ptr++;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1099  		int ops=
ize;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1100  =

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1101  		if (opc=
ode =3D=3D TCPOPT_EOL)
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1102  			break;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1103  		if (opc=
ode =3D=3D TCPOPT_NOP) {
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1104  			length=
--;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1105  			contin=
ue;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1106  		}
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1107  		opsize =
=3D *ptr++;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1108  		if (ops=
ize < 2 || opsize > length)
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1109  			break;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1110  =

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1111  		switch =
(opcode) {
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1112  		case TC=
POPT_MD5SIG: /* doesn't influence state */
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1113  			break;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1114  =

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1115  		case TC=
POPT_SACK: /* stricter checking performed later */
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1116  			if (op=
size % 8 !=3D 2)
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1117  				retur=
n false;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1118  			break;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1119  =

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1120  		case TC=
POPT_TIMESTAMP:
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1121  			/* onl=
y drop timestamps lower than new */
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1122  			if (op=
size !=3D TCPOLEN_TIMESTAMP)
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1123  				retur=
n false;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1124  			tstamp=
 =3D get_unaligned_be32(ptr);
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1125  			tsecr =
=3D get_unaligned_be32(ptr + 4);
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1126  			if (af=
ter(tstamp, tstamp_new) ||
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1127  			    af=
ter(tsecr, tsecr_new))
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1128  				retur=
n false;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1129  			break;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1130  =

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1131  		case TC=
POPT_MSS:  /* these should only be set on SYN */
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1132  		case TC=
POPT_WINDOW:
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1133  		case TC=
POPT_SACK_PERM:
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1134  		case TC=
POPT_FASTOPEN:
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1135  		case TC=
POPT_EXP:
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1136  		default=
: /* don't drop if any unknown options are present */
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1137  			return=
 false;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1138  		}
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1139  =

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1140  		ptr +=
=3D opsize - 2;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1141  		length =
-=3D opsize;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1142  	}
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1143  =

8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1144  	return t=
rue;
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1145  }
8b7138814f2993 Toke H=C3=B8iland-J=C3=B8rgensen 2018-07-06  1146  =


:::::: The code at line 1094 was first introduced by commit
:::::: 8b7138814f29933898ecd31dfc83e35a30ee69f5 sch_cake: Add optional ACK =
filter

:::::: TO: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1205042694673697682==--

