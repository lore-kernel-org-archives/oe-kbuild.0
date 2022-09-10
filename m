Content-Type: multipart/mixed; boundary="===============8897811123927368351=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubious: x & !y
Date: Sun, 11 Sep 2022 07:39:28 +0800
Message-ID: <202209110736.QVAF6lYe-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8897811123927368351==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubious:=
 x & !y"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: WANG Xuerui <git@xen0n.name>
CC: Jianmin Lv <lvjianmin@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b96fbd602d35739b5cdb49baa02048f2c41fdab1
commit: 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb LoongArch: Add PCI control=
ler support
date:   4 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 4 weeks ago
config: loongarch-randconfig-s031-20220911 (https://download.01.org/0day-ci=
/archive/20220911/202209110736.QVAF6lYe-lkp(a)intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dl=
oongarch SHELL=3D/bin/bash drivers/infiniband/hw/hns/ drivers/isdn/hardware=
/mISDN/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c: note: in included file (thro=
ugh arch/loongarch/include/asm/io.h, arch/loongarch/include/asm/pgtable.h, =
arch/loongarch/include/asm/uaccess.h, ...):
   include/asm-generic/io.h:307:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
value @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:307:22: sparse:     expected unsigned long long=
 [usertype] value
   include/asm-generic/io.h:307:22: sparse:     got restricted __le64 [user=
type]
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:460:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:462:9: sparse: sparse: dubiou=
s: x & !y
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
value @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] value
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
value @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] value
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
value @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] value
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
value @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] value
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
value @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] value
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
value @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] value
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
   include/asm-generic/io.h:236:22: sparse: sparse: incorrect type in argum=
ent 1 (different base types) @@     expected unsigned long long [usertype] =
value @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:236:22: sparse:     expected unsigned long long=
 [usertype] value
   include/asm-generic/io.h:236:22: sparse:     got restricted __le64 [user=
type]
--
   drivers/isdn/hardware/mISDN/hfcmulti.c:452:22: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] value @@     got restricted __le32 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:452:22: sparse:     expected unsi=
gned int [usertype] value
   drivers/isdn/hardware/mISDN/hfcmulti.c:452:22: sparse:     got restricte=
d __le32 [usertype]
   drivers/isdn/hardware/mISDN/hfcmulti.c:457:22: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned short [=
usertype] value @@     got restricted __le16 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:457:22: sparse:     expected unsi=
gned short [usertype] value
   drivers/isdn/hardware/mISDN/hfcmulti.c:457:22: sparse:     got restricte=
d __le16 [usertype]
   drivers/isdn/hardware/mISDN/hfcmulti.c:472:24: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned int [us=
ertype] value @@     got restricted __le32 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:472:24: sparse:     expected unsi=
gned int [usertype] value
   drivers/isdn/hardware/mISDN/hfcmulti.c:472:24: sparse:     got restricte=
d __le32 [usertype]
   drivers/isdn/hardware/mISDN/hfcmulti.c:478:24: sparse: sparse: incorrect=
 type in argument 1 (different base types) @@     expected unsigned short [=
usertype] value @@     got restricted __le16 [usertype] @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:478:24: sparse:     expected unsi=
gned short [usertype] value
   drivers/isdn/hardware/mISDN/hfcmulti.c:478:24: sparse:     got restricte=
d __le16 [usertype]
   drivers/isdn/hardware/mISDN/hfcmulti.c:496:32: sparse: sparse: cast to r=
estricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:501:32: sparse: sparse: cast to r=
estricted __le16
   drivers/isdn/hardware/mISDN/hfcmulti.c:518:25: sparse: sparse: cast to r=
estricted __le32
   drivers/isdn/hardware/mISDN/hfcmulti.c:524:25: sparse: sparse: cast to r=
estricted __le16
>> drivers/isdn/hardware/mISDN/hfcmulti.c:1092:26: sparse: sparse: incorrec=
t type in argument 1 (different address spaces) @@     expected void const =
volatile [noderef] __iomem *addr @@     got void * @@
   drivers/isdn/hardware/mISDN/hfcmulti.c:1092:26: sparse:     expected voi=
d const volatile [noderef] __iomem *addr
   drivers/isdn/hardware/mISDN/hfcmulti.c:1092:26: sparse:     got void *

vim +309 drivers/infiniband/hw/hns/hns_roce_hw_v2.c

30b707886aeb89 Weihang Li    2020-09-10  294  =

30b707886aeb89 Weihang Li    2020-09-10  295  static int set_rwqe_data_seg(=
struct ib_qp *ibqp, const struct ib_send_wr *wr,
30b707886aeb89 Weihang Li    2020-09-10  296  			     struct hns_roce_v2_rc=
_send_wqe *rc_sq_wqe,
30b707886aeb89 Weihang Li    2020-09-10  297  			     unsigned int *sge_ind,
30b707886aeb89 Weihang Li    2020-09-10  298  			     unsigned int valid_nu=
m_sge)
30b707886aeb89 Weihang Li    2020-09-10  299  {
30b707886aeb89 Weihang Li    2020-09-10  300  	struct hns_roce_v2_wqe_data_=
seg *dseg =3D
30b707886aeb89 Weihang Li    2020-09-10  301  		(void *)rc_sq_wqe + sizeof(=
struct hns_roce_v2_rc_send_wqe);
30b707886aeb89 Weihang Li    2020-09-10  302  	struct hns_roce_qp *qp =3D t=
o_hr_qp(ibqp);
30b707886aeb89 Weihang Li    2020-09-10  303  	int j =3D 0;
30b707886aeb89 Weihang Li    2020-09-10  304  	int i;
30b707886aeb89 Weihang Li    2020-09-10  305  =

82600b2d3cd574 Wenpeng Liang 2022-05-12  306  	hr_reg_write(rc_sq_wqe, RC_S=
END_WQE_MSG_START_SGE_IDX,
30b707886aeb89 Weihang Li    2020-09-10  307  		     (*sge_ind) & (qp->sge.=
sge_cnt - 1));
30b707886aeb89 Weihang Li    2020-09-10  308  =

82600b2d3cd574 Wenpeng Liang 2022-05-12 @309  	hr_reg_write(rc_sq_wqe, RC_S=
END_WQE_INLINE,
e13026578b727b Lang Cheng    2021-06-18  310  		     !!(wr->send_flags & IB=
_SEND_INLINE));
30b707886aeb89 Weihang Li    2020-09-10  311  	if (wr->send_flags & IB_SEND=
_INLINE)
30b707886aeb89 Weihang Li    2020-09-10  312  		return set_rc_inl(qp, wr, r=
c_sq_wqe, sge_ind);
30b707886aeb89 Weihang Li    2020-09-10  313  =

54d6638765b0ed Xi Wang       2020-04-28  314  	if (valid_num_sge <=3D HNS_R=
OCE_SGE_IN_WQE) {
7bdee4158b3778 oulijun       2018-01-10  315  		for (i =3D 0; i < wr->num_s=
ge; i++) {
7bdee4158b3778 oulijun       2018-01-10  316  			if (likely(wr->sg_list[i].=
length)) {
7bdee4158b3778 oulijun       2018-01-10  317  				set_data_seg_v2(dseg, wr-=
>sg_list + i);
7bdee4158b3778 oulijun       2018-01-10  318  				dseg++;
7bdee4158b3778 oulijun       2018-01-10  319  			}
7bdee4158b3778 oulijun       2018-01-10  320  		}
7bdee4158b3778 oulijun       2018-01-10  321  	} else {
30b707886aeb89 Weihang Li    2020-09-10  322  		for (i =3D 0; i < wr->num_s=
ge && j < HNS_ROCE_SGE_IN_WQE; i++) {
7bdee4158b3778 oulijun       2018-01-10  323  			if (likely(wr->sg_list[i].=
length)) {
7bdee4158b3778 oulijun       2018-01-10  324  				set_data_seg_v2(dseg, wr-=
>sg_list + i);
7bdee4158b3778 oulijun       2018-01-10  325  				dseg++;
468d020e2f0286 Lijun Ou      2020-01-09  326  				j++;
7bdee4158b3778 oulijun       2018-01-10  327  			}
7bdee4158b3778 oulijun       2018-01-10  328  		}
7bdee4158b3778 oulijun       2018-01-10  329  =

0fd0175e30e487 Lang Cheng    2020-11-28  330  		set_extend_sge(qp, wr->sg_l=
ist + i, sge_ind,
0fd0175e30e487 Lang Cheng    2020-11-28  331  			       valid_num_sge - HNS=
_ROCE_SGE_IN_WQE);
7bdee4158b3778 oulijun       2018-01-10  332  	}
7bdee4158b3778 oulijun       2018-01-10  333  =

82600b2d3cd574 Wenpeng Liang 2022-05-12  334  	hr_reg_write(rc_sq_wqe, RC_S=
END_WQE_SGE_NUM, valid_num_sge);
7bdee4158b3778 oulijun       2018-01-10  335  =

7bdee4158b3778 oulijun       2018-01-10  336  	return 0;
7bdee4158b3778 oulijun       2018-01-10  337  }
7bdee4158b3778 oulijun       2018-01-10  338  =


:::::: The code at line 309 was first introduced by commit
:::::: 82600b2d3cd57428bdb03c66ae67708d3c8f7281 RDMA/hns: Use hr_reg_xxx() =
instead of remaining roce_set_xxx()

:::::: TO: Wenpeng Liang <liangwenpeng@huawei.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8897811123927368351==--

