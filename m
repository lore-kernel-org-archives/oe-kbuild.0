Content-Type: multipart/mixed; boundary="===============4848137978855593978=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/infiniband/core/cm.c:297:2: warning: There is an unknown macro here somewhere. Configuration is required. If rdma_for_each_port is a macro then please configure it. [unknownMacro]
Date: Mon, 04 Apr 2022 15:06:42 +0800
Message-ID: <202204041559.bPAvLAhG-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4848137978855593978==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mark Zhang <markzhang@nvidia.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>
CC: Leon Romanovsky <leonro@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   3123109284176b1532874591f7c81f3837bbdc17
commit: 76039ac9095f5ee5ec7fb95ccb6a5460d5f8c3a2 IB/cm: Protect cm_dev, cm_=
ports and mad_agent with kref and lock
date:   10 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 10 months ago
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/infiniband/core/cma_configfs.c:146:15: warning: syntax error [sy=
ntaxError]
   CONFIGFS_ATTR(, default_roce_mode);
                 ^
--
   In file included from drivers/infiniband/core/sa_query.c:
>> drivers/infiniband/core/sa_query.c:902:16: warning: Uninitialized variab=
les: wait_query.callback, wait_query.release, wait_query.client, wait_query=
.port, wait_query.mad_buf, wait_query.sm_ah, wait_query.id, wait_query.flag=
s, wait_query.list, wait_query.seq, wait_query.timeout, wait_query.path_use=
 [uninitvar]
     if (query =3D=3D wait_query) {
                  ^
>> drivers/infiniband/core/sa_query.c:1107:32: warning: Uninitialized varia=
ble: query->seq [uninitvar]
     if (nlh->nlmsg_seq =3D=3D query->seq) {
                                  ^
   drivers/infiniband/core/sa_query.c:1097:41: note: Assuming condition is =
false
    if ((nlh->nlmsg_flags & NLM_F_REQUEST) ||
                                           ^
   drivers/infiniband/core/sa_query.c:1107:32: note: Uninitialized variable=
: query->seq
     if (nlh->nlmsg_seq =3D=3D query->seq) {
                                  ^
--
>> drivers/infiniband/core/device.c:1016:2: warning: There is an unknown ma=
cro here somewhere. Configuration is required. If xa_for_each is a macro th=
en please configure it. [unknownMacro]
    xa_for_each (&device->compat_devs, index, cdev)
    ^
--
>> drivers/infiniband/core/cm.c:297:2: warning: There is an unknown macro h=
ere somewhere. Configuration is required. If rdma_for_each_port is a macro =
then please configure it. [unknownMacro]
    rdma_for_each_port(cm_dev->ib_device, i)
    ^

vim +297 drivers/infiniband/core/cm.c

a977049dacdef6a Hal Rosenstock 2005-07-27  291  =

76039ac9095f5ee Mark Zhang     2021-06-02  292  static void cm_dev_release(=
struct kref *kref)
76039ac9095f5ee Mark Zhang     2021-06-02  293  {
76039ac9095f5ee Mark Zhang     2021-06-02  294  	struct cm_device *cm_dev =
=3D container_of(kref, struct cm_device, kref);
76039ac9095f5ee Mark Zhang     2021-06-02  295  	u32 i;
76039ac9095f5ee Mark Zhang     2021-06-02  296  =

76039ac9095f5ee Mark Zhang     2021-06-02 @297  	rdma_for_each_port(cm_dev-=
>ib_device, i)
76039ac9095f5ee Mark Zhang     2021-06-02  298  		kfree(cm_dev->port[i - 1]=
);
76039ac9095f5ee Mark Zhang     2021-06-02  299  =

76039ac9095f5ee Mark Zhang     2021-06-02  300  	kfree(cm_dev);
76039ac9095f5ee Mark Zhang     2021-06-02  301  }
76039ac9095f5ee Mark Zhang     2021-06-02  302  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4848137978855593978==--

