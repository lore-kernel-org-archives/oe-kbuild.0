Content-Type: multipart/mixed; boundary="===============7130890890702878953=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/ptp/ptp_ocp.c:1236:18: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses. [clarifyCondition]
Date: Sat, 07 May 2022 21:21:06 +0800
Message-ID: <202205072132.gqB5mYBu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7130890890702878953==
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
commit: a62a56d04e63cf0ececb5dd339811f0a14b7e77c ptp: ocp: Enable 4th times=
tamper / PPS generator
date:   8 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 8 months ago
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout a62a56d04e63cf0ececb5dd339811f0a14b7e77c
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/ptp/ptp_ocp.c:1236:18: warning: Boolean result is used in bitwis=
e operation. Clarify expression with parentheses. [clarifyCondition]
     if ((!!old_map ^ !!bp->pps_req_map) =3D=3D 0)
                    ^

vim +1236 drivers/ptp/ptp_ocp.c

773bda96492153e Jonathan Lemon 2021-08-03  1219  =

773bda96492153e Jonathan Lemon 2021-08-03  1220  static int
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1221  ptp_ocp_ts_enable(void *pr=
iv, u32 req, bool enable)
773bda96492153e Jonathan Lemon 2021-08-03  1222  {
773bda96492153e Jonathan Lemon 2021-08-03  1223  	struct ptp_ocp_ext_src *e=
xt =3D priv;
773bda96492153e Jonathan Lemon 2021-08-03  1224  	struct ts_reg __iomem *re=
g =3D ext->mem;
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1225  	struct ptp_ocp *bp =3D ex=
t->bp;
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1226  =

a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1227  	if (ext =3D=3D bp->pps) {
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1228  		u32 old_map =3D bp->pps_=
req_map;
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1229  =

a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1230  		if (enable)
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1231  			bp->pps_req_map |=3D re=
q;
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1232  		else
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1233  			bp->pps_req_map &=3D ~r=
eq;
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1234  =

a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1235  		/* if no state change, j=
ust return */
a62a56d04e63cf0 Jonathan Lemon 2021-09-14 @1236  		if ((!!old_map ^ !!bp->p=
ps_req_map) =3D=3D 0)
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1237  			return 0;
a62a56d04e63cf0 Jonathan Lemon 2021-09-14  1238  	}
773bda96492153e Jonathan Lemon 2021-08-03  1239  =

773bda96492153e Jonathan Lemon 2021-08-03  1240  	if (enable) {
773bda96492153e Jonathan Lemon 2021-08-03  1241  		iowrite32(1, &reg->enabl=
e);
773bda96492153e Jonathan Lemon 2021-08-03  1242  		iowrite32(1, &reg->intr_=
mask);
773bda96492153e Jonathan Lemon 2021-08-03  1243  		iowrite32(1, &reg->intr);
773bda96492153e Jonathan Lemon 2021-08-03  1244  	} else {
773bda96492153e Jonathan Lemon 2021-08-03  1245  		iowrite32(0, &reg->intr_=
mask);
773bda96492153e Jonathan Lemon 2021-08-03  1246  		iowrite32(0, &reg->enabl=
e);
773bda96492153e Jonathan Lemon 2021-08-03  1247  	}
773bda96492153e Jonathan Lemon 2021-08-03  1248  =

773bda96492153e Jonathan Lemon 2021-08-03  1249  	return 0;
773bda96492153e Jonathan Lemon 2021-08-03  1250  }
773bda96492153e Jonathan Lemon 2021-08-03  1251  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7130890890702878953==--

