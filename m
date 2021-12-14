Content-Type: multipart/mixed; boundary="===============4017788157211848220=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 6035/6644] drivers/crypto/marvell/octeontx2/otx2_cptpf_ucode.c:1807:41: sparse: sparse: invalid access past the end of 'mask' (16 16)
Date: Tue, 14 Dec 2021 20:51:58 +0800
Message-ID: <202112142026.s7O0WFDY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4017788157211848220==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Srujana Challa <schalla@marvell.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Shijith Thotton <sthotton@marvell.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   bcd5ddb85fad453da26afd5b3fca8ad931b5253d
commit: d9d7749773e8895aaedc11f1d2885a9eee5c73ac [6035/6644] crypto: octeon=
tx2 - add apis for custom engine groups
:::::: branch date: 10 hours ago
:::::: commit date: 3 days ago
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/2021121=
4/202112142026.s7O0WFDY-lkp(a)intel.com/config)
compiler: alpha-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3Dd9d7749773e8895aaedc11f1d2885a9eee5c73ac
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout d9d7749773e8895aaedc11f1d2885a9eee5c73ac
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
lpha SHELL=3D/bin/bash drivers/crypto/marvell/octeontx2/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/crypto/marvell/octeontx2/otx2_cptpf_ucode.c:1807:41: sparse: spa=
rse: invalid access past the end of 'mask' (16 16)

vim +/mask +1807 drivers/crypto/marvell/octeontx2/otx2_cptpf_ucode.c

d9d7749773e889 Srujana Challa 2021-12-01  1757  =

d9d7749773e889 Srujana Challa 2021-12-01  1758  void otx2_cpt_print_uc_dbg_=
info(struct otx2_cptpf_dev *cptpf)
d9d7749773e889 Srujana Challa 2021-12-01  1759  {
d9d7749773e889 Srujana Challa 2021-12-01  1760  	struct otx2_cpt_eng_grps *=
eng_grps =3D &cptpf->eng_grps;
d9d7749773e889 Srujana Challa 2021-12-01  1761  	struct otx2_cpt_eng_grp_in=
fo *mirrored_grp;
d9d7749773e889 Srujana Challa 2021-12-01  1762  	char engs_info[2 * OTX2_CP=
T_NAME_LENGTH];
d9d7749773e889 Srujana Challa 2021-12-01  1763  	struct otx2_cpt_eng_grp_in=
fo *grp;
d9d7749773e889 Srujana Challa 2021-12-01  1764  	struct otx2_cpt_engs_rsvd =
*engs;
d9d7749773e889 Srujana Challa 2021-12-01  1765  	u32 mask[4];
d9d7749773e889 Srujana Challa 2021-12-01  1766  	int i, j;
d9d7749773e889 Srujana Challa 2021-12-01  1767  =

d9d7749773e889 Srujana Challa 2021-12-01  1768  	pr_debug("Engine groups gl=
obal info");
d9d7749773e889 Srujana Challa 2021-12-01  1769  	pr_debug("max SE %d, max I=
E %d, max AE %d", eng_grps->avail.max_se_cnt,
d9d7749773e889 Srujana Challa 2021-12-01  1770  		 eng_grps->avail.max_ie_c=
nt, eng_grps->avail.max_ae_cnt);
d9d7749773e889 Srujana Challa 2021-12-01  1771  	pr_debug("free SE %d", eng=
_grps->avail.se_cnt);
d9d7749773e889 Srujana Challa 2021-12-01  1772  	pr_debug("free IE %d", eng=
_grps->avail.ie_cnt);
d9d7749773e889 Srujana Challa 2021-12-01  1773  	pr_debug("free AE %d", eng=
_grps->avail.ae_cnt);
d9d7749773e889 Srujana Challa 2021-12-01  1774  =

d9d7749773e889 Srujana Challa 2021-12-01  1775  	for (i =3D 0; i < OTX2_CPT=
_MAX_ENGINE_GROUPS; i++) {
d9d7749773e889 Srujana Challa 2021-12-01  1776  		grp =3D &eng_grps->grp[i];
d9d7749773e889 Srujana Challa 2021-12-01  1777  		pr_debug("engine_group%d,=
 state %s", i,
d9d7749773e889 Srujana Challa 2021-12-01  1778  			 grp->is_enabled ? "enab=
led" : "disabled");
d9d7749773e889 Srujana Challa 2021-12-01  1779  		if (grp->is_enabled) {
d9d7749773e889 Srujana Challa 2021-12-01  1780  			mirrored_grp =3D &eng_gr=
ps->grp[grp->mirror.idx];
d9d7749773e889 Srujana Challa 2021-12-01  1781  			pr_debug("Ucode0 filenam=
e %s, version %s",
d9d7749773e889 Srujana Challa 2021-12-01  1782  				 grp->mirror.is_ena ?
d9d7749773e889 Srujana Challa 2021-12-01  1783  					 mirrored_grp->ucode[0=
].filename :
d9d7749773e889 Srujana Challa 2021-12-01  1784  					 grp->ucode[0].filenam=
e,
d9d7749773e889 Srujana Challa 2021-12-01  1785  				 grp->mirror.is_ena ?
d9d7749773e889 Srujana Challa 2021-12-01  1786  					 mirrored_grp->ucode[0=
].ver_str :
d9d7749773e889 Srujana Challa 2021-12-01  1787  					 grp->ucode[0].ver_str=
);
d9d7749773e889 Srujana Challa 2021-12-01  1788  			if (is_2nd_ucode_used(gr=
p))
d9d7749773e889 Srujana Challa 2021-12-01  1789  				pr_debug("Ucode1 filena=
me %s, version %s",
d9d7749773e889 Srujana Challa 2021-12-01  1790  					 grp->ucode[1].filenam=
e,
d9d7749773e889 Srujana Challa 2021-12-01  1791  					 grp->ucode[1].ver_str=
);
d9d7749773e889 Srujana Challa 2021-12-01  1792  		}
d9d7749773e889 Srujana Challa 2021-12-01  1793  =

d9d7749773e889 Srujana Challa 2021-12-01  1794  		for (j =3D 0; j < OTX2_CP=
T_MAX_ETYPES_PER_GRP; j++) {
d9d7749773e889 Srujana Challa 2021-12-01  1795  			engs =3D &grp->engs[j];
d9d7749773e889 Srujana Challa 2021-12-01  1796  			if (engs->type) {
d9d7749773e889 Srujana Challa 2021-12-01  1797  				get_engs_info(grp, engs=
_info,
d9d7749773e889 Srujana Challa 2021-12-01  1798  					      2 * OTX2_CPT_NAM=
E_LENGTH, j);
d9d7749773e889 Srujana Challa 2021-12-01  1799  				pr_debug("Slot%d: %s", =
j, engs_info);
d9d7749773e889 Srujana Challa 2021-12-01  1800  				bitmap_to_arr32(mask, e=
ngs->bmap,
d9d7749773e889 Srujana Challa 2021-12-01  1801  						eng_grps->engs_num);
d9d7749773e889 Srujana Challa 2021-12-01  1802  				if (is_dev_otx2(cptpf->=
pdev))
d9d7749773e889 Srujana Challa 2021-12-01  1803  					pr_debug("Mask: %8.8x =
%8.8x %8.8x %8.8x",
d9d7749773e889 Srujana Challa 2021-12-01  1804  						 mask[3], mask[2], ma=
sk[1],
d9d7749773e889 Srujana Challa 2021-12-01  1805  						 mask[0]);
d9d7749773e889 Srujana Challa 2021-12-01  1806  				else
d9d7749773e889 Srujana Challa 2021-12-01 @1807  					pr_debug("Mask: %8.8x =
%8.8x %8.8x %8.8x %8.8x",

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4017788157211848220==--

