Content-Type: multipart/mixed; boundary="===============7281330627198849856=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 947/1853] drivers/infiniband/hw/erdma/erdma_cm.c:380:12-13: WARNING opportunity for min()
Date: Wed, 08 Jun 2022 13:51:30 +0800
Message-ID: <202206081324.mRLy55qR-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7281330627198849856==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Cheng Xu <chengyou@linux.alibaba.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   73d0e32571a0786151eb72634f1a4c5891166176
commit: 5a865a32bf9b449da35956df247b69b78dc55ed1 [947/1853] RDMA/erdma: Add=
 driver to kernel build environment
:::::: branch date: 25 hours ago
:::::: commit date: 2 days ago
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/202206=
08/202206081324.mRLy55qR-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-1) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/infiniband/hw/erdma/erdma_cm.c:380:12-13: WARNING opportunity fo=
r min()
   drivers/infiniband/hw/erdma/erdma_cm.c:1007:12-13: WARNING opportunity f=
or min()

vim +380 drivers/infiniband/hw/erdma/erdma_cm.c

81c527f04b90f47 Cheng Xu 2022-05-23  345  =

81c527f04b90f47 Cheng Xu 2022-05-23  346  static int erdma_send_mpareqrep(s=
truct erdma_cep *cep, const void *pdata,
81c527f04b90f47 Cheng Xu 2022-05-23  347  				u8 pd_len)
81c527f04b90f47 Cheng Xu 2022-05-23  348  {
81c527f04b90f47 Cheng Xu 2022-05-23  349  	struct socket *s =3D cep->sock;
81c527f04b90f47 Cheng Xu 2022-05-23  350  	struct mpa_rr *rr =3D &cep->mpa.=
hdr;
81c527f04b90f47 Cheng Xu 2022-05-23  351  	struct kvec iov[3];
81c527f04b90f47 Cheng Xu 2022-05-23  352  	struct msghdr msg;
81c527f04b90f47 Cheng Xu 2022-05-23  353  	int iovec_num =3D 0;
81c527f04b90f47 Cheng Xu 2022-05-23  354  	int ret;
81c527f04b90f47 Cheng Xu 2022-05-23  355  	int mpa_len;
81c527f04b90f47 Cheng Xu 2022-05-23  356  =

81c527f04b90f47 Cheng Xu 2022-05-23  357  	memset(&msg, 0, sizeof(msg));
81c527f04b90f47 Cheng Xu 2022-05-23  358  =

81c527f04b90f47 Cheng Xu 2022-05-23  359  	rr->params.pd_len =3D cpu_to_be1=
6(pd_len);
81c527f04b90f47 Cheng Xu 2022-05-23  360  =

81c527f04b90f47 Cheng Xu 2022-05-23  361  	iov[iovec_num].iov_base =3D rr;
81c527f04b90f47 Cheng Xu 2022-05-23  362  	iov[iovec_num].iov_len =3D sizeo=
f(*rr);
81c527f04b90f47 Cheng Xu 2022-05-23  363  	iovec_num++;
81c527f04b90f47 Cheng Xu 2022-05-23  364  	mpa_len =3D sizeof(*rr);
81c527f04b90f47 Cheng Xu 2022-05-23  365  =

81c527f04b90f47 Cheng Xu 2022-05-23  366  	iov[iovec_num].iov_base =3D &cep=
->mpa.ext_data;
81c527f04b90f47 Cheng Xu 2022-05-23  367  	iov[iovec_num].iov_len =3D sizeo=
f(cep->mpa.ext_data);
81c527f04b90f47 Cheng Xu 2022-05-23  368  	iovec_num++;
81c527f04b90f47 Cheng Xu 2022-05-23  369  	mpa_len +=3D sizeof(cep->mpa.ext=
_data);
81c527f04b90f47 Cheng Xu 2022-05-23  370  =

81c527f04b90f47 Cheng Xu 2022-05-23  371  	if (pd_len) {
81c527f04b90f47 Cheng Xu 2022-05-23  372  		iov[iovec_num].iov_base =3D (ch=
ar *)pdata;
81c527f04b90f47 Cheng Xu 2022-05-23  373  		iov[iovec_num].iov_len =3D pd_l=
en;
81c527f04b90f47 Cheng Xu 2022-05-23  374  		mpa_len +=3D pd_len;
81c527f04b90f47 Cheng Xu 2022-05-23  375  		iovec_num++;
81c527f04b90f47 Cheng Xu 2022-05-23  376  	}
81c527f04b90f47 Cheng Xu 2022-05-23  377  =

81c527f04b90f47 Cheng Xu 2022-05-23  378  	ret =3D kernel_sendmsg(s, &msg, =
iov, iovec_num, mpa_len);
81c527f04b90f47 Cheng Xu 2022-05-23  379  =

81c527f04b90f47 Cheng Xu 2022-05-23 @380  	return ret < 0 ? ret : 0;
81c527f04b90f47 Cheng Xu 2022-05-23  381  }
81c527f04b90f47 Cheng Xu 2022-05-23  382  =


:::::: The code@line 380 was first introduced by commit
:::::: 81c527f04b90f471b42c1ba28a489ce996dad9b2 RDMA/erdma: Add connection =
management (CM) support

:::::: TO: Cheng Xu <chengyou@linux.alibaba.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7281330627198849856==--

