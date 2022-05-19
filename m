Content-Type: multipart/mixed; boundary="===============3122564787410843443=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 10593/12886] drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubious: x & !y
Date: Fri, 20 May 2022 00:42:44 +0800
Message-ID: <202205200035.zRBoW9kd-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3122564787410843443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Wenpeng Liang <liangwenpeng@huawei.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   21498d01d045c5b95b93e0a0625ae965b4330ebe
commit: 82600b2d3cd57428bdb03c66ae67708d3c8f7281 [10593/12886] RDMA/hns: Us=
e hr_reg_xxx() instead of remaining roce_set_xxx()
:::::: branch date: 7 hours ago
:::::: commit date: 7 days ago
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/2022052=
0/202205200035.zRBoW9kd-lkp(a)intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D82600b2d3cd57428bdb03c66ae67708d3c8f7281
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 82600b2d3cd57428bdb03c66ae67708d3c8f7281
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
parc SHELL=3D/bin/bash drivers/infiniband/hw/hns/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubiou=
s: x & !y
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubiou=
s: x & !y
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubiou=
s: x & !y
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubiou=
s: x & !y
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubiou=
s: x & !y
>> drivers/infiniband/hw/hns/hns_roce_hw_v2.c:309:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:460:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:460:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:460:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:460:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:460:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:460:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:462:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:462:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:462:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:462:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:462:9: sparse: sparse: dubiou=
s: x & !y
   drivers/infiniband/hw/hns/hns_roce_hw_v2.c:462:9: sparse: sparse: dubiou=
s: x & !y

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


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3122564787410843443==--

