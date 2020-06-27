Content-Type: multipart/mixed; boundary="===============5871880299711284649=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] RDMA/cma: Execute rdma_cm destruction from a handler properly
Date: Sun, 28 Jun 2020 02:04:19 +0800
Message-ID: <202006280139.jjcg3SuL%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5871880299711284649==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200627004519.GB25301@ziepe.ca>
References: <20200627004519.GB25301@ziepe.ca>
TO: Jason Gunthorpe <jgg@ziepe.ca>
TO: Hillf Danton <hdanton@sina.com>
CC: syzbot <syzbot+a929647172775e335941@syzkaller.appspotmail.com>
CC: chuck.lever(a)oracle.com
CC: dledford(a)redhat.com
CC: leon(a)kernel.org
CC: linux-kernel(a)vger.kernel.org
CC: linux-rdma(a)vger.kernel.org
CC: parav(a)mellanox.com
CC: Markus Elfring <Markus.Elfring@web.de>
CC: syzkaller-bugs(a)googlegroups.com

Hi Jason,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.8-rc2 next-20200626]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use  as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Jason-Gunthorpe/RDMA-cma-E=
xecute-rdma_cm-destruction-from-a-handler-properly/20200627-084914
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
1590a2e1c681b0991bd42c992cabfd380e0338f2
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   drivers/infiniband/core/cma.c:2388:6: warning: Variable 'ret' is reassig=
ned a value before the old one has been used. [redundantAssignment]
    ret =3D rdma_translate_ip(laddr, &conn_id->id.route.addr.dev_addr);
        ^
   drivers/infiniband/core/cma.c:2358:0: note: Variable 'ret' is reassigned=
 a value before the old one has been used.
    int ret =3D -ECONNABORTED;
   ^
   drivers/infiniband/core/cma.c:2388:6: note: Variable 'ret' is reassigned=
 a value before the old one has been used.
    ret =3D rdma_translate_ip(laddr, &conn_id->id.route.addr.dev_addr);
        ^
   drivers/infiniband/core/cma.c:220:29: warning: struct member 'class_port=
_info_context::class_port_info' is never used. [unusedStructMember]
    struct ib_class_port_info *class_port_info;
                               ^
   drivers/infiniband/core/cma.c:223:23: warning: struct member 'class_port=
_info_context::sa_query' is never used. [unusedStructMember]
    struct ib_sa_query  *sa_query;
                         ^
>> drivers/infiniband/core/cma.c:4813:6: warning: Unused variable: ret [unu=
sedVariable]
    int ret;
        ^

# https://github.com/0day-ci/linux/commit/4f31059eb305530933a4de9428cedd02d=
32d94f1
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 4f31059eb305530933a4de9428cedd02d32d94f1
vim +4813 drivers/infiniband/core/cma.c

e51060f08a61965 Sean Hefty      2006-06-17  4809  =

e51060f08a61965 Sean Hefty      2006-06-17  4810  static void cma_process_r=
emove(struct cma_device *cma_dev)
e51060f08a61965 Sean Hefty      2006-06-17  4811  {
e51060f08a61965 Sean Hefty      2006-06-17  4812  	struct rdma_id_private *=
id_priv;
e51060f08a61965 Sean Hefty      2006-06-17 @4813  	int ret;
e51060f08a61965 Sean Hefty      2006-06-17  4814  =

e51060f08a61965 Sean Hefty      2006-06-17  4815  	mutex_lock(&lock);
e51060f08a61965 Sean Hefty      2006-06-17  4816  	while (!list_empty(&cma_=
dev->id_list)) {
e51060f08a61965 Sean Hefty      2006-06-17  4817  		id_priv =3D list_entry(=
cma_dev->id_list.next,
e51060f08a61965 Sean Hefty      2006-06-17  4818  				     struct rdma_id_p=
rivate, list);
e51060f08a61965 Sean Hefty      2006-06-17  4819  =

d02d1f5359e795b Sean Hefty      2007-10-09  4820  		list_del(&id_priv->list=
en_list);
94de178ac636e9d Krishna Kumar   2006-09-29  4821  		list_del_init(&id_priv-=
>list);
e368d23f57f6a08 Parav Pandit    2020-01-26  4822  		cma_id_get(id_priv);
e51060f08a61965 Sean Hefty      2006-06-17  4823  		mutex_unlock(&lock);
e51060f08a61965 Sean Hefty      2006-06-17  4824  =

4f31059eb305530 Jason Gunthorpe 2020-06-26  4825  		cma_send_device_removal=
_put(id_priv);
e51060f08a61965 Sean Hefty      2006-06-17  4826  =

e51060f08a61965 Sean Hefty      2006-06-17  4827  		mutex_lock(&lock);
e51060f08a61965 Sean Hefty      2006-06-17  4828  	}
e51060f08a61965 Sean Hefty      2006-06-17  4829  	mutex_unlock(&lock);
e51060f08a61965 Sean Hefty      2006-06-17  4830  =

5ff8c8fa44c2cb7 Parav Pandit    2020-01-26  4831  	cma_dev_put(cma_dev);
e51060f08a61965 Sean Hefty      2006-06-17  4832  	wait_for_completion(&cma=
_dev->comp);
e51060f08a61965 Sean Hefty      2006-06-17  4833  }
e51060f08a61965 Sean Hefty      2006-06-17  4834  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5871880299711284649==--

