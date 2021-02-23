Content-Type: multipart/mixed; boundary="===============1561099394079331506=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/ulp/rtrs/rtrs.c:518:42: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Tue, 23 Feb 2021 08:42:38 +0800
Message-ID: <202102230835.1OolN8O8-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1561099394079331506==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jack Wang <jinpu.wang@cloud.ionos.com>
CC: Jason Gunthorpe <jgg@mellanox.com>
CC: Danil Kipnis <danil.kipnis@cloud.ionos.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   899cbb0e53c6b66c3fb98d8745aa4b0b41cd94f2
commit: c013fbc1fd341d28269cf0a6b465925186b9a1e1 RDMA/rtrs: include client =
and server modules into kernel compilation
date:   9 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 9 months ago
compiler: h8300-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/infiniband/ulp/rtrs/rtrs.c:518:42: warning: Boolean result is us=
ed in bitwise operation. Clarify expression with parentheses. [clarifyCondi=
tion]
    WARN_ON(pool->ops && (!pool->ops->alloc ^ !pool->ops->free));
                                            ^

vim +518 drivers/infiniband/ulp/rtrs/rtrs.c

c0894b3ea69d35 Jack Wang 2020-05-11  514  =

c0894b3ea69d35 Jack Wang 2020-05-11  515  void rtrs_rdma_dev_pd_init(enum i=
b_pd_flags pd_flags,
c0894b3ea69d35 Jack Wang 2020-05-11  516  			    struct rtrs_rdma_dev_pd *p=
ool)
c0894b3ea69d35 Jack Wang 2020-05-11  517  {
c0894b3ea69d35 Jack Wang 2020-05-11 @518  	WARN_ON(pool->ops && (!pool->ops=
->alloc ^ !pool->ops->free));
c0894b3ea69d35 Jack Wang 2020-05-11  519  	INIT_LIST_HEAD(&pool->list);
c0894b3ea69d35 Jack Wang 2020-05-11  520  	mutex_init(&pool->mutex);
c0894b3ea69d35 Jack Wang 2020-05-11  521  	pool->pd_flags =3D pd_flags;
c0894b3ea69d35 Jack Wang 2020-05-11  522  }
c0894b3ea69d35 Jack Wang 2020-05-11  523  EXPORT_SYMBOL(rtrs_rdma_dev_pd_in=
it);
c0894b3ea69d35 Jack Wang 2020-05-11  524  =


:::::: The code at line 518 was first introduced by commit
:::::: c0894b3ea69d35995bd220020b20570c45a1e6b4 RDMA/rtrs: core: lib functi=
ons shared between client and server modules

:::::: TO: Jack Wang <jinpu.wang@cloud.ionos.com>
:::::: CC: Jason Gunthorpe <jgg@mellanox.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1561099394079331506==--

